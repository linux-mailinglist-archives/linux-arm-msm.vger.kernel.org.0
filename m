Return-Path: <linux-arm-msm+bounces-44567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 386B7A076A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CB371689B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7CE219A75;
	Thu,  9 Jan 2025 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wel8Jcpd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7132185AC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428135; cv=none; b=ZmkgqFzry0yK3OaaNehxisZK4J2B39NBIU6RoHlcz9WkJ73If0eMjI5vNmOHIlO1w+n6L+4dSNGyNSL0WUMcSSA6UNXE28jv1uUQlRh7783AyQKK1FhP3Rhr8eEpEeE2T6QS4WlUbLxs4ZG7wfSgfsLcPHwMCB11ZIawdmcENgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428135; c=relaxed/simple;
	bh=MQ748T1GZYQKbZyfeje0RVYs6YjR4dtwJ7gT00apGuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r326EnKgv9m44itp/LlHy/IUgwqrP45k8CJ94ljNcOPK8G+52579Wxe8zMQgxd/kmtrIKAVQw3L6SH1AX69xHcOqQ1btsH7rnjMZbMzGYVdvCOurSS2TBM02Ce4YdXzb8lLQ4VpCpBkgZrynsg4uSnnbCB3PLCgZCrATO2xDhNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wel8Jcpd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385d7fe2732so68864f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736428132; x=1737032932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RJRN3DpHMoLX/jdimH6f+RprS9z729MmnmNKrGM77M=;
        b=wel8JcpdZz09P8EdsWxUJMj6yAbKZVBW2eaMw6S5RWg53tPY+3mZr8TouQ5HWWYefo
         5g/LvYrjSAGt7MKQwg/NURpsNMcnOK19moTcDPcIJIN1Oe8PobedTkUySHoUyFA+WwgE
         A4jvx3GDGPluIP1dkvCbOp8wsBiJpaBBWoSUurajbGgeXQ26M83+BxbYC2bgFgZfN/ph
         o54fujsKYsTzORTKzIrcYqLK/VAkLEXsubZyEQjYf5EQPPvatf9X8VFi/A6Rhvm/61Wk
         lckSUpN4fYwNN+suMm+cAzV0L1FhG3sPNR5HVpPWYzPa6SqJ8BZz0BL/x7gCPCWUGOqi
         uW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428132; x=1737032932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RJRN3DpHMoLX/jdimH6f+RprS9z729MmnmNKrGM77M=;
        b=WJFADsJ1lQc8ewsFvjhP5Uu+rqjxFVrDnUvyB3eRQZeNu6wklCqrTqLam08VnvlOsd
         y3sFwOaTsIvzGqMX9MPEm6aJxBNnVLPewirmTnk3Fm0CgTCTDOgaqXPMco6XhY0KZFxf
         6SwNRnqPvRlaEXDugf0l3oLre/EWrV1NPgDEQY3+dtFyHhW9qLJegN/DsCIU4PEkmPjU
         QVRV8zofW8klGVUzey2fs0pD7CGGcOqKsrRZ50mQpSN2q2spxUedxn5GEccY+HsNZ3/Z
         KAzmJO7AHmgTUGT8bJoFMaobnAaXp8cR1SB5pWaFDSDyq5dhspBW6I6GVjsv/secKwZR
         y9sQ==
X-Gm-Message-State: AOJu0Yx9VNfZSuQFVH/72bS0/A1C8al+OnXEPp8TnnynbEkjlc6HlGKf
	K2xhPPmPmymjyFnXO4erAIw85bFtxkhdZrIMD5hXPlIpGbISJEGFHtvI6A/BugU=
X-Gm-Gg: ASbGncvGq/mJ5kwtGwSJCu8LrSf/mjHmm3yd1ICrJc0z9yxGtbgKMK8Xh27ltJGiQFc
	CaAYw3XbQXq4hZL8oxchiNRRZItNl/XdBq5Z8ahHmEt7S60jyuTUjNJj4ZOBR1+ixy3+0gZDqU1
	Vq/XaGMopas4/aFKNJ5Q8Vdn1uyJcZHn3GM794PM3WVJ52vlGQvRQLpAgfDpA80yGFet4LnjsUL
	UXWa6NsM2FDTFrBWpSPhbgwZWnnXg64bWP7ze8E1h5CEGwaj5WIHT5dbSn0a1rnkjPJNYvW
X-Google-Smtp-Source: AGHT+IEFtVovrr+9PFDGQDnE7Sg3h8FRd+yDLavnYBVOD7Bk6TIaMXWKNWm8UdpJMRZJX54VO5h+OQ==
X-Received: by 2002:a5d:47c4:0:b0:386:3a50:8c52 with SMTP id ffacd0b85a97d-38a872e89f6mr2463710f8f.7.1736428132105;
        Thu, 09 Jan 2025 05:08:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:08:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:31 +0100
Subject: [PATCH RFC 04/11] dt-bindings: display/msm: dsi-controller-main:
 Add SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-4-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4323;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MQ748T1GZYQKbZyfeje0RVYs6YjR4dtwJ7gT00apGuI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pTE+bwb3XSoenIMZ8b4rrtee1vP2mwnRg55
 TXa2SIGWmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KUwAKCRDBN2bmhouD
 10yjD/9mxwC99k3zdXUhEOPmdViV/Fj5ffAa0bDAXAN1NO4g3cSuJP5Y6vP8KIh1M2tafuLNXLK
 36DaRgCmXwWUlFQKyCmi3WrUv2mI/HL/U+3Pj4qJ0sBDqnMwrdcL/Ukhta1Xo5TAvKIx13zfgNY
 lIP8wr9CVDHty9XIaisa7zE13tV/G7/kmQAR6eHZs2+LV0/FT1tSaB8xNXZhLSu1goMjmFlhZP6
 IR+9bHOqhw5sNBfxu886mrNkhDka04a8LA37dZ0XZCOFvPW+F1TE+/c6ziguUZ1NZCwleUXLT9L
 U5LD2/mzmltKpWoIQ4GxjyHJo4EoK6oGvfgF0l5EBDlw5aY+fMq26ZwnW/lFFBCN9g9fD9J4cpJ
 lqwRNoZ/0ytG34MnYiWiQBfyP7vFZ8HSsH7YOnvDIHF/QKCZ26K0bvYvEaMqiPhJc8eRlglA4EG
 0/1hR4Wu4oploJAJbj3tvB3c07A0Qoo6lGzd52WqHl23nPvR8sSqUeIABgCnL1baF3fV2nWOmXs
 a8bjisCjrq4UYy4G+z3ZUxFdit9C89nO9cAOYPOanmSVs1xyaVGHGLjRzWCHb3lC28FmW9l5MNd
 zU+D6lzgW9mBMiPNHfMuyZiDfzJn/tdKEaHRRMnk6Jm3unA6dIBuaFWeV1TcT/oogRwfhNMOVMR
 VUJ69LaYhYIYVeA==
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 54 ++++++++++++++++++++--
 1 file changed, 49 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index c99dd06f2db9a7a77665ab057d05d87fd3ec2ec2..475b3b881c51c0bc526aed54955767a7149fb1d5 100644
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
2.43.0


