Return-Path: <linux-arm-msm+bounces-74092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB49B85369
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 16:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 440CF548141
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 14:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAC3302742;
	Thu, 18 Sep 2025 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lk7TGhlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA55E30CDB1
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204908; cv=none; b=RSSCA/iuI82QtJD2HyPovlwTqJnuWAlOvcBjFg5g9aanSQxcABJtD8OcYkitA/FF3YuS0xgP/1z7sZz74V24WLzofuigAslShveWqK1/xNzytItLMXdKvOXejoAlD9VvLQKo38Ghj1Or8fJP/rVqpGoGWelYaMYRL6QcxX5W4QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204908; c=relaxed/simple;
	bh=0coe/QFA46JTNO8ZaDwBRkRFUpFZ853bhqXJwpYcdJU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NTYWWfrOiP2eWacPPLe1jed0koLP5t6FfITHahIeAU7K1etpm7MW0nrMAeq48lGkOUjTYyeYiBLHQMCXkW04O7wxjSVjpRhgyme1ZEIPYo4Ey5N7vvOWWPLua+0zQ6Qyad9++HOb5UF3qhC/RBBMqv61mRREPonyxzuGs47d318=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lk7TGhlz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4619eb18311so7011945e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758204905; x=1758809705; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+c/huWZ2XQVoB94N5MFK08nC3wxU/KugANouKkKYms=;
        b=Lk7TGhlzYn6lyGn8+tHFCIin/wZclvaCNn1jUlAL5YNc3Y3YUN5A3jSRj095h//S09
         HQWdvLaugIm80UdoTqK9u0n/sN3EfK2q9t4EIiz3nmJR1uia9594eS+C99pxPj8mdR5Z
         2deea6jyfC4SRfJtlUXjOH7pX0cAxxxf9D/zVQpUFOJRFRpRf01aGs1MORhVe4DhJuMp
         Od7kkZIRngBJ0GUMSlORi+BAfOG2l/7Rb9AZ0JFlQJA8m+ss7U/GOPzMLzsA7dvdgxVz
         RSVbMab0NrCfmQM4AZXqsJioZjAMabqRlEJDee9qTOeU33++d6wNwJeMe7/FziBna6E9
         okmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204905; x=1758809705;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u+c/huWZ2XQVoB94N5MFK08nC3wxU/KugANouKkKYms=;
        b=oOGmdpygq4YMBylZ5mLfbKOccWRK3BwnvqRdAjTNQLBk30b/tyOVhzV6MyKLwgUz1E
         KVLVL6K7dkeOjwplVa/8Ocq7zh+vuHky/BKrCGDvVzEkblYDMa99Bw0vZiMFwKKOdnSt
         EQKH+6qGDcUDkZM6Ml1UGgkS6rClyEREuD5w67Scny1SW/mA7TUOWFrLDggL6yOEIOx0
         UNkZF3O5FJIMsJwHzOvLciyFGXptA/olvZB1BQaY7zOGxr6M6aTugwaq+VJ4tFrdVXL1
         24WyppQBX6ViP02O/9wFlCNDwAJTWArV0wCPrT+pQBsMKUvv48FT+sAx4iDAvmCgOkHr
         aSaw==
X-Gm-Message-State: AOJu0YyHRHkveXHBVh27TwQfzkpH2IYQX3Z5qbtP+qsO/nE94JsrBxkh
	nojHj2g+1PYOPaSTSnTr9L35biyXDZkCV7TCSca+ghSaS4tRZh83vwJLkF3Q0tjJn2c=
X-Gm-Gg: ASbGncsI9cudvKvaTaNPivT4rjKpEvfvZT29dijBABpclpZ8oRf7DhF2CPMBFiKU6Jp
	nIwakTHPHfSEl9Y0jPcILK0xSekrZEAoNcN6sXfAEojI8dbJmAWWcT9paXgO4GMqyi5zM382jEU
	Sz7UCMK26F/Iqdm4dHBp0Nt12IniC82yDIDASgtDjxJgRNIywpNoboYuzDdIhpco0DI/cEmo1me
	OdU6UbbcbRi5ciuY70wuL9fO4HalgmIkTpBd3uReaGFBjfShHBH4D5UdXXhZTDhKAkGVQYMGrr6
	E9Ugsv+dWsHmebZATaCxpU43KPIq7QG0y0JnlUlies6PrKOlufaCXhJJJrgMtsrSp/hJzUyfcZU
	FjE3FXcfmYaF4O0IopkHotitJYqYKjsvBjdmYMFhcTrmkoMg=
X-Google-Smtp-Source: AGHT+IEYvV21OOIrM80imACv5lq+0ZHSelW3dyd44ly0+BqTeDL00+tLVvxEUiu7IKEHLLcpukn1Bw==
X-Received: by 2002:a05:600c:1385:b0:45d:d944:e763 with SMTP id 5b1f17b1804b1-462070ed655mr54250015e9.33.1758204904949;
        Thu, 18 Sep 2025 07:15:04 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e93dd85sm94618805e9.22.2025.09.18.07.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Sep 2025 15:15:01 +0100
Message-Id: <DCVZMD9HWPX0.LOKMJXTY1Y46@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio
 playback support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-5-81a87ae1503c@linaro.org>
 <58d32bd4-d854-4233-89c9-22c37bddfaa1@oss.qualcomm.com>
In-Reply-To: <58d32bd4-d854-4233-89c9-22c37bddfaa1@oss.qualcomm.com>

On Tue Mar 4, 2025 at 4:56 PM GMT, Konrad Dybcio wrote:
> On 2.03.2025 3:49 AM, Alexey Klimov wrote:
>> Add sound node and dsp-related pieces to enable HDMI+I2S audio playback
>> support on Qualcomm QR2210 RB1 board. That is the only sound output
>> supported for now.
>>=20
>> The audio playback is verified using the following commands:
>> amixer -c0 cset iface=3DMIXER,name=3D'SEC_MI2S_RX Audio Mixer MultiMedia=
1' 1
>> aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav
>>=20
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 49 +++++++++++++++++++++++++=
+++++++
>>  1 file changed, 49 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/=
dts/qcom/qrb2210-rb1.dts
>> index 7a789b41c2f1887f0c41ae24da2e2fe8915ab13c..e547537cffdbc13cfd21b8b8=
b7210b62996ff431 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
>> @@ -186,6 +186,47 @@ vph_pwr: regulator-vph-pwr {
>>  		regulator-always-on;
>>  		regulator-boot-on;
>>  	};
>> +
>> +	sound {
>> +		compatible =3D "qcom,qrb2210-rb1-sndcard", "qcom,qrb4210-rb2-sndcard"=
;
>> +		pinctrl-0 =3D <&lpi_i2s2_active>;
>> +		pinctrl-names =3D "default";
>> +		model =3D "Qualcomm-RB1-WSA8815-Speakers-DMIC0";
>> +		audio-routing =3D "MM_DL1", "MultiMedia1 Playback",
>> +				"MM_DL2", "MultiMedia2 Playback";
>> +
>> +		mm1-dai-link {
>> +			link-name =3D "MultiMedia1";
>> +
>> +			cpu {
>> +				sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
>> +			};
>> +		};
>> +
>> +		mm2-dai-link {
>> +			link-name =3D "MultiMedia2";
>> +
>> +			cpu {
>> +				sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
>> +			};
>> +		};
>> +
>> +		hdmi-i2s-dai-link {
>> +			link-name =3D "HDMI/I2S Playback";
>> +
>> +			cpu {
>> +				sound-dai =3D <&q6afedai SECONDARY_MI2S_RX>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai =3D <&q6routing>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai =3D <&lt9611_codec 0>;
>> +			};
>
> "codec" < "cpu" < "platform"
>
> with that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Yes, you're right. I need to sort it for the next version. Thanks.

Best regards,
Alexey

