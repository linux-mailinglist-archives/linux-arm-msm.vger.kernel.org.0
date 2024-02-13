Return-Path: <linux-arm-msm+bounces-10927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0753385394D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 19:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFC3A1F2461F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 18:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2425C6086C;
	Tue, 13 Feb 2024 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="KwJPMKtT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961EF60B87
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 17:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847193; cv=none; b=MQi8F5O6Usk8f+gQHaqohTerxYbJgdy53m2s84oEgNt1mCG1+fV2Qi5v8p0rsuPaOB0JRqg4zKyGPMw0zQFigQEjehcdjKdBcuX3qiVnm1R/HDZJm+p1HzrMkp+Ss3a0p0dktnafnkwR01G1zSFOVNzZzFk+JM4w6pMUkDgZi5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847193; c=relaxed/simple;
	bh=+P+xCQ8j1+1aCL2UjehgXQ+JdptQwCYcxTN7WoaC474=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=TwCksQ9rIWNraaYDuF9WNr+nI/4PFxsMfSJgGfW5ZLlv34bGtUy8//Z+yrpyKGO9WCIu7APA95apKs4mXvSMzbmC719NPD0mnW9H08E7LRIAzTsOYV72+fZKo6Es5BXfqdI/gStTZSntzHo/gPgvaT6wgCOUiblGin++O3jfT3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=KwJPMKtT; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1707847187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3Ibt3FqxY4ymZKPr3d7rXqnujozfrA4sg6LzSsR7xE=;
	b=KwJPMKtTzVNl34TDL31wwmVqUIJuTG3WMArA6Ts3jq+sE0/zViHBGIcAsvysRhNosrwQt+
	V6UeJ7kKBlZqzpxaIPjzTo1nBSdGKB/1jAQnMWRWEXw7tr+YvwV/B2vrszYgCFOOuro/H3
	z4mLUZLTDBsRmbtq07/KAVxhrKWn7dODP5rT7E5hbopwF240OY6gxCdkm6u32S8xkYiGg1
	6+DSnhJcTSam3JjNQkae22QSSewOq8t2oxerh+M9HqjrZllRNCvyf8XBDEjnc4nc2XGIhW
	Ix2WBBz/Go7ulBElrqll6Eb/SpawksL6nYqpJ0iHMGqJv/BvAoAebu2Ze8Zzfw==
Date: Tue, 13 Feb 2024 17:59:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: jenneron@postmarketos.org
Message-ID: <2129161a9fabfc202f034b1b335a9e50f2154671@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sc8180x-lenovo-flex-5g: fix GPU
 firmware path
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240213175118.GC30092@thinkpad>
References: <20240203191200.99185-1-jenneron@postmarketos.org>
 <20240203191200.99185-2-jenneron@postmarketos.org>
 <20240213171416.GB30092@thinkpad>
 <94bdff480e699f27f25f483e1207a22801f41174@postmarketos.org>
 <20240213175118.GC30092@thinkpad>
X-Migadu-Flow: FLOW_OUT

February 13, 2024 at 7:51 PM, "Manivannan Sadhasivam" <manivannan.sadhasi=
vam@linaro.org> wrote:



>=20
>=20On Tue, Feb 13, 2024 at 05:33:42PM +0000, jenneron@postmarketos.org w=
rote:
>=20
>=20>=20
>=20> February 13, 2024 at 7:14 PM, "Manivannan Sadhasivam" <manivannan.s=
adhasivam@linaro.org> wrote:
> >=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  On Sat, Feb 03, 2024 at 09:11:55PM +0200, Anton Bambura wrote:
> >=20
>=20>=20=20
>=20>=20
>=20>  >=20
>=20>=20
>=20>  > Fix GPU firmware path so it uses model-specific directory.
> >=20
>=20>  >=20
>=20>=20
>=20>  >=20
>=20>=20
>=20>  >=20
>=20>=20
>=20>  > Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
> >=20
>=20>  >=20
>=20>=20
>=20>  > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >=20
>=20>  >=20
>=20>=20
>=20>  > ---
> >=20
>=20>  >=20
>=20>=20
>=20>  > arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
> >=20
>=20>  >=20
>=20>=20
>=20>  > 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
>=20>  >=20
>=20>=20
>=20>  >=20
>=20>=20
>=20>  >=20
>=20>=20
>=20>  > diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts=
 b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> >=20
>=20>  >=20
>=20>=20
>=20>  > index 0c22f3efec20..49b740c54674 100644
> >=20
>=20>  >=20
>=20>=20
>=20>  > --- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> >=20
>=20>  >=20
>=20>=20
>=20>  > +++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> >=20
>=20>  >=20
>=20>=20
>=20>  > @@ -350,7 +350,7 @@ &gpu {
> >=20
>=20>  >=20
>=20>=20
>=20>  >=20
>=20>=20
>=20>  >=20
>=20>=20
>=20>  > zap-shader {
> >=20
>=20>  >=20
>=20>=20
>=20>  > memory-region =3D <&gpu_mem>;
> >=20
>=20>  >=20
>=20>=20
>=20>  > - firmware-name =3D "qcom/sc8180x/qcdxkmsuc8180.mbn";
> >=20
>=20>  >=20
>=20>=20
>=20>  > + firmware-name =3D "qcom/sc8180x/LENOVO/82AK/qcdxkmsuc8180.mbn"=
;
> >=20
>=20>  >=20
>=20>=20
>=20>=20=20
>=20>=20
>=20>  Where is the firmware located for this device? I couldn't find it =
in
> >=20
>=20>=20=20
>=20>=20
>=20>  NHLOS partition on the storage. I also maintain a package in postm=
arketOS
> >=20
>=20
> Could you point me to the package?

https://gitlab.com/jenneron/firmware-lenovo-yoga-5g
https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/testing/fir=
mware-lenovo-yoga-5g/APKBUILD

>=20
>=20- Mani
>=20
>=20--=20
>=20
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=
=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=
=AE=E0=AF=8D
>

