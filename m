Return-Path: <linux-arm-msm+bounces-75204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8689BA1A4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E28BA3AB212
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E44326D58;
	Thu, 25 Sep 2025 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loJ9p18a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD482322A25
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836237; cv=none; b=FjDVjP7Iqg0Pn2ujg1YLkGCSi79wo5LnRSkwGN2vVyrjWXlM709u+8wFPnU7btX7960eniUxgJQyKkoWaEckbh79Llxcy3M/bTu1/QOKfYKbU3VJ+tqP0Inm267kXtwKWdsxq2mqQk/WHQ1A8boFp778nt063+HvHC9PFNqzqrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836237; c=relaxed/simple;
	bh=oiFqoqHk6oiK3EhR2RmhmHaGHl8SHAITHe5ML5JyiAA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=P48pN1X/fKTw6uGxYqiYXFm/hBbAje6SnS0EQPQwjUmnqUVxFRLRmUzhqeJrn6P8zb77sc14aHQUF2lGx49xyWOQGY2LU9lGBWjC3KWUtDqSYYWZOF/JjRoDgXRnGVzgQgcLXu4dLzEFRnhksEh447dKjBVdPr8/xxna4CP6XWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loJ9p18a; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77f2077d1c8so2274356b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758836234; x=1759441034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ghwquq+RvN0qSXM9rO+Y15QmP2spebCjgQIKEAaSbhI=;
        b=loJ9p18aPpQXfKanpNI7u6+oOGgsUgKEyQcqHv6QKuTullPzLjuu5Dyz6X0NWzuLPk
         u3LrtvXbTGiIuDvhcH4lbdl93lU2kNZPVxezaDZ+CyshOd424da5iTMVDwz8Wwwn53ht
         YsFOigpC8II2YW0F+bI1P55bmiqyAMJIpRQd+47j2HuuQLarnmyLbVfTGDe6V4AE7+Nm
         mjFOLynBn0zXmrAiEvsm7GbHtY9kDJ+gn/YqPLUcVU6nxb7A2ho6r0kN4aHVWF4Vya4J
         GywDrXduYdcdoy0tKyiHKp3P2YUUaSJf1kHf7zXisXNGuuLSRYRm67FuYasNSquCmq8b
         /tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758836234; x=1759441034;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ghwquq+RvN0qSXM9rO+Y15QmP2spebCjgQIKEAaSbhI=;
        b=TIHfpCqQ9jYC2P44VhORIEJeuWqIR69SuycQKsHaNH9sFhaf4vYWMXzTsaHh+5a5x5
         9OVLpivWZbhIp2/hKqvuZEBRk8OnzEVikmZF7iTGnorCOwFC11IitTjIpFd2Jx2G5suW
         QO8QxcNdtoV5dDMr38GTyCJq5P5pgk+RY5r42yRToyev79uvUnOHm+/Ou6ZUHeNxVnDo
         oFEYMR32SRdoLZmLjrTTZ149+kBeC8R8UNSaj5lNGBsJ4ebXa/wSTohurLxTILEz/3IP
         SostMTNhuywFZn7/qFezbT+3zh6clHsuQ7GCn1LFYrYF/AeIleneFY1b7EJOB3mZ+12A
         HwMA==
X-Forwarded-Encrypted: i=1; AJvYcCVRc7dsyhSJUrjer7JChCGY3g2eLsaiuQhhxPxWLeiOhkWjnlNmEqgzEio68VnakVhwvSC41VZIDeIMwPGJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ESIzRLZSetcsDQiAHca7zD5NBICLw/F9Olklqs0H7FGj29qJ
	MQihG2O9SXC0TPvQtaNWrAZY6aUr9nj+QG9/akfBWHZxCK0hcIhPjgEg
X-Gm-Gg: ASbGncuLYqKJUmvBCZnPbLZz/Eb0nqtAb9g669FdSkRDvs3/A4r9XbBgDVmA1oBiXd+
	tlwIVcRRYESembSO9+Bco7z3ICsTbDDo47UDDaqzOnjb6vTvatQtoG9UzRgSDcxEioiTRY0dlLS
	SNOADgG93IoScNR/NNdWTu2cNlyuPWC606AYJQ9j0RnSYHJvScbIO+nmWIXhlsis4oAYhgeSBob
	RJxRsOLKTdXWURKBj702Q2qvwCF1QaPkGYRBNSrzU3GYIVV2hqj8PmWMw+oZDfH06aH++QNh/JA
	AxR0lDCgYGo3smOiE8yKlvMYN0lPWHdL7Q4TUYtxmWokXL4MveVr06ICAb8TARe67k4qUvj6DYS
	dApG/1xMFmAackM13D35C/l3alOQwADRrsA==
X-Google-Smtp-Source: AGHT+IHWJRfO65D5XCpuQu5uFHWGJnnxtMXtMT8/HViTSHd6Ji5LIiXfV6FiFgWG2oxdyDX9OV0lCw==
X-Received: by 2002:a05:6a20:9150:b0:263:616e:b61d with SMTP id adf61e73a8af0-2e9b39b0828mr5442778637.23.1758836233810;
        Thu, 25 Sep 2025 14:37:13 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:18:161:d250:a5b8:b662:f3c3:afe5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55bd160sm2978100a12.47.2025.09.25.14.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 14:37:13 -0700 (PDT)
Date: Thu, 25 Sep 2025 18:37:09 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: r0q: enable ufs storage
User-Agent: Thunderbird for Android
In-Reply-To: <f032db60-d625-4814-a5c9-0610618b7351@oss.qualcomm.com>
References: <20250920014637.38175-1-ghatto404@gmail.com> <20250920014637.38175-6-ghatto404@gmail.com> <f032db60-d625-4814-a5c9-0610618b7351@oss.qualcomm.com>
Message-ID: <97CA26D8-2CB5-4F90-A4C8-BCD81C688F35@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 25, 2025 10:07:31 AM GMT-03:00, Konrad Dybcio <konrad=2Edybci=
o@oss=2Equalcomm=2Ecom> wrote:
>On 9/20/25 3:46 AM, Eric Gon=C3=A7alves wrote:
>> Enable UFS internal storage of the Samsung Galaxy S22=2E
>>=20
>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/boot/dts/qcom/sm8450-samsung-r0q=2Edts      | 39 +++++++++++=
++++++++
>>  1 file changed, 39 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts b/arch/a=
rm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> index c088f1acf6ea=2E=2E0a55ce952f93 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> @@ -146,6 +146,24 @@ vreg_l5b_0p88: ldo5 {
>>  			regulator-max-microvolt =3D <888000>;
>>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>>  		};
>> +
>> +		vreg_l6b_1p2: ldo6 {
>> +			regulator-min-microvolt =3D <1200000>;
>> +			regulator-max-microvolt =3D <1200000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l7b_2p5: ldo7 {
>> +			regulator-min-microvolt =3D <2504000>;
>> +			regulator-max-microvolt =3D <2504000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +
>> +		vreg_l9b_1p2: ldo9 {
>> +			regulator-min-microvolt =3D <1200000>;
>> +			regulator-max-microvolt =3D <1200000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>>  	};
>> =20
>>  	regulators-1 {
>> @@ -370,6 +388,27 @@ tsp_int_sleep: tsp_int_sleep_state {
>>  	};
>>  };
>> =20
>> +&ufs_mem_hc {
>> +	reset-gpios =3D <&tlmm 210 GPIO_ACTIVE_LOW>;
>> +
>> +	vcc-supply =3D <&vreg_l7b_2p5>;
>> +	vcc-max-microamp =3D <1100000>;
>
>because you set this, you should also set regulator-allow-set-mode and
>regulator-allowed-modes
>
>Konrad
Why is that necessary?

