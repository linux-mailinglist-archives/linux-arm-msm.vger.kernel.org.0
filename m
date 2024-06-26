Return-Path: <linux-arm-msm+bounces-24380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A40919A09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62CF3B22FC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE1A194A50;
	Wed, 26 Jun 2024 21:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQ1bqYM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16A319415C
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 21:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719438371; cv=none; b=JS5loolx6SQ0JVpg4K9bjFt87/2oUAPrEG7rdiyk6Rm0zOxkdR55f7lE2PLFPlmUlyi79BgmPyLU/wIxaBfk2ASzLN+ij0Ix9JiLuSTNXiMaq4vwJ12norXg5Oc6rU10W8NjzYdxQSE6s1h8FHy6KW4tUxMif3cQ0rj9MSK5W64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719438371; c=relaxed/simple;
	bh=jgWuBeSN44PBrqEAYaDRIleuDcOo2Otlba4SXVg5nDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwtG5sTmleidI7XAw0ueykQwdWfbmFTcNjfDX9rH5BcZQMr0dOQ7mWpzXH41bM1dBydNHjkDKUqOww+SRbtSYukj5P9MeL6uNkhKEKfZ2/e5dtXGPCb2R6BDniYMG4kIT8U7jSKL7vBscGYbcgQk/c7mGC1w87rkmLEa2bglA5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQ1bqYM2; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ebe6495aedso77600121fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 14:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719438368; x=1720043168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdQo5fWG8sEs0OxWIdnSfQFTLoUpNo6OhNW+S7b3XN8=;
        b=ZQ1bqYM2KUFLKfZC3x3vEdSrXkn36VBpsPWfCeO7+mFTkAqlhDvt/w86TbA6LJTZd1
         pEsYZzRXs1vPRRveIT4ciJF3L+An2VBOHgRGzwMvBzXorBeMU/StmcTqF0IwnGuHzKX/
         3TqXqr3/G/7DWvZYLU/IWCy1pMgluRDdKczkBdUi+R0t80YlyfNEQW/vYNfprGZ9jNvu
         Vny0YzGiTyOmjyu592HTY46FlcgjuGdWsPefHf2zv0cR8bzZZIruFLqZqlIsrOnZMAbl
         5qJGhQPEXEllDszDFASzsHEt6/ljpOQjOU1oOJ420n7bj/isZu2UofsqZbwOzy3OTvO1
         ubrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719438368; x=1720043168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdQo5fWG8sEs0OxWIdnSfQFTLoUpNo6OhNW+S7b3XN8=;
        b=dUMTQXcBO5vrJd+74Cp+ScVq5yL2m2HMKDZJlTWcbDBjwV+RVuyArHGidarJaa3Xs+
         ld/vuYhZ45Nu+PSWY87rxq3c1xOJLdRs2LZcthoLR9T1EUFl8gUSb9RJinSjrFMjO7Ps
         rqMnqf+6JIs2Ku8MVtPTsENDr7S1/+AjvF5GxGusIX40aINV0d0kqgAtNz5LNi5nstgc
         5cYb3a1ZacEVZ4vsl80+H82YJtLi3dHMpnHX31obpLyRXrg3nltggeaGwr1fShu9sNSu
         VQ6nriYWMnKjodBoo/Xup/Lxj3xsq9tEYlPGZpWmym/8mvDBqt7eDiL1lnKNLIXLfmAk
         BnsQ==
X-Gm-Message-State: AOJu0Ywgg8Y/YsoXLGfi1at8J5Cb1d79mQ32OkSeEH23NvTPRAMn3hIh
	Sm0S00N7jOgBHAtVN7XW1LZVnBzAr3XwWJwbLca/tQFA+8/9vZLtKhNnlkLFeM8=
X-Google-Smtp-Source: AGHT+IFUl+VFc79I89/FDHkGL4KCoMOtJiejNvWq3P5itbcnexAaYWN7/2NPdgZN7XHgJ0BHl7Igog==
X-Received: by 2002:a2e:321a:0:b0:2eb:f472:e7d3 with SMTP id 38308e7fff4ca-2ec5b2840fdmr67893571fa.6.1719438368002;
        Wed, 26 Jun 2024 14:46:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 14:46:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:46:00 +0300
Subject: [PATCH v5 06/12] drm/msm/dpu: drop virt_formats from SSPP subblock
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-6-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jgWuBeSN44PBrqEAYaDRIleuDcOo2Otlba4SXVg5nDY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwYPPR/q9+rC0FZwfZgjVpsP2ug/iOukLRbH
 8ryN9IAB6WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGAAKCRCLPIo+Aiko
 1bEkB/0Zq5FZQ9G7cDENIhIzcY7jzbwKqrEAkB1df2lSb7hN/vF33F8Z8F7WLFA5fgMwAM3a/XK
 CIp2fDAbXFvCe5VZRU+OFX1toI+tmrADh50/H+yNXC2XYIDEZMWJOmvRNbZuI6FZ5Qd1ZkFqJ7n
 ysMv/1Sq+XHOdp8x85RK0himr6i8djJswGLE/ssLC6npqdG2vuy6+N0oIBjCjnkjsG41u/WhN+K
 AT4hXMLXt77XOYR3nFMjS5+dXudBFsKkhcgcNrdMvnwK3qOQhBQPTx25sTMo9j5J6GLwWA7ayCg
 pRF8ln8E9lRiDeGs+EKnZsflDIyBxwkv7PEen18bBr7UFYS4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The virt_formats / virt_num_formats are not used by the current driver
and are not going to be used in future since formats for virtual planes
are handled in a different way, by forbidding unsupported combinations
during atomic_check. Drop those fields now.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ----
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 648c8d0a4c36..a3d29c69bda4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -283,8 +283,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = NULL, \
 	}
 
@@ -299,8 +297,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = rot_cfg, \
 	}
 
@@ -310,8 +306,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 #define _DMA_SBLK() \
@@ -320,8 +314,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 37e18e820a20..3f2646955ae0 100644
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


