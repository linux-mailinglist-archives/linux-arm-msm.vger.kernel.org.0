Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266B23629B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 22:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243445AbhDPU6S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 16:58:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:56947 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234312AbhDPU6S (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 16:58:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618606673; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qy+sjoe0B5WK+1VFYRK/7gbkTVgpSnoIKgHJbU/MPpg=; b=R+IBedfS+AXGFP2nklqYVtHmPS1WT/csJxrSTcjY6VKGbbM4FsrSyVxHftVrMpcZJsavYTtw
 /2ok/3tCzigkApAQJOBewXBJai1PleYN1lpZKzsct0uxYyFtXY7UY7Yb3N0W3QwK1SBE4Ren
 SAh60ZjgMgQNZSAC/cYwK4JZb6o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6079fa47853c0a2c465f85cc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 20:57:43
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 215CFC43462; Fri, 16 Apr 2021 20:57:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C811C43461;
        Fri, 16 Apr 2021 20:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C811C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org
Subject: [PATCH v5 5/7] drm/msm/disp/dpu1: add API to take DPU register snapshot
Date:   Fri, 16 Apr 2021 13:57:23 -0700
Message-Id: <1618606645-19695-6-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
References: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an API to take a snapshot of DPU controller registers. This API
will be used by the msm_disp_snapshot module to capture the DPU
snapshot.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 50 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h           |  4 +++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 88e9cc3..ead2478 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -19,6 +19,7 @@
 #include "msm_drv.h"
 #include "msm_mmu.h"
 #include "msm_gem.h"
+#include "disp/msm_disp_snapshot.h"
 
 #include "dpu_kms.h"
 #include "dpu_core_irq.h"
@@ -798,6 +799,54 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
 	dpu_core_irq_uninstall(dpu_kms);
 }
 
+static void dpu_kms_mdp_snapshot(struct msm_kms *kms)
+{
+	int i;
+	struct dpu_kms *dpu_kms;
+	struct dpu_mdss_cfg *cat;
+	struct dpu_hw_mdp *top;
+	struct msm_disp_state *disp_state;
+
+	disp_state = kms->disp_state;
+
+	dpu_kms = to_dpu_kms(kms);
+
+	cat = dpu_kms->catalog;
+	top = dpu_kms->hw_mdp;
+
+	pm_runtime_get_sync(&dpu_kms->pdev->dev);
+
+	/* dump CTL sub-blocks HW regs info */
+	for (i = 0; i < cat->ctl_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
+				dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
+
+	/* dump DSPP sub-blocks HW regs info */
+	for (i = 0; i < cat->dspp_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
+				dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
+
+	/* dump INTF sub-blocks HW regs info */
+	for (i = 0; i < cat->intf_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
+				dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
+
+	/* dump PP sub-blocks HW regs info */
+	for (i = 0; i < cat->pingpong_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
+				dpu_kms->mmio + cat->pingpong[i].base, "pingpong_%d", i);
+
+	/* dump SSPP sub-blocks HW regs info */
+	for (i = 0; i < cat->sspp_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
+				dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
+
+	msm_disp_snapshot_add_block(disp_state, top->hw.length,
+			dpu_kms->mmio + top->hw.blk_off, "top");
+
+	pm_runtime_put_sync(&dpu_kms->pdev->dev);
+}
+
 static const struct msm_kms_funcs kms_funcs = {
 	.hw_init         = dpu_kms_hw_init,
 	.irq_preinstall  = dpu_irq_preinstall,
@@ -818,6 +867,7 @@ static const struct msm_kms_funcs kms_funcs = {
 	.round_pixclk    = dpu_kms_round_pixclk,
 	.destroy         = dpu_kms_destroy,
 	.set_encoder_mode = _dpu_kms_set_encoder_mode,
+	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init    = dpu_kms_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index d84bfda..b31fdad 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -122,6 +122,10 @@ struct msm_kms_funcs {
 				 bool cmd_mode);
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
+
+	/* snapshot: */
+	void (*snapshot)(struct msm_kms *kms);
+
 #ifdef CONFIG_DEBUG_FS
 	/* debugfs: */
 	int (*debugfs_init)(struct msm_kms *kms, struct drm_minor *minor);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

