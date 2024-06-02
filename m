Return-Path: <linux-arm-msm+bounces-21428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4BB8D785B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 23:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C4C31F21341
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 21:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86ED278C79;
	Sun,  2 Jun 2024 21:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GO+byoqD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A637879B7E
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 21:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717364400; cv=none; b=IKjobkVLhtl3sk9emP/SdOzLQ53tVoDvBFBq4C0moU7wM4jXqiiBuoLRP528iYslx5xd3XeayQhWCSxEC27gSwBzWqUP0prBuh7ipi4KZsg1WpFam/BYqbbk2x40wd44P6un8AihPh7GKeGjb6y6c3UTdwPRtTDZKAZpx0zPPBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717364400; c=relaxed/simple;
	bh=fxq7vANQU/H+21S6fq9RrLi0S38AJrmn17I2cOqu7a0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pjbTBWozEpYXqCj/E++Y8pKnZhTtixH3gG1jqe7WrVVPgIuujySj2/uRKuAIMjb3BSnoNkpt39umVB7xIMU+Y/cgqQ1s+fQuxeXftsX69JHUzSamh7UzJB5BpEErt0LQIb4TWqLt5IIfsTNOE/lf/sdWKoPkXOC2VNTdKoZ7240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GO+byoqD; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eaa794eb9fso12606361fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717364396; x=1717969196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUUdtGcMBRz5mB58GbECTLRyDS/sCIhf8D+cG1hOc6E=;
        b=GO+byoqD8nhF3KhKSLeqZDIX9QYTElghfa4YJEJcAbge8JIs0nXiNfEsOWZLIR98pO
         5TlguJMMQGGuKuvy1eBZSVYYwZLvRM2meKYBa2AUqbmXj/jO+Tvo2Fvdmoim19+yTUSl
         65bcqKnsrpSWsHbPChWRixPp7RWGlw0Alfy+siMx83ucuFfq920u1IWybK9ZbAvMsjOs
         7uKWv50mxZB6wPP4ZWmuV6maBCH0VPhcmkss+ENQqjhsty0m22Db5/zrV3BNs8KEkZsM
         GYlTry3ijlrRxOw/U6vQmlr+g6bGECZ6ZbSbPIa9gTZKW+lgTBkFo3OvuOWB9qtU1fwC
         I8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717364396; x=1717969196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUUdtGcMBRz5mB58GbECTLRyDS/sCIhf8D+cG1hOc6E=;
        b=GjU/uWB/zKJvlTf7t0GAhKnuODr3HdciWkntC44fOH7dSfoxLwZTmSm6UF9SuFsz+4
         QfE9V0ZGCuwwfXv5hYIu0+AIRPYXQrYbOLDt6pSCuCzfqKdOw4gWieKhY0LmoxMVcZw2
         v3Oy0KWcPQAhwpE/61CDrR5okiagE++kgW9d+AF/TSvizZZFHjz4Nh8nRlt5cdxjnmwL
         78VRGp+H4MbMiWz9htvK3ctvfxN+L0nbFKxGkLcmwlfxFCGZO0am4vFVErVT/y6K678w
         pl3W9Zed8zjXXcyFXmTpHduk1kFV+01nd6wXNdgdrTl6URDvmIiowp5ULilDglb4V6/4
         qKSw==
X-Forwarded-Encrypted: i=1; AJvYcCV1ACImWUlmlgwYQOwNfdZ/tozJdJf+NRu8gfAK5gupjYe/ImUIvwFROSK8LjUxNbAMQjA4VGJvmU48aI/TQCQQB6Vp4B3FyrFF5PV7qg==
X-Gm-Message-State: AOJu0YzwThsgCjWYRJVf+1P7vhKr4igldhL3Q285KsFrJKAmWVjK81V3
	Xq0wqHYECk/aO4bd8nhFpayFf73pkCUa1AP79YvYSWP4sH+I7Wsm6OPrXQFpXNmOIrOnOGasTHg
	Q
X-Google-Smtp-Source: AGHT+IERKRhebLd0DtZWfojK8IucTmKmWzvBp99C1cHcHY5sB2GB/oyBCAAz99JJzRgoGrv0DkVShw==
X-Received: by 2002:a19:7508:0:b0:523:48f2:e3fd with SMTP id 2adb3069b0e04-52b8956b5f5mr4551111e87.16.1717364396401;
        Sun, 02 Jun 2024 14:39:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:39:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:53 +0300
Subject: [PATCH v2 7/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-7-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fxq7vANQU/H+21S6fq9RrLi0S38AJrmn17I2cOqu7a0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOalNHFtJfQwnpk7w7QKXCOSLvuRdnL1hc3VK
 9mBYppZ23aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1VUwB/48+an/TqOGKy4wHXt7deIegErq3Uk6r3EcdLqx4Yeh0/2cEv+vkhdfgAAzHwyoFl9srKh
 fnDk04zzpLg6mCwOqHn+KNkq33EbVjt8QgE5WV3/c1kfoflAqswrtPYTHGsy8bBv513jKaXC+K/
 ZlPXB5qLHpOzAIA9YL9ASp2OPZf8xxexoiPgMzu/YYq9qGssUaOyBG+uggIeiOwLROsrANKHx9z
 S0LqqVkB2tfhlB45gqEztPnzw57zWSRPCGAK0ST2vAwW3pf6r0P+t/70Gss95q1LK1hMdSVFmHD
 nqAsXsCMpVbYoipvspdq9WTgw2gRJ7iQLF3cC0rMgPRJ+GoE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Check in _dpu_crtc_setup_lm_bounds() that CRTC width is not overflowing
LM requirements.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e3b1e5f55a92..c5e874a3656a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 	_dpu_crtc_complete_flip(crtc);
 }
 
-static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
+static int _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
 	struct drm_display_mode *adj_mode = &state->adjusted_mode;
 	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	int i;
 
 	for (i = 0; i < cstate->num_mixers; i++) {
@@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
 		r->y2 = adj_mode->vdisplay;
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
+
+		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
+			return -E2BIG;
 	}
+
+	return 0;
 }
 
 static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
@@ -1195,8 +1201,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (crtc_state->active_changed)
 		crtc_state->mode_changed = true;
 
-	if (cstate->num_mixers)
-		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
+	if (cstate->num_mixers) {
+		rc = _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
+		if (rc)
+			return rc;
+	}
 
 	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {

-- 
2.39.2


