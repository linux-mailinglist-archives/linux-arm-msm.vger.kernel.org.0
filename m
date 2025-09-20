Return-Path: <linux-arm-msm+bounces-74291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E804B8CE63
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 20:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19FC1B2368B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 18:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3268C23A9BD;
	Sat, 20 Sep 2025 18:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2opIBqe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD551F4297
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 18:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758391369; cv=none; b=nIxpfKSL3MWk/uRQXWMt1kwNbahQ8iJTLjfGpPPQsLr2nUafWwJ9cskaU02Q3aLzlcgNMIo3aXnhh3L7disOX5sf9wVg8LUn/jceJhryQBHWop0ApDbu0E1RQP4xBSmPlbqtj1ndc8GWzSX+o9b2GUTYTtU4PuqifmAYTk1Fprs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758391369; c=relaxed/simple;
	bh=vNzlM1+uldR3GR03lrv5Hb+eyrK5yBBZ4NCVSo6sEE8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=EOIv+vNw9Nf7OX2eiXWyodDw9Epyirtoyg2MVLvfjPUDiILXgtxjtrqflEuxBulV+a/rLTt57CAxwEJ3bnbQEY3ibNWh1lM2rf6JjYS8jxxN+MAliDuy4xJTEW0wjaCWYd9Otd4IvZhms9yRwLvLpuDbeTC0djgshv5XJtPKpfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2opIBqe; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f2a62e44dso179558b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 11:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758391367; x=1758996167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kK6gdymZIwc9poT/IoegtWOD+uKcHWv6G1pOTAAibsg=;
        b=O2opIBqexJ5hobnYZm7dDmx08mTJrXkmAwIt9X0Q8WhXukCgPX6iWdYNbGMk+yn3le
         pZop7OO7kKCtggDnqOFnZPKjmv80X2fN+7PQKObfAycHPe9n6OSmT/L2OsNBrUGBo1yq
         G27HryeOmPITwB3qTwfNt04e8fOPhNd5N0U1WHD4n3j1B0boh+LWLXTcPRtD794DviO6
         33LMEG0DYoK180EMzzbOmQPQ6AvGUaVMZtTbJ2BA0sBPBRAbv+8PZeUxuhm2tFIiQdQe
         rdK1ecsQM2hvxPzfJ012Bg3uLSxD/SF7LwaHF/twMVZ+MrI9vlkkg13LcQe51ZjNvPVC
         eXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758391367; x=1758996167;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kK6gdymZIwc9poT/IoegtWOD+uKcHWv6G1pOTAAibsg=;
        b=OFnZzH3N6ECQtPafQNvGofwtQQbtG2Yqabe5tiGJ1wy+EU2eK1VEdL+Bdp9aSimfTO
         D80a6PzyvixXD/TWhweHF65/XGA+3VTNJm38cNoG0johbzkjzAWrxIyZvnN+uUgSZRiE
         7TE4cBrQbzxbsNEBj9FLM2Ct0A1vM1a9Oohow0xtgCfWu477UQXIQVDjRu3yydpV2YBU
         22Jm7EoHJrQxKfgLPrVYTLSMj4QsTxuaDL3QQMyz8qKcMuxplrhdqT4OEfS5pExCg+U7
         YVD8Kp5UCBhY1Zh4ojfANkBPPfvKXDlOHXx4o3l83CVxJaHIY82AmYNUUsyfeT2yOAO3
         z+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe8l3Gg5u9kC4z4mTYHfC1/FYnC/G60cW0NOnx7mTWkvSFQtcTrv15k5+8Dhmx4jEkVhTO3YQN7ErigxXg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4XVxpaq6A4XNLHqIBz3CXWhnwCtV0q54Q5d8IxLrqAiCzPchj
	gHkYZu3wR+pLpayW9S7W+2B0uQmD2kTsg6MkZDYhuH4OzJIVOxfq8szZ
X-Gm-Gg: ASbGncsePQtrX5ksj1xlKPe1GEzamiA0MCJqGhMg2HLhfH0H2tYXwbv4FxdMM97sD57
	hYumALYto3701i9BzbLO0OP1O3hy0Xt2baO/GxVN7tSa11bQlgONfj2p7pUXxi6nrFPGe7us8sg
	rgQqBCiwvLwsZSkgp2AWQCIV3eEaIKa7HWdsU2n16aVs8+8P4tMvZz2SpIMtKz1jmJ9r4lIRA0l
	YO7wwa+vYeAQNqMus1a4D3sU+hKFdVi6LSJVpnNx1fhZOBNvyU9VwTQe5GUx8voOV+yOp8bH/Rp
	BhxrOPCSzEHZVJoNbf9v4f7yGHwx5M7ZLEWh2yfhgldxwFuc/9xco6dxSP1Yj8YtLmVAaL+Bh/q
	3q18p2ThZkMSEpdIaXO4VjPUof+ZOAWNm
X-Google-Smtp-Source: AGHT+IFp6eWlmg8WSXqzKC/ZwpZ4bfPJ5EFKDbuMmDmSFcEI8h/Ve/sdTRdeV0vJtSBr/ZKe/FrXJw==
X-Received: by 2002:a05:6a20:2449:b0:24e:e270:2f5d with SMTP id adf61e73a8af0-29271269db9mr11740772637.43.1758391366780;
        Sat, 20 Sep 2025 11:02:46 -0700 (PDT)
Received: from ehlo.thunderbird.net ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5541f0374csm251586a12.49.2025.09.20.11.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Sep 2025 11:02:46 -0700 (PDT)
Date: Sat, 20 Sep 2025 15:02:42 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: r0q: add gpio keys
User-Agent: Thunderbird for Android
In-Reply-To: <qiiuezocvxvj5bhrr77v6o2amaaaepdx54pqoewvhtnxce5ccz@g7bhkrb6a4pd>
References: <20250920014637.38175-1-ghatto404@gmail.com> <20250920014637.38175-2-ghatto404@gmail.com> <qiiuezocvxvj5bhrr77v6o2amaaaepdx54pqoewvhtnxce5ccz@g7bhkrb6a4pd>
Message-ID: <5436E420-E459-4E47-9752-EF80F550FA6F@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 20, 2025 12:45:27 PM GMT-03:00, Dmitry Baryshkov <dmitry=2Eba=
ryshkov@oss=2Equalcomm=2Ecom> wrote:
>On Sat, Sep 20, 2025 at 01:46:33AM +0000, Eric Gon=C3=A7alves wrote:
>> Add GPIO keys support to Samsung Galaxy S22 (r0q)=2E
>>=20
>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/boot/dts/qcom/sm8450-samsung-r0q=2Edts      | 53 +++++++++++=
++++----
>>  1 file changed, 44 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts b/arch/a=
rm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> index 880d74ae6032=2E=2E70e953824996 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q=2Edts
>> @@ -2,11 +2,12 @@
>> =20
>>  /dts-v1/;
>> =20
>> +#include <dt-bindings/input/linux-event-codes=2Eh>
>>  #include <dt-bindings/regulator/qcom,rpmh-regulator=2Eh>
>> -
>>  #include "sm8450=2Edtsi"
>>  #include "pm8350=2Edtsi"
>>  #include "pm8350c=2Edtsi"
>> +#include "pmk8350=2Edtsi"
>> =20
>>  / {
>>  	model =3D "Samsung Galaxy S22 5G";
>> @@ -28,13 +29,19 @@ framebuffer: framebuffer@b8000000 {
>>  		};
>>  	};
>> =20
>> -	vph_pwr: regulator-vph-pwr {
>> -		compatible =3D "regulator-fixed";
>> -		regulator-name =3D "vph_pwr";
>> -		regulator-min-microvolt =3D <3700000>;
>> -		regulator-max-microvolt =3D <3700000>;
>> -		regulator-always-on;
>> -		regulator-boot-on;
>
>Please don't mix up refactorings and new features=2E Split this patch int=
o
>several=2E
The patch only added gpio-keys node and pon_resin,
pon_pwrkey=2E Do you mean I have to split each button
into separate patches?
>
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +		autorepeat;
>> +
>> +		pinctrl-0 =3D <&vol_up_n>;
>> +		pinctrl-names =3D "default";
>> +
>> +		key-vol-up {
>> +			label =3D "Volume Up";
>> +			linux,code =3D <KEY_VOLUMEUP>;
>> +			gpios =3D <&pm8350_gpios 6 GPIO_ACTIVE_LOW>;
>> +			debounce-interval =3D <15>;
>> +		};
>>  	};
>> =20
>>  	reserved-memory {
>> @@ -47,6 +54,15 @@ splash-region@b8000000 {
>>  			no-map;
>>  		};
>>  	};
>> +
>> +	vph_pwr: regulator-vph-pwr {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "vph_pwr";
>> +		regulator-min-microvolt =3D <3700000>;
>> +		regulator-max-microvolt =3D <3700000>;
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>>  };
>> =20
>>  &apps_rsc {
>> @@ -119,8 +135,27 @@ vreg_l1c_1p8: ldo1 {
>>  	};
>>  };
>> =20
>> +&pm8350_gpios {
>> +	vol_up_n: vol-up-n-state {
>> +		pins =3D "gpio6";
>> +		function =3D "normal";
>> +		power-source =3D <1>;
>> +		input-enable;
>> +	};
>> +};
>> +
>> +&pon_pwrkey {
>> +	status =3D "okay";
>> +};
>> +
>> +&pon_resin {
>> +	linux,code =3D <KEY_VOLUMEDOWN>;
>> +
>> +	status =3D "okay";
>> +};
>> +
>>  &tlmm {
>> -	gpio-reserved-ranges =3D <36 4>; /* SPI (not linked to anything) */
>> +	gpio-reserved-ranges =3D <36 4>; /* SPI (Unused) */
>>  };
>> =20
>>  &usb_1 {
>> --=20
>> 2=2E51=2E0
>>=20
>
Resend because I forgot to CC the mailing lists

