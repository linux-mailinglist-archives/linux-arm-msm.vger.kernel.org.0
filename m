Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84CC943D8FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 03:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhJ1B6E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 21:58:04 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:35090 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbhJ1B6E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 21:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635386138; x=1666922138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ZF1/1qhmIp3g86UTXX3h3Puh9hFYHW37oCxJLoFZmug=;
  b=u5oL79UrjqctlBpzgKQTdNovVCqgGiSw/41TIrvL5FZWwjcz40nsmpHK
   BNvAVkm2Y/p6njWZck6m0KlO1dmkP60vMY3wNuIzyctpdaRWxbK35aCi0
   LZX+OlHiIW5f974ew8nbchcjfl5lE5+cgskUKTyc+KbTLyQ9Rn5YF01LB
   s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 27 Oct 2021 18:55:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 18:55:37 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 27 Oct 2021 18:55:36 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 27 Oct 2021 18:55:32 -0700
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <kalyan_t@codeaurora.org>,
        <abhinavk@codeaurora.org>, <dianders@chromium.org>,
        <khsieh@codeaurora.org>, <mkrishn@codeaurora.org>,
        <sbillaka@codeaurora.org>
Subject: [PATCH v3 4/6] drm/msm/dp: Enable downspread for supported DP sinks
Date:   Thu, 28 Oct 2021 07:24:46 +0530
Message-ID: <1635386088-18089-5-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
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

