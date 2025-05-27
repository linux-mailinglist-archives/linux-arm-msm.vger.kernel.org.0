Return-Path: <linux-arm-msm+bounces-59571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0020AC5267
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 17:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1E9A17DE93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5983727C17E;
	Tue, 27 May 2025 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9+bMXgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977B227B4F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748361366; cv=none; b=aOiclr57n3u9YJyAFqDstKrScK2+bpNQ0qfrQ9oOFsQ0Ypw4vP/ft8qzvAmypr23j9fCG4uzEYG7umawGuv95GR4NtiA9twfFsX+mpKhJG43U5jUrHXtwiv+117cCr51qHG9NApa6bhT4qOhND5yiFZu4Qdkq0UtsAvxM3Ou/v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748361366; c=relaxed/simple;
	bh=1EN/qo7phDn1lEOJKo1bEU9nZpbFRZxjY4LQ8qzGqFI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oBXuAO8IS7rAES2Dz2vpsOaSRK2BdRaMd6AOlbK9Azqla7nAcbKP5yJej9oWzfS4JCeB3rKUiYQ6SNJBA1GueFRgbPl/J9uAnrWuWdbPyKB9IFvxhFBYQXWlR8ECU+OwenrT0gNIon+d08Uf7yF3huPGME08BveFd95GD9rurnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9+bMXgB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso27798985e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 08:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748361361; x=1748966161; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUOHpXno4FKjbaz+Vq7mO6g3BDL4JOg348p7rmPIkO0=;
        b=D9+bMXgBs7Whru0LXz2r8gO7XmJknG9G4OyDwi7ccJ1O7tl45N6R2SM7BXlixt0hbN
         p+wdfVF4mcWYrxKOqKhvj5QneCwW0HGgbkSstk3ZSOqrISIK3XRYzvLmmnzRQcbjjRHH
         roaC8DMpMmT2XxdheJluYHIFNAblObzopbfDiKrdzVWHIiWy5kg4klQ/FvzPd7IprvWV
         s2anymuNGOFM8TWZP+3Tj9DyWDwW26vmtZaLmJotryTT3NJunu2hHKQ+jEqerXwKSf8o
         Tkr6cB1LTmEUnzw3ZhBFOi+plBdu6UPT4yuFFT53IWUA0E191w2W7eIfDOyxRRBEzWMR
         B2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748361361; x=1748966161;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WUOHpXno4FKjbaz+Vq7mO6g3BDL4JOg348p7rmPIkO0=;
        b=DZ6N8kapVC504tcoHGlrhhVr2+m3USV9dub4LYrgnS674HsUe65kfEQ/Pi6gQzwxP/
         Nz7OMg5UU4Xan3NZr6aVDVv7n+cUTlcfwJXP2xTEnPqwD98iTmXnI46IMUcY0f33b+sE
         DtOOt/+z9tQzeHezOFXRuOvuyiHkRSBh0idV3FhSVw232NyFpyAq330FnIGQDSFVCei2
         f5zSS+8rbqIO5yjKodCLE9Ew9udGt177BnB/MJJuIQ8twlLy55XzCdhhskS6N831mIsm
         cdVzbMn/YQxsRZjpGa/Uawq8kFdbm3eWnBeAHRQ+FY4z1FeML9VoC5uF1YFWY68f4x8P
         MLAg==
X-Forwarded-Encrypted: i=1; AJvYcCXg8e5JjQhfWcEaBIJZJgGatKrW9T+Mi59KMTo4VRZCoTzYdEtlEmg0T6WMcf/SUNljjsdXyfvZH7YXnqN1@vger.kernel.org
X-Gm-Message-State: AOJu0YybuOymWEN7zIgmNfOHVkzFWtxxXdeSQuKM8/cOj3v+mjuGYuOy
	nQldS602wZ9Ujgd2dhawct0cyTfypO5J7wmHTqKe9qwSCJZE+v6ixGFJLeGu7PK2K5c=
X-Gm-Gg: ASbGncsf2CCj3iVPaaqkBakQl7/HzrTcpJCGdw6CMOIqLziVjIYKKXj1sJxpEr0/LaS
	9oKF9MN4DtmmbcU/iAe+BCzntBgxPLOXKv9lFSJ2hTdamnsQHuSS3oY5vpCkA3KjisuqMzpRh4w
	FtjBAkAIXdWDVIqXivb1JpCqDNhxZ1cmhrd9v+3GB9Yy9VLcYtMdwfBDrIdbPNiA/IREr/rwJHG
	2zeGlxLluNtnhWZJs+BATY54v98Y7hZhnfYorcddWJIWGurivSeNeBoTdJYo9kvWalfOelHOKyp
	tQkgId4kq6ZtIws0ff9WYHwtnRt0zaXiKgQTFPrPMEIFvLTEau7raqaH3XpGfRVhc/Ql
X-Google-Smtp-Source: AGHT+IGWpBubqNiiMJO9C0pBAekzBnLwiPK9uY689/6fUTlai3/xs++Qb/ljE1+USh/yGxcE4+gWhA==
X-Received: by 2002:a05:600c:6296:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-44c91ad6b46mr120335515e9.8.1748361360729;
        Tue, 27 May 2025 08:56:00 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0ab8sm270595235e9.13.2025.05.27.08.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 08:55:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 16:55:59 +0100
Message-Id: <DA72DKCKVX7T.269HYJZNIABOB@linaro.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
 <c7d5dbab-0a51-4239-811e-dc68cac18887@oss.qualcomm.com>
In-Reply-To: <c7d5dbab-0a51-4239-811e-dc68cac18887@oss.qualcomm.com>

On Thu May 22, 2025 at 7:13 PM BST, Konrad Dybcio wrote:
> On 5/22/25 7:41 PM, Alexey Klimov wrote:
>> One WSA881X amplifier is connected on QRB4210 RB2 board
>> hence only mono speaker is supported. This amplifier is set
>> to work in analog mode only. Also add required powerdown
>> pin/gpio.
>>=20
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 26 +++++++++++++++++++++++++=
+
>>  1 file changed, 26 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/=
dts/qcom/qrb4210-rb2.dts
>> index 6bce63720cfffd8e0e619937fb1f365cbbbcb283..4b878e585227ee6b3b362108=
be96aad99acba21d 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> @@ -270,6 +270,24 @@ zap-shader {
>>  	};
>>  };
>> =20
>> +&i2c1 {
>> +	clock-frequency =3D <400000>;
>> +	status =3D "okay";
>> +
>> +	wsa881x: amplifier@f {
>> +		compatible =3D "qcom,wsa8815";
>> +		reg =3D <0x0f>;
>> +		pinctrl-0 =3D <&wsa_en_active>;
>> +		pinctrl-names =3D "default";
>> +		clocks =3D <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_N=
O>;
>> +		powerdown-gpios =3D <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
>> +		mclk-gpios =3D <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
>> +		sound-name-prefix =3D "SpkrMono";
>> +		#sound-dai-cells =3D <0>;
>> +		#thermal-sensor-cells =3D <0>;
>> +	};
>> +};
>> +
>>  &i2c2_gpio {
>>  	clock-frequency =3D <400000>;
>>  	status =3D "okay";
>> @@ -736,6 +754,14 @@ wcd_reset_n: wcd-reset-n-state {
>>  		drive-strength =3D <16>;
>>  		output-high;
>>  	};
>> +
>> +	wsa_en_active: wsa-en-active-state {
>> +		pins =3D "gpio106";
>
> Are there two separate enable pins? Or is the powerdown-gpio something
> else?

No, should be only one. I think 106 on tlmm is wired into 16 on lpass tlmm.
We need to assign gpio function to such pins, aren't we?

Best regards,
Alexey


