Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4997043453C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 08:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhJTGjr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 02:39:47 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:14992 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhJTGjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 02:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634711853; x=1666247853;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=r15w9F6DRx510ziNvsmmm1g8c0esESPNSy71ZWfyaYs=;
  b=akbjyzzIC8XZpbodcGMcotNF9Vy8fV6sm94s7tgVbI0Bh4LnXWxzvpG8
   6jIQZCyQxOavdf/FmIFTsAW0xeljySblFqVPSe56KfLXENL4B93UpwO9k
   kUffhrxNey51IZUP7bNMPfa/MxYvqnuGcMRYER/EzdH5hSr4SMuaT7fog
   M=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 19 Oct 2021 23:37:32 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 23:37:32 -0700
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 19 Oct 2021 23:37:27 -0700
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "Vinod Koul" <vkoul@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Matthias Kaehlcke" <mka@chromium.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: [PATCH] phy: qcom-snps: Correct the FSEL_MASK
Date:   Wed, 20 Oct 2021 12:06:25 +0530
Message-ID: <1634711785-25351-1-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The FSEL_MASK which selects the refclock is defined incorrectly.
It should be [4:6] not [5:7]. Due to this incorrect definition, the BIT(7)
in USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1 is reset which keeps PHY analog
blocks ON during suspend.
Fix this issue by correctly defining the FSEL_MASK.

Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index ae4bac0..28459a1 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -33,7 +34,7 @@
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
 #define RETENABLEN				BIT(3)
-#define FSEL_MASK				GENMASK(7, 5)
+#define FSEL_MASK				GENMASK(6, 4)
 #define FSEL_DEFAULT				(0x3 << 4)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
-- 
2.7.4

