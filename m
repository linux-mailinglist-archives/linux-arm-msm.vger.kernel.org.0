Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E171A354C19
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 07:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243638AbhDFFK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 01:10:28 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26087 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242497AbhDFFK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 01:10:27 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 22:10:21 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Apr 2021 22:10:19 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 10:40:11 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 4FFEE21B31; Tue,  6 Apr 2021 10:40:10 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        kalyan_t@codeaurora.org, dianders@chromium.org
Subject: [PATCH v1 4/4] drm/msm/disp/dpu1: enable DATA_HCTL_EN for sc7280 target
Date:   Tue,  6 Apr 2021 10:39:52 +0530
Message-Id: <1617685792-14376-5-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
References: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The reset value of INTF_CONFIG2 register is changed
for SC7280 family. Changes are added to program
this register correctly based on the target.

DATA_HCTL_EN in INTF_CONFIG2 register allows data
to be transferred at a different rate than video
timing. When this is set, the number of data per
line follows DISPLAY_DATA_HCTL register value.
This change adds support to program these
registers for sc7280 target.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 6f0f545..899f28d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -31,6 +31,8 @@
 #define INTF_TEST_CTL                   0x054
 #define INTF_TP_COLOR0                  0x058
 #define INTF_TP_COLOR1                  0x05C
+#define INTF_CONFIG2                    0x060
+#define INTF_DISPLAY_DATA_HCTL          0x064
 #define INTF_FRAME_LINE_COUNT_EN        0x0A8
 #define INTF_FRAME_COUNT                0x0AC
 #define   INTF_LINE_COUNT               0x0B0
@@ -93,7 +95,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	u32 active_hctl, display_hctl, hsync_ctl;
 	u32 polarity_ctl, den_polarity, hsync_polarity, vsync_polarity;
 	u32 panel_format;
-	u32 intf_cfg;
+	u32 intf_cfg, intf_cfg2 = 0, display_data_hctl = 0;
 
 	/* read interface_cfg */
 	intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
@@ -178,6 +180,13 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 				(COLOR_8BIT << 4) |
 				(0x21 << 8));
 
+	if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
+		intf_cfg2 |= BIT(4);
+		display_data_hctl = display_hctl;
+		DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
+		DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
+	}
+
 	DPU_REG_WRITE(c, INTF_HSYNC_CTL, hsync_ctl);
 	DPU_REG_WRITE(c, INTF_VSYNC_PERIOD_F0, vsync_period * hsync_period);
 	DPU_REG_WRITE(c, INTF_VSYNC_PULSE_WIDTH_F0,
-- 
2.7.4

