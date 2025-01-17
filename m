Return-Path: <linux-arm-msm+bounces-45421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F505A1537F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B01DE7A49F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709631957E4;
	Fri, 17 Jan 2025 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zci69Wbf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8C819FA93
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129699; cv=none; b=Cwr9jcVWuiN8GQ09uyuzaBEoeKpvkElnwCbwR47Lu8G44ECe8QazMgA0+7g7JqrQsjgS9rGWtQ+AbotEThE/xq1Tl8ai4BImfarM3FflsMNkiWRlGQe0T/lf9fziuxQ3STcdG7tbH1j+Osrcv5LlN0TtZFNbwD5Y4ehY+38MNWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129699; c=relaxed/simple;
	bh=omFb8tC5BYgDB/DLsxGi5hvIkUiuwMAxXfTrryE65M4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgA9iwHVI4a2jJC/l6WZ48v1Us/CtjYqqK8+uPv0Y5FzcvgseLMfHZr9p38/RZv2wbeJX+t25U38SiefuBtXDzjMUccFwsg6zmQ3IdJl7V4kNvFp0g56W5YV+cEArVl/AN5CNzjhUCdnlZwFX++k4NSj9E7bdvbJcxYZS8BOigQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zci69Wbf; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216728b1836so41964575ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129697; x=1737734497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3yunoLlxWRJhy60D0YWe6I34aii3wtHTN9FRAZaIpc=;
        b=Zci69Wbf47Dvc0YZSfzUY0ml5ABtIIAc77OeERyIj4D+OhcJneqKe4vQfTjEfd+Mgi
         S2E+MI3JJBniDEl+UL0IHw4fB9CT7Jh/L7KhYilicUCLk370/18gYj4WkOZVgOQ1FjVR
         SbpJlH8CEqFI73O/TX3CG/diuGi4lr8Vju1B1avnEP5fccEwne97DAO9Fp0qFJSShH8k
         kcuq5rkv5tnfWeGD9cDEiNwHRYxaoA1GZZuAzo2zOOhUZ4r5VRanN7h/OUrcsiVeacXm
         LNFymxINXgFBigdyC6fvYFW/vcGcvEsC4FDuxQBh4cUgE5GHRb0JOhPTsDH+pxFSP892
         25Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129697; x=1737734497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3yunoLlxWRJhy60D0YWe6I34aii3wtHTN9FRAZaIpc=;
        b=B+Dmm/zlb3bC5bvBK4aBpRmW6lQcW7KiLb77vSrCo1uCUe+yaKIwZk/YXSm9OTJmeP
         hYJv72oyDh6yOOz2ydmUtTSMw+quJ/rNDN3uv9ezO9NOb/elljvO1DJnCNcg+Oi5hN4U
         mtUTJHbBewt6/FLaj95gK7Ln4dYbUEJMswxYbDeqoTDLd8hylWwm9v8arXCvYvYM/On5
         kfODWxVjFFpSCTXoIFw40yRPSw+B3TRxOnR/ZBEy5Vd/k0ABb2iAOB8KS+65ihUChdzC
         RCbvkwTbv14Bh7lc0ttFntR8R174OBCNg7siL8Gkjnkh3BLhpP91LQzgyvjP2T9571hr
         rP1w==
X-Gm-Message-State: AOJu0YyEJOQgyLepKpiHuLkIny3uEEDwkvKwyEYnFmEiUot4SI+pbo2D
	QVT/APRWxkqRYxF2GqlWB0CjEp/HvhCCnrcLbVpU8c5AThK8U6dGTHQvqS5+E5c=
X-Gm-Gg: ASbGnct8/IFQ3e3xMsNg6M9zbuS4jgGMZpcCDvWQIRn9YIRTwFXQ4sXVn7PtmP/mkky
	Hb4x/9NuCIhDIspvDMmmdklWkx1aEt6SReCnRtF4DKulLDxd7GVvaMWAJ4EAoXt4P1Y0+pX8MFc
	Od/9WIEUteUlhQcTF5tKUREKQ2cpEqeREbdHKD2psP65xN5R3PHfGmAs2056q+dG/I0T2ySD5im
	f3KBXPD0I3pM2EkDwf0R4UvqxolzPiL8OqSBfJ7pi243LJoR7DWhA==
X-Google-Smtp-Source: AGHT+IHqJfGxJvCiAv1ftPN3BjOhgudESdN0Zw8GWxYpwMLaLfxmL+8riiyZMGiCbXS9vMyovccAhw==
X-Received: by 2002:a17:903:120a:b0:215:9f5a:a236 with SMTP id d9443c01a7336-21c351cfb3dmr35013005ad.6.1737129697086;
        Fri, 17 Jan 2025 08:01:37 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:01:36 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:48 +0800
Subject: [PATCH v5 05/15] drm/msm/dpu: decide right side per last bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-5-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=1875;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=omFb8tC5BYgDB/DLsxGi5hvIkUiuwMAxXfTrryE65M4=;
 b=+PHLNBv4YKhyEsM/qQVuxxt94qq2IbjBKjJH4LJFXf/Nz2dVkh8zYljG1h8J2fPBZThfV6rt5
 xMwCi7Yrhu5CaTsFjVKn/HX3fJx7CVmZetg2lR6ArDl61jdsFuAyGnd
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, only one pair of mixers is supported, so a non-zero counter
value is sufficient to identify the correct mixer within that pair.
However, future implementations may involve multiple mixer pairs. With
the current implementation, all mixers within the second pair would be
incorrectly selected as right mixer. To correctly select the mixer
within a pair, test the least significant bit of the counter. If the
least significant bit is not set, select the mixer as left one;
otherwise, select the mixer as right one for all pairs.

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


