Return-Path: <linux-arm-msm+bounces-29983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5E9641C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C469B21669
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3171B4C49;
	Thu, 29 Aug 2024 10:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="duVOjSo+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D3818E37E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926910; cv=none; b=lyeAN3uC2ly9ay59A8ikNAWwUi+XSiXgVchip9XzL34tVR/ebBFwSSi38EBvJZyXr7wS+isgRPKLVV8naAZsuO7MvaqTFcsE+FKfiieqZuDO/9Zt0akSbLrhRyr7mpfCn9pHBKgEroZwwBwTiRfygdTPkzvlvFGUjqWfR+NGOW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926910; c=relaxed/simple;
	bh=/0TaKCKB4quJoQmigc/feb+UNK8aS1L+bPWvhyMG0y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NBaL4UAMCv+AwrpCOf1KfeLzcofq2+XgnY5TvPiXLwJj6KoAgUOs/YqzQtfrZDW5EF4FOfJNmboe1L/LnWAqZRTtE/m74+UISXko++WYytg5N+veXp2EDQaN1DCtfrnmhlBubCgSpv9Mp6kHI8j0R/aHrGV4XjWPjxuzzOBB2d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=duVOjSo+; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-39e6a1e0079so1545315ab.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926906; x=1725531706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9jx05Flyz1UJjR2gb/LXP0v8OrpVfCmxku2GEq5wWk=;
        b=duVOjSo+ocsVG+Cr8ZJ9sefWgqke/h3s5mHSoIPuhVnmHA+6jR4eUJXKOBrkWO/+7z
         8PvE14j5kEHo7SwjbSKOwAiQ/efkjDB8kuHaOpA40JnRKycFQ5rLClTF2qEVijt7ZBAZ
         iy3URCok84vo6MZtEpUFl8ggJ8GA4pKUUvEIZABuUpJjuXY/ozgbS7pABGYRHo2wJt66
         chQe9tUu8c0M3R0yzdDkWi70YKQhFXt6VM1uARlp1PXVbDufUlxre4RI3tRqAszdNVx9
         GAyv9VMyZoyKbIRUffVHEIO9eKJZsvoqzBIQxObOV7UI9aex29ixnGW0rTr7Eaxn2yuP
         JHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926906; x=1725531706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9jx05Flyz1UJjR2gb/LXP0v8OrpVfCmxku2GEq5wWk=;
        b=c4l2MiaH7fJSbFtedTNLhX9Z0cAnHvJzuQGgj5yn2ZIwcDW+sHRGiGrQ9/gj1cGTgL
         95CmaFrwUq3Qgwljbt9dM7YS3qgidWHNWFw0VND7Y6ssNw39An3Pbrr5IOW35lrIzFVc
         SA7NE/eX3qxUVFZJO6o7jjOuhUZRUyXfymm2T56LAZy2LP/mNk4bPcMnfrLDqrPCMSIF
         5GyPezL0VVVsg4ys1sE1LFmJjW0I+h1KLPaAo/LroOjzrmxOCBoiOtJ0LZnNoFuQTKKg
         A5gK5PFmiFc3quJQwTkBrOJFQGHkPX95GWlZkaOM1/zGvY3KlBa0e7mek96E0y2OOGxk
         7ZuA==
X-Gm-Message-State: AOJu0YxVz2ioiyLOen3S1hgscMsUjGFz/a7saTYrDjvGxQCYMn+x/b6E
	/NzSegBt7BzDpTcQfS15NBmCRWjQeUvcRP0uWMffd7gJq/WYumf904tnWESjzmQ=
X-Google-Smtp-Source: AGHT+IFNqtjfH6898xDZo1oKXP4FPGRERQN/yG4/hS7UmK07Tu9uaYdYVMcYyGDgmPzuMBRpPO+cdQ==
X-Received: by 2002:a05:6e02:1e09:b0:39e:38f6:d006 with SMTP id e9e14a558f8ab-39f377e0c13mr29566845ab.9.1724926906455;
        Thu, 29 Aug 2024 03:21:46 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:21:45 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:48 +0800
Subject: [PATCH 19/21] drm/msm/dpu: bind correct pingpong for quad pipe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-19-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=1799;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=/0TaKCKB4quJoQmigc/feb+UNK8aS1L+bPWvhyMG0y8=;
 b=3i+u31QYN7+VHMXzkpCRi03u866yLUbNqbRJCoGzSkySX+He1RCO0pnnTqsKTYMy8tm3E030Q
 xxudyn/XPdCCPTgpW4OTkgRD7GYqnBTA3DrC7a4Yf0rdPAGAP5e38jk
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

There are 2 interface and 4 PP in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5d927f23e35b2..e17b7b39c4db9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1116,7 +1116,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_pp, num_dsc;
+	int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1186,9 +1186,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	}
 
 	cstate->num_mixers = num_lm;
-
 	dpu_enc->connector = conn_state->connector;
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * bind to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_lm / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 		struct dpu_hw_ctl *ctl0 = to_dpu_hw_ctl(hw_ctl[0]);
@@ -1210,7 +1215,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)

-- 
2.34.1


