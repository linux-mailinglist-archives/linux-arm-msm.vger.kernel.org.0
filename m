Return-Path: <linux-arm-msm+bounces-10923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CB8853829
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 18:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2512C1C2213E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 17:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BE95FF07;
	Tue, 13 Feb 2024 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Euodfbnd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA2AD55
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 17:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707845629; cv=none; b=Z8tuEmUhVe0XAUdH/ZABKzLxUQZ4LK2ThC5iKkpxMDE27h5UCzFFbZjJXdNm79lJj1SJsoEPGrOlFYkA4nPkRMbZGiZtay+PowQAVY77qHPvIUEovGidHTO2vIjNRr6Yd2of+ZCJC8nCz16tqSxnqvvwofXagrELFrIORzu2zhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707845629; c=relaxed/simple;
	bh=ogElmpBeYC6s08IIi9mwFQqUlOH/ywQJ9JWoyhP/PMo=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=ZUSdrXZ73bAYMPG1exsG9qGzCP4p59vpw3S3nVQFV2VJvVS0qwRPfy4O3go2x3k62kwglZ1twfV2f8Aq4RKu1yt9alCDvj657uu1Z4l/ncfdxwqHNN8xol/zegVZH8W7WpQ7ReKX3+FbUMalfZXyHx8KKhUNfZdMfpkNA7xuUXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Euodfbnd; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1707845625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DIMtwWY99j3gR/ZuRWXSO4C5SoLWY57z64ISbD+bbLY=;
	b=Euodfbndw/6vygTTO50g4XMxI6l/hVSo18FdgPkiD0GzNCTQK4D7xpUM7idl5UjuB7fW/u
	p6QqBqPlZMB8PfskUeCCxWMM6Sa06D/WcxT/P4mQSGL8oVwY0osT//TPniNNaUYHk561bM
	jywy0blayaxRi+tMGQeiAb9keBU6+eMB3tdHj8kwUzA214nvfJCZaqNFEeIIEU2j0bo+BK
	EEMfybMf3xANdPsdrlqYu0U25wLuOjOLuO+j27uMvWrWStIQ57g0YFEgGMn/4SpbUmyZje
	K/4bUkuc9fOXcjQWjIqLzoOeI2z7yTQ6fuFjdQT2sKjLeHZtOoXo7oStIZKuow==
Date: Tue, 13 Feb 2024 17:33:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: jenneron@postmarketos.org
Message-ID: <94bdff480e699f27f25f483e1207a22801f41174@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sc8180x-lenovo-flex-5g: fix GPU
 firmware path
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240213171416.GB30092@thinkpad>
References: <20240203191200.99185-1-jenneron@postmarketos.org>
 <20240203191200.99185-2-jenneron@postmarketos.org>
 <20240213171416.GB30092@thinkpad>
X-Migadu-Flow: FLOW_OUT

February 13, 2024 at 7:14 PM, "Manivannan Sadhasivam" <manivannan.sadhasi=
vam@linaro.org> wrote:



>=20
>=20On Sat, Feb 03, 2024 at 09:11:55PM +0200, Anton Bambura wrote:
>=20
>=20>=20
>=20> Fix GPU firmware path so it uses model-specific directory.
> >=20
>=20>=20=20
>=20>=20
>=20>  Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
> >=20
>=20>  Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >=20
>=20>  ---
> >=20
>=20>  arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
> >=20
>=20>  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
>=20>=20=20
>=20>=20
>=20>  diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b=
/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> >=20
>=20>  index 0c22f3efec20..49b740c54674 100644
> >=20
>=20>  --- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> >=20
>=20>  +++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> >=20
>=20>  @@ -350,7 +350,7 @@ &gpu {
> >=20
>=20>=20=20
>=20>=20
>=20>  zap-shader {
> >=20
>=20>  memory-region =3D <&gpu_mem>;
> >=20
>=20>  - firmware-name =3D "qcom/sc8180x/qcdxkmsuc8180.mbn";
> >=20
>=20>  + firmware-name =3D "qcom/sc8180x/LENOVO/82AK/qcdxkmsuc8180.mbn";
> >=20
>=20
> Where is the firmware located for this device? I couldn't find it in

NHLOS partition on the storage. I also maintain a package in postmarketOS

>=20
>=20linux-firmware [1].
>=20
>=20- Mani
>=20
>=20[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-fi=
rmware.git/tree/qcom
>=20
>=20>=20
>=20> };
> >=20
>=20>  };
> >=20
>=20>=20=20
>=20>=20
>=20>  --=20
>=20>=20
>=20>  2.42.0
> >=20
>=20
> --=20
>=20
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=
=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=
=AE=E0=AF=8D
>

