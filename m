Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A6042A340
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 13:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbhJLLaM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 07:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236032AbhJLLaM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 07:30:12 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EC6C061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 04:28:11 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id d23so1708026pgh.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 04:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kMH8qw6YfdKiOSMvU60LWyzmdzhpPzD74mBmYDGRns=;
        b=ZSkFnfbIa8VFOCaRwcWiNi8VbfDD2kNVoQZXOQrNONB+hxaiRjuyyXx7RxDPVGlSp+
         KawFZrjaRcwgAi1JxpSUP22A0/c1YexxkAwwipp1yoZhSXQSU0Emcw9J+Gj/CUnboS4J
         6KmqQ889i6qd5DnKM+2FLZzCxDLz/iMCQmAGt49Nxy7oQe2JZAIC1MnQGnuMAziYjJF7
         hrUCKtEwNBMh7rrvJoJ8NoV6hjTeA8vS/GeZ3wIX2eIZRcUBFlZmKvjabekGT2zbxgNO
         qTNLVhMWWdnt6iPMknjj2dnlv8S10GP8yNJJqsLxi+xncXjPDLHbr63f+NTcGaWmXF2o
         sCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kMH8qw6YfdKiOSMvU60LWyzmdzhpPzD74mBmYDGRns=;
        b=eD45PDBTjaOD1J6s3ProQMITfxFEXPRgN6SgdVBFSBGCTDD1XJ/Y31HeM8EZZZiSY1
         uqD/TWte3jzONAmUtEXz7d1cEJIxJ/tI7k7zAw7sUYIMWjBKbfe6yssFk67ojZGkKdmJ
         cHWlaXK2fAWcE4mi04LO0p5DSwbcFVoEVbVZqknPw8TuKLuwFdoZ66wWNxmNTzXaLvXn
         q22Y0ioLg1AIIiNyFnxX2JFoMyYZXGxL/PJkVSahdpTvAWXHKuFITD/tIY4Xxyqymvrw
         Ra+qFTzgSshftkvupgDEP0hglLTWlf/U3tHf8evF9F4AixKGd0yH45qwiBdwg5SshWce
         h1Ug==
X-Gm-Message-State: AOAM533YHjgQbtMQOt525p+pl7qyASOFMXK4B+M2cFeRc1hRq0MRyUo4
        /1VtMrIcsDhEwR9Cm2HSzGMBYJ8lc2LGEQ==
X-Google-Smtp-Source: ABdhPJwvDlxjOM1gRk4WfJQ1SVxzzYPvonmWTR+YiQRYqI2jA73gbIQy/U5V2PbBne0PxQ+4NrffjA==
X-Received: by 2002:a63:5544:: with SMTP id f4mr22624382pgm.431.1634038090776;
        Tue, 12 Oct 2021 04:28:10 -0700 (PDT)
Received: from localhost.localdomain ([117.242.199.204])
        by smtp.googlemail.com with ESMTPSA id z11sm2590359pjn.12.2021.10.12.04.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 04:28:10 -0700 (PDT)
From:   "J.R. Divya Antony" <d.antony.jr@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org,
        "J.R. Divya Antony" <d.antony.jr@gmail.com>
Subject: [PATCH v2 1/3] arm64: dts: qcom: msm8916-asus-z00l: Add touchscreen
Date:   Tue, 12 Oct 2021 16:57:33 +0530
Message-Id: <20211012112735.2765-1-d.antony.jr@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for touchscreen in this device.

Signed-off-by: J.R. Divya Antony <d.antony.jr@gmail.com>
---
 .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
index cee451e59385..71f4aa16058f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -4,6 +4,8 @@
 
 #include "msm8916-pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Asus Zenfone 2 Laser";
@@ -48,6 +50,29 @@ usb_id: usb-id {
 	};
 };
 
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+
+		interrupt-parent = <&msmgpio>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&msmgpio 12 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&pm8916_l11>;
+		iovcc-supply = <&pm8916_l6>;
+
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_default>;
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
@@ -185,6 +210,22 @@ gpio_keys_default: gpio-keys-default {
 		bias-pull-up;
 	};
 
+	touchscreen_default: touchscreen-default {
+		pins = "gpio13";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+
+		reset {
+			pins = "gpio12";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	usb_id_default: usb-id-default {
 		pins = "gpio110";
 		function = "gpio";
-- 
2.33.0

