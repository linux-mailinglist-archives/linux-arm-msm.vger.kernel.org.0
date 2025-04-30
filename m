Return-Path: <linux-arm-msm+bounces-56270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE034AA4C98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 153C19C5AED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8610225DB0C;
	Wed, 30 Apr 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GYIHgkGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3F025CC60
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018075; cv=none; b=IJWOQ8QiUITwxssDke/VOv42AFIPdzmbMeN8QIfFQP5DSJ0uNHXlLGAGth0tTR9p9dBT1L/M3TB9QkFREvMnsask+jmXqNm3noF2MZPFOBy6Z4kJuoKufyy2RF2YFBL0CsU6Fd+I6HReizglLroC3meyjDikh9PC2iDM7GkFtrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018075; c=relaxed/simple;
	bh=c8oHQgWG8zyVpdumvYLiQEjDzxNoqCng/p9ahAFicFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E98YeTY5WuhTruKJNgtmdPPqz0xMyYwNfsNjdHc2AXsbVsnaNcwkKRUevQPP6MlMiw2ufifMAEgPKNq7pJqp2d4CuKy8+XzbIZXH/wMxcatF13HifIo7J4fmUm/XCPDYa52R3VD4gCF7rjRCcicjeIwBg+ReZKj858awRbY6hQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GYIHgkGG; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3978ef9a778so260052f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018072; x=1746622872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iG3TpSGpl+MMSxoAQAbN0k3tmRV9VCY0AmQZEYMeWv0=;
        b=GYIHgkGGNLFPR71J3GZYU7slw5yFzt5wdyt7NelyUBPCtRCxMjG4jto6b0zTUuSLBl
         THsZIn4Y3KRm7OjzukYRrbVVgzk89XoQLKYY1dZvvsHbdWFB6havM/YuW0w+0OMHvXJi
         M5gV4JK489l1yuaAG0CW0rRn4/LTXn+nIYyklXMb6a5h9zS3iM/bb2/nHIVyEv4x/87p
         PTFBLEJ/4sTCqq4kdTpKq4BC11qBrLQONwmwIo+36tbax4zhKctAFThMXaJ0kVgZqyQe
         mlL/KjEWGYCKwq9EKtspk6VGF5UIJ9Bs0vrl2KvKL002oHfj5cbfOY78FmNmULnu38Hx
         YQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018072; x=1746622872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iG3TpSGpl+MMSxoAQAbN0k3tmRV9VCY0AmQZEYMeWv0=;
        b=mA7TTDsGxQYB9dsE/T747FnrBVIMkWpPbhqokUMAes5YSPF4csmnCQYTJZ89tNtQZt
         Ym3x3gTvh2k9RsLEJ1Yj+VjUUsH4pJmhJSHJ9wevKf1jzOdiRHaK1Gc2t5agMTDr9Xey
         DVuyX6QCzK+9bOg8Pv4C2F7J5aLRBWQ/Yj2nl4bW0vvT7ieLB+IcxF8Hj5n4CQ1ybgCI
         Tp13KEA/SoMVs3/vwnB1pJ0WI1LgecLoXMlijSTWzfGo+Foumljf5HQpFmH/BoQmSyhL
         1UkM3AYQf7QkGfHZoeGzknodb3oEfv6YPf+oSZZ9Oxc0ni1z/1ekEF7TV6pu7F/iPTUc
         5HWw==
X-Gm-Message-State: AOJu0YwQpBJXfn1sUNQULVWvM1OOdjlbRDQ6vx7CttUTjTuRQZuaXSr7
	8DzMLZJ7AmJtXL0i+u3QVe5o7F1k6sDus4lh41wBAAVvzrDu+sUCSogEG/i7g5Q=
X-Gm-Gg: ASbGncsFkfH2kYaI4hVFWRt8s/sxCBP2vS1GbqGvpE8tY39skVGVb/mXGJ5OLZrS1Mb
	Ns+t7S4TWGIoMZ8isi3wTi4nQAPgqiBKgEnbsXqTGmoZhuwv/vpvW4a5iPPAutII9jmMiLXbpgl
	8nZ4F4hJujJx5PWNjeZXmfvtpuOVBGw+4QsWDqape5jpXue+Bl4Zoc+9vlA/8ArxzsGK/qP7/Bk
	vSmfC/hqwAmZLCSaV00n3W9JrODDdlvYKiwR597487Mh2iqlj6Eezf5q+3x/oFrCqxjTOQE0U22
	fAZ+oqkw3Hy5aJsCecleeKlO8PTo65y6WoPzo7b85xzyJdr12xmHfQGBapk=
X-Google-Smtp-Source: AGHT+IE5WK0gG1rgTNC6d+nKzNbxlpE9Pyd/jLCiun9qFIGNupYNh+8MOg3ik3y2f/DJqFecJq490w==
X-Received: by 2002:a05:6000:1a87:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a08ff58053mr832694f8f.2.1746018071453;
        Wed, 30 Apr 2025 06:01:11 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:32 +0200
Subject: [PATCH v5 02/24] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-2-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=c8oHQgWG8zyVpdumvYLiQEjDzxNoqCng/p9ahAFicFw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh70hgOEuQmoJX/RusdSvzlDRwLYOOCVG7rrf
 HFaqGKLi9KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe9AAKCRDBN2bmhouD
 1wx8D/0cwIVHnLhSUBzRM3ZxS64f0pzA9j2/QOnkTM5ah6P9x8iys9lwN41UBcnlh2+nIaxnvDA
 dcHL95ejULON5koCwh+e76+v6mDqrTVDQdK4wXHN8THzgmsO016oSHYSegM1s1kulB60q/esU0E
 BzIME4aieUF7X1MF5C4KpNJivW1RkPUp/kQWbE0TbPt9wOpBq5vigDv63Jmf+JeKtpk3emHhZiM
 S04VpetG42Pc/ClpyzEldyfoFEWiMqSNQthNfK0VnGWrDO9CsKdjnpkZSkYwxFZ4t+USV8+GOBg
 Ks4JotJ/8qkfoQtCM5GknH/2t06OFJ+UXTpfLYE3inlIQbMJMh66N3N/C1M48SADCtuA5C1Y0z1
 rwF7YIigmLadEDJaJc1roUfDxyPLvgogPCXf5brsoYF40Dzjy/nTGeKVJFed/f1/uJ66D+fpbhJ
 w4Hz0o5SR/JlXVF71hfpExZCmkcE99pDVSv2QdsB2NyQWaZOcjr04vlMqgWoxVdMLxxrzMYFS2C
 hYU3+q6nxRY4nXYQ96qXLFK1kagLr1pzYnKDkGZckRXsDEv0SFUTsfkvxaShExu3tX1MO4GfoAq
 BykT1gAScLErWvRzRAkePYhIflqn0JXfysmaZq5oeGCvrrS2aiDpTVAw7CtEV3gc7B0Eic05Tgp
 H6mOG031vpd8QTg==
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
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..8ecb2d8e296edf555df7380eac284b41a3f000a5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -40,6 +40,7 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
               - qcom,sm8650-dsi-ctrl
+              - qcom,sm8750-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
@@ -68,11 +69,11 @@ properties:
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
@@ -107,7 +108,8 @@ properties:
     minItems: 2
     maxItems: 4
     description: |
-      Parents of "byte" and "pixel" for the given platform.
+      For DSI on SM8650 and older: parents of "byte" and "pixel" for the given
+      platform.
       For DSIv2 platforms this should contain "byte", "esc", "src" and
       "pixel_src" clocks.
 
@@ -216,8 +218,6 @@ required:
   - clocks
   - clock-names
   - phys
-  - assigned-clocks
-  - assigned-clock-parents
   - ports
 
 allOf:
@@ -242,6 +242,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -264,6 +267,9 @@ allOf:
             - const: byte
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -286,6 +292,9 @@ allOf:
             - const: pixel
             - const: core
             - const: core_mmss
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -307,6 +316,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
   - if:
       properties:
@@ -342,6 +354,35 @@ allOf:
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
@@ -365,6 +406,9 @@ allOf:
             - const: core_mmss
             - const: pixel
             - const: core
+      required:
+        - assigned-clocks
+        - assigned-clock-parents
 
 unevaluatedProperties: false
 

-- 
2.45.2


