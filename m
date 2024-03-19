Return-Path: <linux-arm-msm+bounces-14518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1675587FEAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 14:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1A53284266
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 13:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3E280021;
	Tue, 19 Mar 2024 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NCumf5sy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0207C8062F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 13:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854532; cv=none; b=VjHgzl3KmmD3r0lYVGEkaHQSSiWJzuIJr31g0xF0V7NO32zzXsO3bFDtboIpPVtjIyQP9a9f4V0ko1PowLL9YPFqUvtEZFhL4yqXQ4sKT8W0L3MCIsxmCKdhpopyn/kZXzpLbSv9ej2zddcRZc68vdNxaYun5UCZemaPNCKhhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854532; c=relaxed/simple;
	bh=oxONTvBo3a22TAARxRZKWb7mB82JhjnItvZbZYS2bz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XDS3iR/5ZBmD3O/+VBzldbmP1Uk3BfivKGMz/Cc9nvsqKv+R+d8y87SctTqDvEl4/d7lBl3wy+TmKDGIuKu86gYCk6duT1DVbPHi4o4/s1CoEh2+EnUhHcydUb2GybGg4DmCG4yOhCy6anhq5qr2rBJJqCoDR81dABTio7GNUo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NCumf5sy; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d475b6609eso71155621fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 06:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710854529; x=1711459329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfmAQzn+LLNOd1P1Ei+JN2z86jgOlHY8peuyPP1BcaI=;
        b=NCumf5syCtsMrEb//zrEZCJrbUdKKQ3vQn95/iu24Swax0I+/DuzOVLQP2PokgYSLg
         hHGAfPSpY6P2EtVp+WsqGbyuE37/0GY24o1d3WuMASlYSXNsDV41uH+RJTpABGYS3u4G
         knIYW35Nq06DTaJnuBq0g6VyDMcOmAIf3lj+ZkkQcL51+DmY5fmaivRw8MzO//Q7873y
         1xUDvlOzuTV5YMOrO0EArNRtoGcVJq4BBiJwNAkv5RVz4+4c08KE+ff7aAbat9EZ5Hma
         CK+hqylDHACuh/4u+JqmiiaHeueWehom9+ajCwVbfRRpjQGA8045ayqemuOgFE56R6tT
         BYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854529; x=1711459329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfmAQzn+LLNOd1P1Ei+JN2z86jgOlHY8peuyPP1BcaI=;
        b=ZH7xsmfDQUHEFATZ69iZo/562n2FkJHok+pyZYsmVnt7XPsoK0FQ1GTyyx/+8J5Bws
         78BrBLJwbzUJ4/kQ+pKJGNPCIZDq1gIB4QO7cKDT5Aqa+ioVKGYNZ6tfVA8CGHtWBi3x
         ztXRG/RegrLaSS24eFsAGBwho1u3c68FoX1+iUkZe7LrOs7a4/QrSIDspSghfz9ox2KS
         ewF+27ib2RyfzCL+bix/b030mKUebb2u6nnKPinTtmsIvD/FwPtXNcyMlq7af6IzGCiD
         44j4t8I2iZtjBbUPlb8I/l3hVCaq+UFmZCAXP7mwhTbExzQ7FigbQM3LKY6RmuvWQOQJ
         U40A==
X-Forwarded-Encrypted: i=1; AJvYcCUp+tYGPB6wd9b/bhpEUlkhQGCS0mdTJzjX6musvZJW2zh8IcrHDYFTwndf37idP7ig7l3ShQZcxSEirPbnb3KKrV0Lv+f0jmYF/8Z2tw==
X-Gm-Message-State: AOJu0YwMUbbMVaX3jqbekdrfjpkyw2uJDSI9/653T8dzsCCNB3cZP8Yt
	tg3DvX2fGM9w7Ym3/YoHohu9Tmsl43dEp38AexKMBuONYSIPcUUbAV3If9AAFIY=
X-Google-Smtp-Source: AGHT+IFX1aAEpEwXPmaUZwe+U7THcR+jVQycmmL88o52TfP9WgSU/bZekNQH7YzEgPY3sCwDXKJzEA==
X-Received: by 2002:a05:651c:210d:b0:2d4:64fc:65bb with SMTP id a13-20020a05651c210d00b002d464fc65bbmr2650875ljq.48.1710854529349;
        Tue, 19 Mar 2024 06:22:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:22:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:06 +0200
Subject: [PATCH 8/9] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-8-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oxONTvBo3a22TAARxRZKWb7mB82JhjnItvZbZYS2bz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF41mZIEwZobtj48H7DderSIIO41YVgYGsl3
 bR1W7sCgM+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmReAAKCRCLPIo+Aiko
 1YKBB/sGizXX5biEBU53PDUittIDTEl5a4CFAeO84c9uZOzfj0tWA7dgnHYFFKR/fTDEOfhaYkL
 lxK7IYixXSl2qucsnL8THVdMnnn9QdvPzxCn7wkxKPQgdI/6HCOTRq3oAvIzEwiE859kXC3aJ8V
 Ix3usb0d8ZNTxgWTyZgOqEZEVttfGMdesazgydy3N8HmEYVyZhiV29dSfCjA0qa7z8Ln9LpVJbn
 15eVr3hBAHRyU54IASZ8soCq+oAdpbmUbXs5UO720z803zL3mqAvHlKMS+++Y/Ma//W2D85VL1x
 rJ7V7fddxB5MdknGa/+x6+4zmxpS0mp5I21pyd4DR2Hg6MLO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

dpu_formats.c defines DPU_MAX_IMG_WIDTH and _HEIGHT, while
dpu_hw_catalog.h defines just MAX_IMG_WIDTH and _HEIGHT. Merge these
constants to remove duplication.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 1fc9817278df..1ee78ba640b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -20,9 +20,6 @@
 #define DPU_TILE_HEIGHT_UBWC	4
 #define DPU_TILE_HEIGHT_NV12	8
 
-#define DPU_MAX_IMG_WIDTH		0x3FFF
-#define DPU_MAX_IMG_HEIGHT		0x3FFF
-
 /*
  * DPU supported format packing, bpp, and other format
  * information.
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
index 9e57c51f5343..47165d2bd4ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -851,8 +851,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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


