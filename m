Return-Path: <linux-arm-msm+bounces-73628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 274A6B58CAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 06:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB14716426A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 04:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8BF2C08CF;
	Tue, 16 Sep 2025 04:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/kE44zI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2376242D6F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757995983; cv=none; b=MflvQRQ5wwnGeef1lNOh8NICuAdc8e0Iy4phXeMQ0X2YsHpmkZ71omyrzJ75j/1sa+r+WpBv0PEL0LfUuI4YutPhJyijKSG7591QgPaixXFhbcoU5V1y++WymKVJHrLbu87FQ2drCcyj7PzryWeCuMfqN1+Q7oon0wx9Dys0k3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757995983; c=relaxed/simple;
	bh=/eaFqfjS5AzkFvGaHuw5HluS1OrzKBGI4k7j6gBXfz0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=QVavAw7ELS/Kqk/RUE5AZxFSyhMbFkRmArMSYcAMGwHBdAOL35NKO3a8ema3/zeBckLEZta1oeLbPYgLVALYC7s2DMWypzGMTKVH9E46hXb06T0KG4ld5IMj09yH6k0t3M4Aa/sELfqnW8gRHQ+NnIDJQXsHXEZGds+XbHnHNaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/kE44zI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ec4d6ba12eso297283f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 21:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757995980; x=1758600780; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyuXm37795WaH2EuOl7F11aAWWFTKDHYiHZFqXZZVVQ=;
        b=j/kE44zI8RWIE9ao7NeiJRNOy3l0iZQnc5oCa6t/Z1emESLXPJi2wwlnpwd5GrWI44
         IRVtyxRDDegOZuXZK6b+GHwnxEz2nMxbiG79BZ4XTnh6M5Fdl+g+H4LNQf029mUuXjcS
         dHUcFPLgUFGvWATA7Rv2oY1uTCvFyTDR8GQPav+Y8PFRTWMpyD5azmgCI6sTuNfknCGB
         8/tILbnharDxSs/72HG+TB5VznW0tYqmTlYZ+Uyqcyro2/cJHmuklP95lyHbpnUYcc/P
         J3j2IZx7qLCXx5gKgCgyNdUop14YxXaC+McCoWQbR6tNOWk2urK6ZLcpTMjiul0e00In
         lCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757995980; x=1758600780;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OyuXm37795WaH2EuOl7F11aAWWFTKDHYiHZFqXZZVVQ=;
        b=gqSfPNYG/YNupg2ToAxFpwd5nAf9XMUbXx97w2n+B59nnoqIuIJ3HFXRTJ5J/DdZxW
         Hpp0b2VCX6TuJQ0HhhoEnGuALFVGOpfudIqpiBRY2Rajmwt3xRs2XSwPBZFq50+Eme4x
         kRbnEhV+WkCqvfM1KfXcdDP9T9y7y6pgqCsYvG9FkJvhJ5EHN3l4IgqUV5YIkMeNCoyX
         7tsfmIwcsk8rRXJOScbdzr/xeXEhDmxcdebr6orJ0xVxk7w9dpej8eBIMn093PpH73es
         90VuKoi+9VHSEKPe5HT18nEVSRzgM/ytSjxTMqYTcb1+98T7ly75MXkFw/lD7HqFIY5z
         865g==
X-Forwarded-Encrypted: i=1; AJvYcCWuyyB8ZdhdKU+zwMhyjZAMhhttpO0d49S2n8AAV4gI4JEtWyoHe0mhnvLpw5SKteDoug55gZBnIxSwETXr@vger.kernel.org
X-Gm-Message-State: AOJu0YxRnZYH089ac01nmaiyks0DCH/pPiILYcEjldPI3k+udA2b3F7Q
	lB9vyHqkCWb/P2kXrZHMIYTYddbvBLv+gMmklt5+aqhJI3mLAfyWPsFASrGH2VPm0OU=
X-Gm-Gg: ASbGncvmmwvfEn04KGotWxchX2Gkdsxhy+OrMEKo6yhbjSwwH5MVuP08ZhuPbIQj6zp
	cBDwPSjJ55oVvx+vRjagJSjcB3yA+R25NDkvELHmFgjHkSpUIavjN+rY0gbVphp8OxVgATlV+Lp
	9UDTLF6AH718ZfJEOkb8+caN4xKSOnG2ib6DqcPdn4UIme45+Wrx9WtfYSU6JN9y3HrRNOYo4YQ
	TNsuHSTOzn1ft1BH4HqlZ94Ubvlcwo+oyjTcy6MlWYHEnCdj0+0RBxSLlLMCPP1PblueDeh/LHD
	G/7WE0Uwuui+pZlYNK7hax6YG06lZwnD6EGGPHky/nl0TTAZh7YA4bnyuVY/yv6yJIa9950ynTc
	TOUH8Ahc7O56xc8NXsDuSq1WCDAjB5Wxdu0Rqs93UQ6rLBURAdJ31B2unOA==
X-Google-Smtp-Source: AGHT+IGouhffCRGm0t7KfqX7cj13uvy8MWvPOWCTw8LtRQUH3MFmSAZ44+x0vNiLzpzhIJVCLJAB5w==
X-Received: by 2002:a05:6000:1865:b0:3eb:9447:b97a with SMTP id ffacd0b85a97d-3eb9447bb52mr3933877f8f.54.1757995980264;
        Mon, 15 Sep 2025 21:13:00 -0700 (PDT)
Received: from localhost (054722ac.skybroadband.com. [5.71.34.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7d369ea3bsm14796545f8f.0.2025.09.15.21.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 21:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 05:12:57 +0100
Message-Id: <DCTXKAW0DYZW.1P7UG60C8GRO4@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@oss.qualcomm.com>,
 <prasad.kumpatla@oss.qualcomm.com>, <ajay.nandam@oss.qualcomm.com>,
 "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RESEND PATCH v4 3/3] ASoC: qcom: sc8280xp: Enable DAI format
 configuration for MI2S interfaces
X-Mailer: aerc 0.20.0
References: <20250911063612.2242184-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250911063612.2242184-4-mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20250911063612.2242184-4-mohammad.rafi.shaik@oss.qualcomm.com>

On Thu Sep 11, 2025 at 7:36 AM BST, Mohammad Rafi Shaik wrote:
> Add support for configuring the DAI format on MI2S interfaces,
> this enhancement allows setting the appropriate bit clock and
> frame clock polarity, ensuring correct audio data transmission
> over MI2S.
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e25..3067b95bcdbb 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -32,6 +32,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtim=
e *rtd)
>  	int dp_pcm_id =3D 0;
> =20
>  	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +		break;
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
>  		/*

Out of curosity (I am not trying to block this patch), is there a differenc=
e
doing this on ->init() rather than on startup?
For instance, in sm8250 and in sdm845 sndcards this is done in ->startup
method. I suspect that answer might be that both locations are fine and
sc8280xp sndcard directly calls qcom_snd_sdw_startup() on startup.

Thanks,
Alexey


