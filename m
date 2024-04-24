Return-Path: <linux-arm-msm+bounces-18452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D145E8B0D24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 16:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86CE61F26A51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 14:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AD21DFEB;
	Wed, 24 Apr 2024 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="DVHkQQS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4B61E493
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713970191; cv=none; b=PcQM0PfHq0mwD1YsnBNOnyBN6DDQQJyF9YNTMxgbCIfVbIl9xrqQy8leS6wdKxfKUvLgvAAs3fDbC4E/3ExnNPERdZZAITNazl+1K13XV1v6V7iFEVCiMAyF0OuIqC/LwSQXGVxV1HW5bBxisxTLvHwXoXr1q72jnBHiZmWlR/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713970191; c=relaxed/simple;
	bh=UhytsUo9VBh/+t1V3Z4MvovH2cCjum7PfSADfjigeko=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KfCp0Ltzp+Eu5HLDsHqaNQtZ0U8PRCR2yAsi2B3S3bE5KVIwxDLrATJaaMKDorBD/wLHsDbijXUybEkO9b9PHnYck3OUjHt1sWyGRHRnBK41MtZYcnj11KC43+HMOlH8TVTY6DGZHV2SmbMqTDH2Pb9y/CoSAE1++2UsmLmhLoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=DVHkQQS2; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1713970180; x=1714229380;
	bh=VEe3pOZHo9UZJqzOb18loUkmy2Jdqv45LZK57Rv1two=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DVHkQQS2dADQ7U2fznF1wgeLqjuQnJ5yIN/6gfiEwV8ZU49B+w2TQ97qKmd63G4Cb
	 ybWNo4OeLgIQsa7qd0iVdNY2gIeuPLl/b7PhfXExDpbgAyQ90pcTyGKXPbnZn6ocG3
	 Lw5KRdGp+1Fu45udEdV3O0pgcIoCmwVOnCYvkDAvHaPQMY0pIvpKNf+PK/c1nTMylu
	 Ga8tca55g5H/BA4/9Uqlrv3HffbQ8AVTefqLwkrwKgyrhcj865TyQJqmWR1DPo/hSi
	 CsLkFCoOUtz4JtDBCxmE8k84GwVJN2z8PbFBU9lsD194t3O0E8JRHuVqKK7cfes4b0
	 RZkqSO3YvsVYQ==
Date: Wed, 24 Apr 2024 14:49:32 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Jakob Hauser <jahau@rocketmail.com>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH] arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add connector for MUIC
Message-ID: <20240424144922.28189-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 839d0a29a0592432c5acf1cdf144271682f08d52
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add subnode usb_con: extcon for SM5502 / SM5504 MUIC, which will be used
for RT5033 charger.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi  | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b=
/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index 5e933fb8b363..62864cca0cbb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
@@ -114,6 +114,12 @@ muic: extcon@25 {
 =09=09interrupts-extended =3D <&tlmm 12 IRQ_TYPE_EDGE_FALLING>;
 =09=09pinctrl-0 =3D <&muic_int_default>;
 =09=09pinctrl-names =3D "default";
+
+=09=09usb_con: connector {
+=09=09=09compatible =3D "usb-b-connector";
+=09=09=09label =3D "micro-USB";
+=09=09=09type =3D "micro";
+=09=09};
 =09};
 };
=20
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi b/a=
rch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
index b438fa81886c..08485dcc20de 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
@@ -15,6 +15,12 @@ muic: extcon@14 {
 =09=09interrupts-extended =3D <&tlmm 12 IRQ_TYPE_EDGE_FALLING>;
 =09=09pinctrl-0 =3D <&muic_int_default>;
 =09=09pinctrl-names =3D "default";
+
+=09=09usb_con: connector {
+=09=09=09compatible =3D "usb-b-connector";
+=09=09=09label =3D "micro-USB";
+=09=09=09type =3D "micro";
+=09=09};
 =09};
 };
=20
--=20
2.39.2



