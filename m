Return-Path: <linux-arm-msm+bounces-22654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C902907F0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 00:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99CADB22ED3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 22:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B71214D439;
	Thu, 13 Jun 2024 22:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUZ+2D7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA01155CA7
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 22:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718318193; cv=none; b=hytQOVNcsj2AHJTOFv4bwqeDyH5Y5X+WqUlqDZ18bCNG+wtJRHMO+7+Pb7FZPKqUbZFEOaeOeHtBDxPH0eOpQQHPkvtCwVE+/X1x1mMA7BZowFGoHBu84xXMC68jBoi0ibGXZIev9+YEUhJlXa18qi8f71UU5DjC7tdch33V1NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718318193; c=relaxed/simple;
	bh=kt+mUO/v24R5t4QFhxIPYKNo9RIjNHA9NWWDdfrHipk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5XFJVnCZrgpv6/iiXzUXNAPkPlQeNxdSv9cuGESZaC/Iew4pSOLW5KrTGxaGn2mFXkt4HQKKAN5uc65wPrOmKiaxDskGumuOQI17hoF3hBa8msPBpZ6Rid5vA9/49AdrK2oJ0xtWvyJ8jBkhBSmaX3aP8cFNL8ewcwW39A+MW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUZ+2D7C; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebf961e504so16181341fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 15:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718318190; x=1718922990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcbpVWRjdcbUgJJRZuH7Bn/JQTVuo4vjsCW3dScHVqc=;
        b=HUZ+2D7CysET0X1+68dqCVoPFxZ+geH5qWmJJaS9OOzxRSn2Q83Kynzx9yOLAkzRGe
         O1W8R94cZZfLLD3ySWYOGsl9n0dizzyA/TgJGAQk3pFT3LFDAj0Pbz6xdZI6n2dsxyWP
         MrDZHHJZzdNXMEZFi7+YsLyeMyFMHznb4xgREZgInLMPEYBX3tM+eJv5NJ16iTU5DriT
         8Vp0otacoqvKjH6p6mtWX7iJ3XKFOXyhyEAFgpotTRsfhKn115FJzgsiGkvrFpN7JxYS
         QlNBbiqlQajhgln9Q08AReU526gLFTxoG5vFpBFkPGX8t1yThZlZTskBI0kswvCmlNIM
         v/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718318190; x=1718922990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcbpVWRjdcbUgJJRZuH7Bn/JQTVuo4vjsCW3dScHVqc=;
        b=whoPWJb7D13K0Mnrzq7JInI9ro6guj9iIV9QAMHy6uvzj6XPagV+H6clOQi0Z3yRiq
         RabVBIzgab4fa7uxrwrnnF17oAsakqX8PgoudGYYLS5IT7XhKZZPGMb5br9/FTI0x0Au
         Au3cXad+FsTTsXWZ+TsvCMnxOvTrchFqiGQ28LVjFtWqJcUcutysSVgKwA5sGcRCpIcB
         3s305lD7YHVR5jADVxxd0qxcYGIk+mRY+MrMaVc9p55Od5m7SN9EAF9NI5hRlPVMceG6
         wvty+Syrh0E9aUG3CdELCvAcbmReZ3CY3SR8Qr39lvMQiRl9ekniyMfnz9ivHtkOewkf
         0+eg==
X-Forwarded-Encrypted: i=1; AJvYcCXTSN48lUbsx1K9jfKFhWHqLLSVFQDJw/Qfpemz9KKRt6to3msGOHTJU050QI4qUkpD6nWxikLXyCjjDM+WzgF3YtCj0FuQllwjA/m9qg==
X-Gm-Message-State: AOJu0Ywxi0qnRNSTlwZM3pgHmZi/YPtujuvELnRzfuE7pLD+obsveRK4
	pNVjruM5XveHBdhHwAQ9oIrOfQ8Q15v/iTPvBYtG9valGNNhdcCHWG0rV7pEf/M=
X-Google-Smtp-Source: AGHT+IGsyaawUFf+4gUUXghFvDdv4y1xpvcJvVUMNGD0sljbuiH+giwWWJTcUPZQ25fOTrL/LhS5JQ==
X-Received: by 2002:a2e:8916:0:b0:2ec:95:d6fe with SMTP id 38308e7fff4ca-2ec0e5d0c72mr6566751fa.24.1718318190174;
        Thu, 13 Jun 2024 15:36:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 15:36:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:09 +0300
Subject: [PATCH v3 8/9] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-8-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kt+mUO/v24R5t4QFhxIPYKNo9RIjNHA9NWWDdfrHipk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RmO/n8oQ7m5GUV6PCv8vjZRnk1Wb8KG772c
 axat1t0r7GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZgAKCRCLPIo+Aiko
 1RdTB/wIZcYOQP5hBApus8nkFn5cIUqfCapzLOFiJnMZfNs1ExujIjR5U7kQpdIWH+KnRkHdblr
 Py5jgqxWCXG9w7EYES87j9Kyzsvmqp558qv1ZFu1cX2uXtkdzU3gCrE7hitxMOEgusHioLnuJYO
 XyQYgRybIoExMJie0qOQYnb32UUQBk1PrvRC0hHMdq7s7LP9quIJBn0irPVJwkuG+ZJS1GPNUe9
 Op0vjgNMfALEitbxs/3qpM29/ZpCATB+qdW/PSODR8hvjPugS0cJSyKI/xPpVEfar44RlzwtWYe
 x6G9ORhxBMXMLVeaBW0KxLMXbC0VT9LvaC84Uew0QqkkJDCc
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

dpu_formats.c defines DPU_MAX_IMG_WIDTH and _HEIGHT, while
dpu_hw_catalog.h defines just MAX_IMG_WIDTH and _HEIGHT. Merge these
constants to remove duplication.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index c6485cb6f1d2..6d7c4373bf84 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -13,9 +13,6 @@
 
 #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
 
-#define DPU_MAX_IMG_WIDTH		0x3FFF
-#define DPU_MAX_IMG_HEIGHT		0x3FFF
-
 /*
  * struct dpu_media_color_map - maps drm format to media format
  * @format: DRM base pixel format
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d1aef778340b..af2ead1c4886 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -21,8 +21,8 @@
 
 #define DPU_HW_BLK_NAME_LEN	16
 
-#define MAX_IMG_WIDTH 0x3fff
-#define MAX_IMG_HEIGHT 0x3fff
+#define DPU_MAX_IMG_WIDTH 0x3fff
+#define DPU_MAX_IMG_HEIGHT 0x3fff
 
 #define CRTC_DUAL_MIXERS	2
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b5848fae14ce..6000e84598c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -852,8 +852,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	fb_rect.y2 = new_plane_state->fb->height;
 
 	/* Ensure fb size is supported */
-	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
-	    drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
+	if (drm_rect_width(&fb_rect) > DPU_MAX_IMG_WIDTH ||
+	    drm_rect_height(&fb_rect) > DPU_MAX_IMG_HEIGHT) {
 		DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&fb_rect));
 		return -E2BIG;

-- 
2.39.2


