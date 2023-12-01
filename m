Return-Path: <linux-arm-msm+bounces-2928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CE3801081
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F270281C55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8F44CE17;
	Fri,  1 Dec 2023 16:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnnZRrX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462B64BA92;
	Fri,  1 Dec 2023 16:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C23C433CA;
	Fri,  1 Dec 2023 16:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701449206;
	bh=T2z/FCGOZTuZvMKsnWedFJwmDPaovLjYsoXHwnzGLm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JnnZRrX5/LjFKTZgBsQkxRVjT67NroSOqRvFpXS8Jk3fGMkAexLBFKU9Y4I3kecEA
	 0AbISwqHhcmWSJzYz45n0WsjQ08pF/veCJprXUB1n2nL4W2jQXPH2o4qHl5w0iLPs6
	 yK8oBvAsrrQ9rbABA8VYip2inF5tIEPFDtC028jntSUvZZNuypeuIwbUqnTIR73+32
	 T+4ZkBO+Z+2/wYFRPlGfhWfGykEnC8Cd0XPMzOb9lhLdrgvBF+DbbvAxwC8NanIdtg
	 3CwJHo2GZcXySPQIpEgDhS/WUU9m071VOF4fRnItMYXrXW6iHJpRux3Q5BwQG+p6KF
	 /ONfHqDVCZf8Q==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r96fj-0003IW-0a;
	Fri, 01 Dec 2023 17:47:23 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/4] dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: clean up example
Date: Fri,  1 Dec 2023 17:45:45 +0100
Message-ID: <20231201164546.12606-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231201164546.12606-1-johan+linaro@kernel.org>
References: <20231201164546.12606-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPMI PMIC sits on an SPMI bus which and has two address cells with
no size.

Clean up the example by adding a parent SPMI bus node with proper
'#address-cells' and '#size-cells' properties, using a define for the
second register value, dropping the unnecessary label and increasing the
indentation to four spaces.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 134 +++++++++---------
 1 file changed, 70 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
index 45cd6a613a91..6a824351834e 100644
--- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -59,69 +59,75 @@ additionalProperties: false
 
 examples:
   - |
-
-    pmic: pmic@0 {
-      compatible = "hisilicon,hi6421v600-spmi";
-      reg = <0 0>;
-
-      #interrupt-cells = <2>;
-      interrupt-controller;
-      interrupt-parent = <&gpio28>;
-      interrupts = <0 0>;
-
-      regulators {
-        ldo3: ldo3 {
-          regulator-name = "ldo3";
-          regulator-min-microvolt = <1500000>;
-          regulator-max-microvolt = <2000000>;
-          regulator-boot-on;
-        };
-
-        ldo4: ldo4 {
-          regulator-name = "ldo4";
-          regulator-min-microvolt = <1725000>;
-          regulator-max-microvolt = <1900000>;
-          regulator-boot-on;
-        };
-
-        ldo9: ldo9 {
-          regulator-name = "ldo9";
-          regulator-min-microvolt = <1750000>;
-          regulator-max-microvolt = <3300000>;
-          regulator-boot-on;
-        };
-
-        ldo15: ldo15 {
-          regulator-name = "ldo15";
-          regulator-min-microvolt = <1800000>;
-          regulator-max-microvolt = <3000000>;
-          regulator-always-on;
-        };
-
-        ldo16: ldo16 {
-          regulator-name = "ldo16";
-          regulator-min-microvolt = <1800000>;
-          regulator-max-microvolt = <3000000>;
-          regulator-boot-on;
-        };
-
-        ldo17: ldo17 {
-          regulator-name = "ldo17";
-          regulator-min-microvolt = <2500000>;
-          regulator-max-microvolt = <3300000>;
-        };
-
-        ldo33: ldo33 {
-          regulator-name = "ldo33";
-          regulator-min-microvolt = <2500000>;
-          regulator-max-microvolt = <3300000>;
-          regulator-boot-on;
-        };
-
-        ldo34: ldo34 {
-          regulator-name = "ldo34";
-          regulator-min-microvolt = <2600000>;
-          regulator-max-microvolt = <3300000>;
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmic@0 {
+            compatible = "hisilicon,hi6421v600-spmi";
+            reg = <0 SPMI_USID>;
+
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            interrupt-parent = <&gpio28>;
+            interrupts = <0 0>;
+
+            regulators {
+                ldo3 {
+                    regulator-name = "ldo3";
+                    regulator-min-microvolt = <1500000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-boot-on;
+                };
+
+                ldo4 {
+                    regulator-name = "ldo4";
+                    regulator-min-microvolt = <1725000>;
+                    regulator-max-microvolt = <1900000>;
+                    regulator-boot-on;
+                };
+
+                ldo9 {
+                    regulator-name = "ldo9";
+                    regulator-min-microvolt = <1750000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                ldo15 {
+                    regulator-name = "ldo15";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <3000000>;
+                    regulator-always-on;
+                };
+
+                ldo16 {
+                    regulator-name = "ldo16";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <3000000>;
+                    regulator-boot-on;
+                };
+
+                ldo17 {
+                    regulator-name = "ldo17";
+                    regulator-min-microvolt = <2500000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+
+                ldo33 {
+                    regulator-name = "ldo33";
+                    regulator-min-microvolt = <2500000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                ldo34 {
+                    regulator-name = "ldo34";
+                    regulator-min-microvolt = <2600000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+            };
         };
-      };
     };
-- 
2.41.0


