Return-Path: <linux-arm-msm+bounces-56277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 655B7AA4CBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 203603AF50A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9145267AF2;
	Wed, 30 Apr 2025 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mo4DjTEP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C44726656F
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018092; cv=none; b=O5+Etb0ccINXpb+jKnHiXQPbF4nBNjnS6YW2Tbz/wV7Bq9dRY97cSRjg7LkGEn9Cm2SuexJreLdTKh78aOhKh93mR2HbqjgLnvV2WFZzwTDdp0CGCVZxa0MlXciJy1mFuPyMf/VxERwsXo6ceTQA6Ug9zTPgpy5ipCMJsnsbHbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018092; c=relaxed/simple;
	bh=rNPVbhB/QSRIjSYo9UdGRQ8CHtMBy7PxOxlH2MpHIDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QupPZbkQYF//YBExPjz1GgybeaDGDsm7anxSQxuDlMu8GcYFc+lCzU2/c7CulvnnADtlU2xANqVeSdSUCy9qAI9ucEYDK1XX9S2FcyOA9TnIiuOjrCqeQrWclenQSqz+GPnjorwJm9THbeaTfa3Wqoa5BDgEkKTkYTiutqro1m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mo4DjTEP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so8688565e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018089; x=1746622889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNTFOxnRPcZ6WhYGseWxY5vst5HAgaN+nMOkTX4NrTc=;
        b=Mo4DjTEPAwuuF7uIqxdPV0wa0/0apkmSwfHzCZ1Z5zNxIyuqXEee/he6O/6b7gB8cz
         2GdWxP4U68x0W+zlJt74cVhzJ9GR6J6Njb3qo3MKgditxmp7N6hKr7O7ybmlNDBkl3Ei
         u2e05m6vCRzolROHD6UKVLm7Op/vnFHSV8tf8xZ5IuTjeHYfPepq1U07GLBPKF+8zXk+
         68tmsblH4t9aZ56IJQutjxYVFJVPsjWcVdve5ZncffJpotzrv1XXwIiMDkOY0/8mrMnI
         IJuQFKDshvxNVvdUAWNVTlVeiGcNxYLV5T7+ARzbDuSpHcLKL558aYXjdrcgbfY9LD24
         sWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018089; x=1746622889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNTFOxnRPcZ6WhYGseWxY5vst5HAgaN+nMOkTX4NrTc=;
        b=YFNHSrBp/fY+4dfM0a8XGAyX6KLaSDQ06ZXP+DUN3YOkYMt9smYVFI2urHXpj+JqX7
         Z9kz+h0ZB3Q/xjergP8idlWMPKiEc0pevOVJVLW0NQaHn938XZoPcBEyJgsPCBeV/HKi
         CX7DKLEA+f/FIEY5p+aVln7GAbThObiln0YjzeCZvAXytK9N6ysBocgDB6SRcJPfl4l9
         SMdcCbbBON0TikX4bxsFChDGR0K6Gt4pZ2K1j//lZc8EZ2lyoFwru+LNDbt25gIuaBlY
         qtBQsflbr45SqJh/OEtctimhlE/nksbsTdIBfd8YKWg0k1lIjsNpI133lNrf6gvhPhic
         UByw==
X-Gm-Message-State: AOJu0Ywvxydm8ZIKf7uLbXY190i/qqn5/amY3FIFW4Mb40/qAT+a2yTE
	auQSxaqH6VFE2Gtsv5aYcEqDnPwYMKvBkdd3AfEWGvGeRRuKIghZHtuzN7NU0K4=
X-Gm-Gg: ASbGncv12tGXhWBDi9lMAGCK4DmLE5IAPwj0DcGVe4D6GgeHOnPm5B7OlftziJZVAjs
	/r4uBT+YrCL8t+LXI+O9bE6TpJw6rtuKO3BRheB3xe2gCqehfgfev8eAzkgRO5PNKK5TsleCg8a
	YhCG6Irm91b0Lgbik2H64y76JytpNIYmwua1dHBMjCeQzR5xWS/iT/64WluUYzpQtyLg5EQ5nnJ
	U40NuEVmIZLhB67NOlx5Hv1pzduJOllf5USjNfWPGj8KU8nnsedvV7pXPcCNYPcRtXNyOtVA8KI
	KgFVz6oyOf2YBqsMxHG9wLTULg/b5H/55s+vkPLxLVBw2JhNPbbPOqLlbTI=
X-Google-Smtp-Source: AGHT+IHlMZoelGJ6rtfEW34I9gDhC5o7c3KzV3fOro3gqzM9q65jvlNnMYM38ebtswKyn1TlcHWz7A==
X-Received: by 2002:a05:6000:2909:b0:3a0:7e53:b52d with SMTP id ffacd0b85a97d-3a09009a227mr815193f8f.15.1746018089253;
        Wed, 30 Apr 2025 06:01:29 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:40 +0200
Subject: [PATCH v5 10/24] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before
 blend setup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-10-8cab30c3e4df@linaro.org>
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
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rNPVbhB/QSRIjSYo9UdGRQ8CHtMBy7PxOxlH2MpHIDo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh7+xOav7RjOIgw1tKTvRgYi5MGUr3Nvn6ffF
 DktegQym0WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe/gAKCRDBN2bmhouD
 14V2D/0cEjo50TqGVwh5U1oCpUGPuNxeiJf20wytN6G/FP5xGLDBYyQ7oqUAkRA70Q2VAFET4QC
 s+r0nB/xg5qYov+QiLpFla1T6ofO8FHse7oWNZNqjjb1wy+CtOgndE+1SnuR0vbIdL9EkO0gNaR
 x3CFilBosicr9qeDWRFq0JNLO+KIm+IpbpgTbAw2sM+YU/cJ3/Xfy1ZfiZMiF8JcRaqJPQYLSXb
 OGSN1epVnBW7lbk8gNl2ffS93CjKEYZiPrWnQOIRBIiIoL/q9Y9t0uv66Xtsm9UCcBDKNAFr6kK
 Mi03YIqJ25MVTZnx/cWPvQIw8ky1JVM1JsMIgvch462i99sla9M+6EFR0Rig9HjiKeWg2aAysP3
 /29IfyYKxr72bFbrrtk74jLQE3v16+44KYgZTeY8+VCCxNCqaI85xtbPxAnU+3QX9CiWZ1AC1St
 pa4woR/a7oHvGT27M+8LUP2IkwKWYuGgnYMtM8azy0TSbh7Z1nuJzIEt63BuqGCcDVO0MzLXzDb
 0fv7p8O5peB3moQFv4xfb0ow6N/wIbjCBjmYaehuRINZqpfCAKvTQlL4rXTT5Y8mAeZ2yCrKfxR
 3+FMPLLN/NuWI8c8yghMzsRyKiOHdE0vTetXcVskI/eTULK2ZRn08umdqtc11PdfsmGTIzUnyHl
 QKTkmrEPpaQNMmw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Before blend setup, all existing blend stages are cleared, so shall be
active fetch pipes.

Fixes: b3652e87c03c ("drm/msm/disp/dpu1: add support to program fetch active in ctl path")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2d7af6fff2708c12520a78cc6c979b9930dffc95..a4b0fe0d9899b32141928f0b6a16503a49b3c27a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -519,6 +519,8 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 		if (mixer[i].lm_ctl->ops.clear_all_blendstages)
 			mixer[i].lm_ctl->ops.clear_all_blendstages(
 					mixer[i].lm_ctl);
+		if (mixer[i].lm_ctl->ops.set_active_fetch_pipes)
+			mixer[i].lm_ctl->ops.set_active_fetch_pipes(mixer[i].lm_ctl, NULL);
 	}
 
 	/* initialize stage cfg */

-- 
2.45.2


