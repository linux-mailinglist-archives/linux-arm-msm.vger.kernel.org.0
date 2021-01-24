Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A59301C6B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 14:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbhAXN5o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 08:57:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbhAXN5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 08:57:35 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17647C0613ED;
        Sun, 24 Jan 2021 05:56:42 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id u14so1668320wml.4;
        Sun, 24 Jan 2021 05:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jXFAmUtKtjhIfr6Qnmj7e1YF9rrTfOmCZQGx30u2fmY=;
        b=N810cDFj64zSqA8S6VewzlCxsKIhGVmKk0+7xqcAlo0sNwJbDeLLPLzZTZCKHBKO1V
         IeR5Qawgwix2AITjEz4oUGfNvkrY5F+TPpaCJcrW2jb1lx8yLMfLwpBh9xj/bDLaPraW
         9JkQsMH8X1d0/3UaV8p0Wg46q93Idj7EW6eKgVsU0Sp3IcV1rgaDWSEAC9UXUKevdktX
         EYlwVrS6OuWIQd2/dG8nN5jQVwXst6vhPHHbqAMvpUHDf18YWFG1ZXYI4iyoREANL7QB
         wmoeicp3GVF4pz0pmqxUzgSWWFxOfDRDK5r3itdHiQg/6wZWWoIu7gPQztCdvHRQohfZ
         Abyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jXFAmUtKtjhIfr6Qnmj7e1YF9rrTfOmCZQGx30u2fmY=;
        b=AWUzmq7+kei0UcilgojDLfBmvyrATlt4tH47xNUN0FHdymRSy8DVIzbA6U11EcbYnI
         3lYfeSPKqSQz3StSci7K83EqDhTPvRXnYzZ5jYTo94XKTdRtpq/Xy0aAmvhE8JPykKtH
         2SATbOutM6f5EVPhr73r8T6F6MVhEmb92nrf48BlqMOAbWyeZkby8JnZJOKAO4G7iKfu
         CIptUcHqXf4fQkVeI2m63/gbEZ91e4ybfuZDYFXmZt+3JJbTnBBzBSqe1HyhdJYptHlI
         7/5+9sQ4uw/fTc4HAkB1Y20QI0NriFCMJrWjZ9ExY/3Ko2Q0vxIpEUGvhR9LPI0rdPbd
         0k0Q==
X-Gm-Message-State: AOAM531gAt5YrgX4tsRSru9UYzyf+FpqzSg4uv7dFjYv4B8LwxdL5uLo
        9UEYRS0+tjSjW5GYGW0i0LosMt3QGtDIag==
X-Google-Smtp-Source: ABdhPJyzFL+uOjMNLebAdZD/9Hzmy28qJTSsA3rsAL04fNLRragpOTLncKkhZjMUIkFxUsPmayTdxQ==
X-Received: by 2002:a1c:f619:: with SMTP id w25mr3228605wmc.179.1611496600515;
        Sun, 24 Jan 2021 05:56:40 -0800 (PST)
Received: from jonathan-N53SV.station ([151.81.101.204])
        by smtp.googlemail.com with ESMTPSA id a27sm19658409wrc.94.2021.01.24.05.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 05:56:39 -0800 (PST)
From:   Jonathan Albrieux <jonathan.albrieux@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, stephan@gerhold.net,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: msm8916-longcheer-l8910: Add imu/magnetometer
Date:   Sun, 24 Jan 2021 14:54:07 +0100
Message-Id: <20210124135409.5473-4-jonathan.albrieux@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
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
index 7d5eff922f41..c3933ec0f116 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -56,6 +56,35 @@
 	};
 };
 
+&blsp_i2c3 {
+	status = "okay";
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

