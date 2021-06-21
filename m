Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03BE3AF88B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 00:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbhFUWeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 18:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbhFUWeK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 18:34:10 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81720C0611C0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 15:31:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t17so12530672lfq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 15:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6CNpdcs1A6Q97e0oT9ww9wqzNC5IQArK/FZR7yxSl3Q=;
        b=Yb6TbXKOmrz4ik8ZOHs5A5XBs/DumXbi/piHmfu4F6taHqLktXZ23ufzbl5R2xUvuI
         bbFWP6u8lvtFl5BQPtJKSDrUN+tXCWaULLkACjOWYoKYiD+b5nXWqiPz/EEySRYHf8vb
         1MPdLXmHA9IHuYpJHIoEpP3abBeh2NdEHp3e9vs9q8g04vH+YNPagCVd9C7zxh81lHNs
         IGd5wfJ18zOeNytbtygNpSLVNmT7mEP5w38StMYaGH4FGDYonQyRo1jv+ukp6t7u6XO9
         j98Vq0syVYhH9XX9rlNtuYDD431x3lhrGyw4qnsPCAShK18DLGicrmM/pBzjX9W8PJ3Y
         djdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6CNpdcs1A6Q97e0oT9ww9wqzNC5IQArK/FZR7yxSl3Q=;
        b=knqxx5V/tpG4SAP0pAMWBx6UUDj1yE4ZOJsKq8BJpM+8yCzR8fi/EDEejAnxtSf9F2
         97dbj12oZIK8tcnF89rlqZ68Av/vRyx2icOq0qROQpSmUTt0Jh1sRafh6cz2QhjfHQui
         3IBt3pXgfGnT2hMJkEWsvsE4pgsqeuGn8J/d/Ftx0u08FKyWj5sJqX7xVCLCVL5ZGpjV
         ljNaanNg+psmm+0q9oi+7UZcKBa+SE7dyQJFJU688ebAjqbpZLvnQOnQaq0PdjXq5czG
         o2e+PBAQH3ftSkLLnQCnDvAaxQK2tD9XJ8ZS/NOGyRTaXrsGqgmnX2J26CeqfNOdC3li
         sfjw==
X-Gm-Message-State: AOAM531ycJE0RYJ6IugXZNIzt5Z7N2FlI6fJtaPrgxt7hy7OR0HhVSTI
        kCx0CD1FkIq18hz+5/A21GCZYw==
X-Google-Smtp-Source: ABdhPJwTFKSbeUTuMEj4DnuloUpJ21c6vHK4ANx0ppM/zd6NzQF+6R8ZQwFFhxJHw335M78DjZvF8A==
X-Received: by 2002:ac2:533c:: with SMTP id f28mr419456lfh.268.1624314709764;
        Mon, 21 Jun 2021 15:31:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b10sm2516025ljf.72.2021.06.21.15.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 15:31:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 7/7] arm64: dts: qcom: qrb5165-rb5: add QCA6391 WiFi+BT SoC
Date:   Tue, 22 Jun 2021 01:31:41 +0300
Message-Id: <20210621223141.1638189-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Describe the onboard WiFi+BT SoC QCA6391. It is connected to uart6 to
provide Bluetooth functionality (QCA) and to PCIe to provide WiFi
(ath11k). A separate power sequencer device node is used to describe
on-SoC power management unit common to both WiFi and BT parts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 5f41de20aa22..f968208b1947 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -20,6 +20,7 @@ / {
 
 	aliases {
 		serial0 = &uart12;
+		serial1 = &uart6;
 		sdhc2 = &sdhc_2;
 	};
 
@@ -223,6 +224,28 @@ vreg_s4a_1p8: vreg-s4a-1p8 {
 		regulator-max-microvolt = <1800000>;
 		regulator-always-on;
 	};
+
+	qca6391: qca6391 {
+		compatible = "qcom,qca6390";
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s2f_0p95>;
+		vddrfa1-supply = <&vreg_s2f_0p95>;
+		vddrfa2-supply = <&vreg_s8c_1p3>;
+		vddrfa3-supply = <&vreg_s5a_1p9>;
+		vddpcie1-supply = <&vreg_s8c_1p3>;
+		vddpcie2-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+	};
+
+	vreg_wlan: vreg-wlan {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-wlan";
+
+		vin-supply = <&qca6391>;
+		gpio = <&tlmm 20 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+	};
 };
 
 &adsp {
@@ -668,6 +691,8 @@ &pcie0 {
 	wake-gpio = <&tlmm 81 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
+
+	vddpe-3v3-supply = <&vreg_wlan>;
 };
 
 &pcie0_phy {
@@ -811,6 +836,26 @@ lt9611_rst_pin: lt9611-rst-pin {
 	};
 };
 
+&qup_uart6_default {
+	ctsrx {
+		pins = "gpio16", "gpio19";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rts {
+		pins = "gpio17";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tx {
+		pins = "gpio18";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -1275,6 +1320,17 @@ sdc2_card_det_n: sd-card-det-n {
 	};
 };
 
+&uart6 {
+	status = "okay";
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+		vin-supply = <&qca6391>;
+		clocks = <&sleep_clk>;
+
+		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &uart12 {
 	status = "okay";
 };
-- 
2.30.2

