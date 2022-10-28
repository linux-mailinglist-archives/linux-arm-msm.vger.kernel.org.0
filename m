Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E572C611DD6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 01:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiJ1XAO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 19:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJ1XAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 19:00:13 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB57B9938E
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 16:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1666998012; x=1698534012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JRt83h2It2p1I2P7BSYWVWdKe81tBx3PejaegH+3SaA=;
  b=l8sn46loqxxyJRYZfi7sSFrSinbitcOA3ozcN20nztLiwxpTdOPlHOF5
   nPDFh6Yqj6xNB4veaAFT2jAlEe2aCSdqTPrzOxeTERyw2UnAK19jVx/vY
   HJ88kKNeLDlyh10trSkeZKgHPcLijRvVvynbWACWrgoBVv4BiFeXebwV3
   8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Oct 2022 16:00:12 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 16:00:12 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 28 Oct 2022 16:00:12 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <contact@emersion.fr>,
        <daniel.vetter@ffwll.ch>, <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Date:   Fri, 28 Oct 2022 15:59:50 -0700
Message-ID: <20221028225952.160-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028225952.160-1-quic_jesszhan@quicinc.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
drm_plane. In addition, add support for setting and getting the values
of these properties.

COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
represents the format of the color fill. Userspace can set enable solid
fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
framebuffer to NULL.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++++
 drivers/gpu/drm/drm_blend.c       | 38 +++++++++++++++++++++++++++++++
 include/drm/drm_blend.h           |  2 ++
 include/drm/drm_plane.h           | 28 +++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 79730fa1dd8e..e1664463fca4 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -544,6 +544,10 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->src_w = val;
 	} else if (property == config->prop_src_h) {
 		state->src_h = val;
+	} else if (property == plane->color_fill_format_property) {
+		state->color_fill_format = val;
+	} else if (property == plane->color_fill_property) {
+		state->color_fill = val;
 	} else if (property == plane->alpha_property) {
 		state->alpha = val;
 	} else if (property == plane->blend_mode_property) {
@@ -616,6 +620,10 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->src_w;
 	} else if (property == config->prop_src_h) {
 		*val = state->src_h;
+	} else if (property == plane->color_fill_format_property) {
+		*val = state->color_fill_format;
+	} else if (property == plane->color_fill_property) {
+		*val = state->color_fill;
 	} else if (property == plane->alpha_property) {
 		*val = state->alpha;
 	} else if (property == plane->blend_mode_property) {
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index b4c8cab7158c..b8c2b263fa51 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -616,3 +616,41 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+int drm_plane_create_color_fill_property(struct drm_plane *plane)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create_range(plane->dev, 0, "color_fill",
+					 0, 0xffffffff);
+	if (!prop)
+		return -ENOMEM;
+
+	drm_object_attach_property(&plane->base, prop, 0);
+	plane->color_fill_property = prop;
+
+	if (plane->state)
+		plane->state->color_fill = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_color_fill_property);
+
+int drm_plane_create_color_fill_format_property(struct drm_plane *plane)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create_range(plane->dev, 0, "color_fill_format",
+					 0, 0xffffffff);
+	if (!prop)
+		return -ENOMEM;
+
+	drm_object_attach_property(&plane->base, prop, 0);
+	plane->color_fill_format_property = prop;
+
+	if (plane->state)
+		plane->state->color_fill_format = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_color_fill_format_property);
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..3e96f5e83cce 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -58,4 +58,6 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
+int drm_plane_create_color_fill_property(struct drm_plane *plane);
+int drm_plane_create_color_fill_format_property(struct drm_plane *plane);
 #endif
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 89ea54652e87..dcbfdb0e1f71 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -116,6 +116,20 @@ struct drm_plane_state {
 	/** @src_h: height of visible portion of plane (in 16.16) */
 	uint32_t src_h, src_w;
 
+	/**
+	 * @color_fill_format:
+	 * Format of the color fill value.
+	 */
+	uint32_t color_fill_format;
+
+	/**
+	 * @color_fill:
+	 * Fill color of the plane with 0 as black and 0xffffffff as white.
+	 * Can be set by user by setting the COLOR_FILL property. See
+	 * drm_plane_create_color_fill_property() for more details.
+	 */
+	uint32_t color_fill;
+
 	/**
 	 * @alpha:
 	 * Opacity of the plane with 0 as completely transparent and 0xffff as
@@ -699,6 +713,20 @@ struct drm_plane {
 	 */
 	struct drm_plane_state *state;
 
+	/*
+	 * @color_fill_format_property:
+	 * Optional color fill format property for this plane. See
+	 * drm_plane_create_color_fill_format_property().
+	 */
+	struct drm_property *color_fill_format_property;
+
+	/*
+	 * @color_fill_property:
+	 * Optional color fill property for this plane. See
+	 * drm_plane_create_color_fill_property().
+	 */
+	struct drm_property *color_fill_property;
+
 	/**
 	 * @alpha_property:
 	 * Optional alpha property for this plane. See
-- 
2.38.0

