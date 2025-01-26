Return-Path: <linux-arm-msm+bounces-46162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BD1A1CE8B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 21:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC68A1625A8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 20:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC767188CD8;
	Sun, 26 Jan 2025 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="5bIM+BGi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C00157A5A;
	Sun, 26 Jan 2025 20:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737925064; cv=none; b=t4RK7v4vXC3Vvh7Wq+7JQpImZlOpvCZHwGvXeNh3Ze/WiPElHFJWrO8lNT3y/dpqpCWHgmPX8XToBuqtrNsUEY22cS2cSoYt32FzPkBn4dSQ86Okc0fWHEXwwRYitWgnrnNscXQNFYdn68Z3a5Bfp7yuTyFmcHHc2fBYOI64Tts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737925064; c=relaxed/simple;
	bh=waof2bb86V3ehXDWnkiTnDsneWiVuCdsHRRExFo3JxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PY2PHawfE71UR20mHeLbp5Inui+oRljsz64PAd5OlxifVFWzhvli9LM1pzA1R2ByxN/nm3kSh7wJBhU7kbaoWnhAFOhMGJBMtNGi2QmtDELAFL9d2q0rWU7kBRq2EA7PRJUW23tpG/jxk2OX5Hm3l0g4DyjC1B41tXwSAOkiuxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=5bIM+BGi; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1737925055; bh=waof2bb86V3ehXDWnkiTnDsneWiVuCdsHRRExFo3JxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=5bIM+BGiX3aCcikq3m1WO8pmS1fRe1bAdKdEC0MSkyFkrWEly3u8fE6mzjhfYHMAw
	 XJs0weIL0bLk/YnSKU4ogE8sRvrbPbQTubvt1lGKretxnApASRNuQOjUl4/5T1HNJJ
	 QRPc3FOQbuZ9Yv2mLTXT9i6ZsTYkBoDgVGrvYfbc=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 26 Jan 2025 21:57:27 +0100
Subject: [PATCH v2 8/9] ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250126-msm8226-modem-v2-8-e88d76d6daff@lucaweiss.eu>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
In-Reply-To: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=waof2bb86V3ehXDWnkiTnDsneWiVuCdsHRRExFo3JxM=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnlqG78E13Qa8+1zNAHIOwtTjL9h7MNRFQnFQYv
 dwPMKydoV+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5ahuwAKCRBy2EO4nU3X
 VpLhEAC/Ft52QYTcNdntWbQRFt559/Qihw8oUMi9fbSr2zP2a3YzOGfeW9+yPZqLSjdEoWE2dJK
 sXCMZUfHaYsYyTLPNIJTNkWQLfLQsyJQbcscSz9WKFo/24qTJjBsZ6ghYfv/z/9fdJU4BBWAy6y
 jZhr95wMqhrXtcM19NZemA7a5QjInvydA3k6YRhqNkHIAq6M24Coed/cWnaY1O34uE9Ja1tf75i
 eeJ3b+6bf5dRHXVy4B+a2Un2IJB8tVL8YsACCk+8U+x4oS2lvtkWYFurFxScRvTtX61a5VnQr3q
 g7OnFT0ixT62eD39+d3lyYKxazodctZbkp/r/Ah4oxd4HwxO+kUyVLKe+MDB5PKeU8GHgzrf+e/
 051TTE4COK6orJnbcXY1+T8zvHEpkU4a9hM0vzAH3GEQ+mvoOz/GVtvh7AOgF9y/NwxkjLA673w
 v8P1fAgfzMzS4aMctAXlU3lJRcZds+dn8fyjSza1emkbqnnUWbWMA65bDKayLg7juw2hKrhLTfx
 uOU3uNea23Bus2hdHFh8UG/m2rE6zbEPanBgdbIdfsjJAfj46GmxZi0f3LRIcNC0mUu5uYRB647
 Vf7wPVtP8reh4H1qv/xbjgKL6kZrprQMtQ/CZ5J9Zeejm1VDHbov9QMnbhVmffBfxkdOWl9DizN
 lWp0u7BMpEcRaRw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

BAM DMUX is used as the network interface to the modem.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index f7f57c3f583557830c0a6dc9f0eebc2ddebbbe3c..5e82d871b81019d2f4f84d1228e8e9278ac44be3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -914,6 +914,18 @@ spmi_bus: spmi@fc4cf000 {
 			#interrupt-cells = <4>;
 		};
 
+		bam_dmux_dma: dma-controller@fc834000 {
+			compatible = "qcom,bam-v1.4.0";
+			reg = <0xfc834000 0x7000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+
+			num-channels = <6>;
+			qcom,num-ees = <1>;
+			qcom,powered-remotely;
+		};
+
 		modem: remoteproc@fc880000 {
 			compatible = "qcom,msm8226-mss-pil";
 			reg = <0xfc880000 0x100>,
@@ -949,6 +961,20 @@ modem: remoteproc@fc880000 {
 
 			status = "disabled";
 
+			bam_dmux: bam-dmux {
+				compatible = "qcom,bam-dmux";
+
+				interrupt-parent = <&modem_smsm>;
+				interrupts = <1 IRQ_TYPE_EDGE_BOTH>, <11 IRQ_TYPE_EDGE_BOTH>;
+				interrupt-names = "pc", "pc-ack";
+
+				qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
+				qcom,smem-state-names = "pc", "pc-ack";
+
+				dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+				dma-names = "tx", "rx";
+			};
+
 			smd-edge {
 				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
 

-- 
2.48.1


