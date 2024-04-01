Return-Path: <linux-arm-msm+bounces-15993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F48947FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 01:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8324EB21B2C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 23:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B737C57864;
	Mon,  1 Apr 2024 23:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v+7Xlk7x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB9457306
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 23:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712015478; cv=none; b=SmfSPF7+S/U1L3BK8B2SE0wCY1cOTuQlnBEzPZX2NRUzeCqucYAmx8oszjxpKO+dACGXwl1UtY0GElJndA0qe1OrqNNihulV8NF5Z3N9ClrOlIvwv9hV6KvyE8zBz594xVJlkj967FzdphkdmTNKN73ch1sMnMA3Br3yGZcyFm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712015478; c=relaxed/simple;
	bh=HU+wa7woAnHSS2dl5LU/WB4CeOKcUqRCEklmEfoGWUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IvZY+Jxap23GmHMgapO0jwUnYmTHsXA0Y1r3vKq/ORif/eSiC2cxoPQDNF+FnWTRhZ43ueBREPnrwOfmCWABaFJJj/G+qCALDWatOQrMtecO+xNJ9F3EYUGQmfsKFAbFsk6iYX86AiCX4Tfi3Mxt7nn/fpHour81z4PtSvHLQnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v+7Xlk7x; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-515c198e835so5117046e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 16:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712015475; x=1712620275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+eEH0u79NHtVDKA13PPuTSc6hJlgwppuYqct0Olpnw0=;
        b=v+7Xlk7xfAroqqNxx0B9PQ4Z48s6inwZY7tFagpTZZlBAoF5S+n+Es6XsB+4fEfaj2
         AyCV0gMK+CwOjrv1XAmfJmQQWZKR5Ek4ZokLFsBcZN+L99Vy5J+J8rdn04ZVNYu9BcPh
         iiyL518ObVB5Fi4SkRPcL3CSg96gG6hS+aMHrVAjH/k9bJlzOx7Zas5GPxA6y3/uiEmI
         g1f/q0Gq8pqWh7Jlgdl2IzQRnsk2bdccQFIMakmy8N2GvtvroSsPYlicgVYEb/HxdSAl
         +siF5Q3LP3d8Iuw8fFfR5gt5V7Z9qoZNfwfdSnbIIS0JBOBWhKLWW3cU+jmCTx4Ip+yF
         nmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712015475; x=1712620275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eEH0u79NHtVDKA13PPuTSc6hJlgwppuYqct0Olpnw0=;
        b=CHtQpsQsrJl9JsG2kduuatM4auXTCsg3/0nYleF/IoIzUjMYi90xWz46BHiY7ySYAj
         F+a5eN+AC+Vd5pPH2ZMCnHpH2kT+D6OdDwWtONVmA3wUH1fTlbwx0hzj2WwwyjzNun+d
         9XeZYZhYwOMqBSjmEer0m+2YPDsfJPJePQUuNANN8w0w7eGEXKXtjDnbsasoNUjI0b5m
         lr0qEixTvOekkPs1Z1PQ9Bnh/SdGHmM/6BBkQGJhFAMnHlEza/1OPGIlCldzACzKSZkX
         oIlYkpSEU9/7KJXPaE/DZCQyOqKx3aKJKdXdBngvRKxML3dBXojEEna54fic6bcq2euN
         lkXg==
X-Forwarded-Encrypted: i=1; AJvYcCWesg5u1r5iD6vuJ9QgWKKLiML23jgoXhLBeBckl3gthYMNJ5/dKptxV6BR68z8QT3c0fvSBRRBHu8WnpS9vrTPnUkVPX0acubzUvDSsg==
X-Gm-Message-State: AOJu0Yw19ESXdKEq5XHYdYccW0VSKSbwuUx5EB1o+dFvwa2N6/rnDr1X
	w2l2mXeII5YooZFKZoxmHOw+28KgEOibq8dFBgF1pKcyC83hntQSXFGe2MOvRZQ=
X-Google-Smtp-Source: AGHT+IGTCwDowGTdalqVrCQ0Eu46a7Gmg5+5Tr1UPwFjEX8KSGSLgiPW2uINmMR67uy9bjuZ6puTAA==
X-Received: by 2002:a05:6512:3688:b0:515:d4c7:d23 with SMTP id d8-20020a056512368800b00515d4c70d23mr5121851lfs.67.1712015474994;
        Mon, 01 Apr 2024 16:51:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g28-20020a0565123b9c00b00515d127a399sm1176135lfv.58.2024.04.01.16.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 16:51:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 02:51:12 +0300
Subject: [PATCH v3 1/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-lg-sw43408-panel-v3-1-144f17a11a56@linaro.org>
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
In-Reply-To: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=12rUl+2HnN8d7afCUpo5jilPDeMfLdH1F3n7T397uIk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC0hwBbAPFoe4VO+0i+xUCjCnUrwhXAUz8gChl
 BvoLM78kO6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgtIcAAKCRCLPIo+Aiko
 1SReCACowHvqNUvZGrCCOaGMgmIDhg8ZmYUdtAAvvyl2y4/6Oo664vzHuoX8LODxS80H/VENCRC
 uJiG08iJrDMUDE5HgSuGA+fqiKmfNF5Qe4zcUPTvr/Rs1mWiNsWy8NEOcoh5GRPTM7mZ/H5Tw5C
 kLO/KI7SZRV6H2dBX4NFa27DPEuPdFswYpTxjUWxIhNyUG2Fvue9WXDgluiS1cvHw8ZAkC9LKNQ
 Z7Bv7MJ/AQnRfvNF9G8nHN4jEE7MX7fUE7mAFflg1OBvDWtJh3++Ph8aHgtPSLvj+gwD3q9E1uN
 anNOwBmd6YkWQQe3zt2s2trXJGsp95RfTO3b8VFJs8zPYIu3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Sumit Semwal <sumit.semwal@linaro.org>

LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel present on Google Pixel 3
phones.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
[caleb: convert to yaml]
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/panel/lg,sw43408.yaml         | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
new file mode 100644
index 000000000000..1e08648f5bc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW43408 1080x2160 DSI panel
+
+maintainers:
+  - Caleb Connolly <caleb.connolly@linaro.org>
+
+description:
+  This panel is used on the Pixel 3, it is a 60hz OLED panel which
+  required DSC (Display Stream Compression) and has rounded corners.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: lg,sw43408
+
+  reg: true
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "lg,sw43408";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l14a_1p88>;
+            vpnl-supply = <&vreg_l28a_3p0>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.39.2


