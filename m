Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A72B24B6224
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 05:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbiBOEfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 23:35:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiBOEfH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 23:35:07 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14381A9E0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 20:34:58 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id j38-20020a9d1926000000b0059fa6de6c71so13007458ota.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 20:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LndteQAuZoPXbHZvKr9QSUB1aB53+hdRP336/tKDh20=;
        b=dk+mVdbPwGVxuwzXDePGfsNV/kfTyDfEAzSZjuhZWcaD3DH5e8mDuOmpIr+oJVXTBq
         Xf1sorRIYEisiS/hfcEP1dAW8LvXxMYvbaujwKrQwxzkDjOJU7ekWgTgFzh6uJqszFQa
         6TP23+bc7F85FuVJ5Gbk669iLMFskIGtNvOgBq2PsKBfwR5U/wFypEX+YxQ5K86vuzWs
         ZHztPidfTAKQxq/Zyl6Tl8h2N4j6QlTJGuSw7bPGE8MTkM2RlJOuPy7yL5xoSRZfIt87
         0TzPPTBdbnBWD1ESUXCPr/QrZml3BZ8Qg3u7xXfCp9pkxNV8oqTlQZx7gPTnAMZX9aav
         CTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LndteQAuZoPXbHZvKr9QSUB1aB53+hdRP336/tKDh20=;
        b=gczG/70nh4ARneptjBbn1UgFP88gHek4UBD/MQuo/nhWSpANz1mY3SbPBokSlnOU/n
         jnn9mPcH+zyAiqf1PxDXm/dRwoB9G1xSUuw3fCs903n3FW/IN+22fO9aBDAZKOokwAJh
         RA7eIupULl1s/YtrgKNToaaPFMWyi4HN5263XmFZR5YzlsAjA8fpnF7FpSD7V8x20zr6
         q52MOb6Qupv5JD1RzPfkV+CqhojaIrnAb1uSBRrW6c7E1pvXOemlkPdPnYDSDZDBUSnE
         NnJnvz/vd7cLCNjkyKq8R6JOH3+hQ43Ynf1f37/28b+pSdpQ2KdhvmFGWrRkJoEfH2WU
         CF8A==
X-Gm-Message-State: AOAM5323WSUDXSFxGZdxgDAK7k3bIgSNJK37ulc/FXAzqxg+Bdod+1+M
        PeRZso7a2dG0MTIAln/al+T1ng==
X-Google-Smtp-Source: ABdhPJwJ7vpnfKRUoUNI6lDoqpsP+C8DQRXFdG731kpULE9N3n08RtH4xL/oCyGdt/jYsagEtF9dXQ==
X-Received: by 2002:a9d:4e89:: with SMTP id v9mr739083otk.177.1644899697265;
        Mon, 14 Feb 2022 20:34:57 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id v31sm13563934ott.25.2022.02.14.20.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 20:34:56 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Disable boot loader configured data paths
Date:   Mon, 14 Feb 2022 20:37:08 -0800
Message-Id: <20220215043708.1256854-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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

It's typical for the bootloader to configure CTL_0 for the boot splash
or EFIFB, but for non-DSI use cases the DPU driver tend to pick another
CTL and the system might end up with two configured data paths producing
data on the same INTF. In particular as the IOMMU configuration isn't
retained from the bootloader one of the data paths will push underflow
color, resulting in screen flickering.

Naturally the end goal would be to inherit the bootloader's
configuration and provide the user with a glitch-free handover from the
boot configuration to a running DPU.

But such effort will affect clocks, regulators, power-domains etc, and
will take time to implement. So in the meantime this patch simply
disables all the data paths, on platforms that has CTL_FETCH_ACTIVE, to
avoid the graphical artifacts.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 13 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c     | 17 +++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h     |  8 ++++++++
 5 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 02da9ecf71f1..69d4849484fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -357,6 +357,18 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
 	DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
 }
 
+static void dpu_hw_ctl_disable_boot_config(struct dpu_hw_ctl *ctx)
+{
+	if (ctx->caps->features & BIT(DPU_CTL_FETCH_ACTIVE)) {
+		/*
+		 * Disable the pipe fetch and trigger a start, to disable the
+		 * data path
+		 */
+		DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, 0);
+		DPU_REG_WRITE(&ctx->hw, CTL_START, 0x1);
+	}
+}
+
 static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
 {
@@ -590,6 +602,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
 	ops->reset = dpu_hw_ctl_reset_control;
 	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
+	ops->disable_boot_config = dpu_hw_ctl_disable_boot_config;
 	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
 	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	ops->get_bitmask_sspp = dpu_hw_ctl_get_bitmask_sspp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 806c171e5df2..c2734f6ab760 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -159,6 +159,12 @@ struct dpu_hw_ctl_ops {
 	 */
 	void (*clear_all_blendstages)(struct dpu_hw_ctl *ctx);
 
+	/**
+	 * Disable the configuration setup by the bootloader
+	 * @ctx	      : ctl path ctx pointer
+	 */
+	void (*disable_boot_config)(struct dpu_hw_ctl *ctx);
+
 	/**
 	 * Configure layer mixer to pipe configuration
 	 * @ctx       : ctl path ctx pointer
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index cedc631f8498..eef2f017031a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1107,6 +1107,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms->rm_init = true;
 
+	dpu_rm_clear_boot_config(&dpu_kms->rm, dpu_kms->catalog);
+
 	dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
 					     dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_mdp)) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9c83d6e427a..3365c5e41e28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -4,6 +4,7 @@
  */
 
 #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
+#include <linux/delay.h>
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
@@ -229,6 +230,22 @@ int dpu_rm_init(struct dpu_rm *rm,
 	return rc ? rc : -EFAULT;
 }
 
+void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat)
+{
+	struct dpu_hw_ctl *ctl;
+	int i;
+
+	for (i = CTL_0; i < CTL_MAX; i++) {
+		if (!rm->ctl_blks[i - CTL_0])
+			continue;
+
+		DPU_DEBUG("disabling ctl%d boot configuration\n", i - CTL_0);
+
+		ctl = to_dpu_hw_ctl(rm->ctl_blks[i - CTL_0]);
+		ctl->ops.disable_boot_config(ctl);
+	}
+}
+
 static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
 {
 	return top->num_intf > 1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 1f12c8d5b8aa..d3e084541e67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -88,5 +88,13 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
+
+/**
+ * dpu_rm_clear_boot_config() - Tear down any data paths configured by boot
+ * @rm: DPU Resource Manager handle
+ * @cat: Pointer to hardware catalog
+ */
+void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat);
+
 #endif /* __DPU_RM_H__ */
 
-- 
2.33.1

