Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BC63C5D75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 15:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhGLNmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 09:42:25 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:11240 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbhGLNmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 09:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626097167;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=8JrTcacErvpjbcLgKk+NhC6TNamfkL0x+JyeXwnQEl4=;
    b=sC69NmEHlIqI0fv3RCOJrAgCk6W8zxW/23HG2a0chinsMbnE4UefUDFcO4//sj/bPx
    iPtvn1dLvJA+5YDMI4DD/lvv11mj8O3bTzo/b/RAk1O3f+IVvjc49/SEPs63YojOIt89
    RLr+wSXhhqoz0mHgqDOAceD7swOcVpI4Xt3j+0bDPbGXu5MMq4QHlCxch9y0aNzvMeWg
    hbKTE3vfyA5T4dnrBo5MPb6F5wL1in8RZxL0YKIZ3NX5NPQdmRIaobJAEt5fMgKLlabm
    obywN4ID9cP993uc6DAMMoXwc7m3mpU/oIcjNJo6cbWE/VUMq21iAOQ4+A3HYcZx6KMH
    ggUQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB426L3OY="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id Y070ccx6CDdR9tZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 12 Jul 2021 15:39:27 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 4/4] arm64: dts: qcom: msm8916-wingtech-wt88047: Add IMU
Date:   Mon, 12 Jul 2021 15:37:35 +0200
Message-Id: <20210712133735.318250-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712133735.318250-1-stephan@gerhold.net>
References: <20210712133735.318250-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Xiaomi Redmi 2 has an InvenSense MPU-6880 supported by the
inv_mpu6050 driver in Linux. Add it to the device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../dts/qcom/msm8916-wingtech-wt88047.dts     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
index 9d9e85e75411..4e20cc0008f7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
@@ -43,6 +43,28 @@ usb_id: usb-id {
 	};
 };
 
+&blsp_i2c2 {
+	status = "okay";
+
+	imu@68 {
+		compatible = "invensense,mpu6880";
+		reg = <0x68>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <115 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&imu_default>;
+
+		mount-matrix = "1",  "0", "0",
+			       "0", "-1", "0",
+			       "0",  "0", "1";
+	};
+};
+
 &blsp_i2c5 {
 	status = "okay";
 
@@ -257,6 +279,14 @@ gpio_keys_default: gpio-keys-default {
 		bias-pull-up;
 	};
 
+	imu_default: imu-default {
+		pins = "gpio115";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	touchscreen_default: touchscreen-default {
 		pins = "gpio13";
 		function = "gpio";
-- 
2.32.0

