Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB584DF2CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 18:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbfJUQT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 12:19:27 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32844 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbfJUQT1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 12:19:27 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so8747402pfl.0;
        Mon, 21 Oct 2019 09:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=AgWxQZ4IRPSf/JSyL7KFHJ9TZsqQvDPEhQEh1ZQRUDQ=;
        b=rjH1nOVBojzK7QWfyvjn93+LwnUwjxD8+skcPRcpmQABarnJwzX+5V8tuD2yMcnIlz
         nXhYsc4lD/L9RADStlvoSLLPTd+cjZLtrDxZKZO8YZtqWb677JtiEx4VVyuWqFCriReH
         4WERLTW+eyrQgENLfCkdJgBV0vWRFkLfEpASNa2M867u8hYlWFm8+dUUHH9pVI2rWLNb
         3EkiAyou05Od1F2/QrVHDSb/jBCzz9VbiZsIgNtQ8uN3g4vKPLRJp6vJO4pR9npz2s6X
         X9sKrAyNQ2UfYFwVjLe0y4IB9Rh6u9SANYFpPhnEGyc8fzHNRSv5IxCgpLlYgF+p6+WX
         o0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AgWxQZ4IRPSf/JSyL7KFHJ9TZsqQvDPEhQEh1ZQRUDQ=;
        b=pgduNenjA2Q7JcsTDVLVlyYKedbECbMAd0wlk6AEsTt9bcuEmrU+7JitntjA3KIq7k
         60f4Qj7YN66EN8RRMPnS6KGC2mvo5Uix/KR/9VMRN2MVfb1rBt7p4+ZvbwfPS8xeNSkD
         ejr99v8D2pAO4Ja2Hi0NDY+ZJhgIK0OI3PNfS0Dk1XTz/9Dz1FVvO8Q0pgYR6GE2aY1D
         GUlLDRxquPMdd915RShCI8+1lbbXn4+xZZ2/QAHutLakHXA2b/oIjlLxfBP36biWe1qX
         jXuwkulbMyIGpe+dLgGWRm9LqtvToAKXWXFT2YMY72usbsGmcXUC4shsJdEH3QuRLT8m
         REGg==
X-Gm-Message-State: APjAAAVqas8+8T6S6VFXyxje83QApKoOR2jkJ4xhGq9G0piY6KkuW6E9
        Y1bGAchuLdz6zJykCHNupsM=
X-Google-Smtp-Source: APXvYqw2sHxzn7oi3MiuOQLkIH028DJIoUhE0XD2KPyTv1Jn6Nd0eE4QisN+GqNllmIie6wDBtjMGQ==
X-Received: by 2002:aa7:9295:: with SMTP id j21mr24419567pfa.223.1571674766043;
        Mon, 21 Oct 2019 09:19:26 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id b3sm16720415pfd.125.2019.10.21.09.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 09:19:25 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2] arm64: dts: qcom: msm8998: Fixup uart3 gpio config for bluetooth
Date:   Mon, 21 Oct 2019 09:19:21 -0700
Message-Id: <20191021161921.31825-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It turns out that the wcn3990 can float the gpio lines during bootup, etc
which will result in the uart core thinking there is incoming data.  This
results in the bluetooth stack getting garbage.  By applying a bias to
match what wcn3990 would drive, the issue is corrected.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---

v2:
-split out pinctrl config by pin

 .../boot/dts/qcom/msm8998-clamshell.dtsi      | 22 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     | 22 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi    | 25 ++++++++++++++++---
 3 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
index 38a1c2ba5e83..8c9a3e0f3843 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
@@ -37,6 +37,28 @@
 	};
 };
 
+&blsp1_uart3_on {
+	rx {
+		/delete-property/ bias-disable;
+		/*
+		 * Configure a pull-up on 45 (RX). This is needed to
+		 * avoid garbage data when the TX pin of the Bluetooth
+		 * module is in tri-state (module powered off or not
+		 * driving the signal yet).
+		 */
+		bias-pull-up;
+	};
+
+	cts {
+		/delete-property/ bias-disable;
+		/*
+		 * Configure a pull-down on 47 (CTS) to match the pull
+		 * of the Bluetooth module.
+		 */
+		bias-pull-down;
+	};
+};
+
 &qusb2phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 8adb4969baec..74c14f50b0f6 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -37,6 +37,28 @@
 	};
 };
 
+&blsp1_uart3_on {
+	rx {
+		/delete-property/ bias-disable;
+		/*
+		 * Configure a pull-up on 45 (RX). This is needed to
+		 * avoid garbage data when the TX pin of the Bluetooth
+		 * module is in tri-state (module powered off or not
+		 * driving the signal yet).
+		 */
+		bias-pull-up;
+	};
+
+	cts {
+		/delete-property/ bias-disable;
+		/*
+		 * Configure a pull-down on 47 (CTS) to match the pull
+		 * of the Bluetooth module.
+		 */
+		bias-pull-down;
+	};
+};
+
 &blsp2_uart1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
index e32d3ab395ea..7c222cbf19d9 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
@@ -77,13 +77,30 @@
 	};
 
 	blsp1_uart3_on: blsp1_uart3_on {
-		mux {
-			pins = "gpio45", "gpio46", "gpio47", "gpio48";
+		tx {
+			pins = "gpio45";
 			function = "blsp_uart3_a";
+			drive-strength = <2>;
+			bias-disable;
 		};
 
-		config {
-			pins = "gpio45", "gpio46", "gpio47", "gpio48";
+		rx {
+			pins = "gpio46";
+			function = "blsp_uart3_a";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		cts {
+			pins = "gpio47";
+			function = "blsp_uart3_a";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rfr {
+			pins = "gpio48";
+			function = "blsp_uart3_a";
 			drive-strength = <2>;
 			bias-disable;
 		};
-- 
2.17.1

