Return-Path: <linux-arm-msm+bounces-75451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAB9BA7F4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19431898AAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F62224220;
	Mon, 29 Sep 2025 05:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="NeorJQAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD42222CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122346; cv=none; b=dbyBMEaA54uAtm5rbuJ3xNdTy/py57zX2VxtF4lUp1D7oV48TpKtjP61uiODLQRnUpnI8GyaEjqyKEq59q6VXk/juCpuYs7+ESWzr+WCiJqgN+QTDuBE/3+lWz0CUHj3lH24W3Lwfiik1Yc4qQ7yidm9rOPpWaSYOa2R433CCTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122346; c=relaxed/simple;
	bh=PTauZMsCPqFeg1cQfRz6q6vIUvS4PEDL90jR5pVs5CE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+tkBLBtMRlHI3TtaJ1b05i3KLV8wPonf7ReahYNTug3uaxxa0zWh18qJombFaGBO/bbJHf7Sm3wyvfcaiyXEQoF66QD4k2+O2csBWi7S6xOA+I3Iu8kNYnicJIi9nTaowBgviN37DLOTrltbOvaKk9rXAjdTNkV5XixEJU0rIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=NeorJQAr; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759122342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDlz9ticwZ85i7WdoNMK1kADZzrfppnarqR5bDeGJC8=;
	b=NeorJQArYDi3RG7D+UHJ2B0DlFxkVbZZCFemzIj3+SSbUWrOhxoGS+UXNmLbdQP/FQg661
	igK7RBuPs4fq+qhv0nWuLgAFgsqI89hjUn4Gc9/IT4/tRqv1PjKEIjIgQb/EZoMj12JfFJ
	Ka5WF7NJN/MZD6V8IgO/6NCQIjOecGbqzBdwyuFJmxjqw/nCZ9YsHJZsNXvcsDvi3F+Jy0
	whI5yH+sQHxME1ANOcf0y1tipgJC4dWMvgKKqi4+iFGOHcOoBa3NeSlVtqVRsuASCRMobx
	DD4jT2COporToUh8/+mWKQIshMvahaLDgQ2/LROTY14fglRUEN58eGAmi+9tRQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 28 Sep 2025 22:05:26 -0700
Subject: [PATCH v3 03/11] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-judyln-dts-v3-3-b14cf9e9a928@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759122330; l=1332;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=Mc5k7LTQrrSyrpvg8cembmSONeURrmXT1ugAWwiB56Y=;
 b=EAiPXWKMzHhYWU6d1fhN6TKv4dTGLCiPp1XNgmgdmzfbR+6PRPCT/LpFW8bjV7sGXyHZuijVG
 tJqYjFr/OdZBlswIONEOnZFBOISqAPzNSgU5qtI9TyLbJgcHrpTmTKj
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

From: Christopher Brown <crispybrown@gmail.com>

Values based on lineageos kernel

https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-battery/LGE_BLT39_LGC_3000mAh.dtsi

Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index f91578ce7195dc3bfd1ba0a722fb48f950816246..df65b0e32b195d2f668883542cfcabbb9bde8204 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -37,6 +37,14 @@ key-thinq {
 			interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <3000000>;
+		voltage-min-design-microvolt = <3200000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
 };
 
 &adsp_pas {
@@ -57,6 +65,11 @@ &mss_pil {
 	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
 };
 
+&pmi8998_charger {
+	status = "okay";
+	monitored-battery = <&battery>;
+};
+
 &tlmm {
 	thinq_key_default: thinq-key-default-state {
 		pins = "gpio89";

-- 
2.51.0


