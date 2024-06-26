Return-Path: <linux-arm-msm+bounces-24377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A8F9199FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16D52B22504
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1209E194139;
	Wed, 26 Jun 2024 21:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GEhANpdb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAB3194080
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 21:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719438368; cv=none; b=nmADveIIBmBGCXf9CTHkaFb5B0JZZCMgrDkfpTz9jXLMrfQCN7sBVQ1I9HT6dql9kFcm+sYrwRvNfolpoYYjcoAC8RWxhPB6sScT4WxaKXeCwy1SaqLRLWv5wyVwfdcGednF8xMvDKPYDHYN0fijb38xIFh4FzruL1BL03eNmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719438368; c=relaxed/simple;
	bh=oZ0yq3Zy7nCQNd1WNthf0ukdXl1hN+VK6wuUcAguRdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LKH8Dm6wyeuJ9iYXL6RqjtSmxGBjeTc0VC4pNEgmT7rf4yN3bMzmvMzgqw6zeGoMLEyP9m4WBbZ2zIJTn0OIlNc21A0YdTQ0Vzoz+MM/jO3jyRf561++/GkSbkI/O7YetYrM+8xcCirs2XkVzjKFY8Oh0Bw8aTo4AJkvIeXgCOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GEhANpdb; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so80491811fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 14:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719438365; x=1720043165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+y9Jw/2GdJnbAqYZ072LCGScq8Q/W2kfxFZFo/y7qQ=;
        b=GEhANpdbhymBJOrUzBSYab+RkqTZ2hmiWCOeb5TZZDgw6N0GVoIUOMxp6Y9iSgoT2G
         J8VYcpeFcGn/6QTF2nVNG3EYo+MgrV34IOk0P3g0PGMXEKPhQCvPQuyQ0QrIOIRhK6CL
         cxkDaEVaqVQPDocg3KPyFO/jk9Om9NoJ4n+wCXH+o3G9vIESZyPRz8zzH8lo7wnUOUNo
         Bb99fMcwrdW1r2ZM6O2DQEtiozpdFIDmEkE6P6nNdjdO/4plHQMNY6m399znbAvzDxR8
         iaKD1uiY1SLNeZPAX+NPOj2eBa1IBob3KwvZBJwz4pjff30v9RmUW9tjW3+Nq+jwhTkP
         Vmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719438365; x=1720043165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+y9Jw/2GdJnbAqYZ072LCGScq8Q/W2kfxFZFo/y7qQ=;
        b=KAUyV1/aTcAKpHrBff6MWCjLT/KbI1VLNv1ZwMLLspds18XCG6vzH+XZliiH6qcU9i
         5CJD/pVyEj8ZPy4QQBdb3LgZU08OmTBXCVGiUcMz3i1N52xwzjVhyJduCyuu95gjVcWP
         2c0xfAFHCwL+/BrGTuimO+Cano6hsqiVg23AlWMMj83E82/MATZO1RyYlSybSnt0Dji0
         NPEfYmkcbnKxBb5wuMv6yYAlWz4+auMMX7SVjMCZfElLsA3axJLiuqw4nHASwpsaQ+Ff
         iGfxoCL6ANUyCUOnJYOSzuLn1l4USX9nL/MvXrKM83Cz0MyXCwV2ndNjtDhheSWy4Gp4
         0Osw==
X-Gm-Message-State: AOJu0YwaqcuT00JRijD+w5w1UTDL8i5uVK1lnxdryRbwJrPGnUXYT/F7
	8SH/NSH9L3BWdt+gTNN6/LjpIqF58CvpLAgjCXyRigH/BPNj5Di+wLl9O/FN3qlfGR6x352Rlti
	gUgs=
X-Google-Smtp-Source: AGHT+IGJn3uylwB+3ohJi+8Ec7D8w5JkByYi9a8I9HQib/s9IzApTpfrehCOchB3jirtru6/fxSTOA==
X-Received: by 2002:a2e:3009:0:b0:2ec:5ff1:227a with SMTP id 38308e7fff4ca-2ec5ff12384mr64301421fa.17.1719438365371;
        Wed, 26 Jun 2024 14:46:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 14:46:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:45:57 +0300
Subject: [PATCH v5 03/12] drm/msm/dpu: take plane rotation into account for
 wide planes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-3-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oZ0yq3Zy7nCQNd1WNthf0ukdXl1hN+VK6wuUcAguRdA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pNj4RDTeh68xSjxS9P/pE5fDh+kX+68OcVvGy+v/p7F
 34/4tzfyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJRDuz/9NxmCUb9DZPRp/v
 5/+6tOxFJx961U9Pfyl7usfqwvnnt+81cHo27uWNW/TDdmUSy9InQbJy9nuYfx2V5Ta//C6bPej
 NvVrm+l2v3TJuzP6WtGJtI3u3bvPJhtTzM7K0JPiX3Gi/tdBggdKr6vUx3+fO2nHT/EhOjpf4Jd
 Ec98V188sYObSzis5d599som5wturrUdYPsy5virBWtdLWsNDmPLfviNPkKQ4eB4vdlSaY8WX9U
 fHUbMncuML3wwn/lDtq3cLNEW3eEetWMN79olXceOOP6lPVmNwJ1dUPPql/6ApZ0ezhE9c64UiT
 f/WT7V5Nte6frJ//1ayLUz1hbtpW/zdzrnWMe5/MunOdAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Take into account the plane rotation and flipping when calculating src
positions for the wide plane parts.

This is not an issue yet, because rotation is only supported for the
UBWC planes and wide UBWC planes are rejected anyway because in parallel
multirect case only the half of the usual width is supported for tiled
formats. However it's better to fix this now rather than stumbling upon
it later.

Fixes: 80e8ae3b38ab ("drm/msm/dpu: add support for wide planes")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 148bd79bdcef..8f2759d16247 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -862,6 +862,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	drm_rect_rotate(&pipe_cfg->src_rect,
+			new_plane_state->fb->width, new_plane_state->fb->height,
+			new_plane_state->rotation);
+
 	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
 	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
 		/*
@@ -911,6 +915,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
 	}
 
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    new_plane_state->fb->width, new_plane_state->fb->height,
+			    new_plane_state->rotation);
+	if (r_pipe->sspp)
+		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+				    new_plane_state->fb->width, new_plane_state->fb->height,
+				    new_plane_state->rotation);
+
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->adjusted_mode);
 	if (ret)
 		return ret;

-- 
2.39.2


