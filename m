Return-Path: <linux-arm-msm+bounces-48222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97729A38621
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 15:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D2643AD2C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 14:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0E021D5AB;
	Mon, 17 Feb 2025 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VcZFJksI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F4D223300
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739801832; cv=none; b=LQCi7WBUDi29GBgxwRWD4BGNy70wvaJFNrWF2eZQCE72eoW4my5R5zKB+om/4J1VrkvV0LD5xXHNYPLTLxiC++7LTnLxyHGVqCcYWj645GPh9rMv8y6VKLlQmrI2k9Y5QPayMARV1T/G8mTG9otrk8gmYyhVyTnvQfs6eO5kBIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739801832; c=relaxed/simple;
	bh=BbqtIHW7JPzSyRGmtZOcXUwUkV9c75Bm5PqICVDkcB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFryd0qnoHNroDNFlp3ws+wGDdJmawcuvqE5RS+Fiu75NQ5xw3WbH/Url9mrqOxdIRTHlaWIFenxuTOB94iqucrjf+QFYy3Qv4aVXV5YXCdih1ZVhQSah3rEywXNji6so+Phe4lj4+guAQOP2K/XEZjkAxbAA7fP+uqwzOk7gXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VcZFJksI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2210d92292eso47552185ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739801830; x=1740406630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
        b=VcZFJksIRg0Oj6nsQTPFHCvx6M5wYuXpaIOBNHqNMirihpgkXxkcRw0T25ksClGws9
         EgDNTag4j83ZPmA0xYSJcpj/bhD5fjNuWOnPq8RgzeZEQgKjax37lGMN6d1VJbsDh/aU
         vkVQWVkqSd9pybnDR0q96kdGXI96TKfHx5uwZVvRFdYiH677tPP6o5I17YOzLqLw+wge
         EIxPMSf4pKfQqcP5sFwXqUVfqNSzm5TJ4qgCmk71I6urA6anpTEFVALPNRZ5l9cEeBL9
         c8ZbQYRf6wy8fFLlOISLEpcksZI+31ztmHyaCRkAyGXIqO9WnCVVQVNckaLnefM+xnmF
         fa9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739801830; x=1740406630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
        b=eG2Ni4ewQmw18xxcjSLV9WvVpoTOJMmxv0gsVffL70Fv8GqpYX7ieUTHNfT1W1YvPg
         KGBFDvZev1vKm6NgL8dGMQiMhb8uVmqTKn/iMIL9snBD1h08cnZtCOMWcnKqn+w+EG88
         W1wMRKSDU+5GrvFWEBv7FGz35NYm5kiHNqojP0BHwI/lI0UgnLtBPD0wHwt13vTmUoBZ
         ibiDwVEmkUCB5oJpVS6L/AzxEod58rYuPGPttbW6Sxwg0UrZmbt5Oq+fWDH8od6Bj32u
         TsAQfjHBTry1ETw8kU0WcX9lnR/wwQjzj7Q373isScSZB3yQg1KNd9kf43v5IZ0ovFVc
         PLSg==
X-Gm-Message-State: AOJu0Yzj/T71V6B3qHOdNuC3UIsAAEzgF9uJ4PKy2UvbZGNnYSGh/Mnb
	P9wD3ulKnamFdSlCjO4zlyhIWE+9oPRR/tk7OHahU2ihZbsAFkdfsVHME0n1P8E=
X-Gm-Gg: ASbGncsu8okGmp2n5pFXL9pQq8WP1n0TcCeJUUTFrge7V7lIc6dLloTqISMW+cveQlk
	R/mW1a0jE7xrKb6mnanfqnq2kg87rzAXgDbnDvzywE3vbW/Zcp0dymWXmpi8ZjvcYSyEu2XhUzI
	5XVm+bokErn5OOEEGp7KWt3dSkSNAgH3LUmL3EMJqN+ftde1RzMAHMtxS4lWy4vbltni1FDqvbG
	A/s0vdn8Be9Tv/Uy6lAroEV6Q2IrzLqYddIumD8CXXIJcAQNdRNpUF5Dsw6scy1XNb1mMs/DEU6
	pSijizhqaY86
X-Google-Smtp-Source: AGHT+IE9VGK9EgU1CxOnB42kWoFCngkyiKxATWGlwXIJ1zEtEGlL0r8wzHMxqCOdBQTbkw6fFe4mgA==
X-Received: by 2002:a17:903:28c:b0:220:f030:376b with SMTP id d9443c01a7336-22104057e3amr166616685ad.21.1739801830048;
        Mon, 17 Feb 2025 06:17:10 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:17:09 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:54 +0800
Subject: [PATCH v6 05/15] drm/msm/dpu: decide right side per last bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-5-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=BbqtIHW7JPzSyRGmtZOcXUwUkV9c75Bm5PqICVDkcB0=;
 b=ndip+BiznQsCLk3gFRiHk2aOU+/6Y0wWrn1S88SeHOm2qcGPMaxjsFB0wWvmm9AhF3VwCkouo
 jobG/vDz4dhD4siduIn5Zlp9SCqd/s42zjGoVLwDm7AnDuDb+ikuCak
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
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7191b1a6d41b3a96f956d199398f12b2923e8c82..41c9d3e3e3c7c0c74ac9007a1ea6dcdde0b05f97 100644
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


