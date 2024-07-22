Return-Path: <linux-arm-msm+bounces-26747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F2D938C4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E4992824F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AD516DC14;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGO5LSEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441EE16D9C1;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641426; cv=none; b=dFUXONTYoS+LGFrvOEPCiyIuMBFdytKFyc2mlXORx3myYdzrkQ+fr8+YJ6dc3RNkzpesD2b3vPtB6qZ6kffhYN+B+knvkAdTCWLq5IpO5L1QZ8AGbEwk71YPxNlFvMN1PiwCkR//km7zJzz4ve4YHDkn0Fk9B7E4VREsxqokiF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641426; c=relaxed/simple;
	bh=fIjlu9xUUfZ1E4uHJtjwBsMhk2muIRSxZWPDwYXP9JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YplXvT7DUF62ZlDS3xYhyBeoe5xsP/OJkvBmwp8G9PITLFWukAG1eDIcZN44yf6kHpm1+NCLTzxQd5BstO8boqbKL6rIUcR4Y+tHkxDeDq1aan8DrwUA6JNj/1mSwkSz1Zxbe1XWWP2KOEGJILD3ZbtLPOoEFSiGJXChPl4Nkyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGO5LSEm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DCBC4AF61;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721641425;
	bh=fIjlu9xUUfZ1E4uHJtjwBsMhk2muIRSxZWPDwYXP9JQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EGO5LSEmo9iIfiz/TT9aZh2F0p9G2NCWfGpOoN8hBD8nAkE+ZiyGvzBxextS83H5W
	 cK2TP7ZwYT7/YvPZtz1iYHMl3/o4Ioco+g46KVVfItXD3rVYMH0pyLw6uW4a5uyKG8
	 eUd0FJXvhELmPYoFKw/AMpEoaAnLWXmZacb7psahBOfm7wydjD+aBLuq7yTX6RCpAg
	 BB2pkV2bdyKgHPx94iBNADxJHqT5gi4HuK1lbEaGT3lDyXhwYSVwVJv12bYVs4WW96
	 zBqqNExopwv+bkPiUlMkO34LjH2aSqXq6cnAOI2N78SayHZJA9em0fgIbzWL2qCtya
	 5DEzYNAxhCDxw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVpa4-000000006uV-40fQ;
	Mon, 22 Jul 2024 11:43:44 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 8/8] arm64: dts: qcom: x1e80100-crd: enable SDX65 modem
Date: Mon, 22 Jul 2024 11:42:49 +0200
Message-ID: <20240722094249.26471-9-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722094249.26471-1-johan+linaro@kernel.org>
References: <20240722094249.26471-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PCIe5 and the SDX65 modem.

Note that the modem may need to be flashed with firmware before use.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 65 +++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index caae0c3d8c7a..767118831551 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -301,6 +301,22 @@ vreg_nvme: regulator-nvme {
 		pinctrl-names = "default";
 		pinctrl-0 = <&nvme_reg_en>;
 	};
+
+	vreg_wwan: regulator-wwan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDX_VPH_PWR";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 221 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wwan_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
 };
 
 &apps_rsc {
@@ -800,6 +816,25 @@ &pcie4_phy {
 	status = "okay";
 };
 
+&pcie5 {
+	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_wwan>;
+
+	pinctrl-0 = <&pcie5_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie5_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
 &pcie6a {
 	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
@@ -1004,6 +1039,29 @@ wake-n-pins {
 		};
 	};
 
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio150";
+			function = "pcie5_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio149";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio151";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	pcie6a_default: pcie6a-default-state {
 		clkreq-n-pins {
 			pins = "gpio153";
@@ -1055,6 +1113,13 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
 	};
+
+	wwan_sw_en: wwan-sw-en-state {
+		pins = "gpio221";
+		function = "gpio";
+		drive-strength = <4>;
+		bias-disable;
+	};
 };
 
 &uart21 {
-- 
2.44.2


