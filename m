Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8ADF2279B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 09:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgGUHpd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 03:45:33 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:13786 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbgGUHpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 03:45:32 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 21 Jul 2020 00:45:31 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Jul 2020 00:45:28 -0700
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 21 Jul 2020 13:15:02 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id DBEA82BA8; Tue, 21 Jul 2020 13:15:01 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v9 2/2] arm64: dts: qcom: sc7180: Add maximum speed property for DWC3 USB node
Date:   Tue, 21 Jul 2020 13:14:49 +0530
Message-Id: <1595317489-18432-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595317489-18432-1-git-send-email-sanm@codeaurora.org>
References: <1595317489-18432-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding maximum speed property for DWC3 USB node which can be used
for setting interconnect bandwidth.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 16df08d..3fe759b6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2656,6 +2656,7 @@
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+				maximum-speed = "super-speed";
 			};
 		};
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

