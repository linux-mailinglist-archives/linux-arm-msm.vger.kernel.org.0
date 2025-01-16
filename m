Return-Path: <linux-arm-msm+bounces-45197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E104BA133BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60F453A02DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280B419884C;
	Thu, 16 Jan 2025 07:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TdA7RZMA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B3D28DB3
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012385; cv=none; b=tC0vm5nfYYXuwiaKU8PZ+IcJDym/Kf9+mV/6/S8QN1W9p5Vf7y/N6Xv/ypUnpWwbCt/4rxFOGFb6F+A5y9iL5jdG9ILjJc2WxzPSpUPKeMiRwySIag3vPDUwsGRYNRLU+gEIQe0pb/hgfqtEPvzTXQbzyxxGJrdVngeARSrJCS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012385; c=relaxed/simple;
	bh=eXNECQiRO+b55BrnG8VsEC3fTpX4rkFaox/olbPegR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtvRhxsjR2V+XwHN5oi+LiU3TxGOZ1v9yVpLlEvmCuFP3I4wPK6kVo80+ILMUEM8j3Vi89iXppuDJoEWpEdRxK3APZhOlfFvSNdU1baQAlgDjIfAxKxWNJZtyGLIGzAVpVlWaYdMkximXLY/TjyHAyuNSBBi/aVaOEv5uM1gn9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TdA7RZMA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2164b1f05caso9711415ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012383; x=1737617183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOd54Oaxtj4ucXZfUtJIBMoZPaiqx8aUpF5vM9t0qnA=;
        b=TdA7RZMAMXrODm3eC5+y/TqiOMSPWv7Sy3iPSlWADM2n7bdvYVd0QsxO0koQUci5Bh
         fugbKukGU21gGHsHsNWX50XG41EcnGZQ/V/3qHazACY2mRvSR32wqMqw37DA3PaZz+E2
         XQPRJTkoq1dzwUjkfVX1W2GvveJ59ZwZLKIUzNdCsW44J9awwa8kam+9bOK9+GRekWbB
         /1zym1nAy/Ghc37sF4mHrvmtDYAugQlV9MEpzLxLhb5RYcZATo72+2N1YAfz1Ufh53s/
         tI/rBD6Mrjo03kQKp2bha4a52XelKEuZ5nHnRMRbhRrPuPYNUanLAazLa54Txscn/mIo
         bLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012383; x=1737617183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOd54Oaxtj4ucXZfUtJIBMoZPaiqx8aUpF5vM9t0qnA=;
        b=r5zmD8I3SvIpanAwugUdb646b/0AhTklRy8tW9FuFhcoMBcGZYhLq/+TSQv2/JFUr0
         yHciJ6d2JiaVrCOZKvSc7+lKLaAWBo9MudmltKUo7uI8bIEdDASmfGvL6rjZnLqvBAyT
         jGSxTz6lk5uMa6spFSfsyaLnk4o66TyVvq9IwrS0uSZiD6oK8RBToWfc5bd6zUxZGaeL
         aJz3hWKucUZxHoC+xl7LEVRCnwnhq1c5KlFkLMdz3+oTmrE96nthF1w3P5ihchh5O9G8
         ods4T1V7IxqOgkQSuNYAyEK+Sfrc0jd6iAVy2SPsaFHfGJhHXCcaR/TmlnZLnJ852jne
         Avxg==
X-Gm-Message-State: AOJu0Yz/UtwJnmkEnPL0KtyI8GasKA/Y/u6ccwgIM1WNAND/3hWTbkjB
	HifzXJu0dPdBM5agWIc2ocDA3pGAAzPZyjbfVuxe7+smz1SKtta9zIzBJyuCLD8=
X-Gm-Gg: ASbGncsbW6CbL11yymwr7xiHB47Yjc+6ibbcoPTvwXnCtsnV3VLSRba1C+T2DRl+0cu
	4lWxH9vIHBXxJ4hwd9G2EHJVz+EU4125esvoMAwhVbGO44exB6jSy7wvIHmnWgbg/TkIvjSozTp
	5G6dTezgq24AsqV8hpvfVcl+XMi66rE8YCc1GG026QwsV92X5TuhtLu2FNnregiRi51hJnXq6Jd
	0/eK+kkJciOoaVKftd7V8hlp0T08AzXXTCZBIsmUet//wtubtpjPg==
X-Google-Smtp-Source: AGHT+IEPKbUKt7krJ1E1ELhcjbtRED/bN4UmXEpsup+C+sMPlLYr3Q8dykFLSQkXTNMVVlUhbN8ZiQ==
X-Received: by 2002:a05:6a00:35c3:b0:728:e52b:1cc9 with SMTP id d2e1a72fcca58-72d2204914amr48248717b3a.18.1737012382892;
        Wed, 15 Jan 2025 23:26:22 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:26:22 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:52 +0800
Subject: [PATCH v4 03/16] drm/msm/dpu: configure DSC per number in use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-3-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1739;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=eXNECQiRO+b55BrnG8VsEC3fTpX4rkFaox/olbPegR8=;
 b=ZpGI9rA0Yep9WbZMzmuE3wpwCyq+V72ZXvKnbh0f+XI9vex6SP5rVpcB+Qe2sTRs7UrQAVBKy
 121EILuWjGBCW4075/c9hoc2vvbmgzvNIVTEpqVnBWk9jAzXMWSHNGb
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently if DSC support is requested, the driver only supports using
2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So Only
configure DSC engines in use, instead of the maximum number of DSC
engines.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c734d2c5790d2..6603e9c03226f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2027,7 +2027,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 				 struct drm_dsc_config *dsc)
 {
-	/* coding only for 2LM, 2enc, 1 dsc config */
+	int num_dsc = dpu_enc->num_dscs;
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
@@ -2039,7 +2039,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	u32 initial_lines;
 	int i;
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (i = 0; i < num_dsc; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
 
@@ -2068,7 +2068,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	enc_ip_w = intf_ip_w / 2;
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < num_dsc; i++)
 		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
 					 dsc, dsc_common_mode, initial_lines);
 }

-- 
2.34.1


