Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6885F354C78
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 08:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbhDFGCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 02:02:11 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:13061 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243911AbhDFGCL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 02:02:11 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 23:02:04 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Apr 2021 23:02:02 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 11:31:41 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 710EA21B38; Tue,  6 Apr 2021 11:31:40 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        kalyan_t@codeaurora.org, dianders@chromium.org
Subject: [PATCH v1 2/3] drm/msm/disp/dpu1: add vsync and underrun irqs for INTF_5
Date:   Tue,  6 Apr 2021 11:31:34 +0530
Message-Id: <1617688895-26275-3-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
References: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

INTF_5 is used by EDP panel in SC7280 target. Add vsync
and underrun irqs needed by INTF_5 to dpu irq map.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 72cdaf8..a37928b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -69,10 +69,12 @@
 #define DPU_INTR_INTF_1_UNDERRUN BIT(26)
 #define DPU_INTR_INTF_2_UNDERRUN BIT(28)
 #define DPU_INTR_INTF_3_UNDERRUN BIT(30)
+#define DPU_INTR_INTF_5_UNDERRUN BIT(22)
 #define DPU_INTR_INTF_0_VSYNC BIT(25)
 #define DPU_INTR_INTF_1_VSYNC BIT(27)
 #define DPU_INTR_INTF_2_VSYNC BIT(29)
 #define DPU_INTR_INTF_3_VSYNC BIT(31)
+#define DPU_INTR_INTF_5_VSYNC BIT(23)
 
 /**
  * Pingpong Secondary interrupt status bit definitions
@@ -308,7 +310,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_2, DPU_INTR_INTF_2_VSYNC, 0},
 	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_3, DPU_INTR_INTF_3_UNDERRUN, 0},
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_3, DPU_INTR_INTF_3_VSYNC, 0},
-	/* irq_idx:32-63 */
+	/* irq_idx:32-33 */
+	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_5, DPU_INTR_INTF_5_UNDERRUN, 0},
+	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_5, DPU_INTR_INTF_5_VSYNC, 0},
+	/* irq_idx:34-63 */
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-- 
2.7.4

