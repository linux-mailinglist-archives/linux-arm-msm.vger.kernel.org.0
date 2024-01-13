Return-Path: <linux-arm-msm+bounces-7167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE782C99B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 06:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B535428600E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 05:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6A918E0F;
	Sat, 13 Jan 2024 05:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TgjdBYMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B1EF9CF
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cdae52d355so620451fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 21:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705124565; x=1705729365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJc3qa2P7/gJ3egsD0VQ5u3r1xsQIdR/8Y8k0L14qog=;
        b=TgjdBYMCAyNzcD3ajfk4SP2Yn+xsl8nlCWWaJrcPvVnkVcV6TCirlRUWPdOTShjjuK
         iYdSzTfDbVmBZdPVT/Iw3RB9Q1rNo8IaHtM+uweFkjm9i8G2JfWmt1AAnUEMSw3m33Od
         0WvXlocBMbrV7Kk+neK3yQgW2cmUgge4NZQunQ7oJ5m4TXTibPztvEr52z6CrjPZ3Rd2
         hiNf5QGWqfp4+wEsgpn6ZFFV7RQCpy/7+5KiSGpkNqBwbYMUafQJ624SVxtm/YJmglKz
         ts9spBbKyThaHIiOgSmNYhGNyN19MfJbmi+joL55CLNH78Z6nO/iE/vMPEmzbk8/WZBn
         MGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705124565; x=1705729365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJc3qa2P7/gJ3egsD0VQ5u3r1xsQIdR/8Y8k0L14qog=;
        b=EeC7LyF60d0mkZvuS2G6+aWrhS327lFH94D4RfXxx9p74jbxsuWEIYA78tDidP/Vfz
         8Xn1RyrXkkEv3dYfvB1EUx+7MGhr4lOp3QwjHHQUKxaQl72OFtRZt0vGbKim5NJIo4RA
         8X/2Q9AkQQoHo/ZLo8PtMKqV/+NtyXdtnGvQt1rB6xc/eMr0rsGbe06ib4KSwsWqPPqF
         nXNVswwLdpuFBAGM0Swu7yff7haOMxEvJkR+b1PHgwtKmy7kwJRKexldP1mRUMICw0Iv
         mofYXJUOX+R7XLRcAijvugbi1GeYTVRf245q1XOWt66LndR5dwkWinior3xkbY8SIsCd
         wirw==
X-Gm-Message-State: AOJu0Yzpfg0otQlqmrpmT9rX5O/BfeUmXHmo60a0ilHnEBp8fu2i9qkE
	hIGMxin82H4uTAF+kSEvwh8E3rJ9ZJm8Tw==
X-Google-Smtp-Source: AGHT+IHg/IVhYhNdlEVr2B2pJjuB1QvW5WTX5cjhcVwcHe4hP0XyYlBi0PveewvFrAbVPSlnP2/AUQ==
X-Received: by 2002:a2e:3013:0:b0:2cd:5cb3:d7b9 with SMTP id w19-20020a2e3013000000b002cd5cb3d7b9mr1086542ljw.3.1705124565077;
        Fri, 12 Jan 2024 21:42:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b002cc71e9168csm677719ljn.129.2024.01.12.21.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 21:42:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 07:42:40 +0200
Subject: [PATCH 03/13] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: split
 from sc8280xp PHY schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v1-3-de7dfd459353@linaro.org>
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5562;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CnztgRTnoisu3CgikOKmKjlZnjUtPFGoAOLDjHVdlrc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBloiLQ351KMHbwQZRp5C//yQxdgLNwgvbQVVlMI
 yy+6HmOKVuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaIi0AAKCRCLPIo+Aiko
 1V7LB/4/bg+nB/j/wfc2b7DsP2M+qVHxc7ATURiiqGa22PFIdgsubBMA1njYX4ymoGt1tb6HhTJ
 Mi6k8urvu+K3Yu0uLsJT0uina4KoWFoRReJO328moYf/3lVjQ+uZYch4fUiqxwneY5JS8+eKY5J
 iR5URL/XvhHwPwstNFgGtbVMOI9AZdHwjOEkZ/85351GUm2FnHOTXnpp7x+QZKpMue5mJ789VaK
 Acam09R9YVtvMJzdrKGqKfsfPRgrhk5SvQsTO+kT1+kdqVfC24rjNTBWi8j81YiDHTKycYlf0i7
 Qw61G4/noJMQJFprf+XgmaOQVGGBwFw6zJd9cBe1MvR6P9aQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In preparation to defining the USB-C handling on MSM8998, QCM2290 and
SM6115 split existing QMP USB3 PHY schema into pure USB3 and USB-C
schema definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    | 132 +++++++++++++++++++++
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |  22 ----
 2 files changed, 132 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
new file mode 100644
index 000000000000..868fabd44d72
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,msm8998-qmp-usb3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP PHY controller (USB, MSM8998)
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description:
+  The QMP PHY controller supports physical layer functionality for USB-C on
+  several Qualcomm chipsets.
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8998-qmp-usb3-phy
+      - qcom,qcm2290-qmp-usb3-phy
+      - qcom,sm6115-qmp-usb3-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    maxItems: 4
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: phy
+      - const: phy_phy
+
+  vdda-phy-supply: true
+
+  vdda-pll-supply: true
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - "#clock-cells"
+  - clock-output-names
+  - "#phy-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8998-qmp-usb3-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: aux
+            - const: ref
+            - const: cfg_ahb
+            - const: pipe
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-qmp-usb3-phy
+              - qcom,sm6115-qmp-usb3-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: cfg_ahb
+            - const: ref
+            - const: com_aux
+            - const: pipe
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    phy@c010000 {
+      compatible = "qcom,msm8998-qmp-usb3-phy";
+      reg = <0x0c010000 0x1000>;
+
+      clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
+               <&gcc GCC_USB3_CLKREF_CLK>,
+               <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+               <&gcc GCC_USB3_PHY_PIPE_CLK>;
+      clock-names = "aux",
+                    "ref",
+                    "cfg_ahb",
+                    "pipe";
+      clock-output-names = "usb3_phy_pipe_clk_src";
+      #clock-cells = <0>;
+      #phy-cells = <0>;
+
+      resets = <&gcc GCC_USB3_PHY_BCR>,
+               <&gcc GCC_USB3PHY_PHY_BCR>;
+      reset-names = "phy",
+                    "phy_phy";
+
+      vdda-phy-supply = <&vreg_l1a_0p875>;
+      vdda-pll-supply = <&vreg_l2a_1p2>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 15d82c67f157..1e2d4ddc5391 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -20,15 +20,12 @@ properties:
       - qcom,ipq8074-qmp-usb3-phy
       - qcom,ipq9574-qmp-usb3-phy
       - qcom,msm8996-qmp-usb3-phy
-      - qcom,msm8998-qmp-usb3-phy
-      - qcom,qcm2290-qmp-usb3-phy
       - qcom,sa8775p-qmp-usb3-uni-phy
       - qcom,sc8280xp-qmp-usb3-uni-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sdx55-qmp-usb3-uni-phy
       - qcom,sdx65-qmp-usb3-uni-phy
       - qcom,sdx75-qmp-usb3-uni-phy
-      - qcom,sm6115-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
       - qcom,sm8250-qmp-usb3-uni-phy
       - qcom,sm8350-qmp-usb3-uni-phy
@@ -93,7 +90,6 @@ allOf:
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
-              - qcom,msm8998-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy
               - qcom,sdx75-qmp-usb3-uni-phy
@@ -108,24 +104,6 @@ allOf:
             - const: cfg_ahb
             - const: pipe
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,qcm2290-qmp-usb3-phy
-              - qcom,sm6115-qmp-usb3-phy
-    then:
-      properties:
-        clocks:
-          maxItems: 4
-        clock-names:
-          items:
-            - const: cfg_ahb
-            - const: ref
-            - const: com_aux
-            - const: pipe
-
   - if:
       properties:
         compatible:

-- 
2.39.2


