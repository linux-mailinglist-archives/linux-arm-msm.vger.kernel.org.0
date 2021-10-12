Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35CA042A344
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 13:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236241AbhJLLaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 07:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236163AbhJLLaY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 07:30:24 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20EFC061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 04:28:22 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 66so13591908pgc.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 04:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qhipc2uqrDV7pL14AUr+hv451VyVX0mbXieS81Ux/AM=;
        b=ESFQHPbLnz7WBttsIVSD9T49VI+cIBIaeXeLOedpa/HvYjpvBw6XSTfCB5K3XOAKQG
         SWTj5GVAHfgHrykPAZS0lYODTp7g1GwffydInccU5cRGK5hH2gDi3HSe82db+3wY063I
         /iIw1S9OBmc/xJpVhv+vExE+3Yia6iH9Si926ffLuk/5n+dhwEtslHwM0NTWIFHUIGMw
         LXLnI2IFhX3AnAqnoPZ2Xdfip5OXp3VnP5ZPnJ0TU42fkx8D4ZBmJaYNykimRNFU3ox0
         I+G/gp8GBPKJdMRoK6/s4rwgrsICyKREBMERvQybKlt+zsXUUsg1/TV6jK03gW4CPDz7
         9Y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qhipc2uqrDV7pL14AUr+hv451VyVX0mbXieS81Ux/AM=;
        b=akWLtb3jHeL6szSIVJTpFNS3d6pXYgMOgpJrVp9ivo1jgGRDQvNVrWd1CmuIgeHTrI
         ZSXiPc+hqRb+5SQ6V0eTuRxP861KPePDGdmSZA4rZSQNVI5d18KXL+PYTfxRBo4JHMHU
         gUtKsSeivgIGYF5lU5PweVXo3J3VonA2VHdDI30eddIBEiF4pl5Vnz/Ig/+yNbxczADG
         fDbqa3mMxfUJYDTy8L0y3aH1qt18PPVyzVaLKy2D/ozglcUEjT8LJGmJxizANOqnzp7B
         pApYTmNVEy4pujE8pHwdfKNmlNblaK0sdiv6G+5/WQ7ohrrYVvQT8kl+n7AoDOGqSaBo
         /pZw==
X-Gm-Message-State: AOAM531AakvcESn1cB4EGqjwMzD4kHfjlOUT6GUzeqDtIpmp+5UU+R1P
        X8xTLS9c3N+T9TROMIawo5w=
X-Google-Smtp-Source: ABdhPJwWkF8neEb/YOtzIwLiKqsFOgj8nizhai+/yq8eHfMTBK1EIkyUR8Bcz1XRgYG+liM5VhUQgQ==
X-Received: by 2002:a62:6543:0:b0:44c:61a0:555a with SMTP id z64-20020a626543000000b0044c61a0555amr30628767pfb.14.1634038102347;
        Tue, 12 Oct 2021 04:28:22 -0700 (PDT)
Received: from localhost.localdomain ([117.242.199.204])
        by smtp.googlemail.com with ESMTPSA id z11sm2590359pjn.12.2021.10.12.04.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 04:28:22 -0700 (PDT)
From:   "J.R. Divya Antony" <d.antony.jr@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org,
        "J.R. Divya Antony" <d.antony.jr@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8916-asus-z00l: Add sensors
Date:   Tue, 12 Oct 2021 16:57:35 +0530
Message-Id: <20211012112735.2765-3-d.antony.jr@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012112735.2765-1-d.antony.jr@gmail.com>
References: <20211012112735.2765-1-d.antony.jr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This device has MPU-6515 imu and Asahi Kasei AK09911 magnetometer,
Add support for it.

Signed-off-by: J.R. Divya Antony <d.antony.jr@gmail.com>
---
 .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
index 355c95365fcd..c2afda74b5b3 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -65,6 +65,41 @@ usb_id: usb-id {
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
 &blsp_i2c5 {
 	status = "okay";
 
@@ -235,6 +270,22 @@ gpio_keys_default: gpio-keys-default {
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
 	sd_vmmc_en_default: sd-vmmc-en-default {
 		pins = "gpio87";
 		function = "gpio";
-- 
2.33.0

