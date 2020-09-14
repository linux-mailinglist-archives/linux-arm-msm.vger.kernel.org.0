Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1CAF268CCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 16:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgINOFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 10:05:20 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:31994 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgINOAq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 10:00:46 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 14 Sep 2020 06:59:27 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 14 Sep 2020 06:59:26 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Sep 2020 19:28:55 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 2EAD144D9; Mon, 14 Sep 2020 19:28:54 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V6 3/4] arm64: dts: qcom: sc7180-trogdor: Add wakeup support for BT UART
Date:   Mon, 14 Sep 2020 19:28:36 +0530
Message-Id: <1600091917-7464-4-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600091917-7464-1-git-send-email-skakit@codeaurora.org>
References: <1600091917-7464-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the necessary pinctrl, interrupt property and a suitable sleep config
to support Bluetooth wakeup feature.

GPIO mode is configured in sleep state to drive the RTS/RFR line low.
If QUP function is selected in sleep state, UART RTS/RFR is pulled high
during suspend and BT SoC not able to send wakeup bytes.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V5:
 - Newly added in V5. This patch adds wakeup support for trogdor board files.

Changes in V6:
 - As per Doug's comment deleted interrupts property and sorted the qup sleep
   state before trackpad.
 - As per Bjorn's comment canged the commit text, rationale for RTS, TX, RX.

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index a6b9beb..6629df9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -794,6 +794,13 @@ ap_spi_fp: &spi10 {
 &uart3 {
 	status = "okay";
 
+	/delete-property/interrupts;
+	interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
+				<&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-1 = <&qup_uart3_sleep>;
+
 	bluetooth: bluetooth {
 		compatible = "qcom,wcn3991-bt";
 		vddio-supply = <&pp1800_l10a>;
@@ -1307,6 +1314,53 @@ ap_spi_fp: &spi10 {
 		};
 	};
 
+	qup_uart3_sleep: qup-uart3-sleep {
+		pinmux {
+			pins = "gpio38", "gpio39",
+			       "gpio40", "gpio41";
+			function = "gpio";
+		};
+
+		pinconf-cts {
+			/*
+			 * Configure a pull-down on CTS to match the pull of
+			 * the Bluetooth module.
+			 */
+			pins = "gpio38";
+			bias-pull-down;
+		};
+
+		pinconf-rts {
+			/*
+			 * Configure pull-down on RTS. As RTS is active low
+			 * signal, pull it low to indicate the BT SoC that it
+			 * can wakeup the system anytime from suspend state by
+			 * pulling RX low (by sending wakeup bytes).
+			 */
+			 pins = "gpio39";
+			 bias-pull-down;
+		};
+
+		pinconf-tx {
+			/*
+			 * Configure pull-up on TX when it isn't actively driven
+			 * to prevent BT SoC from receiving garbage during sleep.
+			 */
+			pins = "gpio40";
+			bias-pull-up;
+		};
+
+		pinconf-rx {
+			/*
+			 * Configure a pull-up on RX. This is needed to avoid
+			 * garbage data when the TX pin of the Bluetooth module
+			 * is floating which may cause spurious wakeups.
+			 */
+			pins = "gpio41";
+			bias-pull-up;
+		};
+	};
+
 	trackpad_int_1v8_odl: trackpad-int-1v8-odl {
 		pinmux {
 			pins = "gpio58";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

