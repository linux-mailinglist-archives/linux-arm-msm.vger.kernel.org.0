Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83F3303443
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbhAZFVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727182AbhAYJrr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 04:47:47 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE5EC06174A;
        Mon, 25 Jan 2021 01:47:27 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id u14so10121459wmq.4;
        Mon, 25 Jan 2021 01:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=B+TvUBR4F7qwpXaxM7BOb6i7WPhpcifu1ieFC/m280w=;
        b=NpAlLEnnFQO/egJf0teABmtLY0tYXbVxOCE0f2ARR7GrOvA0y3ldkHMrFIorWa4hjY
         QL5TC82p4VDJzXWiw0MS6V2KsLUM/y8YpgisO12rmokoVqfFEsIXjQuqnbboGDyf5OoP
         b3Qc3BuWvP3RoWqdHQrBytVfPntkdOUWnzw98x6oKgl6K3va6I/Uawj4ShS2cp7qXghl
         OEB7xkgzdDJq9q5ZUpE30AcD04xwik7tkLcqBO0qYFdVtQPN6mpBJuFfkgMlmO/J1JM5
         uMTBcVUBANxrIYE2SiPJ+wrw28BF0RAMz2ZkHAvM6MA2n6GItbpk1Z5xFFIXTkU/lHaY
         mqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=B+TvUBR4F7qwpXaxM7BOb6i7WPhpcifu1ieFC/m280w=;
        b=L3ZUZIum1McsTZlp1JmB4Ozu8s/2fBAbv0p1rfvAiLnRZ5LBJLyZpq7ye2v6e2c4We
         1vnyA8IOkesyK0YuRJuPJpV8HOMLzpVZu0XO7RJVm3e7MwE2XBjXWandEyspLTHX7UPl
         Fstks/kIosmjIlVyUdWRvYKLlE2B8W8+6nponXg6QAT4f6qf1Dae/DlzhU8KL6Qwtho3
         AkpL+RhmSSaq0oKMLcnVtsoPBh/VswxoPu4YAEjR7dqzLhZvqgC5AHuUoLph7hdxSFpY
         lgTwq0L0FaodGK0h+ZOfOJ0pZMdgM/NjYJ64MV7Ll9UEdijBLYqf4/FdVmO64DaWCiYh
         hPlQ==
X-Gm-Message-State: AOAM531MnkKlA8MbVumRFqL4xBUT1FDfg35JyLv8XGhUHnZK5/HUB+ON
        B9/KtOnFfQ4fgux77haAjcq28USOIwY=
X-Google-Smtp-Source: ABdhPJxwOgzRO2LRzg4hgbYCV3I3MTgNqxlNi5sJ3TNssmvgKKgFfqvu54+tu53gd10WGUEjbQTd9Q==
X-Received: by 2002:a1c:e043:: with SMTP id x64mr696120wmg.48.1611568046155;
        Mon, 25 Jan 2021 01:47:26 -0800 (PST)
Received: from jonathan-N53SV.station ([151.81.101.204])
        by smtp.googlemail.com with ESMTPSA id u5sm22154052wmg.9.2021.01.25.01.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 01:47:25 -0800 (PST)
From:   Jonathan Albrieux <jonathan.albrieux@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, stephan@gerhold.net,
        phone-devel@vger.kernel.org,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: qcom: msm8916: Add blsp_i2c3
Date:   Mon, 25 Jan 2021 10:44:31 +0100
Message-Id: <20210125094435.7528-3-jonathan.albrieux@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210125094435.7528-1-jonathan.albrieux@gmail.com>
References: <20210125094435.7528-1-jonathan.albrieux@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 has another I2C QUP controller that can be enabled on
GPIO 10 and 11.

Add blsp_i2c3 to msm8916.dtsi and disable it by default.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi      | 15 +++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 4dc437f13fa5..7dedb91b9930 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -220,6 +220,22 @@
 		bias-disable;
 	};
 
+	i2c3_default: i2c3-default {
+		pins = "gpio10", "gpio11";
+		function = "blsp_i2c3";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	i2c3_sleep: i2c3-sleep {
+		pins = "gpio10", "gpio11";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	i2c4_default: i2c4-default {
 		pins = "gpio14", "gpio15";
 		function = "blsp_i2c4";
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 402e891a84ab..1045d7e518f3 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1528,6 +1528,21 @@
 			status = "disabled";
 		};
 
+		blsp_i2c3: i2c@78b7000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b7000 0x500>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c3_default>;
+			pinctrl-1 = <&i2c3_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp_spi3: spi@78b7000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b7000 0x500>;
-- 
2.17.1

