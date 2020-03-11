Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5613A181816
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 13:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729287AbgCKMfK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 08:35:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39737 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729332AbgCKMfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 08:35:09 -0400
Received: by mail-wr1-f67.google.com with SMTP id r15so2396643wrx.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lNuzy8ycpqr3FLs4zmHBBSdqqrGsf8gVzDzvMcY50JI=;
        b=cwJE67DocEpbh5BKtuvUxtT+LM8kGi4/xJPmyjW8KDs6uDodbf8fgF9z7rrrE8/N4j
         Zft/9qqCBX3c8HGjIWMYzXpJMuQAOBcGnNdOl/NKj+046V4RK1e9VJ3G7sIWzIoEzkgV
         1zsB9PjEjSLpn6E9KR95nB9ZzakygZH/BxEXDiuX2XubDV1/wlo3xDfijcYP36uRpC+8
         GmsHW2AEz1p9K27im9xGCpsN+bjsPSDj/gEI+JYrp1LgLzTT2mziix5hJwi1VrTX7bA0
         OTVuac56ZI53DK/Jn/P9b6fZN/QWB66O/RmhSksbTAdegbPx/wrD6yKN/6B8eABSXEtK
         yroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lNuzy8ycpqr3FLs4zmHBBSdqqrGsf8gVzDzvMcY50JI=;
        b=Th69zd3A2G3s7/Glnih0eZqX9R/k+B0NBDEeX/adWTqlcdZUdEoQU7pmN/AAy+brrF
         8BTzl/p7sDfUYiQmrC3d8fkuNN8gKHyL+9X92WIlwGbIeT9BLj3Gj6NsjeWA9J9untr5
         6vFvSHg/MmZ/LUmhf6cb6PUnC74oy2O1YhJGO5Weoy3vC/uLpgf1WLjdxVMJkTrAjwk+
         +A5uZvcVt1rArRM+9mrlLiOWMOWfk1ukYdPXHcrlezjffwVYIPvg1/4oGwRRCO8mHnTF
         NRc+IyTHgcdqw5cRnLyeL/UrnCKpI39mqssL/6dYIhoCGCcCWsGTjDxwt5uj7gE/YHC5
         u+RQ==
X-Gm-Message-State: ANhLgQ2mOCrvXDZxLGBudaPXT2vUc2S8txEB1dLGmP9yQCMNXWehptaI
        +MBWHbCTlonSdioQFiEE3kw/oA==
X-Google-Smtp-Source: ADFU+vs4BEZokW6i2VW9147V1l12EpLto/m3bG4MOwCtWbE4q/Zuimm9URFd7dry6hdivmMrBJcGlA==
X-Received: by 2002:adf:f002:: with SMTP id j2mr4457829wro.296.1583930108514;
        Wed, 11 Mar 2020 05:35:08 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:9087:3e80:4ebc:ae7b])
        by smtp.gmail.com with ESMTPSA id m25sm7822732wml.35.2020.03.11.05.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:35:08 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, Anson.Huang@nxp.com,
        maxime@cerno.tech, leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v1 2/6] arm64: dts: apq8016-sbc: Add CCI/Sensor nodes
Date:   Wed, 11 Mar 2020 13:34:57 +0100
Message-Id: <20200311123501.18202-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311123501.18202-1-robert.foss@linaro.org>
References: <20200311123501.18202-1-robert.foss@linaro.org>
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
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 037e26b3f8d5..a3e6982f4f93 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -495,6 +495,81 @@
 		wcnss@a21b000 {
 			status = "okay";
 		};
+
+		camera_vdddo_1v8: fixedregulator@0 {
+			compatible = "regulator-fixed";
+			regulator-name = "camera_vdddo";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		camera_vdda_2v8: fixedregulator@1 {
+			compatible = "regulator-fixed";
+			regulator-name = "camera_vdda";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-always-on;
+		};
+
+		camera_vddd_1v5: fixedregulator@2 {
+			compatible = "regulator-fixed";
+			regulator-name = "camera_vddd";
+			regulator-min-microvolt = <1500000>;
+			regulator-max-microvolt = <1500000>;
+			regulator-always-on;
+		};
+
+		cci@1b0c000 {
+			status = "ok";
+			i2c-bus@0 {
+				camera_rear@3b {
+					compatible = "ovti,ov5640";
+					reg = <0x3b>;
+
+					enable-gpios = <&msmgpio 34 GPIO_ACTIVE_HIGH>;
+					reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&camera_rear_default>;
+
+					clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+					clock-names = "xclk";
+					clock-frequency = <23880000>;
+
+					vdddo-supply = <&camera_vdddo_1v8>;
+					vdda-supply = <&camera_vdda_2v8>;
+					vddd-supply = <&camera_vddd_1v5>;
+
+					/* No camera mezzanine by default */
+					status = "okay";
+
+					port {
+						ov5640_ep: endpoint {
+							clock-lanes = <1>;
+							data-lanes = <0 2>;
+							remote-endpoint = <&csiphy0_ep>;
+						};
+					};
+				};
+			};
+		};
+
+		camss@1b00000 {
+			status = "ok";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					csiphy0_ep: endpoint {
+						clock-lanes = <1>;
+						data-lanes = <0 2>;
+						remote-endpoint = <&ov5640_ep>;
+						status = "okay";
+					};
+				};
+			};
+		};
 	};
 
 	usb2513 {
-- 
2.20.1

