Return-Path: <linux-arm-msm+bounces-14050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F39B587B586
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A82561F22A44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19028BEA;
	Thu, 14 Mar 2024 00:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rcLSPhmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D54C96
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374542; cv=none; b=egndeoshpupAHqciYi+5S0+GrJSD8I8XIlwV/72EEY3W3jc9K8ORYql1teEvqC7Cn1iLkRYmcjIrIORgD3yenaDlAj7OazAI1/A7YL8IPQDk0+gG3bYaI1en/q4AulJ+Ic/QiNORCJGo6ugfAFVahfnYv3UK/prU9Cy+NSsqqC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374542; c=relaxed/simple;
	bh=0syM6MsQMypRFGFHFNL5wKa4GlrUlRZdqzFcwD7jVoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HjiuaTGQJ4Ta30xwTQiWn8nDXUMcIMJXkWP0TUkhoa0e3fN59TUyCAaHJGQRl//x78hR1QTRu2TLeg7w1mEDoQ02CWaj/7YT1S1zqG1RnDOnWOqBxzlLXNanTgp2w8wZAryL28vlcOyRRtFtS/dJRhWrtKby2WeE1FPlCwvNQSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rcLSPhmW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513a6416058so692542e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374539; x=1710979339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gj3lW7SJBVxAjQYikbiu5IXfqO7a39lu/HpAURIlMqg=;
        b=rcLSPhmWwObEZk+XA3leupFMQtIHVQw1Bih0gtKjsIQwWEueB9BNQahD/OujG7xaop
         S3AJ+c4ZC4O+gCHEI8oorBnUyA/LauKSPiICQRJ3A4Y0wTK4Oho0w26BAx1epb6gFsSL
         A3u1tFgvxP/LvgAOTY5SV8YRx2CsiWIL4EagiSDlQc+VUCwFjX2d3azT6VXF3k63tyta
         d58NBXXic7MLA6noG9YNIdsGQmPDMbvqVb+tPR9+JoXrO5pUmJDGLwY5SZUp5jikaCqw
         psTVY368mN0gvT3JcR9UdK6GazuhIKwWSKQpQveJHTSHyh5ue/aKPygZo5y39CZCPzeP
         UIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374539; x=1710979339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gj3lW7SJBVxAjQYikbiu5IXfqO7a39lu/HpAURIlMqg=;
        b=xSdV3d0FGEPBUo78oZGpEuPci4OFlguFBZaYsMGKIS1aD325vPxF5z6ZuQfoUa0CJd
         6DhujaSWL+8LGbmPDIGMaacDnwVtmZTuhNWdEGg0xEEtK8/QiRt7nLR1zdIfglsKZ+p4
         R+SS1NOs+gM+A62HGk0HtyxxJLOhjwFaa/mf6XfM6cYachprCaHRYSANyqDt5EZVD+sa
         Yf2/j/NbMLIkm9q+8nP98A2c3brU4kzR4IbcYULVZHqQCJBSoLuhvQfNqLiotT9aNYFQ
         uApTLeYaGFFhZIku4CLRshhdMYr7KgYi8h682IggN9v8Dk/fPsepVtslOWIcPp4R0nH3
         I41A==
X-Forwarded-Encrypted: i=1; AJvYcCUIfXUbzae+GLremQJeqsA72tJIoXarsm5PGljM3a2F9GRL4B0IOS1cNS5SArxADGopZzch1zJ3DX4b512zfR03xjzruBi58jHLoJtu4A==
X-Gm-Message-State: AOJu0Yw+dmtSzZmek1ILgGA1kVM++MsDHyEY4S4bJ7c6QBVe/jFb0XBX
	D05zCS06og6Edd79nPrSlVwzRYIlwNkvn3a7alwsAl+iDl+yseWfajcCF2LE8ig=
X-Google-Smtp-Source: AGHT+IHvIoBT0iRAcOZiJAOvlSC6Oas+0qwTlsWhsEbNCVnMb3zY79S6PeoK2c0PRRLO+zTIkxwkcw==
X-Received: by 2002:ac2:54ad:0:b0:513:cab1:354b with SMTP id w13-20020ac254ad000000b00513cab1354bmr37991lfk.41.1710374539020;
        Wed, 13 Mar 2024 17:02:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v4 01/13] drm/msm/dpu: take plane rotation into account for wide planes
Date: Thu, 14 Mar 2024 02:02:04 +0200
Message-Id: <20240314000216.392549-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Take into account the plane rotation and flipping when calculating src
positions for the wide plane parts.

This is not an issue yet, because rotation is only supported for the
UBWC planes and wide UBWC planes are rejected anyway because in parallel
multirect case only the half of the usual width is supported for tiled
formats. However it's better to fix this now rather than stumbling upon
it later.

Fixes: 80e8ae3b38ab ("drm/msm/dpu: add support for wide planes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ff975ad51145..44f35ae09ba6 100644
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


