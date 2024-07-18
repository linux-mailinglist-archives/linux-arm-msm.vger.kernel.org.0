Return-Path: <linux-arm-msm+bounces-26553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABE7934C91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 13:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84E982831AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 11:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442DA13AD12;
	Thu, 18 Jul 2024 11:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="b/rSdbX2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8673D136671;
	Thu, 18 Jul 2024 11:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721302153; cv=none; b=UAzLEWvvdf8kvYW0PkR/0RXaVpfvuaEy77Jox9peMCPBHYc6+c9DIb0X8pECkxD0pt244ntU9OJbLUjBTt8h4lnNVL3kDOCAeyysBt2sidyMq3U0vqSdll+JBWqVVV/Q+O0iIZstIi/Rr7ulJ67FdWB58k/oD1N/r3LWbrPHDMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721302153; c=relaxed/simple;
	bh=bn3VgzhSAEhdQZg1IslFXJCq1k/bK2Pb74+mWuAsJU0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IBX9rNTNOvN+0gQg5W6BZ7MPe4ne8vj+w2NsGF/03lG3u2ivXLnDaIJEG2cg/ycn1QV8tr6ePCjJDFnFn20X2thZ5Hya8zv4bUOYI+26Yz0drU2NLlxqwlagDGOy0Fb8pHNe0bsT4u7T3qtcJO1jkpXGytT92iigvlL33f2QOps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=b/rSdbX2; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721302142; x=1721561342;
	bh=YqXULOXBiO6I3qT5sax6NUnclYLueA776MI/l1Vr56Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=b/rSdbX2FS2aoHxOPnGVW58kSkqahosRZZ/KcRxJs0hZRrfXWPSEc6K9vPYirQ0iP
	 bKKTMwe+rpugBR1vjEE72xlZlOdUBItxvs9bU9xeyG8dE5dhYd86RrCESfxcDJ0ahS
	 jmPb1GXwGXSFn/SyuMbYgCLo7bKwHO5ELhCVoQG6pUa28ydLN+aDDSNh3Dz4Uw8lUm
	 DKOmGBXvqyitvz9KEV0PSkDqk8/PGklkwrZ4ha9qBXu3QQ08rlQhJhNcufB5i8tKaA
	 RNQArgECc/AJ7ywtKkKdeNEy9MWm22Imr/8B+yHT+xBWAglgEr33ZOL/+7Yd1XbSaQ
	 cpxXvExdpGzjg==
Date: Thu, 18 Jul 2024 11:28:57 +0000
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2] arm64: dts: qcom: msm8916-samsung-grandmax: Add touchscreen
Message-ID: <20240718112715.6117-1-linmengbo06890@proton.me>
Feedback-ID: 112742687:user:proton
X-Pm-Message-ID: 821a46a3e47e95dd0c9dae777f4a971b4e4c4227
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v2: Fix comments for &reg_touch_key
---
 .../dts/qcom/msm8916-samsung-grandmax.dts     | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dts b/arch/a=
rm64/boot/dts/qcom/msm8916-samsung-grandmax.dts
index 135df1739dbd..5ddb69bf8e78 100644
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
+=09status =3D "disabled"; /* Using Imagis touch key */
 };
=20
 &sound {
--=20
2.39.2



