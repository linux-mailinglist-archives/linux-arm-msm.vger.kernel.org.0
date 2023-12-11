Return-Path: <linux-arm-msm+bounces-4234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B305E80CFE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E7EA282190
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 15:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302EE4BAA4;
	Mon, 11 Dec 2023 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qGmxqV/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54378A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:51 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50c0f6b1015so5379191e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702309489; x=1702914289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EHFkEQ27U+4FuL/p3mfN4ceRCyXdPDrWkGkrGBViEo=;
        b=qGmxqV/UqJ7kLgZQHLX3+aeNU6flulLIiS9ZPBY0MJ6Tyo5uxliJMpDe9U3hN94/ip
         sUFUgbrdo8jJeFse/+9gT52I5fDo4HSg/aYaGKaeoSoQMQwZ5jFTunyXjcox37wkQP2w
         u48PMCCB7AEbZmZ3UzoLvnJ0XSPX/RltVeT48tPb8e6tQz7inpdn52oEYE0I7iDOqzlP
         ELCZyKW3S2idiWDRDPod0G7ZutmtWjiR4nmVupfffkRRaRh8xAr/Eu+fcAm/9y3yjRyu
         u+nsXiVtyS8EyKpuwuf0UfL0XAJBhNa4w1LrFQrvKnaHHJQWxPv+iRpgMzw/aC7fMVgM
         yocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309489; x=1702914289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EHFkEQ27U+4FuL/p3mfN4ceRCyXdPDrWkGkrGBViEo=;
        b=g2+WjgdfszuyKBD2LBAxrJ0Kroulu/KIWtqu+ESlkwQcxgRI2PjjmHtSHvpzm4xU+r
         pa0ZlzHFZ9K477jOddwTxK5qACWJ8Ywqzthd2rYhCmBRefP81TyMahDouGRauy6qOBmn
         d2NgtVT2dFDSoPJm/4B8KCzDa+98fXLdJzOJ8K5ZKmRRMwXoRoB6YIJ6Ig+DPjovVb6g
         U8nwcfKa78FvVmNyj++A8rL4A1I2C+GiRERDev8YqfevzGc/sgsKGSXWUD6afBBRUR+g
         4ut+uTZZCyIBuYdIyDO0zk6mqWueU+v3WtRTgwziBvP8e8qPgUvivqtL/gQ8GxHz/NfD
         f3zg==
X-Gm-Message-State: AOJu0YxAgCNTjQEFpl/p3fUvWDJX2N/AridLaGcA50T4InW9+Vrj/ZyA
	kH86CwrucwzqmgUWd8xIAdmCNQ==
X-Google-Smtp-Source: AGHT+IEam9fZdsdP7QrV4Gd0KMwsyDVoSVVfAV9Zjzne67TnyppEtLORztpSC/Ow1E1UoDACb0dtcA==
X-Received: by 2002:a05:6512:3e1f:b0:50d:1a14:3e79 with SMTP id i31-20020a0565123e1f00b0050d1a143e79mr2363359lfv.112.1702309489583;
        Mon, 11 Dec 2023 07:44:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:44:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/8] arm64: dts: qcom: sm8150-hdk: enable HDMI output
Date: Mon, 11 Dec 2023 18:44:40 +0300
Message-Id: <20231211154445.3666732-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DSI outputs and link them to the onboard Lontium LT9611 DSI-to-HDMI
bridge, enabling HDMI output on this board. While adding the display
resources, also drop the headless ("amd,imageon") compat string from the
GPU node, since the board now has output.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 128 +++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index bb161b536da4..6a036f9ba1c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -54,6 +54,17 @@ key-vol-up {
 			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -359,12 +370,112 @@ &gmu {
 	status = "okay";
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
-	/*
-	 * NOTE: "amd,imageon" makes Adreno start in headless mode, remove it
-	 * after display support is added on this board.
-	 */
-	compatible = "qcom,adreno-640.1", "qcom,adreno", "amd,imageon";
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	lt9611_codec: hdmi-bridge@3b {
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		#sound-dai-cells = <1>;
+
+		interrupts-extended = <&tlmm 9 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4a_1p8>;
+		vcc-supply = <&vreg_bob>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt9611_b: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5a_0p875>;
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	qcom,dual-dsi-mode;
+
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+
+	status = "okay";
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_b>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l5a_0p875>;
 	status = "okay";
 };
 
@@ -402,6 +513,13 @@ &remoteproc_slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <126 4>;
+
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio9";
+		function = "gpio";
+		bias-disable;
+	};
+
 };
 
 &uart2 {
-- 
2.39.2


