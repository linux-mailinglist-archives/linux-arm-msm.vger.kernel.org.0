Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8494F5663
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244784AbiDFFiz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353336AbiDFCnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 22:43:04 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1805A28CF7B
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:45:55 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id m12so1046650ljp.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sPe/iqwEicjdxx1JaEmsexqI0mM5o2EgIZXKAaX//Hs=;
        b=gd6O1Mwu7ekfyikdHG4+HD22Kwjth89ebHwIsgU1WE+yQ8Xbb/34CgYYPszNlW17EP
         THqPT6iHYqRDCyyiNQdSrV0XvlnxqRSC0KcPvOIi48V7Gsj/NiH3zubwBQQISxNfN8tK
         6A+ehOjpBinhmRN7TCHdgcwZCSVoYvVROT3TqwhhGED2SGoKiLo4IY91gZrZKNd2w7VD
         IMQYYkf4npxk+Rd/wKI6ARTDrUYh539Y0Rj6O8VywVOfdRkxViTrrfDQ5F7JNo9X6Jep
         bKEpjG2x8veupDp/5UF1YOh1ufzl/dCfLxLs+z0jAlRN3ugQi2yQLcGl9sHG4bD+CUrV
         oaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sPe/iqwEicjdxx1JaEmsexqI0mM5o2EgIZXKAaX//Hs=;
        b=2t5O/33v0XSNyk1IwJ8olAMBsuX2Ix/gDtX/zWdaZmFR79vZVcegGc/AHb2zdL3M5f
         i+F7RDEK4Z+YIMPfkEh0uVXlOf24+0JyBYrPBTQPL7xeYWxIdR1Da3y9aqz84uR6iH/J
         q36/NZ8IHH/2F/APM6wpbchBQOYvQXpGrjXiZYqWOCP1wAjWMcw9I3lyjMI5cjN+rr4/
         bI0VDNoDcFvyw1Z/PeSeCbjEnlUYwugBqrrCqUnhBlW/YSz+R25LYI2EdnD6R40b8z6O
         x7RHaLLfgTwKZuaq7dJ1rG705Omf/TOoFBT8WJpOMCX3OAA59OAP6qCWuk2kBDPNi8Ui
         rZbQ==
X-Gm-Message-State: AOAM532I5CkzQRO9PAKyhlnwKWgXg/qeMftlEFbBBLni+XmqGHewC47b
        7q9yo2DE4sATCjRuv+Rin+Jemg==
X-Google-Smtp-Source: ABdhPJxApADsqzdd9+ZMoEM2yi86wkhuBvf78CQFa7fEGP3UIejNKhVqu6/I+/g+66xdehrKU8LpwA==
X-Received: by 2002:a05:651c:179a:b0:247:d37b:6ec5 with SMTP id bn26-20020a05651c179a00b00247d37b6ec5mr3492194ljb.112.1649202353228;
        Tue, 05 Apr 2022 16:45:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g11-20020ac24d8b000000b0044a3454c858sm1651897lfe.81.2022.04.05.16.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:45:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/4] drm/msm/hdmi: properly add and remove created bridges
Date:   Wed,  6 Apr 2022 02:45:48 +0300
Message-Id: <20220405234551.359453-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
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

Add calls to drm_bridge_add()/drm_bridge_remove() for the internal HDMI
bridges. This fixes the following warning.

[    2.195003] ------------[ cut here ]------------
[    2.195044] WARNING: CPU: 0 PID: 1 at kernel/locking/mutex.c:579 __mutex_lock+0x840/0x9f4
[    2.198774] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
[    2.198786] Modules linked in:
[    2.211868] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc1-00002-g3054695a0d27-dirty #55
[    2.214671] Hardware name: Generic DT based system
[    2.223265]  unwind_backtrace from show_stack+0x10/0x14
[    2.228036]  show_stack from dump_stack_lvl+0x58/0x70
[    2.233159]  dump_stack_lvl from __warn+0xc8/0x1e8
[    2.238367]  __warn from warn_slowpath_fmt+0x78/0xa8
[    2.243054]  warn_slowpath_fmt from __mutex_lock+0x840/0x9f4
[    2.248174]  __mutex_lock from mutex_lock_nested+0x1c/0x24
[    2.253818]  mutex_lock_nested from drm_bridge_hpd_enable+0x2c/0x84
[    2.259116]  drm_bridge_hpd_enable from msm_hdmi_modeset_init+0xc0/0x21c
[    2.265279]  msm_hdmi_modeset_init from mdp4_kms_init+0x53c/0x90c
[    2.272223]  mdp4_kms_init from msm_drm_bind+0x514/0x698
[    2.278212]  msm_drm_bind from try_to_bring_up_aggregate_device+0x160/0x1bc
[    2.283595]  try_to_bring_up_aggregate_device from component_master_add_with_match+0xc4/0xf8
[    2.290281]  component_master_add_with_match from msm_pdev_probe+0x274/0x350
[    2.298958]  msm_pdev_probe from platform_probe+0x5c/0xbc
[    2.305990]  platform_probe from really_probe.part.0+0x9c/0x290
[    2.311284]  really_probe.part.0 from __driver_probe_device+0xa8/0x13c
[    2.317011]  __driver_probe_device from driver_probe_device+0x34/0x10c
[    2.323610]  driver_probe_device from __driver_attach+0xbc/0x178
[    2.330122]  __driver_attach from bus_for_each_dev+0x74/0xc0
[    2.336282]  bus_for_each_dev from bus_add_driver+0x160/0x1e4
[    2.341925]  bus_add_driver from driver_register+0x88/0x118
[    2.347570]  driver_register from do_one_initcall+0x6c/0x334
[    2.352953]  do_one_initcall from kernel_init_freeable+0x1bc/0x220
[    2.358853]  kernel_init_freeable from kernel_init+0x18/0x12c
[    2.364842]  kernel_init from ret_from_fork+0x14/0x2c
[    2.370657] Exception stack(0xf081dfb0 to 0xf081dff8)
[    2.375693] dfa0:                                     00000000 00000000 00000000 00000000
[    2.380733] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.388893] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.397170] irq event stamp: 202911
[    2.403551] hardirqs last  enabled at (202911): [<c0f86044>] _raw_spin_unlock_irqrestore+0x44/0x48
[    2.406944] hardirqs last disabled at (202910): [<c0f85e18>] _raw_spin_lock_irqsave+0x68/0x6c
[    2.416063] softirqs last  enabled at (202738): [<c03015f0>] __do_softirq+0x2f8/0x530
[    2.424638] softirqs last disabled at (202733): [<c032bc68>] __irq_exit_rcu+0x14c/0x170
[    2.432453] ---[ end trace 0000000000000000 ]---

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 3 +++
 1 file changed, 3 insertions(+)

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
-- 
2.35.1

