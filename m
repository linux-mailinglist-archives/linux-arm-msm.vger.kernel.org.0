Return-Path: <linux-arm-msm+bounces-84592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DCACAAB71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 18:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E8D1306C673
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 17:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7708F28CF5E;
	Sat,  6 Dec 2025 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HR/UxreV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA6321ABDC;
	Sat,  6 Dec 2025 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765043146; cv=none; b=uqDu1FEyD5QG8UX3+Rbe7pnfdn5zwfVgtilYS3kWh4w++x7Er5AfCmXZOId0FhTVUuA4W7iXX6OiK3VIbnCLkZua7gKRYqoQa958zz2FX8BLjir732Pa9+aiaCKSBeK3IdAKx9IVUZnP5zMfU84biU0hxfdHsLtTXbrpn08AfB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765043146; c=relaxed/simple;
	bh=5Hskfthfm8KSFz4/Tmz4HJyMC67iTzwOLWF6274aBxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XlzPA322VSaXWW/R8jZoLeLhMfi295eC2wt+N7QscKjvvif2eX1K/y93qYkQD9YpfGK4UN0ozf2giXgW1niDmZ/dVA9+ogve+OMlLJWXffsCc6sTaDc7BEn3kvXDLlfF3CvArM9e+C3lh3te9A3OpXfaA9/z14A4+snu4bQcdGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HR/UxreV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD72CC16AAE;
	Sat,  6 Dec 2025 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765043145;
	bh=5Hskfthfm8KSFz4/Tmz4HJyMC67iTzwOLWF6274aBxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HR/UxreVqyJFsnQ8ZlfFozCIRNMbGJKyuULZgoJY7byxOq1Sl2ANSKUNkW5+i77up
	 TMWQGWzZq43oSNnyOSlNyMKcHxWM02YSNY4AOl9tyi+eLCKJuZXSqJd+OSENhjy3+G
	 DpMIl/f5lj01xX/YKQ5804SLDvEqNQqJo3uFMffOoq9ub6/DYMvk5QGBDxW18fztAq
	 l2BbYzdrZhcRQubaa2sBUAqoCuU/wbOtG9HykU8Lo5fCei/h+lamGeWxKlcYVigM2z
	 +B9dlJ8G4y8MeYT2PCycu0QiTWApdhtA7kQeOxKBi6E516Exo6g1jsz2DnYdbfz6V5
	 FSHwFLZjistiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7C7D339BC;
	Sat,  6 Dec 2025 17:45:45 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 06 Dec 2025 18:45:43 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-oneplus: Add framebuffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-sdm845-oneplus-fb-v1-2-19b666b27d6e@ixit.cz>
References: <20251206-sdm845-oneplus-fb-v1-0-19b666b27d6e@ixit.cz>
In-Reply-To: <20251206-sdm845-oneplus-fb-v1-0-19b666b27d6e@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>, 
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=rrT7ytPa8q04GSMrJJ0tu20H+CT5C22LiaLq8ch1oeg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNGvIwvrjxnybyV+5Ie6X+UsvEf6WoFairuFHb
 VtC3a2pgBWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTRryAAKCRBgAj/E00kg
 ci2PEACAD1rkoO5KlmC5H3oAo7+DcwNfouUEIby3XS91MK584M4HRNgFLxfjEaE9WDZRBhBqepy
 RJvgtV5jUDHR/1SD4FrsOKzbhnFRWtRMnfpAFhxD5vXHe8/03DBmnJKu0Bd6FQjJMQ9OwjOsQ90
 GCA7576aqfAXv48THr+MvhaAdpgUY7/+/dNr0CM+Fw7L0HU0/ReJZusi+Mrnjf7gqVGqIi8ocqA
 gfZnHeBTeFNbuZJkAR8gh+T2Y5kgLGRerq+Xp2Mov50Pik3GJ5kEpecUOLQ5QI4Rw32Sj3NPPRA
 rTeGaegCvrwGFPME2DGFRSHKFYWGhcS38Cbr9B0BKcxDyD5z6svy1jBJWRDgu5f0j2ydM+S03ng
 vZmnFca0wOuNHjh39LM63CC/BmMTNN2df146Os0NvIe8spiA/xWOrnavCxuyyhQ8w9g+7QABZHZ
 3HZ6rIQkl9kvB0z+TtQjPfYeiP2ZW4/rNqEhoQkn1ONt9xo+5RbgEkEvj0+ci4yzvN9YcfAqXy+
 tSzoYHwhZyRfJFeyiqmPLCvvvI4/w4ihWEvw/mebUYNKLZ1vsdkO+WwhISYbCgcYHn1owCHXZ5n
 UbZ3fqXAFM1GMapyIhA/xte1RPJbARFR8+1PRL43cfDnvB5fF+W0SN5SWel+fhQH3awCmBqg+Mw
 q/ftdoRsKqXij3A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Sam Day <me@samcday.com>

Introduce the framebuffer node, mostly useful for the u-boot and early
boot stages.

Signed-off-by: Sam Day <me@samcday.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 18 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts |  4 ++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    |  4 ++++
 3 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index db6dd04c51bb5..f3884bbcfa9af 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -31,7 +31,20 @@ aliases {
 	};
 
 	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
 		stdout-path = "serial0:115200n8";
+
+		framebuffer: framebuffer@9d400000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+
+			format = "a8r8g8b8";
+			stride = <(1080 * 4)>;
+			width = <1080>;
+		};
 	};
 
 	gpio-hall-sensor {
@@ -75,6 +88,11 @@ key-vol-up {
 	};
 
 	reserved-memory {
+		cont_splash_mem: splash@9d400000 {
+			reg = <0 0x9d400000 0 0x02400000>;
+			no-map;
+		};
+
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
 		 * but given the same address every time. Hard code it as this address is
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index c6b1edea2809d..ac91775f7a692 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -40,6 +40,10 @@ &display_panel {
 	status = "okay";
 };
 
+&framebuffer {
+	height = <2280>;
+};
+
 &i2c4 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index d6cd873aef0de..0542333a83579 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -35,6 +35,10 @@ &display_panel {
 	compatible = "samsung,s6e3fc2x01-ams641rw", "samsung,s6e3fc2x01";
 };
 
+&framebuffer {
+	height = <2340>;
+};
+
 &i2c4 {
 	/* nxp,tfa9894 @ 0x34 */
 };

-- 
2.51.0



