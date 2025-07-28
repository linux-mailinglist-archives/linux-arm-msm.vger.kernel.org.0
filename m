Return-Path: <linux-arm-msm+bounces-66847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73EB13B27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 15:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8199A7A7CAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 13:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488D82673AF;
	Mon, 28 Jul 2025 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hupPl1x6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709A2690E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753708492; cv=none; b=R5T87lvcOjiYemVOcPGAH5rKThF1EIxuVEbcCwj6BN/BK0/eO7v+w6eExfjPZzJx/Ee/JAeUl44ADVeiNUuU6CvpH28a2/pfnlNPSE4LWu7JU0x5sIHL9DaHitmB6WD6efuCi9Sc7tLHJnUdaDLFlnmvKaxGV57NCoXrAGPdZ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753708492; c=relaxed/simple;
	bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qdQjGeL1Hldb4sNq4VOgrhNQDoGnEh2QK3Jl/3WyIwzDTKKfYLm5EQR46upvQCqn4RYcylXLTTmTGAN2sjoNXY0R5UuQHjl7lka1I7gKjILfCr3VjaCq5gUIZqxNbt00ewsYsYnqZjvL2Z82UTwcj8CgNRkO34Zbq5Z3jiyPHPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hupPl1x6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-749068b9b63so2949485b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753708490; x=1754313290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
        b=hupPl1x6bOZJDjPsPUUyKDBohKXUC84SdG+ljHcjX7Mrw7/hVS8Yd1yssXbBUmGdz9
         YXjQokNGexR+y/ObJi+1wvfsGCYeuivzzUFocYD3fLf1ZxeRwc+8IfFWGvzpgVwmhaex
         awlpRaVOl9LMpahLXW/wc8OvRtEG6cTaZAJPA6wIfu9tzslZiktICanmVoJ0nZfTpLzY
         n64VXGBbvKw3vbUCzUvSx8nk7gj0Do1dUfs8VM0NvSqCmJkvIRMhFdwXgXxHa3VbYHmQ
         lWLFk9K8yVGR4BCcj94JJgXoM3j9n0MBl7liahYyc+jUu0JS4P4jEJLZuifpHhpvvuFm
         +drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753708490; x=1754313290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
        b=fAuiSyHGS6C7AL88U1Yruvgi7G3FET82j9WlJi5uN88qk9r+Bw8icqXGTrTpNgi7X3
         4ATpyuLZcQLYEqo6hl50x+EH4Ae762DtwqDggRevG0VgGmcZRojOnFWpzlN85eBoUhcW
         DPhad/+UiMn9kX4a7wMk5mcmWRCCXvCAebrhIMaGIrXz6DF5fZN6/dkTvKojh+/C1pKX
         p0O3moiS+KpzDsEmYPWHtEZEDTIaiNOU+GHiWchu6o8kBebsTsoYw03N88Rx0kVAb8dU
         QqDQeZzTRE1Duo7diMwMSWFstlO8Ryki87ttYiRFnlI0fZFAd+gV2j4hjaW14Q2XWzRj
         G+Lw==
X-Gm-Message-State: AOJu0YzsW9UD4ffMH5GHt9fO9+grhpsXsXPuJE46xMl6svXK3W5zp/m+
	m5wVidyP9X+ce71JGGbYR0lyWq0cgJTNYe+5im/11TwRkNafq4MVG+QHAqdE31z/FdQ=
X-Gm-Gg: ASbGncsD5nXW6pkzr8TK2mVA+ZYE78INA8cq8ZO9x1tOXqWt8am6JkOCCOxYWjqA+qZ
	kDOf9WZrACUW2YKrLIfUnNVO7EE3y6u3RcZQV7dVl2Xe8NjEXHw0MGFIlDroXGZyX5DP89rbwAX
	D/CLcR3G30DwNkWgFuJ8G6iji7clUAatO5lnAnmLAkNiRh+usYiA7G+EPVWtEV7Kh9Ppco2+DQq
	qaMSTb+Ucvqn5D162lhKnhJI1v9kzkU4GPoTZqFaV8zfMl1VykQ7HHYSIFtdn7jBviYFHEdlqqa
	KDkLbiogAz4WE6SCCbYj8rRycrPpctJAWIo1jgIbYrmzeP7y8WnwA5OGDdqPCOE8kNL1x06pu4B
	yrGKTs0Z+5ecSX4M6Ig==
X-Google-Smtp-Source: AGHT+IFSZyRWdtW0mh6zqkbyC8Q1oMZ3riVwbiurnyWotEvGGTjq3eqwN6p3TvfIRE7inyVAAPak4A==
X-Received: by 2002:a05:6a00:14c9:b0:748:f3b0:4db6 with SMTP id d2e1a72fcca58-763340dc684mr16181244b3a.11.1753708489719;
        Mon, 28 Jul 2025 06:14:49 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 06:14:49 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:25 +0800
Subject: [PATCH v13 01/12] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-1-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
 b=lVpvqNqN4710MACSOo02aP3ML9e8AZPuQuFTAF4tkcRI2wnxVjA2Op28INXYKbd1ld2C2MPfo
 1L+fKhd1vOoAIWq0tgV0XQ4bXeeC+WHqW9SSUxJkIYV5ZBFFCECC8LH
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 25382120cb1a4f2b68b0c6573371f75fb8d489ea..2c77c74fac0fda649da8ce19b7b3c6cb32b9535c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -865,6 +865,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -946,13 +961,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		}
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to crtc %d\n",
-				  blks_size, crtc_id);
+			DPU_ERROR("More than %d %s assigned to crtc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
-				  type, crtc_id);
+			DPU_ERROR("%s unavailable to assign to crtc %d\n",
+				  dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1


