Return-Path: <linux-arm-msm+bounces-16228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3601896A17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 11:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52E2D28CD7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 09:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207442AE7C;
	Wed,  3 Apr 2024 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZm9pBQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8223E6F076
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 09:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135479; cv=none; b=QwEpH9TS91+iehRf2TzM2yhAcHC9ONZi5iotVqramPxD0f6BUYpwcAmWW2IEabeFBbrJjw9UBnCMdFO18JHnOl+m1Ic0xM46oN3JQyV9FJjD2HLF5w/QmE7q8JKcyt6YPJiC7YiDadOs9yz3akFw1PcX8GCUcTlb435JBBSvvGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135479; c=relaxed/simple;
	bh=17irNPUG8rONBYpdu5/zoIuYJGUsley5193TkmEMtIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AiO2XE2C3QzGdyldTcwNGKay01UiGeAHRyPlGz8cGFXF9qA9yPea+26MgIkGKYV7IQQ3bagbih5uTs+TXIstMAUK10JO2F9oBUjqkQW6KniuA3Lc7VXmoix0U6KMWexhtPiB+PhF2nTUv3q2q6hnrgE318atv5DQJleqzH2mOwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BZm9pBQs; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e2178b2cf2so47042145ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 02:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712135477; x=1712740277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NP1mArxks5bntvoBu6vgePRngXslO+DwNYzgIBI4xco=;
        b=BZm9pBQsAb6QaI1UZQaT6yCYdUjdNkYtvI9CB1ZMkms/GDTLUFvEzrcU9p90qZk2Jy
         T6G2YfVYJbsKficpr3E+mtLcJJz4eDYxqldzTtMs+wSnRjElsMCwmqhbQUKAEKt9HiIi
         an/uvidR83fyZnAFTBYO82/1zaqDGl5+Zj5LLkMUTzd9NC2GndPks7ssapZMtMdKkcvL
         oL6HI+VKtzG1KaErHFHHnGafjkOT3kVicePu4SZuOEsXBtNNz+ipnDCRRZLG/K8ALBdl
         wKLt+2/yAyvpS6H8vFx163jCoiKdgb1+vZGGph8OpjKS7v0U+HzI7WdWzdUZpoJAYMgN
         jkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712135477; x=1712740277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NP1mArxks5bntvoBu6vgePRngXslO+DwNYzgIBI4xco=;
        b=H8k+lUFZTRVuUFqKXlH6ABgF2zLPor3aYMLAxE04z/we8dVTK/8Qj+zzlyxu5ZmzDF
         3TxD1F0ha9H2euscFC/JR9351HMWhcYyR+62HlGUv9r+HzISAFqbfe/zJzrdJ/d3UzkB
         kWw7i92mFkYm1qDMBENXn3M5WeOLYH4G6Jfy0hfQEdUdF8U3JOmMrFS0tjk52sP54M0H
         Yf8BQejVyMWm3HAS2mh2c85EXpX4ufyskkgPR4eQnCFwO6KEP9lDaAAjO5GbDOoXgvO0
         i2BP3aVrlXhmfLN2oLgxdPQWPBxlNt4uCRInoTU/FT2V647Em8gDGQdS1hS3JirnS23S
         wVXw==
X-Gm-Message-State: AOJu0YxeiukF28dzP1Da6ViGaa/BA+TrBq5ZCMqlt2vUOTwheHg+rLFB
	lk4kkZBU3+gUL753IuwZri3vVqXU7UBuSNJeyS9WVRquiOLt091m/xETr0hcTraRIIPKTdkrzBT
	b8eqE8w==
X-Google-Smtp-Source: AGHT+IEvnZUXLpdEar+zDu2dEcKJ3XPbx7m6PBvpXM6ninTCE0WpaPkwirt2qnexBqWzAKnOJ5d/Zw==
X-Received: by 2002:a17:903:2285:b0:1e0:b872:d862 with SMTP id b5-20020a170903228500b001e0b872d862mr19646560plh.52.1712135476796;
        Wed, 03 Apr 2024 02:11:16 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.66])
        by smtp.gmail.com with ESMTPSA id lo14-20020a170903434e00b001e0aded0ca7sm12688087plb.239.2024.04.03.02.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 02:11:16 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 03 Apr 2024 17:10:57 +0800
Subject: [PATCH v3 1/6] drm/msm/dpu: fix video mode DSC for DSI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-msm-drm-dsc-dsi-video-upstream-v1-1-db5036443545@linaro.org>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712135460; l=2016;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=m6HQvVN42IUfffBpA5rSrdSQLAGl00b8q3W/bbmwYL0=;
 b=X1XSY5kWlW4EvhrnUx70p2aoQcx3f1DnnQ4OyjHIWQvbWeRXvcU2GduJDjEEDh2iXJNAm4MLN
 Z3Bv1A5eBC0BqnYTDzQzUt3NZ19ccVql5AenjM0xwfQJWidDKXu80Ql
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

From: Jonathan Marek <jonathan@marek.ca>

Add necessary DPU timing and control changes for DSC to work with DSI
video mode.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d9e7dbf0499c..c7b009a60b63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -115,6 +115,15 @@ static void drm_mode_to_intf_timing_params(
 		timing->h_front_porch = timing->h_front_porch >> 1;
 		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
 	}
+
+	/*
+	 * for DSI, if compression is enabled, then divide the horizonal active
+	 * timing parameters by compression ratio.
+	 */
+	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
+		timing->width = timing->width / 3; /* XXX: don't assume 3:1 compression ratio */
+		timing->xres = timing->width;
+	}
 }
 
 static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 965692ef7892..079efb48db05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -167,6 +167,14 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
 
 	data_width = p->width;
+	if (p->wide_bus_en && !dp_intf)
+		data_width = p->width >> 1;
+
+	if (p->compression_en)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
+	if (p->compression_en && dp_intf)
+		DPU_ERROR("missing adjustments for DSC+DP\n");
 
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;

-- 
2.34.1


