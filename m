Return-Path: <linux-arm-msm+bounces-52591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF071A72B39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD2AA3BB54E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 08:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73AB1FFC7F;
	Thu, 27 Mar 2025 08:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P17ZkbrS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEDC1FFC68;
	Thu, 27 Mar 2025 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063355; cv=none; b=T6rLIYMClKQeXIDzGDY6Kq0oO/vMsaEmJUwhFTsop+prjecdNTaqxSMFAc3lnyLlmXvtqLF8vBOvtXFafwx5sHQKq4+QtiUBxc9NagJI6rbGIHtH9V1r3HaSO6GqhwpqjQs0Ur1Xhcz1KPHHrAe0PS3FrG3WAh7WeeSL9Yh0M1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063355; c=relaxed/simple;
	bh=M+VJbvrV0xAs0puHDDM7SCsYcFRVHseqxgAnzW2L6uw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UH8wFzsSEeMV05rfFGZLNBZN2O1shROpefaxgb2s92q9xrWOYhcCgaT+sanLv3Ko8oXA0cw6TTYkn+EDTGJ4ug27B0cf405O0pS1vVKd88g0HtY2rbP+8eNoFTmL31J6Sd/AXWMyBdF8fTCaGLQ9YbiKlkNUR1PVPD8YLuwrcCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P17ZkbrS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA56C4CEDD;
	Thu, 27 Mar 2025 08:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743063354;
	bh=M+VJbvrV0xAs0puHDDM7SCsYcFRVHseqxgAnzW2L6uw=;
	h=From:To:Cc:Subject:Date:From;
	b=P17ZkbrSSG/JqLf81qx/GabaQUddarxJby0Zfrkvg0nZBExjMiRnpG6mfUANruUfE
	 iB+LDHxSfiIJZoWEituwDAi5D6aIxq7BWF1aADxmFdBABfd9ynZNt4sBjjPs2GepGo
	 dKYq079bSkbOHsqtanCQpqwUN1wQvdvjx8Gqbl5seQMEBktB36Nb2nLXda2yZ8YKj7
	 aqVNjD12i/WDHOov3uzmTuWEThvF9An00IVdSR5F9zJry0KEOXBghUT8rHkdozE4JU
	 psk5Ut0RPpFju4gk6E5WnhJXCarvYc+CUmcT1OEJ5LoRAX/OXK9RhfLENKL/g7wXp2
	 dDgBuH16P2cUQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1txiP7-0000000059o-0EEp;
	Thu, 27 Mar 2025 09:15:57 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dgilmore@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
Date: Thu, 27 Mar 2025 09:14:27 +0100
Message-ID: <20250327081427.19693-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PCIe5 and the SDX62 modem present on some T14s.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

I don't have a modem in my T14s, but this is based on the work I did to
enable the modem on the CRD reference design and the T14s schematics.

I'm hopping Dennis will be able to help out with testing.

Note that we may possibly need a new entry for SDX62 in the MHI driver
device id table (mhi_pci_id_table) as well. The output of 'lspci -n'
will tell.

Johan


 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 962fb050c55c..8b3f715bfc0b 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -310,6 +310,22 @@ vph_pwr: regulator-vph-pwr {
 		regulator-boot-on;
 	};
 
+	vreg_wwan: regulator-wwan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VCC3B_WAN_RCM";
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
+
 	sound {
 		compatible = "qcom,x1e80100-sndcard";
 		model = "X1E80100-LENOVO-Thinkpad-T14s";
@@ -1028,6 +1044,25 @@ &pcie4_phy {
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
@@ -1309,6 +1344,29 @@ wake-n-pins {
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
@@ -1367,6 +1425,13 @@ wcd_default: wcd-reset-n-active-state {
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
 
 &usb_1_ss0_hsphy {
-- 
2.48.1


