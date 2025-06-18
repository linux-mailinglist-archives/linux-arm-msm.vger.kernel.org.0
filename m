Return-Path: <linux-arm-msm+bounces-61737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643ACADEF93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 16:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 747EA7AA11B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 14:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BCC2ECD30;
	Wed, 18 Jun 2025 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pv6wTokE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B531A2EBB8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257202; cv=none; b=f+5mD53VK+v/IpyT77lQgTO8dzfFcN2XZdfhbj+t5QpiOmLiaEF+m+rInHF/MRf1JxkY6a2KgImG1qCtN7PULNKb5O9LtlVQXeF6TY48uEO/cCOb3YDP9YXleccN7jXviCRqJTkgVRMmkSkr3QTFQdtKzwzN1SFG1jaIVvBJ4W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257202; c=relaxed/simple;
	bh=yhNmcVev6YviCoPWMe9VUWm+x64YmaIBhLXpEPpZ7Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sBhTaiXdRlNf7IZkR+k149C21HWte0GSeT//9x47LVGKn4oFY/d50M28qCg5pDPE8cJnf/GB48r5hJHl1v3nLDq37m5UTtvGQyYTt/XGzKYGt6ToGyeGi0QpwKyIUVvEqfSn1H62Opo/zbhr+ktBhHWk9hto7akjaMDPkn39VGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pv6wTokE; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad89c10dfabso200209366b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750257199; x=1750861999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
        b=Pv6wTokEbaFAxr0BK8U0RDy9o1m70QH7nAFSgU3CblA1OK8+JQJ/enC6NuAn0lzYyj
         4tLoZYcvD5pPquFsrGPy0AFG1JkcsxwyWuuqLItcpGbMRrzli37rm2LV+1LVBNMicGyG
         H841/mGvNEfinzNDV7zZ/Bmh/OZHWeszJLW/n8MKS0cI0atiC5wk74VA111OlVGV2SUs
         FZFaJYAzqwBP1h8MKN8bKbOWsAhUjSXehsj3uhxeI8Us4U7qHqvoGgnwsAfNBjS130+P
         DRKss3ftA2MLR2KAZRo/Eyr9lkSPRvijmkLmG65OWj+ob6bFUjMsmYgqJKbmBm6jhxVj
         qynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257199; x=1750861999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
        b=SM0A6NvuNOaLPLCIIE+pO9/FyAwCU05khfWElb3nOY1nempAwNnZULQK+jdTC7h3KF
         4qsW/jq8BU8MZloKuWddyPTIthAo8mkwKsEN8/fCcn3JN66gi0qWiBVyj92fQJ51XMaE
         6nMSP/Huy1gHJILJRD4DREzsa27mKyjRp1YEsFCv3agEpyD+t+LicOtRE/cu1zVmEYvk
         D1YMwuPGtP5qtZ7IBX+7f3qJd1NOJp4D1lqkhBzBUxZXz5WQpG5ATcf7hTpUzS3n8jPH
         MeEDqQi/29emW8KMqd1Oyaqmnv+VuDA/LKzDZpFIcklnNGX0PXlo4vLPlME+jwPmvEm7
         mV/Q==
X-Gm-Message-State: AOJu0Yyw5Jkml6YVL/T1m6nRtPJt0Jec8nuoxi3w+gPmsjWI5orSUZHm
	G/GOLizTCYKOWdgyvNv3kh7PIxfv0QdpRcX1Ukf8+he+DYRPMpD/Q2BKAvTPSwDAQes=
X-Gm-Gg: ASbGncsy39UD8TUYhvIptmbjDN57qIUl6SEQzVL92cummXLC25JFasxkqQZxCcdt/L9
	6Wxkv+iGtQLfwPjiRnLBC9r28JLd1uHqVvCW6CH1tjHpp7zsAETVC7N6L4mTILq0GT7kGHhgRvr
	g8Jca4y0sOd3csa+4nZ3X3TEAprZ1c7/WCO5bb8rXoar6EDEHGm6aduPJOthcm6uurW2Squnp2S
	ft5jmDokX4o8Q7wvUhe4oAFi/h3eNLCK6Odry2HyQUNPm/G7RwiiNWh7n0hKXwmjdwMaKTt7mBU
	MlorGIYjdsKvf5evaCwtQs4D78b9DNJlvgxIM7ZYII7LfXJUvL6mQ558PLu9bqk9yHc2XqEUysc
	BFASyllk=
X-Google-Smtp-Source: AGHT+IGnO4AeGX0v+xlGD2WvBUnNlaLV8qfrgbqsidl2MAahvBa3dYReqfHNCI7spPo1T7GtkiXpYg==
X-Received: by 2002:a17:907:d29:b0:ad8:a2b3:66fb with SMTP id a640c23a62f3a-adfad3748bfmr559881066b.3.1750257199028;
        Wed, 18 Jun 2025 07:33:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:33:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:31 +0200
Subject: [PATCH v7 02/13] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-2-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=yhNmcVev6YviCoPWMe9VUWm+x64YmaIBhLXpEPpZ7Gk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4bib0TEGjh6PRC3ElS2V34P5xI8OZ4+ka/N
 sivMV7mbICJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOGwAKCRDBN2bmhouD
 14NhEACDDmu3EbTY6hDUY95YqoiGg3PZANS7q++04+7UPtSdj0ys1bAuZidDqDqhVFaA3Zmlz7y
 QZ4TCxzra/I7YX3fhJeQLhRxT+R/Cfmt8+cb3vJxMEz6r1cd5m3dIwLHL6kngjuTNIvNY3gCMaA
 NMOCzYcgyf73U6Yz7a68S2CmJM+ZjXMjZLb4RG5WWOfHmbGtfn3kM5i8KIFjSV0sfGsbpFPrBnu
 hkTN0bVYhu0TG3EZfrPOAa1V89etmpwA9r7Y6KVLkk1g4S/lKWu1voKp5T8Mb5P1qfH5lwWyDn6
 vfT6iU6HsGS1KrvyT3hpD+YG1ZYcMY9CIhO3HryqTLEeIoRS6VBGvMjHhKLy2MNr6t9FwDdAjtt
 RPqfaxnXJBKTpylwR469a+/0PGndp7cd4kcy4rQp+BGcnP7SGGFXr45ejv3fTh+AIlPBEnf1P4o
 zM8A4XVW8hJINDJJtDsIgIUgctAlJdwIC2J+q1MuzStRCVM/djebQL8tpftqKSgvb1feH/dN57f
 nJ6x2WiB7CS974UPU0p5QxHpcxWcZa5Q789njnS5KYGOifRcTHH/X1oEoE/XTYJGFytM2Q92Y4+
 3MXVYF24f/7pYMz9Of7lIJSsbA5f5tKqgacRWgx0eMBPIaJ57ob9Hc6a70dDGoHsk6HRtkzaT4Y
 mgZsli/RbyL8hhA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DSI controller for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

It does not allow the display clock controller clocks like "byte" and
"pixel" to be reparented to DSI PHY PLLs while the DSI PHY PLL is not
configured (not prepared, rate not set).  Therefore
assigned-clock-parents are not working here and driver is responsible
for reparenting clocks with proper procedure.  These clocks are now
inputs to the DSI controller device.

Except that SM8750 DSI comes with several differences, new blocks and
changes in registers, making it incompatible with SM8650.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 54 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 82fe95a6d9599b5799549356451278564dc070de..d4bb65c660af8ce8a6bda129a8275c579a705871 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -42,6 +42,7 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
               - qcom,sm8650-dsi-ctrl
+              - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
@@ -70,11 +71,11 @@ properties:
        - mnoc:: MNOC clock
        - pixel:: Display pixel clock.
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   clock-names:
     minItems: 3
-    maxItems: 9
+    maxItems: 12
 
   phys:
     maxItems: 1
@@ -109,7 +110,8 @@ properties:
     minItems: 2
     maxItems: 4
     description: |
-      Parents of "byte" and "pixel" for the given platform.
+      For DSI on SM8650 and older: parents of "byte" and "pixel" for the given
+      platform.
       For DSIv2 platforms this should contain "byte", "esc", "src" and
       "pixel_src" clocks.
 
@@ -218,8 +220,6 @@ required:
   - clocks
   - clock-names
   - phys
-  - assigned-clocks
-  - assigned-clock-parents
   - ports
 
 allOf:
@@ -244,6 +244,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -266,6 +269,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -288,6 +294,9 @@ allOf:
             - const: pixel
             - const: core
             - const: core_mmss
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -309,6 +318,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -346,6 +358,35 @@ allOf:
             - const: core
             - const: iface
             - const: bus
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8750-dsi-ctrl
+    then:
+      properties:
+        clocks:
+          minItems: 12
+          maxItems: 12
+        clock-names:
+          items:
+            - const: byte
+            - const: byte_intf
+            - const: pixel
+            - const: core
+            - const: iface
+            - const: bus
+            - const: dsi_pll_pixel
+            - const: dsi_pll_byte
+            - const: esync
+            - const: osc
+            - const: byte_src
+            - const: pixel_src
 
   - if:
       properties:
@@ -369,6 +410,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
 unevaluatedProperties: false
 

-- 
2.45.2


