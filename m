Return-Path: <linux-arm-msm+bounces-76092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0105DBBE8AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 17:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2292F1898ADA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 15:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AD02D8DC2;
	Mon,  6 Oct 2025 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbnRMCvy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB062D7DF7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759765757; cv=none; b=ng0nUTAi4WNXkTXYMVkGOKTMUc1dzvjEXQJ1n3M7ghb6FywlidBQBVC2QegbrPY4TUA6H+ej15679K85ygS7Vgevln1FQ6Q/ZZMjRp8iI5zUUOIp//pJTuAZ6ya5H2Pb47Z0tR+ejIpSJ9nJCcJGeYy/4HEY2M7KV2Ys0t7CXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759765757; c=relaxed/simple;
	bh=h7zPFSCY4N4s5k1Av1++h8vuQP5AfNULE5kid3kk/OY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cNg4t86bD5e29/ize/d1lmUFUs+BI+4jhuLt6nWYRcoLKN9NeSB4dDRKaShuhWRySKLgfrNuKi9b3lxYW9Ua4bai5lQ11xzPqF8qkIhkhVuDANBJ6NhI8cfrx1bjox5G4oa83Nd4OZDBI2zVwTn4PzAqa6Sk+Bq0nsNrAMWZBRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbnRMCvy; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3322e63602eso6662630a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 08:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765755; x=1760370555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uKx7DTfvvmjIZ6cGtmnwuVyxZs+QDCyCKdDBftxtrEw=;
        b=gbnRMCvys50MgBLoIagC0WuNVoaCHpvLGwOJfv/nX2U5BQfXelUYfxUIx48vulih44
         SmqH1u8bNpGjoeo4Z/mGY4uoTwMRNq+q2TQg0T4sZzXrGgvyY/Y/JffCGXXEf7EOC+zN
         8BI42SyjMs7vcRUCliWKLwR/z4J0jwdw9FYd4Ctw56oeHmQhq1Md+mVuGWscOlqrkRUc
         Y1/SZEyqRWvTIoyVPcRbo0Eg8x/TKSphOiuWXdJ82kDH3xK9KObwYM1SfthcvO5CtUMB
         BxWJlZbaJ8PaIXEKeJU25EdLj7e5k0A/oqi6tNU/0XHwgr/t0T3vsJnA3OHfFEQHyEBL
         Uq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765755; x=1760370555;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKx7DTfvvmjIZ6cGtmnwuVyxZs+QDCyCKdDBftxtrEw=;
        b=OzeMCKXylk3h0RuglxW8xAc/bZtNu3jGgA7oYsvdmUsmx2od63FuWD0sPXqyDBGCwE
         ZauSl8ULGA/z4DhI0Kg65eVcC3hoyLAiiwVkagMyFox/f01eBQNHox95cZ1uRfU5b5U+
         rJBD/JBgqxBGyGv40ELsPm4SgyqvV8xz+xD1vxUHZNjHt4ostVGbqcU1jzfV7ykTOwr2
         bFNsEZ81uu8aEY4En+pgOPYK9Zukt66BocV5p3aYwelLB3XWyhxRRU4USzsekW7QTRBa
         DuKvq/b3CXga61OSx1aiwYqa/pzHTd4rwCDLKfHWDgcNG7XO49p+Jq3cMlSU18Aj6MIt
         JVhg==
X-Forwarded-Encrypted: i=1; AJvYcCUUXTtikXkIJiPMFCugeloBhEEBJ9h+otGC42G6AS1fFQZFIxOO38dCtKgNo9IeNe3b9I5hAMSHd//2v0N4@vger.kernel.org
X-Gm-Message-State: AOJu0YzrfxY160bVGhEjwNApFfh2tD5TZv2UmJ3ZBbbfYg5I0ppo6kxj
	HcJeT7JqgQYzE6QzJ6SxdrViTItM7uCo4QIer7zdwCINCl4xhMB436ml
X-Gm-Gg: ASbGncsn/jGdVSSiPIturqf4i6CufdEQ3ZbtJUyqCJCKQPRlJQMAC/LcnGkecNUTaDV
	I23V+0yUH5hVAuqHSFy9DOrw5HfHdvp+KhLMGcoHiRF9hAnW3+nPAc/ilICmV6TiTNLK0b4gm7v
	/lRQnoel9+uQH9qgVDscr7zj3TiSzHo85e+lD+mi2CYr60FPUxxcMtmjfSgyMjD5YjAwEyDGu69
	QOVlfVGm2pXFVbqnes987oQK1OD7bUhqo3+K18Nuu/yCnKhryTrZf6dcRmbU9Q4cTl+PEYTgo+G
	qJUUC/+0mcWad6mYuldty7v+wEFtVh4hWYJ3nzGdTWzZWNZkEBFrHhl0+1InGoAJdWdZXoFA0us
	NgCVoNTyPn0j+tK1tY719HK9DM3rgKKKMWXKwDZb5fIQTv572BTl//C+kBg==
X-Google-Smtp-Source: AGHT+IH4Vfm2HXvCCkpVd9mobsIP67SLElIVdmkXufOG8TbovUst5yZCGISDNRa5UtQ9rmp5sk2B3w==
X-Received: by 2002:a17:90b:2707:b0:32e:64ca:e84a with SMTP id 98e67ed59e1d1-339c273dbd2mr18130644a91.12.1759765755438;
        Mon, 06 Oct 2025 08:49:15 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:18:932:c1e3:aaa3:c804:f5ef:49e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339c4a0d53fsm10911596a91.5.2025.10.06.08.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:49:14 -0700 (PDT)
Date: Mon, 06 Oct 2025 12:49:10 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: r0q: enable hardware clocks
User-Agent: Thunderbird for Android
In-Reply-To: <c21a408b-ec4f-4de8-a9b6-ca25410ace6a@oss.qualcomm.com>
References: <20250920014637.38175-1-ghatto404@gmail.com> <20250920014637.38175-5-ghatto404@gmail.com> <d16e8c07-6c10-4c91-9bbe-a260f0497d29@oss.qualcomm.com> <99D0B281-03A5-447E-A6BF-892C99829D0B@gmail.com> <c21a408b-ec4f-4de8-a9b6-ca25410ace6a@oss.qualcomm.com>
Message-ID: <CC2BFAA0-7E61-4D91-B369-88EC9AD4A315@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 6, 2025 9:31:42 AM GMT-03:00, Konrad Dybcio <konrad=2Edybcio@os=
s=2Equalcomm=2Ecom> wrote:
>On 10/5/25 5:50 AM, Eric Gon=C3=A7alves wrote:
>>=20
>>=20
>> On September 25, 2025 10:09:48 AM GMT-03:00, Konrad Dybcio <konrad=2Edy=
bcio@oss=2Equalcomm=2Ecom> wrote:
>>> On 9/20/25 3:46 AM, Eric Gon=C3=A7alves wrote:
>>>> Enable the real-time clocks found in R0Q board=2E
>>>>
>>>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts | 15 +++++++++++++=
++
>>>>  1 file changed, 15 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts b/arch=
/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>>>> index c1b0b21c0ec5=2E=2Ec088f1acf6ea 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>>>> @@ -225,6 +225,21 @@ vol_up_n: vol-up-n-state {
>>>>  	};
>>>>  };
>>>> =20
>>>> +&pmk8350_rtc {
>>>> +	nvmem-cells =3D <&rtc_offset>;
>>>> +	nvmem-cell-names =3D "offset";
>>>> +
>>>> +	status =3D "okay";
>>>> +};
>>>> +
>>>> +&pmk8350_sdam_2 {
>>>> +	status =3D "okay";
>>>> +
>>>> +	rtc_offset: rtc-offset@bc {
>>>
>>> Is this an offset you took from somewhere downstream?
>>>
>>> Generally you *really don't want to* poke at random SDAM cells,
>>> as they contain a lot of important settings (incl=2E battery/charging)
>> From another sm8450 device, I'm sure it's okay=2E
>
>That as an argument alone doesn't sound convincing to me, since vendors
>also sometimes repurpose unused-by-Qualcomm SDAM cells
>
>I actually found a data source internally and this cell you're trying
>to use is reserved for PBS (see drivers/soc/qcom/qcom-pbs=2Ec), meaning
>you already fell into this trap=2E=2E
Interesting, in this case then why does rtc still work? And
how can I find the real cell? It's not in downstream DT=2E
>
>Konrad

