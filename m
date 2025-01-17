Return-Path: <linux-arm-msm+bounces-45424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C850A1539B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB9FC3A98DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0725F19E99C;
	Fri, 17 Jan 2025 16:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="djUKR2Tv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731E219E97A
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129718; cv=none; b=O5Y6YTTk9pOoxLHWECYZcYoFGBj7R+1QruAxgIIylda8TBAw9TGaJHImno5hLJNCiHocO4GdUFiArrU65MgVz8DOlQDXwezMuF9BlRafnGzF1+0q974bjOn90hhVwTbT0RmyYS5DMVj/WpUwGre0n4Vxdk5O+2Q0drCfklaeM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129718; c=relaxed/simple;
	bh=+L3JP4kGTgA7oWcgBMKBnBfyN25l5TyBF/5a7fjKJKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WIech3nQeKSjxlcFJztLlRNMrN3Sx8dITPBiznxDrExgBIKd1KMidWKXuFmMfMPjO+7OmO8l7Iz6rda6g/gT1CdH9h3jvLnrOkdGi2UFbJBIEYEYwgSdlnNuNhsPi4mHqAgoXSrkD/+f3wYtaa337crP3e+ZRv/x5BMKQhuDJ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=djUKR2Tv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216634dd574so28915255ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129717; x=1737734517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZbaIR7dHDMQxC8I7mjGoC4nrZcQfmrWgKlzRdb53M8=;
        b=djUKR2Tva7+GYj4phBMvjHYGkOExO/YuMGjnmFxGtI5duH7GCXMYTa4VXoIEaxUD5K
         OOnAIwqsgxqJ6zxOmBQwozB5idbAL6qVHbKLULrteEjrdKMInjvvf8xt5nfbf55X16yM
         TpjR7Q/JEAlgPrVgxVLoI+xixXgwHr1z7Cgd6iIdW54KZnS9XRYg8sQqDf1iRfvHbJfA
         /OcTYs+GjcIiYZCNenvtHo0lee09B8t9JMdkcFckpbOyFjQr0ni/+apnzRkC5R6Bb5vh
         LRQvWmuL1GjeeRTWbcIbz+DnolKntrmisWo4hMncJBnGhUYjpxTlhUftTUUTsOE4l8Ew
         HSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129717; x=1737734517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZbaIR7dHDMQxC8I7mjGoC4nrZcQfmrWgKlzRdb53M8=;
        b=GyKDp7oykwvQkZYdnxJqN1u5i252A+uxzEeuJhsa2NMqxdnmMIhc3wwPD+muMHYD6j
         XNbdw7TIfzP6U/VDtAk7uIG0vpcz7Jipeg6i3fClGUKDQs88ERxTqgrCvF4/Fs5L25hj
         kLUr1eEa1kVZV4SdbysimGO767hOsBq8KmqyBre0O+XtMmX2S2L+0e5lupExDvc4Vqqx
         AFAI/yoxJTzZ9IzLR4OrqA184OZMQX9TAIqefzWmQpt7ARVC+OwfnSBYV0yCh7mzU0Hr
         uJYiVolCnKCcml8i2ZUMIEMWuE8coZ6obv1WQ0YdQ44nJsGRlbBPKZdhLHI7BJ/SFxMc
         56HQ==
X-Gm-Message-State: AOJu0YzFQwoB5uFAKesm7X2Y74eh6GnnIqP5e8IiZJTdWczWURwElYJW
	n6qd/EZ+jSeiSurEU2irH6QF1V3aHx+qQwwCUQLmStlymubzt2JYfqRr3tmeq6Q=
X-Gm-Gg: ASbGncs5ZZruD8eD42TstzlOXjRZcU26+XD3xZEQ249fLFb/C23xWH9FcXrGLfXISvP
	5LwIPEVIg3HXemR9viM2Jo891ycFBPVDlNMpfE5JP2akgMGbxpFxLRTHrdMPWizJAD1+OLabggN
	VqjzfD8PdUCknxCzdC3f4cGMv5psUq/+5d6aD8H0/hX02Th5verAOXrDYe4iBMjxMf2Bmf9/PMa
	ceEOIDxx/rwo5pvOFcjH5QMQm6+dAEtX7vy9BQwjolrXmH6wdSxGg==
X-Google-Smtp-Source: AGHT+IEqfxn9M0Bkr9IIjKNJ3t+p3GPzFAxf9/DgDBJqoL9FSnKZWDfy04Ym5dEVVUO6v9oNSWKIMg==
X-Received: by 2002:a17:902:d4c2:b0:216:7cbf:951f with SMTP id d9443c01a7336-21c3540c3c2mr47309965ad.21.1737129716777;
        Fri, 17 Jan 2025 08:01:56 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:01:56 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:51 +0800
Subject: [PATCH v5 08/15] drm/msm/dpu: bind correct pingpong for quad pipe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-8-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=1981;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=+L3JP4kGTgA7oWcgBMKBnBfyN25l5TyBF/5a7fjKJKI=;
 b=0+AO/2TIyjXQZ7DebGP/1DwvnxFLkVSvS6LmdE+M6efu/7XGM5JwpSXrrpKpA1i/s7V3O6TKX
 7Dz1TQ+06noBbYYPZS7tLiEta13cRDhYaLEmFs7PFBj4pDBENMi8xcP
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
index 018a1a49ca7d1..b0cab3ccbb57c 100644
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


