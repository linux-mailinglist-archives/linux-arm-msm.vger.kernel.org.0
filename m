Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9FD3FBB49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 19:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238340AbhH3R4M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 13:56:12 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:28455 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238292AbhH3R4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 13:56:08 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 30 Aug 2021 10:55:14 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Aug 2021 10:55:12 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Aug 2021 23:24:42 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 703C63D31; Mon, 30 Aug 2021 23:24:41 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sc7280: Add cx power domain support
Date:   Mon, 30 Aug 2021 23:24:33 +0530
Message-Id: <1630346073-7099-4-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630346073-7099-1-git-send-email-sanm@codeaurora.org>
References: <1630346073-7099-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add multi pd support to set performance state for cx domain
to maintain minimum corner voltage for USB clocks.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 53a21d0..7ccccb7 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -1374,7 +1374,10 @@
 			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
 					  "dm_hs_phy_irq", "ss_phy_irq";
 
-			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			power-domains = <&rpmhpd SC7280_CX>, <&gcc GCC_USB30_PRIM_GDSC>;
+			power-domain-names = "cx", "usb_gdsc";
+
+			required-opps = <&rpmhpd_opp_nom>;
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

