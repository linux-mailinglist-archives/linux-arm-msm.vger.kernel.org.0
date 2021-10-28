Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE70043D902
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 03:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhJ1B6S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 21:58:18 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33421 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbhJ1B6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 21:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635386152; x=1666922152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=PumI7KYEnaLZedKWySsRxRR6/fjZlsD1mJD7/WiWdxk=;
  b=EHI+cn+z/irtcvFviIO/Tc3ad48fi4wBX/LKI9Gxz3cgD572pnjDob0f
   Ma0LwolewMjARj+C2eGUz/6ceY7hmUmaLIPME7kTYqu58AVLiXNFADJAH
   oHiZN0h2vdBrGyHej+hq1c6lUcHXQ2Irmf/MyDnR+dJNEbyr6oX/X1F6k
   4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 27 Oct 2021 18:55:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 18:55:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 27 Oct 2021 18:55:51 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 27 Oct 2021 18:55:46 -0700
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <kalyan_t@codeaurora.org>,
        <abhinavk@codeaurora.org>, <dianders@chromium.org>,
        <khsieh@codeaurora.org>, <mkrishn@codeaurora.org>,
        <sbillaka@codeaurora.org>
Subject: [PATCH v3 6/6] drm/msm/dp: Remove the hpd init delay for eDP
Date:   Thu, 28 Oct 2021 07:24:48 +0530
Message-ID: <1635386088-18089-7-git-send-email-quic_sbillaka@quicinc.com>
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

DP driver needs a 10 second delay before phy_init so that
the usb combo phy initializes and sets up the necessary
clocks for usb devices such as keyboard and mouse.

eDP controller uses a standalone phy and need not wait for
phy initialization from any other component. This change
will remove the delay for eDP controller.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 61385d6..de6a1fd 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1430,6 +1430,7 @@ void __exit msm_dp_unregister(void)
 void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 {
 	struct dp_display_private *dp;
+	u8 delay;
 
 	if (!dp_display)
 		return;
@@ -1438,7 +1439,15 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 
 	dp_hpd_event_setup(dp);
 
-	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
+	if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP) {
+		/* eDP does not need any delay before phy init */
+		delay = 0;
+	} else {
+		/* DP needs 10 second delay to let usb combo phy initialize */
+		delay = 100;
+	}
+
+	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, delay);
 }
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
-- 
2.7.4

