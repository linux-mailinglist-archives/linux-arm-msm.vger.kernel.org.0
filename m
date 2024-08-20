Return-Path: <linux-arm-msm+bounces-29083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D74958311
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0335285D6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 09:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF4318C03E;
	Tue, 20 Aug 2024 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZXmPzHU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B33918B496;
	Tue, 20 Aug 2024 09:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146988; cv=none; b=TDCDOR896HrvcC3k//fKQPC6RRDz+/xjz7iVDH3U+9aHufp7Dyz2GU5hm4d83xYqRnpfXjnBa+SIkjydbKF4CIZQVmq22No2im6z7mkH5EXJhKbYFkcS2qgNmj2Z54Hsgvqeaa7YhUdeizILTvzowMeWP2IEZEkBG8hIkRWj9/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146988; c=relaxed/simple;
	bh=h8yl/bm1b7kGTRT5b2grebCJdkKQrrmEhi2H+FF1qog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HibnrkyOzSto0Tb9C6sCe1CDubvA44QTIipPisG0BBnjLdXgdf/JbkM1AukivNrZR769PcE48dbClsSAdyW/oCR/uTKVoZy603zcLZNDxiizNpDoT6sxFov7HYNYSfaTus2CzQ4nOoC9ce2qj1YDiJqmj61F/3zxAM7W1D35CWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZXmPzHU; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso640210566b.2;
        Tue, 20 Aug 2024 02:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724146985; x=1724751785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HB9GJpO2A9Zu27iG4GJBn2lNd3c+yJqVBgrLVTv/JVI=;
        b=hZXmPzHUwrMYtnNdGVWMzYuTXC2+ldjFWhxwOWqkGZr+ripL2W41O7z7AuX3RMy3qq
         BGKHRz3YUBTCJyEQArHyHecto1LKyKD631JKrrTuhEpR8jrEvZi+9hxc8vTSxtgKnI6w
         M4v+t0q0UFqnc2CavEbNcOIrjjUANAC7DpN75I/LIGnoebKuMuGBta9nlwiK/ZxXSCzc
         nW1W3ezd2YAsOa6XWdnRzDUyy93rpGxORRYiiKjEonaSaPJt3SkruDOu7vuBYiAmuuxg
         B63w6pKoJQlGT9tJW0pAuWjklqIystn9H2cJgpYxoIWxkKfGgZHiBg4D4ALWwNnnP0LP
         1kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146985; x=1724751785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HB9GJpO2A9Zu27iG4GJBn2lNd3c+yJqVBgrLVTv/JVI=;
        b=X38EAWAxvo08vsIqwy04T24lSo5bMo7IuzC8gfELBsCAwgM75wJL46v2lMq62YngkN
         U2RjSyC9YK98SR5kNOfPrUq5l9NxTwWl4UUu7qLWXhDEBrV3ivhDxzU6OoRvYZZyaohF
         YoHLpxf4i8E/woYPQ/aXrf1I+ySp1rD2Gka2nSUUmJRRvC9pZapIEiBIcAr4QMGldBl5
         kPH6y4ZweoEFjTa8t+QVUbGCwMl0mXC3uqzoDvX110ZrY4yJD6SBfSdKKR+0ArM3THtW
         BT1Ahf+OZFVuNm5/yrq1sw2vD+wiuBWGcM7PzUvjaEJrOMzm1ReZT9ERzXP0chwgcptV
         SiDg==
X-Forwarded-Encrypted: i=1; AJvYcCXEViCUgNwjaDSbECzJUdxULLpb0xln1sLWTR/LCC3mYZ6fklqjZd7FifdS5hFLcPMgbpTl5ow8aIlqTwEGPIVJbWeZucMMqmeZOB0mIlCO1eoS5hIyVqNNBGgk5T67EcOeE9utVKc9XK09DgMbZlKQH1j9hC8yVVP2IJbt9H8byxA44dyxfWRq0yLYmaqQ6gP+5ljFXBL9mO+8/pQPiciHlH5PvQ==
X-Gm-Message-State: AOJu0YwMhb4dkkOYeHy/KQPXc++kPoVY7G0uci2UZSNiFt5wwYfQmL0i
	KlqwG+QCvZPPUdHT0iJ6Mt6UbSHE/qPgtAGMvq2N3VYzOJAT10tx
X-Google-Smtp-Source: AGHT+IFPycyN8twdBzjqzi9yYN6HmGfXTYQrId5E5aQm0wwJzJHD7A8ue3GOzlLt4gOz73IDq0PTfw==
X-Received: by 2002:a17:907:d862:b0:a7a:b781:60ed with SMTP id a640c23a62f3a-a839292f71fmr939833766b.17.1724146984784;
        Tue, 20 Aug 2024 02:43:04 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396ce0asm737786466b.206.2024.08.20.02.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 02:43:04 -0700 (PDT)
Message-ID: <05d2e44c-fa39-4622-ac4f-da9da2f02535@gmail.com>
Date: Tue, 20 Aug 2024 11:43:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ASoC: msm8916-wcd-analog: add lineout output
To: Adam Skladowski <a39.skl@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-8-163f23c3a28d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-8-163f23c3a28d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2024 5:25 PM, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add descriptions and controls to toggle lineout output
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/codecs/msm8916-wcd-analog.c | 64 +++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
> index b9325290c28d..38949556f7d9 100644
> --- a/sound/soc/codecs/msm8916-wcd-analog.c
> +++ b/sound/soc/codecs/msm8916-wcd-analog.c
> @@ -233,6 +233,8 @@
>  #define RX_EAR_CTL_PA_SEL			BIT(7)
>  
>  #define CDC_A_RX_EAR_STATUS		(0xf1A1)
> +#define CDC_A_RX_LO_DAC_CTL		(0xf1AC)
> +#define CDC_A_RX_LO_EN_CTL		(0xf1AD)
>  
>  #define CDC_A_SPKR_DAC_CTL		(0xf1B0)
>  #define SPKR_DAC_CTL_DAC_RESET_MASK	BIT(4)
> @@ -327,6 +329,8 @@ static const struct soc_enum hph_enum = SOC_ENUM_SINGLE_VIRT(
>  static const struct snd_kcontrol_new ear_mux = SOC_DAPM_ENUM("EAR_S", hph_enum);
>  static const struct snd_kcontrol_new hphl_mux = SOC_DAPM_ENUM("HPHL", hph_enum);
>  static const struct snd_kcontrol_new hphr_mux = SOC_DAPM_ENUM("HPHR", hph_enum);
> +static const struct snd_kcontrol_new lineout_mux = SOC_DAPM_ENUM("LINEOUT",
> +								 hph_enum);
>  
>  /* ADC2 MUX */
>  static const struct soc_enum adc2_enum = SOC_ENUM_SINGLE_VIRT(
> @@ -630,6 +634,46 @@ static int pm8916_wcd_analog_enable_adc(struct snd_soc_dapm_widget *w,
>  	return 0;
>  }
>  
> +static int pm8916_wcd_analog_enable_lineout_dac(struct snd_soc_dapm_widget *w,
> +					 struct snd_kcontrol *kcontrol,
> +					 int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		snd_soc_component_update_bits(component, CDC_A_RX_LO_EN_CTL,
> +				0x20, 0x20);

Using BIT(n) here would be nicer, but this looks reasonable otherwise

Konrad

