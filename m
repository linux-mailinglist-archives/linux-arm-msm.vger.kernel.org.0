Return-Path: <linux-arm-msm+bounces-89429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0663FD330F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62FB730762AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B16C2FFDF8;
	Fri, 16 Jan 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AxESZ4IZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC10337B84
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575302; cv=none; b=LSUvwkt31UdgkD+vRzTxjp3Vl10fZ25q0gzpLAA0gjYb6HuCLMPZimpvVo5OUshB70rIj6KGMJW8+SmN/XRQtDQCQ1Z8Dnbh+F1Ga/lq8Y8PUi/FUuqWxPoutndY1qE7D5cvK3Dgc/NLLjPskgcokYpyiO8v4oKs3ZazkgRjRaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575302; c=relaxed/simple;
	bh=afqiXye3bQTM2c0rYf8KqRRgmpX3C5xIebIObRjkBlA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=FXHdp8UzbQF2AlsDpeITnZ9h0PEFZbD5rTuioAblsGFOHQoOQdSA7iPmodj9jYqYytMZi3iY0AVFkriP8tnABoVo2gpODVd+8K3ZwGsGMgDIqfsobVL5qUBPg+XnzbD2MBjt0gNp/NVNhKSQ1GN0tGVOBgdJJdcFrtUFJYaLs5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AxESZ4IZ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-655af782859so1413079a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575299; x=1769180099; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQ2usQPIwau+GnGSjCyCyo2cCWUw5N5ULi+Fp0gH+7k=;
        b=AxESZ4IZkHieOOqKH74x3EHBxLe+okH3r1fPeJ/DRRkgTfuLs1Csa9PRv/SKVrrkoT
         JqazoxG/ZW00QqJEEkQYYj3eulakMPc/ol1o/SLecm4SVr/Seo/Pi0bltfgIrfiFx0X1
         sWvybhIO2pfFl0wHUkwLRwnOvXxANJBOdOmGYYW+dshcy1hM7qF21Nckb9poWZVbQiw7
         mMFyunB/VyZ/9raOmu/6vx0MP/4FBgp3prW1CRdldrI6MQ87corV9M8KIWRFoq3z6IUw
         i932Ga9cH27/oBZvwYEtItAzKHjZcd3VguMm5fxhgVlSBRn1G3U7ay4y4rE8t7a1LVGe
         btiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575299; x=1769180099;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQ2usQPIwau+GnGSjCyCyo2cCWUw5N5ULi+Fp0gH+7k=;
        b=E85uBH+CBFrgik2n86J7+ATY8fcjKpHhMM5xgf8mlupz5Cd1Acqtx1ukBIkXwsRpJB
         5ed55cIM0A8VBPuZ/rHl9fk6WBL0O7OE3BOh8O3EUDX1mo7WHuKZfQyJIDaSYi0xevLd
         qFzbzIE8yTw6Ep9bBvc0NQlkLYwGwZuBeeJMg4w5zNTRIaWKv4hMAiXDiD+8bAqDhJ6l
         n2yCwpYcNtdhVupvxwtGObyx3w7y6k6zs6xP8OhOCEhPwOZGij+ooDIczfWgaiJT3E8h
         qipYCTsjyM58nLCRRkjxlzFLR7GAkE7KEEkLcKBRMQVqOQA/o9HSuvyM4wa5ss4EIR17
         weFg==
X-Forwarded-Encrypted: i=1; AJvYcCUnZ2rHi5a64TtRVGySgD+vOvgtD1n9VuilCKnZ1zCpGaI96Fw5FmDVfPIAGelAWLjwxUzOsIjISc1Ngb2k@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd5omWadeZBlRG/uPivwOLVwkesu+RGRh7zxLNgyVFpECdxidX
	ozo1e8h8+8fXF37ZNvUbUZBByTKRvy5Z6hELF4RbmstnHZ955N9Jryr/Tyrgx4t1Puk=
X-Gm-Gg: AY/fxX4Ve7yVLKCMzHD1abZ+XQVPGRn1ClrRYOKCpU5qTgpmRGyQx6tk9prI1m0kcyx
	PDUhPpR0mC3xsbhk75yW6rCSsWnLG9ErB9Wse9w2zXyLXCFZqM/IOiGW+uUG8zZxTB7npdoxLQn
	we8okFIiuTK/pf8/TqtQ3sd8iBu2ZzQ4ga6yBNYQz/QD3mMN0sLFOI4vZ+sc3rkFlKqx3/AFTHQ
	wX0g4d36/cACAZtj9+0LqCU0BmJ4Rfgk3qNp8F6ZLyAt8iwS02CaxaNiwIj66SuagoBh47sGj1t
	AuZhWbfpDSZA+9AZTBfr4zHVubP7u+JfYqjtjIKtaqHIiQ8uTlVwe4rpTP1qtCSm3v1ljNLukxA
	x56AGyTvxNfoj8GbSV+epz2oU75Ds5f/o5AFuNpnY5T2x6dtPs6dBl5XzzQPilSXwf79LhxEnlR
	S6y+fV0+myeg+QA0inaH5knHQMhIMsDNWX0Nwk5jVX5LgYwuvbNVJjfM1+
X-Received: by 2002:a05:6402:1e93:b0:64d:1bbf:954a with SMTP id 4fb4d7f45d1cf-654526cc242mr2815270a12.15.1768575298921;
        Fri, 16 Jan 2026 06:54:58 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm2585127a12.31.2026.01.16.06.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 06:54:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 15:54:58 +0100
Message-Id: <DFQ3MBO2EAYF.1PRF2111N0U1I@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bartosz Golaszewski" <brgl@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-4-28e01128da9c@fairphone.com>
 <ae73eac1-4e27-404d-af73-88eed699db0b@oss.qualcomm.com>
In-Reply-To: <ae73eac1-4e27-404d-af73-88eed699db0b@oss.qualcomm.com>

On Fri Jan 16, 2026 at 2:59 PM CET, Konrad Dybcio wrote:
> On 1/16/26 2:38 PM, Luca Weiss wrote:
>> Enable the CCI I2C busses and add nodes for the EEPROMs found on the
>> camera that are connected there.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 +++++++++++++++++=
+++++++
>>  1 file changed, 50 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index 7629ceddde2a..c4a706e945ba 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -529,6 +529,56 @@ vreg_l11f: ldo11 {
>>  	};
>>  };
>> =20
>> +&cci0 {
>> +	status =3D "okay";
>> +};
>> +
>> +&cci0_i2c0 {
>> +	/* Main cam: Sony IMX896 @ 0x1a */
>> +
>> +	eeprom@50 {
>> +		compatible =3D "puya,p24c128f", "atmel,24c128";
>> +		reg =3D <0x50>;
>> +		vcc-supply =3D <&vreg_l6p>;
>> +		read-only;
>> +	};
>> +
>> +	/* Dongwoon DW9784 VCM/OIS @ 0x72 */
>> +};
>> +
>> +
>> +&cci0_i2c1 {
>> +	/* Awinic AW86017 VCM @ 0x0c */
>> +	/* UW cam: OmniVision OV13B10 @ 0x36 */
>
> There's a driver for this one!

Yep! Already got patches to add the required regulators & devicetree
support to the driver, but since I've got zero on CAMSS so far, I
couldn't test it more than reading chip ID.

>
>> +
>> +	eeprom@52 {
>> +		compatible =3D "puya,p24c128f", "atmel,24c128";
>> +		reg =3D <0x52>;
>> +		vcc-supply =3D <&vreg_l6p>;
>> +		read-only;
>> +	};
>> +};
>> +
>> +&cci1 {
>> +	/* cci1_i2c0 is not used for CCI */
>> +	pinctrl-0 =3D <&cci1_1_default>;
>> +	pinctrl-1 =3D <&cci1_1_sleep>;
>
> Let's keep them per-bus-subnode so we don't have to override it

I don't see any upstream example of that, would the pinctrl work
correctly with that?

While this isn't necessarily pretty like that, it does work :)

>
> otherwise
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks!

Regards
Luca

>
> Konrad


