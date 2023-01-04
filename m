Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B9165E10D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 00:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234730AbjADXlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 18:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjADXlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 18:41:22 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3E142E0B
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 15:41:21 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 304N5CaE016615;
        Wed, 4 Jan 2023 23:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=rLCLAkCOSO5a6DBivav4Cuv7JOvOGIwCLvYQv7LH0UU=;
 b=B9hhiO3PjVIpnPMoDvIsMscfOtbHirHQTmJgIVqrw5cW1E2ctx6BsjxaITz1Uaov96bd
 LyJ3N+Oj6ap4GdzOINGh2ylYK0fDdiyp3Sgx7464shzZLTMFAEYYzwa0XU3YpEFPwaJg
 d+xAZ3UoS+tP4BKGKj87SbyEnk7FOl6cJ3TNt5nqgIFUZWett1dwOuj3Hd9/8GLmuBoz
 rbDDx/dvH3kyG6qWZaCKEayzgdQJM+3i3jfDlWDce5Yex5OSha+r793e8dY+5/zc6eHG
 T7uk39/1mbyKEA8bMndmLmOmjiAe/Dkdw7Xtuae1bjRaLlxeGMMlzAGlwcElpcswD9YE iA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvwu2fp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 04 Jan 2023 23:41:06 +0000
Received: from nasanex01b.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 304Nf5Y7010620
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 4 Jan 2023 23:41:05 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 4 Jan 2023 15:41:03 -0800
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
Subject: [RFC PATCH v3 3/3] drm/msm/dpu: Use color_fill property for DPU planes
Date:   Wed, 4 Jan 2023 15:40:36 -0800
Message-ID: <20230104234036.636-4-quic_jesszhan@quicinc.com>
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
X-Proofpoint-GUID: oWkokOxed0tOHCxQJuWyVkGrA9tJUIry
X-Proofpoint-ORIG-GUID: oWkokOxed0tOHCxQJuWyVkGrA9tJUIry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxlogscore=955 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040193
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initialize and use the color_fill properties for planes in DPU driver. In
addition, relax framebuffer requirements within atomic commit path and
add checks for NULL framebuffers. Finally, drop DPU_PLANE_COLOR_FILL_FLAG
as it's unused.

Changes since V2:
- Fixed dropped 'const' warning
- Dropped use of solid_fill_format
- Switched to using drm_plane_solid_fill_enabled helper method
- Added helper to convert color fill to BGR888 (Rob)
- Added support for solid fill on planes of varying sizes
- Removed DPU_PLANE_COLOR_FILL_FLAG

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 65 ++++++++++++++---------
 2 files changed, 49 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 13ce321283ff..0695b70ea1b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -409,6 +409,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct drm_plane_state *state;
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
 	struct dpu_plane_state *pstate = NULL;
+	const struct msm_format *fmt;
 	struct dpu_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
@@ -441,7 +442,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 				sspp_idx - SSPP_VIG0,
 				state->fb ? state->fb->base.id : -1);
 
-		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
+		if (pstate->base.fb)
+			fmt = msm_framebuffer_format(pstate->base.fb);
+		else
+			fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
+					DRM_FORMAT_ABGR8888, 0);
+
+		format = to_dpu_format(fmt);
 
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 86719020afe2..51a7507373f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -44,7 +44,6 @@
 
 #define DPU_NAME_SIZE  12
 
-#define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
 #define DPU_ZPOS_MAX 255
 
 /* multirect rect index */
@@ -105,7 +104,6 @@ struct dpu_plane {
 	enum dpu_sspp pipe;
 
 	struct dpu_hw_pipe *pipe_hw;
-	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
 	const struct dpu_mdss_cfg *catalog;
@@ -678,6 +676,17 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 				&scaler3_cfg);
 }
 
+static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill solid_fill)
+{
+	uint32_t ret = 0;
+
+	ret |= ((uint8_t) solid_fill.b) << 16;
+	ret |= ((uint8_t) solid_fill.g) << 8;
+	ret |= ((uint8_t) solid_fill.r);
+
+	return ret;
+}
+
 /**
  * _dpu_plane_color_fill - enables color fill on plane
  * @pdpu:   Pointer to DPU plane object
@@ -1001,12 +1010,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	dst = drm_plane_state_dest(new_plane_state);
 
-	fb_rect.x2 = new_plane_state->fb->width;
-	fb_rect.y2 = new_plane_state->fb->height;
+	if (new_plane_state->fb) {
+		fb_rect.x2 = new_plane_state->fb->width;
+		fb_rect.y2 = new_plane_state->fb->height;
+	}
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+	if (new_plane_state->fb)
+		fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
+	else
+		fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
 
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
@@ -1018,7 +1032,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
+	} else if (new_plane_state->fb && !dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&src));
 		return -E2BIG;
@@ -1086,9 +1100,10 @@ void dpu_plane_flush(struct drm_plane *plane)
 	if (pdpu->is_error)
 		/* force white frame with 100% alpha pipe output on error */
 		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
-	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
+	else if (!(plane->state->fb) && drm_plane_solid_fill_enabled(plane->state))
 		/* force 100% alpha */
-		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
+		_dpu_plane_color_fill(pdpu, _dpu_plane_get_fill_color(plane->state->solid_fill),
+				0xFF);
 	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
 		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
 		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
@@ -1127,23 +1142,30 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	bool is_rt_pipe, update_qos_remap;
-	const struct dpu_format *fmt =
-		to_dpu_format(msm_framebuffer_format(fb));
+	const struct dpu_format *fmt;
 	struct dpu_hw_pipe_cfg pipe_cfg;
 
-	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
-
-	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
-
 	pstate->pending = true;
 
 	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
 	_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
 
-	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
-			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
-			crtc->base.id, DRM_RECT_ARG(&state->dst),
-			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
+	/* override for color fill */
+	if (!fb && drm_plane_solid_fill_enabled(plane->state)) {
+		/* skip remaining processing on color fill */
+		return;
+	}
+
+	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
+
+	fmt = to_dpu_format(msm_framebuffer_format(fb));
+	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
+
+	if (fb)
+		DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
+				", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
+				crtc->base.id, DRM_RECT_ARG(&state->dst),
+				(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
 
 	pipe_cfg.src_rect = state->src;
 
@@ -1155,12 +1177,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	pipe_cfg.dst_rect = state->dst;
 
-	/* override for color fill */
-	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
-		/* skip remaining processing on color fill */
-		return;
-	}
-
 	if (pdpu->pipe_hw->ops.setup_rects) {
 		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
 				&pipe_cfg,
@@ -1511,6 +1527,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
 	drm_plane_create_alpha_property(plane);
+	drm_plane_create_solid_fill_property(plane);
 	drm_plane_create_blend_mode_property(plane,
 			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
 			BIT(DRM_MODE_BLEND_PREMULTI) |
-- 
2.38.1

