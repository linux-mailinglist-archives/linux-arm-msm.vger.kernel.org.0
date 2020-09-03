Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3E125B899
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 04:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgICCLB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 22:11:01 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40298 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726177AbgICCLA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 22:11:00 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 790F9F5CD3355550B11D;
        Thu,  3 Sep 2020 10:10:58 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Sep 2020
 10:10:47 +0800
From:   Ye Bin <yebin10@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     Ye Bin <yebin10@huawei.com>
Subject: [PATCH] phy: qualcomm: Delete duplicated argument to '|' in qcom_ipq806x_usb_hs_phy_init
Date:   Thu, 3 Sep 2020 10:10:20 +0800
Message-ID: <20200903021020.312966-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In qcom_ipq806x_usb_hs_phy_init when calculate val HSUSB_CTRL_DPSEHV_CLAMP is
duplicated.

Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index 9061ece7ff6a..bfff0c8c9130 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -276,8 +276,8 @@ static int qcom_ipq806x_usb_hs_phy_init(struct phy *phy)
 	val = HSUSB_CTRL_DPSEHV_CLAMP | HSUSB_CTRL_DMSEHV_CLAMP |
 		HSUSB_CTRL_RETENABLEN  | HSUSB_CTRL_COMMONONN |
 		HSUSB_CTRL_OTGSESSVLD_CLAMP | HSUSB_CTRL_ID_HV_CLAMP |
-		HSUSB_CTRL_DPSEHV_CLAMP | HSUSB_CTRL_UTMI_OTG_VBUS_VALID |
-		HSUSB_CTRL_UTMI_CLK_EN | HSUSB_CTRL_CLAMP_EN | 0x70;
+		HSUSB_CTRL_UTMI_OTG_VBUS_VALID | HSUSB_CTRL_UTMI_CLK_EN |
+		HSUSB_CTRL_CLAMP_EN | 0x70;
 
 	/* use core clock if external reference is not present */
 	if (!phy_dwc3->xo_clk)
-- 
2.25.4

