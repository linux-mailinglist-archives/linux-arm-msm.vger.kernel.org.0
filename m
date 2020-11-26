Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6622C56BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 15:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390011AbgKZONB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 09:13:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390144AbgKZONB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 09:13:01 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B285FC0613D4;
        Thu, 26 Nov 2020 06:12:59 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id o9so3172470ejg.1;
        Thu, 26 Nov 2020 06:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AY0reqhJ8LJfRYGSpAtGjhzLoCCsaBuOvKFqC/hE97I=;
        b=fBXC5ElqASADFI/r2xA/CpSucv/W2kAgwYSPK3lfUIiSB6jyzBhBLIa1yzexVtRT0I
         w6rifn8V4cnQSIbudonZH1aG8L0tBWne50lCi8LahzYZ/831wsHDBASbiRLJqpV+9hnE
         tIOk5wWwyeRyOsB130DJoZpsNo2A+INyElCHxQJAUxhZN7HV47rrpJjq2V1289K5fybd
         EWcaILkRwURyLGXvESICUaUI/yCB9iKrLwFfUikOrx80oIAkOn0hjzA/jIHbon/1jBqH
         WuDPbg0/x569wf/OomFwlraA1RTylqMdIrjGSykk3LEzqgx7DSE2x+oujY+FLIi0c6X6
         v9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AY0reqhJ8LJfRYGSpAtGjhzLoCCsaBuOvKFqC/hE97I=;
        b=ADu/7ml6GQx/e0oKjwAR5vo3elPUrXi/5wPVSGy/QO70RwvmXpuv142zR9mFv6xIIA
         dp55ayAZJlP/QH6KtCpFCRFSzOFuchPC2ZjoDTpPUvEEve4eLlobJajHELVUa+HqHZXl
         8Iyij+IjLR/3f6ihintAE6UsWIZO2coV0l9L2C44Y69nPL7nQvVwIEJnQ1C3EYMziHRn
         OcWJRang10owDwpvJq+VS8Zfri+Ugzdi0oy7iHp9G9y1Y/C0T4BZjiIq4oN0YA+tvuJD
         rBCWlKBZmNR1LzKdbcgQGUh9fJyKfQqpXE1NNXe0E86JR7YPSvIkmmlZ9/fjcrVSRSR2
         iv+A==
X-Gm-Message-State: AOAM530irgm/d8ujVpdhfZa12yhXTA4UBnrqcWVipySGCJodbwg7Xdk5
        FsocJog9NQVi/NNucS9X1Zs=
X-Google-Smtp-Source: ABdhPJwQ8D2xdY6pUDrtvCRzpa+vFbdwrFG1FFSgKzjU2kIrTiMF59RdJmhOIBFw47uAuzeumhkEgg==
X-Received: by 2002:a17:906:3ecf:: with SMTP id d15mr2884222ejj.297.1606399978411;
        Thu, 26 Nov 2020 06:12:58 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id c4sm3201578ejx.9.2020.11.26.06.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 06:12:57 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 1/2] ARM: dts: qcom: msm8974-klte: Add fuel gauge
Date:   Thu, 26 Nov 2020 16:11:43 +0200
Message-Id: <20201126141144.1763779-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Samsung Galaxy S5 uses a maxim17048 fuelgauge. The maxim,rcomp value
is taken from downstream kernel. Model data and temperature-based
compensation are not yet supported in the mainline driver, but the
readings seem fine nevertheless.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index b0899107f3ced..97352de913142 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -406,6 +406,16 @@ mux {
 			};
 		};
 
+		i2c12_pins: i2c12 {
+			mux {
+				pins = "gpio87", "gpio88";
+				function = "blsp_i2c12";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
 		i2c_touchkey_pins: i2c-touchkey {
 			mux {
 				pins = "gpio95", "gpio96";
@@ -666,6 +676,27 @@ max77826_buckboost: BUCKBOOST {
 			};
 		};
 	};
+
+	i2c@f9968000 {
+		status = "okay";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c12_pins>;
+
+		fuelgauge@36 {
+			compatible = "maxim,max17048";
+			reg = <0x36>;
+
+			maxim,double-soc;
+			maxim,rcomp = /bits/ 8 <0x56>;
+
+			interrupt-parent = <&pma8084_gpios>;
+			interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&fuelgauge_pin>;
+		};
+	};
 };
 
 &spmi_bus {
@@ -703,6 +734,14 @@ wlan_sleep_clk_pin: wlan-sleep-clk-pin {
 				power-source = <PMA8084_GPIO_S4>;
 				qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
 			};
+
+			fuelgauge_pin: fuelgauge-int-pin {
+				pins = "gpio21";
+				function = "normal";
+				bias-disable;
+				input-enable;
+				power-source = <PMA8084_GPIO_S4>;
+			};
 		};
 	};
 };

base-commit: 6147c83fd749d19a0d3ccc2f64d12138ab010b47
-- 
2.29.2

