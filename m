Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8DE42A341
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 13:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236194AbhJLLaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 07:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236032AbhJLLaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 07:30:20 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE182C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 04:28:18 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ls18-20020a17090b351200b001a00250584aso1625568pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 04:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3W0MRmDdiqWubbhoMPOW8kG4qdU5F7NyfuJwW8aFoGM=;
        b=aoeCBghZnpbUz15C+ZSHBmksvoX3AkGNIFmqgXq9SVvr+oJfWGzFUGO5aApC3ICNYd
         5F8jrHf1rE5yDKn0aMGzD4+2eGjBhTAHpZcC5gDeWbMmb9nZT+VeeL3Rv/keErAPAI9O
         T5nrVMf4uHu4nYWsSh044Q67g++y53clOmbptPQao6+3j/HihDHagSjt0a0XQ8B2IMAZ
         z1opLw45E8ZPr+IRBlrb+EplD11gg2YZRCGuhDShmJxzohYnnROtTLSR/Uk8xtl6sMA7
         Tkw0gEcI/UrUh8AYtcy3LLcaR/fJBqoYIrjjdK7BcBKumLVRXv7EXk7aZwSBatWlq4T8
         /gGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3W0MRmDdiqWubbhoMPOW8kG4qdU5F7NyfuJwW8aFoGM=;
        b=puPYH2E9mpj33F3BB5WX8cg+exx9gdrLK7hXD3vWlP1XfFXhe4Y83HhsEwSMuLpRFZ
         JdfHootQO0wzhyiixT7v4BLnIALOdRhuPzq8zC8yxRnTt6pmHkOR+UpHwB6a9zzoCcLS
         Xj5rSy0ZxOQDeCkb27F56QTjZmVB9lcI4sqUlcehHBpDQwP7JqGjZzwr5vv1yQDGA3m8
         E44uDHDXzKVhzOh0LPgaQEg6wOKXXs9mbHEzzvxZrLAYf0SG90ydESKADRv62A3QhSmg
         O9uvtrFyYeR6+WoFootJQgcsY+6O5OjFe8j0KyMtICmGL7CiuTuiL8dGzgX9q4t/+CEd
         CSJA==
X-Gm-Message-State: AOAM533lSSlOsHJCLVtpfFMaeqxzilLfNN+BQuoWW9X8ZL4YVNMUqZZH
        ruuSoBcMJJD27hzSxwW61j0=
X-Google-Smtp-Source: ABdhPJxTmwhElF4h9jqr4Y5h1RmU5mOF3thQxE+YjxRram5mUbp9qsxCArXCUFCcYCbPJrMlpSSTNQ==
X-Received: by 2002:a17:90a:fb87:: with SMTP id cp7mr5359474pjb.114.1634038098359;
        Tue, 12 Oct 2021 04:28:18 -0700 (PDT)
Received: from localhost.localdomain ([117.242.199.204])
        by smtp.googlemail.com with ESMTPSA id z11sm2590359pjn.12.2021.10.12.04.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 04:28:18 -0700 (PDT)
From:   "J.R. Divya Antony" <d.antony.jr@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org,
        "J.R. Divya Antony" <d.antony.jr@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: msm8916-asus-z00l: Add SDCard
Date:   Tue, 12 Oct 2021 16:57:34 +0530
Message-Id: <20211012112735.2765-2-d.antony.jr@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012112735.2765-1-d.antony.jr@gmail.com>
References: <20211012112735.2765-1-d.antony.jr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable SDHCI (SD Card) Storage.

Signed-off-by: J.R. Divya Antony <d.antony.jr@gmail.com>
---
 .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
index 71f4aa16058f..355c95365fcd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -42,6 +42,21 @@ volume-down {
 		};
 	};
 
+	reg_sd_vmmc: regulator-sdcard-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "sdcard-vmmc";
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpio = <&msmgpio 87 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		startup-delay-us = <200>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd_vmmc_en_default>;
+	};
+
 	usb_id: usb-id {
 		compatible = "linux,extcon-usb-gpio";
 		id-gpios = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
@@ -89,6 +104,16 @@ &sdhc_1 {
 	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
 };
 
+&sdhc_2 {
+	status = "okay";
+	vmmc-supply = <&reg_sd_vmmc>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+};
+
 &usb {
 	status = "okay";
 	extcon = <&usb_id>, <&usb_id>;
@@ -210,6 +235,14 @@ gpio_keys_default: gpio-keys-default {
 		bias-pull-up;
 	};
 
+	sd_vmmc_en_default: sd-vmmc-en-default {
+		pins = "gpio87";
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
2.33.0

