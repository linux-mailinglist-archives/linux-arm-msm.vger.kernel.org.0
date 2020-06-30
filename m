Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E517A20F0C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 10:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731720AbgF3IqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 04:46:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38813 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731685AbgF3IqF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 04:46:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593506764; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=q/6fRLiMLZ7F+kZEv84Fggel6bGpEXo2REWqIleQ6bU=; b=QzglyeA3VVmJoEocEaPQTS3ztsq7M1Ozr/+iZdMqVe8Fl1tOyznx17b0GrKsnvMkkVVnU4hA
 ju7CkrH/b+e9YZGUqhDRCXWjLAoNgHn9XPr2X99lTsExBIcC+3fTt5IFgRzeNAGdoEGYJjLb
 tCsghEyDMI3iI/DmNRQF1ofhBrg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5efafbb8c4bb4f886d527c1d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 08:45:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 87BA1C433C6; Tue, 30 Jun 2020 08:45:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D184C433A0;
        Tue, 30 Jun 2020 08:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D184C433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 4/4] arm64: dts: sc7180: Add sdhc opps and power-domains
Date:   Tue, 30 Jun 2020 14:15:12 +0530
Message-Id: <1593506712-24557-5-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593506712-24557-1-git-send-email-rnayak@codeaurora.org>
References: <1593506712-24557-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the power domain supporting performance state and the corresponding
OPP tables for the sdhc device on sc7180.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 78fef54..08ee49a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -524,6 +524,8 @@
 			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
 					<&gcc GCC_SDCC1_AHB_CLK>;
 			clock-names = "core", "iface";
+			power-domains = <&rpmhpd SC7180_CX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
 
 			bus-width = <8>;
 			non-removable;
@@ -535,6 +537,20 @@
 			mmc-hs400-enhanced-strobe;
 
 			status = "disabled";
+
+			sdhc1_opp_table: sdhc1-opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
 		};
 
 		qup_opp_table: qup-opp-table {
@@ -2300,10 +2316,26 @@
 			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
 					<&gcc GCC_SDCC2_AHB_CLK>;
 			clock-names = "core", "iface";
+			power-domains = <&rpmhpd SC7180_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
 
 			bus-width = <4>;
 
 			status = "disabled";
+
+			sdhc2_opp_table: sdhc2-opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
 		};
 
 		qspi: spi@88dc000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

