Return-Path: <linux-arm-msm+bounces-75572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF8DBABDBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 09:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA133A22A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499832989B5;
	Tue, 30 Sep 2025 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iYZtEVSt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616272BE053
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759217998; cv=none; b=nCvvQhg348OU0NHK8O8qxkdF04l1YptW6YLKDceOra5ANIA4VldxwiC8KnwBVCpdOe6mIMCue0RcY5SJy92OY5U5YFjNAYhKsUxbgpbk0Uy4rnpnLO8s+zOZ95vPvA3NG+893EzFd60JI6q/oDMRcJ5GvFyRPUbvbmIGj6JdvF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759217998; c=relaxed/simple;
	bh=4u/xRvsm43ERIC9SDhDBDVZyzLfWUriP1xNe0S9I9zU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bAa2JW9QiyAbyRl7G5FLnvVuEUgTzK53x5lqa9UTw2Y9t2yfiLD4+U3WG0bMx3ERt8NcN9AQyDTUuOeNM52uRhKJLejubm9/3/YLFNl4uqb4yQfovoj0kHmDOLART4r3ifOrdO1HJXSow1PaAIj9XxJ/EFvesitV1jS5QRONR2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iYZtEVSt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so46678555e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 00:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759217995; x=1759822795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4/5+2KyLFZ3ZfJPaqaIqqrNGfnS2dbwNYpzwCpd1bQ=;
        b=iYZtEVStWhWtTfTve/5NnBpxEqgrOpco56rUNs64p4WnIZI/7a9b49tiTb/6SvANa4
         gen2OQgGTi1z8hHrEP+ncoOkCt6pf8sAVZQrf/P7s51KoLVSmC2zYNM/IpaiLxLOcqK5
         8losdHQfGKrqeKwGmpFL0wmWGOtV/dv6M8tTuJre93N1lR/3J433m6VV0RUFGVu0x/jy
         491cTJZQaqv5lWueCX0TGQ4bS/FIqbLtpq52crXzV/8q02NUchJteqxJ2KIjawJHznSY
         XPhXkLVeEQlij60zXL+8+3EqpZVwYmxetqYMLJ7er6NLP5q7ONrLQDGvfz1r6jIdWnnr
         PAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759217995; x=1759822795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4/5+2KyLFZ3ZfJPaqaIqqrNGfnS2dbwNYpzwCpd1bQ=;
        b=ex2dIX/taIV3lHn2fOvSI57uEloqTBhxqUjx2jpYvfaOewINjKQTEuOYayKnAbzR7Q
         JUzYpO4s0vgcGpKjvy1r84reveonY3CZjzFRxtvQMyTRaOxuvpbj+dzxne5/h7zXMn5S
         ZrCTFs5EWtgDRkkJapQ5LpheQNS6H19hZ0tn3U11WCMWGF0KaBeJc6nM9HgMmqOajV1n
         G6WggeeB8LL7q+uRzI99KwCPUpmJC2T4Xi2rttu0qi0KiSjIrQQve+9uhfdqgWhfsZm+
         u9/b9H1qCHnt0SGOXF4/1RHFY7/FlYOCGhDXgU+diZ6fImfZU3vQVmvhqBgbxDs14Eih
         Ykeg==
X-Forwarded-Encrypted: i=1; AJvYcCWeoef8voJwF3cpHADZHPSbxHK15Wj2gS/3M497HpEqajAkuzQTQkm+wFcgL5cLXdWRV3FZzbZ9PWReXaVE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0EjVkZUUnH2I6nT44shGXYhdtV/4PwHpSVXrZ2vy184Tc81p5
	nP4dPljjqS2YlNeHjsuIPGb+jvVFUKDYmGtz+FECaQhoucfzanYyaiYWzfe26+6VMUk=
X-Gm-Gg: ASbGncv8VbmcqvYR40aNSg3i4whhgCh5SUSD8QX8q8QhknT4HfEyN0noJEH2ez/lBZ0
	C/7Sd3yj9mGVWpxmElYbnIbM6aHI58V9h0ye1dfX6WXnGK8WYmukD1njnrfdnDpGATUMzOTAp4p
	V4O9SdCLIGM3urSyR8/q+LVVWpUZbEirx6Kn4fGXWsuU74exUZpo0ZmzjP5qDUoO9dnSAg1mCmm
	UlEGhO0tDX5BDBumfI3M+aadGKQ5BamrFqveQw48C6xB2PENctbAFTFkb1M1O8jcYeRMMsOV7/p
	u2SlSX/sOufQqJrmkPvp1d21Wnajj5rWx3rqWhtKwvwMkGvJbiOYqfBFIp732TVtZ2S7DZHkvt4
	Cg7VeYXb+lLsywM3byrPVmy5F/LMUB3mGGjgfZwo87VR26zyxzj5uQO8x/qHidBbhGNCi9R/Kaf
	mzWA==
X-Google-Smtp-Source: AGHT+IEdY4kXaWrkpRUHd0zfnXpxz3G6OEB7NwckGjCQu01y/9rdMkD7WQVgcG3T62llFVeefNX+eA==
X-Received: by 2002:a05:6000:184f:b0:3f2:b077:94bc with SMTP id ffacd0b85a97d-40e429c9c1bmr14602664f8f.4.1759217994713;
        Tue, 30 Sep 2025 00:39:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5707c1e7sm44021125e9.21.2025.09.30.00.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:39:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 Sep 2025 09:39:49 +0200
Subject: [PATCH v4 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-topic-x1e80100-hdmi-v4-3-86a14e8a34ac@linaro.org>
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
In-Reply-To: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2973;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4u/xRvsm43ERIC9SDhDBDVZyzLfWUriP1xNe0S9I9zU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo24lHJ7BpPNhok6jIjnY3wiCZ46nr8Kfj3b3N5c8v
 z47+RpiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaNuJRwAKCRB33NvayMhJ0Yo3EA
 DFBx0pl3oCucSHqRN7Qm1U0wHR3Mrw6+BYAhAtk1A/HcYdFsepg36+PknedLaizw79M3K0PXh2lXpw
 dgmIDxxlk3knPqL/zWBopJ2iX+kqOB/HlsnkdUFN2mN48HpVamGls2YrCQOcClYYB92u9Y//uhIqKu
 8t3+SGG4QfmVaj+LWHMQlaY4nIGFWbAMy5z11p8uMoC24jG/hPtGYX4xikPggl13YOtEHKOB3lAfIS
 ddu/43oiQaC4EdnQOllC4dm0BHcs6hAW5Hc3cR3Uf+DqctDr7XUVcZuhWSUMhrBg4eWfgEEGW6jgSE
 OaBCqDCdl4nqMTRVIE6VFQKxHD9Rx8vAUC6vtTlgJSaPeEdo7G3Ngfu4Pw2Zbhq6DjJhFiQINQ9bdb
 KmApOwOAoeTDT7gAD6BhoVShU+18VZ7oGdCloCe+IcXs+QY4MibB0Lzc+DJno5lmGBQrcC9YnjQGVT
 ehckPdxxDhW7yjTXX+xYDRqpkLksczg0KNybBoZkVhdOb6vdfG4RZ+QiCZjO5y8S73YieP/F1ICVCd
 0uRZT6RUXW+THs3+xIHMO7q9MSZGisa+PsjvUPqFyt+zwzxrPhUYusNbCSt2HSvCneEU6lj1AFJeF8
 e+63lppzSagEEacQH9sHARNXtmsfU5Wa4WW0fywrbKv1i/Ejv8jSlxIpYe0g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
connected to the third QMP Combo PHY 4 lanes.

Add all the data routing, disable mode switching and specify the
QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
the underlying DP phy.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 654cbce9d6ecb61c8a6e874d16385d66e362e439..37168b6214b21ec51918b44cc400581ba8ca4cbe 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -62,6 +62,45 @@ switch-lid {
 		};
 	};
 
+	hdmi-bridge {
+		compatible = "realtek,rtd2171";
+
+		pinctrl-0 = <&hdmi_hpd_default>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_dp_in: endpoint {
+					remote-endpoint = <&usb_1_ss2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_tmds_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_tmds_out>;
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -1028,6 +1067,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -1317,6 +1364,12 @@ eusb6_reset_n: eusb6-reset-n-state {
 		output-low;
 	};
 
+	hdmi_hpd_default: hdmi-hpd-default-state {
+		pins = "gpio126";
+		function = "usb2_dp";
+		bias-disable;
+	};
+
 	tpad_default: tpad-default-state {
 		pins = "gpio3";
 		function = "gpio";
@@ -1516,6 +1569,34 @@ &usb_1_ss0_qmpphy_out {
 	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
+&usb_1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_ss2_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&hdmi_bridge_dp_in>;
+			};
+
+			/* No USB3 lanes connected */
+		};
+	};
+};
+
 &usb_1_ss1_hsphy {
 	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;

-- 
2.34.1


