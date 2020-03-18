{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_bitcoin (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/captain/haskell_code/FSD/BOTUDY/bitcoin/.stack-work/install/x86_64-linux/db3173ca1a77968a503d41bfeb3a8e5a5db022ca858bd3d7219c60fe136bdbf9/8.8.3/bin"
libdir     = "/home/captain/haskell_code/FSD/BOTUDY/bitcoin/.stack-work/install/x86_64-linux/db3173ca1a77968a503d41bfeb3a8e5a5db022ca858bd3d7219c60fe136bdbf9/8.8.3/lib/x86_64-linux-ghc-8.8.3/bitcoin-0.1.0.0-DrqrFfMLSnMG0UjNi5krQP-bitcoin"
dynlibdir  = "/home/captain/haskell_code/FSD/BOTUDY/bitcoin/.stack-work/install/x86_64-linux/db3173ca1a77968a503d41bfeb3a8e5a5db022ca858bd3d7219c60fe136bdbf9/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/home/captain/haskell_code/FSD/BOTUDY/bitcoin/.stack-work/install/x86_64-linux/db3173ca1a77968a503d41bfeb3a8e5a5db022ca858bd3d7219c60fe136bdbf9/8.8.3/share/x86_64-linux-ghc-8.8.3/bitcoin-0.1.0.0"
libexecdir = "/home/captain/haskell_code/FSD/BOTUDY/bitcoin/.stack-work/install/x86_64-linux/db3173ca1a77968a503d41bfeb3a8e5a5db022ca858bd3d7219c60fe136bdbf9/8.8.3/libexec/x86_64-linux-ghc-8.8.3/bitcoin-0.1.0.0"
sysconfdir = "/home/captain/haskell_code/FSD/BOTUDY/bitcoin/.stack-work/install/x86_64-linux/db3173ca1a77968a503d41bfeb3a8e5a5db022ca858bd3d7219c60fe136bdbf9/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "bitcoin_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "bitcoin_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "bitcoin_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "bitcoin_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bitcoin_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bitcoin_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
