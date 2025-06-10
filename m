Return-Path: <linux-arm-msm+bounces-60806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6044FAD3A6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9268178B7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A172BDC1D;
	Tue, 10 Jun 2025 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZzPMsubV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6622F2BD030
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564377; cv=none; b=ivJxP0rrJu7dHIlu2Kjk2UUmFxkPoDlTwCq2YZn+orhvx+B1A0PR6EgP2l7d5rMIwj6uGXBjPh//aIq1jq6RBxlJMoLJlBJjMImAwKu/pxrNEuFxcSzojg55yMKYRaAShpHfAwMPnhMI5wwYkVrCGMmAM8tSfr2R2AJkG7HwHiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564377; c=relaxed/simple;
	bh=yhNmcVev6YviCoPWMe9VUWm+x64YmaIBhLXpEPpZ7Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2+30NklACp4uGbDcuBvd6sQKoIbK+wFhtlpeE+FSzC1s4AQmA9FBLBqbcsPgd+cDtvgu803uW1KE8oWo55zA89SPhBlsBZXkkMUm0oIbTg3N3gQUUIhrUv1a7J6t+xP7EqfjSFOs3WrdYJxFyDIgQZWrfOfC3J0hgjOGjQ+v6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZzPMsubV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso720746f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564374; x=1750169174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
        b=ZzPMsubVZdY4cV6Ulz04GukjnEDnr4UeTyPf7LWUnk0AIJ7zLNc3N2VmXlmCuspcm0
         Q4pOVI0TuvkwFM4Et07rIxjrj6w+mupTlShaQv9ytkaV7ILvvJyMaKiHBXr81/JOkHM1
         OVbzP67Q3qlXB5uX3IjDCQ6HCEr/KJu7cLOOBuQ4RdMa2Szgvq+0xfmniaikAJc1qzFu
         LPWFZbSG2o0zc0Jot6rJl4jowkYof7ZQGmGEAb6fnLIFDnnqNl2vf9Ps31XbMQloeQre
         VEl01W3IjWebotqbMMeTBbXkcWjken86Xhid17kH/C/mTaR5YkN+nsudH5OLqfsgOm+j
         o9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564374; x=1750169174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjftRN79TvWO6QuKUy67aBlRYEHheVO5KyEXzVb5XhU=;
        b=BSdAK1TNcpie7IwtOCbL81VoH5JgtGudt82GBubnBhaqnRVfO+09shVA/0z2uiCm0V
         C46b23u8ERPzS3ffLJBo35QBF/4vI1GhqSYrAK3tvrjJG4ik/rTOfw619CZQLhW4dm9z
         kuanbf6zLz0hmM2irgfTxjLqubsQMWxfrIpd218nfsg0m6TE0ZvPo/Pdp5kMtyG0Zfln
         xvmWy2jVmjBkHDvo8DvNk0PkKZ8qlkru6knvdofz/qEB9SmmhtIxvfaQiKzK2yuBasDo
         AYojhVlEPiwNWdfbjun2w4g3K1XBtWfgC68Vn6BQNNkeaIMdz/cuKdpYx1vf5yqtQMlY
         MhPA==
X-Gm-Message-State: AOJu0Yxi5/VEOtSoM37LxwPCNX3p085Bk8nReX/kov4kH+HjjOm7tbXI
	DEBugw2t/UNWCCoZFfbHVmXLG8808YPCeZD7FK7wR8TbrbwroTclG1+guzCO6tYpq0c=
X-Gm-Gg: ASbGnctefkaRp3/ra3qvhEdenXN2oosnQt8/XSIt/64SRgfnqV4lNT8/zCN4yXVTjV9
	5ZEyod0ZQL7U/tjEUa2fZTp4lLfhIl4VSdc4af2xUKT7RRjuDg0OvWwL1vgJbtD78nNFAXODwpr
	btDaxKiC6BFv/QHtxkEvlQaHC4yQhUaeM5gwnuKAQwFuM4GdTNPmsFiDuomGiZHb+Q7qWdOZLRf
	o5gNOb/AoUJCBd97b022kyugZHtpTakCrp1VYsbXpNXALSbW/SX15ndOmCK0kfXA1+dTxYKtgWN
	7cxQNNGBvgrzqF4IneMfYIEq4EFTlRmdQZVDXgprWg7foX7BfEYk0zIbtBdnjXZGHuFU9tz9snq
	1RospSw==
X-Google-Smtp-Source: AGHT+IE8m9vNXCXJib4lvAobDyKN92NL9hduxtJo+sH3CDc8emVv2Z83tmvOkDG0E5rFAG5xNiixzw==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:f8a9:ba02 with SMTP id ffacd0b85a97d-3a533143257mr4846738f8f.1.1749564373627;
        Tue, 10 Jun 2025 07:06:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:40 +0200
Subject: [PATCH v6 02/17] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-2-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvAnTGYNiceDs1Si8NBAvdNZ2GTuc/x9HM/Y
 lE2QCBPEAGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7wAAKCRDBN2bmhouD
 147UD/9+eGofQl+6iI1dCqHNQL6e/FHxAyir4raIkr/ZKhgiqQ+7u3O0H2x7OT93P87jrkpqB2R
 UaVvdIKwpUWxgpfm6d2F11C3UglzRoRSdCyXnhww9DNf7eT6K3cbo+z0dn6IzNP4qbZZSI2t8Gu
 MWoDfbuZReYnQtIeCEQcgFleQgDseodzVg0GCDfhmZy/U2eodJl+4QlcZjEnGSRnOFa2Oo1CDZt
 TO8HPNl3xapxWyLr0bvm8vk6dD958R/zp7vAHHJbOnK1hwjCvDSPc2W14nfSN4NX7diFmtH8nTv
 /zVTfR0d5qk658B7xhVxbblBBsWGoVx/SvuCXtefAbF+Vig+hWWoXumGDVqU7K1CC4IR0klqH3s
 6Il4oDQNwi7MxtYR7fwVSUbinD5hpyYKFxOKemFT80hsqYL3Puvp6a7ob3t105q/O0QcLTaxEQl
 vcPUS6rGrs9vTg9Ba6LTXntsyGrJ5FHP8/5304ffFk8VUctdk601pzvj/ui9veGw8Hzd7awYem7
 7XTBcecsFtA4mOFJ0LcctlOeg+/wfLGWvY29oKYd9QrvWF4083FSeddw14msEaQPPCZlMENPSQx
 JaN1Nc0lvlYfnvucJuYFyBLsqra6/i3BfwVlQZ5EDASlk7QOiw+xi1PkH1QGZHK5HS3Oo05qtkI
 E9+5mL32MqGToSQ==
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


