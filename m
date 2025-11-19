Return-Path: <linux-arm-msm+bounces-82450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E9C6D800
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 8E1A52A879
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D57305E2F;
	Wed, 19 Nov 2025 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGNQvaom"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C57A2FE04A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541951; cv=none; b=DWn/Fq44z/CZuAXVxzwsstUybtcVt+ijHRLCtssW6Wgkb2YcjAKnO6NNbQovySs9N1QDr5AWYRL2aL9qL6fQJJOF+l9cVrprdLnq9nww9rgWUUGRzZR2WRkJVGAUuME2HzLftLcyyyna8v8d+iQz3n2RrWxow4I4GqWTAGTda18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541951; c=relaxed/simple;
	bh=EQkZbUbehBlz9QkQWwXWXJ+x8l8K74TOqrJoFoU/WoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DrXMxMlBoPKvfft1KRrZOhZPdVAgOICg2W3p2+nwQqeYtarqWpKiZH9VOCUO4JzWEkO9yE6pbMvN3Ta951AgTVjihQiOtNX/fampFp1T+WqHqqAaX93hFHSnkzvF5ZM8zQxxo8X1pqCSy1ihnEg60KQZ/t2RItCQNEFFfjbrch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGNQvaom; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-429c8632fcbso4511104f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763541947; x=1764146747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE55M4P8STPGyma8aBzr9wec9I7bZaxdp9L/oczEJdM=;
        b=zGNQvaomSju7ZxcIHFS+3xqSxGXF3GG5/fCtveI35HdUrNyS16RV047c1buw1K9ynm
         aDLQW2vH61vop3h1TEO99xzOWwAFOquSJHffTxC+wkRE04kVLDnSnowzoxYg+d0X8LRJ
         6za/SCHwM0RrUMK58KmI5+1eNSvn9FUiTDwZBvtmYFFrRMWrkAFEW2i6d5PWaAdcmria
         m1hwH24mXKERZYpaOgRF8vERsR+RuSP6vtL5X2wOm6Xi8c8UGhsuGEv4cjGWXChbRzx/
         G8wPdVqLv+qL8tzNdlTdLoFOMW1ZhrhiAV1hnXwIuFc9Blw4Y0HSD8H7Z/femsLd22PN
         vNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541947; x=1764146747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LE55M4P8STPGyma8aBzr9wec9I7bZaxdp9L/oczEJdM=;
        b=rHSH6YE/8fly/RKI/BicuAc9UW09WowHPwD1hEFbyTEPaPn2hQ9Y2Y72BfI3DxgEfY
         aKsuP6k/8zQIZFJ43d33S3RpzNgx8hOJTeACeZZcaWhJ/eqCPO2nAmdtuuGCHeVoftcX
         iGsfe9E8HtViijJjOu09FmKxel19CWL5G8VzR51PgmdFl45VIUyKW4aiHWON3sYky9L+
         UCavugG3T1/cg09KmgjmvSRjZ80Ui1wrKVge74vVxHNJNgjLH5TLuHzrDZfI0RaLKmjs
         mcpakJw19YbFllvJB9Ye0n1pPdpAN4DZY2i8l+N+amN4PaRqz3eg1fDRT6SyG6vGV+5A
         zESg==
X-Forwarded-Encrypted: i=1; AJvYcCWuUFNRT8ccN3pjcYhOERqU12uwdYrJMJyNotB1yHwgTyhwmmpoH954DBAS2wpCmP7JFL+g0V41rNNBI1Rs@vger.kernel.org
X-Gm-Message-State: AOJu0YxIvWCedGdp1HG1GTnIT6gbVv7nkaSWkfP+wf3LzU1UurCbGB0S
	TaprbkseExbrYuZ6Q1RWQpUggI06b+3bwMmb2QggH88jthuGEBrWAFTyX6D9mLVgH64=
X-Gm-Gg: ASbGncvifdSxflp8HApchPuLB5UbQRzGwIcQJj8RV4+6uJY2JyTkBrViqBShTZQkhTH
	A+GCJfuzxykSwFuxuFVndS04xQvqg+ehnAUQOj4uOd8L/YRxzSEBqtVyAGqzUayKh/uTIPY4o3K
	tfoRQNHPb2cKUtKKpbhMnROSYYDfR/94u974TVFB/LI5o9RIlZbdiJ+jNKCuzVci/YJl0zUsZAj
	W6oWaPdgVswxbyVwNPMSYfwvLbdg43bGfOvYbCKZaBx9rwcyohQmnDmkHgQJzxjxJ3irmBQoYW0
	rre+eXZIR/E7x6wbZ06uxiUPzhC3It1U8n6qVFghrdzp9b0q7eTpstKV7f4XgoGUBJs7XYLZfV1
	sjd1ZTJn/9R0iky08i9sixwURQ97L3kzrT2Qhc1DoR+pynqyonuC/fUtRHrjvd1DbTrLnUsRC/A
	UegYewQVm1ZyEoCOXRnDOOqPTrXOQDRYywGynHsZKxpg==
X-Google-Smtp-Source: AGHT+IHdNEtj9hjFbh81MqD+UqMxElphyOJVIxhh/nDOITHKKZy1D2pR8mgAzPWR6P3S/EYsB4vaRQ==
X-Received: by 2002:a05:6000:4008:b0:429:c54d:8bd3 with SMTP id ffacd0b85a97d-42b59384951mr20115882f8f.53.1763541947302;
        Wed, 19 Nov 2025 00:45:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm38132306f8f.26.2025.11.19.00.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:45:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 19 Nov 2025 09:45:42 +0100
Subject: [PATCH v7 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-topic-x1e80100-hdmi-v7-3-2bee0e66cc1b@linaro.org>
References: <20251119-topic-x1e80100-hdmi-v7-0-2bee0e66cc1b@linaro.org>
In-Reply-To: <20251119-topic-x1e80100-hdmi-v7-0-2bee0e66cc1b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EQkZbUbehBlz9QkQWwXWXJ+x8l8K74TOqrJoFoU/WoQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpHYO3mRlyFCY2y0BUwQ9IwLf0oNuk+8Tqj1ybUEh0
 qyU4SqSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaR2DtwAKCRB33NvayMhJ0anJD/
 4p0T2A2uDd0U4as/4N4EIjglgXQq+XBwwKEa7Ru3Yvjum9pzQjEzKozeTiO9PJWQLKYtvEGQm6x5VN
 FzG1fdYUJf5jpErnRnhSi6VPnu+wiayQ8QBM7bzhYCINTjTXLajqXZBoG75EfC+CdRoan/Obexvpgt
 fA/5gH+Y5jN77sM2zL48BT25RhGZ8E/lkUHNk1JWoAFB0KoJ1tYuzzg4lzgpAAfHlxECsbiX+Y0ndc
 vq4iW4EIVE0CUZydCJWLf3mroRJSKnYhhtOTb628q5C55wgCiUrXMFre1CsyVmpqoABk4LPCGZ8vQP
 KRDuxnGyoGZUnfvCDtP7si3KHRKDwGYT0hSfZNFuaUQBgQOaqBFEHrGSiRisrrhHl0oC2Izh3yWjxh
 +xdKplM5PNl9F0zbCdrR4+tWXeF3l9dYVq3s9Zgh4sxANz1yy3ukQJQ9I4ptZKmmHULKL7wEZzm7GZ
 Tgq4YiStBPduK7W9MrpB4DF0+wlwgVaDJi1pHRsQsfoXTYm3E+Bj3ieqoq4GjfH4R81hWhGHGQUrVL
 RCbAMgWjJILDHWEBwiUS+vT0m6s5NnUivfCJKEzzouVI5FZOtJTUV4Hoo4tEerFAcczFm0OZA8qXQZ
 GMEM52qg8QOvdi3/YFHwIvPhleV2M0FQrXLuB+HwA/UPEeFfZYfQLn/PbMhg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
connected to the third QMP Combo PHY 4 lanes.

Add all the data routing, disable mode switching and specify the
QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
the underlying DP phy.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 80ece9db875a..5009898313f4 100644
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
@@ -1548,6 +1601,34 @@ &usb_1_ss1_qmpphy_out {
 	remote-endpoint = <&retimer_ss1_ss_in>;
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
 &usb_2 {
 	status = "okay";
 };

-- 
2.34.1


