Return-Path: <linux-arm-msm+bounces-24042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACA991589E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0BB6284C8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F501A0AEE;
	Mon, 24 Jun 2024 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L9YpOSUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2151A0AF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263640; cv=none; b=oFvykaN8qLq1rTJsL99iQKhLG0vvqOmTmPisEFf2YTaY7mESOz+Ac3sD/FXlOJx8Xmt/rwl/JYTOXv4kChXnA0daICCi/RTAoNX9ng4VnT7lBveYjyfceJN50L4E2mzPFvThSUtlf4sLQHgaCDTEWs+pvTN+A3FyeXeObJnpxPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263640; c=relaxed/simple;
	bh=ga/ZJbhrUVk+TaFBI1WYIbgIC50tjM64eskl8EV4ahM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zh/1pfqcKfdDynE6aeVi0qIWw2vAy4iE/IZj8CFqad/xZm6layl1vJdEFaPLe73Gme7QQyYkAvTw5X/O/8M7kfe4xgSjaG0FTAPk2ZBs2Feo28QkkgD4G0WtMmYzEdlO0bWnqif+ayVkU06C//dDFaKFC9tJo+5XudaE7N8NA3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L9YpOSUG; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ce6a9fd5cso1336002e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263637; x=1719868437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhtUg4xKtrM2KIw9xkdeNLk1MwemvpEptf/1N559jEI=;
        b=L9YpOSUGGvi0jf1r0/SDPx4SDlRnR4L9vYxk7Y1FzfngIs7UIa51klvQJkJjSuF/RS
         iN2g8qo89gA42ovP2HcMsXnNze94Gu6gBabgd8pFXWyc1EHZ4Bn3RcMu+XcpcMRMhfNT
         rZ/DLvA6PN9Tlvh3ojUI0wxjZ3mIu0Zi4yfvvH5BuM+r40CKY3Xqlrj95GjNzUcIfs19
         Tr/9jP1Es0FyAgnYU3igTUhXTM16v47yBv3iVdNlMyRJJFPmNZGlIAkSN8VErFaawMOP
         hlezhLwyFsscbJacjIOCRGi83zSSjeFFDXLkBGuQ3gW94UDWPZQyPQ0DYuIdT+u37Etc
         tDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263637; x=1719868437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhtUg4xKtrM2KIw9xkdeNLk1MwemvpEptf/1N559jEI=;
        b=jX1j3LkpGRhErwMSx8TC3RbSdX4PS9FFZDJAIaFBExcmOlm5dEruEVNTk1ZEXQ9RqV
         7kEe50UKUU9ZFsi/PZ2XblbfWkPOvFcOKiUxwfbs480hqXvrLspPM1Yasnw5LQCXIFI7
         o8f01/eWIJB+9XxmWhydyFYXbBnCY8qSuMddovGYxKnqXzbHwfjpVj7JomnncDdInWYd
         /3ZRm4hvMXUgdZ+GRh9LHKiZ7maEk1ZSmlQ7IAdtNasyUNQ6B5bmau5Kd5wK3fuFrTwT
         QAdViBoRtZgVvC2u045pefsVY7ri8VshtCp9I/LZW46aVHYkqTwgznTQXjdgyhKrZjKW
         qdcA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ6sDpEqhgw8L8FnKB/M4A4J0MB/IMvPaoNb7zcfd4f67nuTza7TEqKj8TmClVbavtYQt34QXjeZDbOyDaYyvxIRH2P5ESlnt+zLEeFQ==
X-Gm-Message-State: AOJu0YyZBbzhNHF2jl0dEbo1tAoL1Rz/+09KB4uw1L2zUHKUIza25K/j
	tPjRD6009loNpTLUVoRvyv76BRWeYMWdE15cnGApZs+8x9ehhbga+B7yHOBLdMw=
X-Google-Smtp-Source: AGHT+IEn/8pYFHHsUYsCUA3AH0wMuD8BbY+Hf+vcS8G2aWxv4w8Ud3QJK2CWcY8TABy4XijCrjJkOQ==
X-Received: by 2002:a05:6512:3285:b0:52c:df9c:5983 with SMTP id 2adb3069b0e04-52ce183b3d6mr2919217e87.40.1719263637413;
        Mon, 24 Jun 2024 14:13:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:55 +0300
Subject: [PATCH v5 15/16] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-15-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2318;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ga/ZJbhrUVk+TaFBI1WYIbgIC50tjM64eskl8EV4ahM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGJAq5u69LbJZTDB43AiTQO6FQYIkCXkTmRu
 eVRk56LecGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiQAKCRCLPIo+Aiko
 1Z1cB/95kYcJ6MM1VT/CFKPYNkgMpsCb2dVm/zUSYjD8VQyqepy6r/jXYCQLbayClbStTkVmKGV
 ecp/6RAjzsqNpArXEBQosfscQujCR50Sy3DEzZjTGM1GAOwng2rGPtDSaYv3GBd1R38c4F6jCEA
 gulNrLuWrdCMm4zW8R+/k0EJ9LtXWfhjjU4vajHA8WCdUEfbQ6BWYha9UzJbf31z0/bwwh/LedY
 +sBllkx2Up+Rgo8c4utPMZkWJ8xi+yQmeY5tELoColQmuWEeYAvoz+GQciVDj6Rhy9tnhvtnBQj
 ctKJ9Y3juol4cMER9MaCxjDz5uqhTev0JwdVH389Dxq5KFQ5
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
index a629eb3a6436..4712aa6f7929 100644
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


