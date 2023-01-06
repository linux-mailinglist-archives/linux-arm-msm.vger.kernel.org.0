Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18B0465FF78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 12:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbjAFLXc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 06:23:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbjAFLX3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 06:23:29 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D55A687AF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 03:23:28 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 4C2DC76D34;
        Fri,  6 Jan 2023 11:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1673004206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=HIcATvuSqEcEyIzEnkPGzowIpat1oPanHINrsjrGZGw=;
        b=MyH1JIY9xMD3KwqmkUnJX5iPQy2N3zLiUWZt1ud8Sk5BR4Odul9zkNHQQ77Df2ulVbvGGQ
        7Gw/LH3hrCPAwrO6MGQFU3ajco2OaTrAb1DYAgWc6gZxEnRf0wHxPYGnVMIw3ws1L3A6rs
        kazENXmYdt5Sv4L111ZDetBuD7xyFrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1673004206;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=HIcATvuSqEcEyIzEnkPGzowIpat1oPanHINrsjrGZGw=;
        b=95jNhlPga3Qfv3z+/+q0bdhHcIJtkfj6RwA8uAITCULX3RWCXHH/oHdoHVHcrZtm1GkGjr
        64fvfKGuKoHFDBAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 174F213596;
        Fri,  6 Jan 2023 11:23:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id /JjdBK4EuGNoIAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 06 Jan 2023 11:23:26 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, mcanal@igalia.com, steev@kali.org,
        dmitry.baryshkov@linaro.org, javierm@redhat.com, airlied@gmail.com,
        mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4] drm/fb-helper: Replace bpp/depth parameter by color mode
Date:   Fri,  6 Jan 2023 12:23:24 +0100
Message-Id: <20230106112324.22055-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace the combination of bpp and depth with a single color-mode
argument. Handle special cases in simpledrm and ofdrm. Hard-code
XRGB8888 as fallback format for cases where no given format works.

The color-mode argument accepts the same values as the kernel's video
parameter. These are mostly bpp values between 1 and 32. The exceptions
are 15, which has a color depth of 15 and a bpp value of 16; and 32,
which has a color depth of 24 and a bpp value of 32.

v4:
	* add back lost test for bpp_specified (Maira)
	* add Fixes tag (Daniel)
v3:
	* fix ofdrm build (Maxime)
v2:
	* minimize changes (Daniel)
	* use drm_driver_legacy_fb_format() (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 37c90d589dc0 ("drm/fb-helper: Fix single-probe color-format selection")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_fb_helper.c  | 42 ++++++++++++++++++--------------
 drivers/gpu/drm/tiny/ofdrm.c     |  7 +++++-
 drivers/gpu/drm/tiny/simpledrm.c |  7 +++++-
 3 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 1369ca4ae39b..427631706128 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1756,24 +1756,21 @@ static uint32_t drm_fb_helper_find_format(struct drm_fb_helper *fb_helper, const
 	return DRM_FORMAT_INVALID;
 }
 
-static uint32_t drm_fb_helper_find_cmdline_format(struct drm_fb_helper *fb_helper,
-						  const uint32_t *formats, size_t format_count,
-						  const struct drm_cmdline_mode *cmdline_mode)
+static uint32_t drm_fb_helper_find_color_mode_format(struct drm_fb_helper *fb_helper,
+						     const uint32_t *formats, size_t format_count,
+						     unsigned int color_mode)
 {
 	struct drm_device *dev = fb_helper->dev;
 	uint32_t bpp, depth;
 
-	if (!cmdline_mode->bpp_specified)
-		return DRM_FORMAT_INVALID;
-
-	switch (cmdline_mode->bpp) {
+	switch (color_mode) {
 	case 1:
 	case 2:
 	case 4:
 	case 8:
 	case 16:
 	case 24:
-		bpp = depth = cmdline_mode->bpp;
+		bpp = depth = color_mode;
 		break;
 	case 15:
 		bpp = 16;
@@ -1784,7 +1781,7 @@ static uint32_t drm_fb_helper_find_cmdline_format(struct drm_fb_helper *fb_helpe
 		depth = 24;
 		break;
 	default:
-		drm_info(dev, "unsupported bpp value of %d\n", cmdline_mode->bpp);
+		drm_info(dev, "unsupported color mode of %d\n", color_mode);
 		return DRM_FORMAT_INVALID;
 	}
 
@@ -1817,10 +1814,13 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int prefe
 		drm_client_for_each_connector_iter(connector, &conn_iter) {
 			struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
 
-			surface_format = drm_fb_helper_find_cmdline_format(fb_helper,
-									   plane->format_types,
-									   plane->format_count,
-									   cmdline_mode);
+			if (!cmdline_mode->bpp_specified)
+				continue;
+
+			surface_format = drm_fb_helper_find_color_mode_format(fb_helper,
+									      plane->format_types,
+									      plane->format_count,
+									      cmdline_mode->bpp);
 			if (surface_format != DRM_FORMAT_INVALID)
 				break; /* found supported format */
 		}
@@ -1829,17 +1829,23 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int prefe
 		if (surface_format != DRM_FORMAT_INVALID)
 			break; /* found supported format */
 
-		/* try preferred bpp/depth */
-		surface_format = drm_fb_helper_find_format(fb_helper, plane->format_types,
-							   plane->format_count, preferred_bpp,
-							   dev->mode_config.preferred_depth);
+		/* try preferred color mode */
+		surface_format = drm_fb_helper_find_color_mode_format(fb_helper,
+								      plane->format_types,
+								      plane->format_count,
+								      preferred_bpp);
 		if (surface_format != DRM_FORMAT_INVALID)
 			break; /* found supported format */
 	}
 
 	if (surface_format == DRM_FORMAT_INVALID) {
+		/*
+		 * If none of the given color modes works, fall back
+		 * to XRGB8888. Drivers are expected to provide this
+		 * format for compatibility with legacy applications.
+		 */
 		drm_warn(dev, "No compatible format found\n");
-		return -EAGAIN;
+		surface_format = drm_driver_legacy_fb_format(dev, 32, 24);
 	}
 
 	info = drm_format_info(surface_format);
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 39c5fd463fec..6e349ca42485 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -1352,6 +1352,7 @@ static int ofdrm_probe(struct platform_device *pdev)
 {
 	struct ofdrm_device *odev;
 	struct drm_device *dev;
+	unsigned int color_mode;
 	int ret;
 
 	odev = ofdrm_device_create(&ofdrm_driver, pdev);
@@ -1363,7 +1364,11 @@ static int ofdrm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, drm_format_info_bpp(odev->format, 0));
+	color_mode = drm_format_info_bpp(odev->format, 0);
+	if (color_mode == 16)
+		color_mode = odev->format->depth; // can be 15 or 16
+
+	drm_fbdev_generic_setup(dev, color_mode);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 7355617f38d3..f658b99c796a 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -802,6 +802,7 @@ static int simpledrm_probe(struct platform_device *pdev)
 {
 	struct simpledrm_device *sdev;
 	struct drm_device *dev;
+	unsigned int color_mode;
 	int ret;
 
 	sdev = simpledrm_device_create(&simpledrm_driver, pdev);
@@ -813,7 +814,11 @@ static int simpledrm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, drm_format_info_bpp(sdev->format, 0));
+	color_mode = drm_format_info_bpp(sdev->format, 0);
+	if (color_mode == 16)
+		color_mode = sdev->format->depth; // can be 15 or 16
+
+	drm_fbdev_generic_setup(dev, color_mode);
 
 	return 0;
 }
-- 
2.39.0

