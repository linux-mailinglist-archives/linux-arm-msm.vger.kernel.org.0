Return-Path: <linux-arm-msm+bounces-74322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEFEB8D45D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 05:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6053B442DB1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 03:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E36267713;
	Sun, 21 Sep 2025 03:33:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from hamster.birch.relay.mailchannels.net (hamster.birch.relay.mailchannels.net [23.83.209.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFF927455;
	Sun, 21 Sep 2025 03:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758425612; cv=pass; b=L9rej0VeKps8tgD9wrOB21t3jaR3gzT4yrVGmdLbiciM5BdkWCb+aP/EzAbJ9lpRrSK7+u4f/hQZjuQU7mIyVbW6YzUIju8NWNwwkgXPNNNh7MbYivnc8y/ldNUUpxk7vmkeV1uDBBj1n2HZp4zONnjEOQ6VRxEinKwboiUGD0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758425612; c=relaxed/simple;
	bh=PVMoivnEik1DIY0Hzd2fPY7u49lkXE+WS3VLttu1i08=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=AnWE71h7JqoTC+UxTKzUz7o4HEzRozT33zf/Aiy/GueVd5vZhaGGeeTZhfAREW3lXM+wdMC+rbJrHQLLDdTk1hluYOCoSVzf8j0UkDOJ4DJGBFgTay/tjQiZg1j4apHCoYYFv8cCQtqb+N37f03DdJ0uzOuHYxfZvy7o5hE8AqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.209.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A5A6F3A1795;
	Sun, 21 Sep 2025 03:08:16 +0000 (UTC)
Received: from uk-fast-smtpout7.hostinger.io (trex-blue-3.trex.outbound.svc.cluster.local [100.107.19.150])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0F5C53A12B3;
	Sun, 21 Sep 2025 03:08:13 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758424096; a=rsa-sha256;
	cv=none;
	b=hsH2xnkgwjI3cmRKQRtAGlfGfbWWuiQIAPar49p6jqLqqQWPqEzUHpPB1lHu/xz2hrVGIf
	lNiE6zqBTS9LvFRdzK1w9PD4ksuUMuFEPaXHjRUhjdQwQWkm/1KUxfZnxhPEoRzm8c9HkU
	CV7SMZbjO7eEOywkJj/2QOyqB4mIzvyPmVSZa87I9lHwXBSpFPkeulatEhALTeFN/p0gEh
	1P0j3Q9fef/58juHX4KrG0fkDn2lJFNKbZBcXDEnHSundATJDKq6vqXHxZR/e47q4fecdh
	TO1ELLNmYP0hpClIjrToGA6X2YwkUrhHQPQL0u7Ea1QODfLOrcRIhZu5ySMq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758424096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htJew8QMLOEUP66Gp7UhbSejAjCqnyPou7MqohxoSO0=;
	b=7EUIAh2u2O4T/yoqouyw8HsW0Z9ofwM9QVz7litUcZkALBqNcSDTzEImkjaEmHMLqC+i9Q
	fo72RydGRwI+xKPlhMc34J1w8KVtKRUya9bQjhoP8SwSPizW4EJp15ldir0lH6T7rL9vKp
	U4D53gahC/v9ybw+CF5DDsoUDn1lvAngSTLLpO8qsatFPHc7PDBKBmYoRtdXeKy/CbMMqj
	fupMrCCadGEeCF2zJXmvaGnU0QXsGMhycSrokGCwt0445CT+Xmh3S7MVuDS2s/0CYTFEdq
	W6DXUPfJgyvaNllnj3cgKrUVzm0gMLW09pY/xWiqEDipXetCT9+sP8oPRpCdAw==
ARC-Authentication-Results: i=1;
	rspamd-5b85487794-f4lt5;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Celery-Glossy: 24e473bc44e8ecb4_1758424096575_64658875
X-MC-Loop-Signature: 1758424096575:1204010087
X-MC-Ingress-Time: 1758424096575
Received: from uk-fast-smtpout7.hostinger.io (uk-fast-smtpout7.hostinger.io
 [31.220.23.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.19.150 (trex/7.1.3);
	Sun, 21 Sep 2025 03:08:16 +0000
Received: from [172.17.0.2] (unknown [180.253.43.125])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cTrls0Ct6zHTnH3;
	Sun, 21 Sep 2025 03:08:08 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 3/5] ARM: dts: qcom: msm8960: add I2C nodes for gsbi10
 and gsbi12
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-msm8960-reorder-v2-3-26c478366d21@smankusors.com>
References: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
In-Reply-To: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>, 
 Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758424077; l=3558;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=PVMoivnEik1DIY0Hzd2fPY7u49lkXE+WS3VLttu1i08=;
 b=DGsdLX96gfKq8IfoFhpDJMtmfnisWLmGJo3lEmyxNxBR55NiDmjeWFWwPtPQ5XBKIzZN4KX2G
 hBNP/sRVIRGCTGbhHsr1jknRuD0OEvmfi4dFuA3uHmXeDIsnY90hsbo
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 21 Sep 2025 03:08:08 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68cf6c1b a=hVqNbC/oQIbyndLMfyRB3g==:117 a=hVqNbC/oQIbyndLMfyRB3g==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=YyzVwZI-u7su0ceKGR8A:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfFLigUCSqbhdFK0CxH9XBiXvTtIOW+PJvn/n5+D6jOuXo+gy4tTW9HZl5bW2JUINIXlpV4TSy3LKoRhKIXicES8r7Q4ae+LtkDXx69O2DT7nacocqJZ+ qBxShLPUBtoRIAKNVz80mOugY/epYYrRBrqAJcUz37SvnxEMlaF2VJpKoshhgWS5Qeyq5waYcZJrMDmpPB4sKeOZzS/4Lhrsz/oJVRWUWKpx3gIynXXdaMn+ 7EG+x3SDV+CrdMyM4+KkNe9+rAOq4iN5/fdZpnSGlICzV1Pd7YSR6hze8P9c07hp/O0E68CfF2oyuavOwYxcyR4hEZiRIlg0QdIk2zH47QMVfHDYBQdJ43Ei IG9OietMAZ3rOrpX1UTYrguW/KMQY3ytgFfiMpDmu3TPrtyCV0wcDTJXHMpQQh7G/dpcQC+kcmPrjXjN7QC5Ushd4sq+15AwI6UYcRL2ccPb2hW8g/M2qd8H LMkG8MAi9SyD9fRv7/XOks6LXrIA/RG305wVVJFe7YDbMscuwnXWbzBzVA0GMsl5DvPHClnMY46F8anEfqTB7pHq4c5dpmCtE9p0qA==
X-AuthUser: linux@smankusors.com

These are present on msm8960 and are required for devices such as the
Sony Xperia SP, which has NFC wired to gsbi10 and various motion
sensors wired to gsbi12.

The nodes are added disabled by default.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 96 ++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 097baee47897408a581a578d18f912d6e3567dd8..890b34bdf8c3376659570218500e28ce5809c26a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -149,6 +149,42 @@ i2c3-pins {
 				};
 			};
 
+			i2c10_default_state: i2c10-default-state {
+				i2c10-pins {
+					pins = "gpio73", "gpio74";
+					function = "gsbi10";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c10_sleep_state: i2c10-sleep-state {
+				i2c10-pins {
+					pins = "gpio73", "gpio74";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
+			i2c12_default_state: i2c12-default-state {
+				i2c12-pins {
+					pins = "gpio44", "gpio45";
+					function = "gsbi12";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c12_sleep_state: i2c12-sleep-state {
+				i2c12-pins {
+					pins = "gpio44", "gpio45";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
 			sdcc3_default_state: sdcc3-default-state {
 				clk-pins {
 					pins = "sdc3_clk";
@@ -364,6 +400,36 @@ sdcc1bam: dma-controller@12402000 {
 			qcom,ee = <0>;
 		};
 
+		gsbi12: gsbi@12480000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x12480000 0x100>;
+			ranges;
+			cell-index = <12>;
+			clocks = <&gcc GSBI12_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			status = "disabled";
+
+			gsbi12_i2c: i2c@124a0000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x124a0000 0x1000>;
+				pinctrl-0 = <&i2c12_default_state>;
+				pinctrl-1 = <&i2c12_sleep_state>;
+				pinctrl-names = "default", "sleep";
+				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI12_QUP_CLK>,
+					 <&gcc GSBI12_H_CLK>;
+				clock-names = "core",
+					      "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		usb1: usb@12500000 {
 			compatible = "qcom,ci-hdrc";
 			reg = <0x12500000 0x200>,
@@ -508,6 +574,36 @@ gsbi8_serial: serial@1a040000 {
 			};
 		};
 
+		gsbi10: gsbi@1a200000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x1a200000 0x100>;
+			ranges;
+			cell-index = <10>;
+			clocks = <&gcc GSBI10_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			status = "disabled";
+
+			gsbi10_i2c: i2c@1a280000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x1a280000 0x1000>;
+				pinctrl-0 = <&i2c10_default_state>;
+				pinctrl-1 = <&i2c10_sleep_state>;
+				pinctrl-names = "default", "sleep";
+				interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI10_QUP_CLK>,
+					 <&gcc GSBI10_H_CLK>;
+				clock-names = "core",
+					      "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		tcsr: syscon@1a400000 {
 			compatible = "qcom,tcsr-msm8960", "syscon";
 			reg = <0x1a400000 0x100>;

-- 
2.34.1


