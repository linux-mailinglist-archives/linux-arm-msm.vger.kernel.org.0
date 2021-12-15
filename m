Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F89475CC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 17:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbhLOQIm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 11:08:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhLOQIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 11:08:41 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7EAC06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 08:08:41 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id d10so44129063lfg.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 08:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WbNOymkxPgOISMLjCM1mOH833jOukyVPwJbK13caKsE=;
        b=jHlH0lNjWxm39Qj1B/jg6NvGQZICh/cnC5xXQGHPQCRzORYWC3sePAAnpqSL1OfcFL
         5VSnu/xrCOETk5gBf7WAAnfCieVbAw7GW4f+T5zlxvPI47PT/caJAlyKDyN4AJUXnhOg
         9px708pBCTNCGqfCWrHX1D8yoKWmDJAalrzJwEwS3eNyWjLh4wcoHkE5y/DbLS9Obx4H
         /X8c7Hd89c1zYqvEMUhF+kzrE3MhiEXPEliez2IF/gVA/jkB27DtumhJa0Wx4Dotpasq
         cpGVJnjQGqZLRiW6UojF4MK6SXB185o2jclT2lbmZ9Of+Sig1thF/coXyIDC42ObuI3B
         0viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WbNOymkxPgOISMLjCM1mOH833jOukyVPwJbK13caKsE=;
        b=08qWi3EMmONiytmbqY+AaEB+xqDx5QABs1UvFpf/z1DHSUl6N/PI4SA4q6Cwz5gaAg
         ibUiudsrne1J+87ONRE2DML4rOjwUmfY5qo3uJlpWxKAnK/tNskQVACGUE0k0bQ8Ipy4
         GvvANtDF4Ygc0pF6ubk8VEtkXcLzJdBKc2KR5UtCNx2ZNlwNepBWN01siJtYHQQQ8wwF
         Q7Vh/lFvrqb2YHuPXyXoKszrbc6DeZ90GrpcWEUMM9fD6LTc73x2+ggFAwvovnVCIK51
         096uBcs5vuB2sHCOilas/ic1nfHbxpkWqvWhhe/nCKTTTeFj/4/mT3DztxrkzDnwHUcB
         j+8A==
X-Gm-Message-State: AOAM532FzUjH2XsE1StCxw71BYW/4TpEHYRqEjEBJJwFiZPP+j2iHpMS
        ZZ4uzPQS6hKZGKvMPgwxcnknsg==
X-Google-Smtp-Source: ABdhPJy2pfoj7FXteWtAYyr8LeAnKeku61xWzcaxThlAR6Kgfqwj3tBGxa71VUWO5za2VU03bm2irA==
X-Received: by 2002:a05:6512:224f:: with SMTP id i15mr10369280lfu.688.1639584519531;
        Wed, 15 Dec 2021 08:08:39 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id l24sm522070ljg.35.2021.12.15.08.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:08:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] drm/plane: add alpha and blend_mode to atomic_print_state
Date:   Wed, 15 Dec 2021 19:08:37 +0300
Message-Id: <20211215160837.2715448-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When dumping plane state also output plane's alpha and blending mode
values to ease debugging of complex composition cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Changed alpha property format to pad with zeroes
---
 drivers/gpu/drm/drm_atomic.c        |  3 +++
 drivers/gpu/drm/drm_blend.c         | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h |  3 +++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ff1416cd609a..20db99c041eb 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -709,6 +709,9 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 		   drm_get_color_encoding_name(state->color_encoding));
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
+	drm_printf(p, "\talpha=%04X\n", state->alpha);
+	drm_printf(p, "\tblend_mode=%s\n",
+		   drm_get_pixel_blend_mode_name(state->pixel_blend_mode));
 
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index ec37cbfabb50..e3971758ec53 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -616,3 +616,24 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+static const char * const pixel_blend_mode_name[] = {
+	[DRM_MODE_BLEND_PIXEL_NONE] = "None",
+	[DRM_MODE_BLEND_PREMULTI] = "Pre-multiplied",
+	[DRM_MODE_BLEND_COVERAGE] = "Coverage",
+};
+
+/**
+ * drm_get_pixel_blend_mode_name - return a string for color encoding
+ * @encoding: color encoding to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_pixel_blend_mode_name(uint16_t blend_mode)
+{
+	if (WARN_ON(blend_mode >= ARRAY_SIZE(pixel_blend_mode_name)))
+		return "unknown";
+
+	return pixel_blend_mode_name[blend_mode];
+}
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 63279e984342..0794307191cf 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -289,3 +289,6 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
 void drm_reset_display_info(struct drm_connector *connector);
 u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid);
 void drm_update_tile_info(struct drm_connector *connector, const struct edid *edid);
+
+/* drm_blend.c */
+const char *drm_get_pixel_blend_mode_name(uint16_t blend_mode);
-- 
2.33.0

