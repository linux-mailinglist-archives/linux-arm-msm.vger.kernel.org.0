Return-Path: <linux-arm-msm+bounces-70194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EAAB2FB93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 16:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09154601AE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A7B230BE3;
	Thu, 21 Aug 2025 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grMyMztK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F2C1E7C05
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784415; cv=none; b=WiVGkwoM2ShMs3pZSf6/sT2dDIZsSajMWQLWDrzDSXa/wXl6aVhlAI8aEwNr+tVIC5AX7/UR39ZU3fqdmlAVBVos4UMirg2MdYEEQPXXCGtwO8+oVCPYTJRODjSgm6UQ8NWlXFkIcp9oTkTfxMr8CCLXhQUYg1YOM0C0tQw0ks4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784415; c=relaxed/simple;
	bh=tlCxLe1DFF2OuAcur7Af9DM9bWyADwFZbOJxRmADTao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NHO3PIOSZMv+9KWOlZSJwBsCnXh1TaSgF77FippsfFsUGLuqi+7BWiG1EFxWzLrG0CmEp2CqUIfmMNrHid1NYPuLp/D4dR8VYzZs6DB8zntTQ/2aBBI27Pd8ivAQgWdnhtGmop8niQ+VhPUzxEmEhDdU5O3aIg4y8xnSoPinAy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grMyMztK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b4d8921f2so5009505e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755784411; x=1756389211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79lhMe3N1476pckXeeXS42RAJ+SKWb/dkO509Wt+tFo=;
        b=grMyMztKzcotI+fWzx2zsufCoR+RNOcq9QNytE16HXmZvGRAnW2GSL+hPEHXE6iWTs
         Slo0BNEr8H5wDivMK16mv447WSvc3lxFv7uMIXaK4pqrMrbr/xFQaQR4sZsMiB8UXkUo
         b6lIN3RVQUeMPVkHoZqb+/hJKOPQ6litWHOyskXO+n1fbWTX89hRNK4/aWUcRXlOE9F7
         seSUsFzc6sZl6FdHNwyo/j80Y5OcMPRhDuM4AaZv37s2fCpuF/W6ddQ4jCdUVLkEtkNm
         ZuOHYvSrIm98YiDvv+/C/Z/Rkjl1q8JkvoyfGa3fGqTUmUC1ZH7qIblCAqOSDbmzpV+O
         7+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755784411; x=1756389211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79lhMe3N1476pckXeeXS42RAJ+SKWb/dkO509Wt+tFo=;
        b=Dt/3FB0jmDi/wkQfjZ5du+kTtlzGI6lQ64ouittzzTkOGiVkccIuiGtkzjXfdjJx8w
         uXBjEREWWyTLyNGr4rLTpC2X/GVU5xYHI5r6mUoVQgwFUfglOOnZB3bi08YjfZGBnuMJ
         nS/Ib21HQyKRnQ/v2tewyULQGqAVXhK8xoAhuLt7RH/UK39oq5Vj79OpO3y55Jlo6RCL
         koR5UCpE0FpMBdNUti0hFWU95yBUhPbaaZTln/NBqDY2OpaDCDiV61suXw7kLbafHVU9
         Q03PCF5Z2yNb2Dg/58tsjabrNGYdB1tvTLGrHevfWIEsEOuvBzh80/SP3Y296sJ5FO1i
         tzTg==
X-Gm-Message-State: AOJu0Yy0wJJzH/LOgvNVVogIe7ba403oej0PcasPs7pn+2C8agcyMG1e
	80eixYBO/FE2mQnTIjg0eSfpaxweQFH/LbxKfPcP3cDkfEa3kIwT8BRNo3yB/kdyeO8=
X-Gm-Gg: ASbGnctj9OxzjaULfjTokPmi3V9MucS4cZxI84OMGvZlraLMbDk5dBqSZfDVTswUXvL
	2ldSnp6nao7lyhlAxHdjX3ktnue6ieDFHbzRKb7AC41okponGsKAXY3D0XmDPoDxvr5NEUvXeRV
	8tDnWCHqf07OS2H1WrkHGWrb9W65ibf7dWQLrqMPK2axv+OZy0kKQi6eXtqeo4hLXBYtceFQxId
	Z8DYnHYwVl4fMdHmNfdYHJrck1wnqmvzLhcn2d/a65tqhMkRCiLY1hcMP8xF6C+p5pN5WSQWaM6
	dNe47NRuiux6nqi8wvHsMbBACSjNwNGSHelvjeOMnWwPG8TstFTprsdLao1O5tiOBtpvvPVXip3
	XgKrLwPDVu4n70rap2XHTkGpBb3ddUUCLUCcdfjPlFsk=
X-Google-Smtp-Source: AGHT+IGZInLhSbfoffh4Cx0aYiBL1T1B3t2zh263M5ezMVnk9vGA87GDTnKwdEgBYTpxeSw+hfF8vg==
X-Received: by 2002:a05:600c:1c9b:b0:45a:269f:3a29 with SMTP id 5b1f17b1804b1-45b4d7dd465mr22121955e9.12.1755784411409;
        Thu, 21 Aug 2025 06:53:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm14825015e9.2.2025.08.21.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:53:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 15:53:28 +0200
Subject: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
In-Reply-To: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=tlCxLe1DFF2OuAcur7Af9DM9bWyADwFZbOJxRmADTao=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyTYR5nHv+daCaqncnC2vX+bVmM2jIZmKVW1gh2r
 dsbT37KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKck2AAKCRB33NvayMhJ0VeUEA
 CFnzGV6UjRVo8/SqcgVuP86HUFK6rq4oxUfe1zvtGXG+COagM8ASnSQ7xxsOFhJd6jpH5VSUegsb79
 FaRHR1HLTGmx0BHHx7KUD4n4Sp/5ltMxo3FaIHfLxoBgWJYO8z0JnZuuAbFympMZyxx3edchjeSr4J
 OwaA9CUDtoDVTLDmAYWwOAd3KcIzlJ28w7t8Unj5hqJOoaN1xGtc9To4vEDIpfzMgXg8gGFGqiue5v
 EDIwUMSonSCghsSntyDiG7Ez6t7fkufZqlORnF5i5mm9PgDo+p0YmHpPLQAnLDTmPhREmhUe3bqfMf
 CSUcP03xrwpnRBquax99eqzpUTciq2gUDdGW0UoTTXYgwNeWqrwTOca6S/IZL79ML//FK5XaqfKI50
 TL23QDxxMnt3zrKLJRWyuvmYm+8VjPPhg+qQX+Cx2rjt6/lf8JxIS/cC0oFVyBsYr1sDWfyBzEbx2J
 oNEOIqCZ0atqEwPIm7WRuZeeVaWstADVRJYwM9FgQ/iis0qBKJBOeqPR/jHxc0EdFfQ5vZ0T8RL3B5
 MzGB1cEzQo28oIx8NSxA7Wiaocwrj9r9iYV8NKL9XWLHk72QNJl9/0WJi+Hc49yBOn+6cLl9PrjSZi
 cOpRlf+l34NjQb7Ss2ZWPuQC3dcp0Ww5WAw6nqeXRZP6UdhaKLGQ5RrEQtgA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
connected to the third QMP Combo PHY 4 lanes.

Add all the data routing, disable mode switching and specify the
QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
the underlying DP phy.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3ecdc8ea23f44e8e09 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -62,6 +62,20 @@ switch-lid {
 		};
 	};
 
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+		pinctrl-0 = <&hdmi_hpd_default>;
+		pinctrl-names = "default";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&usb_1_ss2_qmpphy_out>;
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -1007,6 +1021,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	data-lanes = <0 1 2 3>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -1263,6 +1285,12 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	hdmi_hpd_default: hdmi-hpd-default-state {
+		pins = "gpio126";
+		function = "usb2_dp";
+		bias-disable;
+	};
+
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";
@@ -1486,6 +1514,22 @@ &usb_1_ss0_qmpphy_out {
 	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
+&usb_1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	qcom,combo-initial-mode = "dp";
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+};
+
+&usb_1_ss2_qmpphy_out {
+	remote-endpoint = <&hdmi_con>;
+};
+
 &usb_1_ss1_hsphy {
 	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;

-- 
2.34.1


