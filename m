Return-Path: <linux-arm-msm+bounces-75456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01EBA7F77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECD9F17F2BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABFC221D9E;
	Mon, 29 Sep 2025 05:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="bzX39LXf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBBC233721
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122358; cv=none; b=H1yrGzurMjLOoae+Jnp+qbfictpBJLpo3e1oC8rjVAD/D2k1Fuz+ExOdjngxNkndFtEnQ3lz0LGBPQdbn3hSpXio6/m8UqtJ7atg1Msx5kHgnokbfthe0AeV9BLt4DOJCXWfVnXhMVT+R9ob0KN5vv+In3LSZ9jYFmIrXQXDyRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122358; c=relaxed/simple;
	bh=ea2CMrIhdhrocYtvuonXX0OjVHOP7ncuXcRC6wPA2Fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptgfNDXHY/zz6Akom21F4/LoYkci6/r8jjlzWnomks2g5XcRipSpEQtSr0bZXRaUmZF9FDAKxl5VUty04tQ21nPqIUuuxxo3XYv+/TNet/o45qg4zlarvp5FidHWEKlAg55dBYo9zdpuNv/m3Z+ukBkokAf1bfuV7ueJ+NKXVVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=bzX39LXf; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759122354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tm9vlQX40ej5PBTaY9dQwgUMohvdv4NRPsWnJKDi4Dg=;
	b=bzX39LXfBLV42ffcgFcDqu7AZoNvEkelVPniIvQ1ZSoChBMP8o4UV9OqAzft2IcNbd1Ud9
	qCoXNcrFhIX8i1zT6xkCMuxJoR/SOcrPIOtyCGScOQxDrLqYBynAKWp1MkFVZuEwk0SYbF
	l5bAW40/smgd/GWg3LD+KinyWpz5pAzxbQyHInsMd2uwfKH5ple0mSsICYJR5hAeNhILyk
	qcMOMr/1wuoanYXM9Q8mbUfyt88YU0cYB6oTDfYyjF6m31+eGrl2ti5urQ+8GC7ci1N1q+
	2zhRxat7q/njGFnRcuSWYaE2or2v1U2gS1Y4glnihOrRjAhbq7lGyZbpIb9uYA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 28 Sep 2025 22:05:30 -0700
Subject: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}: Add
 wifi node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
In-Reply-To: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759122330; l=3614;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=ea2CMrIhdhrocYtvuonXX0OjVHOP7ncuXcRC6wPA2Fc=;
 b=yL3tbxXw7tu0vky/hUp3Kgo0fhp4RHYE66vgfPuYQepuOUKt9ezfg/6ICUGwmqQc51razpmDf
 kpHaiMxNbgCDUoqptI4JyTJNutouPtCqd4D+Hr0wmdljhiFhsxWV0iK
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Wi-Fi now works with this patch and relevant firmware

[   21.488274] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
[   21.498477] ath10k_snoc 18800000.wifi: qmi fw_version 0x20060285 fw_build_timestamp 2020-10-12 23:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c4-00645-QCAHLSWMTPLZ-1.336037.2
[   22.973165] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
[   22.983265] ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
[   22.992048] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
[   23.045368] ath10k_snoc 18800000.wifi: htt-ver 3.83 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
[   23.130581] ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
[   23.139008] ath: EEPROM regdomain: 0x819a
[   23.139018] ath: EEPROM indicates we should expect a country code
[   23.139029] ath: doing EEPROM country->regdmn map search
[   23.139035] ath: country maps to regdmn code: 0x5e
[   23.139042] ath: Country alpha2 being used: KR
[   23.139047] ath: Regpair used: 0x5e
[   29.382642] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a630_sqe.fw from new location
[   29.395932] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a630_gmu.bin from new location
[   31.774723] Bluetooth: RFCOMM TTY layer initialized
[   31.779713] Bluetooth: RFCOMM socket layer initialized
[   31.784947] Bluetooth: RFCOMM ver 1.11
[   39.138098] wlan0: authenticate with e8:9f:80:dd:68:22 (local address=ce:db:e1:ab:08:30)
[   39.146318] wlan0: send auth to e8:9f:80:dd:68:22 (try 1/3)
[   39.180484] wlan0: authenticate with e8:9f:80:dd:68:22 (local address=ce:db:e1:ab:08:30)
[   39.188697] wlan0: send auth to e8:9f:80:dd:68:22 (try 1/3)
[   39.196651] wlan0: authenticated
[   39.202286] wlan0: associate with e8:9f:80:dd:68:22 (try 1/3)
[   39.211036] wlan0: RX AssocResp from e8:9f:80:dd:68:22 (capab=0x111 status=0 aid=4)
[   39.290235] wlan0: associated
[   39.293363] wlan0: Limiting TX power to 21 (24 - 3) dBm as advertised by e8:9f:80:dd:68:22

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 0f0a3f471f48e26cc48feb1551093599fcb35d7f..2aa8f7d2f80c58b5b1f66d797879c43cd6d4533e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -678,3 +678,15 @@ &uart9 {
 &venus {
 	status = "okay";
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
+
+	qcom,snoc-host-cap-skip-quirk;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index d60094f864605f7e454693d73efb63b9a099ecad..3106fdc9b679bc6a43a1a490c61b73a63003f7e1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -151,3 +151,7 @@ &bluetooth {
 &venus {
 	firmware-name = "qcom/sdm845/lg/judyln/venus.mbn";
 };
+
+&wifi {
+	qcom,calibration-variant = "lg_judyln";
+};

-- 
2.51.0


