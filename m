Return-Path: <linux-arm-msm+bounces-43058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A1E9FA3EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB12318898B8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 05:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35FB154C05;
	Sun, 22 Dec 2024 05:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4N/OPIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0DA155747
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 05:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734843657; cv=none; b=ALMwYph9eoHIZnQeGRN8+RD0tD28CHkA8OL3WzJM9GnHwiEcWsi7iZWcCH0P3aloZ3RSkQXe6g2RMXzx1upnHYcXdbgTRlNpSEX98dB+D7OjH8dhf2IBB6J+iYZRV3kwrf7GfzFucLjdGP4TgZfP/gaDRMVOozJsieuxcMFmz6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734843657; c=relaxed/simple;
	bh=dBpoTk4s8OfoXgQIHG9q+kMWzF7ACr4fOXNDIEIP2pc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uUwxgFBcwvCykAAaARxY3PlOVr0gpuqIHvOMnyFnyeOj2ZGLU3OcC+np+qoO51+LSEVWmx6kdIGpefz6D60MXUm5Dpe/T1YQR6mOtKfe62b6NS9h/mRUkaU/byQVPUJKHta8LXqBaFULgx4oJckoxqCtznHZzzMkoqaKP5a1NSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w4N/OPIy; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54024aa9febso3438451e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2024 21:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734843654; x=1735448454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPUKe2inYvlgyzg1RdM9z6lWoAQEDWbkCd9hh5ymtmI=;
        b=w4N/OPIyF8ScdhmvCkfH/DXID6gzc7nz8JC2TXeihLPEqI8+WUcN9Mgnn/k84kAxzv
         5DGVaJ8cWOesRLpdcx9Gl7JygNok+r9RTemo4XOIpaPurwZF01WC4c0F9jpegWwClz3d
         gSJPgVZH7G9x2A/BLkg8rT4sVtONreVrnwHU/ark1BhmddE7UpP+jaHbU73wCWa01bvP
         5mOmriaeUjjra5lOcIGLYlQ2WmcigcZmubeEmc58Cb2tBqD5/oiMyoeCaehK4KSc+q27
         AQZfcf2xkEk4MpC9WrC7K3Z7fwTODTciNhD+6SCR2cJTSuf03fC3+BTfywacuA01x/kZ
         njEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734843654; x=1735448454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPUKe2inYvlgyzg1RdM9z6lWoAQEDWbkCd9hh5ymtmI=;
        b=Mb3ycRWg1dWx3Do/CQ/wNDCq6hgGD4wJq8YphSk50p/vFB9Ot/d+kC/w8rsgm9qWDU
         1/f2BPt4Z4Mw+ls4pt3PMZIYwI00tGPSlqUhnpi62199e9+VQkJaH7AoUfHpq9hqcvSs
         htYhKY2+W4XBu8Bt/RQqjGCHzUvWsywqU1BYze7nZ2bqWm+Y98FPcUvD/kByIaLOtImL
         e9L81qBaGPJFM4tBJKG2hKkga51cHgz3w5xgs7Jazy5ZfeCw7XzjxVL4cvQhNAATskST
         jzymmJBzEw84V+tGQ2uKIBEuaxdr/9X20fPVbQxoQWn32vAnJO+GA79THygl110BLavu
         EXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk9d5dHN+NDgk4to5gvfDcTTgwyT5JSighb1LD7aMfCuhDoBn3VfzC/qi/J3EwK8qawV4m30iW6+AkSxeO@vger.kernel.org
X-Gm-Message-State: AOJu0YxfdrQayVklVTzfmdyHTdXMpuLz1661jnIRK1hqBHuJjqHEHgoW
	2mILmggGpTA8cVSQxLZDH/nHtbOnWMteG47L+t0qINeFD4RbhTh0fiVWpoXYpqQ=
X-Gm-Gg: ASbGncvMaMaTH3skHkVAYMC5INg10fX6r+wUDpZ/MVyZH/aFYpCNXttTs22Yg1/7+lQ
	2NL+bwlKccGLAM0xnSviyUKfwGwoRNnx19p5uqc+qnS3HSDMf0qhjIYazmVchRk8qiraJV8rMy1
	uNgDzC1Zp+F7G30TiEr+ju2JnDtmhM4TS0e0/tu63Iyk7y3Ihzig6Ggw/IxanVqBqX6YwLLue47
	8iF/BWWFd8IejswWaUB/VnAmif/jOHoDS+jRZ2zNfPbmd/jMGSpS0rt1/0OPS28
X-Google-Smtp-Source: AGHT+IH5FngsI07NNLouagSYBk1lHP+UW7OocB95mR63hfokDbT+bvXmYWVojBL11pLAgTWk4aF61g==
X-Received: by 2002:a05:6512:1392:b0:53e:38df:673d with SMTP id 2adb3069b0e04-54229562a01mr2899574e87.43.1734843654003;
        Sat, 21 Dec 2024 21:00:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 21:00:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:43 +0200
Subject: [PATCH 3/6] drm/msm/dpu: don't use active in atomic_check()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-3-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dBpoTk4s8OfoXgQIHG9q+kMWzF7ACr4fOXNDIEIP2pc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z7MZS6rAhW4DKuCWV9b4WdZ4hjqC6HLAq/i
 yre35Fm6UKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1YNhB/9hX2wrzJFQ1fwM8icQeBER9azSe4PG8Bpkhfz75DieLiutJPwRQtpOItU+qWqg6WCbESd
 AFhW4a8ggukt6IuqRscFxzbxnfStjAf2/AAxGGiUjRKmbegN4evvPH5ZuwMVRYHJipxbUjM5dRq
 DY26GP4KUxfZcN4d8cap0cnUgNxEWBohuAcKFyOWCgnSxUgNoKTOVPzAbLRB/+eOClO0t8tg8lG
 mu7U1WhfrEEKB7DCcQOb4GQxWfGAazde4EKF39I9VOy3jDXwpFEdA8wWS7KB8Dd6qh4K2Qf6Lmm
 ngCcXoIiCtGuHQpeqXSzY8TZe2MPU/nrQD2jLanaCowQhYyE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The driver isn't supposed to consult crtc_state->active/active_check for
resource allocation. Instead all resources should be allocated if
crtc_state->enabled is set. Stop consulting active / active_changed in
order to determine whether the hardware resources should be
(re)allocated.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
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
index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..d1ccdca6044353f110bf5b507788efe368f223a3 100644
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
 					drm_enc, crtc_state, topology);
 		if (!ret)

-- 
2.39.5


