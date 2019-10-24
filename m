Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60CBCE332B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 14:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502219AbfJXMzx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 08:55:53 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:41967 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730113AbfJXMzw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 08:55:52 -0400
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Oct 2019 08:55:48 EDT
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Oct 2019 18:19:41 +0530
IronPort-SDR: 3IE2j7VUeGIlqshMj7VkSaX6P3G2X98TlbohiGWYkiWmrEpGvohU1e8dUWp26B7b6GdE2qRDq3
 qO+3SR26dDyw8Fx/PNuAT+89bMR0Hmd0HwGDRxw9lEDkeZ1IV/uYGS7JiOjuYzg7kmWr9DFV5s
 ZijZ2MzoGZcQKqxNJSnRFAbsXbNA7v5+7EzVqtXfcfutEjL0GxobIghbaF6c9hc10zfHbsqrIT
 Ni1MExyg4BNb+47q/daYp7YosG0RcIqfF7BvAwWfVNgAlk2ekkoOa+r6lpy0bOdCKbP5jVWdRZ
 Uk8OQSEzAX3l4JzahsfHroU+
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Oct 2019 18:19:26 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id BA7C01941; Thu, 24 Oct 2019 18:19:25 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     agross@kernel.org, balbi@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, mgautam@codeaurora.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 1/2] usb: dwc3: Add support for SC7180 SOC
Date:   Thu, 24 Oct 2019 18:18:47 +0530
Message-Id: <1571921328-13898-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571921328-13898-1-git-send-email-sanm@codeaurora.org>
References: <1571921328-13898-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for SC7180 SOC in USB DWC3 driver

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 261af9e..841763f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/* Copyright (c) 2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  *
  * Inspired by dwc3-of-simple.c
  */
@@ -754,6 +754,7 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
 	{ .compatible = "qcom,msm8996-dwc3" },
 	{ .compatible = "qcom,msm8998-dwc3" },
 	{ .compatible = "qcom,sdm845-dwc3" },
+	{ .compatible = "qcom,sc7180-dwc3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

