Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6770514CBD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 14:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgA2Nwy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 08:52:54 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:11994 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726779AbgA2Nwc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 08:52:32 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2020 19:22:26 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 Jan 2020 19:22:10 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 10C1C257F; Wed, 29 Jan 2020 19:22:09 +0530 (IST)
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
        devicetree@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v4 6/8] arm64: dts: qcom: sc7180: Add generic QUSB2 V2 Phy compatible
Date:   Wed, 29 Jan 2020 19:21:57 +0530
Message-Id: <1580305919-30946-7-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use generic QUSB2 V2 Phy configuration for SC7180.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8011c5f..0d6761b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1052,7 +1052,7 @@
 		};
 
 		usb_1_hsphy: phy@88e3000 {
-			compatible = "qcom,sc7180-qusb2-phy";
+			compatible = "qcom,sc7180-qusb2-phy", "qcom,qusb2-v2-phy";
 			reg = <0 0x088e3000 0 0x400>;
 			status = "disabled";
 			#phy-cells = <0>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

