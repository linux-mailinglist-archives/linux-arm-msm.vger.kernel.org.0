Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6A2209ED5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 14:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404707AbgFYMqY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 08:46:24 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:64131 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404684AbgFYMqY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 08:46:24 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 25 Jun 2020 05:46:23 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Jun 2020 05:46:22 -0700
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 Jun 2020 18:15:55 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id EE3B23A43; Thu, 25 Jun 2020 18:15:54 +0530 (IST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, mkrishn@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org, swboyd@chromium.org
Subject: [v1] drm/msm/dpu: enumerate second cursor pipe for external interface
Date:   Thu, 25 Jun 2020 18:15:53 +0530
Message-Id: <1593089153-17811-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Setup an RGB HW pipe as cursor which can be used on
secondary interface.

For SC7180 2 HW pipes are enumerated as cursors
1 - primary interface
2 - secondary interface

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 8f2357d..23061fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -117,10 +117,10 @@
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
 		.reg_off = 0x2AC, .bit_off = 8},
-	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
-		.reg_off = 0x2B4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
-		.reg_off = 0x2BC, .bit_off = 8},
+		.reg_off = 0x2B4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+		.reg_off = 0x2C4, .bit_off = 8},
 	},
 };
 
@@ -272,10 +272,10 @@
 		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
-		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
 /*************************************************************
-- 
1.9.1

