Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5026E4E71E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 12:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354556AbiCYLIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 07:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355346AbiCYLIM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 07:08:12 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EEE3C74B5;
        Fri, 25 Mar 2022 04:06:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id DBB5ACE2919;
        Fri, 25 Mar 2022 11:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9705C340E9;
        Fri, 25 Mar 2022 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648206395;
        bh=m/6EJtLxjqhU2vq9oknZNl1dRXckwQMpENmIiO2OTUw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m4KKGMZmZEcMMZ6u+pHkjKrY+14udCO5SpWyFa8o0mek7ozseXsqLYlUCQKhMoihQ
         F4DxIvlLc++Zny+ldbNjds14lFm9C1W05UHaRkWKzUtxYoEs1XvlIIMHHLRKmOkx6d
         +RWdEmZMDvWB96m/7vVitI9u2sfQoIopxyR9Qmss6W+hYMCMdUP6yVZ2pfW6ldfIMK
         LS51B/FwbxPoq5n3qHl3BY+DK7g566m/dZKHYSNzzNrDiXFyd4BDTrWBdumaeSG8BZ
         vI7zEvMNozGvqyC/l2PnZqaS0SA6rckH1OFU4g+CiPu8xfx6Zc7S2Jll3pJubdvF+s
         9h408fmGUupvA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 06/13] drm/msm/disp/dpu1: Add DSC support in hw_ctl
Date:   Fri, 25 Mar 2022 16:35:49 +0530
Message-Id: <20220325110556.275490-7-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325110556.275490-1-vkoul@kernel.org>
References: <20220325110556.275490-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Later gens of hardware have DSC bits moved to hw_ctl, so configure these
bits so that DSC would work there as well

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 11 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 02da9ecf71f1..cba94aa9fdcc 100644
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
+		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
+		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
+	}
 }
 
 static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 806c171e5df2..75db89f66abd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -40,6 +40,7 @@ struct dpu_hw_stage_cfg {
  * @merge_3d:              3d merge block used
  * @intf_mode_sel:         Interface mode, cmd / vid
  * @stream_sel:            Stream selection for multi-stream interfaces
+ * @dsc:                   DSC BIT masks used
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
2.34.1

