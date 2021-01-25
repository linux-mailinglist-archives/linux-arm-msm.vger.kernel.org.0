Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994433049E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 21:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbhAZFVj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727210AbhAYJsu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 04:48:50 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2D2C06178A;
        Mon, 25 Jan 2021 01:47:41 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id q7so11530038wre.13;
        Mon, 25 Jan 2021 01:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ThFiDlyMsgJrXidZg0Gd3b2g1YMJoXR4frCyMrY3dEo=;
        b=rFMsWq5mqWz8g4OnEwKNaaQxuUHXznbDq25XNx+77jqsrKrcEu9zY1M9EDfmexjXTq
         7xxzwOmxxzxlz6Fc3kWRhl7Ol5U8yP/kSGfInHDosyH++Xd6+tcCwstBOq24SAI2KY61
         Pwasj6BJYgf2/SYgT26AUxpWz2VbkMiiC148PuTF3c+Wsjh6dgNnEXLPl7aoN3gjSWDu
         15WxIQq6g1C+9PCvqkdSVyIaEOSAG41ylsn9Zsv6AxVwxG1S9O/dQ7Bj7csYiGA55gDq
         992VlXTs0VHAlzQRD8377LyFE+DRt5HffhnAksZ0Dk6MWYsT4p/ZFJHvImWtpJiJyZW9
         bxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ThFiDlyMsgJrXidZg0Gd3b2g1YMJoXR4frCyMrY3dEo=;
        b=X9I5zQhAVAcvUQctV3MNwhdnQ7ZQEb1BAE0Bi9dhtO8wL0xXbW2qGTe6m3UL33U3Aj
         /oc4c2KiXDsP6ze/EFUqHK8F4a/vxdjFpoyyxmNKEMdvhVZ0rBa8u4fI90ZOFw+N+t9r
         C0X6z6UbxGe3MNocQXDOHrp0L0JUscRSYqaZUWSktGuhMFS/AzZP2kZWDu6oaOFkucEZ
         9BDCXSJBqvgxCqZTJQBmU0Nshn2FZrTFxKXd/Zw5KhHz3mn6p4GyEVOdTrbi1dmp+M+I
         lPUAl+Olr3Kt4+8ibrU4bcviB84szKah/ZOzoe7t7czzBeRhMAtv12Ob4AIg9Lo2eedp
         IZ/A==
X-Gm-Message-State: AOAM5323iYqGB26EncXrf7FjHPMCW5YLU6wDvA4mkNSjJCzB/DFkkK0Q
        rsAv8O49mN4XKrP8R2H0EuKaFYhXLv8=
X-Google-Smtp-Source: ABdhPJwye/iD5yC8aoVnnGkOVK2lInc+mxJqz7DsbgQJqaKDMrYISLO3Hh63kKEax6PF3L/7qEssZA==
X-Received: by 2002:adf:902a:: with SMTP id h39mr903641wrh.147.1611568060096;
        Mon, 25 Jan 2021 01:47:40 -0800 (PST)
Received: from jonathan-N53SV.station ([151.81.101.204])
        by smtp.googlemail.com with ESMTPSA id u5sm22154052wmg.9.2021.01.25.01.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 01:47:39 -0800 (PST)
From:   Jonathan Albrieux <jonathan.albrieux@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, stephan@gerhold.net,
        phone-devel@vger.kernel.org,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8916-longcheer-l8910: Add imu/magnetometer
Date:   Mon, 25 Jan 2021 10:44:32 +0100
Message-Id: <20210125094435.7528-4-jonathan.albrieux@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210125094435.7528-1-jonathan.albrieux@gmail.com>
References: <20210125094435.7528-1-jonathan.albrieux@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

BQ Aquaris X5 (Longcheer L8910) has:
 - BMI160 accelerometer and gyroscope sensor
 - AK09911 magnetometer sensor
Add them to the device tree.

This patch depends on patch "arm64: dts: qcom: msm8916: Add blsp_i2c3".

Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>
---
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
index 7d5eff922f41..27845189ac2b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -56,6 +56,35 @@
 	};
 };
 
+&blsp_i2c3 {
+	status = "okay";
+
+	magnetometer@d {
+		compatible = "asahi-kasei,ak09911";
+		reg = <0x0d>;
+
+		vdd-supply = <&pm8916_l17>;
+		vid-supply = <&pm8916_l6>;
+
+		reset-gpios = <&msmgpio 111 GPIO_ACTIVE_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&mag_reset_default>;
+	};
+
+	imu@68 {
+		compatible = "bosch,bmi160";
+		reg = <0x68>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+
+		mount-matrix = "0", "1", "0",
+			      "-1", "0", "0",
+			       "0", "0", "1";
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
@@ -220,6 +249,14 @@
 		bias-pull-up;
 	};
 
+	mag_reset_default: mag-reset-default {
+		pins = "gpio111";
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
2.17.1

