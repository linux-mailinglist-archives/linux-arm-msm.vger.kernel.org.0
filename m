Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A57268CCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 16:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgINOFX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 10:05:23 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36375 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgINOAo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 10:00:44 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Sep 2020 06:59:25 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Sep 2020 06:59:24 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Sep 2020 19:28:55 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 09CEC3F92; Mon, 14 Sep 2020 19:28:53 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V6 1/4] arm64: dts: qcom: sc7180: Improve the uart3 pin config for sc7180-idp
Date:   Mon, 14 Sep 2020 19:28:34 +0530
Message-Id: <1600091917-7464-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600091917-7464-1-git-send-email-skakit@codeaurora.org>
References: <1600091917-7464-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove output-high from CTS and TX as this is not really required. During
bringup to fix transfer failures this was added to match with console uart
settings. Probably some boot loader config was missing then. As it is
working fine now, remove it.

Signed-off-by: satya priya <skakit@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
Changes in V4:
 - This is newly added in V4 to separate the improvements in pin settings
   and wakeup related changes.

Changes in V5:
 - As per Doug's comment configured pull-down for CTS pin as earlier.

Changes in V6:
 - As per Doug's comment changed the subjet of the patch.

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index d8b5507..04888df 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -474,32 +474,30 @@
 &qup_uart3_default {
 	pinconf-cts {
 		/*
-		 * Configure a pull-down on 38 (CTS) to match the pull of
+		 * Configure a pull-down on CTS to match the pull of
 		 * the Bluetooth module.
 		 */
 		pins = "gpio38";
 		bias-pull-down;
-		output-high;
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

