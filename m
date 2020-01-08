Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E37AB134276
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 13:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbgAHM43 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 07:56:29 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35298 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbgAHM41 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 07:56:27 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so2411405wmb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2020 04:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ew1hz14XJ1Dpt7wqzV49Fz4wnBuxCyRMUnILoU48lls=;
        b=gxypxAsrA7ptvZE2WNq/4Gvs+ShKj4YOKRQ8w14R1Z6OMietrucCnBNzKTCZtyEQ0A
         TzuNqzF5b6KNoNDoJ1ClCbR2cseQL5T3zXt3ooqStSjf65XrkdpzT4evxeVZNthHmMlO
         S6aePC/A0TfH0U4cWVPihY12e9/tKFQEH6SEclrIyskOld7lgOL2FfyzRsCVRv0uun32
         1be1SrNjFiVA3JM6tEz9rcmsh7HC41PV1r/141jT5PDy6ID468hBWrBCrOQMQe1ZUBUU
         4KEJ1s+9u3S4UdeXCvBdjXLlnd0581gRk3Eu1tW1OLs5QbAF5tsF0ikj5TBCi9hKd7/X
         Aoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ew1hz14XJ1Dpt7wqzV49Fz4wnBuxCyRMUnILoU48lls=;
        b=JzBMSRHPgp4Q4BFTXk0jbbJQhvM1LseMpMQaNiyPzwid8KPhT1cwrWZG3BaeXPo9+I
         mRpP83n8yaUDm8VAE8wW1jah8VcWa6Dg3uokAGaLQQxBYXycQd4FQyKCxHDbac455znp
         Y52unS3sVz9JkL88v9Q0NMXJTjnstvaJ1nvPmuI9UXFpUHzkJHd/MGjfMuw+5IQ211JM
         2X0KoNRaikLyNSqwYcpOX/1T7tK5rLzb9bkz7p7GXuCwHbutXQws8MNTnVk961o8AKva
         ODiACgQvric4IEpZC2BANy7vi8gCuyUQ1v7NtaQ6qG5gRtJXTC5FGFIBssOo5+pD8G8b
         PgpQ==
X-Gm-Message-State: APjAAAW5DNewyNjR6T95XXYFbT66yvijFL3GW2DfBUUOywk5/uendCEI
        MW4eysg6P+Ypv7Tmzw7LtET5cQ==
X-Google-Smtp-Source: APXvYqwiysuJ7YPCjw5v19f+VxUh6uIylHpXDzD6fU9bVJY3KzMo1iKtdkQvEY457UMon5Y8mLS6qw==
X-Received: by 2002:a1c:9d52:: with SMTP id g79mr3783156wme.148.1578488185459;
        Wed, 08 Jan 2020 04:56:25 -0800 (PST)
Received: from localhost.localdomain (93-143-224-199.adsl.net.t-com.hr. [93.143.224.199])
        by smtp.googlemail.com with ESMTPSA id k7sm3598475wmi.19.2020.01.08.04.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 04:56:25 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        Sven Eckelmann <sven.eckelmann@openmesh.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 2/2] ARM64: dts: qcom: add gpio-ranges property
Date:   Wed,  8 Jan 2020 13:54:57 +0100
Message-Id: <20200108125455.308969-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108125455.308969-1-robert.marko@sartura.hr>
References: <20200108125455.308969-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Christian Lamparter <chunkeey@gmail.com>

This patch adds the gpio-ranges property to almost all of
the Qualcomm ARM platforms that utilize the pinctrl-msm
framework.

The gpio-ranges property is part of the gpiolib subsystem.
As a result, the binding text is available in section
"2.1 gpio- and pin-controller interaction" of
Documentation/devicetree/bindings/gpio/gpio.txt

For more information please see the patch titled:
"pinctrl: msm: fix gpio-hog related boot issues" from
this series.

Reported-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
Tested-by: Sven Eckelmann <sven.eckelmann@openmesh.com> [ipq4019]
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Tested-by: Robert Marko <robert.marko@sartura.hr> [ipq4019]
Cc: Luka Perkov <luka.perkov@sartura.hr>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes since v1:
- Split ARM and ARM64 DTS changes into separate patches

 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 67ee5f560104..2b31823d3ccd 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -21,6 +21,7 @@
 			reg = <0x1000000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 70>;
 			#gpio-cells = <0x2>;
 			interrupt-controller;
 			#interrupt-cells = <0x2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5ea9fb8f2f87..2d1cbe762b3a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -374,6 +374,7 @@
 			reg = <0x1000000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 122>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 8be60c08a9ab..2021795c99ad 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -171,6 +171,7 @@
 			reg = <0xfd510000 0x4000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 146>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 3932757f78b7..b1c2d7d6a0f2 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -133,6 +133,7 @@
 			reg = <0xfd510000 0x4000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 146>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 87f4d9c1b0d4..81576aeb2408 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1234,6 +1234,7 @@
 			reg = <0x01010000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 150>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.24.1

