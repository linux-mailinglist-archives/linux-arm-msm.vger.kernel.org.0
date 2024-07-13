Return-Path: <linux-arm-msm+bounces-26091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9079306B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 19:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFC67B24E3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 17:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF53D13CF98;
	Sat, 13 Jul 2024 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="InAbALiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4ED1DDF8;
	Sat, 13 Jul 2024 17:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720891667; cv=none; b=gqkFHYiCWHzd3xNecW9HgNz6Zv75sFRvF4FT+wiqum33bwqU1MvDRLbifhOXB7zuE9VQWkeFQ0sDpEG/ysCPMA78YHlxjL7RgRlWm4h/ICyZ3JJXP/I3/umnE/VZuHmZBTHVO7fGNsGmW2UefKukn6VB35Gi2jpGkuJtPSvu5qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720891667; c=relaxed/simple;
	bh=CMbyQCRW3QjSNDtrZLqub2EssK7RoLcv0g/PG0hYges=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G5MNUbZxOVQIwuPMSXP+5zt2G1OQw8qtX1NCOgDoWfhR36lLk/xN0YnQ0/g9S1PVJOGpeHjCka8B2biOdg7L0pdEitSBAFanqdPQCt2t5zNNy8Yep+vnNUuWGEzo8FxZi909WfEprB3giuF2X6P4KTy70Ce5MnUo/mwhKKHTwoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=InAbALiB; arc=none smtp.client-ip=185.70.40.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1720891657; x=1721150857;
	bh=3ma9Jn4pZDj6IW33R3W1pBkMWtSx2AXWQvS0vLsnG84=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=InAbALiB3GvY9KTmZVN6QkFs4qtbHoXdZE0JTxl6cltduTF6VBYx3cpBb/T4RYKtU
	 k4WfMul3/eMSr4nvPTtfucrUy6EEd72Rxv0Ng5J0LtcjmPSgW0hQZHmjJ3Z2xw+IA0
	 bM+M2YCoCyuhJvuey7w4rDZZmqtuSHk6qd6GO56jaosOzwC/gFvewiJt2mqj+oFT9o
	 oPftKXE1gyG3N+Dd74Hf0KUalmSszWDI0qGb14PHAOTVrNCRdoUdQUkTHTrUOfUmkj
	 OjmbxsjA+Q7WVanzLbnSQe0HbpNbsrkpXkNcJYrVcfCto1DGyKuwloGsNtxHFb8lCG
	 DU4qh2t/rLFxw==
Date: Sat, 13 Jul 2024 17:27:33 +0000
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH] arm64: dts: qcom: msm8916-samsung-grandmax: Add touchscreen
Message-ID: <20240713172724.34658-1-linmengbo06890@proton.me>
Feedback-ID: 112742687:user:proton
X-Pm-Message-ID: 310e0059fa85ef97870cada5a561fdd7c9440981
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Grand Max uses an Imagis IST3038 touchscreen that is connected to
blsp_i2c5. Add it to the device tree.

Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
---
 .../dts/qcom/msm8916-samsung-grandmax.dts     | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts b/arch/a=
rm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
index 135df1739dbd..5806a28b7bec 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
@@ -47,12 +47,34 @@ &battery {
 =09constant-charge-voltage-max-microvolt =3D <4400000>;
 };
=20
+&blsp_i2c5 {
+=09status =3D "okay";
+
+=09touchscreen@50 {
+=09=09compatible =3D "imagis,ist3038";
+=09=09reg =3D <0x50>;
+
+=09=09interrupts-extended =3D <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+
+=09=09touchscreen-size-x =3D <720>;
+=09=09touchscreen-size-y =3D <1280>;
+
+=09=09vdd-supply =3D <&reg_vdd_tsp_a>;
+=09=09vddio-supply =3D <&pm8916_l6>;
+
+=09=09pinctrl-0 =3D <&ts_int_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09linux,keycodes =3D <KEY_APPSELECT KEY_BACK>;
+=09};
+};
+
 &reg_motor_vdd {
 =09gpio =3D <&tlmm 72 GPIO_ACTIVE_HIGH>;
 };
=20
 &reg_touch_key {
-=09status =3D "disabled";
+=09status =3D "disabled"; /* Using Imagis touch key*/
 };
=20
 &sound {
--=20
2.39.2



