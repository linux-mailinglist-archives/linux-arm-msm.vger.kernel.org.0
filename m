Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C93A665E10B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 00:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbjADXlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 18:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjADXlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 18:41:17 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E31E65CC
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 15:41:14 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 304NV013014780;
        Wed, 4 Jan 2023 23:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=lDT9lsIPNIeGWnyLLeTIUeErVLtd6RRHh0s+yaRNJnQ=;
 b=LblQ98b1JIfU+oeoEnhc3o1t54gi6B3WRoK7W9x8HUCBPzahurh5ldKemUUZ4btCgt2i
 /3HZCM/Zt4+TXGjuxi3uyyXaZeptaMQR57++GLHx/R/ta047afPqcJ7VfM1HY9PwmTzO
 YhiyTuMkZotA1E0ddXCt7PlucwTDCMllWOcpUnfkGAn7ty/dBUClv9i0ndfiWT5fLUnC
 S6eyF3jRZmaHyFFmml/7c0SdF17+sY65FRaw1iskKfjuiprNcW+Y3+//ys11WJicQquU
 YOCtLFrPtj4ckE28tzLKlY6EriE4xMfBV+gUSOpJh4Lid1rY2fRmalNe6YAHj3gODeRZ Sg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwj4p83d1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 04 Jan 2023 23:40:57 +0000
Received: from nasanex01b.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 304NeuO5017272
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 4 Jan 2023 23:40:56 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 4 Jan 2023 15:40:54 -0800
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <contact@emersion.fr>,
        <daniel.vetter@ffwll.ch>, <laurent.pinchart@ideasonboard.com>,
        <ppaalanen@gmail.com>, <sebastian.wick@redhat.com>,
        <wayland-devel@lists.freedesktop.org>,
        <ville.syrjala@linux.intel.com>
Subject: [RFC PATCH v3 1/3] drm: Introduce solid fill property for drm plane
Date:   Wed, 4 Jan 2023 15:40:34 -0800
Message-ID: <20230104234036.636-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104234036.636-1-quic_jesszhan@quicinc.com>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bMpu_gmveioElwVg3QhjMSr1HdAgWyTX
X-Proofpoint-ORIG-GUID: bMpu_gmveioElwVg3QhjMSr1HdAgWyTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301040193
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for solid_fill property to drm_plane. In addition, add
support for setting and getting the values for solid_fill.

solid_fill holds data for supporting solid fill planes. The property
accepts an RGB323232 value and the driver data is formatted as such:

struct drm_solid_fill {
	u32 r;
	u32 g;
	u32 b;
};

To enable solid fill planes, userspace must assigned solid_fill to a
property blob containing the following information:

struct drm_solid_fill_info {
	u8 version;
	u32 r, g, b;
};

Changes in V2:
- Changed solid_fill property to a property blob (Simon, Dmitry)
- Added drm_solid_fill struct (Simon)
- Added drm_solid_fill_info struct (Simon)

Changes in V3:
- Corrected typo in drm_solid_fill struct documentation

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 59 +++++++++++++++++++++++
 drivers/gpu/drm/drm_blend.c               | 17 +++++++
 include/drm/drm_blend.h                   |  1 +
 include/drm/drm_plane.h                   | 43 +++++++++++++++++
 5 files changed, 129 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index dfb57217253b..c96fd1f2ad99 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -253,6 +253,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
 
+	if (plane_state->solid_fill_blob) {
+		drm_property_blob_put(plane_state->solid_fill_blob);
+		plane_state->solid_fill_blob = NULL;
+	}
+
 	if (plane->color_encoding_property) {
 		if (!drm_object_property_get_default_value(&plane->base,
 							   plane->color_encoding_property,
@@ -335,6 +340,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	if (state->fb)
 		drm_framebuffer_get(state->fb);
 
+	if (state->solid_fill_blob)
+		drm_property_blob_get(state->solid_fill_blob);
+
 	state->fence = NULL;
 	state->commit = NULL;
 	state->fb_damage_clips = NULL;
@@ -384,6 +392,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
 		drm_crtc_commit_put(state->commit);
 
 	drm_property_blob_put(state->fb_damage_clips);
+	drm_property_blob_put(state->solid_fill_blob);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c06d0639d552..8a1d2fb7a757 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -316,6 +316,55 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 }
 EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
 
+static void drm_atomic_convert_solid_fill_info(struct drm_solid_fill *out,
+		struct drm_solid_fill_info *in)
+{
+	out->r = in->r;
+	out->g = in->g;
+	out->b = in->b;
+}
+
+static int drm_atomic_set_solid_fill_prop(struct drm_plane_state *state,
+		struct drm_property_blob *blob)
+{
+	int ret = 0;
+	int blob_version;
+
+	if (blob == state->solid_fill_blob)
+		return 0;
+
+	drm_property_blob_put(state->solid_fill_blob);
+	state->solid_fill_blob = NULL;
+
+	memset(&state->solid_fill, 0, sizeof(state->solid_fill));
+
+	if (blob) {
+		if (blob->length != sizeof(struct drm_solid_fill_info)) {
+			drm_dbg_atomic(state->plane->dev,
+					"[PLANE:%d:%s] bad solid fill blob length: %zu\n",
+					state->plane->base.id, state->plane->name,
+					blob->length);
+			return -EINVAL;
+		}
+
+		blob_version = ((struct drm_solid_fill_info *)blob->data)->version;
+
+		/* Append with more versions if necessary */
+		if (blob_version == 1) {
+			drm_atomic_convert_solid_fill_info(&state->solid_fill, blob->data);
+		} else {
+			drm_dbg_atomic(state->plane->dev,
+					"[PLANE:%d:%s] failed to set solid fill (ret=%d)\n",
+					state->plane->base.id, state->plane->name,
+					ret);
+			return -EINVAL;
+		}
+		state->solid_fill_blob = drm_property_blob_get(blob);
+	}
+
+	return ret;
+}
+
 static void set_out_fence_for_crtc(struct drm_atomic_state *state,
 				   struct drm_crtc *crtc, s32 __user *fence_ptr)
 {
@@ -544,6 +593,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->src_w = val;
 	} else if (property == config->prop_src_h) {
 		state->src_h = val;
+	} else if (property == plane->solid_fill_property) {
+		struct drm_property_blob *solid_fill = drm_property_lookup_blob(dev, val);
+
+		ret = drm_atomic_set_solid_fill_prop(state, solid_fill);
+		drm_property_blob_put(solid_fill);
+
+		return ret;
 	} else if (property == plane->alpha_property) {
 		state->alpha = val;
 	} else if (property == plane->blend_mode_property) {
@@ -616,6 +672,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->src_w;
 	} else if (property == config->prop_src_h) {
 		*val = state->src_h;
+	} else if (property == plane->solid_fill_property) {
+		*val = state->solid_fill_blob ?
+			state->solid_fill_blob->base.id : 0;
 	} else if (property == plane->alpha_property) {
 		*val = state->alpha;
 	} else if (property == plane->blend_mode_property) {
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index b4c8cab7158c..17ab645c8309 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -616,3 +616,20 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+int drm_plane_create_solid_fill_property(struct drm_plane *plane)
+{
+	struct drm_property *prop;
+
+	prop = drm_property_create(plane->dev,
+			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
+			"solid_fill", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	drm_object_attach_property(&plane->base, prop, 0);
+	plane->solid_fill_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..0338a860b9c8 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
+int drm_plane_create_solid_fill_property(struct drm_plane *plane);
 #endif
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 447e664e49d5..3b9da06f358b 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -40,6 +40,25 @@ enum drm_scaling_filter {
 	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
 };
 
+/**
+ * struct drm_solid_fill_info - User info for solid fill planes
+ */
+struct drm_solid_fill_info {
+	__u8 version;
+	__u32 r, g, b;
+};
+
+/**
+ * struct solid_fill_property - RGB values for solid fill plane
+ *
+ * Note: This is the V1 for this feature
+ */
+struct drm_solid_fill {
+	uint32_t r;
+	uint32_t g;
+	uint32_t b;
+};
+
 /**
  * struct drm_plane_state - mutable plane state
  *
@@ -116,6 +135,23 @@ struct drm_plane_state {
 	/** @src_h: height of visible portion of plane (in 16.16) */
 	uint32_t src_h, src_w;
 
+	/**
+	 * @solid_fill_blob:
+	 *
+	 * Blob containing relevant information for a solid fill plane
+	 * including pixel format and data. See
+	 * drm_plane_create_solid_fill_property() for more details.
+	 */
+	struct drm_property_blob *solid_fill_blob;
+
+	/**
+	 * @solid_fill:
+	 *
+	 * Pixel data for solid fill planes. See
+	 * drm_plane_create_solid_fill_property() for more details.
+	 */
+	struct drm_solid_fill solid_fill;
+
 	/**
 	 * @alpha:
 	 * Opacity of the plane with 0 as completely transparent and 0xffff as
@@ -699,6 +735,13 @@ struct drm_plane {
 	 */
 	struct drm_plane_state *state;
 
+	/*
+	 * @solid_fill_property:
+	 * Optional solid_fill property for this plane. See
+	 * drm_plane_create_solid_fill_property().
+	 */
+	struct drm_property *solid_fill_property;
+
 	/**
 	 * @alpha_property:
 	 * Optional alpha property for this plane. See
-- 
2.38.1

