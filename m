Return-Path: <linux-arm-msm+bounces-24379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BBC919A07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AC261F2281E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5701946CD;
	Wed, 26 Jun 2024 21:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/gVDU1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2404194132
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719438370; cv=none; b=Q0nIlsPV96wiBdMat42doVwR8r4byGrc8iREghlr/92ZJk2qubWtFcaGblleyZzDmlKuVCd75Ymb/gW77wy6zWrjuhP8zWd50C1kAsd2xKNl2Ls4Nw6Dd75V8PlF/LCdnUkD7Gj7XtssM3OvQXvb7Zy85w7Qmydb+L66WpqFKXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719438370; c=relaxed/simple;
	bh=/RuCdxaOfzUqrs6fOdBxa45FoG97EDlhyPdr1MkoBOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3pApPeq0f8wDMy8s15v3rPJ4QckbjpIfKDypkB38vuCjusJI2h6Fid0SpMi6kkMlSzP57lFfcz7CM8p5wqGxtSbKABuwLaKmHBKxdwBz+Tx21UeTvzdvv5/glqs/2DVIt3C4SLI+zFyz1V8ITWlCWhNqvtLJecooNw7z4QNM+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/gVDU1T; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec50a5e230so55174271fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719438367; x=1720043167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Y77eGqbRKhcTZYOAFZtERWR9uOufd9ItYTSL2OCah4=;
        b=V/gVDU1ToHIVVoTnZCKDGap5iLdF4yhnsl5yGJDhZLRx8XezWoSxGGFtqivjIhGoYR
         jh4ZRfePej43FH2XBcl7VOETQCjopqBrx9Yf1ZaJAW/9HJCe5CX8F67m8h5oaiiZieUJ
         hFdjAO2CWnM4slMNEe5oJzv6Fqc4cIeQahiOGEs0qyKPCTyPxRa3VJYlIWBFNdJWnyLG
         PQsm66aNWSs+m7TNGhDY9/S4GS6HmaH01kUnQSku5cMfNy1atOEVa3WkFIMvfvB9gXxE
         DfiYynU7xuVl9epg8yJONsvV77zGqxt7jNDiEonW95JxmOoTTSXU7mjdVfBqt2EgC1X8
         mpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719438367; x=1720043167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Y77eGqbRKhcTZYOAFZtERWR9uOufd9ItYTSL2OCah4=;
        b=EN1LsbPNfIA4Ua8+qD1WicpgwbjQNZ30JKX9epQwi/lFju3meB9aoxpYP4fPiz6uhb
         3rKSUHwFQftt/1XiwqiAsRJCvLvOZJ5tzPWHybvbPffXws3E94GHQHBbW6xGiCMwZ4t7
         MnRGP3FIoj3BzNSms8b63FyFICqTX0ohi85OmdRp7CaNnKACJAbgnfQvw4xXSNz8+xZ1
         3rbv51fXkTJgl/wzNkCUo1AFdReD/kqDoFqz9NooasnZhFc9y6N5lBV5u8a1AIfendAD
         IIslfBhmWkp8CSTPTrNq3Tvv2udY9EXiR1mHs9CCoZNhvXQsCmQN08bowHKC+aPuwa+m
         Xn3Q==
X-Gm-Message-State: AOJu0Yziz48+906rj2hxJhN3Vyd3WDfy/6Lj6gW1hTtoiXrBnmlcz0sV
	NAC6i+dSaRdmcHOQ8y9m2cLFWraTD4TDUngunEEUjM62MaezWIEN2wijV4Gt8Jk=
X-Google-Smtp-Source: AGHT+IHl87h5y7BdQMiyGdU96awBRn9SsFpVAPRjKIFrEljr2L29AbJFfqLCyOki5HDhIAa3XymKYA==
X-Received: by 2002:a2e:9f46:0:b0:2eb:d924:43fb with SMTP id 38308e7fff4ca-2ec5b2dd3ebmr67752871fa.41.1719438367129;
        Wed, 26 Jun 2024 14:46:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 14:46:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:45:59 +0300
Subject: [PATCH v5 05/12] drm/msm/dpu: move pstate->pipe initialization to
 dpu_plane_atomic_check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-5-5efb90cbb8be@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2729;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/RuCdxaOfzUqrs6fOdBxa45FoG97EDlhyPdr1MkoBOs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pNj0RGbgkjszHHxYVifTesr+383jQrxWLtGa4H3kt7X
 03/f+dkJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm4ivF/j+7TODFSobtN0Lt
 Ff7LLt3lv82IJ4p18cqdB5q9nSZ8Nv8soXk8U0P1YIZr5+HbmVrdX5d7pDLYXzWodc8XefXi5bc
 n2g9vrSnw+/0s2HXvLRfVpALtre7p/g4ti6wP77s16cQ7HZ6o0wcM3ykWNZXOtD0zfcI/Jcmba8
 LtEqdVFN0SSH6pFcWU1hH+SCSeU+2pvWhUcRGb8Aue8JBYjk9ZIr5/jQPfN79N7zcuLlbTf1YV/
 XXiIb1wowups240iTFds7FRSlvnuOXo//m3Jc6/aZw4/6lFUpC34r1vG0IqopUffr/Hbc98UO98
 e9DfkO5GIceSW7G6KodEZzi/1xDLe3V8cojXDUOxe1sbAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In preparation for virtualized planes support, move pstate->pipe
initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
case of virtual planes the plane's pipe will not be known up to the
point of atomic_check() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4abaf2bb8a08..325af392e6a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -805,13 +805,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	uint32_t max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
-	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
+	pipe->sspp = dpu_rm_get_sspp(&kms->rm, pdpu->pipe);
+	r_pipe->sspp = NULL;
+
+	if (!pipe->sspp)
+		return -EINVAL;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
 	min_scale = FRAC_16_16(1, sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
@@ -828,7 +837,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
@@ -1292,7 +1300,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 
 	if (!plane) {
 		DPU_ERROR("invalid plane\n");
@@ -1314,16 +1321,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
-	/*
-	 * Set the SSPP here until we have proper virtualized DPU planes.
-	 * This is the place where the state is allocated, so fill it fully.
-	 */
-	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
-	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-	pstate->r_pipe.sspp = NULL;
-
 	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 

-- 
2.39.2


