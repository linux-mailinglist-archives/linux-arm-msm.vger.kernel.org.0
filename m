Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A32C12941D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 11:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfLWKT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 05:19:56 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:52868 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726090AbfLWKT4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 05:19:56 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Dec 2019 15:49:52 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg01-blr.qualcomm.com with ESMTP; 23 Dec 2019 15:49:30 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id CFC792737; Mon, 23 Dec 2019 15:49:28 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: [v1] drm/msm: update LANE_CTRL register value from default value
Date:   Mon, 23 Dec 2019 15:49:21 +0530
Message-Id: <1577096361-8381-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Updating REG_DSI_LANE_CTRL register value by reading default
register value and writing it back using bitwise OR with
DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST. This works for all panels.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e6289a3..d3c5233 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -816,7 +816,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 	u32 flags = msm_host->mode_flags;
 	enum mipi_dsi_pixel_format mipi_fmt = msm_host->format;
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
-	u32 data = 0;
+	u32 data = 0, lane_ctrl = 0;
 
 	if (!enable) {
 		dsi_write(msm_host, REG_DSI_CTRL, 0);
@@ -904,9 +904,11 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 	dsi_write(msm_host, REG_DSI_LANE_SWAP_CTRL,
 		  DSI_LANE_SWAP_CTRL_DLN_SWAP_SEL(msm_host->dlane_swap));
 
-	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
+	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
+		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
 		dsi_write(msm_host, REG_DSI_LANE_CTRL,
-			DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
+			lane_ctrl | DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
+	}
 
 	data |= DSI_CTRL_ENABLE;
 
-- 
2.7.4

