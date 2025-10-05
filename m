Return-Path: <linux-arm-msm+bounces-75976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C69F6BB93E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Oct 2025 05:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52629189AD8C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 03:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9ACD19E7F9;
	Sun,  5 Oct 2025 03:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXeBx7/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23F195808
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Oct 2025 03:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759636223; cv=none; b=SyMUDeIEroDAOQHXp8U50JP1e8h1buq3ImuvLS1dtl4vOX+8cLyYZcwbYWVEMk/8CR70l/BsfGeFkfg1yfePOF1h+uj7Kt/F6uV5/0RC+A4A+tYsI5u63pnj+zJrZV45vQMAZVXnlGjKfdSVHUufikVg+SloC9iF1HhvSlOM++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759636223; c=relaxed/simple;
	bh=+xM3jlWWcZ0O3zm4JBTc30PBKSwwJDsHM/u/wFG/UTs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=OdXUeS/ef6PzrVjHnWrshLLb5hSoaJ4r3/X973lUY4JRcWi1q4twlBSYay/IxYUw9AQU8KZE0UUoxP33lobIhNxLXNUXDmgXzCWQhKlzIiUMsXPNc1FyVUNTvevfdvdv1nwPvPgfc/QcAE2JPNmMgRipj9LXlbaQZetnutJvkxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXeBx7/2; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3306eb96da1so3125055a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Oct 2025 20:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759636221; x=1760241021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c5eVUz6w+EoFaDLEM3O5W2lqhgMgUFUDbpzSqKfqJ4E=;
        b=SXeBx7/2Pvzpq3snwaE1C5O2MPJ8vKRkotHFZZ1GvYbsB9S6w3NN5SoBrB3PFgxEzE
         lI1haz4LSFWAHpecnMs1LLKWdIcZ7OMp2u0RHJW423mvyMBk1FKwUfTQTmTsOtSWnhlz
         Bu6BqutqyxkUbLZ6EXunGjFxItY22K6RXn5IKsoHf6EpQwVEdmuTgh6eDE8a9KewrS5Y
         SY6a2fYkPWxz3exO1zvP6cxC7BWZfjoxiRjHw2nsZlfz6wT3J9NPmISMExOwjuCHcWKS
         LkBEtaX8GUVCjSecR+5Fno3hxO+X1i8/XUdr2qm8PUFCUj8OIB1QdvOeegYv0AoMYR+u
         rWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759636221; x=1760241021;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c5eVUz6w+EoFaDLEM3O5W2lqhgMgUFUDbpzSqKfqJ4E=;
        b=YBYQh1jMIns2lY/lGOzVGqgIFUsQTUEXLl+yGikq+3GGVZuW99uB3M9wqxn06pRh6o
         inzGHcqxecoE/AvITvYf2U6Zvbmht1NVAovfeu+EqE3WBVKv80NTiJBTaK1mPVjHo8RO
         W2bNVMpUZkvtN081kDupGrzNNuSWYzUR64nwu6guPOMUR3i+CNwmov7swd3ZbUb1eSSr
         JL5INX7q6A11u41Fije4v+2hR7Hrumwa4IhoB1+Hpqf91RmIiMKjYHUtt5ioOrj3JlaU
         6Hgc6C7Uu9CD9gxWSp+DBeofv3B6kH/NJvwMbGNUh/18miFhj7nieD7whosUKGkEMuMt
         lnvA==
X-Forwarded-Encrypted: i=1; AJvYcCVyjyTOIw2YIgky0I3BlFYW6V0umGJAn/BD5VWWz10/jG4LtigsgFJnxGunfjLvotFq541s7+SxOKTiZto2@vger.kernel.org
X-Gm-Message-State: AOJu0YxHSFHnRy6KvcESVxhrHI+EG66urohJYhqYBr2cwN00lcJXBVgf
	H8EgYpBMu4igMrySzllzzQrYDaEZYU6A9W3fHPm66o6Qgs8drYq712Oa
X-Gm-Gg: ASbGncuh1ySHVc8JwyOnFHkyLfdvU15xIKOJr2a2UL8cuXMUTQBk5QbnwoIrFtwu9Ag
	rlEP6V7pzMiDbPU1QQb+IKYDtNhqGOO12qb5vJZBcK9lv9/eWnlNiJG8NVd8gijzOt+ZKPpH31C
	vfphWFvS0hM6yWG7nrkrbxUBW89RgWr7OBVJr6ae44oKPWiZAHbL6tzzq6U6GdBoBzs6mQo5sYF
	siUymuuBLh8VEd36pU4yOQlNRaFiSl6gdG4wClxwG5f2mumI88/2LaPNJDHo9iekoicN6nk9DEV
	JKXs5PRavQ/U9WV8wQetNqlZk5GAxdmmmP4oi7ur8MxDO+7pPJMdjfMM19ZaduRFsdL5eDMntoE
	pIaDza9sxQG5hywm5OLlT5g5CGcgp1+s1dTKG6UBn7n4m/lkX6R8UiP60h1rRp4Jhm5u5PA==
X-Google-Smtp-Source: AGHT+IHcTbMO5+we3ZfilD94T2VHeJ0hOb2Fn1NDL5mTMC08c7x71iIANmz2jzxUESzENW+NrQvLww==
X-Received: by 2002:a17:90b:390f:b0:336:b60f:3935 with SMTP id 98e67ed59e1d1-339c27db5a8mr10757968a91.23.1759636220504;
        Sat, 04 Oct 2025 20:50:20 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:7f0:9241:9618:6db0:456f:e63a:4e6c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339c4a0d531sm6470367a91.4.2025.10.04.20.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Oct 2025 20:50:19 -0700 (PDT)
Date: Sun, 05 Oct 2025 00:50:16 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: r0q: enable hardware clocks
User-Agent: Thunderbird for Android
In-Reply-To: <d16e8c07-6c10-4c91-9bbe-a260f0497d29@oss.qualcomm.com>
References: <20250920014637.38175-1-ghatto404@gmail.com> <20250920014637.38175-5-ghatto404@gmail.com> <d16e8c07-6c10-4c91-9bbe-a260f0497d29@oss.qualcomm.com>
Message-ID: <99D0B281-03A5-447E-A6BF-892C99829D0B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 25, 2025 10:09:48 AM GMT-03:00, Konrad Dybcio <konrad=2Edybci=
o@oss=2Equalcomm=2Ecom> wrote:
>On 9/20/25 3:46 AM, Eric Gon=C3=A7alves wrote:
>> Enable the real-time clocks found in R0Q board=2E
>>=20
>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts b/arch/a=
rm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> index c1b0b21c0ec5=2E=2Ec088f1acf6ea 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> @@ -225,6 +225,21 @@ vol_up_n: vol-up-n-state {
>>  	};
>>  };
>> =20
>> +&pmk8350_rtc {
>> +	nvmem-cells =3D <&rtc_offset>;
>> +	nvmem-cell-names =3D "offset";
>> +
>> +	status =3D "okay";
>> +};
>> +
>> +&pmk8350_sdam_2 {
>> +	status =3D "okay";
>> +
>> +	rtc_offset: rtc-offset@bc {
>
>Is this an offset you took from somewhere downstream?
>
>Generally you *really don't want to* poke at random SDAM cells,
>as they contain a lot of important settings (incl=2E battery/charging)
From=20another sm8450 device, I'm sure it's okay=2E
>
>Konrad

