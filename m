Return-Path: <linux-arm-msm+bounces-39625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C24639DEBA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 18:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52B69B2247C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 17:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542051A08A8;
	Fri, 29 Nov 2024 17:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QsGPh93C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264181A0731;
	Fri, 29 Nov 2024 17:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732900844; cv=none; b=EndrIfjJ5b47Kjvb1BKvhVcQOf4ClXjmSWNT2YGFWHYb9UaDQH70Y89zmRh1QsmL6O9Xye32pD9XkFleVnEc415OJayzSYn/SBv8YZCFqe/+EjV/uZWX2khNenobUa4/rh+A2DID5mEzfYdYxIvPbKajzzNvZ1aQJmn+be5QdR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732900844; c=relaxed/simple;
	bh=HIFaxlqo+/Dswb43eFBozE9RYxmcSo9u+m4eX/g1nNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vj8W6E0mEhLtT0wTUv1fT0vJRyPXzjbfMufDbyyXcqTXudVzwmr+E6B8i85ojJrAjkqxfVHR/0npI3OJg89NQefpNgYnHvh8sgi2rXdhc88YAN/4qd9q+5/oi0sjjSIxu5pZ+1KRGf8mPFtT7IqhPajJpTmKf8BZmyZhZQpc0l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QsGPh93C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B362C4CED9;
	Fri, 29 Nov 2024 17:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732900844;
	bh=HIFaxlqo+/Dswb43eFBozE9RYxmcSo9u+m4eX/g1nNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QsGPh93CdVg+tcz+3hoax3GBazbWxrHJ03zZdHT0XjcDF8YtSPWOWHM2lzEXdXys/
	 oA1yIxvJBwOS6OLLpULcy7Z2D1k6I8zAq6m0DEhZrjPKoQ2whWiW2o3dAB15yFGQxX
	 s0Qrqjm+7GDED8pNgk9huaVoWOD3uhaJLvC/oJmHeKFw/Y/MSL2QXprzr+sI65z1Zn
	 +mb4nhcHsqh9NABFsgQAA17jztRJ5CB2ZPfCQ4VYBySAR1dknOoKx0hMzG80N9L0T4
	 MfVZeadctGIOlejDUAOEKONNR/BrrELa5sNBRu3WYdVv4h0VA1xta6wdpdpabIoecE
	 yzdQ7jkwvGjAA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 29 Nov 2024 18:20:26 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: x1e80100-romulus: Set up PCIe3 /
 SDCard reader
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-topic-sl7_feat2-v2-2-fb6cf5660cfc@oss.qualcomm.com>
References: <20241129-topic-sl7_feat2-v2-0-fb6cf5660cfc@oss.qualcomm.com>
In-Reply-To: <20241129-topic-sl7_feat2-v2-0-fb6cf5660cfc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732900833; l=1806;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=G3KxcioJnl13Gm2ikYj70X8eWyh1YbIQ0yb79Nku9MQ=;
 b=f/qCRgVjYoMoiRUyMVcz5lqsaeh5NxRuxnVzMQiW5bfUBC7cY6LgjoMIyfgc1rfq3faIh3Hva
 peLyfWj3zPVAQOCKkiHfLQKvEs5bBmMI5PKqSYY+27eClJgLPTPMheK
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Surface Laptops have a Realtek RTS5261 SD Card reader connected
over a Gen1x1 link to the PCIe3 host. Set up the necessary bits to
make it functional.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 146e3700a3a34954c1653cbd8e148aeca481db6a..80fbcaea5d83e1147a74dd3320ae8fe8c953db57 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -767,6 +767,25 @@ &mdss_dp3_phy {
 	status = "okay";
 };
 
+&pcie3 {
+	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
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
@@ -946,6 +965,29 @@ ssam_state: ssam-state-state {
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
2.47.1


