Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52AB1423DC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 14:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238476AbhJFMcm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 08:32:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:12249 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238463AbhJFMcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 08:32:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633523449; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=G5VectM1qHdAaz1q+gplVOdSjt+FyTefrjOw0flqLEM=; b=WacHgFb1zofi1/R44YQkNGaaCuJVX4TnRfRJWXp8nkiEsQ+vZzjTu1a+MWNVWx++UqKil9/T
 7XnxsX2yM+P+pLG+Lc0psT+siraUtrYgbuHaqtgu6vNB/U2qLW2cQgo6ufXKAsciHliy/JPV
 W/H6U2WYybzW2XdqYeNE+ABAtC4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 615d96db4ccc4cf2c7bf6338 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Oct 2021 12:30:19
 GMT
Sender: bgodavar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 71769C43460; Wed,  6 Oct 2021 12:30:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from bgodavar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E3798C4338F;
        Wed,  6 Oct 2021 12:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E3798C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, bjorn.andersson@linaro.org,
        johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, pharish@codeaurora.org,
        abhishekpandit@chromium.org
Subject: [PATCH v1 1/2] arm64: dts: qcom: sc7280: Add bluetooth node on SC7280 IDP board
Date:   Wed,  6 Oct 2021 18:00:02 +0530
Message-Id: <1633523403-32264-1-git-send-email-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bluetooth SoC WCN6750 node for SC7280 IDP board.

Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  2 ++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 64fc22a..d3f5393 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -17,6 +17,8 @@
 
 	aliases {
 		serial0 = &uart5;
+		bluetooth0 = &bluetooth;
+		hsuart0 = &uart7;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 272d5ca..05aa729 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -393,6 +393,24 @@
 				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
 	pinctrl-names = "default", "sleep";
 	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
+
+	bluetooth: wcn6750-bt {
+		compatible = "qcom,wcn6750-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_default>;
+		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>; /* BT_EN */
+		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>; /* SW_CTRL */
+		vddio-supply = <&vreg_l19b_1p8>;
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
@@ -504,6 +522,19 @@
 		 */
 		bias-pull-up;
 	};
+
+	bt_en_default: bt_en_default {
+		pinmux {
+			pins = "gpio85";
+			function = "gpio";
+		};
+		pinconf {
+			pins = "gpio85";
+			drive-strength = <2>;
+			output-low;
+			bias-pull-down;
+		};
+	};
 };
 
 &sdc1_on {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

