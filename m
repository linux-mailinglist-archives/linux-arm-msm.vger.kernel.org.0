Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 699031A2380
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgDHNsO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:48:14 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:45503 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728157AbgDHNsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:48:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586353691; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=1DdyajtFurpxbyCR4wGHoNLC1QfsSNvY7qxM3ZQmJH0=; b=MCWFgbGDrRj5Ug2YmhDZKelp+pZjaa1pyxXBzzewTLg5JgXMnS7AY7MGaaaHQUm9UNvdyvjN
 dkYAb14NmVW7a8/6z2tOPycPEf+YQrV0YjKemGroROJ6H5mIFxDwMOUO8BtFRqKV/JzDeyOQ
 acWvGvfifkNgLeIY6pYn3DPNZc8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd619.7f3f5d057068-smtp-out-n02;
 Wed, 08 Apr 2020 13:48:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E8DD5C00452; Wed,  8 Apr 2020 13:48:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A82E9C3855A;
        Wed,  8 Apr 2020 13:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A82E9C3855A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 15/21] arm64: dts: sc7180: Add sdhc opps and power-domains
Date:   Wed,  8 Apr 2020 19:16:41 +0530
Message-Id: <1586353607-32222-16-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
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
