Return-Path: <linux-arm-msm+bounces-35755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 046609AF618
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 02:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 269541C21471
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 00:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3470E433CB;
	Fri, 25 Oct 2024 00:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U3TxWuef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BA5FC0C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 00:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729815622; cv=none; b=D8lRJOAkQBfPEs8cU0IRX8ezrOs7W13ZUzLT7GcQ6z4eR41Oa5G4W8raGrV+nLXeUtiLUhjLMK0WS+vXL6Ft/de8cbNVs9HqXt0twQ9a8W6tuJZL0WB6w7+9w60IfwXdNxvWuBTWFO4EFjrUD/KXIqJxQOA5QbAss7GaKuMd69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729815622; c=relaxed/simple;
	bh=tBM5ZHVDqp/ggxgh+nGqHn0WBtaJgoFLbizrCaVdf4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzEynWytQs0+CVK5aSyEWjKgqWEf5xJvlSVx7FdIAz1PqvWMJfy2YDvcH0pRbk7YaVJWMQZsohYcsquJ/r8UZDTEZ/w+KqZDMlB4lJTaj/pjXcmz/nhTN4sy3YGtS0vVHwdZhKR+mbm+5kg1+4eNS2FH+32ztmkXHpnfhR58N8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U3TxWuef; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a16b310f5so218497666b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 17:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729815618; x=1730420418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZZkDePstTJuwJ96EH3uXNnHMnvpB7WYQKxAsltEhs4=;
        b=U3TxWuefbloppi1JvzfADC3aa0SBCnh7cEpRQJnfaT9/F3U4cMrHXIHx4qmnIAhr23
         fdzw2THUkzDO+VVbdw0C7r5ZH7HT0d1e+lTzZXmLZXvG+xH5wGh+sNA6bDz5i8iXpFbr
         g03X+pmvTMfKbJLjDHfKLIAIqHrc5kU3P23bTfy3GTq3Xp9Y6J2feAjlWVDDodgolOua
         xYIDevq18UOGhTCuhE4B6GE47JcnVbjijTPPoRctGQEfUV+vj/0kyxSil2CBUq3sCgHn
         38CzVh/QMyrJCmLwAOLRuh9uapcOBzGscUQJlkDPpimq59H6OjAEbTc8k4pN3h5xnjqq
         dKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729815618; x=1730420418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZZkDePstTJuwJ96EH3uXNnHMnvpB7WYQKxAsltEhs4=;
        b=bVVFGkjzvFZJv86DMK0hzqYToN5Bh0rzU92Ht8xwN9ldCZcoMa2baUuITRisq6bZt+
         M+tsfvpcH4gWu3MsyvNUgH3eefqDEyu1oy95nWRjfyb1JOROeBqUYBahSJujx1HjL/Fb
         cr4zJUJPSUz4liT4Y6yHoXKdsXjkT1OkTselTdYDfTGhibzc/7Ead6bVJboPuY1ZYhwO
         YXig71UtDcfT2o4gXzalszJwpicfGyNFfW3Ya2gLsSrmScTUhdb/6IvOA3avHhurg2hq
         PCxME1yfFKH7tDy9u1PSzjxtsPc5sbiP1m1JZkeTltsTnR/kKgX0a+gEbB+O1YL8ru3g
         DUhw==
X-Gm-Message-State: AOJu0YzeJrzSa5N/Y08aFNEWlDGvoFgazAzEnt/nWIZnG4ySvuFd5aTv
	QhHWgVAQd4cWU+IvKXuc8QMoO5goiDlbVPPhHF+Ga/GcTmRng4hZtuBQxlJsu6c=
X-Google-Smtp-Source: AGHT+IGfLGuZ11NKLQzcMCjgzAbykSZ7Ywu8iQJoJVAdqvbZpX6tU7NZd2ImvI3L9BmR5RWWNtZC7w==
X-Received: by 2002:a17:907:2d8f:b0:a9a:67aa:31f5 with SMTP id a640c23a62f3a-a9abf85d024mr742840366b.10.1729815617704;
        Thu, 24 Oct 2024 17:20:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:20:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 03:20:10 +0300
Subject: [PATCH v6 3/9] drm/msm/dpu: drop virt_formats from SSPP subblock
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-dpu-virtual-wide-v6-3-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3641;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tBM5ZHVDqp/ggxgh+nGqHn0WBtaJgoFLbizrCaVdf4U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ61qEp7BtCLTOQeLUBGK8kSLpIQo0o4l99l
 PmUo8S21/mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOgAKCRCLPIo+Aiko
 1ds3CACSlyGTl1xRe0S7eTfpHofuP2JOrZ8lcnlmGSaehi+uJ1XEJ6zfPThYkI2PGfdZrzgIfqj
 Eb+4tE9R4ezwm7AWZlIGkiDd6pBmXrujKbGCXQzPSMi8F1ZVLsPXU8AjewZXfm+CHcR1ww9xrAa
 VVz9duNLmmkjsuEgXIhW76uUwAPhtVxmxvEgIUwjcCLLPShic0iEIwJOLLLK3XRSsFSusFoEg7E
 QgZeNSNLUj1PGYdEeeEsxplvO9SRMQDBZ5LLhEQ4wk4JLHazuf8pXL8NfT08e+NAn45GzCxu6BR
 94Q+5I14leFOpcn6GmDxbKIO+Qpo6AIoSfu5U6hQ7PqOcGMQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The virt_formats / virt_num_formats are not used by the current driver
and are not going to be used in future since formats for virtual planes
are handled in a different way, by forbidding unsupported combinations
during atomic_check. Drop those fields now.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f7efeb2b77c4..bfca993deb70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -317,8 +317,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = NULL, \
 	}
 
@@ -333,8 +331,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = rot_cfg, \
 	}
 
@@ -344,8 +340,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 /* qseed2 is not supported, so disabled scaling */
@@ -360,8 +354,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x320, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = NULL, \
 	}
 
@@ -373,8 +365,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x200, .len = 0x28,}, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 #define _DMA_SBLK() \
@@ -383,8 +373,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
-	.virt_format_list = plane_formats, \
-	.virt_num_formats = ARRAY_SIZE(plane_formats), \
 	}
 
 static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 817e98bc6997..78ae3a9f22f9 100644
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
2.39.5


