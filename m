Return-Path: <linux-arm-msm+bounces-84191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D250C9E8D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E95173A8F7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2954B2E92AB;
	Wed,  3 Dec 2025 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="bXCHSoso"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250662E8B8C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754958; cv=none; b=acglc55yVUUweYIv0+aW6VQHydcW7tl5MhhmOAg0ddGJh6JUFnsbXO5ttwgkucxzr57iDnIfKplXHh1wWbO2CVhC05uNQVDyFCCt+hBZq6r6CLjvc8ulE24+k+EYFMNG7QPRmxj3s3LBjb5Fdg6upGtTgyXRhpisGUPXf8CgQ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754958; c=relaxed/simple;
	bh=hfP0nU3w2S8nG/8e3ByW8GtMiuMAk7Jsskn5IpMiKb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOLOk+cy7gw8eyVZc+ZXY+GOWxTD9zuuygV7sgUg7tyaxJcYN16+ejM/SAoqO9mpFiT0cXPDug2nxdZ/O+v75ZLFQrbP3mWb6EnYwiap772Gx+O6Y9lWbQOGJYi2oAcdFhOj6K03Idzq9Sj5V4BdV1N/7Je5ECWw3AzBfvKQwmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=bXCHSoso; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764754954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kq5rH27xwmTmukjTaQBvh9CQm+H4odYOqGDAFEBWQas=;
	b=bXCHSosoawl54kEpqG/FbR3DcgzbWi6uDhJMKuEFUTC1yJKhuNk3a/fGipbtrYuUIFrbLj
	sQd/VP+aqBuSwmIaVWrIEbx9//EjD+hjdONoWScHK5e9UZuKhBviZr1dX45tzMHVQlUd+u
	DC/ALred8Fu/YfRg8AL07pzwB4/FkaAqH7ThbaLqUWlzC6RLLReptR4UCYgTPKgNzPSlYk
	r1MZe6ATx82PmwN1dgHfVhkPEGa8moWQ4gnrdi0btO6ro7nZdVGBNt81AQLU6UJl/l8vmp
	iOzEeY+8u1I1V338dmrKTl3Zp+KnyjjrJSYm0JSyA2rnCeuTkiy6jsVtV3Rj5Q==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 03 Dec 2025 01:40:56 -0800
Subject: [PATCH v5 07/12] arm64: dts: qcom: sdm845-lg-{common, judyln}: Add
 wifi node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-judyln-dts-v5-7-80c1ffca8487@postmarketos.org>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
In-Reply-To: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764754921; l=2141;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=hfP0nU3w2S8nG/8e3ByW8GtMiuMAk7Jsskn5IpMiKb4=;
 b=abXJNSH8MiBBcIfMfS9aotDh4FmRp/KBQM4cqSiuY4GqI8SUVWee783kdXiAUGMetObHoGiI0
 xPhhVNDQfjBAleLptYd9J8lX3KkEZL2ElichUUIVogVExWS7VbNqtd0
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Wi-Fi now works with this patch and relevant firmware

ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
ath10k_snoc 18800000.wifi: qmi fw_version 0x20060285 fw_build_timestamp 2020-10-12 23:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c4-00645-QCAHLSWMTPLZ-1.336037.2
ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc 18800000.wifi: htt-ver 3.83 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 315fdc5dc392..f12e785db893 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -673,3 +673,15 @@ &wifi {
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
index 49d285c3e6b2..8b88f75b36af 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -145,3 +145,7 @@ sde_te_active_sleep: sde-te-active-sleep-state {
 &venus {
 	firmware-name = "qcom/sdm845/lg/judyln/venus.mbn";
 };
+
+&wifi {
+	qcom,calibration-variant = "lg_judyln";
+};

-- 
2.52.0


