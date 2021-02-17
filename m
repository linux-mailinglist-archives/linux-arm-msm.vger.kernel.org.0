Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5158A31DE25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 18:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234424AbhBQR2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 12:28:07 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36306 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234422AbhBQR2A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 12:28:00 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 17 Feb 2021 09:27:18 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 Feb 2021 09:27:15 -0800
X-QCInternal: smtphost
Received: from c-rbokka-linux.qualcomm.com ([10.206.24.149])
  by ironmsg02-blr.qualcomm.com with ESMTP; 17 Feb 2021 22:56:37 +0530
Received: by c-rbokka-linux.qualcomm.com (Postfix, from userid 203305)
        id F1CB835F9; Wed, 17 Feb 2021 22:56:37 +0530 (IST)
From:   Ravi Kumar Bokka <rbokka@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org
Cc:     rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        dhavalp@codeaurora.org, mturney@codeaurora.org,
        sparate@codeaurora.org, rbokka@codeaurora.org,
        mkurumel@codeaurora.org
Subject: [PATCH] arm64: dts: qcom: sc7180:: modified qfprom CORR size as per RAW size
Date:   Wed, 17 Feb 2021 22:56:32 +0530
Message-Id: <1613582792-5225-1-git-send-email-rbokka@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

modified QFPROM controller CORRECTED region size as per RAW region size

Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6036c8b..d7dcff7 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -669,7 +669,7 @@
 
 		qfprom: efuse@784000 {
 			compatible = "qcom,sc7180-qfprom", "qcom,qfprom";
-			reg = <0 0x00784000 0 0x8ff>,
+			reg = <0 0x00784000 0 0x7a0>,
 			      <0 0x00780000 0 0x7a0>,
 			      <0 0x00782000 0 0x100>,
 			      <0 0x00786000 0 0x1fff>;
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by the Linux Foundation.

