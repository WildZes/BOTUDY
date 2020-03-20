module Lib
    ( someFunc
    ) where

import           Network.HTTP.Simple      ( httpBS, getResponseBody )
import qualified Data.ByteString.Char8 as BS

url = "https://api.telegram.org/bot1117844810:AAFsVj2cgOHXxGeMCzin0ERJ_5HmshZSyiw/"

fetchJSON :: IO BS.ByteString
fetchJSON = do
  res <- httpBS $ url ++ "getUpdates"
  return (getRsponseBody res)

someFunc :: IO ()
someFunc = do
  json <- fetchJSON
  BS.putStrLn json
