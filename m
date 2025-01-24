Return-Path: <linux-arm-msm+bounces-46076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF54FA1B48A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE18D188D015
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A99621C173;
	Fri, 24 Jan 2025 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uyHm/SHz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F61C21B8E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 11:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717282; cv=none; b=k54Vjnc2vyjKFo7l575/tFWh8Mp31M8sqqrhXMteYDxGI7XNyuSqQDlI0TIBvEiAoZ6n+YGrxK6AU6YF5RzjrJJr6JKAcQ4yK5bqD6gFGuuTpWTfNTV0F3Mr+r8dcbA4szVqOvkylFThnqQN6BOqzHWN0oBNluzA8tM5g+Pv8jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717282; c=relaxed/simple;
	bh=YiER9uGGuMLloEwX06ETqf8kcBguXBtNB7NcpB3/rSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juk7OlYTG8TFMPNQWHHdfOmsfQt68YsEzFCs9RusTIysR/eoPc9g2CejviUVAn4ASrs6ISTcbnl+YeyEAnhhuKxHca8+eyZPbJajcsEoGXaGDBFCQ4iHXl8VzCJljfhEXLFWOL6BPfshEPTuW7jc+rM2xbsxdry8w0lN78GyXFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uyHm/SHz; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30761be8fa8so20557251fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 03:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737717278; x=1738322078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fwj+mo5UAroSLJxp5Ewzj53zIrMhEzrxypv3EzqL7vc=;
        b=uyHm/SHzNgu8qrMipfl6NIGlqpZSnpfVSC8I5ecAg8mYKOC76eNasIkI4PARAQiJe3
         5e+6dAdspZVF0Pz23IM0VM12olZD4X3D03CKkE282h9vF2MmUSqG8o9Bow32S1UjYYGU
         BdpzpfhhVCLxYnfDRpvtPWjTxY+iqcTrQ32wNmn/4x4H/X4Zr0oxUO7+5qyx3d0yfAab
         jyAkASrdY948+J6F0ZD5yN9eDEIoM6m7EDks54sU21HgZHFwTbpZHERgjP1uy2x5QM/J
         glX5wLr1sjuug7lda8PJQRZpDaTyCt2SymIrreizQywuCx2cGMqsNjTI2HiICVJEj0tN
         d+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717278; x=1738322078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fwj+mo5UAroSLJxp5Ewzj53zIrMhEzrxypv3EzqL7vc=;
        b=rr3FUElF0WTzSrZ6uInAWnqnICywXiHWTs57pTmMSLpkOrK2lygicOKwR5iF+BLQJ2
         rlwv4pYLF1eWVjLiI7/wnaIQl74hLymOr+LHTJJMZKHwpGVV4EGkU2Fl6lpTJ6XAt9IY
         b2HQMn7745Qnwit5vPAOZTaFe6H1eh9hJsfqsHK3ik2ZHwaVOfgbd++vD39L4OQjdTWi
         oFJb65Adk1U2tH/hs9ywrputa2kEO1hc4yptzgZuPhwNjIvucDGpSn3NKUEjSJg0EP21
         S5xf5h0qFnzFgH9W+3eLCL7uWQhGpGuVtrpBVlAtFYlds2wapBmOBIuI+ciK1FNS+XJS
         7A/g==
X-Forwarded-Encrypted: i=1; AJvYcCXhFxZw02c8IrKmlOHALCGJJ9BA6puEElyeZeTXYc7zOlSY96jEqp1JEoADTxI9UuHiPTYp8pZf7lSsmYJs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx60Wqgg0a7JOV5i5zh7Kqg0S6kY0LjIASAluPaAIJ6CvAwtmqV
	LLIXFzym0rV8CPjzn1TyDWSlq8LuNix2+S0yU01Lv1fN80AWWC7GBn8kKNJIBnk=
X-Gm-Gg: ASbGncsJDcgm9PUPNJifG0LRV4sSFpIWLoy3Gpc+iU6g5PHyjOPpFhQXigplra2Qc/M
	v731Tz0ioHGfoTXREKZPvJ6tYw2P20roSQffCu7Fhtx51xiVue4xbruTwuv3SUDZlcSgjg7fwqR
	cUFDEMRqDVLQhmpGMH3wTdF0jRXFN28RH2XNhI7DdIEreV+DDWlHbIwh9smwFTFlyVUwDsl9qfU
	Fy0qSJ1Xbnupfgszfa8nyU/KPEcQafIp824DHFps3bgHidBPJo/rDhkGLpckvJqOF1V8B2yjfSp
	s5sj2dUbFKiy
X-Google-Smtp-Source: AGHT+IF+hU0ZazCKVSv6vYDDyjuO4CTENcYUETOBAM8LkY/QMiYkhDEDR5ndt0J3TA6a6cqVWwwrEQ==
X-Received: by 2002:a2e:a4b8:0:b0:307:2b3e:a4a9 with SMTP id 38308e7fff4ca-3072ca9c335mr96093661fa.20.1737717278457;
        Fri, 24 Jan 2025 03:14:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:14:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:22 +0200
Subject: [PATCH 4/6] drm/msm/dpu: move CTM check to
 drm_crtc_helper.atomic_needs_modeset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-4-b0c05c9eda0f@linaro.org>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
In-Reply-To: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2997;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YiER9uGGuMLloEwX06ETqf8kcBguXBtNB7NcpB3/rSM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YV5nq8F9m0El+GSJKXaPPIb12nQcNBZmQDv
 tOzihmqah2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FQAKCRCLPIo+Aiko
 1e4cCACDuTp4Lz5Xz6+mOmcEorb5i8LjmnEd0GHFi0favS9T4leDhX3UvxN1wnDqIT7/IbQ14KA
 IvYZOrh5j7JLlzZhKJaGSwbv7qEZqsD/OULP/+gTbyTEjwZjY4kOKBzoSdAv8gEZMwEdYkrlOzU
 9FKe5VDy46cVYMrr2ekbdX0RNBD1qNrRLCZisI/vxIoZlWCSV/NX8jQvYxcbZLCyJ8F5biUbQn/
 HlN9vXvPj/9esINrbv3gKi4aC5LKw1oiPVnJJS40HeyQ1u0dY+UwAnxvEnsMJsZZitQi08XsZL8
 a3rVkeRPgkEvPL6XVJxU5yeXZ68SW5WD1rr2TipPVLU3Rttd
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

For the msm/dpu driver if the CTM gets enabled or disabled, the CRTC
should perform resource reallocation (to get or to free the DSPP). This
requires performing a full CRTC modeset.  Current code sets
drm_crtc_state.mode_changed from the msm_atomic_check(), from the
generic code path.

Move the check to the new atomic_needs_modeset() callback, removing the
need to set the flag from the generic code path.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c         | 11 +----------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 65e33eba61726929b740831c95330756b2817e28..9a990386570e037f2b1c994a0140f2b7c4c84669 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1189,6 +1189,20 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	return false;
 }
 
+static bool dpu_crtc_atomic_needs_modeset(struct drm_crtc *crtc,
+					  struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+
+	if (!state->allow_modeset)
+		return false;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	return !!old_crtc_state->ctm != !!new_crtc_state->ctm;
+}
+
 static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
 {
 	int total_planes = crtc->dev->mode_config.num_total_plane;
@@ -1535,6 +1549,7 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_disable = dpu_crtc_disable,
 	.atomic_enable = dpu_crtc_enable,
+	.atomic_needs_modeset = dpu_crtc_atomic_needs_modeset,
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index fdbe49edf2e1506ebeab500e782d456d77ba4fcf..4377233bd6447060b1300cc0d6877b6a777b1edb 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -185,16 +185,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
-	struct drm_crtc *crtc;
-	int i, ret = 0;
-
-	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
-				      new_crtc_state, i) {
-		if ((!!old_crtc_state->ctm != !!new_crtc_state->ctm) &&
-		    state->allow_modeset)
-			new_crtc_state->mode_changed = true;
-	}
+	int ret = 0;
 
 	if (kms && kms->funcs && kms->funcs->check_mode_changed)
 		ret = kms->funcs->check_mode_changed(kms, state);

-- 
2.39.5


