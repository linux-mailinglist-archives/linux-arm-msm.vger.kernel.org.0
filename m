Return-Path: <linux-arm-msm+bounces-3528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28091806DAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8CE6281C0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 11:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8131B3174D;
	Wed,  6 Dec 2023 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8Xs7Mf+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565DD31728;
	Wed,  6 Dec 2023 11:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A45C433C9;
	Wed,  6 Dec 2023 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701861462;
	bh=T2z/FCGOZTuZvMKsnWedFJwmDPaovLjYsoXHwnzGLm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E8Xs7Mf+yvYVbVgFDPG70M+BYfmM74f+VGjl4MWCtc9wpqmklDMyBPQLNQoo/jqGZ
	 wprvZuPGoIlM/8o+g0+KK0EfcN8KljesIR4dFSekWdx+TV3aOlXusdZnSfrQ7dK7aL
	 Jh5u3wAhwxHG4MDRhf++92RJWKxWxyLFIRf4DcUbC9f2LXn4x30UnqxUbzn6aK5V7r
	 2rVbuR2T6AulcvObV+gJVlSw+dmqvJ42djabqP6kuu8/xH59dlcdSykF7rM8WQ5d4L
	 U2vrvWJBR+/+9wB9e5JI4ArtfubCotW7mXnykiWosnimjFnBszO7kNdn1wE662nJyT
	 UQKYLLbdLcZgw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rApvA-0001wI-1w;
	Wed, 06 Dec 2023 12:18:28 +0100
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
Subject: [PATCH v3 3/4] dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: clean up example
Date: Wed,  6 Dec 2023 12:17:53 +0100
Message-ID: <20231206111754.7410-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231206111754.7410-1-johan+linaro@kernel.org>
References: <20231206111754.7410-1-johan+linaro@kernel.org>
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


