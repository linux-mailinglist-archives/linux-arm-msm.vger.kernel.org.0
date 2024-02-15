Return-Path: <linux-arm-msm+bounces-11183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D32A4856324
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 13:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CE921F2372A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 12:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2362612C809;
	Thu, 15 Feb 2024 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="rwzc1Zvu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4324.protonmail.ch (mail-4324.protonmail.ch [185.70.43.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D912C52D;
	Thu, 15 Feb 2024 12:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708000136; cv=none; b=aD4Kbiy14Z5q4S992CKvDwVRkxXx9KfCUpjjIddBGeH2mz3itK3ciEecj+R1f+nLfnslc9Fs2H2Np9kEK1MdcS3n+8pfHiDjc4MIQsVLJzjyY3ZcNxb/SAf9EqenV9B8/mn92i9bBN4zxV83vrcn0t5oVQSjUqEzM4PyjC5hgbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708000136; c=relaxed/simple;
	bh=XWn/5rkeMC3EwrTcHX8+1KjZarDety7nInkfDIyao18=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYNDjrZgyP1heW3LC2aF7XOKULoQ05VmJLr0zPogEj808dZyRUsiUwaP9I2M+1MD7KYBSI7cKwiG8hYWmwuVG43VANslaaIcNU0zY/Dv5ZUtPsp3KJdnWU2Vp2ofkhKmPgGcno9eMkjiwkGIj2s2XJy5PVpXsNT/EZ4o4XFaH5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=rwzc1Zvu; arc=none smtp.client-ip=185.70.43.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1708000131; x=1708259331;
	bh=escI57YZz6EIQiDGXdanbLIoEKO4yLQ5pM7Z8MzCj/g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rwzc1ZvuDEAS72SGWuTo5HgUuNXMnn35s0MHgSRUvcoQdzXwR9bieBJFip7nIUGei
	 3YwX9Idlp04ijaGpNxxtYAPFGXldldvaj9fMEKYYltpPvCPyVvFBi2dw9nm7fp07/3
	 RvIaooofnOXE4li+BvHCu/2gO9D5nvNYBdpETx4ksys/eAhqhmFN3J0Ja4B2Ek59lv
	 CRKwfsz2u12ZG59K7riwpQjzUhwh7BWBD0+xw76mxdBnXFH29XmTmPpR7ZjJeeU5X8
	 S751kK3nB9lwT7g4w1neBQHvL9CBl78omvxdCnQrduuuY8qlyJfs82cusS6ulXY9xW
	 +J4M2QPR7lXDg==
Date: Thu, 15 Feb 2024 12:26:27 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Jakob Hauser <jahau@rocketmail.com>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 1/2] arm64: dts: qcom: msm8916/39-samsung-a2015: Add connector for MUIC
Message-ID: <20240215122612.3833-2-raymondhackley@protonmail.com>
In-Reply-To: <20240215122612.3833-1-raymondhackley@protonmail.com>
References: <20240215122612.3833-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
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
 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts            | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/a=
rch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 2937495940ea..4bbbee80b5e4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -128,6 +128,12 @@ muic: extcon@25 {
=20
 =09=09=09pinctrl-names =3D "default";
 =09=09=09pinctrl-0 =3D <&muic_int_default>;
+
+=09=09=09usb_con: connector {
+=09=09=09=09compatible =3D "usb-b-connector";
+=09=09=09=09label =3D "micro-USB";
+=09=09=09=09type =3D "micro";
+=09=09=09};
 =09=09};
 =09};
=20
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi b/a=
rch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
index 3c49dac92d2d..c50f81a68897 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
@@ -23,6 +23,12 @@ muic: extcon@14 {
=20
 =09=09=09pinctrl-names =3D "default";
 =09=09=09pinctrl-0 =3D <&muic_int_default>;
+
+=09=09=09usb_con: connector {
+=09=09=09=09compatible =3D "usb-b-connector";
+=09=09=09=09label =3D "micro-USB";
+=09=09=09=09type =3D "micro";
+=09=09=09};
 =09=09};
 =09};
=20
diff --git a/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts b/arch/arm64/b=
oot/dts/qcom/msm8939-samsung-a7.dts
index aa6c39482a2f..0c599e71a464 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts
@@ -286,6 +286,12 @@ muic: extcon@25 {
=20
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



