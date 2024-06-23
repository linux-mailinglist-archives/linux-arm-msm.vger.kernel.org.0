Return-Path: <linux-arm-msm+bounces-23764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD7C913A50
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 14:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 063DF2824AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 12:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E906181D10;
	Sun, 23 Jun 2024 12:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wqqMvFoK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F669181CEA
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719144037; cv=none; b=NxWfXtp4OWK9w6u0VtlUBUKSTbDW2ZhEO6HYA7szBVcc40wq6KlEiZqIXMZI0Yn39yQRgCWrTjjMjIkpLv+kbf3IH+EnRtE2EA6vG1RZYCmfi13B3hZQGckCdHT4eIeir4ewmOF7hEtcyZHJYGWJyRbV11CYOQMsyqP4M4dSAeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719144037; c=relaxed/simple;
	bh=ZkimSwvr82NPcbaA0foj0eXzI4jvTaBVQ88EJATB1tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6HEycXnRKe0PcOuVaqhIdTCXcp0Sk/v7+lxLlHk9/ur4wh1fePSzW4+7fbBajI7i+/7+H/vTdaHYrHGMHy7SxJxOWWy3RmuukHlm9OLzgdYnD9kcRvZ7l1EKMqDovUfZKA9tASrjyJDxv0hjEfeUD5Qpl1Uz1m5XeCSfu59+uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wqqMvFoK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4217926991fso30554525e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 05:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719144033; x=1719748833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecK+toW3Ns4ZNrqgQybbNewCzjgaGGXdUaWN+FWF27c=;
        b=wqqMvFoK8jJWfr9t0LsWpsLYdW3UQOXfjzw9jiehORzP6bvgLq9PtCaOtmFnsIcPfs
         q3zb1gaKvdz+/uNWWBdHdijtxJaP7eDDb+xsSwSKWaYMQcnlskRkxoUyNrsrFIYUFznP
         clGuSs4UtUo6OCnb371HjXFhVLh7sRwo/ZTv7s90e5E8WhnjqUCJNo3UKAeAmB6oPyVk
         iPO1cFCZbFtZQRBOlknTdNZbpXKJCtPWGeWXvpcMWQoseXzVxnfPob0ZuFfAXiRDMcfu
         kAMh5PLhtuosEjw8Ve7klAS3rXSITv+AnSspJjzP83kdnS3KdnRhqhY74i471uWSuPhp
         /0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719144033; x=1719748833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecK+toW3Ns4ZNrqgQybbNewCzjgaGGXdUaWN+FWF27c=;
        b=RUq2ODhqPvILYf+/jfVYzuzizFkMiMLP1Zclq+5X+evYqOf+iqGJ7v1mMw6zwImoB1
         PnHATvXpYua9hSpjUHDzqH4WN0wi4SOmxGH2uOtr7KNk4jtDV24zYpDwZtXEq4rlvogK
         hvWx6S3mOuz/UMAtcWs7Q+/kXewFn2SDsRQJ2leG2loXK+zsDGffEIJwggstZ3JisvHx
         KEDF4DLGXl2dWS2xkwFEvtMA7veK/FgGcRO6roZfEdJkxxLr9I0pHkhfIk2Wok8KCsRA
         YGJINlk8oBwZyAMxs0dnH6XbPfNUiiP1KQETFo9k+xlA/PXqdqdthC3QbRs6uZJhe3b6
         VAWg==
X-Forwarded-Encrypted: i=1; AJvYcCVyq5QTFwyCIifWA6bwvdhl2LqiDOItQrw3IIfaZ33VvVkse5Oz3vRxA7MjTACtgKccMU/AvFzsxr3LkjrAEppQj09NqKzUawAFUatK2A==
X-Gm-Message-State: AOJu0YyRqsL+wuxJEuUfqMFZTtjBB5hQFfvUP+rsfax6mYEjc/X7iJLh
	T7ZYv0Z+31qGSEHE3fKizfxqzfoQgDQ5XRz/vdzAQqb/ol2Tv/UNFm1Dti+4YGQ=
X-Google-Smtp-Source: AGHT+IGH65kKS7M6vcnw+GFLjPcYiLfNI3yhUCA7KwnzudEhnrCZRo0tzHlu9MxebLYKwwKlOaegOQ==
X-Received: by 2002:a05:600c:3c93:b0:424:9024:d468 with SMTP id 5b1f17b1804b1-4249024d4e1mr4347895e9.17.1719144032825;
        Sun, 23 Jun 2024 05:00:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d3basm105465515e9.4.2024.06.23.05.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 05:00:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] dt-bindings: display/msm/gpu: constrain reg/reg-names per variant
Date: Sun, 23 Jun 2024 14:00:26 +0200
Message-ID: <20240623120026.44198-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
References: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MMIO address space is known per each variant of Adreno GPU, so we can
constrain the reg/reg-names entries for each variant.  There is no DTS
for A619, so that part is not accurate but could be corrected later.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/gpu.yaml  | 87 +++++++++++++++++--
 1 file changed, 79 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index baea1946c65d..e83f13123fc9 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -130,6 +130,22 @@ required:
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$'
+    then:
+      properties:
+        reg:
+          minItems: 3
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
+
   - if:
       properties:
         compatible:
@@ -164,6 +180,13 @@ allOf:
           minItems: 2
           maxItems: 7
 
+        reg:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+
       required:
         - clocks
         - clock-names
@@ -196,11 +219,12 @@ allOf:
             - const: xo
               description: GPUCC clocksource clock
 
+        reg:
+          maxItems: 1
+
         reg-names:
-          minItems: 1
           items:
             - const: kgsl_3d0_reg_memory
-            - const: cx_dbgc
 
       required:
         - clocks
@@ -217,12 +241,59 @@ allOf:
           clocks: false
           clock-names: false
 
-          reg-names:
-            minItems: 1
-            items:
-              - const: kgsl_3d0_reg_memory
-              - const: cx_mem
-              - const: cx_dbgc
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-640.1
+              - qcom,adreno-680.1
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-619.0
+              - qcom,adreno-630.2
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-618.0
+              - qcom,adreno-635.0
+              - qcom,adreno-690.0
+              - qcom,adreno-730.1
+    then:
+      properties:
+        reg:
+          minItems: 3
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
 
 examples:
   - |
-- 
2.43.0


