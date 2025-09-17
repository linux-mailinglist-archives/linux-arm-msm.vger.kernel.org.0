Return-Path: <linux-arm-msm+bounces-73830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C48FB7EE96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9AB81C02A11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547D7220F3E;
	Wed, 17 Sep 2025 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="A6wYHt+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8188423184F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 01:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071439; cv=none; b=DyYOaS7Z45w3x1qyc7KGjhxLN+8+uaPmNGa0pf3F88DLz8jzOJp04USyE25ysUQCppLGhWETU75UaEssLfVcYEQRX4phCgHYh0o2SUVTNvteK7Z6uKnEDF2VrHluy98Pr2SqyCCDw2B/BxWqNw7XsDQET4wp5fA9A3lgCsXzrtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071439; c=relaxed/simple;
	bh=Cfw9f8G/EVt6oTsANZT5LY+a4jGLcz1cjcQr1173G1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LsR9zR8YiUE0kfb3qC+ah9Jw8D21kDiu+XLkSFYc/PqirJh/GAw+T5mI5h5EAtaxcCTxUPBFAqZFfdiuFqZts4ji5lQpvTvO/lGHy+J290Nt48bEYTKG5b0RINo+c8iGlyjYFk7u/oaDP5ZEaEkU+t2kYoZz00sC56RvNqZnVT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=A6wYHt+F; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758071435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iqcu056ZxaaQa1+3lepfj9tog1OkQlq3ftPEsMDCQuI=;
	b=A6wYHt+F2pijt4Teui6VsQMwIGLQdGPlvw0QEg+36oM7ueq5E0CiUvr/i276f4GQxI9zIk
	7RMRPYu+qImTrXdsvXefSvdLhB0CIIwzCO6ojtPfRQTGa1xY4HX9ggc1GCIC8RZfi7OCwP
	KRXgMu0Q1NXJ+Ezo6Yii1XreuKxZRp9DChpp/naRJjRFqrtT0DlBMOmHzZJrfFdvqAK/5e
	OnZJNCVgLYn8Kw5rlFuEI/+TGeP9eoynjX+udWvPsbIHCnI9pLU6HwjKY+TNWRM63PWTVI
	ZMbEs4JbrSelU9RLj6rJIx0vrjdkNNreTaoBPsotpCDsc0T9PmZozggoJezZEw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 16 Sep 2025 18:09:49 -0700
Subject: [PATCH v2 03/13] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-judyln-dts-v2-3-5e16e60263af@postmarketos.org>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
In-Reply-To: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758071415; l=1134;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=jM2RR5BY2AR3olI3nduZGxoa6omhrjQm9NtH6rCBt1w=;
 b=Ez+kVuLf0kniQ0UuEYDLrw6Jg9/g4VmHvpcbst7VICYAYxBnThAqqL8oSmiD5ew+Ea7MpXqb9
 U0PvWS4wUsECDNDoAKRvg8vn59kuFXi+zQ5MyMoxSvDuZEt/NZMVnze
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

From: Christopher Brown <crispybrown@gmail.com>

Values based on lineageos kernel

Signed-off-by: Christopher Brown <crispybrown@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 49225e4fa80e5f45a36964d5d733dc238e4413f8..be488891d0ab01c5bfd3762514fbf1c3bbf6845a 100644
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


