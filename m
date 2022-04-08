Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5126C4F9EA1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 23:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbiDHVHO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 17:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239652AbiDHVHL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 17:07:11 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7A2137B2A;
        Fri,  8 Apr 2022 14:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649451906; x=1680987906;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=Sz/5jNfUVHpq1EmR4KtUM9vpMpnFZnePl/5YbA/z+TU=;
  b=eMLWwTf8vAZj1V/NMFDPCHdeb7D0tcM0MTwLYqWOmIe1jDxLreFz7+FT
   VnJu86YYvQM8hDKr5psRVtAo4mPYytY3ehf5USSSiqbGIiyAcNwxxrUGQ
   TIYdBrz/HoScKXPRRPXHr7bTDa3tHzIGlobXl/EAiouu0CXx3HgXgSz6K
   c=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Apr 2022 14:05:05 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 14:05:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Apr 2022 14:05:05 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Apr 2022 14:05:04 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_khsieh@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/msm/dp: add fail safe mode outside of event_mutex context
Date:   Fri, 8 Apr 2022 14:04:54 -0700
Message-ID: <1649451894-554-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is possible circular locking dependency detected on event_mutex
(see below logs). This is due to set fail safe mode is done at
dp_panel_read_sink_caps() within event_mutex scope. To break this
possible circular locking, this patch move setting fail safe mode
out of event_mutex scope.

[   23.958078] ======================================================
[   23.964430] WARNING: possible circular locking dependency detected
[   23.970777] 5.17.0-rc2-lockdep-00088-g05241de1f69e #148 Not tainted
[   23.977219] ------------------------------------------------------
[   23.983570] DrmThread/1574 is trying to acquire lock:
[   23.988763] ffffff808423aab0 (&dp->event_mutex){+.+.}-{3:3}, at: msm_dp_displ                                                                             ay_enable+0x58/0x164
[   23.997895]
[   23.997895] but task is already holding lock:
[   24.003895] ffffff808420b280 (&kms->commit_lock[i]/1){+.+.}-{3:3}, at: lock_c                                                                             rtcs+0x80/0x8c
[   24.012495]
[   24.012495] which lock already depends on the new lock.
[   24.012495]
[   24.020886]
[   24.020886] the existing dependency chain (in reverse order) is:
[   24.028570]
[   24.028570] -> #5 (&kms->commit_lock[i]/1){+.+.}-{3:3}:
[   24.035472]        __mutex_lock+0xc8/0x384
[   24.039695]        mutex_lock_nested+0x54/0x74
[   24.044272]        lock_crtcs+0x80/0x8c
[   24.048222]        msm_atomic_commit_tail+0x1e8/0x3d0
[   24.053413]        commit_tail+0x7c/0xfc
[   24.057452]        drm_atomic_helper_commit+0x158/0x15c
[   24.062826]        drm_atomic_commit+0x60/0x74
[   24.067403]        drm_mode_atomic_ioctl+0x6b0/0x908
[   24.072508]        drm_ioctl_kernel+0xe8/0x168
[   24.077086]        drm_ioctl+0x320/0x370
[   24.081123]        drm_compat_ioctl+0x40/0xdc
[   24.085602]        __arm64_compat_sys_ioctl+0xe0/0x150
[   24.090895]        invoke_syscall+0x80/0x114
[   24.095294]        el0_svc_common.constprop.3+0xc4/0xf8
[   24.100668]        do_el0_svc_compat+0x2c/0x54
[   24.105242]        el0_svc_compat+0x4c/0xe4
[   24.109548]        el0t_32_sync_handler+0xc4/0xf4
[   24.114381]        el0t_32_sync+0x178
[   24.118688]
[   24.118688] -> #4 (&kms->commit_lock[i]){+.+.}-{3:3}:
[   24.125408]        __mutex_lock+0xc8/0x384
[   24.129628]        mutex_lock_nested+0x54/0x74
[   24.134204]        lock_crtcs+0x80/0x8c
[   24.138155]        msm_atomic_commit_tail+0x1e8/0x3d0
[   24.143345]        commit_tail+0x7c/0xfc
[   24.147382]        drm_atomic_helper_commit+0x158/0x15c
[   24.152755]        drm_atomic_commit+0x60/0x74
[   24.157323]        drm_atomic_helper_set_config+0x68/0x90
[   24.162869]        drm_mode_setcrtc+0x394/0x648
[   24.167535]        drm_ioctl_kernel+0xe8/0x168
[   24.172102]        drm_ioctl+0x320/0x370
[   24.176135]        drm_compat_ioctl+0x40/0xdc
[   24.180621]        __arm64_compat_sys_ioctl+0xe0/0x150
[   24.185904]        invoke_syscall+0x80/0x114
[   24.190302]        el0_svc_common.constprop.3+0xc4/0xf8
[   24.195673]        do_el0_svc_compat+0x2c/0x54
[   24.200241]        el0_svc_compat+0x4c/0xe4
[   24.204544]        el0t_32_sync_handler+0xc4/0xf4
[   24.209378]        el0t_32_sync+0x174/0x178
[   24.213680] -> #3 (crtc_ww_class_mutex){+.+.}-{3:3}:
[   24.220308]        __ww_mutex_lock.constprop.20+0xe8/0x878
[   24.225951]        ww_mutex_lock+0x60/0xd0
[   24.230166]        modeset_lock+0x190/0x19c
[   24.234467]        drm_modeset_lock+0x34/0x54
[   24.238953]        drmm_mode_config_init+0x550/0x764
[   24.244065]        msm_drm_bind+0x170/0x59c
[   24.248374]        try_to_bring_up_master+0x244/0x294
[   24.253572]        __component_add+0xf4/0x14c
[   24.258057]        component_add+0x2c/0x38
[   24.262273]        dsi_dev_attach+0x2c/0x38
[   24.266575]        dsi_host_attach+0xc4/0x120
[   24.271060]        mipi_dsi_attach+0x34/0x48
[   24.275456]        devm_mipi_dsi_attach+0x28/0x68
[   24.280298]        ti_sn_bridge_probe+0x2b4/0x2dc
[   24.285137]        auxiliary_bus_probe+0x78/0x90
[   24.289893]        really_probe+0x1e4/0x3d8
[   24.294194]        __driver_probe_device+0x14c/0x164
[   24.299298]        driver_probe_device+0x54/0xf8
[   24.304043]        __device_attach_driver+0xb4/0x118
[   24.309145]        bus_for_each_drv+0xb0/0xd4
[   24.313628]        __device_attach+0xcc/0x158
[   24.318112]        device_initial_probe+0x24/0x30
[   24.322954]        bus_probe_device+0x38/0x9c
[   24.327439]        deferred_probe_work_func+0xd4/0xf0
[   24.332628]        process_one_work+0x2f0/0x498
[   24.337289]        process_scheduled_works+0x44/0x48
[   24.342391]        worker_thread+0x1e4/0x26c
[   24.346788]        kthread+0xe4/0xf4
[   24.350470]        ret_from_fork+0x10/0x20
[   24.354683]
[   24.354683]
[   24.354683] -> #2 (crtc_ww_class_acquire){+.+.}-{0:0}:
[   24.361489]        drm_modeset_acquire_init+0xe4/0x138
[   24.366777]        drm_helper_probe_detect_ctx+0x44/0x114
[   24.372327]        check_connector_changed+0xbc/0x198
[   24.377517]        drm_helper_hpd_irq_event+0xcc/0x11c
[   24.382804]        dsi_hpd_worker+0x24/0x30
[   24.387104]        process_one_work+0x2f0/0x498
[   24.391762]        worker_thread+0x1d0/0x26c
[   24.396158]        kthread+0xe4/0xf4
[   24.399840]        ret_from_fork+0x10/0x20
[   24.404053]
[   24.404053] -> #1 (&dev->mode_config.mutex){+.+.}-{3:3}:
[   24.411032]        __mutex_lock+0xc8/0x384
[   24.415247]        mutex_lock_nested+0x54/0x74
[   24.419819]        dp_panel_read_sink_caps+0x23c/0x26c
[   24.425108]        dp_display_process_hpd_high+0x34/0xd4
[   24.430570]        dp_display_usbpd_configure_cb+0x30/0x3c
[   24.436205]        hpd_event_thread+0x2ac/0x550
[   24.440864]        kthread+0xe4/0xf4
[   24.444544]        ret_from_fork+0x10/0x20
[   24.448757]
[   24.448757] -> #0 (&dp->event_mutex){+.+.}-{3:3}:
[   24.455116]        __lock_acquire+0xe2c/0x10d8
[   24.459690]        lock_acquire+0x1ac/0x2d0
[   24.463988]        __mutex_lock+0xc8/0x384
[   24.468201]        mutex_lock_nested+0x54/0x74
[   24.472773]        msm_dp_display_enable+0x58/0x164
[   24.477789]        dp_bridge_enable+0x24/0x30
[   24.482273]        drm_atomic_bridge_chain_enable+0x78/0x9c
[   24.488006]        drm_atomic_helper_commit_modeset_enables+0x1bc/0x244
[   24.494801]        msm_atomic_commit_tail+0x248/0x3d0
[   24.499992]        commit_tail+0x7c/0xfc
[   24.504031]        drm_atomic_helper_commit+0x158/0x15c
[   24.509404]        drm_atomic_commit+0x60/0x74
[   24.513976]        drm_mode_atomic_ioctl+0x6b0/0x908
[   24.519079]        drm_ioctl_kernel+0xe8/0x168
[   24.523650]        drm_ioctl+0x320/0x370
[   24.527689]        drm_compat_ioctl+0x40/0xdc
[   24.532175]        __arm64_compat_sys_ioctl+0xe0/0x150
[   24.537463]        invoke_syscall+0x80/0x114
[   24.541861]        el0_svc_common.constprop.3+0xc4/0xf8
[   24.547235]        do_el0_svc_compat+0x2c/0x54
[   24.551806]        el0_svc_compat+0x4c/0xe4
[   24.556106]        el0t_32_sync_handler+0xc4/0xf4
[   24.560948]        el0t_32_sync+0x174/0x178

Changes in v2:
-- add circular lockiing trace

Fixes: d4aca422539c ("drm/msm/dp:  always add fail-safe mode into connector mode list")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 20 ++++++++++----------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 178b774..a42732b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -580,6 +580,12 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 			dp->dp_display.connector_type, state);
 	mutex_unlock(&dp->event_mutex);
 
+	/*
+	 * add fail safe mode outside event_mutex scope
+	 * to avoid potiential circular lock with drm thread
+	 */
+	dp_panel_add_fail_safe_mode(dp->dp_display.connector);
+
 	/* uevent will complete connection part */
 	return 0;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index f141872..26c3653 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -151,6 +151,15 @@ static int dp_panel_update_modes(struct drm_connector *connector,
 	return rc;
 }
 
+void dp_panel_add_fail_safe_mode(struct drm_connector *connector)
+{
+	/* fail safe edid */
+	mutex_lock(&connector->dev->mode_config.mutex);
+	if (drm_add_modes_noedid(connector, 640, 480))
+		drm_set_preferred_mode(connector, 640, 480);
+	mutex_unlock(&connector->dev->mode_config.mutex);
+}
+
 int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	struct drm_connector *connector)
 {
@@ -207,16 +216,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 			goto end;
 		}
 
-		/* fail safe edid */
-		mutex_lock(&connector->dev->mode_config.mutex);
-		if (drm_add_modes_noedid(connector, 640, 480))
-			drm_set_preferred_mode(connector, 640, 480);
-		mutex_unlock(&connector->dev->mode_config.mutex);
-	} else {
-		/* always add fail-safe mode as backup mode */
-		mutex_lock(&connector->dev->mode_config.mutex);
-		drm_add_modes_noedid(connector, 640, 480);
-		mutex_unlock(&connector->dev->mode_config.mutex);
+		dp_panel_add_fail_safe_mode(connector);
 	}
 
 	if (panel->aux_cfg_update_done) {
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9023e5b..99739ea 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -59,6 +59,7 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel);
 int dp_panel_deinit(struct dp_panel *dp_panel);
 int dp_panel_timing_cfg(struct dp_panel *dp_panel);
 void dp_panel_dump_regs(struct dp_panel *dp_panel);
+void dp_panel_add_fail_safe_mode(struct drm_connector *connector);
 int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 		struct drm_connector *connector);
 u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel, u32 mode_max_bpp,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

