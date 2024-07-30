Return-Path: <linux-arm-msm+bounces-27436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663C794223B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 23:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D77ECB23B1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 21:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370A818DF6D;
	Tue, 30 Jul 2024 21:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ecDyCFC8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272BB145FEF;
	Tue, 30 Jul 2024 21:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722375311; cv=none; b=o/9hBSBUtbBRB9Z6Gb3WzuQ4WWdJt1u4ptnP8zngYDVK5sRVqJnj3o3A6YQBX4c9QYWdALEja1auzlwMXjvj86CjHFhI74PojBpNeu4v2AXTrhna0OTOjXX2mUJzCEQA5q/C8dmotbjbgX7dlntE4dViwjlZvua3kUGHSlmtOuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722375311; c=relaxed/simple;
	bh=ctDG2bG0XENPg/VqQnbh/QCYHEzS3RNBXDCkNFEQrsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WWvX6xFPZ1mOgHA4IRIpAhrn/313p3ui6dIphHzXB4s8UvqDaX9eLxtLHw/NpzXo5xtDBFsYHy2YUXqHFCBEyXzZdBImSepwWWltTWdnS8SyQgkR7ISCmVB+cSTL2qMNTOX79CSathu9PrvnBYbyO8AcFjF15yUI87cIvGDBVrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ecDyCFC8; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.90] (86FF58DB.dsl.pool.telekom.hu [134.255.88.219])
	by mail.mainlining.org (Postfix) with ESMTPSA id A0645E4504;
	Tue, 30 Jul 2024 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1722374701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y7VCxzsf3pZpKOzW/R1A0W10YAcvNsxQEBCVv4UBoPQ=;
	b=ecDyCFC8tj0o/Y3YknQ/1XjFgL/xK8zK/tNh05ee3GnCpRiKWS1uiY9fsIbAeaDEgaG0uS
	VAeN9XmgFcysjYuUvIL8fHmdAU6QHjePaKNyzH8ADXJ/9UTvWq22Or6DiuEbEnE364jAIi
	rEcRqIrtNG+vrGCL9/P8V23RfbZUlp/K1mWWvJ7dQHbFPLFjBDi4pKS0PonY9f3veTBR2H
	M2qC7v1yb3ojCncj87QYzNr7n5ZONn1Ym991b+CaICjgfAthdVjrBiKmHEvJcy/1yBsa2k
	sGG1JLrwO2F6ipagnKt7sCnMrLsuQ74iKqleE8xf8aj7BRSkU/8Zb1X0R84dSg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 30 Jul 2024 23:24:59 +0200
Subject: [PATCH] arm64: dts: qcom: pm8950: Add resin node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240730-pm8950_resin-v1-1-26de4d933f95@mainlining.org>
X-B4-Tracking: v=1; b=H4sIACpaqWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc2MD3YJcC0tTg/ii1OLMPN3ERGPjxGRTCzMjwzQloJaCotS0zAqwcdG
 xtbUAi2aWFl4AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722374701; l=1351;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ctDG2bG0XENPg/VqQnbh/QCYHEzS3RNBXDCkNFEQrsc=;
 b=eaCm34fkaCMbKBYk9HqKth6fIVnfLE8arYDc9pLkTmXL1YaEEQ99fGMLT5VsRA0LYa982MP2H
 D7Ivvco+F4/BXmvcDeHLWbP0QWXDl7EIW4IBVD+jOfKmVnOS2sLAoFI
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add pm8950 resin node as a feature of the PMIC it should be declared
in pm8950.dtsi, disabled by default. Like all other optional components
it can then by enabled and configured in the board-specific device tree
part.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/pm8950.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8950.dtsi b/arch/arm64/boot/dts/qcom/pm8950.dtsi
index f03095779de0..ed72c6101813 100644
--- a/arch/arm64/boot/dts/qcom/pm8950.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8950.dtsi
@@ -18,7 +18,7 @@ pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pon@800 {
+		pm8950_pon: pon@800 {
 			compatible = "qcom,pm8916-pon";
 			reg = <0x0800>;
 			mode-bootloader = <0x2>;
@@ -31,6 +31,14 @@ pwrkey {
 				bias-pull-up;
 				linux,code = <KEY_POWER>;
 			};
+
+			pm8950_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				status = "disabled";
+			};
 		};
 
 		pm8950_temp: temp-alarm@2400 {

---
base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
change-id: 20240730-pm8950_resin-aa33ac58621f

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


