Return-Path: <linux-arm-msm+bounces-3271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CDC803429
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1424A280F89
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2BC24B42;
	Mon,  4 Dec 2023 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TX/xtZiO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A781D8
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:15:02 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bffb64178so105327e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695700; x=1702300500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMzxGsdhOYwtNdEG7l3DHCnll9vKNfEMYjXGBc92HI8=;
        b=TX/xtZiO9pB5xOOsn6KLvGXLTmJQbyyO7+1CuYA/+iizcWli34w8nW7+buNl9JhMi6
         pNZ00m+Tg4rwxald4pAwL2koULD9GUwXrIOTBqZt21/yF7B8YxmBHJqAvlu14m1Fao1m
         u92ljjqGHLd9InwC38Wm0yDZMklfCIItpAbszJbVZc3D8Myzfw3SjHyzF+eU9hvaFrCK
         09/tcBBZTLNM2yIg0WPqzCohP4cyrd6cWBqpsX75FJZHm/Z6JsTcKZXtUzgiCKh2zkc2
         U7OiEqFBSgfNqaShUqcO1u0Ubb0Q8Syt1W4fwynQ3Pk2Xr3K/pr7snnHUID0wzsCHxmv
         5G0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695700; x=1702300500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMzxGsdhOYwtNdEG7l3DHCnll9vKNfEMYjXGBc92HI8=;
        b=oIBNUaO2J/YyaVQl+VpgXO9qDhT9+ecfcPQ1Tnzh18wmlD9QPJmKrTpvlJoCuL7+YU
         +Fs1UeYGBb4aUQy00MCijeu16KFoTtE6HMPrXSgLYZq7sJ+64CeKEDzyEJ4d7neUgC8h
         950M1CfiAMoRpnMYxuX7Q5nX+Moqh2koJ1Ecsh7W8ewX3ji2rWzCM5L7oIh9Q5JGm5WH
         P5SjSX3hd7lGSa5PKL2ygk+TAHrtQak2PfUYx6/BFVZPyJ+vbUfL7yKi2k87lXrPg2v/
         CcLMVCLbJtcxg5nnUz6hjd+Lb9khlam6eDlBfNkQqD3oD38l7hbs0bJi6V907FNbMq2/
         ZZSA==
X-Gm-Message-State: AOJu0YybDptcMScmLJ230YIAD9FNdOh8a9Qs22YAWlC8JrJn2edw6NrE
	OtpHh/yyL9A1xqXwGLwFgG+PXA==
X-Google-Smtp-Source: AGHT+IGDRYksrIZYOlwzn0xx8ixTEo9STmmWtMePPWUDb7lGPmASc5VjLGKKYGaFagK6R+9iyaaIuQ==
X-Received: by 2002:ac2:4e06:0:b0:50b:e20c:e54e with SMTP id e6-20020ac24e06000000b0050be20ce54emr2561562lfr.115.1701695700202;
        Mon, 04 Dec 2023 05:15:00 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:14:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/7] Revert "drm: Add solid fill pixel source"
Date: Mon,  4 Dec 2023 15:13:52 +0200
Message-ID: <20231204131455.19023-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 4b64167042927531f4cfaf035b8f88c2f7a05f06.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_blend.c | 10 +---------
 include/drm/drm_plane.h     |  1 -
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 37b31b7e5ce5..665c5d9b056f 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -204,9 +204,6 @@
  *	"FB":
  *		Framebuffer source set by the "FB_ID" property.
  *
- *	"SOLID_FILL":
- *		Solid fill color source set by the "solid_fill" property.
- *
  * solid_fill:
  *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
  *	contains pixel data that drivers can use to fill a plane.
@@ -645,7 +642,6 @@ EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
 static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
 	{ DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
 	{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
-	{ DRM_PLANE_PIXEL_SOURCE_SOLID_FILL, "SOLID_FILL" },
 };
 
 /**
@@ -670,9 +666,6 @@ static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
  * "FB":
  *	Framebuffer pixel source
  *
- * "SOLID_FILL":
- * 	Solid fill color pixel source
- *
  * Returns:
  * Zero on success, negative errno on failure.
  */
@@ -682,8 +675,7 @@ int drm_plane_create_pixel_source_property(struct drm_plane *plane,
 	struct drm_device *dev = plane->dev;
 	struct drm_property *prop;
 	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
-						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE) |
-						      BIT(DRM_PLANE_PIXEL_SOURCE_SOLID_FILL);
+						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
 	int i;
 
 	/* FB is supported by default */
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 4b7af4381bbe..5bac644d4cc3 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -43,7 +43,6 @@ enum drm_scaling_filter {
 enum drm_plane_pixel_source {
 	DRM_PLANE_PIXEL_SOURCE_NONE,
 	DRM_PLANE_PIXEL_SOURCE_FB,
-	DRM_PLANE_PIXEL_SOURCE_SOLID_FILL,
 	DRM_PLANE_PIXEL_SOURCE_MAX
 };
 
-- 
2.42.0


