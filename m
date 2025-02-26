Return-Path: <linux-arm-msm+bounces-49498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EB7A45F6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B5DE3B3EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F4B2163AA;
	Wed, 26 Feb 2025 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8Y6nB8e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12AA20E31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573160; cv=none; b=Ev04MOQb2vJIl04BVwu3hqs1lAjOWzSLDm3Nbh81j/0JEisjjnu2Ji4I55jOfVPyknPoqv5FLlTpoewko2a9yrTpkMc3Wz8ckiaCTwZBDi8WnHXHQKmhy0qkr91QCkhJDZi8jCG3TNqR8+DtQi/xkxE/K4QNVC9DHDSrjTLSYr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573160; c=relaxed/simple;
	bh=OxydkO597ugBLy/eoQLhIhZIi3C8VBz20HvkW34FMds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JgNHfc2LyFXNkNf3xMeqZ6XE0Qc6TISb/vFu+SSh3FCzEH8yxwvwja9lzFxRNCJoVH7qF3nBZy8uA4nK64pPXz4aWNKKi0lQ4FeZKZR5Vno6tk2lDAswaThHcod+T0Sr9gAFNd1mm71lHGTf2c47Ay3pTtgKoOcgDwWcJzqP5J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8Y6nB8e; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220e989edb6so184302845ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 04:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740573158; x=1741177958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
        b=X8Y6nB8epJn//KFuJb8y5Ws4ky3uT5y7Frfhuu0eXV2Zyv+2b03+o+lWdU84GDWly2
         t98FW8k/I7U/Fcw3MVwnyGBKsUoH8OWc9nFkJZ2GzBvX9W5rU+CZlCWmgtak5AQxu5TF
         6lpVU7flmAUe7E05YDZLpM6PKX78tG2f1H2YjPr9JgEQwIF/RqcSj6NNbeLUs9jITMg3
         x84xdj9v5jOdD33kWX3A4zqB2jkx2isfwPxwTEX3LxcPav5HssrKB9MCLRGzKDaZdDT/
         86B+Bu1Yi5FtBkNklDDVIU3FIWg0rucAjwRQ5IpBDzMGsrVHtu/vg6gw+TVHC+t+VS7z
         FWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573158; x=1741177958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
        b=M0DQ+y8ySwLPVSDUBmhSLvBWINHa676lrhB6/Kv90WnqqPRGUPn60Ix1Ld1tzo/1+7
         C+xf4EHbRj1zAy1tGW2h8lGMI+wDAYJdfJRj5paUPHPprMU/FQj8ZOrbqepP0c+uP74k
         USKZnwodpczyVfvUb5hvdG4LR6bviwId/ZZbupgWT7F9Di67ZqROO4XLimIlgY3qWpeR
         SIlUE/xKfA+uL0SnsMN5voTjT9sOwA8ufaFltBxqON3EWEmpEibGB1SfkJ/VxFB/ccfh
         XVVn2bcPUav2MmXZJrBej9pYfOj5XaTG8kKkYd28OP4vSbZfj0AwXJLkwfUOZP2/Q6P+
         ++5Q==
X-Gm-Message-State: AOJu0YzGesxjN1t3wa5D/LmnB2asKSyFUFmw1dP47bnGv/aHDTcw4OFp
	O3I3B1lEQ9lXqud0HQAx+ONsDpY1zbsdKYUyVccbjWQ315atHe/Tjng7Q2Ig8TTcvCUaz5ekVHJ
	sGPjA2e6s
X-Gm-Gg: ASbGncuiJ9ESR1vaDkX2xQMQmBxzLyrxXc9LYwtptp3RB2sH5EuoTlcRX/kKCW2lx4W
	cmp06fEVdvXo6Kene37jmCqgaNkDTAzlTcs9shCw7TuTV2AikNviUynudOiyjiuY7F9gpWvlqJL
	BqtTIuCVNaROVDrGuao1IXRXBiZHQPGP7L1a5QM2LubEiNRaxUKlyrpRcPXAB4a2u2rq21ewkwm
	2SdXIw5vgvylF6h7QScxfvoJjadz1KdETW63lHtRZBHaBaEmjRFSW7PSkfbh6j+pMvMl3Jm+l2c
	Xvbv/vznmQdEnuk94RtryJE=
X-Google-Smtp-Source: AGHT+IGxCpm6c87VHcHSRCVwCoTBdyNlaV16AoGKzUByQr34biDV2PJwVjWTV2ugBLhEsXuId0VJTQ==
X-Received: by 2002:a17:902:d2cf:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-22307e70df5mr103034395ad.49.1740573158022;
        Wed, 26 Feb 2025 04:32:38 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 04:32:37 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:52 +0800
Subject: [PATCH v7 03/15] drm/msm/dpu: configure DSC per number in use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-3-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=2046;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OxydkO597ugBLy/eoQLhIhZIi3C8VBz20HvkW34FMds=;
 b=8LsEkvfOXTRwY+2+qNOVgFqmJCnNVHJ+BnG9iZofkWpIytLXTAnwPgykXX2EP7dpmSQV5YtFq
 7XxjMuY8LC9BjBcG6Zl5DHZjN7xn9fLiR/uXg2uPW5dEaGthrdNHXT2
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently if DSC support is requested, the driver only supports using
2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So Only
configure DSC engines in use, instead of the maximum number of DSC
engines.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c734d2c5790d2a8f5f20c4b5aa1e316062d9b34d..5b98ae96bf5d46872a7af801d4157820d72af01f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2027,11 +2027,11 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 				 struct drm_dsc_config *dsc)
 {
-	/* coding only for 2LM, 2enc, 1 dsc config */
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	int num_dsc = dpu_enc->num_dscs;
 	int this_frame_slices;
 	int intf_ip_w, enc_ip_w;
 	int dsc_common_mode;
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


