Return-Path: <linux-arm-msm+bounces-23593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D391274E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9878D1C21A5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 14:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A05168A8;
	Fri, 21 Jun 2024 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="jV7Dt4KG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch [185.70.40.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB1311CA0
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718979233; cv=none; b=LsN/yN//lyDD3AUypyaaRM+rTJ3tufyc+EkZN7beq1NVGZMJsnNX2fzhB2aflbQouFlc7mivC5B0Gjzx/xMF1F3ki6abdcpREw9bEE0P8C/wsDgmSKOZL3PnRAN86QbkU4/AVTkDPdnOzQ3u92ET+XNGAbMHqM2xJ2N8ghNm52M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718979233; c=relaxed/simple;
	bh=nQ4+wUt5CyLv6ZNzugRNBeJC/TdP5J/vV00LiCmuuvc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OvatGcPULTNnCLb7c/rr5ba/TVWyoIOOUqktfLo5OHC7JnkjRhUXdL40N3o1FoLaNLcKib5cOY9Olmxf4VQTzhPp5/LLP/k0jbuekyDpUTOl1y4+j/HKWC5TdZJMfYBNAmibrHqoMpp9ml1+CIFW03ow/BVolsDd2wL5gGW2JuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=jV7Dt4KG; arc=none smtp.client-ip=185.70.40.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1718979223; x=1719238423;
	bh=phbpiE/1uu6UZY1iql0eHzSjR4wmgdFmktGqssfgZYg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jV7Dt4KGAH/eR4mnkBSsTXMsBaU2baKUQZYlAJXTqcX76VaHz92UC9KXZgfytooUq
	 jFQmnOTRYVtZ2qG0xJFVC9zSsMV72eIA0RcNlidGJBnydaDHrEELhVp2j5K47R9VHk
	 6hyNJ1wt2itq/QLUxxtSb+z+FKMFnidOTB2vPsqtEQyzI2GYYq11lAmikjolf/CASs
	 f7GkrbQSsvUCjmkKLiUneckbZiGMhgKOXYlpfthWay2lzrrbOBSXX5DvytwnhL0H1g
	 tbvUU/Qjud6xlsRLjS/bGfY6VM0RAgrRpOu26w5PdsFbx7q+Zf1TxWRcJGOBmStF04
	 R9AFyaRAMtmLQ==
Date: Fri, 21 Jun 2024 14:13:33 +0000
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH] arm64: dts: qcom: msm8916-gplus-fl8005a: Add BMS
Message-ID: <20240621141319.347088-1-linmengbo06890@proton.me>
Feedback-ID: 112742687:user:proton
X-Pm-Message-ID: 51c028cd8bbb19aca92887c15f2dde8a5e75b1ca
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

There is PM8916 Battery voltage monitor on GPLUS FL8005A.
Add PM8916 BMS and the battery to the device tree.

Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
---
 .../boot/dts/qcom/msm8916-gplus-fl8005a.dts   | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts b/arch/arm6=
4/boot/dts/qcom/msm8916-gplus-fl8005a.dts
index e6ed5544a11b..f7be7e371820 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
@@ -24,6 +24,28 @@ chosen {
 =09=09stdout-path =3D "serial0";
 =09};
=20
+=09battery: battery {
+=09=09compatible =3D "simple-battery";
+=09=09device-chemistry =3D "lithium-ion-polymer";
+=09=09voltage-min-design-microvolt =3D <3700000>;
+=09=09voltage-max-design-microvolt =3D <4200000>;
+=09=09energy-full-design-microwatt-hours =3D <13690000>;
+=09=09charge-full-design-microamp-hours =3D <3700000>;
+
+=09=09ocv-capacity-celsius =3D <25>;
+=09=09ocv-capacity-table-0 =3D
+=09=09=09<4186000 100>, <4126000 95>, <4078000 90>,
+=09=09=09<4036000 85>, <3997000 80>, <3962000 75>,
+=09=09=09<3932000 70>, <3904000 65>, <3874000 60>,
+=09=09=09<3839000 55>, <3809000 50>, <3792000 45>,
+=09=09=09<3780000 40>, <3772000 35>, <3764000 30>,
+=09=09=09<3752000 25>, <3731000 20>, <3704000 16>,
+=09=09=09<3677000 13>, <3670000 11>, <3668000 10>,
+=09=09=09<3666000 9>, <3662000 8>, <3658000 7>, <3648000 6>,
+=09=09=09<3624000 5>, <3580000 4>, <3518000 3>, <3434000 2>,
+=09=09=09<3310000 1>, <3000000 0>;
+=09};
+
 =09flash-led-controller {
 =09=09/* Actually qcom,leds-gpio-flash */
 =09=09compatible =3D "sgmicro,sgm3140";
@@ -116,6 +138,11 @@ &mpss_mem {
 =09reg =3D <0x0 0x86800000 0x0 0x5000000>;
 };
=20
+&pm8916_bms {
+=09monitored-battery =3D <&battery>;
+=09status =3D "okay";
+};
+
 &pm8916_codec {
 =09qcom,micbias-lvl =3D <2800>;
 =09qcom,mbhc-vthreshold-low =3D <150 180 237 450 500>;
--=20
2.39.2



