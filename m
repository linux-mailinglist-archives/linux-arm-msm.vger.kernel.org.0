Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFD21BBFDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 15:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbgD1Nj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 09:39:27 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52102 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726973AbgD1Nj0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 09:39:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588081166; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=1DdyajtFurpxbyCR4wGHoNLC1QfsSNvY7qxM3ZQmJH0=; b=U5/lfvoQ6F9STln8uGDaHIv28wW9yAum4Euk5jsYydFbPjUt7MOSclYO8nAxESzE7Nk8aECp
 X7ItPs5ekLam7IuHAMItEogx9eIeaklCJEAVP2H0zm105cays1M5huSd+hpEAHN538GjIy+N
 Gayl28oyqqk74kCx6OzQnSDNOOo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea8320c.7f0f21d5d4c8-smtp-out-n01;
 Tue, 28 Apr 2020 13:39:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3FC4C19434; Tue, 28 Apr 2020 13:39:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2F64C44BFA;
        Tue, 28 Apr 2020 13:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2F64C44BFA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 11/17] arm64: dts: sc7180: Add sdhc opps and power-domains
Date:   Tue, 28 Apr 2020 19:02:59 +0530
Message-Id: <1588080785-6812-12-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the power domain supporting performance state and the corresponding
OPP tables for the sdhc device on sdm845.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index db5b3b3..bcd0e6f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -390,6 +390,20 @@
 			};
 		};
 
+		sdhc1_opp_table: sdhc1-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+			};
+
+			opp-384000000 {
+				opp-hz = /bits/ 64 <384000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+		};
+
 		sdhc_1: sdhci@7c4000 {
 			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x7c4000 0 0x1000>,
@@ -404,6 +418,8 @@
 			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
 					<&gcc GCC_SDCC1_AHB_CLK>;
 			clock-names = "core", "iface";
+			power-domains = <&rpmhpd SC7180_CX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
 
 			bus-width = <8>;
 			non-removable;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
