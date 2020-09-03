Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6A325C44F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 17:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729046AbgICPHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 11:07:30 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:22454 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729495AbgICPFi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 11:05:38 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 03 Sep 2020 08:05:32 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 03 Sep 2020 08:05:31 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 03 Sep 2020 20:35:05 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id B0B154435; Thu,  3 Sep 2020 20:35:04 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V4 2/4] arm64: dts: qcom: sc7180: Improve the pin config settings for CTS and TX
Date:   Thu,  3 Sep 2020 20:34:56 +0530
Message-Id: <1599145498-20707-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
References: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure no-pull for CTS, as this is driven by BT do not specify any pull
in order to not conflict with BT pulls.

Remove output-high from CTS and TX as this is not really required. During
bringup to fix transfer failures this was added to match with console uart
settings. Probably some boot loader config was missing then. As it is
working fine now, remove it.

Signed-off-by: satya priya <skakit@codeaurora.org>
Reviewed-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V4:
 - This is newly added in V4 to separate the improvements in pin settings
   and wakeup related changes.

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index d8b5507..cecac3e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -474,32 +474,30 @@
 &qup_uart3_default {
 	pinconf-cts {
 		/*
-		 * Configure a pull-down on 38 (CTS) to match the pull of
-		 * the Bluetooth module.
+		 * Configure no-pull on CTS. As this is driven by BT, do not
+		 * specify any pull in order to not conflict with BT pulls.
 		 */
 		pins = "gpio38";
-		bias-pull-down;
-		output-high;
+		bias-disable;
 	};
 
 	pinconf-rts {
-		/* We'll drive 39 (RTS), so no pull */
+		/* We'll drive RTS, so no pull */
 		pins = "gpio39";
 		drive-strength = <2>;
 		bias-disable;
 	};
 
 	pinconf-tx {
-		/* We'll drive 40 (TX), so no pull */
+		/* We'll drive TX, so no pull */
 		pins = "gpio40";
 		drive-strength = <2>;
 		bias-disable;
-		output-high;
 	};
 
 	pinconf-rx {
 		/*
-		 * Configure a pull-up on 41 (RX). This is needed to avoid
+		 * Configure a pull-up on RX. This is needed to avoid
 		 * garbage data when the TX pin of the Bluetooth module is
 		 * in tri-state (module powered off or not driving the
 		 * signal yet).
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

