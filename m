Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE4A25C44D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 17:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbgICPHb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 11:07:31 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:45300 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729499AbgICPFi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 11:05:38 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 03 Sep 2020 08:05:34 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 03 Sep 2020 08:05:32 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 03 Sep 2020 20:35:05 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id CE84C44AA; Thu,  3 Sep 2020 20:35:04 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V4 3/4] arm64: dts: qcom: sc7180: Add sleep state for BT UART
Date:   Thu,  3 Sep 2020 20:34:57 +0530
Message-Id: <1599145498-20707-4-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
References: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add sleep state for BT uart to support the wakeup feature.

Signed-off-by: satya priya <skakit@codeaurora.org>
Reviewed-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V2:
 - This patch adds sleep state for BT UART. Newly added in V2.

Changes in V3:
 - Remove "output-high" for TX from both sleep and default states
   as it is not required. Configure pull-up for TX in sleep state.

Changes in V4:
 - As per Matthias's comment, removed drive-strength for sleep state
   and fixed nit-pick.

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index cecac3e..77e3523 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -507,6 +507,43 @@
 	};
 };
 
+&qup_uart3_sleep {
+	pinconf-cts {
+		/*
+		 * Configure no-pull on CTS. As this is driven by BT, do not
+		 * specify any pull in order to not conflict with BT pulls.
+		 */
+		pins = "gpio38";
+		bias-disable;
+	};
+
+	pinconf-rts {
+		/*
+		 * Configure pull-down on RTS to make sure that the BT SoC can
+		 * wake up the system by sending wakeup bytes during suspend.
+		 */
+		pins = "gpio39";
+		bias-pull-down;
+	};
+
+	pinconf-tx {
+		/* Configure pull-up on TX when it isn't actively driven */
+		pins = "gpio40";
+		bias-pull-up;
+	};
+
+	pinconf-rx {
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module is
+		 * in tri-state (module powered off or not driving the
+		 * signal yet).
+		 */
+		pins = "gpio41";
+		bias-pull-up;
+	};
+};
+
 &qup_uart8_default {
 	pinconf-tx {
 		pins = "gpio44";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

