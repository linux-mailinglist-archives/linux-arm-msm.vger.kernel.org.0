Return-Path: <linux-arm-msm+bounces-76071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB3ABBE3E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 15:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B41734ECCB8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 13:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934F92D480E;
	Mon,  6 Oct 2025 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ExZjnsYC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4092D3A94
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759758918; cv=none; b=XHZkiZRqBigIYV4e0z4ZRYAhqBU1ib3klCzBiIExzrYKPJU2+bhxtoQ2r1GniboNXLMig05vaZCDvkMm+JR6WE0nDEvHnd+5ZgCbbOdEOTOdHxol5Z70XEPwc6YamnTw14LD7eTYZJlyMuql4ySeX6gM6BBv6SyItoQ20mh40tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759758918; c=relaxed/simple;
	bh=wNTs0h0y/mlTB3wnqH1wfrtLFenOEC7p4UTXqV1uWNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n5GseLKYZCsJi9nEI3NlLA7sDpOdl+e6qyURJJUr0q6iHecKi9hYqqm8bV9RaTKLy8iL3clERXhcbIkwLKNFyt5JwiI4QZPh59B5B5ZvE2Sq3RcRYpWyG7DdvV2Zv+N8Rlb6rmC646MbAkhBydLiThN5+tLeCvcSxJfoi4twrvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ExZjnsYC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so56720705e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759758915; x=1760363715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fqs1h8Bd8tnY+khxrYUQ40FHMHiv2RkeVoWTqnCne3w=;
        b=ExZjnsYCC6gJpCFdm96jrfRhY1z2lZKS1Rh7djrOs1LM8EeF31JvApo85o1nqnsphH
         NdUkSG7QjiDo4+PqSP8ykCLEFOHMIzmZ3b8mapk5DUkY7L9x597c9s/HYFB9C3qPo7hj
         o1JQi0dKVRkq7jEz6tiL34/Uk65A4zYWVOmsMP8ffhKwvOgzmnfbp8+iuTRxjVfqCNzf
         mS55h71KDOas1Z22cKpdmxVNKI5iSN80zc4AOMM0iFSsB/GQHIwxTfHQqTNIOF0ss9DT
         wQAsHyClsQT4qQHLezW0ZiCjdg3qswGEUsOQTd5LubQpo3NWyKumoIhBwNlKfzl+8tp2
         gm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758915; x=1760363715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fqs1h8Bd8tnY+khxrYUQ40FHMHiv2RkeVoWTqnCne3w=;
        b=kvNyVw9mNPjIXkxaxy7Tjxb9lAuRtmDUQh4CJs3qQ+OxZwjfZUd/PdvhiIXJ5Cwp7a
         U8HET+Puvq/LZl+VZGYHWlKiDe+A9NsnjSGi5a8EfhpVOvlJoOu5oEyppNLuwbMCBXIO
         JUS8Inu3SqODMKGNUvMHIF4T5Ujo/e78QTmSrv+6qRz23fwxqPGoqHUzSxSslq3w2fGZ
         YtkXs5iUe7VhL1XCupDht2PqcORG5gJ8v0LWcmqb0WC2y6L7PnYXEK55QGO0FB0T91ns
         eKQNlIW2OGygrM7nqgHZZsrlKkVgAiZDW2gC02JOGtSZvMUcrxpOHHk7i5zrbRpGp/eo
         i8SA==
X-Forwarded-Encrypted: i=1; AJvYcCXpH5MxHQ0r84cRXk5gcLlpNa52gLBgFVRN9ArcCumlWdApN3sK+gCALncLvV3UDsH9lIZFd3Jr/cesqbmE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ctTfaAZYYiXi7sUABOsPqdgQZ9BPx+Meyqu6Xhbalig1RKqf
	WucE7+mYivuXiO2ZTcsVZ+t3cTQiQvPUVDcboizfgDskU148tSY9Bc8IVHqRdt9Frww=
X-Gm-Gg: ASbGncuGjW0pBTDKFUb5Avj9HK59xBbTv9bf2dCx1YDI2HelDaktySfL7RlTT8VsVI3
	YqaQXE0BG5bdUqbX6eJ9AHg9iBYLilWgpGZzEunKjaLUZqwC15Otx/aQge8PoJ/p39rcCI/+AUq
	+6BLNLzLMmhtsGai5b9S6d/Ru2pnRiCPgejqu94NHwwoKoA0xVMWlRbRAGJIMHhDAvsiIF6/MvK
	qP2FAireoRYGPG3lpWifZlSfS+vK2ZDGjvMt/tLiRbEcQY9Ow8XUb2GSUpzNsJTIivO6vzwvQBI
	5yIFy8hzbiwj1JnrV8CZ5oC3Hu0vEBj8qh7TH9VZy16Ua/fgy9FCOqA1eepcBbqaWwxygcIJTLG
	RlRASKfmSZ51lKOT+KsfcnEeAebZWUMqAu2+yNZ1fygs+XVei/DOPDZqzOpyACTAV82jTbG/ubB
	QL/9Vh5Q==
X-Google-Smtp-Source: AGHT+IHkQwD7e2XwMTAIQP7c0WAfYhEAe65Zz4BTSnFzZBueScQHPIywOmfPNSRPfCKle9IZAeW8ig==
X-Received: by 2002:a05:600c:1909:b0:46e:326e:4501 with SMTP id 5b1f17b1804b1-46e7110aecfmr96690535e9.10.1759758914520;
        Mon, 06 Oct 2025 06:55:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6daasm21291921f8f.7.2025.10.06.06.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:55:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Oct 2025 15:55:05 +0200
Subject: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-topic-x1e80100-hdmi-v5-3-c006311d59d7@linaro.org>
References: <20251006-topic-x1e80100-hdmi-v5-0-c006311d59d7@linaro.org>
In-Reply-To: <20251006-topic-x1e80100-hdmi-v5-0-c006311d59d7@linaro.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3047;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wNTs0h0y/mlTB3wnqH1wfrtLFenOEC7p4UTXqV1uWNo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo48o/cUjUsZSkcCG90nIH9ehxl8hxHgXBaT6XRw1k
 5q1v1F6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOPKPwAKCRB33NvayMhJ0dBEEA
 CfPiVBqXV1xL+f5SfsAoGGO2i4q7aKnPU8RUkMTt9L6vBNedhn3PeLVqNLpR44ALYAM2Bvubvlgaqo
 GtgOozBI0vTXblBo8Oimsu1HCu/kk5u+6ZWhQBFkIG3S58XnVKlBmtHsKu9QcMMG5peibpLUyYOhuQ
 GdNU6aeExvaH9de0MMLTXf6pJ5fI7TwCqKYU2mgt3p5KMpBhdopskmbY82LwalytgOBRfu4IBjAUki
 LFQCo2GISAg1sIqyBThaaZgUvG5s1iDwnhsZ876pFMOqoVpV1pG0dY9TZ802gXv4sXcJlZri8aTbaY
 Niw62PsoyXhj16YNIv8aHYDt0QmPYcilNQ35Pne/rab1K0BUnNyfYSJh2eCbGGL2WzaUqO4Ewe3dqP
 EGB42sRL23o1RWLYH1AoL05WxJKQ2GFW9370+W0ZoLmjVDnRN8ymIi7hGr8A/Er3hCwdyQXX2CqmqM
 4K8dAGubtt6lsRcvGXFX/Q4UXemzPwhnjiL6vTe2GGI9McmUtGfoveAcH4wDjKQhYK6g0nPbWHBUqu
 tpV7Z1Pr0XUmmMezMrG6T1dBy41N3TclJD0jeThCa2mBtc6ZkELVvZxAoTrmMzQvuO5z6GzZeGhwGj
 60Q2ESqd0wLBhTGl+IgadDRRJp7q0qQj0qJIw+NdM9+pHA7IJSMWTkWvGGSw==
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
index 654cbce9d6ecb61c8a6e874d16385d66e362e439..7aa7ae66f49a7a179652757fd826e9d11b9b29da 100644
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


