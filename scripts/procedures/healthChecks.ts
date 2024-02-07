import { types as T, healthUtil } from "../deps.ts";

export const health: T.ExpectedExports.health = {
  "web-ui": healthUtil.checkWebUrl("http://coracle.embassy:8080/index.html"),
};
