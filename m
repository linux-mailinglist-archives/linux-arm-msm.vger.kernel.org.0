Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6435251E2D8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 03:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445138AbiEGBEL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 21:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiEGBEJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 21:04:09 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07E1108B
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 18:00:23 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id b32so2805484ljf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 18:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ngE+uUnpqy2X2QZyw0O6g/YBVbGSsViwtHRZu1XP7Rs=;
        b=dRUHF+cfD4Kh9YCPJ3EsR7wpGimq6v4bQNCilccjoLHvMjZskCZ77sMHXlSDx8d8cO
         Eyqz1SP4cw7X188B74wzoodvZAxjMvDPV4mpkR3J6Ud49dyRkAw4kK3Dj+QMzEaqVKxa
         +ThCFLQPzCp1n8pwBiAo19KqfwXoLq8Hy4n8C1/9e0Hh1e/obqEFWkelygZUxm8ZYvbB
         vDNFXid+5tvHL8sOoMtODyI4oedbd76UIqAp/Zg1I4sWtzERIR2QtLkuUhARNk8a22xJ
         kBlgCNOnXqBQWSnI7NUJjFJ5Jksp4RT6yvI7rzkiNULsDD8vxRrO11KmwlLxGtT55RXV
         lOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ngE+uUnpqy2X2QZyw0O6g/YBVbGSsViwtHRZu1XP7Rs=;
        b=n8yBrqLcu4GsSQEEBpdHm6KbP+RcEdCQ52BIPIKmXDNd9jR0WBzp4ckyS9OIL8/4LS
         GVWbGoVOfkJeHaxJNF5Dy4Qz5mvdvikQVhO9qqe4X/WeLH+XZpLEAjqX4WD8PlcSKEZe
         pIotSz6RDppDNczcs0dfugfSTsRXTbemvmeX7h6z0bo8HfiQLoXvthIDBu8lzTCnVQGN
         EgIMShbkWIyPdXILDjbT4mhkSBianP18e0o/lL/qE9msCKjqouZ9Ze76QyLih4vaDkAt
         wjdNUikb2fVtB9E+BFNHz/eXvzqCBPCKGsuljjT8Qi0VDrhfgI6BKQ0NvPrdZSGR/rew
         spJg==
X-Gm-Message-State: AOAM531T9ILn94wHoaTueSI8J4s2Pb7rlHRguCxoZ4BF6KBuw/n4kOJ9
        z6nWLB+m90ZDQYIV8w1gJxZV6w==
X-Google-Smtp-Source: ABdhPJyEvKFiZd44iWvem/eGq6cHHgZ5jCFhY9a8X60ksb1eQZ0q44v0MLzDcTKphsaYDN4jnosWnw==
X-Received: by 2002:a2e:9d5a:0:b0:24f:763:fc47 with SMTP id y26-20020a2e9d5a000000b0024f0763fc47mr3536697ljj.384.1651885222228;
        Fri, 06 May 2022 18:00:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g15-20020a056512118f00b0047255d2110csm882907lfr.59.2022.05.06.18.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 18:00:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: don't free the IRQ if it was not requested
Date:   Sat,  7 May 2022 04:00:20 +0300
Message-Id: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
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

As msm_drm_uninit() is called from the msm_drm_init() error path,
additional care should be necessary as not to call the free_irq() for
the IRQ that was not requested before (because an error occured earlier
than the request_irq() call).

This fixed the issue reported with the following backtrace:

[    8.571329] Trying to free already-free IRQ 187
[    8.571339] WARNING: CPU: 0 PID: 76 at kernel/irq/manage.c:1895 free_irq+0x1e0/0x35c
[    8.588746] Modules linked in: pmic_glink pdr_interface fastrpc qrtr_smd snd_soc_hdmi_codec msm fsa4480 gpu_sched drm_dp_aux_bus qrtr i2c_qcom_geni crct10dif_ce qcom_stats qcom_q6v5_pas drm_display_helper gpi qcom_pil_info drm_kms_helper qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem qcom_rng mdt_loader qmi_helpers phy_qcom_qmp ufs_qcom typec qnoc_sm8350 socinfo rmtfs_mem fuse drm ipv6
[    8.624154] CPU: 0 PID: 76 Comm: kworker/u16:2 Not tainted 5.18.0-rc5-next-20220506-00033-g6cee8cab6089-dirty #419
[    8.624161] Hardware name: Qualcomm Technologies, Inc. SM8350 HDK (DT)
[    8.641496] Workqueue: events_unbound deferred_probe_work_func
[    8.647510] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    8.654681] pc : free_irq+0x1e0/0x35c
[    8.658454] lr : free_irq+0x1e0/0x35c
[    8.662228] sp : ffff800008ab3950
[    8.665642] x29: ffff800008ab3950 x28: 0000000000000000 x27: ffff16350f56a700
[    8.672994] x26: ffff1635025df080 x25: ffff16350251badc x24: ffff16350251bb90
[    8.680343] x23: 0000000000000000 x22: 00000000000000bb x21: ffff16350e8f9800
[    8.687690] x20: ffff16350251ba00 x19: ffff16350cbd5880 x18: ffffffffffffffff
[    8.695039] x17: 0000000000000000 x16: ffffa2dd12179434 x15: ffffa2dd1431d02d
[    8.702391] x14: 0000000000000000 x13: ffffa2dd1431d028 x12: 662d79646165726c
[    8.709740] x11: ffffa2dd13fd2438 x10: 000000000000000a x9 : 00000000000000bb
[    8.717111] x8 : ffffa2dd13fd23f0 x7 : ffff800008ab3750 x6 : 00000000fffff202
[    8.724487] x5 : ffff16377e870a18 x4 : 00000000fffff202 x3 : ffff735a6ae1b000
[    8.731851] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff1635015f8000
[    8.739217] Call trace:
[    8.741755]  free_irq+0x1e0/0x35c
[    8.745198]  msm_drm_uninit.isra.0+0x14c/0x294 [msm]
[    8.750548]  msm_drm_bind+0x28c/0x5d0 [msm]
[    8.755081]  try_to_bring_up_aggregate_device+0x164/0x1d0
[    8.760657]  __component_add+0xa0/0x170
[    8.764626]  component_add+0x14/0x20
[    8.768337]  dp_display_probe+0x2a4/0x464 [msm]
[    8.773242]  platform_probe+0x68/0xe0
[    8.777043]  really_probe.part.0+0x9c/0x28c
[    8.781368]  __driver_probe_device+0x98/0x144
[    8.785871]  driver_probe_device+0x40/0x140
[    8.790191]  __device_attach_driver+0xb4/0x120
[    8.794788]  bus_for_each_drv+0x78/0xd0
[    8.798751]  __device_attach+0xdc/0x184
[    8.802713]  device_initial_probe+0x14/0x20
[    8.807031]  bus_probe_device+0x9c/0xa4
[    8.810991]  deferred_probe_work_func+0x88/0xc0
[    8.815667]  process_one_work+0x1d0/0x320
[    8.819809]  worker_thread+0x14c/0x444
[    8.823688]  kthread+0x10c/0x110
[    8.827036]  ret_from_fork+0x10/0x20

Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Fixes: f026e431cf86 ("drm/msm: Convert to Linux IRQ interfaces")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 7 ++++++-
 drivers/gpu/drm/msm/msm_kms.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4a3dda23e3e0..44485363f37a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -113,6 +113,8 @@ static int msm_irq_postinstall(struct drm_device *dev)
 
 static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 {
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
 	int ret;
 
 	if (irq == IRQ_NOTCONNECTED)
@@ -124,6 +126,8 @@ static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 	if (ret)
 		return ret;
 
+	kms->irq_requested = true;
+
 	ret = msm_irq_postinstall(dev);
 	if (ret) {
 		free_irq(irq, dev);
@@ -139,7 +143,8 @@ static void msm_irq_uninstall(struct drm_device *dev)
 	struct msm_kms *kms = priv->kms;
 
 	kms->funcs->irq_uninstall(kms);
-	free_irq(kms->irq, dev);
+	if (kms->irq_requested)
+		free_irq(kms->irq, dev);
 }
 
 struct msm_vblank_work {
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index ab25fff271f9..f8ed7588928c 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -148,6 +148,7 @@ struct msm_kms {
 
 	/* irq number to be passed on to msm_irq_install */
 	int irq;
+	bool irq_requested;
 
 	/* mapper-id used to request GEM buffer mapped for scanout: */
 	struct msm_gem_address_space *aspace;
-- 
2.35.1

