Return-Path: <linux-arm-msm+bounces-63812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A54AF9FF4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04DE51BC5F5D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95C92550CF;
	Sat,  5 Jul 2025 12:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="7w6b/SY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330FC231845;
	Sat,  5 Jul 2025 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751717613; cv=none; b=USNtZxVfvqAT7AX6yXxZOq+AwpFhkxD96B/i9PZxXFcSzhI0gvEZgFX0Kxva+L0HNc9StwVyX7q3SMXoZapdbM0RU+h5f/BGm5TTnI/tGzU+TsDkmwJ164JdCvcs4eaBV1XbwtxPTA5rtn2lxrVsZQWzzF5QoblU+tyiA84c3HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751717613; c=relaxed/simple;
	bh=0ad6ed0HGZ95s4zAkWknAGZPfzVGMWkGB7DI2e8VmGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Su41DoFMpKb5qP53dX8rtePh+7tE9VetI5Kv86eL5SqZLKC9osingbozFg7Ai8rraw03fRSX8kTghFCzAygRu63ntBFdMM8Gj9P/NdvqqZStvGUek5F+oSW0V02aF8WCuJWGrYcfY/kdMTB1GDAniQNN/jdstZ4uqwZoycg6mjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=7w6b/SY6; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1751716995; bh=0ad6ed0HGZ95s4zAkWknAGZPfzVGMWkGB7DI2e8VmGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=7w6b/SY6PNGJLWQp1GXPhBRt5BXJJ/5MHtk2jLT/NSRKc39LxJJO1qJXmzgaG5r/u
	 aH2YHTaprCp1QWeeE1/UkK5Tuog0ljqzYAFF6NiiNT3uAtD/yfAish09DTiqQQWiTc
	 /K1DBytg0g0nVjfck1hBAiz6sTvM2DoRM0AtMxe0=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 05 Jul 2025 14:03:07 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm632-fairphone-fp3: Add AW8898
 amplifier
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-aw8898-v2-3-9c3adb1fc1a2@lucaweiss.eu>
References: <20250705-aw8898-v2-0-9c3adb1fc1a2@lucaweiss.eu>
In-Reply-To: <20250705-aw8898-v2-0-9c3adb1fc1a2@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=0ad6ed0HGZ95s4zAkWknAGZPfzVGMWkGB7DI2e8VmGA=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoaRSBd4sNBdAYs7CHViVVJJgrvX/Xl+ivwTvdv
 cg7vthZUYCJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaGkUgQAKCRBy2EO4nU3X
 Vtp5D/0fuJ2SqHJN8pvR+lQpIfjMlY47t9HN65V/l0vUFyXYigJxLlsU2MzMYD6MmWkjkll0Yf/
 psrQocNygGPfSTiFT6KUMnF7N/JdYhsirvhJyiktCjH5yPArWthn+1nqmdNKtuF2OFTULHCjfP+
 l/9krcrt2etSVk5k5YH/RDxS0HTYOet9j8Z2WCUynmeGaO6rQQUN42A4SGTHXGdbuwXGQs8RVCJ
 0UC5tF+6TG3rYKY19nXSzaDC+ZW6V+JgJIGWOuC2D8hh22bFfJ90aVA9ZzpSEIeNNntWNcdEVuT
 uyrIPtPuHmMSlpTNfm1oXMNRoxc4NjxGk31+s8kKOdc2C8/4TfS9etx9kFzyr2O3OwYjkeLxeMU
 gMiNrrcgp5SrBVRxz7gbR2/WXTUQofSyWUJlTSd9X0LK9hSP+Hhgu23sj6JvrMyY+tOt/0SN88R
 2GrQtiw/wCaHPceN39Jo0VvDMYU70W09+j856QTzSTN4dgofGkF87RYgZywJh0TJ4q9lIwdnPZ2
 Rz2m9thhFgjOENrSXqV2nAuh6g3cDgXhs+fDtce/XTeDL74ElybnYOrgYdqBEWo2NvmkoxACG11
 LDU/3oDOOCR6OCQJLBjYa0OMTJMH/KCHOlyq/wzrnLnysQR1lWJ+toK9YzUjFgI0iwfQls1C//h
 ZL0YTkw77iM0J/A==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add a node for the amplifier found on Fairphone 3, receiving sound via
I2S from the SoC and being connected to the speaker.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 55a45b528bd3f1bf9b6fe7882753338b43c62271..053ed5cb6b2301cdf3f5e62a74bee535062bf845 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -97,6 +97,26 @@ nfc@28 {
 	};
 };
 
+&i2c_6 {
+	status = "okay";
+
+	aw8898: audio-amplifier@34 {
+		compatible = "awinic,aw8898";
+		reg = <0x34>;
+
+		reset-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
+
+		dvdd-supply = <&pm8953_l5>;
+		vddio-supply = <&pm8953_l5>;
+		vdd-supply = <&vph_pwr>;
+
+		#sound-dai-cells = <0>;
+	};
+
+	/* Fairphone 3+ only: Speaker amp TAS2557 @ 4c */
+};
+
 &lpass {
 	firmware-name = "qcom/msm8953/fairphone/fp3/adsp.mbn";
 

-- 
2.50.0


