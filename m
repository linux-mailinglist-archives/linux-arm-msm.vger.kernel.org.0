Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412EE42A509
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 15:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236589AbhJLNEm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 09:04:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:47947 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232851AbhJLNEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 09:04:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634043760; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+RuWrUD96ruUitCjWxda8u0OBJx6ljQt/5IhGPpIbhI=; b=TqYymwzo3u3W4G51Z0lCxivaFsrepUoiDWehMjShBPgaXmPHNf19sBu4bq4lkF0FeBbwUfB+
 SodNO3lR1ijkJouc3ZC9QLT91hxK6bxbN7Jxg4IyMuLcOrrbOJqdbINNZBJQeLLsfnqJqg/F
 fk72TZKLj9Fl5FVMFqNnVnNVLtg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6165875df3e5b80f1f247c02 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 12 Oct 2021 13:02:21
 GMT
Sender: bgodavar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 20E8EC4360C; Tue, 12 Oct 2021 13:02:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from bgodavar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3735CC4338F;
        Tue, 12 Oct 2021 13:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3735CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        bjorn.andersson@linaro.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, pharish@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        saluvala@codeaurora.org, abhishekpandit@chromium.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Add bluetooth node on SC7280
Date:   Tue, 12 Oct 2021 18:31:38 +0530
Message-Id: <1634043698-20256-1-git-send-email-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bluetooth SoC WCN6750 node for SC7280 IDP boards.

Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
v2: 
  * merged two patches into one
  * Removed unused comments
  * Removed pinmux & pin conf.
  * Addressed reviewers comments 

v1: initial patch
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  6 ++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts |  6 ++++++
 3 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 64fc22a..d8b9262 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -16,7 +16,9 @@
 	compatible = "qcom,sc7280-idp", "google,senor", "qcom,sc7280";
 
 	aliases {
+		bluetooth0 = &bluetooth;
 		serial0 = &uart5;
+		serial1 = &uart7;
 	};
 
 	chosen {
@@ -68,3 +70,7 @@
 		qcom,pre-scaling = <1 1>;
 	};
 };
+
+&bluetooth {
+	vddio-supply = <&vreg_l19b_1p8>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 272d5ca..09adc802 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -393,6 +393,23 @@
 				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
 	pinctrl-names = "default", "sleep";
 	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
+
+	bluetooth: wcn6750-bt {
+		compatible = "qcom,wcn6750-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_default>;
+		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
+		vddaon-supply = <&vreg_s7b_0p9>;
+		vddbtcxmx-supply = <&vreg_s7b_0p9>;
+		vddrfacmn-supply = <&vreg_s7b_0p9>;
+		vddrfa0p8-supply = <&vreg_s7b_0p9>;
+		vddrfa1p7-supply = <&vreg_s1b_1p8>;
+		vddrfa1p2-supply = <&vreg_s8b_1p2>;
+		vddrfa2p2-supply = <&vreg_s1c_2p2>;
+		vddasd-supply = <&vreg_l11c_2p8>;
+		max-speed = <3200000>;
+	};
 };
 
 /* PINCTRL - additions to nodes defined in sc7280.dtsi */
@@ -504,6 +521,14 @@
 		 */
 		bias-pull-up;
 	};
+
+	bt_en_default: bt_en_default {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		output-low;
+		bias-pull-down;
+	};
 };
 
 &sdc1_on {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
index 1fc2add..e60fa88 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
@@ -14,10 +14,16 @@
 	compatible = "qcom,sc7280-idp2", "google,piglin", "qcom,sc7280";
 
 	aliases {
+		bluetooth0 = &bluetooth;
 		serial0 = &uart5;
+		serial1 = &uart7;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&bluetooth {
+	vddio-supply = <&vreg_l18b_1p8>;
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

