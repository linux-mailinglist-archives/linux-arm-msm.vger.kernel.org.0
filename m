Return-Path: <linux-arm-msm+bounces-3787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E669E809778
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB610281CEB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 00:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1320B17F6;
	Fri,  8 Dec 2023 00:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="beMCmWRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D31741710
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 16:44:20 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c9f9db9567so16972721fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 16:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701996259; x=1702601059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QilGo2cKamjRbsFJs2rg0xLXZ8zR1vTxwGMlWkCLlFo=;
        b=beMCmWRyIp4ip+i3Kgt4V1/0XzGh1KZUftLk/Dp0uFrS5Q5TalWA7+IgpHEU9q6Ylz
         TdTskZ07Ae/5oUEsshTwZeG5IVe8UEX0JXiVr5+qCbF/TyHZqPjpfpu9VecxR8SD6S46
         PDHblTg9D/xu/swnzZxbszcJee1B++Syhveir1tfQ8fe3ksoyPOm+bF/Owqzlbt6Nx4B
         W2kYvV9lMfIThK+G7WhndfV410Vbdppg4D5umDSGms7db26MPXf97dnMDs7W1Cq+LZB1
         hga+wv6xMBIVV58dppmcfSDFKYV7CwIrel8B7OIG65Mm7NjnWOFT3O/7y4uWIxsYXxiH
         mcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701996259; x=1702601059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QilGo2cKamjRbsFJs2rg0xLXZ8zR1vTxwGMlWkCLlFo=;
        b=EAp8PecL0pvh8EMGT7OBNVP7bQiYo1bVQ7Y5YVSWE/Pa4R4Uf50uvEptQJjEqYZ587
         Hy51gNSjNXlJqsVIOiNH0ulHLNXrBqI+cfCT6Wz1dg+bo96hJTBogwvPDuHo1zZCoT5B
         6aLj/NWqld9HMfAZFKzq9yoNByWBK/zivkIxhYcWjqG8YcOes4zA42EGvvezPmMyo23W
         986g5f+gO7KiqFqF1n0nfmNA9SYxwPXr2OJDbv5bvdmTLqQaU3wh2SluaamwbolGxx/3
         G7N2mVKZLFwQ7/98nTUpuIkOZAuSvrkMe5RgB2N6lI3/MeAJx+aF+Nj3oyX8s+l1V20t
         xatA==
X-Gm-Message-State: AOJu0YwgM2bBwErbLEK2zQoBVuIKWXR6LzrQ3UhIvQcu5Avy8jXSGFRA
	lmPJexWQhHWDlqCRymcPicH803/9Gxc3jGSBReU=
X-Google-Smtp-Source: AGHT+IHGFM8aYwvSIyUYlKFiY7aIJ9Lc6/7HAd3Bf09+DJjIRY9YRRbIwND2zd2aPx8yIS4p/MsOIw==
X-Received: by 2002:a2e:9f48:0:b0:2ca:1923:13a0 with SMTP id v8-20020a2e9f48000000b002ca192313a0mr1951201ljk.14.1701996258987;
        Thu, 07 Dec 2023 16:44:18 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a2eb041000000b002c9f2c7cdecsm82645ljl.22.2023.12.07.16.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 16:44:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 01/11] dt-bindings: soc: qcom: merge qcom,saw2.txt into qcom,spm.yaml
Date: Fri,  8 Dec 2023 03:44:07 +0300
Message-Id: <20231208004417.3393299-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
References: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm SPM / SAW2 device is described in two bindigns files:
arm/msm/qcom,saw2.txt and soc/qcom/qcom,spm.yaml. Merge the former into
the latter, adding detailed device node description. While we are at it,
also rename qcom,spm.yaml to qcom,saw2.yaml to follow the actual
compatible used for these devices.

The regulator property is retained as is. It will be changed in the
later patches.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/arm/msm/qcom,saw2.txt | 58 -------------------
 .../qcom/{qcom,spm.yaml => qcom,saw2.yaml}    | 26 +++++++--
 2 files changed, 20 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
 rename Documentation/devicetree/bindings/soc/qcom/{qcom,spm.yaml => qcom,saw2.yaml} (64%)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt b/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
deleted file mode 100644
index c0e3c3a42bea..000000000000
--- a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-SPM AVS Wrapper 2 (SAW2)
-
-The SAW2 is a wrapper around the Subsystem Power Manager (SPM) and the
-Adaptive Voltage Scaling (AVS) hardware. The SPM is a programmable
-power-controller that transitions a piece of hardware (like a processor or
-subsystem) into and out of low power modes via a direct connection to
-the PMIC. It can also be wired up to interact with other processors in the
-system, notifying them when a low power state is entered or exited.
-
-Multiple revisions of the SAW hardware are supported using these Device Nodes.
-SAW2 revisions differ in the register offset and configuration data. Also, the
-same revision of the SAW in different SoCs may have different configuration
-data due the differences in hardware capabilities. Hence the SoC name, the
-version of the SAW hardware in that SoC and the distinction between cpu (big
-or Little) or cache, may be needed to uniquely identify the SAW register
-configuration and initialization data. The compatible string is used to
-indicate this parameter.
-
-PROPERTIES
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: Must have
-			"qcom,saw2"
-		    A more specific value could be one of:
-			"qcom,apq8064-saw2-v1.1-cpu"
-			"qcom,msm8226-saw2-v2.1-cpu"
-			"qcom,msm8974-saw2-v2.1-cpu"
-			"qcom,apq8084-saw2-v2.1-cpu"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: the first element specifies the base address and size of
-		    the register region. An optional second element specifies
-		    the base address and size of the alias register region.
-
-- regulator:
-	Usage: optional
-	Value type: boolean
-	Definition: Indicates that this SPM device acts as a regulator device
-			device for the core (CPU or Cache) the SPM is attached
-			to.
-
-Example 1:
-
-	power-controller@2099000 {
-		compatible = "qcom,saw2";
-		reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-		regulator;
-	};
-
-Example 2:
-	saw0: power-controller@f9089000 {
-		compatible = "qcom,apq8084-saw2-v2.1-cpu", "qcom,saw2";
-		reg = <0xf9089000 0x1000>, <0xf9009000 0x1000>;
-	};
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
similarity index 64%
rename from Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
rename to Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
index 20c8cd38ff0d..84b3f01d590c 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
@@ -1,18 +1,25 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/qcom/qcom,spm.yaml#
+$id: http://devicetree.org/schemas/soc/qcom/qcom,saw2.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Subsystem Power Manager
+title: Qualcomm Subsystem Power Manager / SPM AVS Wrapper 2 (SAW2)
 
 maintainers:
   - Andy Gross <agross@kernel.org>
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
 description: |
-  This binding describes the Qualcomm Subsystem Power Manager, used to control
-  the peripheral logic surrounding the application cores in Qualcomm platforms.
+  The Qualcomm Subsystem Power Manager is used to control the peripheral logic
+  surrounding the application cores in Qualcomm platforms.
+
+  The SAW2 is a wrapper around the Subsystem Power Manager (SPM) and the
+  Adaptive Voltage Scaling (AVS) hardware. The SPM is a programmable
+  power-controller that transitions a piece of hardware (like a processor or
+  subsystem) into and out of low power modes via a direct connection to
+  the PMIC. It can also be wired up to interact with other processors in the
+  system, notifying them when a low power state is entered or exited.
 
 properties:
   compatible:
@@ -34,8 +41,15 @@ properties:
       - const: qcom,saw2
 
   reg:
-    description: Base address and size of the SPM register region
-    maxItems: 1
+    items:
+      - description: Base address and size of the SPM register region
+      - description: Base address and size of the alias register region
+    minItems: 1
+
+  regulator:
+    type: boolean
+    description: Indicates that this SPM device acts as a regulator device
+      device for the core (CPU or Cache) the SPM is attached to.
 
 required:
   - compatible
-- 
2.39.2


