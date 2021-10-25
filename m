Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8021D438E0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 06:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhJYEWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 00:22:45 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:41381 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhJYEWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 00:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635135623; x=1666671623;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=X7bAkQfz6aT4/715bzVhw0pglrEtN8FLQnyZrTVFNdU=;
  b=GsQUwD+ka644G4LLLLTj8ootb0+CBTsyG0rxaTXlv0wCUaAd3UP4ti5l
   wY02psWHtg17oqJnWBsklpJ3jDBnODtmwXx/pOXQM/nFtAmPTNQUhSjtg
   pyFH4rPq3+eCdFiVrG0uislI/eYXWxmdZuPt12BHGQkthjxuJSC/n06i5
   I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Oct 2021 21:20:23 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2021 21:20:22 -0700
Received: from c-sanm-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Sun, 24 Oct 2021 21:20:17 -0700
From:   Sandeep Maheswaram <quic_c_sanm@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "Vinod Koul" <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_ppratap@quicinc.com>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Subject: [PATCH v2] phy: qcom-snps: Correct the FSEL_MASK
Date:   Mon, 25 Oct 2021 09:49:35 +0530
Message-ID: <1635135575-5668-1-git-send-email-quic_c_sanm@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The FSEL_MASK which selects the refclock is defined incorrectly.
It should be [4:6] not [5:7]. Due to this incorrect definition, the BIT(7)
in USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0 is reset which keeps PHY analog
blocks ON during suspend.
Fix this issue by correctly defining the FSEL_MASK.

Fixes: 51e8114f80d0 (phy: qcom-snps: Add SNPS USB PHY driver for
QCOM based SOCs)
Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
---
v2:
Corrected the register name COMMON1 > COMMMON0 in commit description.
Added Fixes tag.
Dropped copyright line.

 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index ae4bac0..7e61202 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -33,7 +33,7 @@
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
 #define RETENABLEN				BIT(3)
-#define FSEL_MASK				GENMASK(7, 5)
+#define FSEL_MASK				GENMASK(6, 4)
 #define FSEL_DEFAULT				(0x3 << 4)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
-- 
2.7.4

