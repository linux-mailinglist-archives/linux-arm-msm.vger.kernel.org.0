Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326C0379E29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 06:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhEKEUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 00:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbhEKEUF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 00:20:05 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298E1C06138B
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:18:59 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id j17-20020a4ad6d10000b02901fef5280522so3961010oot.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UHDiz1eezJ432ML1+q0u/7YP2AqbZQOs7C+Mh2wfUZM=;
        b=elkI4iI8zU5LP6C7fY67XaMyEKBfxs65uArPZDePbpFwolvnqmBPpTehyUjLmimqUB
         KlpbDcYlJkSLYpDEXMeFSvWvRGzuim++ElCuaSmTzN8LnFQMpkVDK2txkOUNF8A9zcNu
         DV0d0YZzCNSy7vhEpikEGYRyRkDAPjuTXJyNjvgbyNhCXsWBOh4qcJUD4XMZZu+nSuiW
         USJ75cDR9zxpb5sXoAmDReAldjQ09u/5Adqmkslbsoasle3Jk3ZGfY9eTdFkrJJ7HyMd
         KCcZuJCrPjH1qd8kRlJcRO4yijomLQ3MeKT3jcusbzPV7KjUy+FhelXURriC6o/E28gK
         iHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UHDiz1eezJ432ML1+q0u/7YP2AqbZQOs7C+Mh2wfUZM=;
        b=A+RQS14d/n10/pL1aQ9eHJz0HFUE0jGvb0IdYjgwKTw/LCVPL7H5to2z7yxpe7bFCn
         /MJyGAuO4vSmyJkMmrldgIFahb5WeAGQ/CGE18nqNogx+4uBoqHfVuBkTR5RMlm3p4nV
         XNBfL6v/ClFVXjENspUdLY6VEuVrxSPJgRpFFtcRSj1DCOG9DQoxqv9FMfo+Wd0FV4xi
         Lk6SDsnawMOAbKQ8TfwGcfZLg4V3TmO+VB+2aTmyDDTMVgYYCUs2zytJpIPO+Dh4jaWT
         dcXYaTObg41sienVkJl6h3ijRFfoi6u4xO/b4+y4wb9maLyLOG33YHOkX4jO9yV371/R
         vC/g==
X-Gm-Message-State: AOAM532BPGFOV1xlCe3png+CWkr+j1zxTAgZgeFw9fgtoaCLwu2CLHp3
        cCpo8kqGffXe6ZNfBNi1E9cFMVh7T+Rv9w==
X-Google-Smtp-Source: ABdhPJz/6oZvGjOsOX2nLMv/1sonOntXRywl8G5ChsiimZhwdTrNEprOLhFcZFB7PhMjRt2LRko6CQ==
X-Received: by 2002:a4a:4f06:: with SMTP id c6mr21827742oob.34.1620706738506;
        Mon, 10 May 2021 21:18:58 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
        by smtp.gmail.com with ESMTPSA id z15sm558647otp.20.2021.05.10.21.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:18:58 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/msm/dpu: Clear boot loader configured data paths
Date:   Mon, 10 May 2021 23:18:50 -0500
Message-Id: <20210511041852.592295-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511041852.592295-1-bjorn.andersson@linaro.org>
References: <20210511041852.592295-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's typical for the bootloader to configure CTL_0 for the boot splash
or EFIFB, but for non-DSI use cases the DPU driver tend to pick another
CTL and the system might end up with two configured data paths producing
data on the same INTF - with resulting graphical artifacts.

Naturally the end goal would be to inherit the bootloader's
configuration and provide the user with a glitch free handover from the
boot configuration to a running DPU.
But such effort will affect clocks, regulators, power-domains etc, so in
the meantime this patch simply disables all INTFs and clear all
configured data paths, to avoid the graphical artifacts.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  4 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c     | 36 ++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h     |  8 +++++
 4 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 2d4645e01ebf..7aba27c1055a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -349,9 +349,13 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
 		DPU_REG_WRITE(c, CTL_LAYER_EXT(LM_0 + i), 0);
 		DPU_REG_WRITE(c, CTL_LAYER_EXT2(LM_0 + i), 0);
 		DPU_REG_WRITE(c, CTL_LAYER_EXT3(LM_0 + i), 0);
+
+		ctx->pending_flush_mask |= dpu_hw_ctl_get_bitmask_mixer(ctx, LM_0 + i);
 	}
 
 	DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
+
+	ctx->pending_flush_mask |= CTL_FLUSH_MASK_CTL;
 }
 
 static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 88e9cc38c13b..8b01cb660381 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -970,6 +970,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms->rm_init = true;
 
+	dpu_rm_clear_boot_config(&dpu_kms->rm, dpu_kms->catalog);
+
 	dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
 					     dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_mdp)) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index fd2d104f0a91..2cf47084482f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -4,6 +4,7 @@
  */
 
 #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
+#include <linux/delay.h>
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
@@ -229,6 +230,41 @@ int dpu_rm_init(struct dpu_rm *rm,
 	return rc ? rc : -EFAULT;
 }
 
+void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat)
+{
+	struct dpu_hw_intf *intf;
+	struct dpu_hw_ctl *ctl;
+	int i;
+
+	for (i = INTF_0; i < INTF_MAX; i++) {
+		if (!rm->intf_blks[i - INTF_0])
+			continue;
+
+		DPU_DEBUG("disabling intf%d timing engine\n", i - INTF_0);
+
+		intf = to_dpu_hw_intf(rm->intf_blks[i - INTF_0]);
+		intf->ops.enable_timing(intf, 0);
+	}
+
+	/*
+	 * Wait one frame for the INTF timing engine to stop, and then wait one
+	 * more frame, per the documentation.
+	 */
+	msleep(32);
+
+	for (i = CTL_0; i < CTL_MAX; i++) {
+		if (!rm->ctl_blks[i - CTL_0])
+			continue;
+
+		DPU_DEBUG("clearing ctl%d layer configuration\n", i - CTL_0);
+
+		ctl = to_dpu_hw_ctl(rm->ctl_blks[i - CTL_0]);
+		ctl->ops.clear_all_blendstages(ctl);
+		ctl->ops.trigger_flush(ctl);
+		ctl->ops.trigger_start(ctl);
+	}
+}
+
 static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
 {
 	return top->num_intf > 1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 1f12c8d5b8aa..53cd649614a3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -88,5 +88,13 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
+
+/**
+ * dpu_rm_clear_boot_config() - Tear down any data paths configured by boot
+ * @rm: DPU Resource Manger handle
+ * @cat: Pointer to hardware catalog
+ */
+void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat);
+
 #endif /* __DPU_RM_H__ */
 
-- 
2.29.2

