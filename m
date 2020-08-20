Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6EB24BFB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 15:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgHTNwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 09:52:25 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11599 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbgHTNwC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 09:52:02 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 20 Aug 2020 06:52:01 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Aug 2020 06:52:00 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 20 Aug 2020 19:21:34 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 97B08440F; Thu, 20 Aug 2020 19:21:33 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 2/3] arm64: dts: qcom: sc7180: Add sleep pin ctrl for BT uart
Date:   Thu, 20 Aug 2020 19:21:06 +0530
Message-Id: <1597931467-24268-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597931467-24268-1-git-send-email-skakit@codeaurora.org>
References: <1597931467-24268-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add sleep pin ctrl for BT uart, and also change the bias
configuration to match Bluetooth module.

Signed-off-by: satya priya <skakit@codeaurora.org>
Reviewed-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V2:
 - This patch adds sleep state for BT UART. Newly added in V2.

Changes in V3:
 - Remove "output-high" for TX from both sleep and default states
   as it is not required. Configure pull-up for TX in sleep state.

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 54 +++++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index d8b5507..806f626 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -473,20 +473,20 @@
 
 &qup_uart3_default {
 	pinconf-cts {
-		/*
-		 * Configure a pull-down on 38 (CTS) to match the pull of
-		 * the Bluetooth module.
-		 */
+		/* Configure no pull on 38 (CTS) to match Bluetooth module */
 		pins = "gpio38";
-		bias-pull-down;
-		output-high;
+		bias-disable;
 	};
 
 	pinconf-rts {
-		/* We'll drive 39 (RTS), so no pull */
+		/*
+		 * Configure pull-down on 39 (RTS). This is needed to avoid a
+		 * floating pin which could mislead Bluetooth controller
+		 * with UART RFR state (READY/NOT_READY).
+		 */
 		pins = "gpio39";
 		drive-strength = <2>;
-		bias-disable;
+		bias-pull-down;
 	};
 
 	pinconf-tx {
@@ -494,7 +494,43 @@
 		pins = "gpio40";
 		drive-strength = <2>;
 		bias-disable;
-		output-high;
+	};
+
+	pinconf-rx {
+		/*
+		 * Configure a pull-up on 41 (RX). This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module is
+		 * in tri-state (module powered off or not driving the
+		 * signal yet).
+		 */
+		pins = "gpio41";
+		bias-pull-up;
+	};
+};
+
+&qup_uart3_sleep {
+	pinconf-cts {
+		/* Configure no-pull on 38 (CTS) to match Bluetooth module */
+		pins = "gpio38";
+		bias-disable;
+	};
+
+	pinconf-rts {
+		/*
+		 * Configure pull-down on 39 (RTS). This is needed to avoid a
+		 * floating pin which could mislead Bluetooth controller
+		 * with UART RFR state (READY/NOT_READY).
+		 */
+		pins = "gpio39";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	pinconf-tx {
+		/* Configure pull-up on 40 (TX) when it isn't actively driven */
+		pins = "gpio40";
+		drive-strength = <2>;
+		bias-pull-up;
 	};
 
 	pinconf-rx {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

