Return-Path: <linux-arm-msm+bounces-83195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABD1C83EBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 72603341FB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2B12D9481;
	Tue, 25 Nov 2025 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="SNSsSDZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8292F7ADC
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058403; cv=none; b=qocPDxQFOVHCnjOue5h6L1bJhpD+awt22iEfUK/wiB/56fWDrjeY1GuXUU7uCVMfFL86rG6DYXMhwF7zD9mhG40s12+9T0RjXWITpGGglq6UILRIsL2ZPaeMFudbICfjDtr7F24PjwN7h54kBHqp2GVO6of3iFf059cEOFuFbbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058403; c=relaxed/simple;
	bh=DeG1N6uEOaazygRr79UZrjvcZl0L/k2GjaPNAp7TgyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kW04Td8Dk/W2HCUkXqPecnyQjrqI+uOQIkvG/DuerG89HJFdN33V0I5NHvXmN7t/kS6aQdHb5FwuBjCUgViNlxBwXB00JVpN+VUDX5ojA5BcuFKGWgIZUShMnMR/rDknRi1BSckqvjplXqFesqWL2cRWFNf9KByLdkc+sc6iPNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=SNSsSDZ5; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zogvx0mTm0r77NhERHLCIyvLN6ItGS2XXnwq9Nb59BA=;
	b=SNSsSDZ5w/w+kjOrsWHX2j7Uu/8lXrKGQc0fOdaK9AeocHi5EvOhMrFnok8+2I1F0eyR8T
	DwHKqcM75xIE46BENvcElo/97toVquo/123v7QhRU98spGfKFKOmdPUCMjz6toRtujnRU9
	y6IksKWzw/hXb9cxq3W+pDjDAkx+q5snneW8pPB3ub4FTpItp6d4XJnTdgfuad1gc/LpzT
	BKbP2i6FYds2Fm0fzHhwe0hGodFYN+AxLYG80tCym2Z83BSS02bXy9BNZnQHygBghHH6R/
	Hguwwbty6F+MZ08E3K+leS0AaC64go4ScrNeyQPtrocn+PF214uHmeil46xtdQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:37 -0800
Subject: [PATCH v4 07/12] arm64: dts: qcom: sdm845-lg-{common, judyln}: Add
 wifi node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-7-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=2314;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=DeG1N6uEOaazygRr79UZrjvcZl0L/k2GjaPNAp7TgyY=;
 b=eJwNdytQEUi/8IXLx3hNnqwVVRzJBPkwAK7E/+QfshzM3x6CniP0AGIzSXJHZYS80s1siIBBX
 kF+WENG3hOUAhRNs73MKBZApYoMiQSzNgzAwj1DbsnSnE1HMMCR/okS
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
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  7 ++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

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
index 9ec2edf6134c..a61f7bd65a7a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -141,10 +141,11 @@ sde_te_active_sleep: sde-te-active-sleep-state {
 		bias-pull-down;
 	};
 };
-<<<<<<< HEAD
-=======
 
 &venus {
 	firmware-name = "qcom/sdm845/lg/judyln/venus.mbn";
 };
->>>>>>> d58184825fa5 (arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path)
+
+&wifi {
+	qcom,calibration-variant = "lg_judyln";
+};

-- 
2.52.0


