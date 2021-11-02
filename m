Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB3C4428DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 08:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhKBHwP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 03:52:15 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:22041 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhKBHwN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 03:52:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635839379; x=1667375379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=AWTdx2EZouh0gHMvjWw1/uRvb545e3cgcuI7V+n9txE=;
  b=Q2xiqRhKfoDroCXt55FzCb9VKTV9PHdBA1yA9IMYFsiv0h4rBTu/JmRQ
   SwQmtfdmRm08LgEhw9kODiR9w2GTS5lwNm3MpJWG20B90oZPVxL9PKhaa
   TkqHmOomwtRAA1ztocLDa1HeeawO5qXy7uJzah8P76BXhpxI9VovCskLq
   s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 02 Nov 2021 00:49:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 00:49:37 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 2 Nov 2021 00:49:37 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 2 Nov 2021 00:49:32 -0700
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_kalyant@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <dianders@chromium.org>,
        <quic_khsieh@quicinc.com>, <quic_mkrishn@quicinc.com>
Subject: [PATCH v4 4/5] drm/msm/dp: Enable downspread for supported DP sinks
Date:   Tue, 2 Nov 2021 13:18:44 +0530
Message-ID: <1635839325-401-5-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635839325-401-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1635839325-401-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc7280 eDP sink that supports downspread will fail link training
if source does not enable SSC / downspread. This change will set the
downspread bit in the DP sink if supported and indicate SSC support
to the DP PHY driver.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 62e75dc..a40e798 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1228,7 +1228,9 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 			int *training_step)
 {
 	int ret = 0;
+	const u8 *dpcd = ctrl->panel->dpcd;
 	u8 encoding = DP_SET_ANSI_8B10B;
+	u8 ssc;
 	struct dp_link_info link_info = {0};
 
 	dp_ctrl_config_ctrl(ctrl);
@@ -1238,6 +1240,12 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 	link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
 
 	dp_aux_link_configure(ctrl->aux, &link_info);
+
+	if (drm_dp_max_downspread(dpcd)) {
+		ssc = DP_SPREAD_AMP_0_5;
+		drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
+	}
+
 	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
 				&encoding, 1);
 
@@ -1312,9 +1320,11 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	struct dp_io *dp_io = &ctrl->parser->io;
 	struct phy *phy = dp_io->phy;
 	struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
+	const u8 *dpcd = ctrl->panel->dpcd;
 
 	opts_dp->lanes = ctrl->link->link_params.num_lanes;
 	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
+	opts_dp->ssc = drm_dp_max_downspread(dpcd);
 	dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
 					ctrl->link->link_params.rate * 1000);
 
@@ -1406,7 +1416,7 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
 
 static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
 {
-	u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = ctrl->panel->dpcd;
 
 	/*
 	 * For better interop experience, used a fixed NVID=0x8000
-- 
2.7.4

