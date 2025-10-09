Return-Path: <linux-arm-msm+bounces-76733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E0BCAAC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 21:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 485C43AB840
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 19:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008E6246335;
	Thu,  9 Oct 2025 19:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mg5HF1eS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7567D1E0E1F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 19:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760037644; cv=none; b=YsaOEsHO4ugd2SIYjqitmzGvB7ku3qdp1zSE9XPBxvw+A47ALKxa2V5vPNQBvUxqxUVrUnttJSJuS9cMoJAjQ3u8ZciIunvexwEYfY+auCJuX7OhG9GmfAK5dGZ6hn+3lt8jtk822CSI+IbLeYlD8alG01uWiSusXBTqmGt/Nc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760037644; c=relaxed/simple;
	bh=woqc0ajrEt9uJ5/Im+UuHQvQ2PqgtUVGDVDgEWOfPhA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gdmCCynKku6KUVlLcIFeFANe++LuVDi9pUkZXhZkiid5+yZPX9UdfEVJJdfcDu+ZDNQ7LxdepqXV5osiHxBSxFTtoOEmnzXi+yuPBG4zISYkKvlCJ9NYKCOZ5+njuKCEfSKqjOIjWxxSFuI/ZeEKMy40M5tCnJGO2eEK10+kGHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mg5HF1eS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781001e3846so1295240b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 12:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760037643; x=1760642443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=70Rn4bo8hsp+8hzkUYKF6yigfv0n9RRs7N6OTgJJwNQ=;
        b=mg5HF1eSEGm5J/mqOMz9xBJcIZ6NWm6XetPSL1YBnaeiaC21cZaIOZbJeahD+jNu7j
         n7g/5tEeeYr+Q2GZrKldAtgs5+L3ccQhgULZXrwQJlGtDxS47/s/+XIwfr6ST6eD2xvy
         xeT18M0RNnL6M+9BupTAZyRpAQp2UQHcoJMF0TaJAQKqy9+S0KAhI6uvBytM5sxUFFhH
         OzF3gE7/WIQMntSzKkGZb3NNIVvdlxriWlRYaCudbVM75/MvCoHiXh1BW90t2lX5Xbm7
         dq9KVUt/u9ohNy+InDXg2hCLnzHTUCxl8lzQ5ucaQ55ci1yoJ6AeHaOOATeiwtH7w2sz
         VorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760037643; x=1760642443;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=70Rn4bo8hsp+8hzkUYKF6yigfv0n9RRs7N6OTgJJwNQ=;
        b=ehgqHJIhLO4A23aXzJ91U1CYZjSCGAecr2bi0xC7qQY6CO61KvU8/AZEr5zqOxb/xA
         d1bJEd2h1ShHOijagpzFoknFouc66Kqan/HeHxR00FtgxfklxFEr/8q9wUQDM0hxFYdS
         QAvubuaE7AE0hsWho05fOXyHWHHS/wFeDLKUwYL1ZE2aCJ1Sq7BMfrmhgobMhTSa/MFE
         gvgmrKtuUK6ofnNufWT/KXuMudAgpz+XJMZdj5MQgevuDaCRVz+jfaJZgIQ9x7y4o0CG
         PzjGvixZOhT9YMj5QwkUc0iKkz/kagPTLY1vC9g3NGdwv3mMNAYVrzTMTzZ/KKcDRejc
         52/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzeDT4JV5awjLrS4bRrete6O8gfjwG09+f+Zpkv5CO5OrSpWRk+mHPX/Y9ohlFIXvln8tIBwVOHGZSt0cr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy37hOAXJ6spVSFswbczgizY1PgV0FeUX+yvm57pSpmyGDqIgLw
	e0rnpZQ0Xbof9pnZ4aFtZ8ev1yoW87AmSrrUemQloWIM+MBJDQrF7Abf
X-Gm-Gg: ASbGncus/kMKBoF/AgaqUpRXWJMpwTcFKrNwjFh9WQX4SSaJLwT0Wl0caNlombJr+Q/
	i6FGszJ5f+PWbAQ9qPtXu7O/AAgRzw7d+9Q34TT4+tEGM4EGpdEVTp4IiTgt6pxIiiurtfMPLrG
	4UcN5nkYb1bgw6hahLGi0VnBQd1w+OPEPc/5s+PQgCejmOIsBGcUNH16II4rMhdQYkWV/DB1UEZ
	8eVqgQy5VPenuIo3/j5VwbCH/9Ukcq42Olf+FnQCAFnIlxoDYBWm0UfCAIJWTtlngcN6x7zX4wv
	8JsNQcWsa+BUgsuCAllohf6YfAZZSY49Vrqn8Md45Akt2LVWG1mbnt1hYIxt5I9GUr1n1V7wd9I
	wk5/10DLlebTvHrUHBSkgJD7ko3W9+dBl4YUQcHN9ncF/G/S+ZgnhVw==
X-Google-Smtp-Source: AGHT+IExINYt2VpRHQfQDcSUxK76tMIxBq4KZhCeSaRfPsxwSO1OK86eDLc1NLkNzcpsjOHWmUAbJQ==
X-Received: by 2002:a05:6a00:1954:b0:784:7275:837f with SMTP id d2e1a72fcca58-79387435d78mr10324017b3a.26.1760037642658;
        Thu, 09 Oct 2025 12:20:42 -0700 (PDT)
Received: from ehlo.thunderbird.net ([177.9.216.59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b0606fesm525438b3a.12.2025.10.09.12.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 12:20:42 -0700 (PDT)
Date: Thu, 09 Oct 2025 16:20:38 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: r0q: enable hardware clocks
User-Agent: Thunderbird for Android
In-Reply-To: <39d07bf1-cead-449f-85c8-4651e5296cd8@oss.qualcomm.com>
References: <20250920014637.38175-1-ghatto404@gmail.com> <20250920014637.38175-5-ghatto404@gmail.com> <d16e8c07-6c10-4c91-9bbe-a260f0497d29@oss.qualcomm.com> <99D0B281-03A5-447E-A6BF-892C99829D0B@gmail.com> <c21a408b-ec4f-4de8-a9b6-ca25410ace6a@oss.qualcomm.com> <CC2BFAA0-7E61-4D91-B369-88EC9AD4A315@gmail.com> <39d07bf1-cead-449f-85c8-4651e5296cd8@oss.qualcomm.com>
Message-ID: <6E15B597-47E7-4233-9DBB-2DAC698F4532@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 8, 2025 5:48:53 AM GMT-03:00, Konrad Dybcio <konrad=2Edybcio@os=
s=2Equalcomm=2Ecom> wrote:
>On 10/6/25 5:49 PM, Eric Gon=C3=A7alves wrote:
>>=20
>>=20
>> On October 6, 2025 9:31:42 AM GMT-03:00, Konrad Dybcio <konrad=2Edybcio=
@oss=2Equalcomm=2Ecom> wrote:
>>> On 10/5/25 5:50 AM, Eric Gon=C3=A7alves wrote:
>>>>
>>>>
>>>> On September 25, 2025 10:09:48 AM GMT-03:00, Konrad Dybcio <konrad=2E=
dybcio@oss=2Equalcomm=2Ecom> wrote:
>>>>> On 9/20/25 3:46 AM, Eric Gon=C3=A7alves wrote:
>>>>>> Enable the real-time clocks found in R0Q board=2E
>>>>>>
>>>>>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts | 15 +++++++++++=
++++
>>>>>>  1 file changed, 15 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts b/ar=
ch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>>>>>> index c1b0b21c0ec5=2E=2Ec088f1acf6ea 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>>>>>> @@ -225,6 +225,21 @@ vol_up_n: vol-up-n-state {
>>>>>>  	};
>>>>>>  };
>>>>>> =20
>>>>>> +&pmk8350_rtc {
>>>>>> +	nvmem-cells =3D <&rtc_offset>;
>>>>>> +	nvmem-cell-names =3D "offset";
>>>>>> +
>>>>>> +	status =3D "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&pmk8350_sdam_2 {
>>>>>> +	status =3D "okay";
>>>>>> +
>>>>>> +	rtc_offset: rtc-offset@bc {
>>>>>
>>>>> Is this an offset you took from somewhere downstream?
>>>>>
>>>>> Generally you *really don't want to* poke at random SDAM cells,
>>>>> as they contain a lot of important settings (incl=2E battery/chargin=
g)
>>>> From another sm8450 device, I'm sure it's okay=2E
>>>
>>> That as an argument alone doesn't sound convincing to me, since vendor=
s
>>> also sometimes repurpose unused-by-Qualcomm SDAM cells
>>>
>>> I actually found a data source internally and this cell you're trying
>>> to use is reserved for PBS (see drivers/soc/qcom/qcom-pbs=2Ec), meanin=
g
>>> you already fell into this trap=2E=2E
>> Interesting, in this case then why does rtc still work? And
>> how can I find the real cell? It's not in downstream DT=2E
>
>Well if nothing accesses that cell between your last write and your first
>read, it will of course work, because SDAM is just a means of storage
>
>As for downstream/Android, it does not use SDAM at all
Alright, I'll drop this patch then, thanks
>
>Konrad

