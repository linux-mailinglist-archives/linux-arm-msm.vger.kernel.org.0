Return-Path: <linux-arm-msm+bounces-38745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6F9D5828
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 03:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3121E282502
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 02:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CF315F40B;
	Fri, 22 Nov 2024 02:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQ3Y5eH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484A715CD58;
	Fri, 22 Nov 2024 02:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732241700; cv=none; b=bLXKvSpB9XoYfYTR4xq8JocjfomERzDc+Heg7xwMbBLeW4DMU8ggMHF+Ex7kR8SSuIK67e/Zo4yqLN3cOudv8P7rOt288ielo2SE8gu37NHIf4Y7+6aU94GV0eEUrW5dq2UHxfyHhJD/Gx/G8bI7EX13bWIyvGtZ9ae44xUXZzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732241700; c=relaxed/simple;
	bh=cCvSA8EYuwHcw0JHP6pmSWh9EHQUQVPk9W4HI5gR84o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6X8WtOKScV6elMIEUlR4LwMmzG7LVpYz8ejfN10V3PhjTslVPtU+N5JlhoyJix4sFbgP/tn0PYapCa9OQuhag6FRpPD5SOmMyXwXGN8vtYnk//CTCyhV0WUeDM+yxbBzRtYgnLnogz0W1hWkig4bZqcY9gJylH+bq1y7cNySkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQ3Y5eH+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F563C4CECE;
	Fri, 22 Nov 2024 02:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732241699;
	bh=cCvSA8EYuwHcw0JHP6pmSWh9EHQUQVPk9W4HI5gR84o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jQ3Y5eH+4Eyx86vYZF8+MNNf5A9tiNi0YSdszc4fmTq9PrMZyydEmJn/FUrW480zs
	 y0INSZAW737z714da042PRBfqub6aqXI0C5JE8RfbZd6dXK+5zdLDg3u+R3YPG1KZm
	 hVLzR9EYyHYOhw59yYJe+sRyvPQ40LzGBIcVyRTfyk/9RV414Gkja6Fs5v0EplBIc/
	 I86c7lFc74Vo8+Wet1gZjVxOo8EgugrLiFhNZ3ZUaQ1viLWa8nnKc7djoq4r5nBGox
	 sYaUQvoJIPT891bZwJbmY4OzGxayqklpGuyfc5ExDHnfPwXxTPkYr2SUcNeQ5nVvYH
	 5wAR8Y3AHS70Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 22 Nov 2024 03:14:11 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: x1e80100-romulus: Set up PCIe3 /
 SDCard reader
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-topic-sl7_feat2-v1-2-33e616be879b@oss.qualcomm.com>
References: <20241122-topic-sl7_feat2-v1-0-33e616be879b@oss.qualcomm.com>
In-Reply-To: <20241122-topic-sl7_feat2-v1-0-33e616be879b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732241690; l=2368;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=doiOEJrk/v5y4eD7CA4kTXwA2l2nRkYkm8eMAPx0SD4=;
 b=D3sySiOTbZ7nYiiza1j9RtDAveqFGn8zduAiOZ9XlyG+l4x0tYrJIGJj1B8TLO2rb/MWg0mf5
 L4/6BM4I80XBv7CUp9DOSngxp7JFz7PXOWoBGUWhU1KakhwDzTGH8DB
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Surface Laptops have a Realtek RTS5261 SD Card reader connected
over a Gen1x1 link to the PCIe3 host. Set up the necessary bits to
make it functional.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 6aea8f3573e834273d56448da772edd27855efec..66a12b20b096baa7d5cf8c5fb65927b765aa18ff 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -767,6 +767,27 @@ &mdss_dp3_phy {
 	status = "okay";
 };
 
+&pcie3 {
+	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
+
+	/* The power supply enable GPIOs are reserved by the secure firmware */
+
+	pinctrl-0 = <&pcie3_default>;
+	pinctrl-names = "default";
+
+	/* The RTS5261 chip on the other side only does Gen1x1 anyway */
+	max-link-speed = <1>;
+	status = "okay";
+};
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c>;
+	vdda-pll-supply = <&vreg_l3e>;
+
+	status = "okay";
+};
+
 &pcie4 {
 	status = "okay";
 };
@@ -797,6 +818,25 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pm8550ve_2_gpios {
+	sde7_main_reg_en: sde7-main-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+	};
+
+	sde7_aux_reg_en: sde7-aux-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+	};
+};
+
+&pm8550ve_8_gpios {
+	vreg_12v_x8_en: 12v-x8-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+	};
+};
+
 &pmc8380_3_gpios {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio4";
@@ -946,6 +986,29 @@ ssam_state: ssam-state-state {
 		bias-disable;
 	};
 
+	pcie3_default: pcie3-default-state {
+		perst-n-pins {
+			pins = "gpio143";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		clkreq-n-pins {
+			pins = "gpio144";
+			function = "pcie3_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-n-pins {
+			pins = "gpio145";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	pcie6a_default: pcie6a-default-state {
 		perst-n-pins {
 			pins = "gpio152";

-- 
2.47.0


