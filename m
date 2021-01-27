Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD2830683F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 00:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233483AbhA0Xp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 18:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234404AbhA0XnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 18:43:09 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F5DC061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 15:42:29 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b2so5188263lfq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 15:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vRO8leSSekO3Sfz/SbNOSdqjRWQsxu+wwgKrU2goNeE=;
        b=VXLMWz8vcxyE48mZKl5xJYghx98gCs0n2YyeIb6kW6IGgiZEyND9ciDc4zr9VFgPLZ
         Nq6+ZfNlgFnRHk7p30wT7QS9aAPQPNCOoOhdLFQBHFPn31PivH7iehgqVUTUq/KIElOx
         0t/mpKP14eEIjnCPP+5wBYMN5q1s6tJ1vhZjVn9g20Aiex06xwl/es54LP4EpgdQ8T1Q
         N7S6IlgoHFeecovOP+2ismNiAoLA09UAbo9bASb6+T1hRXpEeCsByrAxpBvhaDpkv0JO
         OfVGpn8s/SD0qwy3QPkQAltLBxluuBV+xv7MYxNI+RXZDrWUOeilWGf1tDz82BUOwinq
         UWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vRO8leSSekO3Sfz/SbNOSdqjRWQsxu+wwgKrU2goNeE=;
        b=CaVb784fEJAcCiZpJt4JDg8ELHdGP5gUgHnBlRqc8Vi8uIHMJiVktdSD8RsOsINt6a
         rUDdgIzyzqDHp5RyCAh60mCi9iG8zRs6O1HyyaDkdTppMC3/ENtuJ2TGbpQbGVlo54P9
         738kc2oYZQX6kkZ6Z2uMH8xAGnejfSe6z09yfiX3e9ff2wYx59nTQTF911t6AVqW32gJ
         bphbe06aLyyQ1Oqfe2xXSBmAh6X0mRugFratIBRjlbQNobbdy4j0ogQqnIObSVHg9h/J
         KUfH9qlFlgS+ExueHyUjPpSH8D4DaZa9JIJriSCwfilxk6RfzLY9m0ebZ5UBgiNVou8b
         llkw==
X-Gm-Message-State: AOAM532nyBLwkujfvcYsjtI+9QCLug/g9CFZ5ZrRfO+ZH+zz9XE5Gvzh
        NjXzO9E4IxGz9j4fFY3v5a/JgQ==
X-Google-Smtp-Source: ABdhPJwisjn8iEZtCY1ZPVGdwIh0Lm2Ru7Vu5cs9NFi7kwhN/lA/cnCs6Uc8lLqAMVkYWF8u7Tp/Yw==
X-Received: by 2002:ac2:42d1:: with SMTP id n17mr6015733lfl.76.1611790947884;
        Wed, 27 Jan 2021 15:42:27 -0800 (PST)
Received: from eriador.lan ([94.25.229.83])
        by smtp.gmail.com with ESMTPSA id f82sm939541lfd.280.2021.01.27.15.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 15:42:27 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: rb5: Enable PCIe ports and PHY
Date:   Thu, 28 Jan 2021 02:42:21 +0300
Message-Id: <20210127234221.947306-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127234221.947306-1-dmitry.baryshkov@linaro.org>
References: <20210127234221.947306-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

RB5 has 3 PCIe ports exposed to connect PCIe client devices. PCIe0 is
connected to QCA6391 chipset and others are available on the HS3
expansion connector. Hence, enable all of them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 117 +++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 24903c7ee132..8aebc3660b11 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -558,6 +558,48 @@ &mdss_mdp {
 	status = "okay";
 };
 
+&pcie0 {
+	status = "okay";
+	perst-gpio = <&tlmm 79 GPIO_ACTIVE_LOW>;
+	wake-gpio = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_default_state>;
+};
+
+&pcie0_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
+&pcie1 {
+	status = "okay";
+	perst-gpio = <&tlmm 82 GPIO_ACTIVE_LOW>;
+	wake-gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_default_state>;
+};
+
+&pcie1_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
+&pcie2 {
+	status = "okay";
+	perst-gpio = <&tlmm 85 GPIO_ACTIVE_LOW>;
+	wake-gpio = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_default_state>;
+};
+
+&pcie2_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
 &pm8150_gpios {
 	gpio-reserved-ranges = <1 1>, <3 2>, <7 1>;
 	gpio-line-names =
@@ -977,6 +1019,81 @@ lt9611_irq_pin: lt9611-irq {
 		bias-disable;
 	};
 
+	pcie0_default_state: pcie0-default {
+		clkreq {
+			pins = "gpio80";
+			function = "pci_e0";
+			bias-pull-up;
+		};
+
+		reset-n {
+			pins = "gpio79";
+			function = "gpio";
+
+			drive-strength = <2>;
+			output-low;
+			bias-pull-down;
+		};
+
+		wake-n {
+			pins = "gpio81";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default {
+		clkreq {
+			pins = "gpio83";
+			function = "pci_e1";
+			bias-pull-up;
+		};
+
+		reset-n {
+			pins = "gpio82";
+			function = "gpio";
+
+			drive-strength = <2>;
+			output-low;
+			bias-pull-down;
+		};
+
+		wake-n {
+			pins = "gpio84";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie2_default_state: pcie2-default {
+		clkreq {
+			pins = "gpio86";
+			function = "pci_e2";
+			bias-pull-up;
+		};
+
+		reset-n {
+			pins = "gpio85";
+			function = "gpio";
+
+			drive-strength = <2>;
+			output-low;
+			bias-pull-down;
+		};
+
+		wake-n {
+			pins = "gpio87";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	sdc2_default_state: sdc2-default {
 		clk {
 			pins = "sdc2_clk";
-- 
2.29.2

