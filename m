Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABA917DCA8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 10:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgCIJyJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 05:54:09 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:55524 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725942AbgCIJyI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 05:54:08 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Mar 2020 15:24:02 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Mar 2020 15:23:47 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 301BF230B; Mon,  9 Mar 2020 15:23:46 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v5 8/9] arm64: dts: qcom: sdm845: Add generic QUSB2 V2 Phy compatible
Date:   Mon,  9 Mar 2020 15:23:08 +0530
Message-Id: <1583747589-17267-9-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use generic QUSB2 V2 Phy configuration for sdm845.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 061f49f..5ed51c0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2603,7 +2603,7 @@
 		};
 
 		usb_1_hsphy: phy@88e2000 {
-			compatible = "qcom,sdm845-qusb2-phy";
+			compatible = "qcom,sdm845-qusb2-phy", "qcom,qusb2-v2-phy";
 			reg = <0 0x088e2000 0 0x400>;
 			status = "disabled";
 			#phy-cells = <0>;
@@ -2618,7 +2618,7 @@
 		};
 
 		usb_2_hsphy: phy@88e3000 {
-			compatible = "qcom,sdm845-qusb2-phy";
+			compatible = "qcom,sdm845-qusb2-phy", "qcom,qusb2-v2-phy";
 			reg = <0 0x088e3000 0 0x400>;
 			status = "disabled";
 			#phy-cells = <0>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

