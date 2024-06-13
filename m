Return-Path: <linux-arm-msm+bounces-22646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D95907F02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F4812855AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 22:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504A014D294;
	Thu, 13 Jun 2024 22:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtW+pyUK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C7615534F
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 22:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318188; cv=none; b=JZu26vHNjVFIVCmlk9VkOJbXXD6XtJnxks6AcMmZv4bk8Ltt7B+Iaj1Hp9Dr8yX9NjdaWVPcvXDFdfYsGA7TgfTiRzp9bnktTsOXPV74tYOKOPmnVdu2Oc75RYDMb5JPvfAZWFM2mpgjkUAWvRdH6cPAIMTH0I3HlWuzQ2Jfiac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318188; c=relaxed/simple;
	bh=k5AxVBAg751483RoZdOy+nlKC8NcuvgV+fnhcffv2Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Naj31X0Jux4Z4spNr9VZScpDlXLxPRgriFxse4Gj1iRodEUSYOFZ/Y8w27a90dE4pu7ADUJ0/S9ygCvi0um4+v5+M/ABeakLjkevBM4o197kiSUEwZZZkQIioNYkIcGcVP7FV0bDnRulXXAN9IUymuhqr1MeCWeMt0NpazFEC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtW+pyUK; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so15668951fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 15:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718318184; x=1718922984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7jMEkdSEDz299yHKQKIQ1jrFL+ApUnOqabXFYC3R64=;
        b=xtW+pyUKt6KsgASysRNgI0+SvkXHR1Kx8pcCK32azvMbRv6MSo9tP3QD+R6OD381uT
         vC7MVtUT0Yhtvzo9ozVp3bijOtDllT5RkOXZghE+QB6EmIt+ue8KjVKq9Hp9gax2b1cL
         k1wUGsuAFd4hF/5RolZ81No1uaud8j1NpnJJRbAVCPj0iSj1ojoVfhEVjROzcXygh7hB
         QAHyn4+o/yaUzZf5MWzU440xm6eeFWn2qMNW9lrwSQmqPQ1Uf06FAS9x93Be2DiHqjBV
         Vl5YEE+KvIn+dlE8n2cLYt50w9PePLpskoenr/SApUS9fm6RKi45igqBci83ZzLBMEfy
         pL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718318184; x=1718922984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7jMEkdSEDz299yHKQKIQ1jrFL+ApUnOqabXFYC3R64=;
        b=YUcdx4pq1uSzQlDXiUH1fcOchDewvZJGb/CstIIHGzYVoxaLCxVnpGVES3CjRVqn8F
         8SJqfzBFa92zBbtkv4poHKhCXTliypsUWrqCXJLmTIfsdf5sFtQdVce/LPqEuA3oWNsV
         glkV3V2Xtj967x42z/AKM5eYEQ/HGGSOYGf9SkMyJOJ1hMfyAh5BMQHZMo2ObFV68JAJ
         Veitg2D1OOFZUeBf7wak6OvGuHN76GCYVwInTtvUnh45+kqCFogorn5n/Ec+zKRU7IXg
         DwDMyPCvl7uB3Jqam8R8Eb0rkhopS6FNDXAi/Z97KQ+TXFDN7ZLUQfZz55ad6GBirW2C
         Ro+A==
X-Forwarded-Encrypted: i=1; AJvYcCXkWO7I1cfXIq0Q0oCkvz8cU5lD4jU/M1Otdq6TLvpJi8q1U25jP01jUjlsgbOjF4K327R7lBTJwEt3HTGX5VrfS4iIHKneBhGp/xcpdA==
X-Gm-Message-State: AOJu0YyetmE0pkPJZOZJBAgYEhODUxXwe/lQE0bbKnVnmP8eD97fvQiE
	7MaKnSiV5BVfk35DAxQWfIrhUzJbc8j8Gj//kEP7nBpvlFraMt3vdttLBNGELtM=
X-Google-Smtp-Source: AGHT+IFgPLu1htnP2BmoSQebGt9vmn8eoCydTJyPqNrbYznyW63TchUlHfy0rHpjJiXh+A/1b1oLlQ==
X-Received: by 2002:a2e:7018:0:b0:2ea:e56c:f898 with SMTP id 38308e7fff4ca-2ec0e600462mr6546041fa.33.1718318184487;
        Thu, 13 Jun 2024 15:36:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 15:36:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:02 +0300
Subject: [PATCH v3 1/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-1-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=k5AxVBAg751483RoZdOy+nlKC8NcuvgV+fnhcffv2Yw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RlW49OCTPpG27+0A2iHGeKFky/sqczxDH6O
 H6UZukjW32JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZQAKCRCLPIo+Aiko
 1UlbB/99EudEEatLMPGrK0OVB23kjtre2i0vranT3Ug9A2So+6arY6Mc+OqDNo1nh0tbLgH6Iuq
 bzI8z4a9F3qBS2SXWbWXWacjMsA2L7Ot9qMVc9Y222EIsFho8e8jZBG0L+7bQ0VCeemUt0TNab0
 jNW7LlCCXNxDYngjhj2WOKdwYB1hgKn02eLQOelFo+184NQWQNV752fbxRHT5DQp76fq+8AaHEp
 w1bLZ+RERCUt6ZhWeNFWJfdfdysa5mneSQl66WG5M1mf8hhR6nyQZ9dRRjPaIm5PxAdUqQBa45O
 Y2GH1SEPDeEXMDXr7Y6RWjRHCTDK58hY/gM6ugOYJv8eg1oz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Make _dpu_crtc_setup_lm_bounds() check that CRTC width is not
overflowing LM requirements. Rename the function accordingly.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f2164782844..b0d81e8ea765 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 	_dpu_crtc_complete_flip(crtc);
 }
 
-static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
+static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
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
@@ -803,7 +809,7 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
-	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
+	_dpu_crtc_check_and_setup_lm_bounds(crtc, crtc->state);
 
 	/* encoder will trigger pending mask now */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
@@ -1197,8 +1203,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (crtc_state->active_changed)
 		crtc_state->mode_changed = true;
 
-	if (cstate->num_mixers)
-		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
+	if (cstate->num_mixers) {
+		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
+		if (rc)
+			return rc;
+	}
 
 	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {

-- 
2.39.2


