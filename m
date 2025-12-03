Return-Path: <linux-arm-msm+bounces-84194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADFBC9E8EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8C6D4E1BAD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B292EA743;
	Wed,  3 Dec 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="A9sZn/et"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1D02E9EAD
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754968; cv=none; b=HrLUMWtDTJVA4MP++2Fbti8dQz6WB3cuQpVdK9K05WzsMLuA0dZh9W2Xq+dM8C2ghYNqxESh9R4iHKCB1KAC0PssXOnpcXky27YJVAp+6r898ut1LIMZeRFfeUJj8JTXXeN+QyqVB7Rypzui24Ps9CqPA2YV+Cz5Zhs/DcDl0xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754968; c=relaxed/simple;
	bh=IRvp1LrXFjomukFKSBIxjC7bcXJCB21zMRYbXAsRosw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyYxUHk4oPzbSlvU3DkY2KjStEyzDkmoB9ojfniaKEXr29ra5B6yynCwgi6tFPZsVIpVCCXUSwI9H/xJ/TWCQNsLrxxKANdFnDk0Dczhsc7SXuRxGdEgSrIHZA2CDaAuH5DOq2/LieUH6OI2L1N/Z3wW7cZvcfPWYX2YhUOIiv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=A9sZn/et; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764754964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CcVcW2WLDfjCUlcvjyU23VLp8eFcj4e8OxUwOFg0lBs=;
	b=A9sZn/et6cJ3VCodsySZTGNvoP4HR8bd4PJPdW4/LXOyO25TeBbk+aln04jjM6Xz3obrq+
	+x8XrNwhK8NQ8r3go+LGB5zRCiiuogWeAHkWyQVijZrs6tJ5zAWNZgtVjY09DpzLJ5swtw
	s+2v5APiuTdMPCLQhl9DkWHBh+zc7kwJeCHW/HVsC6gLHo/nKpUpjz4exNRIgditGMQyaS
	+ChIWpR6f6TTmg+xlSbM1d8XAy8odnNlO1yyBK4EXkgppXry5X9LNFgVSMcvkXfT3Ksdlv
	fSca1z5xDq6ZGP60AAMep42wxDKkntgUai85U1s5uGjGOAvZSSm71rQ5GgC3Ow==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 03 Dec 2025 01:40:59 -0800
Subject: [PATCH v5 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-judyln-dts-v5-10-80c1ffca8487@postmarketos.org>
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
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764754921; l=1050;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=IRvp1LrXFjomukFKSBIxjC7bcXJCB21zMRYbXAsRosw=;
 b=oPAezOVEQak0t44rJBUFtgZbA4YgYI5y0a9JWKPJX8ZITD2DovsNJhcXkgOlugjrfXVVcJHnC
 3DlOlVGeoNHCIP78pNIuB55rEIkYNctHlArIcOjAilwd2TRr4spXstj
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

These regulators are required for the LCD

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 8b88f75b36af..cdaf84de5e6c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -56,10 +56,27 @@ zap-shader {
 	};
 };
 
+&ibb {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5700000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+	qcom,discharge-resistor-kohms = <300>;
+};
+
 &ipa {
 	firmware-name = "qcom/sdm845/lg/judyln/ipa_fws.mbn";
 };
 
+&lab {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5700000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.52.0


