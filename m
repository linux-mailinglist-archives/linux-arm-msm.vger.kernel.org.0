Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F822364E4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 00:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbhDSW5x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 18:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38680 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232185AbhDSW5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 18:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618873042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fS9SqrwNupvrpopbD8VXXaX4x7rSbuPne+g1wA7IR90=;
        b=MiMLuhYFAU9CoxPgoNjIbjReQqzKxAfHl8pfqYviIDmdUPe9d4NHrblMlVYFAY3xTkxjAK
        Wf7XqjHog9XfXm8G2EDGzdcMWPubn2H9u3TeoNHnbMrAxEI3Iv4DVkzKA4uNusUYD6hiF1
        RQcr4MRaDCy9HZeWUT2Pn/wdfJxThgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-f2PZW0kYMXOTpl2tXGVvAQ-1; Mon, 19 Apr 2021 18:57:18 -0400
X-MC-Unique: f2PZW0kYMXOTpl2tXGVvAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 268CD501F0;
        Mon, 19 Apr 2021 22:57:15 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-119-153.rdu2.redhat.com [10.10.119.153])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2AA325C1C4;
        Mon, 19 Apr 2021 22:57:11 +0000 (UTC)
From:   Lyude Paul <lyude@redhat.com>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Oleg Vasilev <oleg.vasilev@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Manasi Navare <manasi.d.navare@intel.com>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Xu Wang <vulab@iscas.ac.cn>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ
        ARCHITECTURE)
Subject: [PATCH v3 09/20] drm/dp: Pass drm_dp_aux to drm_dp*_link_train_channel_eq_delay()
Date:   Mon, 19 Apr 2021 18:55:11 -0400
Message-Id: <20210419225523.184856-10-lyude@redhat.com>
In-Reply-To: <20210419225523.184856-1-lyude@redhat.com>
References: <20210419225523.184856-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So that we can start using drm_dbg_*() for
drm_dp_link_train_channel_eq_delay() and
drm_dp_lttpr_link_train_channel_eq_delay().

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |  2 +-
 drivers/gpu/drm/drm_dp_helper.c                    | 14 +++++++++-----
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  4 ++--
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 |  4 ++--
 drivers/gpu/drm/radeon/atombios_dp.c               |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  2 +-
 include/drm/drm_dp_helper.h                        |  6 ++++--
 8 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
index b0eaeb6afd29..9f0acee0a271 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
@@ -682,7 +682,7 @@ amdgpu_atombios_dp_link_train_ce(struct amdgpu_atombios_dp_link_train_info *dp_i
 	dp_info->tries = 0;
 	channel_eq = false;
 	while (1) {
-		drm_dp_link_train_channel_eq_delay(dp_info->dpcd);
+		drm_dp_link_train_channel_eq_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
 						 dp_info->link_status) <= 0) {
diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 3a3c4cfb9ac6..eaafc676aa0c 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -151,7 +151,8 @@ void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_link_train_clock_recovery_delay);
 
-static void __drm_dp_link_train_channel_eq_delay(unsigned long rd_interval)
+static void __drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
+						 unsigned long rd_interval)
 {
 	if (rd_interval > 4)
 		DRM_DEBUG_KMS("AUX interval %lu, out of range (max 4)\n",
@@ -165,9 +166,11 @@ static void __drm_dp_link_train_channel_eq_delay(unsigned long rd_interval)
 	usleep_range(rd_interval, rd_interval * 2);
 }
 
-void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+void drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
+					const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
-	__drm_dp_link_train_channel_eq_delay(dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
+	__drm_dp_link_train_channel_eq_delay(aux,
+					     dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
 					     DP_TRAINING_AUX_RD_MASK);
 }
 EXPORT_SYMBOL(drm_dp_link_train_channel_eq_delay);
@@ -183,13 +186,14 @@ static u8 dp_lttpr_phy_cap(const u8 phy_cap[DP_LTTPR_PHY_CAP_SIZE], int r)
 	return phy_cap[r - DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1];
 }
 
-void drm_dp_lttpr_link_train_channel_eq_delay(const u8 phy_cap[DP_LTTPR_PHY_CAP_SIZE])
+void drm_dp_lttpr_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
+					      const u8 phy_cap[DP_LTTPR_PHY_CAP_SIZE])
 {
 	u8 interval = dp_lttpr_phy_cap(phy_cap,
 				       DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1) &
 		      DP_TRAINING_AUX_RD_MASK;
 
-	__drm_dp_link_train_channel_eq_delay(interval);
+	__drm_dp_link_train_channel_eq_delay(aux, interval);
 }
 EXPORT_SYMBOL(drm_dp_lttpr_link_train_channel_eq_delay);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 198ddb3c173a..6bf6f1ec13ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -665,11 +665,11 @@ intel_dp_link_training_channel_equalization_delay(struct intel_dp *intel_dp,
 						  enum drm_dp_phy dp_phy)
 {
 	if (dp_phy == DP_PHY_DPRX) {
-		drm_dp_link_train_channel_eq_delay(intel_dp->dpcd);
+		drm_dp_link_train_channel_eq_delay(&intel_dp->aux, intel_dp->dpcd);
 	} else {
 		const u8 *phy_caps = intel_dp_lttpr_phy_caps(intel_dp, dp_phy);
 
-		drm_dp_lttpr_link_train_channel_eq_delay(phy_caps);
+		drm_dp_lttpr_link_train_channel_eq_delay(&intel_dp->aux, phy_caps);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 264a9eae87d3..2cebd17a7289 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1184,7 +1184,7 @@ static int dp_ctrl_link_lane_down_shift(struct dp_ctrl_private *ctrl)
 static void dp_ctrl_clear_training_pattern(struct dp_ctrl_private *ctrl)
 {
 	dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
-	drm_dp_link_train_channel_eq_delay(ctrl->panel->dpcd);
+	drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
 }
 
 static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
@@ -1215,7 +1215,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 	dp_ctrl_train_pattern_set(ctrl, pattern | DP_RECOVERED_CLOCK_OUT_EN);
 
 	for (tries = 0; tries <= maximum_retries; tries++) {
-		drm_dp_link_train_channel_eq_delay(ctrl->panel->dpcd);
+		drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
 
 		ret = dp_ctrl_read_link_status(ctrl, link_status);
 		if (ret)
diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
index 6501598448b4..4fb397ee7c84 100644
--- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
+++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
@@ -665,7 +665,7 @@ static int edp_start_link_train_2(struct edp_ctrl *ctrl)
 		return ret;
 
 	while (1) {
-		drm_dp_link_train_channel_eq_delay(ctrl->dpcd);
+		drm_dp_link_train_channel_eq_delay(ctrl->drm_aux, ctrl->dpcd);
 
 		rlen = drm_dp_dpcd_read_link_status(ctrl->drm_aux, link_status);
 		if (rlen < DP_LINK_STATUS_SIZE) {
@@ -743,7 +743,7 @@ static int edp_clear_training_pattern(struct edp_ctrl *ctrl)
 
 	ret = edp_train_pattern_set_write(ctrl, 0);
 
-	drm_dp_link_train_channel_eq_delay(ctrl->dpcd);
+	drm_dp_link_train_channel_eq_delay(ctrl->drm_aux, ctrl->dpcd);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index 299b9d8da376..4c1e551d9714 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -743,7 +743,7 @@ static int radeon_dp_link_train_ce(struct radeon_dp_link_train_info *dp_info)
 	dp_info->tries = 0;
 	channel_eq = false;
 	while (1) {
-		drm_dp_link_train_channel_eq_delay(dp_info->dpcd);
+		drm_dp_link_train_channel_eq_delay(dp_info->aux, dp_info->dpcd);
 
 		if (drm_dp_dpcd_read_link_status(dp_info->aux,
 						 dp_info->link_status) <= 0) {
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 6ef2d9b3884c..cc98ac009ecd 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -778,7 +778,7 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
 		if (ret)
 			return ret;
 
-		drm_dp_link_train_channel_eq_delay(dp->dpcd);
+		drm_dp_link_train_channel_eq_delay(&dp->aux, dp->dpcd);
 		ret = drm_dp_dpcd_read_link_status(&dp->aux, link_status);
 		if (ret < 0)
 			return ret;
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 9900c93e4f2c..b162aed6f1c8 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1486,8 +1486,10 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
 void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
 					    const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 void drm_dp_lttpr_link_train_clock_recovery_delay(void);
-void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
-void drm_dp_lttpr_link_train_channel_eq_delay(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
+void drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
+					const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
+void drm_dp_lttpr_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
+					      const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 
 u8 drm_dp_link_rate_to_bw_code(int link_rate);
 int drm_dp_bw_code_to_link_rate(u8 link_bw);
-- 
2.30.2

