Return-Path: <linux-arm-msm+bounces-30452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 464969691F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1CC92843FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177E71CE6F5;
	Tue,  3 Sep 2024 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q8IZHtYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE751CDFAF
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333788; cv=none; b=q90Q4+Al5IP9UI+vrhMMhoEGeskde6beSrCsRNz/5knNXrQlYSiuDlz/gfr2V7EpgRrcm1a3GYxYBYjSqkSkcH1ByYuz91OftU4ncMDgJeEVtPXN8hVrQ3DXny1BMeylVQqhUlxVV9/e66Mrh8hR/aLsiZFz/icldjGxmRcXP0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333788; c=relaxed/simple;
	bh=iTBdjF6/hREMLxbMNkPCIYndio+J7XKe88temKLGweI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HPIhXnJ9KwdyVO/oHRQVbx/t8ChySYHDkK4ZhY7SnHSJva4mEX0VC6GdkzgXI2QVq/IO9DGj+/cXgpUsMYF+UFD3ztKHQutQxX/vKhlVuNnPsbLmmhSeHG4AcRQl57dEcqvbcoEua18Ky5FgKSYkxwaApq3w4ejXE3DwsAlnL+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q8IZHtYM; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f401b2347dso42412681fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333784; x=1725938584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jvt/zE2g5sFBtrEygf+RqS1sy6qu4DsII3e3BMDtLgg=;
        b=Q8IZHtYMiDvkamGCCUTA0UGgiNDoatZcR/PKOdjckFDVSyZ8UaSwY9KFVHX8iFnxz8
         Ic51U7NMp3YUROi8avuJJ0O8F3CFo2V7kMHekIDruF9glHnFq3fDDIfGCrOfFydVSNQx
         kkqgk0OKjwkNABz5kh2sop+g5mL9J+vbVE01j0CbK2flcSCfbPuz+PU2Eymqdald1blR
         xsiJgoWvsysBoit5NMVpr0i37uJGO52yrfgSVQRAsZ4DKdE0q9epKlOLyet4/3MRovpB
         AvfWB1ant62CM6ycdy9W+5vqKvjHiKHQXcE15atK7DHuepRLYzyUZOcREkOearS1WOwB
         azcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333784; x=1725938584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jvt/zE2g5sFBtrEygf+RqS1sy6qu4DsII3e3BMDtLgg=;
        b=ttmap18wzesrp2LnaLx6KFDYK39+o6BNFZN5sl7vb/PFZGxCOnutF3ru9XHaYS/UVn
         ji2ovy9Lv2PyjzfrYdlAyGphRbeigxsSZY2hXZDge816iAaB/NHqe32C6cEhp5nzlGvS
         0qNCrXOoQeTAx8PvS58Ndf0g+ArVyAInSU2/LmZobUZ3PAyy5DVI38WuV0ErQauQa8Md
         hbmWNOLEmjz4sSxTkfUv6zyTR50E6UNVWnffrc3piYnfVE1+Nay1nUxOqAJOi6V5q5mf
         XSwPOBdidjBwSL0JFCsuji1b5mtWQHt5ijz2twgaYq4yVa1QuXcEvfalylALwFkj0TYe
         CSrA==
X-Forwarded-Encrypted: i=1; AJvYcCVToGGtoJY+eh4ZzPSrYUKyy9ZN3OJvIBOjvcV88B6gG1/sFw/Tr0opFgl1uD+XRjta5e0FgW27EuX6Ntdg@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0c584irNrYgcUHpV86Esi26txEti2lCCFCk7auBmQj3v7l19
	2I38LeSWjM/Vo3uqw/Nr2+ARknLMGYa333BOUtyQbvIeHKfMYXih1m82go4m+hg=
X-Google-Smtp-Source: AGHT+IG2NOKWv19yXd1KfDhyIT6XWtwr6LCZRVwMvgoMzIrmU00jl7ZCn89Eic6jhwshku1GLd/8UA==
X-Received: by 2002:a2e:bc18:0:b0:2ef:28ed:1ff5 with SMTP id 38308e7fff4ca-2f612ae4c49mr50950591fa.15.1725333784099;
        Mon, 02 Sep 2024 20:23:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:23:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:57 +0300
Subject: [PATCH v6 14/15] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-14-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2318;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iTBdjF6/hREMLxbMNkPCIYndio+J7XKe88temKLGweI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9q1Rh7Ly2t/9Jdt9WUIz9PPu21zjmVWyIXY/2t+MXzjt
 WH13N/ZyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJiFqz/5U62H9IXP/RpOZK
 u5A2Vj3B2Yd2LJ10vv2shpKNlZw3p2DI3JkHmVM6vY53tsnVm88uCLxz4OTaKYnTW6NuHxR4X7e
 S/2Pq0ZNrvPOC3+6auyfnc1f+pPBAy+KFXF4/vJWWCGypNLM0XuOdoxd2wyf8j3KmT/DpJiP7U7
 eDuxI/zWpgD3/G9WHzzbCpfj6lBRWx+v9ufyuZEdyduGehJeNu2ZLURJvq/a7h9+KneLJ/FO3qa
 PcOFCjou3pZIuNfSd4OT7O2+GPdd1Jm1RySVtYNNLBfllUeNEfFp8FCx+/7F7blK7TZfRYW9p2/
 O0PTlJU9Yv2Grg/vXrYK/A6f9//93C3qN5e7FN64xXYYAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

dpu_formats.c defines DPU_MAX_IMG_WIDTH and _HEIGHT, while
dpu_hw_catalog.h defines just MAX_IMG_WIDTH and _HEIGHT. Merge these
constants to remove duplication.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 095bb947f1ff..b0909cbd91cb 100644
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
index 37e18e820a20..34e60483fbcf 100644
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
index f686588bf896..e935e9c05f04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -843,8 +843,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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


