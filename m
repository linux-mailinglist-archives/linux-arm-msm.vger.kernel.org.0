Return-Path: <linux-arm-msm+bounces-2135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FFA7FA61B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 17:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ACC71F20CE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7787E364CA;
	Mon, 27 Nov 2023 16:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U/6kaPrN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476BC99
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:20:14 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9fcfd2a069aso612422366b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701102013; x=1701706813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4Qar7YCtECHHHtbAdP3JjSDpAvBK1JG0fUmDN50K9U=;
        b=U/6kaPrNqZdRj8gmxaL8dtAtgL9bMR+e2QJTb7FMUSINp1Eg7FwgdEYThheaq8AKKY
         khS3w7TcTMrsg7L2WHgh3GA1VxSJdn/A/lDkhSmDsdfV3+lM2MFNnqnjzKlI8V7yGVj8
         DpE2W47Dm2etEXgLc9TSY2eZ/In/1GXOQn9NSezpokprIPz0RQbTdnqyEf+mJt1fx3hP
         Vr1cHNvFAZJ7Yw+uZbfbMmX1d8xqYUxvK5V3IJqCKsf/5nLZKKbuHiWkWWgon1VCjysO
         AIi8p5212SO0jw0U85MvfOeh5/ggv89+GiPT9d8Y1a02q9q6Am5/JKbcbvH5G6gsUGri
         OlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701102013; x=1701706813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4Qar7YCtECHHHtbAdP3JjSDpAvBK1JG0fUmDN50K9U=;
        b=fsry8ou6ic30STsD8zdJUsSxnHSUP4C41uwD0i0Ktj7MS/BAmmeOyho5/ZxP8Eo6kD
         Pvpjwqbu/rMp/N47YxdO3hwnOjn3p9K99+6pKolGGYYtpBapLsgb11Jb8ruV4JSppjzQ
         CZUb8eMQTVKITry1xIGhdz+J+oSAd+8Qe2U7X0sP5H3ujLXU3SXm61h+JPh226YKt9/4
         n14u19gR1GTSU6D7nB7G/OsdsFjKqDAuW0vWFUGh4EszcqxdXZIu743J/T4ePpSborfE
         xPE0pEUjWi68YNAS6nKY/1yqRYYZGB9/q7XI4UEITd6+5rKQ1XklP70+KGRxZssYvIj2
         HZ0w==
X-Gm-Message-State: AOJu0YwycVJEvlr1DOw6BrJkZSAOoFQtX1046PMaxHmO9qsbjuKjD++D
	0udsOjihmSOk+DX3328nODlsWQ==
X-Google-Smtp-Source: AGHT+IF2zH3PWtUHX1jYKPVrd2c0nOGMkqPFufplsRrEuosRu8zLboazblnBYXTJ0eNzXlHNagLNiA==
X-Received: by 2002:a17:906:fad6:b0:a10:d5ef:ff00 with SMTP id lu22-20020a170906fad600b00a10d5efff00mr1855674ejb.2.1701102012755;
        Mon, 27 Nov 2023 08:20:12 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b009c3828fec06sm5734760eje.81.2023.11.27.08.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 08:20:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 17:20:03 +0100
Subject: [PATCH 1/6] dt-bindings: arm-smmu: Document SM8[45]50 GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231127-topic-a7xx_dt-v1-1-a228b8122ebf@linaro.org>
References: <20231127-topic-a7xx_dt-v1-0-a228b8122ebf@linaro.org>
In-Reply-To: <20231127-topic-a7xx_dt-v1-0-a228b8122ebf@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701102008; l=2687;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=74tAYPhFS0JRCe3sr6MjDifnedbnYgVr+albesY88R0=;
 b=No3Vb43Hd8bD4NOsHXSg5ppXhq7oWxb1HCy48OeWtBGzmM/Vf85XVb4qfsN85FKcmgSofqivP
 np1tT3yPxGoBCcURjbxS75Vp3ViOIvu5TsM+75m9B+XJYAMDFfL629i
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

SM8450 and SM8550 both use a Qualcomm-modified MMU500 for their GPU.
In both cases, it requires a set of clocks to be enabled. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 48 +++++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index aa9e1c0895a5..19dba93a7654 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -89,6 +89,8 @@ properties:
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
               - qcom,sm8350-smmu-500
+              - qcom,sm8450-smmu-500
+              - qcom,sm8550-smmu-500
           - const: qcom,adreno-smmu
           - const: qcom,smmu-500
           - const: arm,mmu-500
@@ -453,6 +455,50 @@ allOf:
             - description: Voter clock required for HLOS SMMU access
             - description: Interface clock required for register access
 
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm8450-smmu-500
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: gmu
+            - const: hub
+            - const: hlos
+            - const: bus
+            - const: iface
+            - const: ahb
+
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU HUB clock
+            - description: HLOS vote clock
+            - description: GPU memory bus clock
+            - description: GPU SNoC bus clock
+            - description: GPU AHB clock
+
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm8550-smmu-500
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: hlos
+            - const: bus
+            - const: iface
+            - const: ahb
+
+        clocks:
+          items:
+            - description: HLOS vote clock
+            - description: GPU memory bus clock
+            - description: GPU SNoC bus clock
+            - description: GPU AHB clock
+
   # Disallow clocks for all other platforms with specific compatibles
   - if:
       properties:
@@ -473,8 +519,6 @@ allOf:
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
               - qcom,sm8350-smmu-500
-              - qcom,sm8450-smmu-500
-              - qcom,sm8550-smmu-500
     then:
       properties:
         clock-names: false

-- 
2.43.0


