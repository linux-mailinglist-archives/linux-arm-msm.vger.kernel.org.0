Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE703136CE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 13:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgAJMTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 07:19:10 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:23802 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726718AbgAJMTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 07:19:10 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Jan 2020 17:49:06 +0530
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Jan 2020 17:49:00 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 72D3A22B4; Fri, 10 Jan 2020 17:48:59 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v3 5/5] arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy tuning params for SC7180
Date:   Fri, 10 Jan 2020 17:48:19 +0530
Message-Id: <1578658699-30458-6-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Overriding the QUSB2 V2 Phy tuning parameters for SC7180 SOC.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 388f50a..826cf02 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -276,9 +276,11 @@
 	vdda-pll-supply = <&vreg_l11a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l17a_3p0>;
 	qcom,imp-res-offset-value = <8>;
-	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
-	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_15_PERCENT>;
 	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+	qcom,bias-ctrl-value = <0x22>;
+	qcom,charge-ctrl-value = <3>;
+	qcom,hsdisc-trim-value = <0>;
 };
 
 &usb_1_qmpphy {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

