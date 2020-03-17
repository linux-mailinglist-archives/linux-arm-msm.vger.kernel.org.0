Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2DEC18869D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 14:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgCQN6Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 09:58:16 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35948 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgCQN54 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 09:57:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id s5so25860877wrg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7ZsSBUhejcW1WENgNkFbYtvh60PcoS0PtZmGJlxadU=;
        b=Qu8Ps6Q87cbQkhFKxkNsAmQdAElXSe+ZGHs0h7urUZ76bgNkrTvzwwas3mBUVeKoBo
         jsbWik9YedB5fjdzozCPLze7QaOfOxfbjFTC5P7Pme/y0ngwDSADLzeX0lj4vAE+rtDh
         My88mJq0n/MSGE6vZ25+Ug6dpnrJGq7XtV27+2JdzxB5VCJx2fnRodufZ3P/lJq2rZ0A
         g0yGWLZAych/XHYX/BQBnZgrXB3jhyaabqqsjTkezMquF2MfINpTDDOFW6u9/2oBcpHv
         ImAD3QOcSFUdOzbkMyrXdxUQYpEVLWW78xctBP3Kd90tK8mhgRaYirAjFiHsRF+f8F0p
         yGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7ZsSBUhejcW1WENgNkFbYtvh60PcoS0PtZmGJlxadU=;
        b=G1Xy0jI/BvrElXINC7XIm9hnPq96ahxHYvkIKOEuDTnjnkIsgK655LeJqMfWA252Xq
         7xJs+aQ9IlBhna42/RcqpsuMLKNWSdwNSGviND4nVAy/t50CrwFHzmVigQnbtp5H1hqR
         akeuNN7zGZlbTvOHMkJLrpRiR/OTraChG2Xd1sqVn8Aj01K8WG7SxxcQ/4FNrxaqlhIE
         jPqwHXnWYS8dwsFxNcJIkDPbwyUFg+6AUjImRn+pPFGZPVski8Rx+nwn/w5M64LwQI+u
         lpCpYibYfv48QfjgnX9Xu9cxFd616RaLpEdtp1/ftL42dOtbBv+8Obcktquus5Uv6838
         lntA==
X-Gm-Message-State: ANhLgQ2v3mioAMRDcjl7w+OtGyEG+Bd/wJMh0OgeoIKK7TogrgYSCHEH
        ePbnqNeUYewRBDaIoqyiIJCBcw==
X-Google-Smtp-Source: ADFU+vtui492H+miaWTyfRzOCSzn/SzVawYdAfgXp6SNtzgRBoH32Npb5uwL2TWiiuaM5Q+QdEJ4vw==
X-Received: by 2002:adf:fdc6:: with SMTP id i6mr6204937wrs.414.1584453473419;
        Tue, 17 Mar 2020 06:57:53 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:84f7:5c25:a9d8:81a1])
        by smtp.gmail.com with ESMTPSA id r3sm2976558wrn.35.2020.03.17.06.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 06:57:52 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, maxime@cerno.tech,
        Anson.Huang@nxp.com, dinguyen@kernel.org, leonard.crestez@nxp.com,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v2 2/6] arm64: dts: apq8016-sbc: Add CCI/Sensor nodes
Date:   Tue, 17 Mar 2020 14:57:36 +0100
Message-Id: <20200317135740.19412-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317135740.19412-1-robert.foss@linaro.org>
References: <20200317135740.19412-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

Add cci device to msm8916.dtsi.
Add default 96boards camera node for db410c (apq8016-sbc).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
 - Reference CCI by label
 - Don't use generic node names
 - Move regulator nodes out of /soc
 - Use CCI label and move node out of /soc
 - Use reference for camss and move node out of /soc
 - Use reference for cci-i2c0 and move out of /cci
 - Disable camera_read by default, since no mezzanine board is guaranteed


 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 76 +++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 037e26b3f8d5..d98c7e9e6eb9 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -51,6 +51,30 @@
 		stdout-path = "serial0";
 	};
 
+	camera_vdddo_1v8: camera_vdddo_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vdddo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	camera_vdda_2v8: camera_vdda_2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vdda";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+
+	camera_vddd_1v5: camera_vddd_1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vddd";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
 	reserved-memory {
 		ramoops@bff00000{
 			compatible = "ramoops";
@@ -538,6 +562,58 @@
 	};
 };
 
+&camss {
+	status = "ok";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				clock-lanes = <1>;
+				data-lanes = <0 2>;
+				remote-endpoint = <&ov5640_ep>;
+				status = "okay";
+			};
+		};
+	};
+};
+
+&cci {
+	status = "ok";
+};
+
+&cci_i2c0 {
+	camera_rear@3b {
+		compatible = "ovti,ov5640";
+		reg = <0x3b>;
+
+		enable-gpios = <&msmgpio 34 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_rear_default>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		clock-names = "xclk";
+		clock-frequency = <23880000>;
+
+		vdddo-supply = <&camera_vdddo_1v8>;
+		vdda-supply = <&camera_vdda_2v8>;
+		vddd-supply = <&camera_vddd_1v5>;
+
+		/* No camera mezzanine by default */
+		status = "disabled";
+
+		port {
+			ov5640_ep: endpoint {
+				clock-lanes = <1>;
+				data-lanes = <0 2>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8916_0: pm8916@0 {
 		pon@800 {
-- 
2.20.1

