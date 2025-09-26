Return-Path: <linux-arm-msm+bounces-75233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD37BA2452
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 04:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBC9E5608FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 02:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0842248A4;
	Fri, 26 Sep 2025 02:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYMEIaL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282728287E
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 02:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758855580; cv=none; b=pbmDjKRS/POizS0biGHRCPuTSZVEWR6x2XUSc6Bu9631POimyuw0nt1X47Mle2dk+pSQ6ucBNR6aFkQeUCIuAW0fEfyTBdw5WqaI0tA9eC87aV/BhgqEWtrbO9KMp2JIiEJSl94Jh4wPOEIVp9AY+ca+LNCV3bdBXpktkV5PzKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758855580; c=relaxed/simple;
	bh=l0ECngto9cM+qQ8jmcCUSAhzMScieKqkggBmP+VLjPI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mrbMZl7vDmGZfb2VOdpiOAhNVqsUCB02qQi439z2djIN9lzZZ959gEpkUXqTyxrgxN1prkESiy8ocMRpQxM6cd8ybigKTIQHl9yUpl7SJIKz3nICY2QWxqWZNsznUbYcwIsWmbgEJz6E4wro6MEi08BcadZoQ82y8jfsJ45Vlus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYMEIaL/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-26c209802c0so18505585ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758855578; x=1759460378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9DFZaTqWY2S2tGyXXJLRz+UlH7utbYQxFHAmg/aDwJo=;
        b=kYMEIaL/xFdW7ByzdPAGM19uPyr2VedoOgQpGEzFni7j0kw1S053MImDWJoRELagCu
         2IHQulbaeQ7yCnPNtDiHVLoxGG0TyC83FpLaqroyL+hQ7J/fNkL+41jmqqWUbCSLkWNr
         ErQ+zMKtvBjorZVuisGz++sA2E5TMeHBVyQ9xxUEHh1jLDqAaEJvoOdLg3oInoOlfAvs
         yyYTTXVsgmdGoSxwp/pr7BkxfffUBL/Quj97yWkfrla2KSZXs+cMMKNMmDufshZzcyep
         ELIlh/sGq9ZwMj6gsAOXeFrSZFLqiu/2tUdL+p82jh4LvMbfadnBSXOgUdcOGq17aYN+
         3B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758855578; x=1759460378;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9DFZaTqWY2S2tGyXXJLRz+UlH7utbYQxFHAmg/aDwJo=;
        b=YubEdZUyLYyg1oLksazJs4WwMJu+YZI1l+fGnWVZmRY9IGO7OHGZRChyVXFhqyMb3W
         TzgeB2fJrGsBmPRMJzzTG6/9SRfba3lM3eaVjnlIRQxjwusIIOrqUNfoY8aDVvWQ7QCp
         3qbC2g+3MYppiT4z4YG7tG6I3uVYlEvJrxJcxiVtrQkL3ZW7rJqhPM/76u7bLMsuT69e
         ZI+Yy3Zq3Qt9b1ALLv2RDDERhya5FslVpnoGjTYFQwjR0izK2jAHv9z0m5EfQJpFybne
         lNq7i1UF5WNvNW1YtlvsnlXriVpSEsFEHbMu+fP/tLT1O03DWWr2lf8k8gJy/Y46annR
         qgPg==
X-Forwarded-Encrypted: i=1; AJvYcCWE9RiSpToaKZkye1d3UGu22h70UQVty5Asveo+WDbH05u5u0AcLs2azaqZpSU35Fa7+Dm6tvFMGY0XcUlC@vger.kernel.org
X-Gm-Message-State: AOJu0YzIURMgz3j56dII8X1f3xJrnLYBHNDkAdq0jybcXXnjAhTZKM2i
	Zuq77sjZvc9Drt9a+gO4+5SY/+i8kNV6hS0n/0IBhjewwP0Z8aOTaavE
X-Gm-Gg: ASbGncsRlEZQ7RZge+vb+jjmSzLzVuQx4Nus5OzWAgqcp/j1hrdIp+XztXb1tANDoNe
	UapH3AjfQSjk/0EcI3hqXKl+BCsw+Ztg7OEsKobJn4tZX52XI5Tt4XNjZwupU+TWtCUGnF+NkjT
	gVDDSIVWbNXtddvYvhw1Zc4YiYTbdg1VC+Nl+MCe964OOM8xco3sLP4o9pAiWE6E9fW6hz4VWaU
	WfjjorewARSwe3IbgwcjXmJpy1LNWESDL096IHAPGZWs5lEHM5rirTrL9OqgVJKutDzyVj7Pd31
	BYt/zGnaCtfC5SLcsyICT9/8+Jjxg9GfP1UFnABrqHa2e0SGrA6Ec9NjKnZWCYMYnQMqmd2Uo98
	SeGJ0KDiH/XHH/zgiBQKoH2o7kPJ6Yd9tMA==
X-Google-Smtp-Source: AGHT+IF1KXe4IB93OQXtPcbKbci9ToFOHTHIp6Wzd2jpuNLiQ0xSjXqxp5GIX7bPJ7vagp05lKkQwQ==
X-Received: by 2002:a17:903:4b04:b0:271:479d:3de2 with SMTP id d9443c01a7336-27ed4a1a2cdmr53853935ad.13.1758855578412;
        Thu, 25 Sep 2025 19:59:38 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:18:161:d250:a5b8:b662:f3c3:afe5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bd90587sm7255414a91.6.2025.09.25.19.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 19:59:38 -0700 (PDT)
Date: Thu, 25 Sep 2025 23:19:09 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: r0q: enable max77705 PMIC
User-Agent: Thunderbird for Android
In-Reply-To: <53b1a622-3afc-4fd9-98b1-3c166f563ad0@oss.qualcomm.com>
References: <20250920014637.38175-1-ghatto404@gmail.com> <20250920014637.38175-4-ghatto404@gmail.com> <53b1a622-3afc-4fd9-98b1-3c166f563ad0@oss.qualcomm.com>
Message-ID: <BB4E3024-F897-452B-9D3F-250ED2D52195@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 25, 2025 10:06:53 AM GMT-03:00, Konrad Dybcio <konrad=2Edybci=
o@oss=2Equalcomm=2Ecom> wrote:
>On 9/20/25 3:46 AM, Eric Gon=C3=A7alves wrote:
>> The Samsung Galaxy S22 uses max77705 as its charger, fuelgauge and hapt=
ic
>> PMIC, enable the fuelgauge and charger for now=2E
>>=20
>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>> ---
>
>[=2E=2E=2E]
>
>> +&i2c5 {
>> +	status =3D "okay";
>> +
>> +	max77705_charger: charger@69 {
>> +	    compatible =3D "maxim,max77705-charger";
>> +	    reg =3D <0x69>;
>
>Please use tabs consistently
Sure
>
>> +	    monitored-battery =3D <&battery>;
>> +	    interrupt-parent =3D <&tlmm>;
>> +	    interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
>
>interrupts-extended =3D <&tlmm 5 IRQ=2E=2E=2E>, here and below
why extended?
>
>> +	};
>> +
>> +	fuel-gauge@36 {
>> +		reg =3D <0x36>;
>
>sorting by unit address is welcome
Sure
>
>> +		compatible =3D "maxim,max77705-battery";
>> +		power-supplies =3D <&max77705_charger>;
>> +		interrupt-parent =3D <&tlmm>;
>> +		interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
>> +	};
>
>These nodes should be children of "maxim,max77705"
>(see drivers/mfd/max77705=2Ec)
What do you mean by this? I looked at the driver,=20
should I add the pmic@66 node and put
the units inside of it? Because starqltechn doesn't do that and
places them outside=2E Also, by adding the
pmic@66
node it expects to have led/haptics nodes as well=2E
>
>Konrad

