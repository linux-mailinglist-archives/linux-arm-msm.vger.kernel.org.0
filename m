Return-Path: <linux-arm-msm+bounces-67281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDBB177A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 23:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A2434E49E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 21:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20692265CA0;
	Thu, 31 Jul 2025 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCPhpJSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF43C25A2BF;
	Thu, 31 Jul 2025 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753995766; cv=none; b=q/Y6TfeWLAH+oCJhoyL7VElWv0KkP1UMn4iZ3P65wsSEe94OsasVqxr65NESgNmvnX5waxd5qosJlpX+7iOUMM1x9ShIKJaX3xDewE4Iwm/rnVfsp0ZN3PEbm5MM1NK1uMyBh/j91SeUVeGQuooaTZ81UHWI51jqEk2QF3pSjKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753995766; c=relaxed/simple;
	bh=hj9hWNAP1TrLYfyYzpKkJ6R8bTlE27E/f3rPu9CInWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NwKmpzyQx35H1AuVr0ImpltmO+KEq32BxPmd/tEOgDUh9ouAWFJbAFxRuHUT43wDmxqdijJEQo1PFDYhOUP2Z70K9uM1dYz9RbXfw2aNVwCxsaxZbFCjdUKeNRN1w4krzNZmE6FTdSpaent12kNIM53NLbko5VGDQZdCBXqjt/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCPhpJSj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70174C4CEFA;
	Thu, 31 Jul 2025 21:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753995765;
	bh=hj9hWNAP1TrLYfyYzpKkJ6R8bTlE27E/f3rPu9CInWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LCPhpJSjpB7qzegQ51ZkBneMDqTQ/bAlDF0ib6xAVlLWyY5mbj4TLQcUwtySNy33W
	 duC81rGScGSFzmNA99bWn0/etnuyHdZRKHqOXOLGDTuBLB4uA5cp9q1kHyZxja//A+
	 ZxFDLndZajKqyKbMdgIrPZjCyOGisdyvKR6OSP3nkRJJ/yPEoaboxEykwnM4Z0010z
	 SBE25/NIPzR9gupU9Uas3UEc8/jH4VoVZRjmIfFQJ5TSzQiwVnarx93fUkJzz/CLVz
	 yLuWbaKDYNEAvcBfdrP4imXsOmPmEijdYhf325V7oG13pZyZfq64rt3auBjR648YHF
	 vm6P16mbsHNpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61418C87FD3;
	Thu, 31 Jul 2025 21:02:45 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 31 Jul 2025 23:02:44 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-oneplus: Deduplicate shared
 entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-sdm845-msmid-v1-2-98489ece786e@ixit.cz>
References: <20250731-sdm845-msmid-v1-0-98489ece786e@ixit.cz>
In-Reply-To: <20250731-sdm845-msmid-v1-0-98489ece786e@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2034; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=NRxsP8lcA3q9aPxidLKbwvCT8KoWYD5PD4bDKiX1k74=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoi9nzluXWVab2ZF96AXlNNtZs5b0Jhd2wXvKAd
 9MWu505peqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIvZ8wAKCRBgAj/E00kg
 coPdD/sEWR/Cbr7jiVyx9KDyE1/WOlKTyNv5c9dPixgDitOIbcmdjJuoxREsBRIfqqihzFvg2lW
 jXoZx3x86ZTM+PMrJiHJ+xA0u1WPiQ4urat2JBnUS9QpRHpnF6b48Ir63S3ux+aF/iFQiVjMCA7
 +lgVux3KjxJdH1JvgUEU/J2zQNYj6UjUf66axJ5hLsVuJznxseZYHgOWRLYldhAD1TGFvWUCaSV
 A/cQ/ehiliUmHpzQYM9wNCnl2IYe9T1FByKD6vdFhksDhagtkarlh6c3N2s9iolhWfPsEf8wa5G
 Ej9umspUjNQu4unWec1Hq0EwY4g0qPDcjsV/9qdAR9F6asDF7GP3KxNXFA9Lgdc2fcLE95d4cUj
 hhDWGjyQ9ztVJZAAL0Q6+JxIizJcBPNhQHuZfEM1SdPOibMW4i58SgrXPBa8vTP4LGorEksG04n
 vZGcgNmryeMO+Kgt6T7Rzo3K0L6pPjMHB4oXtW1CScnGy7GIcJiUFPJvqHgIPMtCQPtlNhgB4JQ
 dfutXZthry8mzHc8HO5fpwcwhCq8XpBeUnaKTCrdllbz62uG9Z7BAf67Teq+mbQKvsNUz52wvgv
 Ww4MpXZGQjP/KvovXJNtKFnzek0mUm2oRZkFvR0F69K4h36fz2iif9n0UBiQE04CfoKWoyx6cTl
 TPL3QTK1Y/QdDrg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Both phones share same values, put them into common dtsi.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 3 +++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 --
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 2 --
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index b118d666e535a433f44b66c71b36e55df2ce5c80..da0052ab99e1d7ffb8ef0173b1c97d11b459b212 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -21,6 +21,9 @@
 /delete-node/ &rmtfs_mem;
 
 / {
+	chassis-type = "handset";
+	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
+
 	aliases {
 		serial0 = &uart9;
 		serial1 = &uart6;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 474759ab61043005fcabadb5c061bbd2eccb2447..cd5546b69d13d8d7f29373aebab1cfda79666900 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -10,8 +10,6 @@
 / {
 	model = "OnePlus 6";
 	compatible = "oneplus,enchilada", "qcom,sdm845";
-	chassis-type = "handset";
-	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
 	qcom,board-id = <8 0 17819 22>;
 
 	battery: battery {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index a0affaa246fea5514a00b6c37edb30c6dceb2c59..b4212626b42954e10974ec087db2b42b07979f72 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -10,8 +10,6 @@
 / {
 	model = "OnePlus 6T";
 	compatible = "oneplus,fajita", "qcom,sdm845";
-	chassis-type = "handset";
-	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
 	qcom,board-id = <8 0 18801 41>;
 
 	battery: battery {

-- 
2.50.1



