Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECDD427E9A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Oct 2021 05:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhJJDkb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Oct 2021 23:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhJJDka (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Oct 2021 23:40:30 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D13C061570
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Oct 2021 20:38:32 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so12130297pjc.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Oct 2021 20:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnmMUol9PPoUaRCFJDxnuRaBuXtA7V5GZJLCXirxsqQ=;
        b=jAENpBx+8R/69yS2vdv3S8qbbeZCqlfe9QDGJSTsa2OswFY25jzL206gbeL4x5Z8jc
         Qy/Q2YJ1/UTDfusZmbUTuvTyPhdQYqMLZg0yl/HJyWyAZl9aoOsyy9RM+w20YjPx4Zpa
         GQeh+RVuGgzfxwHjtihf20ST9G1T2xolddTIDRVjpbdVwRhjc1mJ1GdMGrFTW//ZUMOb
         CsfLlkd0ffj6v1C/0iTjPTP2SSdjyecn0EwP5CP6CQSGaHltXpLnkglW0lIqGaBFKQi+
         L0rDSQw6Jlc5VmioYbAgEbvrjPxHLnbGpFMSgdS2RMltS4hln/24B7yvMbvleC/Yf+X8
         CBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnmMUol9PPoUaRCFJDxnuRaBuXtA7V5GZJLCXirxsqQ=;
        b=O3MphJlqgwveLkDB3XJTRlkDHdZU7SlAExdImgdDSZNMybghFwilzq7oEwgZxXOczk
         qalsXLE17tZWd7blRhBRtbKok0HWJTBk+fhsgXmWMeI5imT2EYKxw6lzPe2H/rXaOGsh
         GRnHDZ8iH6Lxm/6ZuSPWFz2cTZys1vGBnkCmMJmeB2+7HMzQJd0M4thfQHDoNb12plQV
         aKxJfIIkko17GhsllkhFqF7GLE+qkHu41jHiJISDdvMfMFIfHHcONmsP8wVqQ2y0iuMN
         brEIPAHqsYAnhZ8kfzvDncQQwAgsC34PYTTrUfjk3tupCl4LX3vlDMnIN06EFKZuAOKg
         5CkA==
X-Gm-Message-State: AOAM533m1kCemedoZzfEJWvoU626K1Q49nD1rA1//uyUVD7t5jOlndG7
        x7MTXET3Olle2CQ3sB7saVE=
X-Google-Smtp-Source: ABdhPJzB4X/RTPQaYLPPE33gxu3Xs1Bbd4ikHZ/iCY533cWlTkyeO1BGrsCnSC6gi5U3xFQLvrZZ1A==
X-Received: by 2002:a17:902:b593:b0:12d:7aa5:de2d with SMTP id a19-20020a170902b59300b0012d7aa5de2dmr17908010pls.31.1633837112277;
        Sat, 09 Oct 2021 20:38:32 -0700 (PDT)
Received: from localhost.localdomain ([117.193.191.46])
        by smtp.googlemail.com with ESMTPSA id z68sm19522pgz.90.2021.10.09.20.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 20:38:31 -0700 (PDT)
From:   "J.R. Divya Antony" <d.antony.jr@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org,
        "J.R. Divya Antony" <d.antony.jr@gmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8916-asus-z00l: Add sensors
Date:   Sun, 10 Oct 2021 09:07:50 +0530
Message-Id: <20211010033750.15204-1-d.antony.jr@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This device has MPU-6515 imu and Asahi Kasei AK09911 magnetometer.
Add support for it.

Signed-off-by: J.R. Divya Antony <d.antony.jr@gmail.com>
---
 .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
index cee451e59385..f43ad0b306f0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -48,6 +48,41 @@ usb_id: usb-id {
 	};
 };
 
+&blsp_i2c2 {
+	status = "okay";
+
+	magnetometer@c {
+		compatible = "asahi-kasei,ak09911";
+		reg = <0x0c>;
+
+		vdd-supply = <&pm8916_l8>;
+		vid-supply = <&pm8916_l6>;
+
+		reset-gpios = <&msmgpio 112 GPIO_ACTIVE_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&mag_reset_default>;
+	};
+
+	imu@68 {
+		compatible = "invensense,mpu6515";
+		reg = <0x68>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <36 IRQ_TYPE_EDGE_RISING>;
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
 &blsp1_uart2 {
 	status = "okay";
 };
@@ -185,6 +220,22 @@ gpio_keys_default: gpio-keys-default {
 		bias-pull-up;
 	};
 
+	imu_default: imu-default {
+		pins = "gpio36";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	mag_reset_default: mag-reset-default {
+		pins = "gpio112";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	usb_id_default: usb-id-default {
 		pins = "gpio110";
 		function = "gpio";
-- 
2.33.0

