Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22098D5089
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2019 16:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729220AbfJLO6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Oct 2019 10:58:39 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45790 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbfJLO6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Oct 2019 10:58:38 -0400
Received: by mail-lj1-f193.google.com with SMTP id q64so12504423ljb.12;
        Sat, 12 Oct 2019 07:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ds6CBuPGXPN8cM3I5FgjrvhnR3q6X/DE2v9ncJJpvWQ=;
        b=C+0Ksqszvv5wtLFREYcHTQLiAh1582oPqM1r2RmJIU5CRJbN/EuPg2jFlDY1oSZB8Z
         W9pS6sWkZn/db+B+IoPez/rOj003akKbM3VlvpR15if0gUU32o+ZRpOQogAv+P74Resk
         f0AzG1tQX6GjN3Q/HueMw6yAF8HNvLd9vHneA07aAB3eMIPHJF2NGwURWS+D1zTqehRj
         uIw/2vjQREYcknw41FoZZpbPn8gM9qOv4R+u9LnDOzbDK49qplQnJCkXZrSQWGtcIVFy
         KV6p+yC6j0z76I/pjFYC3uwjWMWqd3Sg+Dz1WYk3N3Z2ldxsW2kbrbArNpTpTNF3CDpX
         TB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ds6CBuPGXPN8cM3I5FgjrvhnR3q6X/DE2v9ncJJpvWQ=;
        b=VixLh44twVsIOa2B+msr1A3pC03A+7MnDrE09Hqk1G9E0X/D10XgK8RWnTWsR1zoVK
         bYf3ZTEWDwqLm4IuRXlMLj5qupTIfanG1IsfpVrhyKvNqLP6AsXAZ+VBRzVklPV3485b
         +PysqZR/njPxwxJFzdhF2P0QGUKVa5K6nOtUI2R+6nd5WiyjxqK7B98Hse2VznhZePfm
         MK7vos0dP6X76U9vNfAUfYLlgAw5tA9CUrn7P1JUzcwn4izQKp2eYOWzjVITpXjTky7D
         ehsoqVPm1585p+6lwfKuBbRJSIlnXmTyKtpIFcdIEWSwUdWxqqLEMgaqP9aOeNLIbpXk
         QTFQ==
X-Gm-Message-State: APjAAAUBn19EjZZSAE0JM1AXoZUf1Rpr+RYWzhWXrEhy/tiLuV/QeBa/
        Fd+lG6MxanuK1oiMbL0wwrA=
X-Google-Smtp-Source: APXvYqzbKhM97VlX89f6VmiXv4xNItKSQEa5jHwCHlrzMWfpjFSyuftqitK6s7DvVz8eHY3lBX19Qg==
X-Received: by 2002:a2e:6c0e:: with SMTP id h14mr12447567ljc.92.1570892315846;
        Sat, 12 Oct 2019 07:58:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:540:3f08:6700:a54a:5215:2ca7:fec9])
        by smtp.gmail.com with ESMTPSA id t4sm2599764lji.40.2019.10.12.07.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2019 07:58:35 -0700 (PDT)
From:   nikitos.tr@gmail.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan@gerhold.net,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 2/2] arm64: dts: msm8916-longcheer-l8150: Add Volume buttons
Date:   Sat, 12 Oct 2019 19:58:21 +0500
Message-Id: <20191012145821.20846-2-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191012145821.20846-1-nikitos.tr@gmail.com>
References: <20191012145821.20846-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

Add nodes for Volume UP button connected to GPIO and Volume DOWN button,
which is handled by the pm8916 as is common with msm8916 devices.

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index e4d467e7dedb..d1ccb9472c8b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -5,6 +5,7 @@
 #include "msm8916.dtsi"
 #include "pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Longcheer L8150";
@@ -113,9 +114,36 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_vbus_default>;
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_default>;
+
+		label = "GPIO Buttons";
+
+		volume-up {
+			label = "Volume Up";
+			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
 };
 
 &msmgpio {
+	gpio_keys_default: gpio_keys_default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio107";
+		};
+		pinconf {
+			pins = "gpio107";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	usb_vbus_default: usb-vbus-default {
 		pinmux {
 			function = "gpio";
@@ -128,6 +156,19 @@
 	};
 };
 
+&spmi_bus {
+	pm8916@0 {
+		pon@800 {
+			volume-down {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				bias-pull-up;
+				linux,code = <KEY_VOLUMEDOWN>;
+			};
+		};
+	};
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
-- 
2.19.1

