Return-Path: <linux-arm-msm+bounces-74292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D85B8CE75
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 20:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28FD81B26A62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 18:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A860830F7FE;
	Sat, 20 Sep 2025 18:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYarsMCY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7E82FFDF4
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758391470; cv=none; b=cTCmeG2vFPUiXGVyDEd+vnS3EBjcpj+/ozhQGhsboQWLcUb/RDIanjb3teu5OYWERoaBcPVmbrr09BYLq/oXvN2m+4oT6SExOEw5uhEMOkLxTzaRbrEAgE27AdvF2e1HKOz3QzuFCC40eKy548p0IMcgNf0JNItsTKVtsviPD94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758391470; c=relaxed/simple;
	bh=4tlnfib27kjuIoWZqfi44dVrHnKQF8NT22sSeHsQkVI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=QFSMvI42bCVg/MX6Es6GwDOH8AcJjhYo1KC3bzWDIEVHi9V0g+E4/vJxLR+XtbYneTKEA8o+mbTZuqAcptmedOHHMUMW2JZNGMN+qvPGhqM64DV57ptza8ChoHScaKNsL/ybZqW96AlHamRxOaIpU2NwUOsA1RuTVKcRhDM2FrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYarsMCY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2698384978dso26066415ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758391468; x=1758996268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xbFzY792ZouMJtV7uIcmYuiGAKGlq9XPmiStNipyVbE=;
        b=lYarsMCYzSWsfDtNvbdZUperw9D48r/aitL9Bs+CxX2GZ7qdaZEwVWAUZ30Utv89VE
         Q+ePHB1oUObsk7NV4Kx8JSOG8gZQixIn+6vOmZazah92unZCpDRMWRFdxxVtWBfcQNVT
         u+nby5oj160uHQV+BdkRvdOyDZwo/qFxvsIPnDi65vVqXE13MvOT/et12+6HNqDvnEQW
         0DBOyGuJDrrYgSdQue5NLoXgYhyfAbHSR2sKiW3T3HrQSvGBNb1ekLW8uTTj62GIM/SQ
         RhOjxLLKZ49OdQ4O1Yv5QfqkpwhcM1VYg+kvhKEDCnpE2FGcdWtF7GNs0ZPRnkZHKzWz
         ETsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758391468; x=1758996268;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xbFzY792ZouMJtV7uIcmYuiGAKGlq9XPmiStNipyVbE=;
        b=aRqH63CwONsOjaxPAbTRpDXzD5+2tWVlqm+s5t6W0PcpFCW+I00XYNlz/bsg1B+IPv
         0BiSRzUZ661pX3wuF02OjJ9Ot4UiTHbdWD+mtVrd7R4olkSH4x8iSQ9mgISg1MuYpoRg
         8ol2yTDzPr21HNJ8PFHzkbCkdkQ+Fym47jwEjR98r0vUPe+Iy6d0FL2Z7941Bcit4cwh
         8fA4lVFsu6eRtu31KZ8XdWjMC02C6m4Nh1J+7Xd3CZy/E4gehQCxvKTDjF9TR+Bo7dlC
         6uAPxxibHq458nkhYyepA583rcHcUPsEJ6fA6ne6bELCXdRwxYRyBzpitnb9QJg0FXWG
         q49Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVCHaA7D5k0TMG9DwwUBNBCOhSfE1OkaaKKS4xas5vlgXgAwO6Z/ZZM6aNpXBglJQ7D/xgSvs1RRtCmngJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0orloaC1dEnL74q5WoJfbEKlkWlMqLH+NxsR/cs6uQuap2s04
	PzN3KyKj7O5VA2VqxMugLwAWM9sJxqvO5M5iCru3R47RK8OtWcSz0mdR
X-Gm-Gg: ASbGnctOCWk+2Vxw9mpgGwbiFR8ujETXQ1PFOVu7Z29MB3ELd68f1/uKFHbSUhb7jYY
	ScYDBuu1O8yOdg7x2wxga9hBO1RMFunMOZbidqGy6EptdRJW0VIx8tI9XGOF0b3ehv0xTWjmc1r
	KdzQJvmlPB1VL4XmACxhOIPlYOlP2BSvqimF2G16/+L+yvDokMFrKAAcQLL17m5tYnQbLomeGRD
	svIsscVM76Rq2Sw/s4cXazH4u8TGRfPHWuwKWX26tXZwFfJBX2n4AwsE05xiRIapl0AhXPQOBrP
	iResX7E04FUsFjQyii7Auj/HVJaW15o1WGTw0Du8VQyFgDlAt8w3IaayYztY0k6edJg+MQuaDFl
	QF8HorhpeIVUVdRr6kWw7/b3hrEq8a4sI
X-Google-Smtp-Source: AGHT+IEpnNSFdb3DDYxlQp/zpH31nLfl753vHvXYDevnTOJD3gAIr4knj1uVbiblHrcXNrdV7FT1BA==
X-Received: by 2002:a17:903:2d0:b0:24c:bc02:788b with SMTP id d9443c01a7336-269ba53c0ebmr101044065ad.44.1758391468341;
        Sat, 20 Sep 2025 11:04:28 -0700 (PDT)
Received: from ehlo.thunderbird.net ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed278b065sm11818123a91.29.2025.09.20.11.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Sep 2025 11:04:27 -0700 (PDT)
Date: Sat, 20 Sep 2025 15:04:24 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: r0q: enable max77705 PMIC
User-Agent: Thunderbird for Android
In-Reply-To: <uzofi67alw7kkzr5lom73ozghtytdquiigcwsucmut2mi3hvvk@26goz4knd7xk>
References: <20250920014637.38175-1-ghatto404@gmail.com> <20250920014637.38175-4-ghatto404@gmail.com> <uzofi67alw7kkzr5lom73ozghtytdquiigcwsucmut2mi3hvvk@26goz4knd7xk>
Message-ID: <7A9A8218-EE98-4548-A9F6-14DD278D47CD@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 20, 2025 12:48:55 PM GMT-03:00, Dmitry Baryshkov <dmitry=2Eba=
ryshkov@oss=2Equalcomm=2Ecom> wrote:
>On Sat, Sep 20, 2025 at 01:46:35AM +0000, Eric Gon=C3=A7alves wrote:
>> The Samsung Galaxy S22 uses max77705 as its charger, fuelgauge and hapt=
ic
>> PMIC, enable the fuelgauge and charger for now=2E
>>=20
>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/boot/dts/qcom/sm8450-samsung-r0q=2Edts      | 34 +++++++++++=
++++++++
>>  1 file changed, 34 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts b/arch/a=
rm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> index 7bf56564dfc6=2E=2Ec1b0b21c0ec5 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> @@ -14,6 +14,16 @@ / {
>>  	compatible =3D "samsung,r0q", "qcom,sm8450";
>>  	chassis-type =3D "handset";
>> =20
>> +	battery: battery {
>> +		compatible =3D "simple-battery";
>> +
>> +		constant-charge-current-max-microamp =3D <2150000>;
>> +		charge-full-design-microamp-hours =3D <3700000>;
>> +		over-voltage-threshold-microvolt =3D <4500000>;
>> +		voltage-min-design-microvolt =3D <3400000>;
>> +		voltage-max-design-microvolt =3D <4350000>;
>> +	};
>> +
>>  	chosen {
>>  		#address-cells =3D <2>;
>>  		#size-cells =3D <2>;
>> @@ -186,6 +196,26 @@ vreg_l11c_3p0: ldo11 {
>>  	};
>>  };
>> =20
>> +&i2c5 {
>> +	status =3D "okay";
>
>Could you please also add 'clock-frequency' for this bus?
Will do, thanks
>
>LGTM otherwise=2E
>
>> +
>> +	max77705_charger: charger@69 {
>> +	    compatible =3D "maxim,max77705-charger";
>> +	    reg =3D <0x69>;
>> +	    monitored-battery =3D <&battery>;
>> +	    interrupt-parent =3D <&tlmm>;
>> +	    interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
>> +	};
>> +
>> +	fuel-gauge@36 {
>> +		reg =3D <0x36>;
>> +		compatible =3D "maxim,max77705-battery";
>> +		power-supplies =3D <&max77705_charger>;
>> +		interrupt-parent =3D <&tlmm>;
>> +		interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
>> +	};
>> +};
>> +
>>  &pm8350_gpios {
>>  	vol_up_n: vol-up-n-state {
>>  		pins =3D "gpio6";
>> @@ -345,3 +375,7 @@ &usb_1_hsphy {
>> =20
>>  	status =3D "okay";
>>  };
>> +
>> +&qupv3_id_0 {
>> +	status =3D "okay";
>> +};
>> --=20
>> 2=2E51=2E0
>>=20
>

