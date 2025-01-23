Return-Path: <linux-arm-msm+bounces-45984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B25A1A480
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FA11161408
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4AC20F985;
	Thu, 23 Jan 2025 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WHVxIlhQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CFB20F07C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737636303; cv=none; b=blpTNu4V2uyYzAigxg52LAK1W8BmGjLGP18ybxkPJIBoWMrgVwXiGNbjVCkwWTQVWbzrDFUoKd8EJv/N5GZkqdTp4b2ioNkOofHbQM/+YgiVe4FxT8GZHb3qzLvsXKzAJG4j8tao11g+tkRiI8q8W3kEjsgNmOUA6Bgp3zlnbz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737636303; c=relaxed/simple;
	bh=6FHiK9uSt3de2pV2Wxfa/Fv4p/tQ6hl+nIDAnUNBki8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NV52OGZA3o2kQNlxZRNKr5lHFgQkbEAvp4LM4bIV5vFjukgxUY/SC7Rht/QmnhB27qs2TqoZw6zB4ui9I6GwkIpHl/4OkzgRggRZsAZjh9JqYa24wdQR4aTBQJ1Au1GByfvpp18+Eb86bgjUjx0ONLxSLMIKMQnDq49awlLwG9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WHVxIlhQ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30229d5b21cso7824111fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 04:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737636299; x=1738241099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWl/mrUuu5iSDDnMWnDf6mIxagIYPOHoQVKnYJ6xmpc=;
        b=WHVxIlhQ3JalS9LY36KZseOgmYa7vhDCLx+AKGWG5yphHW/MQuZn7mIV4hNmu5sXVj
         YnNpF1G6U/cT5nnnVr82OmWWI3nmHZGP2y/FA/vt0dUk0hnN2QlsrBneVw5biCrHF9nw
         pxF2nxWiP4T2w9fJKEFa3TfJ4Ziyzbjz2LuFYtHE071Xd/NHqJoBkozhfYna9EFcj6y9
         eB898egghIodHWls2uUbfl6+W4Z/idydt/nrNhLzdn9csWNDWWIdbvRH80+DBNaNUeR+
         ru2MEIDiNK8kT+v5a/XyIsnWSFx6VT+Wh10zJMBaw9EqlYUkpPdxiXx1+oK/cyIh7a28
         pO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737636299; x=1738241099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWl/mrUuu5iSDDnMWnDf6mIxagIYPOHoQVKnYJ6xmpc=;
        b=oVJOKWZicApqNwzLji8sW/RLoaVoI0C2X/P06LLdCc1gpsHVWcRBH/zIxrTqYxES79
         JBP8CF9GZ0pGrsDFXtTqOz/btgA/cDvURl5HmhOv9Ijz1coixaD8Za7yaQNH3fZT7PMU
         vOf3RSbmPlpPTgrLeZe7X9K5c1L6WntXR9DEmYZWiWtk6cbif4xkcH0p1p6E/zCKmmS0
         1yaq5nQhuUypGB66bzA3XsZCxRRUSUT2tgUqlhoNyW0vt2TMTN4WIo219NsBUUtnm8I+
         AfYugU4rx76YIdjxhmZGOgsMPUKG/JTO6cDCqn6HuJqCBsLCB/iYGue5cS3lqFO4dgEy
         T70A==
X-Forwarded-Encrypted: i=1; AJvYcCV/flbi1ovpUjBu7z53CV6TPqJImcvp4lIHdjHBfofN6AwqTfecr2i6ftQvycN9gIym3vuckqGJsJqe+xKu@vger.kernel.org
X-Gm-Message-State: AOJu0YwNzzaeN+/lrLJlwgZCBlGt36nakDdsjAbmCKX/HQ2rNXJKfs4G
	GqCO8QgaWyJk8A2pXs7qBrJv/PMvxro8OGPG8b22m9YbbastqsVHjg5cgHWYl9A=
X-Gm-Gg: ASbGncte6Jpy1enSvzDo3QrdEJtHzA1p5Yrn7RxLnZm3cTPe9EkSeUVJ/uNobupL76s
	k84QDuO8QvqWkindRJsnHM2kpAOxPKYYfn5lkPoENyk+oe2N3ySyvT9lzT682YrpXddOoVNC1Z2
	sYelRBqs85VqQUom+/L8lInoN5xs/SIvProBg+qB+jEtP6tktvLy68TA4WGqwQbpJWNnFpNDYEy
	uR/OhghLhuoP8goctQVy8FlUCEKg0Hq+GOYQS8fTLw3vzlKFamuy/lEu7cdGnTd47NIxD/4EPag
	YeyZQu/wJt+K
X-Google-Smtp-Source: AGHT+IH5IcSIZSra8LNFX06NTWLQF49L8vuXLlXRQh+G8XpZMvxMtaLUd8nrGDGk8rwkOVFCuslUyw==
X-Received: by 2002:a05:651c:b0a:b0:300:31db:a77c with SMTP id 38308e7fff4ca-3072cb66636mr95637551fa.29.1737636299239;
        Thu, 23 Jan 2025 04:44:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed6f3sm30351661fa.86.2025.01.23.04.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:44:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Jan 2025 14:43:33 +0200
Subject: [PATCH v2 1/4] drm/msm/dpu: don't use active in atomic_check()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-drm-dirty-modeset-v2-1-bbfd3a6cd1a4@linaro.org>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
In-Reply-To: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2323;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6FHiK9uSt3de2pV2Wxfa/Fv4p/tQ6hl+nIDAnUNBki8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnkjnGZW1iNAEucAxcOXqyOyw158iAcmY8raCT8
 0H4hgMFpe2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5I5xgAKCRCLPIo+Aiko
 1brHB/93op8onAUXr5fU2A91buXHuSnIU4NV07hLC1vcebijvhJa1lT5ijFMMW5lkFVva1FJraK
 lTMyHGLBKOQVPBInM0u4bJPw23lqTdKT29bvGzjNNqkVjTrQFlQ3jlqGWBVqkqbLC8tEdP0oZlz
 eHJtnIddkK/uiP/gugYSZysBeHZMaXbYGczZg6LzXAE6ZIOiwVw8f5eIPLnYExHgLSw+qrHo4fd
 vo57FzUtE7M2eEEtJzTKaiDKfDVuEuLVjPA7ANYeNi7eUmY6tkvVo60tBnB2VvHPLlmGcewJG4M
 gg6BZn4vxqTEFxE3zWgCnOtwraczzavKlUDfWCb/XymzDNhL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The driver isn't supposed to consult crtc_state->active/active_check for
resource allocation. Instead all resources should be allocated if
crtc_state->enabled is set. Stop consulting active / active_changed in
order to determine whether the hardware resources should be
(re)allocated.

Fixes: ccc862b957c6 ("drm/msm/dpu: Fix reservation failures in modeset")
Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7191b1a6d41b3a96f956d199398f12b2923e8c82..65e33eba61726929b740831c95330756b2817e28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1264,10 +1264,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("%s: check\n", dpu_crtc->name);
 
-	/* force a full mode set if active state changed */
-	if (crtc_state->active_changed)
-		crtc_state->mode_changed = true;
-
 	if (cstate->num_mixers) {
 		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
 		if (rc)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5172ab4dea995a154cd88d05c3842d7425fc34ce..9aacd3b5bcf808c5712bf797a48484e297386c1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -793,12 +793,11 @@ static int dpu_encoder_virt_atomic_check(
 		crtc_state->mode_changed = true;
 	/*
 	 * Release and Allocate resources on every modeset
-	 * Dont allocate when active is false.
 	 */
 	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 		dpu_rm_release(global_state, drm_enc);
 
-		if (!crtc_state->active_changed || crtc_state->enable)
+		if (crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
 					drm_enc, crtc_state, &topology);
 		if (!ret)

-- 
2.39.5


