Return-Path: <linux-arm-msm+bounces-45199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A50A133CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B4D87A422D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D7D1993B2;
	Thu, 16 Jan 2025 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k18T3KTv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E77E194AD5
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012400; cv=none; b=T6ndoPnWB79xa6baNLKpzjGcajm91VoVSIEu96NdaOBbkc3bd/CtGG9BS1nizZZ2u3KGYFVIE7JEflnuXqqvhNEY0cjt1FW03UT4RcNYLuOBn6QWL8GqaWA5yY8t0t7KAM00eTre4HeXbHhw2vUUCcuzccMpwDS8pOujXWFHfYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012400; c=relaxed/simple;
	bh=qAgqtHlAOwpHUqDerS0/cJCFiuhdtKhvQGxQ85X3hzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W257X/wFhL1hHSaSn0a/PQwF+7pWbUrv0YxLx4Igi5fU6mt/hmxPVx9Bd/1i3POAQhT/4Q1ep77K5A9pmw14nKpqlWzltrzmWuF9A61eK3mED6gRkwMP0T+Qx/7StXFw2ccXzVdwx0NUNJe9sXzgT2yFMO3KUZrfBtwtkNeJ3Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k18T3KTv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21669fd5c7cso8551545ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012398; x=1737617198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTdhq4VV1p8sI/sD4KKAgTBHIjk6vqmhDBvjFFMXUWo=;
        b=k18T3KTvpjOd9uYSKfU3tHy4Q6WUa6EVsJ/zqM6DeuUaDCvaa22YqdrtFGCIBHu/1d
         hiCoBIZ8lkcmgau11mM5z4NpMiAKIjk+reG4+hpJlKs0DO5jOU31phC3kp4dDlUVky78
         wsul6vuGy1ya2USMnGY8OUv8Kq4XYj5sQD6Ck5RUqWubOvCsBf4pMSR+XJGODpOHh3Iw
         mFGX1Lje7pEv7Jgn4vBAvNgcZcpEnGIa28OePSwnk4HaJgtGC9EC48eGbqlfAQ4P6nHJ
         fAbDOhAXYSQB6CypIZJkabhakhLMs3hdR747EWnmPNgyWuULWIEkdYSSVAxmxykw5EpC
         pMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012398; x=1737617198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTdhq4VV1p8sI/sD4KKAgTBHIjk6vqmhDBvjFFMXUWo=;
        b=lfteOUsPLFeUUi8n/fIlSUZLRRViDNuDsJkqgSnKuKTWAY0bWqwxCmMhV9hsRplCF7
         v3lzejvI9aD+H32CiozPIEz5miqq++mntuTYSQVKJvyLK126k0C/svhsSuEUTJ0T4kng
         AK8ZMsGaGt+ta7Myh8/uSFRAGTOoFCBwz2ZmmWOSbR1F/8MTcNU2DQT62035NCwaZzW+
         wEEGvOAFbvhCRzcnlPuoZb3BHZ+SFUiCHgPneQhdM0cLgPrE0SFqOPNyASSTfOjb68F5
         qsJK/Tkw/D60+Z6/L/UOknMcESjI1U1AIBzRtWww0fTGsEcAczDya9giERI7Jhy4ns3e
         OFRQ==
X-Gm-Message-State: AOJu0Yz+ksT2hHLeeev4ivqHdauo8frQBT0qLB5r4Zua+3+vWzoS7ZuS
	YlKVqDlW84q5a9CLiaHYPaA78dj8CTVOa8W6ZojBbUuimsApSjgw9hCwPBmmBFA=
X-Gm-Gg: ASbGncuXofj9se782xL0g4YBJDy1aN924pwFF8vHKRZY+XIE28ZB7CT5+tKP7nhUa/N
	uB7fjUdjvyRSWJseKqt5qmzHjXrZpspTvudaGfTVumiKmox944nZ2pDM+PXKV8wz6rRBYyv/hBO
	7HjQielyRZ0X7d28pXik0Iwuyk3oBwfmKVBeQdd0pH7Mht4ZZ29ZJVlayw4bBUVwBqptwFsHhgF
	RKNiv/aeDYCozNhYSReN/Sbh8+LfADVwJvEaI9yFqA7HiosAxs3Vg==
X-Google-Smtp-Source: AGHT+IEFmwa9UMtJBS31GZ/YSfTUIQ36PDJ5YXIw4rQjOAGVHhUtIXvnJoh3fGD0O425TbwZLWZnYQ==
X-Received: by 2002:a05:6a21:100c:b0:1e0:c50c:9838 with SMTP id adf61e73a8af0-1e88cf7f7b0mr52730195637.6.1737012397875;
        Wed, 15 Jan 2025 23:26:37 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:26:37 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:54 +0800
Subject: [PATCH v4 05/16] drm/msm/dpu: decide right side per last bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-5-74749c6eba33@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1861;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=qAgqtHlAOwpHUqDerS0/cJCFiuhdtKhvQGxQ85X3hzU=;
 b=nYX+t2iPxxESGggCq7MDSq8ZVJaS7lbw3oFXd2oP1CtmPX5VVvQzojjKlCNyFNN7R1IFwBSja
 ZHoRK/9d66RADU+ceupfeIO77JvcZmJ8lIbwdrN0o4K56z0RIuJ5HT8
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, only one pair of mixers is supported, so a non-zero counter
value is sufficient to identify the correct mixer within that pair.
However, future implementations may involve multiple mixer pairs. With
the current implementation, all mixers within the second pair would be
incorrectly selected as right mixer. To correctly select the mixer
within a pair, test the least significant bit of the counter. If the
least significant bit is not set, select the left mixer; otherwise,
select the right mixer for all pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7191b1a6d41b3..41c9d3e3e3c7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 {
 	struct dpu_crtc_state *crtc_state;
-	int lm_idx, lm_horiz_position;
+	int lm_idx;
 
 	crtc_state = to_dpu_crtc_state(crtc->state);
 
-	lm_horiz_position = 0;
 	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
 		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
 		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
@@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 
 		cfg.out_width = drm_rect_width(lm_roi);
 		cfg.out_height = drm_rect_height(lm_roi);
-		cfg.right_mixer = lm_horiz_position++;
+		cfg.right_mixer = lm_idx & 0x1;
 		cfg.flags = 0;
 		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
 	}

-- 
2.34.1


