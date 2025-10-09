Return-Path: <linux-arm-msm+bounces-76741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C30BCACF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 22:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4479E4E26BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 20:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C748257458;
	Thu,  9 Oct 2025 20:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+SZ27Pv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEA5230BCC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 20:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760041876; cv=none; b=kRo9pFN9I2pC1jYne2eyyKMpt+lw4dBbNI8rnfhFZ3KRyah+cES8G4HrOLl7C3tB2qMNW9Le2iglI2tltS/QO8BpzDsgVrAUTwxsA2Ir6J0TDyBXLvNdbYUR97BZrz7jGD46OF/Jd0CZC6i+dpOfwKHZmWmyEIp8Og59RalGbEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760041876; c=relaxed/simple;
	bh=kKLKNn2tHOgfWHamcCoi89YXs3sQAOM85uKuw1N3TgM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=SEA7YfDH6CTwcR1lykpMJo6m1P3S7m0CVnasQ7BUm9uJMGC2v5Y1sgV79pOzyIUsVnm/N1Ti8PDG2xed4zrwDUDDZY5qV69cKr6vt7s0ysisUGoVlbBHi1qvAPSoD6TAg+8yCAJXVccUKtGL8hDX4T5FKjO4QJy8e2QJ3Cqmp0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+SZ27Pv; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3322e63602eso1996239a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 13:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760041874; x=1760646674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DX75+oENqhUs+ksNL4UsS5KO7/l0mpfDo9ivlBwrN1k=;
        b=Z+SZ27PvJCsa9qx4/+RncT90dTdtf4cMQcEk80DrHfkESmUTbEbqlr9XMK8neXrt/k
         3sOXhV/9Rp+hHIDNtx1XUVa31I9JhMXESmKeI7stDy6xDHFZqqdoKjhubYF1GCJbTQEP
         drAirjLRkipqfzwGlwxo1qtZsZmgOulqCV8UP+3eJ1bQYJjSDwKim2fIAAYcshtiG/9h
         rG8FPHOrFmeETjkUstbAUmq4Hh9/DhXQYR9XcDppigxt9MKKbvc/GW0L1SBtZmoQ4Uo7
         jJoefe+MIR0ET8mK8IE+EEvB4Kj/+cm5PsvVEvrNwMXHRbxt503/qPtL+Q+0vEEdYcIX
         I8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760041874; x=1760646674;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DX75+oENqhUs+ksNL4UsS5KO7/l0mpfDo9ivlBwrN1k=;
        b=d3HxUcBXRBgQAkd1j95/xR5zXhpt4muHDEsvc0uixY+XI1atqt9r770iyv1T2O2qrX
         9E8cxb2wOeTz5nmru/MBam3f5mth3aug1SsF1bUhzG38Dvz6rR4bNZUlYEqAmRtaj8sD
         i3FRAO8VtNcLxNqH/vqKoCvaX64MsrPUTuZHOXgPEIoYK1lkJ59Txxz3U7aZiJd0gLB+
         nh2wEI6GegGQwwfmR/VU6ZPQjIqMFtIlrZBWv0VHM00aXIqCZw5oYgsYr8hTNNqVuNbe
         trY+2C8wzW8pBZYh4plcQ6upjXG2W/J7vEqorVvk4+e9MPDgkQ8l6vU6aDhcH9C/QyDH
         NDnA==
X-Forwarded-Encrypted: i=1; AJvYcCUXoZpvyCZg89IQA5D7Sw0LPFuEz2Zap6a5Dv7qgNMi3bpNk7IB5IQwzG1P9yNlWGbgmPVoZUFV0gYhN3A+@vger.kernel.org
X-Gm-Message-State: AOJu0YznV8yBRnFVvdsqPUF82sfM/crBS9pf1UUc4ggurro7e2IdgHCg
	NZQ6QSpCW5CYlngnUngJscZ0NB8PXbT9MW+BTjsATBAD25QGEUgK8tM1
X-Gm-Gg: ASbGncvPoIKdOD+OJXfo4HaZetmHxFYaN6Z3O07aUJK7uArJJ5SnEcUmirV99FCvM0K
	LhqBDyFTqVHEVAsCELV6Ttl5S4mzSbd3GJw5GBW0p2Z/MWL2JtGJQXEFGf4EvjmECC2XZlIHu8D
	z78eEkN6U9zBv/woqlLjDWGbjs0f/VivLWuE65q+Ne7iyySdzrE7ZUFfOI8ehVMiMa1TGw8GF15
	1KUAfL3SrBH36pqdkovQNwAb449xYe1QDlHGx5QdvKgejwLBrmDEBsMaY/EEvhyYuipn6pKmvSI
	hTF8NSsnHoKgGdZEx2/3vL4a1k1Zit0BkhFCrVe4V1JPFSd8RgmhW9iB4Ck43oeN/r4YjX2xbfb
	M4aAH0lco5q03IuLlOh2pcr8XY9xrnKyEvMqEpgzrKbjfj4i3YB+09Q==
X-Google-Smtp-Source: AGHT+IF/Q0CQMjtHkri0GZVA9mm1eBLAuN8edY7oQCLx6h26GN1IZ77hNerCbEluRboNwdvi8zL05A==
X-Received: by 2002:a17:90b:1c07:b0:335:2a21:69db with SMTP id 98e67ed59e1d1-33b51161d5emr11321510a91.10.1760041874006;
        Thu, 09 Oct 2025 13:31:14 -0700 (PDT)
Received: from ehlo.thunderbird.net ([177.9.216.59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb775sm438259a91.15.2025.10.09.13.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 13:31:13 -0700 (PDT)
Date: Thu, 09 Oct 2025 17:31:09 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: r0q: enable max77705 PMIC
User-Agent: Thunderbird for Android
In-Reply-To: <823af9ee-df4e-40de-bf30-084442bb1d2c@oss.qualcomm.com>
References: <20250920014637.38175-1-ghatto404@gmail.com> <20250920014637.38175-4-ghatto404@gmail.com> <53b1a622-3afc-4fd9-98b1-3c166f563ad0@oss.qualcomm.com> <BB4E3024-F897-452B-9D3F-250ED2D52195@gmail.com> <823af9ee-df4e-40de-bf30-084442bb1d2c@oss.qualcomm.com>
Message-ID: <17433470-8B99-4910-AB3C-494C7C27BC29@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 8, 2025 5:34:00 AM GMT-03:00, Konrad Dybcio <konrad=2Edybcio@os=
s=2Equalcomm=2Ecom> wrote:
>On 9/26/25 4:19 AM, Eric Gon=C3=A7alves wrote:
>>=20
>>=20
>> On September 25, 2025 10:06:53 AM GMT-03:00, Konrad Dybcio <konrad=2Edy=
bcio@oss=2Equalcomm=2Ecom> wrote:
>>> On 9/20/25 3:46 AM, Eric Gon=C3=A7alves wrote:
>>>> The Samsung Galaxy S22 uses max77705 as its charger, fuelgauge and ha=
ptic
>>>> PMIC, enable the fuelgauge and charger for now=2E
>>>>
>>>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>>>> ---
>>>
>>> [=2E=2E=2E]
>>>
>>>> +&i2c5 {
>>>> +	status =3D "okay";
>>>> +
>>>> +	max77705_charger: charger@69 {
>>>> +	    compatible =3D "maxim,max77705-charger";
>>>> +	    reg =3D <0x69>;
>>>
>>> Please use tabs consistently
>> Sure
>>>
>>>> +	    monitored-battery =3D <&battery>;
>>>> +	    interrupt-parent =3D <&tlmm>;
>>>> +	    interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
>>>
>>> interrupts-extended =3D <&tlmm 5 IRQ=2E=2E=2E>, here and below
>> why extended?
>>>
>>>> +	};
>>>> +
>>>> +	fuel-gauge@36 {
>>>> +		reg =3D <0x36>;
>>>
>>> sorting by unit address is welcome
>> Sure
>>>
>>>> +		compatible =3D "maxim,max77705-battery";
>>>> +		power-supplies =3D <&max77705_charger>;
>>>> +		interrupt-parent =3D <&tlmm>;
>>>> +		interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
>>>> +	};
>>>
>>> These nodes should be children of "maxim,max77705"
>>> (see drivers/mfd/max77705=2Ec)
>> What do you mean by this? I looked at the driver,=20
>> should I add the pmic@66 node and put
>> the units inside of it? Because starqltechn doesn't do that and
>> places them outside=2E Also, by adding the
>> pmic@66
>> node it expects to have led/haptics nodes as well=2E
>
>Well, the chip comes as a single package, so this only makes sense
>and the bindings (mfd/maxim,max77705=2Eyaml) corroborate that=2E
>
>Just looking at the YAML, you should be able to omit the LED part
>if it's not connected anywhere
Well, looking at power/supply/maxim,max77705=2Eyaml shows
that this is how it's meant to be defined, (outside the
maxim,max77705 node), no?
>
>Konrad

