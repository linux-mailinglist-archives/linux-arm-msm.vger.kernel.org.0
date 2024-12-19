Return-Path: <linux-arm-msm+bounces-42752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 112299F763D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA539188FE32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1376D218823;
	Thu, 19 Dec 2024 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCnrFyWz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C5721770D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594622; cv=none; b=Q0pkIuo5eHKnqYAblLiivT6/uzk0vOzf24pDth7fbGmjg3M0YOtfdFlHxofBwUZDbAoRBGCToaqkndXHuzTXtAd+LEczQEcqCqTBMQLPSgE8RKXQyA5UUbCkxzEFT6P1NHJi8gkX/M+YmtLd9zwe6OdknYUswJjcofSA16BXQxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594622; c=relaxed/simple;
	bh=1P83PCfCS2lfs0H8yVBLl5bdtpLcjuxoQO6Bi/oLzx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQ0Zqr2yRcGnMhqMW5CgdmcW++QaZwuLw/zGkyEAhLkcx+8pHKGCQiN6r81nTQcAABXzAGw7GSJ3u0M6TsJ5TQhMdXFgjL75VjDXdNwUQG3aARmJEy+a79c0J8kTF4/xyLgVI2A9/duAEhW/wBgcvp1NK3fYyqVqWv7Llci90Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCnrFyWz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21628b3fe7dso4111645ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594618; x=1735199418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lli+5tH2X+U8aWpWoMo1klotVHUOV8UtSv6HuUwkGTQ=;
        b=UCnrFyWzmw5WQJaVvripIxbD6aQc8/oomCgvzskigqDeDpPYkBFO3OiEaG6nfA9Ntj
         t34ZM3jB9pUJ8BqXvySuPmxsu9wn+aDQ4aDtMR7Z0dhbU7CyoFgC8SufAiTjIuurYVry
         Ak7AV1TV2itw6SkEofxoaj4QpHEcOQrv58Q0yMrtCWS17kTUQ0N026K5sgbUyl9bop9y
         zp++RoFQjNarP0FMwzYR5In1zhar0B3xctEz50p4lYKZ94SjCxk7oTYHzBcFLKFkeGvS
         2la/bI5mVbMOjrnzcJ57cfi2TaM3IZG+djXUIG0WNrR9chofLGkKHZXqoJHuNEnEuM04
         /I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594618; x=1735199418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lli+5tH2X+U8aWpWoMo1klotVHUOV8UtSv6HuUwkGTQ=;
        b=wNMnY2OG1zIDsc/tD41ZhAa7aT71domraJ6VObIZopiygsFzX54932w6TD+vxFNgEp
         i3uO4eoLWQXsukrubjylz2yBgYWI9Gdzr7jebj7YX2qwWnriapzn9u88QmKOOgvzzF+E
         RR39QVW3hNJxkNXH9zjwSZlIL/02/qruYFlVCk8SDzgRdFaVQZE36fRwkjx4Q5KkH7Tr
         mr7ctIH8eh642MP4zqf74e/kPFH7vtNpp+PiFF36dmmdHNhI1BxOXDN+zMEofSLc1/QF
         u5NDU03vDT8tblBkzie3i00/JkqZSlo2AZHf6vDMl+WzFC72knKTYqXhwOYNfEAa3R8T
         tUvA==
X-Gm-Message-State: AOJu0YwDKU/bQtjhZWLDDpQF42MtLlDBhgNqyetgmSYhiyVId/RX1K6d
	UwNxiNrQJ0H4V2L5V3ue9eQefLD4GkNc7goGT1XTKmax0LBx9wdwFozD7PkwPK9R2Uk2xoYJ0bO
	s2qWkqA==
X-Gm-Gg: ASbGncs3QdfBW0nNQWguSw3P7JZ5c+gIMte7CnHSs0n/A4URdH0NMR4/WGadtFINXfS
	pdxeg1t6lpMJzz1fgCqJ3bflc/4vG1vKImM1FZyk+NzWZmMPQIXdHV7w+Gc6aueC8rPEzyWPjOu
	o7256GA/O4piMTWI/9LxAQCoBXEFBiV7JS5dfGe8GpFd/qRqrZD71vZ+6Lav4tuAe0/XX8Ak65l
	vnzq1YSiTBM/D2EAWtwYFZDAwqPWw/qAxV/jyKqe5c7uIAaDu/nLA==
X-Google-Smtp-Source: AGHT+IEQSTniNO//F/A9g+Zys4CYNcQ3vYbwx5b3wwx5Lzn1nZuhKfyiY+QWxw8KJsSb8lhBnthlDw==
X-Received: by 2002:a17:902:e881:b0:215:96bc:b670 with SMTP id d9443c01a7336-218d7216b9emr76595075ad.18.1734594618593;
        Wed, 18 Dec 2024 23:50:18 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:50:18 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:25 +0800
Subject: [PATCH v3 07/15] drm/msm/dpu: bind correct pingpong for quad pipe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-7-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=1925;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=1P83PCfCS2lfs0H8yVBLl5bdtpLcjuxoQO6Bi/oLzx4=;
 b=0illn173nHN5yDx+5A36VQEy2DoORmhhY2O/tudk2pDLuA4TxygTKgNARKLN3M3jphyKuTD7U
 z62ZZKZDsBLCufkl1g9MZTldnP3NvxVSY/YwSMcYS3pe0CCTv0WWqUN
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index fd32ef468d5f9..96d06db3e4be5 100644
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


