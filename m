Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A318142184D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbhJDUXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:23:52 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:18843 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233877AbhJDUXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633378911;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=A4mG38TJdtwZpXWSkGNr8WpEhX95atrjR7MADgIRuJY=;
    b=X5Cjf7Amr4+LsiIkFuk0l5/iB8Ph5aZQTFy4kgvDL46GDOgVcG/TjRAX4yaHIzlAY4
    tbk/yJBtdrlcP+rEgWQ2OJV7naw2dscIXgW0xIyiRVrw+IDBmrs6S3AJAE1qk1gtD3vj
    puseBih+PiaJBmTB3rrfgW9J+DXibb0PT7Wf323OVGGU3PCZqGg6yF2iEEWGLvrmhcL5
    9/OdNcZBLsh6p5In/3+W+smGRsI2K50xhkDdRCy074mINTvD6w2Tmv4sWC1SRwnMN+6i
    4Kpmt1lUzzK3f6dHdyepu1zPUzf+AGhU/HIGRhF/xJh6630t3YKwSLhoaJ7z23uC2f4+
    IgKg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KLpKQo
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:21:51 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 04/15] arm64: dts: qcom: msm8916-samsung-serranove: Add IMU
Date:   Mon,  4 Oct 2021 22:19:10 +0200
Message-Id: <20211004201921.18526-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the STMicroelectronics LSM6DS3 IMU that is used in the S4 Mini VE
to the device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: None.
---
 .../dts/qcom/msm8916-samsung-serranove.dts    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 564f4f6d4f0f..2280b2e4b09f 100644
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

