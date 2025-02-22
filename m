Return-Path: <linux-arm-msm+bounces-49025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9B3A40889
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 14:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2D9A3B4A70
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 13:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAAB20AF82;
	Sat, 22 Feb 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="WxQjPyjU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37A35956;
	Sat, 22 Feb 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740229275; cv=none; b=ZbmYTK10hBvYKINa4bq72nJwJlhC2CJYn8PkSwcR0EdriAH6vS2Bez91p1bIKCfOV/BpO8PMcOj3CFWwuoy4en/RuZ1LLZr9BrV2C2OkEOJlnuLUu/z05IXd3qkzyxA3mvKVXcHPShuhv0yvEkVVwjXIebwVTIuLJYzU8nYlPlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740229275; c=relaxed/simple;
	bh=IOsvE4pFYi2T3F6yXnIr1zvhGPmUHpgAg/WfXk7OF+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TYVElDFJALK+u2QPXYVfGNnNMDXdDP4Ru/LvpEnLhrfwnRYs4TJ2GtDfXr/6WgooHvk04awaprrsNLGNcJDbUhSyRc681HSOrxVX5yIx+i1Yg+bYWpW3GcgZY2LbsFQONrctQBst2+t5w6G8SxwO4EdxXzYrsUMF1zSlJqdk/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=WxQjPyjU; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740229264; bh=IOsvE4pFYi2T3F6yXnIr1zvhGPmUHpgAg/WfXk7OF+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WxQjPyjUegFUtxOCNMumIxEJGism8OX8Dbt3J8aT8vlZOlwQQzoPd27Vifb3yreOZ
	 84dBCSK4OCEFiIKMRwLogBH1r4eh0hV1XwSbI6B9D7Ewt4nGDHawLqzeONgh8I2N5F
	 Hcvrj3GW8wW2Uqvca3V1X/w1IsEuYHdiLElq1SHQ=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 22 Feb 2025 14:00:47 +0100
Subject: [PATCH 1/4] arm64: dts: qcom: sdm632-fairphone-fp3: Move status
 properties last
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-fp3-remoteprocs-firmware-v1-1-237ed21c334a@lucaweiss.eu>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=IOsvE4pFYi2T3F6yXnIr1zvhGPmUHpgAg/WfXk7OF+Q=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnucqMG+q+Yp7ZD65O0j6i8NDPx15x2PdyiJwEa
 AQxkmLS5eqJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7nKjAAKCRBy2EO4nU3X
 VmpKD/sF9ZPUHLr5Xqb7hfpMD8I3tndGi+dChihWPI0ozj2+prWelFZbf6oSwm0Zypm+qZLFtak
 W5aNHquogTvOk1gjLlXlDWWDWga8TDFDfITi7kXz8lITKeZn4JwiQz9pg1dp4sXZXIcP0kaJI9e
 PVUrHCuSL2Kc8R1WRnSpdZ4N6aRE74wJKGgQ59hPOEXHIpW3oKa2TxfKwTH/Ch61dYX19PyOWnT
 Ghv8Ps2cyp7pz6IHBWPQL6Tcu/+h45HDSCFiPt4N3KuAJ8YXBNYSxLc2wtvwXDhhMR/UFcFvkrX
 BqChiFgxCjc69YmrUI0eYuX/hjy3jWlVEFcUU/I+uSMrpY7iXBEacGqDrlc9udWzg03ut0MV9kZ
 gS6DiFqsxYVldVvOLToJllQ+5d+YIHg8WCcBDlUrsYRK6kw+ZhzK7SHflQ7dIv4uMsOKq/JHaOa
 dSWa2uPCs1oEdPO5qbfK8YTX76GiwcPUgOHa12NSFgJmHTUzgXKXCajwKx+4NDSejZc/gGk6RWn
 xKkxZy0hCLMzG/YhTt1vPcLmz7Ai7DNWEvwbszmu9O3fSpnqhdk3lJIXglx489urGn38PxQtOmC
 VEr9eut7FFFFIw2HbRTTpRQUe2UJ08c5ktrZh+fbmKvU1BCjxICFOyWcGCsw9QmdYG/CUl0fEf5
 eAUI/FGWEL1I34w==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

As is common style nowadays, move the status properties to be the last
property of a node.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 2c1172aa97e4bd1f4e905e9777e26672e8935d2f..957288853da2b857af77d9f5fd4de94900ee9b5f 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -45,10 +45,11 @@ vph_pwr: vph-pwr-regulator {
 };
 
 &hsusb_phy {
-	status = "okay";
 	vdd-supply = <&pm8953_l3>;
 	vdda-pll-supply = <&pm8953_l7>;
 	vdda-phy-dpdm-supply = <&pm8953_l13>;
+
+	status = "okay";
 };
 
 &i2c_3 {
@@ -85,8 +86,8 @@ &lpass {
 };
 
 &pm8953_resin {
-	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
 };
 
 &pmi632_lpg {
@@ -148,17 +149,19 @@ &pmi632_vib {
 };
 
 &sdhc_1 {
-	status = "okay";
 	vmmc-supply = <&pm8953_l8>;
 	vqmmc-supply = <&pm8953_l5>;
+
+	status = "okay";
 };
 
 &sdhc_2 {
-	status = "okay";
 	vmmc-supply = <&pm8953_l11>;
 	vqmmc-supply = <&pm8953_l12>;
 
 	cd-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
 };
 
 &rpm_requests {
@@ -276,9 +279,9 @@ &usb_dwc3_hs {
 };
 
 &wcnss {
-	status = "okay";
-
 	vddpx-supply = <&pm8953_l5>;
+
+	status = "okay";
 };
 
 &wcnss_iris {

-- 
2.48.1


