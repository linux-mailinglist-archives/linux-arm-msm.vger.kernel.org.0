Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2810010C802
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 12:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfK1Le6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 06:34:58 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:3742 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726227AbfK1Le6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 06:34:58 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Nov 2019 17:03:32 +0530
IronPort-SDR: JSFVpTrx+mZrMwt8CVyFQJoc6kWT2MZd7tT4Vttf4w5a32ZWSsx7GgazA8Y5mFLPIuFfk1UqoI
 9YA4N3cITRixoQt1xxxn9FkntnymHJ0znq8tlOw76k4q1dHPSI2RnFzKOaxIlzqfXvwd1wikjg
 Bknl7V/EVW9vh7g34yDlUL/vlo5BUmaDZ9W9sBe+ZRkQ1nSZZ+jn45EvBAqrtQk2ZHkEKs97ln
 KYcdCx2gCxoqb6Pm/2WqYX0Dh9nn16TSAmRi0cbq80TJGuu5wDQPHR74/CjXOD0UpfMijNyvsj
 Si+WP0lgu152SxZLo9PvnUPE
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 28 Nov 2019 17:03:12 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 3A3CA19BC; Thu, 28 Nov 2019 17:03:11 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v2 1/3] usb: dwc3: Add support for SC7180 SOC
Date:   Thu, 28 Nov 2019 17:03:05 +0530
Message-Id: <1574940787-1004-2-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574940787-1004-1-git-send-email-sanm@codeaurora.org>
References: <1574940787-1004-1-git-send-email-sanm@codeaurora.org>
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
index 261af9e..1df2372 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/* Copyright (c) 2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  *
  * Inspired by dwc3-of-simple.c
  */
@@ -753,6 +753,7 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
 	{ .compatible = "qcom,dwc3" },
 	{ .compatible = "qcom,msm8996-dwc3" },
 	{ .compatible = "qcom,msm8998-dwc3" },
+	{ .compatible = "qcom,sc7180-dwc3" },
 	{ .compatible = "qcom,sdm845-dwc3" },
 	{ }
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

