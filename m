Return-Path: <linux-arm-msm+bounces-3272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 613DC80342C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1633E280FB2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970CA24B44;
	Mon,  4 Dec 2023 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPSHUwtz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFE9FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:15:01 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id 2adb3069b0e04-50bfd8d5c77so529274e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695699; x=1702300499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeReGTEh9WdazCjVx3s9wY0Guvu7IN3fugZ3Sd5wrus=;
        b=wPSHUwtzaCUpy2D7EC1tuAu/j0GojGDiXxj9QOTXdO4BjMOoCvODRzjwLZKUi+zrLn
         pVsYqspiS/tlgzPMc9Blwtbx65Zd2h5/sZWS1F5Ubf2gJ8kMqDTW/e0uZERtrxY4o76V
         tpRicqVbPT/LPcTwx3ih/x6eJpoSNHVVbuWBl9TMx5Qe1dtD/o/Y8tqJBEtIMjYPWCUG
         vI+FQQ3lxSqsFIvB8bNyJDnR8u96ULt44YwCoTLbqEXh9nWfe6IA0ZqwmzNeYlet9NXG
         FTjtwaMkkYsxdHPNN+wjXzTEhnNFesS/5+wiK0NfxurANpfNupP6Ya04pHoKMbmH0uQm
         hK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695699; x=1702300499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeReGTEh9WdazCjVx3s9wY0Guvu7IN3fugZ3Sd5wrus=;
        b=GGwR9ld2CNGb4WgaTcpatW2qm3Z3pKsCCMd3iwXNRtrzPaTYcq/AmxBTnRVXrCAewi
         vN+CUNznV7qtDd1nK1vMuPp/gPkMoswAQz0KOaV1IMsyCPPzWHhzutyoWgPvT3ESxvDL
         zcuo+T4wb+FrCVJTDMYDD/ETgN5ZXer3WK4eCCdR03mUn0PJpJAcz1ygpXDzDwMIR7yY
         o3dqbpp65ELuIwMRsajGrbBoQCaqSdNV2dT9Jc4v6bq57YHciyVg54xUQP0LQ7Wol90X
         vR70nLGi53Viy4kiMMwt8680LoGvPrgpb4nj5A/3P4RhRKCprUB5yBgiojsVHcA/c2YT
         rKrQ==
X-Gm-Message-State: AOJu0YwSGJorbL40MhE2uzykpY8+zt285ply8au0spi22EqCipOfC3TJ
	pygNBm5Y472doPG2NDYsz6ej1Q==
X-Google-Smtp-Source: AGHT+IFJ6iOY8OeeHShhkf14uV3ednojj/zd1MnXRsPIVojuWFZfWrMoJV0tGRwuLlo3iG4L8wnh7w==
X-Received: by 2002:ac2:521c:0:b0:50b:ef9b:bde5 with SMTP id a28-20020ac2521c000000b0050bef9bbde5mr482316lfl.150.1701695699509;
        Mon, 04 Dec 2023 05:14:59 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.58
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
Subject: [PATCH 4/7] Revert "drm/atomic: Add pixel source to plane state dump"
Date: Mon,  4 Dec 2023 15:13:51 +0200
Message-ID: <20231204131455.19023-5-dmitry.baryshkov@linaro.org>
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

This reverts commit 8283ac7871a959848e09fc6593b8c12b8febfee6.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c        | 1 -
 drivers/gpu/drm/drm_blend.c         | 1 -
 drivers/gpu/drm/drm_crtc_internal.h | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 02aa7df832cc..f1a503aafe5a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -722,7 +722,6 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 
 	drm_printf(p, "plane[%u]: %s\n", plane->base.id, plane->name);
 	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
-	drm_printf(p, "\tpixel-source=%s\n", drm_get_pixel_source_name(state->pixel_source));
 	drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
 	if (state->fb)
 		drm_framebuffer_print_info(p, 2, state->fb);
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 9c1608f7c1df..37b31b7e5ce5 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -647,7 +647,6 @@ static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
 	{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
 	{ DRM_PLANE_PIXEL_SOURCE_SOLID_FILL, "SOLID_FILL" },
 };
-DRM_ENUM_NAME_FN(drm_get_pixel_source_name, drm_pixel_source_enum_list);
 
 /**
  * drm_plane_create_pixel_source_property - create a new pixel source property
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 4114675c0728..a514d5207e41 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -269,7 +269,6 @@ int drm_plane_check_pixel_format(struct drm_plane *plane,
 				 u32 format, u64 modifier);
 struct drm_mode_rect *
 __drm_plane_get_damage_clips(const struct drm_plane_state *state);
-const char *drm_get_pixel_source_name(int val);
 
 /* drm_bridge.c */
 void drm_bridge_detach(struct drm_bridge *bridge);
-- 
2.42.0


