Return-Path: <linux-arm-msm+bounces-83806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09631C931AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 21:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D05294E2880
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 20:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9249A2DAFCA;
	Fri, 28 Nov 2025 20:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="c1CbRaqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465892DC348
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 20:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764361258; cv=none; b=KrmBmaQGZtMKvQEO9Z9fPGDSVQdHOV3BQssHt22F3MO3PPXr78PMb0qHS8ds9xogBC0wbsMNbDig2jcvRK5yl7EbTl8X4aCUoGjwk/ycRENTNAvaVwt8XUuDYkk1mDgdoDd1FiRcaYO0e2uRW/lt5V1/Kwos0zVJCYK++Qg6M1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764361258; c=relaxed/simple;
	bh=gYo416o9IIzWH09EnRsTCKup+QS2AuPBTASyfAf3lBs=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=LDl0rCfKhzHNMhlyHEkLhxss86AHpwqgCMMiHlblFhwEqaY6ai1C1cPuAK9DsY2wVJ7yd8AopgLiyFA69aQ+dYycsSKByD8eLzXiA1a2dw5KlNhlcInYgbmWxaU6HnYFolF5EBhEAZwH7z+bvnXANiiJabqL6lSn8h1JnLVPY6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=c1CbRaqC; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764361243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dx+rQtRDLcWj+YM9GvZ9aZmUEN7f7LnjwZA1J3GYuzE=;
	b=c1CbRaqCJnAKuRjgMufb3x1Hw3hnL4PUs4qrIRLgjLRBqmHgMts2MhKAMC24grCCw9Z/tt
	aoCr7C27Q7qJ4equHb4oB+Pc7l7chh4jcbLkbO6PDECBkhYfwe3EJCBvdXQNrSOvMUtIMI
	hsW7Gyhzfny5DyOGC1RW6y9Ktfu1YWijQaYNova7XSHyC/lbJndDzinKOFJL6jCccPthtf
	QbVgaIWDmds0anS00V/m2LNRXRZhHVaV0aOJW1hU8+UZ8rfe8eO6KiWlVPnm8LXDqIBx+L
	rzzVhn1hJkluCLX6sXlWYBBX3b/IB9g0xOkpp2ytgd/ecb3WEfVCJ/Oxx3EKHA==
Date: Fri, 28 Nov 2025 20:20:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
To: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

I did more testing on this, and the led only comes on if it's brightness =
is set to approx 150/255 or lower. In that case, should I set led-max-mic=
roamp to 60mA?



November 25, 2025 at 8:12 AM, "Paul Sajna" <sajattack@postmarketos.org ma=
ilto:sajattack@postmarketos.org?to=3D%22Paul%20Sajna%22%20%3Csajattack%40=
postmarketos.org%3E > wrote:


>=20
>=20Camera doesn't work yet (imx351), but we can use the flash as a flash=
light.
>=20
>=20Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
>=20diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 93b9a0246510..fa664b5120d2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -494,6 +494,19 @@ &pm8998_resin {
>  status =3D "okay";
>  };
>=20=20
>=20+&pmi8998_flash {
> + status =3D "okay";
> +
> + led-0 {
> + function =3D LED_FUNCTION_FLASH;
> + color =3D <LED_COLOR_ID_WHITE>;
> + led-sources =3D <1>;
> + led-max-microamp =3D <100000>;
> + flash-max-microamp =3D <500000>;
> + flash-max-timeout-us =3D <500000>;
> + };
> +};
> +
>  &pmi8998_lpg {
>  status =3D "okay";
>=20=20
>=20
> --=20
>=202.52.0
>

