Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 520CC4B066A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 07:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbiBJGiQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 01:38:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235355AbiBJGiK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 01:38:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0AF7E33
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 22:38:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7B7D2614A5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 06:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD0BC004E1;
        Thu, 10 Feb 2022 06:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644475090;
        bh=s77zX8tlQZGtLkt3yoLZJ4/EQEAGs6BTpnX/BQtdbYo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AiWkr2NAXXsn7wOEPV1PRRCePesHRutm00ZVMBp53LL3y2BVhLIrkfuRvRb2N2CwL
         +E/2oFqkP/Y6KRcuc6mEgWfAWq/MXlnph4zmVYvEwnQLHiFy0A+bU4yjfS2GvjpytM
         kn9f9+BN4gEqwUeHHDqNKtQa61sbrQrpo+Hii6hdZHjYlnYb7zd7Nz3waI3GVuyGqA
         kuz2Zo1f/csKL0Sj1qM/I9K24Qt1jesoogmhTp8MWQa+zviGnkQoNwfiuZD3B0W+Ns
         sXznt1verJc+3ZpFl+V/l+tJUt7hBfRrIWay0G6l/RWucDHqhCvT2Q0QfLA2jeX2Su
         SCblY9xAG206g==
From:   Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 06/13] drm/msm/disp/dpu1: Add DSC support in hw_ctl
Date:   Thu, 10 Feb 2022 12:07:32 +0530
Message-Id: <20220210063739.233634-7-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210063739.233634-1-vkoul@kernel.org>
References: <20220210063739.233634-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Later gens of hardware have DSC bits moved to hw_ctl, so configure these
bits so that DSC would work there as well

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 11 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 02da9ecf71f1..49659165cea8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -25,6 +25,8 @@
 #define   CTL_MERGE_3D_ACTIVE           0x0E4
 #define   CTL_INTF_ACTIVE               0x0F4
 #define   CTL_MERGE_3D_FLUSH            0x100
+#define   CTL_DSC_ACTIVE                0x0E8
+#define   CTL_DSC_FLUSH                0x104
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
@@ -34,6 +36,7 @@
 
 #define DPU_REG_RESET_TIMEOUT_US        2000
 #define  MERGE_3D_IDX   23
+#define  DSC_IDX        22
 #define  INTF_IDX       31
 #define CTL_INVALID_BIT                 0xffff
 #define CTL_DEFAULT_GROUP_ID		0xf
@@ -121,7 +124,6 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
 
 static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 {
-
 	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
 		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
 				ctx->pending_merge_3d_flush_mask);
@@ -506,6 +508,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
 		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
 
+	if (cfg->dsc)
+		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
+
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
 		mode_sel |= BIT(17);
 
@@ -517,6 +522,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (cfg->merge_3d)
 		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
 			      BIT(cfg->merge_3d - MERGE_3D_0));
+	if (cfg->dsc) {
+		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, cfg->dsc);
+		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
+	}
 }
 
 static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 806c171e5df2..9847c9c46d6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -40,6 +40,7 @@ struct dpu_hw_stage_cfg {
  * @merge_3d:              3d merge block used
  * @intf_mode_sel:         Interface mode, cmd / vid
  * @stream_sel:            Stream selection for multi-stream interfaces
+ * @dsc:                   DSC BIT masks
  */
 struct dpu_hw_intf_cfg {
 	enum dpu_intf intf;
@@ -47,6 +48,7 @@ struct dpu_hw_intf_cfg {
 	enum dpu_merge_3d merge_3d;
 	enum dpu_ctl_mode_sel intf_mode_sel;
 	int stream_sel;
+	unsigned int dsc;
 };
 
 /**
-- 
2.31.1

