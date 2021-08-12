Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA013E9FA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 09:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234911AbhHLHnS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 03:43:18 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:34292 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234888AbhHLHnQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 03:43:16 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 12 Aug 2021 00:42:52 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Aug 2021 00:42:50 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 Aug 2021 13:12:20 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id A21B221508; Thu, 12 Aug 2021 13:12:18 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V5 5/7] arm64: dts: sc7280: Configure debug uart for sc7280-idp
Date:   Thu, 12 Aug 2021 13:11:16 +0530
Message-Id: <1628754078-29779-6-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure uart5 as debug uart and split the pinctrl functions
to match with SoC dt.

Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index c41c2d0..53993b3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -254,6 +254,7 @@
 };
 
 &uart5 {
+	compatible = "qcom,geni-debug-uart";
 	status = "okay";
 };
 
@@ -311,18 +312,14 @@
 	bias-pull-up;
 };
 
-&qup_uart5_default {
-	tx {
-		pins = "gpio46";
-		drive-strength = <2>;
-		bias-disable;
-	};
+&qup_uart5_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
 
-	rx {
-		pins = "gpio47";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
+&qup_uart5_rx {
+	drive-strength = <2>;
+	bias-pull-up;
 };
 
 &sdc1_on {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

