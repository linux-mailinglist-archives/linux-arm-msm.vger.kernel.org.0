Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6389459C84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 08:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbhKWHEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 02:04:00 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:53070 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233576AbhKWHD7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 02:03:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637650851; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=54u+TcJfyroieuV33rCaVOJQAEOCCF/ZpuDarvtC+us=; b=Ze0hv3WyYDlFdMgZ9lgL/PDszyfe210MtE5bInMXgTqYAKv1AS1EwyXCrCgc6hLydzzqgjIX
 tVzrG+qxPMwdopX5sL6Vm1PliHbepXoPfOwtLqiAJDhHmOFVZDcKW8GYyiK6MTvvdS3SD7PG
 w8/dx1xzRPKt8X4P7URcLg5bqKE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 619c91a34fca5da46d7378a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 07:00:51
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 15B13C4360C; Tue, 23 Nov 2021 07:00:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CEC3CC43617;
        Tue, 23 Nov 2021 07:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CEC3CC43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@codeaurora.org,
        dianders@chromium.org, mka@chromium.org, kgodara@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sc7280-crd: Add Touchscreen and touchpad support
Date:   Tue, 23 Nov 2021 12:30:13 +0530
Message-Id: <1637650813-16654-5-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637650813-16654-1-git-send-email-rnayak@codeaurora.org>
References: <1637650813-16654-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kshitiz Godara <kgodara@codeaurora.org>

Add Touchscreen and touchpad hid-over-i2c node

Signed-off-by: Kshitiz Godara <kgodara@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-crd.dts | 63 +++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
index 8c2aee6..bef3037 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
@@ -23,6 +23,47 @@
 	};
 };
 
+ap_tp_i2c: &i2c0 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	trackpad: trackpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tp_int_odl>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+
+		post-power-on-delay-ms = <20>;
+		hid-descr-addr = <0x0001>;
+		vdd-supply = <&vreg_l18b_1p8>;
+
+		wakeup-source;
+	};
+};
+
+ap_ts_pen_1v8: &i2c13 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ap_ts: touchscreen@5c {
+		compatible = "hid-over-i2c";
+		reg = <0x5C>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <55 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <500>;
+		hid-descr-addr = <0x0000>;
+
+		vdd-supply = <&vreg_l19b_1p8>;
+	};
+};
+
 &nvme_pwren {
 	pins = "gpio51";
 };
@@ -30,3 +71,25 @@
 &nvme_3v3_regulator {
 	gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
 };
+
+&tlmm {
+	tp_int_odl: tp-int-odl {
+		pins = "gpio7";
+		function = "gpio";
+		input-enable;
+		bias-disable;
+	};
+
+	ts_int_l: ts-int-l {
+		pins = "gpio55";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	ts_reset_l: ts-reset-l {
+		pins = "gpio54";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

