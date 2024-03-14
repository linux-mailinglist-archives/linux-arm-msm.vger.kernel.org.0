Return-Path: <linux-arm-msm+bounces-14053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FEB87B58B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B65B71F2247F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD339473;
	Thu, 14 Mar 2024 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AMOn/niR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31618BF8
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374544; cv=none; b=sDRdCgLiPOTanjYhxi1rCiGt1LPUHg8XPDRXLIWbdpCBMluR4tr3qgf+F2GIgYhU3uNGtpPSbc+hSke3OrLOlblkUXZvwOaW4QKsXuzxgbCO+KC32KWQ7za09q880z9I9wJ35ao3kjQVHcKwhRqDx/Z0R42EqTUiojxHqxQVArc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374544; c=relaxed/simple;
	bh=KNldNFyPEEfzuAEtH1cnTT4X5jlP7dQNiCH2aZ9Uhok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZO8iUqDPheC3UV87pxhNb2s8F6dmy34+Iji2xMdSr7cZpNVVlZ/nfO5P3jGi3BRl+ijYJAIeqUI/SpeEtTnPEZdWAtxQrcsh/K5fC2fvCJWNJ8zggt/6wxPLlkCQe7G3vUTEpc5ZZiKHTksX8VuJD1DtI++TlkMPEGJMSRGhVyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AMOn/niR; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5101cd91017so696719e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374541; x=1710979341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clvqfuDuLHhOMDUpN28VXezisf/pvnw+VhoyO8COXfI=;
        b=AMOn/niRmZmk4FWG9D/oBEId2qt0g1H/zhHAEqvJUSS6Lqx0ml8jNiww2hD3u2M/c2
         7d45K8I5zku+AwjdPiGQyP+9NOwscdIZ5hoI2N6dML1DOWijY0Oxk95BdiLgk6aDpJjv
         28GC45xyxFK5ddO3rHziOlerjLJw/0lyP3QihQxM2wVGiiTrCt0x2tXL80up1l7hrA+o
         QNuKBaEkMGKZr8wUz9ugvCqGu8xHaz3Vwaq9xMc7cV0zLuhSOBzzMXHXVTbQ4XdVSqZF
         WfJ8yEtbchtz3fslxrWH14MuboMkBmyPMg89PYu0SZNkcTFpGJH31yBxAru8bZl+5E8z
         PYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374541; x=1710979341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clvqfuDuLHhOMDUpN28VXezisf/pvnw+VhoyO8COXfI=;
        b=QxEIca7yCIjff0FjJzOL3r/36Efr7y/UDgnT8bBu6YEjmibjmL6VuL3xxH0Ql/a9Ry
         OqydxAMk1DcMT7nfhi26bRHezuXtP3OEAMAIhV8qz8ueFW8hZojd+gYiMR8ynP81T//S
         tEaYMNRr4eRqgfDs2MnNmV7ttlxGAsy/mMIrwcA7BctNAw3YTh/Wr9vKyKT3HZBhon0z
         kFVkkL1/JLl4etepNOytA8QuLg+u8oN7Uv8IM4OLCKnJ7YCw/OmVW/wE7yTMCTab7jt0
         CvzEtqkwHF20+hliiShZtCRU4rfr6t/y5/m4PzTLNe1m1qBCTykbjQa3VR+UXYonsb0G
         pO0w==
X-Forwarded-Encrypted: i=1; AJvYcCXERMBzp4oD1XkxkZh9VhrEjHumBNufgQxEwSLckmBOR1iS/ND54BXG2PhjIhGZhsORhqPG/7IhMof146nH/JbJJKxPlqKZvgoq7pSvQw==
X-Gm-Message-State: AOJu0YyRE1X0j4dL4P5/7i7vWJ/9kIdM6TxIzjmu5PcUQnAAj7Gleej7
	RQQmg+xY0qLLsU/V9T54IJRgyWziXU35X4SHFVprPXDnpzIS4pTDp61RZaPiUaw=
X-Google-Smtp-Source: AGHT+IGDNT6i0DXVmxw8bW/VTemWoJzET4Y18lYpr6RE06EgwiFAMctoBH25D0HuRmKi+lnoQc0Fkg==
X-Received: by 2002:a19:ca51:0:b0:512:bf43:d786 with SMTP id h17-20020a19ca51000000b00512bf43d786mr55047lfj.10.1710374541287;
        Wed, 13 Mar 2024 17:02:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v4 04/13] drm/msm/dpu: drop virt_formats from SSPP subblock configuration
Date: Thu, 14 Mar 2024 02:02:07 +0200
Message-Id: <20240314000216.392549-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The virt_formats / virt_num_formats are not used by the current driver
and are not going to be used in future since formats for virtual planes
are handled in a different way, by forbidding unsupported combinations
during atomic_check. Drop those fields now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ----
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f2b6eac7601d..a2e4832aa25d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -289,8 +289,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = NULL, \
 	}
 
@@ -305,8 +303,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = rot_cfg, \
 	}
 
@@ -316,8 +312,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 #define _DMA_SBLK() \
@@ -326,8 +320,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d1aef778340b..addf8e932d12 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -372,8 +372,6 @@ struct dpu_caps {
  * @csc_blk:
  * @format_list: Pointer to list of supported formats
  * @num_formats: Number of supported formats
- * @virt_format_list: Pointer to list of supported formats for virtual planes
- * @virt_num_formats: Number of supported formats for virtual planes
  * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
@@ -386,8 +384,6 @@ struct dpu_sspp_sub_blks {
 
 	const u32 *format_list;
 	u32 num_formats;
-	const u32 *virt_format_list;
-	u32 virt_num_formats;
 	const struct dpu_rotation_cfg *rotation_cfg;
 };
 
-- 
2.39.2


