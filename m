Return-Path: <linux-arm-msm+bounces-45202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D09B5A133D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04BA51881E74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA940199FDE;
	Thu, 16 Jan 2025 07:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zFMLaLEX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D801ADFE3
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012419; cv=none; b=ok5rCGoGag5cMM6ZqNKKLV/M9in1tKCKJ6AmlvkwQ/o76A7SakKSH/EI07hWM8Bu+vTJoWXpO0FmZp7s3Nl7nWv1bDt676oJTkduzz4SB91ArRxkBqByA4d4Tf3QCg9zY+r/k7UItgp3919WqtgkPvorOzILLEn2GBYX3tKBJFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012419; c=relaxed/simple;
	bh=fkwBKTtkClcI8zzn1B9oiPX8S9btYMX+2rqgtJiEZXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bBUUK+BwYf/aPk30I1n4wjrf13XFFa/gi8v8SorXznvSsJVCJy3T23ctAW7Pkt2O7AZYHsLh3Kl/02jRDf/l1QYlFBBwodxsAScYol1HO0rFhwFBt10r72JliSGRSONxcks+csnk75Ar5sGNyL7VBNtgG1dVRF4ArzilnUxMV6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zFMLaLEX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21644aca3a0so12273355ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012417; x=1737617217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dz3TwZBuqS+A85PwaZAckZmjEANP7y/gVyTC1yHyCV4=;
        b=zFMLaLEXMRDGGOXk2yUHzo+ePgFFfbch89mnxKC/0KP5+ChMyA1sZRJE2Nmhg35+01
         XPRmtEIIowmkjDZYAjX/mzYKSM15/Ta0RPxFtvvUsNHg5J8LyjQRqc+izv3OT+lFmeo5
         3cM8PWH3RoXLi4VaCQ3Ki3ciilOKBBRuIWwb7AydjF0hQzGW3uYK+CB7fdChtZo3gZ54
         Y+aDjau4WdrlIbOFucIQJ0QM9f/ibMZ/IHdsXFHbBbzpEEkDuscjcHr3888z682RoHld
         i6TV5bxjqPA+DeTWxFEH7knZchgzSP+jyKQ5331XMqGaRwb9vvFQjfbTc57nuEbkXAOU
         1Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012417; x=1737617217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dz3TwZBuqS+A85PwaZAckZmjEANP7y/gVyTC1yHyCV4=;
        b=ItOXu0Dl6fg+8Gp6az541+NIk4PzX+MBrYu4q9kz50TTG/pLTo5/rF9EAA5juB9EVv
         L+TD1zJsut3H2N0HQhkLb5jemCEJirRba8VQU4HEApScC6EUN07xIUTmngEyj3eG2lTP
         M9o4w5LoYuCxrta6OXOcP/OZPVKbc81CNLoW7Yt4uTxTQHK28DHIhcNJaUD77QhNF7Mz
         rqNyedbYRNnSKf7EEmbSc/jOkh2qHHc1/s3a3en8rU2tYetgKfnkL3n+Bp8tXuPtP7SK
         e7cV2dNdwHsNgmOrN8/R6b3RIq94AYrkt9psF+Ro0NMbkVH9j0f+Bhaw+dVotlQnakYc
         QEZw==
X-Gm-Message-State: AOJu0YyA5vzJQzgyCrfUH3Ysnrw0O3p7VPR+o7A5ECmOn/MNJJrIR6wc
	+GTwiP8uUZR0/opUBY6t+1nBhZFtSyISlJCp5d8wJ54GNh8v/Vn5l8wZCQLDpJE=
X-Gm-Gg: ASbGnctOejnk6YEAW1tTznA3l47hO9YW9cJtmTiq3FuFX1IHI0ToSUc+D2tV+qOaRX0
	o4rYBwvBQ4cHi7J53qv3x08Vb37ZlwmLamF+4n3yHt/9KKEHD9QMU/ybhcupMI81Il8YskJ9HOp
	AHeuwPeTnuie7WZKlmWkYAYwygLKSVBtE5m2V2b5wrM87R/wwVkRHzayjSCvX2V3RsCf7ePQt+M
	huYgyLZqruj/M+OPd3s76PUBl7mdjfxEkzpbMB/HXJgFMnL2gE0Bg==
X-Google-Smtp-Source: AGHT+IGtMdMvQChRYDu6ipGP81wNRXfxlja92a5bcTceBrSH3LTru10XcvFatgNuBJMIKEk3mvL9KA==
X-Received: by 2002:a05:6a00:e83:b0:725:b7dd:e668 with SMTP id d2e1a72fcca58-72d2201700cmr41671382b3a.17.1737012417519;
        Wed, 15 Jan 2025 23:26:57 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:26:57 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:57 +0800
Subject: [PATCH v4 08/16] drm/msm/dpu: bind correct pingpong for quad pipe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-8-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1981;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=fkwBKTtkClcI8zzn1B9oiPX8S9btYMX+2rqgtJiEZXE=;
 b=80/re1ViVNpyAQG3L20/2X75joL5lrM9EVkvlA8YAUQBWQimA7nvNtD3KQVN0iYfWhEtLtu48
 w9oiV09z4p7Ax1m/RcCwDtdvkkhyvZL6zeMtSGUKAGlnIhfbXByaNMe
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 42aa685e421c7..1f3054792a228 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1220,7 +1220,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1275,11 +1276,21 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+
+
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_lm / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 		struct dpu_hw_ctl *ctl0 = to_dpu_hw_ctl(hw_ctl[0]);
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1


