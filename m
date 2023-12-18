Return-Path: <linux-arm-msm+bounces-5216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D48816D63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 13:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38DBD1C2371B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 12:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02F042058;
	Mon, 18 Dec 2023 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X/JZ5+5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92BB4B13E
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d307cf18fdso9631675ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 04:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901252; x=1703506052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XGN0l4V5lK+pzpRjICmG52cyuWi32BoHlDHyX2fzxU=;
        b=X/JZ5+5t7wGTgI6t/+OxK+bCnrEjbDYh148j6MFIBT4ZJKqe/JqMTDp/LurUvzpjLO
         PlyimPILScrWC0mVot05bo067XHhhmOroZa6zyKbA3efCciNcY5CQJqJgsZ/2tEgXcq3
         ijpb8IDQOVg0nnS0TMfce/xEPM+gMXiIbqm2HI0uXfeObd5tMOLIyw744QKdt1+SuHfL
         WuJZ1PlOaWCXkJ/2tzeIhPeeYQXoAIXEuOeJIADL355UfwuHwW7FYKf/mfOTNStBKrij
         Ft3jVSjgvpiyMn2+GRo+uyOAGViSdSylodaiJl+v9hiv6bI7RQseYg5ovy8uBuFjJ8x8
         nCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901252; x=1703506052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XGN0l4V5lK+pzpRjICmG52cyuWi32BoHlDHyX2fzxU=;
        b=JRco1QAoj5zX3s388GHJwr9IM75oW9twSIvCAqGKDLh4XU/sgTfp4O+xJuAoRx7WnE
         JP0KK/F48MBZ+tMVtZ/slvpvBtt2WyJAEz/7PuuXcyNlGq5K0BBlDtQkyicOAsAvvfoZ
         KMLrJC4SwkINTb0heNMNRKVyY8UKQtU0qPfFuGGsEFpwRnfb7VloodNHxd8yhj26/93a
         dsaTIqVtoW9cX0Mmee9Gf/vsvFOjb3TTIl7nRWrnadBAJCHGij+HB/zxTMdprhFaqgmf
         Z7iy/05z3G8zye/kelEFr/MRJVm5PRsbpuMwe6RJN2sdFmsIlk/RPjv/vNjLOPzn3zy3
         sHyQ==
X-Gm-Message-State: AOJu0YzbzewC87RE1VDxK7amcUGm5HqN91ySP40i+YWlDr9Bzm4jKjLy
	mRncJr6mvDopSV1BNmsapNQP
X-Google-Smtp-Source: AGHT+IHktLh27UF6SwWXcuTMGgrd5PzOnnwJaNZnTznA+SHt8DnQ7XBNQGfcgy37yKImL7SiBzdycw==
X-Received: by 2002:a17:902:ce91:b0:1d0:6ffd:ceb7 with SMTP id f17-20020a170902ce9100b001d06ffdceb7mr9928945plg.112.1702901252088;
        Mon, 18 Dec 2023 04:07:32 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:07:31 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 01/16] dt-bindings: phy: qmp-ufs: Fix PHY clocks
Date: Mon, 18 Dec 2023 17:36:57 +0530
Message-Id: <20231218120712.16438-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
References: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All QMP UFS PHYs except MSM8996 require 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC or TCSR (since SM8550)

MSM8996 only requires 'ref' and 'qref' clocks. Hence, fix the binding to
reflect the actual clock topology.

This change obviously breaks the ABI, but it is inevitable since the
clock topology needs to be accurately described in the binding.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 47 +++++++++----------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index f3a3296c811c..800f11b29dcd 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -37,15 +37,12 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 1
+    minItems: 2
     maxItems: 3
 
   clock-names:
-    minItems: 1
-    items:
-      - const: ref
-      - const: ref_aux
-      - const: qref
+    minItems: 2
+    maxItems: 3
 
   power-domains:
     maxItems: 1
@@ -85,22 +82,9 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
               - qcom,sc7280-qmp-ufs-phy
-              - qcom,sm8450-qmp-ufs-phy
-    then:
-      properties:
-        clocks:
-          minItems: 3
-        clock-names:
-          minItems: 3
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8998-qmp-ufs-phy
               - qcom,sc8180x-qmp-ufs-phy
               - qcom,sc8280xp-qmp-ufs-phy
               - qcom,sdm845-qmp-ufs-phy
@@ -111,13 +95,18 @@ allOf:
               - qcom,sm8150-qmp-ufs-phy
               - qcom,sm8250-qmp-ufs-phy
               - qcom,sm8350-qmp-ufs-phy
+              - qcom,sm8450-qmp-ufs-phy
               - qcom,sm8550-qmp-ufs-phy
     then:
       properties:
         clocks:
-          maxItems: 2
+          minItems: 3
+          maxItems: 3
         clock-names:
-          maxItems: 2
+          items:
+            - const: ref
+            - const: ref_aux
+            - const: qref
 
   - if:
       properties:
@@ -128,22 +117,28 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 1
+          minItems: 2
+          maxItems: 2
         clock-names:
-          maxItems: 1
+          items:
+            - const: ref
+            - const: qref
 
 additionalProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
 
     ufs_mem_phy: phy@1d87000 {
         compatible = "qcom,sc8280xp-qmp-ufs-phy";
         reg = <0x01d87000 0x1000>;
 
-        clocks = <&gcc GCC_UFS_REF_CLKREF_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-        clock-names = "ref", "ref_aux";
+        clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+                 <&gcc GCC_UFS_REF_CLKREF_CLK>;
+
+        clock-names = "ref", "ref_aux", "qref";
 
         power-domains = <&gcc UFS_PHY_GDSC>;
 
-- 
2.25.1


