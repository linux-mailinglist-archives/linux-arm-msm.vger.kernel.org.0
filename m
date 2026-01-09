Return-Path: <linux-arm-msm+bounces-88289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 106C3D0A8B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 15:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD98030115E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 14:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0449735CB8E;
	Fri,  9 Jan 2026 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KQmAdKsg";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="6xk9RoXU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E63333445;
	Fri,  9 Jan 2026 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767967448; cv=none; b=taDFSu34BUzzJtXb9P+okaShYHzaxwKpw1ed4UHYD3T5tNOfgSWXArTqFqJ4wKSUNQKs4c+2vMSVRyGtFZqqMJWFzuWS5WM7aZbdTKP8ehZJ9mBYbQcQDOzWRCjTQ3gmYNloQnfPzX7pI65NFMG5FsPTVZaSdYbCJnNXLSE+7T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767967448; c=relaxed/simple;
	bh=wA1+cXFQawSrla4wIzotCBXLCi2C+bW374nfHL83f7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ISGNab8RUYjGPSY1rHO5sq9i63l0qxNIfMFHoFGlgTdRzMreWH5GqxkURt+R0HrMeZlZ065zZHNs2ib5yJeYn2z7Z+leB45MhUspp0D5LgvD6rAwdy/E4aTuSeaW+tP6bYzBwAOtlZEtkbjDi7pK3tyW1fMBWsiRgkxiuHtVu1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KQmAdKsg; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=6xk9RoXU; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767967444; bh=nnnkjD81IMJfCk/lVcXXiqL
	IjCEACoTN3OksGrAiANk=; b=KQmAdKsgdoHCFIHtFcAt8sIJjrrzVPvbV9IzHlywDcxjOV6p3t
	J2yExsZCcS31sDlkp7CK9m7PwtfGcYx4x5kN1i75j5ud77w1EfwkPDDGiA13qp3F7wfiqM8KLGq
	UJsbzaiCMRq7TSlyFobCmk/kGux1/sxu6nK1t6RRgrcAtPkVbzDPVelsHYkZn2q4u7jMrihHGYw
	qkLvBO7CoNMwljx+QsQdSEnCtrP1jVtTlfjDriQGc5MmbyBPVgMX9TjcCCBPWyvWJlGswjveOAu
	WgDaSsMj+B3FS11Mosv9lbq0Nv9nYw+YPmtk8Jb6AtaRpHxgyJenwZ/aSjxInNdsQyw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767967444; bh=nnnkjD81IMJfCk/lVcXXiqL
	IjCEACoTN3OksGrAiANk=; b=6xk9RoXUbhi5hw6hHbOIUAJ2WBTc8C0Dh5hM3Bh6EtoqPOoto+
	JN7IysvDmgModiIcoqBawvCPz86GM1qk0SAA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Fri, 09 Jan 2026 17:03:59 +0300
Subject: [PATCH] arm64: dts: qcom: sdm630: Add LPASS LPI TLMM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-qcom-sdm660-lpass-lpi-dts-v1-1-d3eb84f10a39@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAM4KYWkC/x2MQQqDMBAAvyJ7dmGjshC/Ij1IsrYLTbRZKYXg3
 w29DMxhpoJJUTGYuwpFvmq65yau7yC81vwU1NgcBhqYHHn8hD2hxcRM+D5Ws0bFeBqGzTueiP3
 oJ2j9UWTT3/+9PK7rBgBo3C9rAAAA
X-Change-ID: 20260109-qcom-sdm660-lpass-lpi-dts-cf9164069394
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, Richard Acayan <mailingradian@gmail.com>, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767967443; l=2737;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=vLOOoDyNe3II78tHZBs2gs/SYnVus5gac1a2Z3jGrSI=;
 b=UJ2Io1i+q+wiOhT055avFwN5DTRSNudqROdMmLXPNlPYJAZoHWXfxNBBcaYqot/luXdVicbqS
 KJOmWP41UrHBUwMWGWyx6IEA8MPcgaYxeIQQUxwvItpXYRsGn9KgFmb
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

From: Richard Acayan <mailingradian@gmail.com>

The LPASS LPI TLMM pin controller controls pins for use by the analog
and digital codecs, such as the PDM bus, the digital microphone pins,
and the compander pins. Add it to support the codecs.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Co-developed-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
This is a patch introducing support SDM660 LPASS LPI driver support in
the dts
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 73 ++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index e38d9648a1ac..4a72e0718fe4 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2269,6 +2269,79 @@ mmss_smmu: iommu@cd00000 {
 			status = "disabled";
 		};
 
+		lpi_tlmm: pinctrl@15070000 {
+			compatible = "qcom,sdm660-lpass-lpi-pinctrl";
+			reg = <0x15070000 0x20000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+			cdc_pdm_default: cdc-pdm-default-state {
+				clk-pins {
+					pins = "gpio18";
+					function = "pdm_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				sync-pins {
+					pins = "gpio19";
+					function = "pdm_sync";
+					drive-strength = <4>;
+					output-high;
+				};
+
+				tx-pins {
+					pins = "gpio20";
+					function = "pdm_tx";
+					drive-strength = <8>;
+				};
+
+				rx-pins {
+					pins = "gpio21", "gpio23", "gpio25";
+					function = "pdm_rx";
+					drive-strength = <4>;
+					output-high;
+				};
+			};
+
+			cdc_comp_default: cdc-comp-default-state {
+				pins = "gpio22", "gpio24";
+				function = "comp_rx";
+				drive-strength = <8>;
+			};
+
+			cdc_dmic_default: cdc-dmic-default-state {
+				dmic1-clk-pins {
+					pins = "gpio26";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				dmic1-data-pins {
+					pins = "gpio27";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				dmic2-clk-pins {
+					pins = "gpio28";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					input-enable;
+				};
+
+				dmic2-data-pins {
+					pins = "gpio29";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+		};
+
 		adsp_pil: remoteproc@15700000 {
 			compatible = "qcom,sdm660-adsp-pas";
 			reg = <0x15700000 0x4040>;

---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260109-qcom-sdm660-lpass-lpi-dts-cf9164069394

Best regards,
-- 
Nickolay Goppen <setotau@mainlining.org>


