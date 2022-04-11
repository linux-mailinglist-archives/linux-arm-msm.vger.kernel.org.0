Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43D784FC8F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 01:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbiDKXwN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 19:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbiDKXwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 19:52:12 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90D326ADF
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 16:49:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bu29so29468448lfb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 16:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4HgcONI+/NDsHApI02jrWJ7ANuG5+vx7GwloUgQIB1k=;
        b=QMQ1uvn18C0UGeOPBbNCRZJbec3b1Atw1E5PV+YJnX8ZedATwwVijen+9vl9jF/VtP
         kiNUDylDiHe5wJZbXzHtXwx/WhCkm6Im+eCd9MoaxoAJhjPak1IW8XUgoj+neFqjysda
         8KElZRlUUgdRB3aLoDlW4Gum+O5XPFdjQcZHc1Y827pwfv+7pdomL4Vxzo1jpsVE2vY7
         N44gwR97OxtJWB2a/h0ByTPIvHiq8UNpFxT9Za4RfeiGJmx8H1698e4WWZbSE3iuwZXy
         3qURh8VRdAFGc/95e09/cCN+ml55uRfO5ZCFOU17FjVEFUSanljx0S0jC1Lozlm3Wj1V
         eszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4HgcONI+/NDsHApI02jrWJ7ANuG5+vx7GwloUgQIB1k=;
        b=k6klMiZJ1xQlJRqiBum2FvMui5VQ7CtNLBXk+sgx+vu6U6n1p81+qMrDfygTyhDYj5
         LCxMrs6ZB/DLwEuqgzqNGjTjep9P+C2MYO7STw/EycqphfY2cGkoVvHIftt5GnfYVrbJ
         mz+2mbE6395Gano2pUoZTd48XnXnRqRp3j+0vERr3fbbVgIc+rNPhdYaO72RUn4BsmQn
         yKEv9EDX/UsoAtM2Dh1QNReFg+lE2HcdPwU/BeP7ipjDCtpC6+YSc2bTDQIW5x9deGT3
         iFn2HReplO76tDheiUh/zKHnK4YhLznMgNdIUeckRyrA0CUpLAJfu0fmko7yYjVHW6Km
         WPaA==
X-Gm-Message-State: AOAM5313IjJQ+xEyfZjLWtnzIXJJFdiXRMVJDORNjaFPnJ7VikpPzcQd
        4QATt0EBoWSycSVakrZ+G+8qNA==
X-Google-Smtp-Source: ABdhPJwdmiITlzFjVdOzH3CdKgzUWghYEHv99tQf+bTHWQkKQMJ+bYZYXknhNRGQEdFxCbYa6S0YRQ==
X-Received: by 2002:a19:6b13:0:b0:46b:b970:5792 with SMTP id d19-20020a196b13000000b0046bb9705792mr252491lfa.100.1649720994911;
        Mon, 11 Apr 2022 16:49:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f16-20020a2eb5b0000000b0024b62fa91b9sm460732ljn.99.2022.04.11.16.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 16:49:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] drm/msm: properly add and remove internal bridges
Date:   Tue, 12 Apr 2022 02:49:53 +0300
Message-Id: <20220411234953.2425280-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add calls to drm_bridge_add()/drm_bridge_remove() DRM bridges created by
the driver. This fixes the following warning.

WARNING: CPU: 0 PID: 1 at kernel/locking/mutex.c:579 __mutex_lock+0x840/0x9f4
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc1-00002-g3054695a0d27-dirty #55
Hardware name: Generic DT based system
 unwind_backtrace from show_stack+0x10/0x14
 show_stack from dump_stack_lvl+0x58/0x70
 dump_stack_lvl from __warn+0xc8/0x1e8
 __warn from warn_slowpath_fmt+0x78/0xa8
 warn_slowpath_fmt from __mutex_lock+0x840/0x9f4
 __mutex_lock from mutex_lock_nested+0x1c/0x24
 mutex_lock_nested from drm_bridge_hpd_enable+0x2c/0x84
 drm_bridge_hpd_enable from msm_hdmi_modeset_init+0xc0/0x21c
 msm_hdmi_modeset_init from mdp4_kms_init+0x53c/0x90c
 mdp4_kms_init from msm_drm_bind+0x514/0x698
 msm_drm_bind from try_to_bring_up_aggregate_device+0x160/0x1bc
 try_to_bring_up_aggregate_device from component_master_add_with_match+0xc4/0xf8
 component_master_add_with_match from msm_pdev_probe+0x274/0x350
 msm_pdev_probe from platform_probe+0x5c/0xbc
 platform_probe from really_probe.part.0+0x9c/0x290
 really_probe.part.0 from __driver_probe_device+0xa8/0x13c
 __driver_probe_device from driver_probe_device+0x34/0x10c
 driver_probe_device from __driver_attach+0xbc/0x178
 __driver_attach from bus_for_each_dev+0x74/0xc0
 bus_for_each_dev from bus_add_driver+0x160/0x1e4
 bus_add_driver from driver_register+0x88/0x118
 driver_register from do_one_initcall+0x6c/0x334
 do_one_initcall from kernel_init_freeable+0x1bc/0x220
 kernel_init_freeable from kernel_init+0x18/0x12c
 kernel_init from ret_from_fork+0x14/0x2c

Fixes: 3d3f8b1f8b62 ("drm/bridge: make bridge registration independent of drm flow")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Dropped drm_bridge_detach() call, it is not necessary, also it breaks
   compilation if MSM DRM is built as module.
---
 drivers/gpu/drm/msm/dp/dp_drm.c        | 4 ++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c  | 3 +++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 3 +++
 drivers/gpu/drm/msm/msm_drv.c          | 3 +++
 4 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 80f59cf99089..262744914f97 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -230,9 +230,13 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 	bridge->funcs = &dp_bridge_ops;
 	bridge->encoder = encoder;
 
+	drm_bridge_add(bridge);
+
 	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (rc) {
 		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
+		drm_bridge_remove(bridge);
+
 		return ERR_PTR(rc);
 	}
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 9f6af0f0fe00..1db93e562fe6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -665,6 +665,8 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
+	drm_bridge_add(bridge);
+
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
 		goto fail;
@@ -735,6 +737,7 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 
 void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
 {
+	drm_bridge_remove(bridge);
 }
 
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 10ebe2089cb6..97c24010c4d1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -15,6 +15,7 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 
 	msm_hdmi_hpd_disable(hdmi_bridge);
+	drm_bridge_remove(bridge);
 }
 
 static void msm_hdmi_power_on(struct drm_bridge *bridge)
@@ -349,6 +350,8 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID;
 
+	drm_bridge_add(bridge);
+
 	ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2905b82a9de3..d8f2c8838a7f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -232,6 +232,9 @@ static int msm_drm_uninit(struct device *dev)
 
 	drm_mode_config_cleanup(ddev);
 
+	for (i = 0; i < priv->num_bridges; i++)
+		drm_bridge_remove(priv->bridges[i]);
+
 	pm_runtime_get_sync(dev);
 	msm_irq_uninstall(ddev);
 	pm_runtime_put_sync(dev);
-- 
2.35.1

