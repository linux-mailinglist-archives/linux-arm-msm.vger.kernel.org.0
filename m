Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0B04428DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 08:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhKBHwS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 03:52:18 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:22864 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231303AbhKBHwR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 03:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635839383; x=1667375383;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=XbITvdzhfLjyb4CX1ZOFhT1UhZy0Ds5/2mi6MtUV/uo=;
  b=QWWjNg1J7XEvQn/95n5ozp8hqYVplkOL3nnb7WtlsINWB0QeVrckl1lo
   g9l950PryXurhOBZLUwKhftUGNRjDhh6gjTP+wzZRpokr2pf+1GWyZ1tg
   c4CatmGkGsD+TUf07o68XUI7/XqdS/ArmjWpNmpWe9XOk1rQ0JKgxghhi
   w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Nov 2021 00:49:43 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 00:49:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 2 Nov 2021 00:49:42 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 2 Nov 2021 00:49:38 -0700
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_kalyant@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <dianders@chromium.org>,
        <quic_khsieh@quicinc.com>, <quic_mkrishn@quicinc.com>
Subject: [PATCH v4 5/5] drm/msm/dp: Enable ASSR for supported DP sinks
Date:   Tue, 2 Nov 2021 13:18:45 +0530
Message-ID: <1635839325-401-6-git-send-email-quic_sbillaka@quicinc.com>
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

The eDP sink on sc7280 supports ASSR and dp driver will
enable ASSR in the source hardware. The driver needs to
enable the ASSR field in the DPCD configuration register
to avoid screen corruption. This change will enable ASSR
if supported in the sink device.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a40e798..c724cb0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -119,13 +119,13 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
 static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 {
 	u32 config = 0, tbd;
-	u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = ctrl->panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
 
 	/* Scrambler reset enable */
-	if (dpcd[DP_EDP_CONFIGURATION_CAP] & DP_ALTERNATE_SCRAMBLER_RESET_CAP)
+	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
 		config |= DP_CONFIGURATION_CTRL_ASSR;
 
 	tbd = dp_link_get_test_bits_depth(ctrl->link,
@@ -1231,6 +1231,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 	const u8 *dpcd = ctrl->panel->dpcd;
 	u8 encoding = DP_SET_ANSI_8B10B;
 	u8 ssc;
+	u8 assr;
 	struct dp_link_info link_info = {0};
 
 	dp_ctrl_config_ctrl(ctrl);
@@ -1249,6 +1250,12 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
 				&encoding, 1);
 
+	if (drm_dp_alternate_scrambler_reset_cap(dpcd)) {
+		assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
+		drm_dp_dpcd_write(ctrl->aux, DP_EDP_CONFIGURATION_SET,
+				&assr, 1);
+	}
+
 	ret = dp_ctrl_link_train_1(ctrl, training_step);
 	if (ret) {
 		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
-- 
2.7.4

