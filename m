Return-Path: <linux-arm-msm+bounces-23762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA24913A48
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 14:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8A521F2197A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 12:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7F718133B;
	Sun, 23 Jun 2024 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cryfDCVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FD7180A8C
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719144032; cv=none; b=p4t34ULpslWeTNZ+RcYdQBVmgeIoycXZYsC2zqTZh9LgemLHMrKGJYlkx70mngaCmYPN5OEsFgYhnK76AW4/6Tnuh7RdMeC4ZYpqOG+8ApzRMgTlOe/jZiEJPxBi/Mug27xbadrMwAPvo7BP0jQ+DNL+9KjxAtM47DGYk1LHcJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719144032; c=relaxed/simple;
	bh=MQKKDaIGCGbRLN1AzCvjvVCiUpvORFMPwHtaVwKOtaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qZp2I9OZMV0tk/y6E1qW62z7NmTpy1+y0CV8qY13NfIwlDeGxp9wLT4EoWsrQCliOJUZaPc4VPujbDpqxA/quzTT+/UykeGfshCZKpIChXm4ZXPo3TrTEi7JXUJw+9KBLBz3M3vbJe66wKkE8IYs/07pz3kvo15+tj41ZLB5cLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cryfDCVg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-421eab59723so25295195e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719144029; x=1719748829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wq0GDSPoIp4+sLNJUnd9TkEoaORchJ/hKSadjq9Ps7M=;
        b=cryfDCVgqCvZEUY0c+t7jEnyytH88L5XWsxgFbJfWN/k8P/G2AhX9oUVEcLdAI105c
         Tt90mjbWsRN7DqTEolwunC2PFbtXmbuX4EHxgaMBv8OKGOziM/z7mKcRrlkX5/uz7bvf
         Hx7l4ZhylyGJS16vzWXdZtmFL3eueuwo3bPkC7lBQmaqLXD3kXxPq5bSb9Ay3xkW0Bos
         Jq8gXAaL/LXBhM4jVf3Z6gqXfh/EdAeyCUJuAi8S6AHUqepgiKr8UulUhVQ8wOMNtMG0
         7XJQTkIov+8V3CMUJ0KQBOiHz1az365yFm5h+/4uEz4ouFRXeChL3ZuErX9NLgZ8m18m
         WmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719144029; x=1719748829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wq0GDSPoIp4+sLNJUnd9TkEoaORchJ/hKSadjq9Ps7M=;
        b=QWnpyksNSdSu/jOPtDF1zIbdkWBZ2aax5FQnrN63gRCOEiKOkwap8DOE/lATXcxoYM
         loJMOd8udASsYt9iuichpx8Y/f/7AyhjkksXR6j9sKnEKp/d/pUEw+ll49Qn3n0BeCxc
         RSsdNHLwhtC4K+UMgoem2l9hFxqAM2ezSOSL8HyMR8nydi3Xp8pupQLftCjlWLtetVvy
         6DG1H0jtTDKcfvFlM+E5F+95xZymjFKpzwtf/LGTYqtGDb1lS8P+lqOZDVkpU1NtSVWc
         VG9qyogLolH994XJHPxvQ5UhXyw1RZil9cJaVykSDZXlPg0Xy/stvDHzr9YOo2OfDfqp
         TAOA==
X-Forwarded-Encrypted: i=1; AJvYcCXbutpFq5kiBLR9Ebq41yJKky2sI9tceEqFXXMuoPS1ff5quoMbdSbBzzMLqwOGXG5UU0vCzKkEuDHRHicVhobEyD5RRQlbZOZ3WjuBog==
X-Gm-Message-State: AOJu0YxaX010Ekympwmj8Jvey0oUAZ8n76EkmOCxNh0LUx88Qe3D9Za8
	9BB0wS5Ebk1vze4n9ixsPNHJVGcbxjpqF8v6JxQU2jV1B1aAiCEM1oeTeE1QkGY=
X-Google-Smtp-Source: AGHT+IENFAK7IVpV/k8lzPMo9UahIiF1uHLMk0nrZAmjoYC0Fijkz3aInqbbeS6fxxaaR/xdi+aTqA==
X-Received: by 2002:a05:600c:b44:b0:424:784c:b13b with SMTP id 5b1f17b1804b1-42489e3ac94mr22668335e9.13.1719144029481;
        Sun, 23 Jun 2024 05:00:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d3basm105465515e9.4.2024.06.23.05.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 05:00:28 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: display/msm/gpu: constrain clocks in top-level
Date: Sun, 23 Jun 2024 14:00:24 +0200
Message-ID: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We expect each schema with variable number of clocks, to have the widest
constrains in top-level "properties:".  This is more readable and also
makes binding stricter, if there is no "if:then:" block for given
variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 40b5c6bd11f8..253e68d92779 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -32,9 +32,13 @@ properties:
           - pattern: '^amd,imageon-200\.[0-1]$'
           - const: amd,imageon
 
-  clocks: true
+  clocks:
+    minItems: 2
+    maxItems: 7
 
-  clock-names: true
+  clock-names:
+    minItems: 2
+    maxItems: 7
 
   reg:
     minItems: 1
-- 
2.43.0


