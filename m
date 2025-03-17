Return-Path: <linux-arm-msm+bounces-51615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F98A64E53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 13:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B5407A4AED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 12:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D28723BD17;
	Mon, 17 Mar 2025 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="a+/HGoDk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6387921D3DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 12:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213559; cv=none; b=taqdokX//zhyXArLQxW5UbzjUxDRCfqjIW6VDEv8QfujykdTRzhhzRf5ZZQHnjK7MK6CAWmTZAxTN6OOkICOQp/94UOIV2GBUyBq0GwxHm1pCYUR1nHmGoI3EwrEe0tkKL2PC0jkvJamKNTg/mpzzcfZRRRVjsPCqkOa6Q+Y2nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213559; c=relaxed/simple;
	bh=UgTOwub6IM8lyO1PUttTb8emd3or5wxqwiyiuHKamRY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=BJHD+45K7fHVgYOZN1e7QsAa0dipxnfJJtxDE5mCBX0mQOSsmaJjhFq5phTVkwo1pmCknpMUhqZWtcXxihBsXcusZVeAvdeTi+dH03VXvocXeC66mk49BXZcyv4f/kf6N0YkgYw0tNY0dTm0abvjOwgPTHU2Rfu4sg0v7hzx+V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=a+/HGoDk; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso6405714a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 05:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742213555; x=1742818355; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgQI7i+glIQS/JWP7XVCA4jeAmkUf5EqjBge8pBC6Ps=;
        b=a+/HGoDkxXFGLkdWZcp/Qfm2f704wVxqmRhx6DWn0ylg7W1Gu81HiAzugN5cDK115z
         qA7z7qDP6rhs4McUXcUE4wMKaXzVetLUm073SCO58Pk/NT5AsD/W1TsGPWGBrVr+aNTB
         lG0R3x6nTvQU3dvvsr7ZmGvi7CXRmPEwabd2N0e8s3WVDVLCa3jicu9nPVc3ofJ0OrWT
         4pj1s8Hy7r8JDkW5x1sfV3kA9c/f5mM2WbwAkWu1wai1WrifMapnVCHNmjqRIf/pDzcS
         AvFP4aPVJeA3GoCRYBkOiMHhAqd/KUWNB+jRe0e6jU4xzOZFE70kQFo/0fji9p0BIlPE
         WCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213555; x=1742818355;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XgQI7i+glIQS/JWP7XVCA4jeAmkUf5EqjBge8pBC6Ps=;
        b=g8dh3XXGfYk5lHrvJ39QXAgTnfpcyTQdOis67tWvRO3346ER+qJB4I/73E4mvQD/iA
         F4icx6l0hI2NJKUcPlXKdaE01nCcPAF3Q76TOKzBaUzmu2rPHfPk70t3DJXmC0oNEZFE
         o8aVaU3DCpAplGpPu7niibbINmEDM3C5iKTIwqvsL6oUUGFt+I3x9R5jnDBqyhKXx02W
         gkPtOm/y2gJLim6vbbrOdMbWIPJAnmCRKbBRnIYTYX5mtNFWb7iaEBl/BgG+WiTxxJha
         dWNgkb31x6ojzTkZoHecGi+YRGMKQBxOhzX0STwxxDsRUyoktdCtxO1HR35EyzCpuKpL
         Khiw==
X-Forwarded-Encrypted: i=1; AJvYcCW74p13MfVcoPXhSYqFRXs+KuH5Q7cF7pcyFOU404eMgSECVFv8PsrSLOdeR7AZX0Fa4+GEvQIn2paThfeP@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7ocIA4EaTxO6Zj0ejIPjDEb7pWGGOvGrDu5D3ZpUOAqmvTTE
	u6mGbE8ReKEtdQVRrEEy/jWEr6L+/ANsGXCiu45/4405E6XV4sE4mf/BWX9qfuo=
X-Gm-Gg: ASbGnct2a4onfgPUZ+Y2uMimjLKcAqcdeSolSq9E3Nxyp9vj8a8m77ay0/V6lzz1pa6
	tMbQwoWlO/oLqlxhWvyp7M3sNsnnEotwJXdnBgsf1xXGjfK7nNgD9dj6lTmOdi1PwshuSTqj79v
	Dyg9D10nehlDW67yJt+NQT/AvHqQ3NOvpQoJQ6WAHdNBHmAU18mt1PA5Wb/wzWaVWENri0dfzsw
	8HxgA7/bUAuzFounaiyTfNXa+3e7eCLoaa68Tpi4vnaMYU+ntaKDYw/H5iv5q0OIavSBtbZtiJy
	liL/QclQfdXvxdtGnuHJQktiPm0Z3It8z73zl5IhixPbbbj/wrSQkyXmGNwfB6xnxI9syl5BCbv
	RV7uSrrubnFts8w==
X-Google-Smtp-Source: AGHT+IGkBMivzQV4mRjAFxSl5hkbzmyy3jCErKcn7Cl5GDE/j11zVkAXm1oq3i12rfExH1BTJTH/vg==
X-Received: by 2002:a05:6402:518a:b0:5e5:3643:c8b5 with SMTP id 4fb4d7f45d1cf-5e8a080aa09mr12579753a12.30.1742213554535;
        Mon, 17 Mar 2025 05:12:34 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b0232sm6033780a12.38.2025.03.17.05.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 13:12:33 +0100
Message-Id: <D8IJ5TEHREW1.2FK88ACT1JPYQ@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
 <cddcd851-5e8c-4202-baad-e56a09d5775a@oss.qualcomm.com>
In-Reply-To: <cddcd851-5e8c-4202-baad-e56a09d5775a@oss.qualcomm.com>

Hi Konrad,

On Fri Mar 14, 2025 at 11:08 PM CET, Konrad Dybcio wrote:
> On 3/14/25 10:17 AM, Luca Weiss wrote:
>> UFS host controller, when scaling gears, should choose appropriate
>> performance state of RPMh power domain controller along with clock
>> frequency. So let's add the OPP table support to specify both clock
>> frequency and RPMh performance states replacing the old "freq-table-hz"
>> property.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> [...]
>
>> +
>> +			ufs_opp_table: opp-table {
>> +				compatible =3D "operating-points-v2";
>> +
>> +				opp-50000000 {
>> +					opp-hz =3D /bits/ 64 <50000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <37500000>,
>
> This rate on this clk requires opp_svs (not low_svs)

Not sure where you're seeing this?

This is from my msm-4.19 tree:

gcc_ufs_phy_axi_clk_src:
    .rate_max =3D (unsigned long[VDD_NUM]) { [VDD_LOWER] =3D 50000000,
gcc_ufs_phy_unipro_core_clk_src:
    .rate_max =3D (unsigned long[VDD_NUM]) { [VDD_LOWER] =3D 37500000,
gcc_ufs_phy_ice_core_clk_src:
    .rate_max =3D (unsigned long[VDD_NUM]) { [VDD_LOWER] =3D 75000000,

[VDD_LOWER] =3D RPMH_REGULATOR_LEVEL_LOW_SVS,

My intepretation for this is we need low_svs?

Regards
Luca

>
> with that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad


