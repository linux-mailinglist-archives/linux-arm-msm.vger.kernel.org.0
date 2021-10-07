Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B00425089
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 11:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240736AbhJGKAR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 06:00:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35984 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240667AbhJGKAJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 06:00:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633600696; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ibfZuvwZjjI7SHbmLPlo8m5UuiT19PD99bxYQVwNKRo=; b=thP9h7d+TS3kfc3tk5iKw5CakbZc7nhBN2JSv266xr2eEr4acl8OWVOTVkEPXnkDbZ9ihQxA
 6bmcITFAgY2p9p6IxAau3yY8nrzQWNS233/OUj/GlyeB2OqDx+RFZchrVCus/G6436CH6p1/
 ygBkuEksv09EmiDDv6QZvZ3ZNvs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 615ec4b84ccc4cf2c7e5fab1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 09:58:16
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF68BC4361B; Thu,  7 Oct 2021 09:58:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5FD4C43460;
        Thu,  7 Oct 2021 09:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C5FD4C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>, devicetree@vger.kernel.org
Subject: [PATCH v11 5/5] arm64: dts: qcom: Enable RPM Sleep stats
Date:   Thu,  7 Oct 2021 15:27:29 +0530
Message-Id: <1633600649-7164-6-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633600649-7164-1-git-send-email-mkshah@codeaurora.org>
References: <1633600649-7164-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device node for Sleep stats driver which provides various
low power mode stats on msm8996, msm8998, qcs404, sdm630 and
sm6125.

Cc: devicetree@vger.kernel.org
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 5 +++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 5 +++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi  | 5 +++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 5 +++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi  | 5 +++++
 5 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index eb3ec5f..d647382 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1523,6 +1523,11 @@
 			};
 		};
 
+		sram@290000 {
+			compatible = "qcom,rpm-sleep-stats";
+			reg = <0x00290000 0x400>;
+		};
+
 		spmi_bus: qcom,spmi@400f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0400f000 0x1000>,
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 3c1f133..895806e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2022,6 +2022,11 @@
 			};
 		};
 
+		sram@290000 {
+			compatible = "qcom,rpm-sleep-stats";
+			reg = <0x00290000 0x400>;
+		};
+
 		spmi_bus: spmi@800f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg =	<0x0800f000 0x1000>,
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 339790b..45e6eae 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -719,6 +719,11 @@
 			reg = <0x01937000 0x25000>;
 		};
 
+		sram@290000 {
+			compatible = "qcom,rpm-sleep-stats";
+			reg = <0x00290000 0x400>;
+		};
+
 		spmi_bus: spmi@200f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0200f000 0x001000>,
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 9c7f87e..4044a5b 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1176,6 +1176,11 @@
 			status = "disabled";
 		};
 
+		sram@290000 {
+			compatible = "qcom,rpm-sleep-stats";
+			reg = <0x00290000 0x400>;
+		};
+
 		spmi_bus: spmi@800f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg =	<0x0800f000 0x1000>,
diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index c2317dd..c90491a3 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -460,6 +460,11 @@
 			};
 		};
 
+		sram@4690000 {
+			compatible = "qcom,rpm-sleep-stats";
+			reg = <0x04690000 0x400>;
+		};
+
 		spmi_bus: spmi@1c40000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x01c40000 0x1100>,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

