Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF8443D8FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 03:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhJ1B54 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 21:57:56 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:50010 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229703AbhJ1B54 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 21:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635386130; x=1666922130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=e6BovwE7mtBe8nBM3DNZlyFYaKk0sA6tsi4+wUSC8HA=;
  b=D6waxV1ADwizAt2jgnZbegqms/W+5vBt8hR83XAO1L12RgXlTVeEO0Oi
   0XBwkNZPHiU4G+g4Up2Py9cw0u2AzE7YNnxEAWktLu8sAR94C66e7WxB7
   xZSKvX6sMo9WKCAdzXe8U9PUwmHuQwV8Wu9YH/Zmc8Wwc7ks3AvcPVT5d
   s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Oct 2021 18:55:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 18:55:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 27 Oct 2021 18:55:29 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 27 Oct 2021 18:55:25 -0700
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <kalyan_t@codeaurora.org>,
        <abhinavk@codeaurora.org>, <dianders@chromium.org>,
        <khsieh@codeaurora.org>, <mkrishn@codeaurora.org>,
        <sbillaka@codeaurora.org>
Subject: [PATCH v3 3/6] drm/dp: Add macro to check max_downspread capability
Date:   Thu, 28 Oct 2021 07:24:45 +0530
Message-ID: <1635386088-18089-4-git-send-email-quic_sbillaka@quicinc.com>
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

Add a macro to check for the max_downspread capability in
drm_dp_helper.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 include/drm/drm_dp_helper.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index afdf7f4..b39e7a0 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1784,6 +1784,12 @@ drm_dp_tps3_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 }
 
 static inline bool
+drm_dp_max_downspread(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	return dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5;
+}
+
+static inline bool
 drm_dp_tps4_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	return dpcd[DP_DPCD_REV] >= 0x14 &&
-- 
2.7.4

