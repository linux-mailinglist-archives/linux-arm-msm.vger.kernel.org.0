Return-Path: <linux-arm-msm+bounces-26907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD593A0FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 15:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DABC1F22316
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B08A152503;
	Tue, 23 Jul 2024 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="NeQ/DRhP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A6A14E2D0;
	Tue, 23 Jul 2024 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721740523; cv=none; b=I1A54FSYA6WiJ2fUPvjcTfhc3eI89CE2P0/w86r12WjIqRc+mNpXgP6oxLozUykT0GFoEDzyVm3K1h9juihp8FEhkk0gjMjIruuuXr5U4V0sEjE+LrFQ4boBfrxSV2Tl26nsXhKeaqoRVjsoexusoCC4r+kt6lxNuqfQQ9iF/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721740523; c=relaxed/simple;
	bh=/6winp2by/iIplqWPNZeZXrWGYotUEFtKmE6wfbZ/Mk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=saNFwCEW94hj8WEVcEKaSkNQ+9XQuGmHQw++KjFMkWyltO/BEOaQG/C6x+LT3lnHeb6ZToDL2155FcmSIAKDFwZebXSpbrSeIAhV8gIC3vYDGxgfTIOE+X2hKUU88fsrLcKmwzOx2YNXFoQdiYp0VHDuq7YNHJIzEbQcL82Ey/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=NeQ/DRhP; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1721740514; x=1721999714;
	bh=on9ibum8FjWFI1I9Gyja7J9aoxew839hbA9XJGpxTrg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NeQ/DRhPM17BmRx98+ZxFaba1FpdB9OgCBivxCy2hWYxiCT6L/o+5HtxNeQz9ZsPu
	 kV4SCLPG2iWL1HhF90E+if0fG1v0pgHRQ/b8nSwJsvcVvDCnIJmDvYnJ08OeKEXrPb
	 xd8yjFgJkZ9oyISAubPujS7mDUlVVXM8Mz0KU+mPOHGaI94XBbpI8PLihi0KCpkcEm
	 3kmdVWjUOMy7c6aB06Dw+ZpsRFwqZDtZENqqJcBQqRjMeSH06aNtlDtecO89ubBuWj
	 hP3FEPQpKe78GBtIZtWVsWhkbzJJ2XqZqGh23Z3oH+YrOZji4ZQcNsrEMe4mC0W/dS
	 ONsdwWNZL528w==
Date: Tue, 23 Jul 2024 13:15:09 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH] arm64: dts: qcom: msm8916-samsung-rossa: Add touchscreen
Message-ID: <20240723131441.1764-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: fea10e1a407495c71894b7df662f94914cc68eff
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Core Prime uses an Imagis IST3038 touchscreen that is connected to
blsp_i2c5. Add it to the device tree.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../boot/dts/qcom/msm8916-samsung-rossa.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts b/arch/arm6=
4/boot/dts/qcom/msm8916-samsung-rossa.dts
index 1981bb71f6a9..3413b0970c4a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts
@@ -16,6 +16,26 @@ &battery {
 =09constant-charge-voltage-max-microvolt =3D <4400000>;
 };
=20
+&blsp_i2c5 {
+=09touchscreen@50 {
+=09=09compatible =3D "imagis,ist3038";
+=09=09reg =3D <0x50>;
+
+=09=09interrupts-extended =3D <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+
+=09=09touchscreen-size-x =3D <480>;
+=09=09touchscreen-size-y =3D <800>;
+
+=09=09vdd-supply =3D <&reg_vdd_tsp_a>;
+=09=09vddio-supply =3D <&pm8916_l6>;
+
+=09=09pinctrl-0 =3D <&tsp_int_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09linux,keycodes =3D <KEY_APPSELECT KEY_BACK>;
+=09};
+};
+
 &mpss_mem {
 =09/* Firmware for rossa needs more space */
 =09reg =3D <0x0 0x86800000 0x0 0x5800000>;
--=20
2.39.2



