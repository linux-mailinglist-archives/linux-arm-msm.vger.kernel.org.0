Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E65A295F90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 15:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899441AbgJVNRO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 09:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899437AbgJVNRO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 09:17:14 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728FEC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 06:17:12 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 77so2234519lfl.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iik7NuEvFJru4BTIjZ31fu0Ns9B171zjeLUtO1FCToQ=;
        b=bEsGSZfbrZ/9KjznpX8x1bB+ZNt4qTY9FvGm1izajVybQg7kAc266CO/fbqn0k87Od
         wnn70CHFPFzafc03LwNyxzgye6WAp6sI6N0YUIvv5OgD+AVFq/Hl2oZoO3o9P9+2nj7g
         Y7n+J5cZKk+8BvtuqnMyEHlkOIFycz9E56S9LGOxvdxW9iLO1eSB3iZBQSDPWSNe/fwW
         lwvvZBpsBU/sIR6fUP7CYZYeJN1Pl9pELP/R+mnR+GuHlDRphlAeX06zU3XGN+f3zLJh
         ank92L2TdKL8DhINm+Lyh1V2UTRcqxNeSSWC8rCoKESzgfeuyw4/7UGLUbX/Jpmtv+LG
         AR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iik7NuEvFJru4BTIjZ31fu0Ns9B171zjeLUtO1FCToQ=;
        b=aq35+bvUOslLuqyvAWrv2FTZMSi0Bw7RaXvq/ujZo0hDjgRsG/hZqQhDGFhVaYN/vA
         T4/fttCv0HTGcWhf2DLnslcuOumXotiytlbuLNmulu9FZoVi3MpTRV6+dG11JNImkuQ+
         g+AzfkMP8fxniq5GwXFNN7UcJ50xKNMblhmaeW+I9LnX3AQbIaBYcRW632JjstCToEoN
         OSFxIOwRwNFpAoWvsBnNx3BzHmMHcMndYTwJgof6xn/bJoV1lD1KBHKBYvTrTTOIOjoJ
         1P4qPuIuXjP7Z9BAL/tXYasTpK41eUiN4UQKqmw+JwMPAavRyXczA2cPvFBTxBhMlj5y
         rjwQ==
X-Gm-Message-State: AOAM531fAunxDNY4VbaBn3JH6StwV2+ip+SI3HZ6hbY0xD3kJxMWvY/Z
        0FKfJId/ezYgnV+hCgGOTpKn6w==
X-Google-Smtp-Source: ABdhPJx4QqNAuSP1FOLBV9jiSBwv6plHuWLbADeWfX0dJL2/T5QXPkrO6rwx8YVaObYg6ZTZdJ0JZg==
X-Received: by 2002:a19:cb94:: with SMTP id b142mr787202lfg.388.1603372630902;
        Thu, 22 Oct 2020 06:17:10 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id j10sm308514ljb.93.2020.10.22.06.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:17:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/5] drm/msm/dpu: handle merge_3d configuration in hw_ctl block
Date:   Thu, 22 Oct 2020 16:16:56 +0300
Message-Id: <20201022131658.181363-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
References: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Active HW CTL blocks need separate handling for merge_3d flushes.
Implement necessary merge_3d configuration and flushing.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 16 ++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index f61b545d7257..8981cfa9dbc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -22,7 +22,9 @@
 #define   CTL_PREPARE                   0x0d0
 #define   CTL_SW_RESET                  0x030
 #define   CTL_LAYER_EXTN_OFFSET         0x40
+#define   CTL_MERGE_3D_ACTIVE           0x0E4
 #define   CTL_INTF_ACTIVE               0x0F4
+#define   CTL_MERGE_3D_FLUSH            0x100
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_INTF_MASTER               0x134
 
@@ -30,6 +32,7 @@
 #define CTL_FLUSH_MASK_CTL              BIT(17)
 
 #define DPU_REG_RESET_TIMEOUT_US        2000
+#define  MERGE_3D_IDX   23
 #define  INTF_IDX       31
 
 static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
@@ -112,6 +115,9 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
 static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 {
 
+	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
+		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
+				ctx->pending_merge_3d_flush_mask);
 	if (ctx->pending_flush_mask & BIT(INTF_IDX))
 		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
 				ctx->pending_intf_flush_mask);
@@ -242,6 +248,13 @@ static void dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
 	ctx->pending_flush_mask |= BIT(INTF_IDX);
 }
 
+static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
+		enum dpu_merge_3d merge_3d)
+{
+	ctx->pending_merge_3d_flush_mask |= BIT(merge_3d - MERGE_3D_0);
+	ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
+}
+
 static uint32_t dpu_hw_ctl_get_bitmask_dspp(struct dpu_hw_ctl *ctx,
 	enum dpu_dspp dspp)
 {
@@ -483,6 +496,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
 	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
+	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, BIT(cfg->merge_3d - MERGE_3D_0));
 }
 
 static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
@@ -523,6 +537,8 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
 		ops->update_pending_flush_intf =
 			dpu_hw_ctl_update_pending_flush_intf_v1;
+		ops->update_pending_flush_merge_3d =
+			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
 	} else {
 		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
 		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 73378fcba2d1..e93a42ab60b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -37,12 +37,14 @@ struct dpu_hw_stage_cfg {
  * struct dpu_hw_intf_cfg :Describes how the DPU writes data to output interface
  * @intf :                 Interface id
  * @mode_3d:               3d mux configuration
+ * @merge_3d:              3d merge block used
  * @intf_mode_sel:         Interface mode, cmd / vid
  * @stream_sel:            Stream selection for multi-stream interfaces
  */
 struct dpu_hw_intf_cfg {
 	enum dpu_intf intf;
 	enum dpu_3d_blend_mode mode_3d;
+	enum dpu_merge_3d merge_3d;
 	enum dpu_ctl_mode_sel intf_mode_sel;
 	int stream_sel;
 };
@@ -99,6 +101,15 @@ struct dpu_hw_ctl_ops {
 	void (*update_pending_flush_intf)(struct dpu_hw_ctl *ctx,
 		enum dpu_intf blk);
 
+	/**
+	 * OR in the given flushbits to the cached pending_(merge_3d_)flush_mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 * @blk       : interface block index
+	 */
+	void (*update_pending_flush_merge_3d)(struct dpu_hw_ctl *ctx,
+		enum dpu_merge_3d blk);
+
 	/**
 	 * Write the value of the pending_flush_mask to hardware
 	 * @ctx       : ctl path ctx pointer
@@ -181,6 +192,7 @@ struct dpu_hw_ctl {
 	const struct dpu_lm_cfg *mixer_hw_caps;
 	u32 pending_flush_mask;
 	u32 pending_intf_flush_mask;
+	u32 pending_merge_3d_flush_mask;
 
 	/* ops */
 	struct dpu_hw_ctl_ops ops;
-- 
2.28.0

