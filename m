Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E0041B4F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241999AbhI1RXU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:23:20 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:20876 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242001AbhI1RXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:23:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849688;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3pdZCJIS63omtWAExu94U6iabIKqzus595nFbkYuqE4=;
    b=jGkVY3bYtXtC6HY8h+xb0PQRMTbzZAC2BbRcCEvmBqIr28PkDbMLh6KjL9lrGpa6go
    rpmzHofWtvLbme9QhkoZ6ol2TZP7S17s0w8co5X1wyU+rzWDrPPd8szaQn+yts7PfPuq
    SLVB71tc1suGY0edacSUqalKxTpfFbSCLfYktlm56fMMvlCYM8ESdxxkTD6FjsSqeEaP
    QZJcB8+01x2U3MRKQar27CHrQKjuID67VZJ9hfpeorkCBFbu+Xw8JdTM4WthnttDRrb+
    A5LGtWXk1UyRAGzchWukLxkNw2n8OX117OaL34NRlTwHHgO6k6nEW/NiZVGYxLXb5wIk
    IC3w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLSoBK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:28 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 04/15] arm64: dts: qcom: msm8916-samsung-serranove: Add IMU
Date:   Tue, 28 Sep 2021 19:12:20 +0200
Message-Id: <20210928171231.12766-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928171231.12766-1-stephan@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the STMicroelectronics LSM6DS3 IMU that is used in the S4 Mini VE
to the device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../dts/qcom/msm8916-samsung-serranove.dts    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 6689687f544f..73fe7b2a5b66 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -170,6 +170,21 @@ touchkey@20 {
 	};
 };
 
+&blsp_i2c2 {
+	status = "okay";
+
+	imu@6b {
+		compatible = "st,lsm6ds3";
+		reg = <0x6b>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <115 IRQ_TYPE_EDGE_RISING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&imu_irq_default>;
+	};
+};
+
 &blsp_i2c5 {
 	status = "okay";
 
@@ -372,6 +387,14 @@ gpio_hall_sensor_default: gpio-hall-sensor-default {
 		bias-disable;
 	};
 
+	imu_irq_default: imu-irq-default {
+		pins = "gpio115";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	muic_i2c_default: muic-i2c-default {
 		pins = "gpio105", "gpio106";
 		function = "gpio";
-- 
2.33.0

