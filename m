Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 675EBE96EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 07:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfJ3G7z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 02:59:55 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:46096 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726747AbfJ3G7z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 02:59:55 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Oct 2019 12:29:48 +0530
IronPort-SDR: z+I+lYe/AiEcrti9DWZZH5ELrF/JHTgbaHODyZWNigU6ES8taWwcy5qmyLjwGa9oFUlrZkDOol
 de7Bsn5btYC4WYJQNI2sKrQoNYoYw8Kz6q5j1dozC2LPMqnEgvDtqGQ9pU/n2o36eEfKIVc+rw
 7lxGjrWyYoAILF0L0LvANnQ1O3K6joB/qoDhQpXDpBCpuDSIRTruMX93raPRhVc4OqwH0Q3LLw
 3eRAOpGqOEo2IutY9nxRsGs8MZBYC25jkIDJIjte9S/arlGCrr9vWp/J9tohUks8dUhrg8ZnbH
 kUc1ttHu4AH5kwNETftKR3XJ
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 30 Oct 2019 12:29:35 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 9AC6519C1; Wed, 30 Oct 2019 12:29:34 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 1/2] phy: qcom-qmp: Add QMP V3 USB3 PHY support for SC7180
Date:   Wed, 30 Oct 2019 12:25:43 +0530
Message-Id: <1572418544-11593-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572418544-11593-1-git-send-email-sanm@codeaurora.org>
References: <1572418544-11593-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding QMP v3 USB3 phy support for SC7180.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 091e203..52275c5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -2118,6 +2118,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8150-qmp-ufs-phy",
 		.data = &sm8150_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sc7180-qmp-usb3-phy",
+		.data = &qmp_v3_usb3phy_cfg,
 	},
 	{ },
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

