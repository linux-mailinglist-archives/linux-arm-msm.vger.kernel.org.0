Return-Path: <linux-arm-msm+bounces-14517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF587FEAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 14:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA1502853BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 13:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D349980633;
	Tue, 19 Mar 2024 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VpVkE1qU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CADA80627
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854531; cv=none; b=RY7j5GXaG9xVRtophPjRxS/7Ac9k3fmhqxmhZdxK6GWiHgGnA+CiQIHT1KaxxHEHsnBJcZNTtEsfRfpO2pNCJllSnoPigNiOyzYheObpGWKgeBtPDvkmVgmYQFSbFBiV3RK9ImR1SLzD4HtSLf8b7fPS/n9jgFZFeqyzv4LkhIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854531; c=relaxed/simple;
	bh=3qmqU6bSN0cRP9BWJnA7iPyjYtQle9jNYPKUby6bjiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipH2c5ziub9030N4rNuJFyCcde+LdSHLvgxVXn8YJTokDnvbECxpfIVJUQBTbJwLSvKO1rmHvTl1sNbwD7s/XhHptG+0X3yOBla0BgtbkRrAgYmOBxElbOgJsmkbe+uOX80Ga3a9EBmmVkpjDbBuMu06L0lLgzcTRAe3TGOu0n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VpVkE1qU; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d4979cd8c8so30649441fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 06:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710854528; x=1711459328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNAKoiDHewNcwvkzDamm6bm6LBy8ay/1mKzk8jCSgik=;
        b=VpVkE1qU9Yq2PX2alavorY0XhyE8bEPzqI3YxwGdgfhrEp/K1FfdQPL2BQAw1ZXALV
         fOPS2VH+Ytm+NkbiKWQ4/eqbFngosS0xNPRXatukS4b3GwqwqRqZLXKP9gFx0N4j0aUN
         nirEaRfPeVmUZhkKGQbYWgupik2iJxpShKY6GiIawaqjWejvutN9DBmCUJ+DuG9ezJUF
         Dlpc1Hj2mi1ep542UyBncWV7ww0GirXte2FVSMLYQKvZcf95sQpPth63FZKdarLtZuAh
         Kqv/EeglVpAbuaqBD/PTh+e8kqqnEnVYkvfp9gLM5kyQBRuiMfAA0HY0wkRRJsOpqJvy
         Mx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854528; x=1711459328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNAKoiDHewNcwvkzDamm6bm6LBy8ay/1mKzk8jCSgik=;
        b=VMdXllMBYTwDQGHoIdxAAkCTRyR4/u289bDhLzmLtRbVt9T6dX3QnjlPI7FGA377MT
         uyFbJnK7qS5+MvKUZYswF8fWL6e/KnHna8E0qiFhRkaXnonbxMzgjiUIrBGnMk1i6JwV
         ArCg19IFe+ntNvZ4GB3Dtpl9MTR8q9dpPorg5zdy6hhJAQnroaP0MCSxrw7ctEYArfXj
         +eDiKo2Ep1u54qviGdJw8FLHM4b3hlnwMhgFJ+xpcw+sdEUKJhfMoj73cRFYigFEwbhR
         BkKyOHWAY19MmGhwM+XWZ5zDN5RSAkFVTqNhtFLEQKFFyxtV8tJl3+gEU6w7ELxBhAZw
         kGhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2O4NbFCa51HfbB0zdTUc1lpizTbHBFMlliiJTDiW/PA1NZ9+BN9A1MyZWCcntGpjacTcOqmSUhP5ZEwi5SXYp12M5opcAt1l0Y8gbSQ==
X-Gm-Message-State: AOJu0YzH5Dg/AUmaxaFYZ839yQHMcsSl1Y+eRtw1Hog9VP0xKxc8P+fv
	FN4aTg3Ny4kGG3kY4fiBFg3c+PsF4ZqhovRoB1aKhNCvd7UMNsNdw2LLjwk+iEXKUKLXPb2SD0T
	X
X-Google-Smtp-Source: AGHT+IGa1lacsRP3poDQ2kM+iUBKGdvnsRXaJcUx3u8Mbmmxifx6l0Z6sDcpXYXh9V2xDGQRRGj5og==
X-Received: by 2002:a2e:2e06:0:b0:2d3:17e6:3b4a with SMTP id u6-20020a2e2e06000000b002d317e63b4amr977739lju.23.1710854528370;
        Tue, 19 Mar 2024 06:22:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:22:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:05 +0200
Subject: [PATCH 7/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-7-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
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
 bh=3qmqU6bSN0cRP9BWJnA7iPyjYtQle9jNYPKUby6bjiA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+rPiRUW0/52N5rue6gUIPaqUEw9ofQaS7twUuvWyu2ps
 fsZXoR2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAi0yQ4GBZyCyWyNrNGR53z
 tbnWdmNZcsWFw7evf1nrpvl2QensCy9FpNxMDVJ/8M/cs79JYZaZ3MfXx/muTlXwX8Lgp1XCcub
 dj6rJu0oSzP6zsgT3xvrXmU+6odx52ULBKljDVuvbpvhpbz8aH1aPMdt0OVh9Jv/sh9Fdqjk+pS
 Ff0y5be+zZG75of/kt0w67CWf/T7h6oaxotpvvt7ob4e/04nfU6+3f9fJGjfOyuEeHXrRdW/mEW
 exFMEvZ7soCMfOIu9tLZGeX8mbvKi4KCD71qlO9xqzGLjenWn8lwxwuJ8H54eoC/EJb/qvk+jie
 +Lw6+sCWfYptlUa7eb5Evt1/RUYrwUlIZ0WS75n5a5wEAQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Check in _dpu_crtc_setup_lm_bounds() that CRTC width is not overflowing
LM requirements.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 64befead366f..2fc1c2729bfd 100644
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


