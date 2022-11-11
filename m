Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3DF625D66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 15:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234746AbiKKOpg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 09:45:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234788AbiKKOpM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 09:45:12 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A707E5BD4F;
        Fri, 11 Nov 2022 06:44:24 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ABDCW2K000769;
        Fri, 11 Nov 2022 13:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=fvJ3DJeMAE50oFtuK3xCEL/ta1LC90Tv0mbRbiJZQkU=;
 b=h/nOa7EiduvoMQ2+nAU8H2oMwYz343KHwqAdX2uaVcthpXPJm4tg3XkL/ifI6Pzi52tt
 PGzPzAN0MaC1tUVx93TA/HdrCb/KaZ47KZeBo0TCCaKknCb68ufivZyufCqDTQ1W4fEx
 yIZSD7XIUkynKLTTKg/XiRT88XETAeVmt5p05ma+EL2fhHByKEizM5/ZCOsaUfYRfbIQ
 gt3e5vz5JqwgySgF+K0iV67mFxKUBeCjge/n+MPtn56ennTpBUX3ZsuuCUjP6SCb0xJr
 x16JZdykwUAifZU4YQTICqKPjDw69i8HaYk2wCiFpI5JgCJ2NsjGKGcK9thDaP1eUFre qg== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ksada22pb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Nov 2022 13:57:30 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2ABDtVJv031076;
        Fri, 11 Nov 2022 13:57:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3kngwkm2qv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 11 Nov 2022 13:57:27 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ABDvR39032274;
        Fri, 11 Nov 2022 13:57:27 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com [10.204.66.210])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2ABDvQTa032269;
        Fri, 11 Nov 2022 13:57:27 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 014903892; Fri, 11 Nov 2022 05:57:25 -0800 (PST)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com
Subject: [v1] drm/msm/disp/dpu1: add color management support for the crtc
Date:   Fri, 11 Nov 2022 05:57:23 -0800
Message-Id: <1668175043-11028-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uJbO4gpXcP9MTjaQFwmLyZKFSg5ggYdT
X-Proofpoint-GUID: uJbO4gpXcP9MTjaQFwmLyZKFSg5ggYdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_08,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110093
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add color management support for the crtc provided there are
enough dspps that can be allocated from the catalogue.

Changes in v1:
- cache color enabled state in the dpu crtc obj (Dmitry)
- simplify dspp allocation while creating crtc (Dmitry)
- register for color when crtc is created (Dmitry)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  5 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  6 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 53 ++++++++++++++++++++++++++++-
 4 files changed, 64 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4170fbe..ca4c3b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1571,7 +1571,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 
 /* initialize crtc */
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
-				struct drm_plane *cursor)
+				struct drm_plane *cursor, unsigned long features)
 {
 	struct drm_crtc *crtc = NULL;
 	struct dpu_crtc *dpu_crtc = NULL;
@@ -1583,6 +1583,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	crtc = &dpu_crtc->base;
 	crtc->dev = dev;
+	dpu_crtc->color_enabled = features & BIT(DPU_DSPP_PCC);
 
 	spin_lock_init(&dpu_crtc->spin_lock);
 	atomic_set(&dpu_crtc->frame_pending, 0);
@@ -1604,7 +1605,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
-	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+	drm_crtc_enable_color_mgmt(crtc, 0, dpu_crtc->color_enabled, 0);
 
 	/* save user friendly CRTC name for later */
 	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 539b68b..342f9ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -136,6 +136,7 @@ struct dpu_crtc_frame_event {
  * @enabled       : whether the DPU CRTC is currently enabled. updated in the
  *                  commit-thread, not state-swap time which is earlier, so
  *                  safe to make decisions on during VBLANK on/off work
+ * @color_enabled : whether crtc supports color management
  * @feature_list  : list of color processing features supported on a crtc
  * @active_list   : list of color processing features are active
  * @dirty_list    : list of color processing features are dirty
@@ -164,7 +165,7 @@ struct dpu_crtc {
 	u64 play_count;
 	ktime_t vblank_cb_time;
 	bool enabled;
-
+	bool color_enabled;
 	struct list_head feature_list;
 	struct list_head active_list;
 	struct list_head dirty_list;
@@ -269,10 +270,11 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc);
  * @dev: dpu device
  * @plane: base plane
  * @cursor: cursor plane
+ * @features: color features
  * @Return: new crtc object or error
  */
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
-			       struct drm_plane *cursor);
+			       struct drm_plane *cursor, unsigned long features);
 
 /**
  * dpu_crtc_register_custom_event - api for enabling/disabling crtc event
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c9058aa..d72edb8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -579,6 +579,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
+			struct dpu_crtc *dpu_crtc,
 			struct drm_display_mode *mode)
 {
 	struct msm_display_topology topology = {0};
@@ -607,7 +608,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
+	if (dpu_crtc->color_enabled) {
 		if (dpu_kms->catalog->dspp &&
 			(dpu_kms->catalog->dspp_count >= topology.num_lm))
 			topology.num_dspp = topology.num_lm;
@@ -642,6 +643,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
+	struct dpu_crtc *dpu_crtc;
 	int i = 0;
 	int ret = 0;
 
@@ -652,6 +654,7 @@ static int dpu_encoder_virt_atomic_check(
 	}
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	dpu_crtc = to_dpu_crtc(crtc_state->crtc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
 	priv = drm_enc->dev->dev_private;
@@ -677,7 +680,7 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, dpu_crtc, adj_mode);
 
 	/* Reserve dynamic resources now. */
 	if (!ret) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0709da2..ce6f5e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -734,7 +734,54 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 	return rc;
 }
 
+/**
+ * _dpu_kms_populate_dspp_features - Evaluate how many dspps pairs can be facilitated
+                                     to enable color features for encoder and assign
+				     color features prefering primary
+ * @dpu_kms:    Pointer to dpu kms structure
+ * @features:   Pointer to feature array
+ *
+ * Baring single entry, if atleast 2 dspps are available in the catalogue,
+ * then color can be enabled for that crtc
+ */
+static void _dpu_kms_populate_dspp_features(struct dpu_kms *dpu_kms,
+	unsigned long *features)
+{
+	struct drm_encoder *encoder;
+	u32 external_enc_mask = 0;
+	u32 num_dspps = dpu_kms->catalog->dspp_count;
+
+	if (!num_dspps)
+		return;
+	else if (num_dspps > 1)
+		num_dspps /= 2;
+
+	/* Ensure all primary encoders get first allocation of color */
+	drm_for_each_encoder(encoder, dpu_kms->dev) {
+		if(dpu_encoder_is_primary(encoder)) {
+			if (num_dspps) {
+				features[encoder->index] = dpu_kms->catalog->dspp->features;
+				num_dspps--;
+			}
+		} else if(dpu_encoder_is_external(encoder)) {
+			external_enc_mask |= drm_encoder_mask(encoder);
+		}
+	}
+
+	if(!num_dspps)
+		return;
+
+	/* Allocate color for external encoders after primary */
+	drm_for_each_encoder_mask(encoder, dpu_kms->dev, external_enc_mask) {
+		if (num_dspps) {
+			features[encoder->index] = dpu_kms->catalog->dspp->features;
+			num_dspps--;
+		}
+	}
+}
+
 #define MAX_PLANES 20
+#define MAX_ENCODERS 10
 static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 {
 	struct drm_device *dev;
@@ -749,6 +796,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 
 	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
 	int max_crtc_count;
+	unsigned long features[MAX_ENCODERS] = {0};
+
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 	catalog = dpu_kms->catalog;
@@ -798,12 +847,14 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	}
 
 	max_crtc_count = min(max_crtc_count, primary_planes_idx);
+	_dpu_kms_populate_dspp_features(dpu_kms, features);
 
 	/* Create one CRTC per encoder */
 	i = 0;
 	drm_for_each_encoder(encoder, dev) {
 		if (i < max_crtc_count) {
-			crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
+			crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i],
+					features[encoder->index]);
 			if (IS_ERR(crtc)) {
 				ret = PTR_ERR(crtc);
 				return ret;
-- 
2.7.4

