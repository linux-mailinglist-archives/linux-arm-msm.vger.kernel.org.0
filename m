Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A9632C1C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389519AbhCCVir (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:38:47 -0500
Received: from z11.mailgun.us ([104.130.96.11]:58432 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352085AbhCCMWU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 07:22:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614774116; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=fw1r17HvrSgjv/EXrgnKTZfvlxaG1/0TK1y06gc2szY=; b=pp7BJbULqPV13WmdMbh34xn5aEgnWKxw66SxrMqFdTYCLoR8+/FbaEHPEOIS1v1u70YsHwvz
 ieLUPeCNZU2oX1dn+3nclSnKTapJyUebvWN3XeOpSs/od4962Io49kS775pKTwd+CTLh71OQ
 p30uUKKMAs+d+zp6Y2bqrj1owRw=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 603f7f3d480e0a45dca9033d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Mar 2021 12:21:17
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DE180C43461; Wed,  3 Mar 2021 12:21:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E477C43462;
        Wed,  3 Mar 2021 12:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9E477C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 05/14] arm64: dts: qcom: sc7280: Add RSC and PDC devices
Date:   Wed,  3 Mar 2021 17:47:49 +0530
Message-Id: <1614773878-8058-6-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Maulik Shah <mkshah@codeaurora.org>

Add PDC interrupt controller along with apps RSC device.
Also add reserved memory for command_db.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 44 ++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 4a56d9c..21c2399 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -30,6 +31,18 @@
 		};
 	};
 
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		aop_cmd_db_mem: memory@80860000 {
+			reg = <0x0 0x80860000 0x0 0x20000>;
+			compatible = "qcom,cmd-db";
+			no-map;
+		};
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -194,6 +207,19 @@
 			};
 		};
 
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sc7280-pdc", "qcom,pdc";
+			reg = <0 0x0b220000 0 0x30000>;
+			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,
+					  <55 306 4>, <59 312 3>, <62 374 2>,
+					  <64 434 2>, <66 438 3>, <69 86 1>,
+					  <70 520 54>, <124 609 31>, <155 63 1>,
+					  <156 716 12>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,sc7280-pinctrl";
 			reg = <0 0x0f100000 0 0x1000000>;
@@ -203,6 +229,7 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 175>;
+			wakeup-parent = <&pdc>;
 
 			qup_uart5_default: qup-uart5-default {
 				pins = "gpio46", "gpio47";
@@ -287,6 +314,23 @@
 				status = "disabled";
 			};
 		};
+
+		apps_rsc: rsc@18200000 {
+			compatible = "qcom,rpmh-rsc";
+			reg = <0 0x18200000 0 0x10000>,
+			      <0 0x18210000 0 0x10000>,
+			      <0 0x18220000 0 0x10000>;
+			reg-names = "drv-0", "drv-1", "drv-2";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS  2>,
+					  <SLEEP_TCS   3>,
+					  <WAKE_TCS    3>,
+					  <CONTROL_TCS 1>;
+		};
 	};
 
 	timer {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

