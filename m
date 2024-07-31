Return-Path: <linux-arm-msm+bounces-27461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDD09424F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 05:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B1201F24900
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 03:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18183BBEA;
	Wed, 31 Jul 2024 03:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIouC9pr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B0C3B298;
	Wed, 31 Jul 2024 03:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396023; cv=none; b=vFuNkrKtk4qjWTyz9QEXloQX3LT+OWF8gHN1NJtj8H3UTA5dOeCzjBnUpNEr20K3H/piO4TqMJzVNHWn3/Os6Aqrl+/p5qtD2HL33S4hterwyP6vx6XjntorkvoDnzrJWGFrPUrR1ijGXVgmJDwmj/LTgd8RRi9n9MmC4DlKP1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396023; c=relaxed/simple;
	bh=I0wyuOwrt9M1SpVhC1LGk6U1zCqdQCcLFp+tcMzC/Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vr6RP9UC1F8GcV/BsKPwxxBus62Xj0ESKIFzHpyTwnqmSh5J1x5+SciIXQtsOkcyd+O3NdSA5kaaFU8DteAYcMHABxR1CKEH+jG6WZiHdgk7LFoTB8a1fz+J1nCd5cRe5BECnf4vU+20wOpkbMz8M+25bmP5j+0zsr3SREgN+TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIouC9pr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28CDC4AF1D;
	Wed, 31 Jul 2024 03:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722396023;
	bh=I0wyuOwrt9M1SpVhC1LGk6U1zCqdQCcLFp+tcMzC/Rg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hIouC9prQiqccyNQccrxrEsKY6xIg3k0MeRyxsMtEDjdV0O/Av/lleTi4knlq6YlA
	 10BAHdAU2eaCTj28yFpCrLU3f6RbrITroeR9uVcAJdIUFTZ6WNEWotp9OzK1wBB9zB
	 106sPD0YxSvK425uBbH749Petv231s+mS3K2njt3pbeGXNq1e+cvzoGiiBSC0f0B73
	 0Sn9Q3rIHdE4WVyCau5CZzHb0ZOnM5Inj6smpm2txoaESfP6rRuqug6R/17BBrC4uZ
	 L/+Yl9G2cOBFneqCdwD87zd2p7bK3msR3DCn30jt04Uqa6vSKkp20BfvXtqBRRpYpb
	 oFm0q3maXvw4A==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 30 Jul 2024 20:24:43 -0700
Subject: [PATCH v2 6/7] arm64: dts: qcom: sc8180x-primus: Enable the two MP
 USB ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240730-sc8180x-usb-mp-v2-6-a7dc4265b553@quicinc.com>
References: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
In-Reply-To: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=09uVIY4CrgQX6VNnE8xRxi0OjqG+wS9cNG1HQ6SpemM=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmqa6HMen+8weizC460badRUChrA7gUP3dYyaa4
 s1ExCTVDCSJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZqmuhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUwxhAAnBAeM6kUIKig68A4lVxHyo1P/yX14WiLI0yO0iV
 Sa0a/Py0XfL6hNqxHbqkoxMieRod+n5xdSTPEwkSp8vcKFC5VtgftVXrHLsKFcDrvSTvezkHr7r
 jM20S+OQuWUGFUVmRkXTvzqmSt8VeLu6p2x1zUHyRpbbdt4xHOjEqlddjnK/haOwWtrrK6lciO/
 OtvMi2BqSn5XveRsA1JebGoObliekPQ6tsIrrvBphuq/pu8mYXxVM4EKf0toxFcwXtH7hKBUnMH
 wtf/JIw12xLSvqxzy3JX+mnFdKAP+sYKmnXiIwhTZsvLoJ1NVeRKw/QljnMdXQmMPEudkTSsrPc
 TPiIJabam34s+mRdfPejSxl5C49MHypGKUZ355bzr/WIbZl7Rdt0sN574FoDiyC4ztfEHHYLQtE
 qL5HDxeKb8cPXDdtGobHx10pJYVhN0CSfurwin1hYdeTPk13j+OL1Dg2UAboLCrpaQcsnaPPQsp
 SdbpT3ECm/X0yBzudeY/mXGyXo9YYszo+O628uS3p/Z6dybYT264Qf0cGxL7moJ4QgtGAnD9GoH
 WFpOt43TiRA74bGJBoXjaj1X6Ss1rAH7ND/JMYt7BHg8U3E+8kw1UWL2VigaOO8UqHQLpdg00q8
 8xAeHOvzO8s7p/h+NMOjn3VBQ14Gp8MibQxoqyOfmKeA=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The SC8180X Primus comes with an AUX card with two USB ports, fed by the
two multiport ports.

Enable the involved nodes and define two always-on regulators to enable
VBUS for these ports.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 60 +++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index 65d923497a05..9447c1e4577b 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -223,6 +223,32 @@ vreg_s4a_1p8: pm8150-s4 {
 		vin-supply = <&vph_pwr>;
 	};
 
+	vreg_usb2_host_en: regulator-usb2-host-en {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_host_en";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&pmc8180_1_gpios 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		regulator-always-on;
+	};
+
+	vreg_usb3_host_en: regulator-usb3-host-en {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3_host_en";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&pmc8180_2_gpios 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		regulator-always-on;
+	};
+
 	usbprim-sbu-mux {
 		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
 
@@ -623,6 +649,40 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l16e_3p0>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l16e_3p0>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vreg_l5e_0p88>;
+
+	status = "okay";
+};
+
 &usb_prim_hsphy {
 	vdda-pll-supply = <&vreg_l5e_0p88>;
 	vdda18-supply = <&vreg_l12a_1p8>;

-- 
2.45.2


