Return-Path: <linux-arm-msm+bounces-46831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFB1A267E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 00:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5729162656
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 23:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B665A211461;
	Mon,  3 Feb 2025 23:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="x6Fj5SkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941FE209F57
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 23:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738625233; cv=none; b=L51z2VrgOs8zjmvvWvQGLIn2RBDm4JEmTLVwKIwDaa57qWw0jFZ7Mv7yqhIfYpk92qiNNHtm+LccFwwLqeURl8k+535905HyVfr38CXdEt2JtqDshfDhx/UwATHeDBcSlgIEiuuL+dtYWPX/bvuoueoevCXlTuUw3KJ0ZTTjPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738625233; c=relaxed/simple;
	bh=K7wihRwgcusVonD88DydIp9aglMQX2URY0cSBXWxNjM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=sQyKfFAOP6W/T0SzSpi+o1XXwPBCSRJ+u/n+QOoz87HBqfFGEjFVAgngSefwq1JGyviXJmji4s1LRZ6GXgh6SltX4v/3rEkjHG+hSBp+/WE7TRG5Ql+vqdcvp8Nnfb4S8z9mqXIanCNdJDv7taWeYCZr2aSaD1r9Gjyk7WvXr5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=x6Fj5SkY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso34317455e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 15:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738625229; x=1739230029; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7wihRwgcusVonD88DydIp9aglMQX2URY0cSBXWxNjM=;
        b=x6Fj5SkY6NNDTZQf5JYyI+EMyQUxnHMp1v+6bgHLy6zvRMW3eDWBBxJn5n2zOlUzMA
         z5Ztnd3BvoqEGPGul1zwy+nzlgE5nlKTS5AItjzhlaln20aAjce10YJROUzta3GfloK7
         yPqaYnEJ33E8h6/EFxC8TvxC38jbKyZwwPzxPuP2oJSDBRk0838wDyvQ+LCLDfVm1+eO
         U8M1jYuEFX6tPPPgAiZ1z+bPITcujdCCvEX8apRKo62oEfJ9soLAGXR/fMSI7D8UH/Y3
         QpFnzBTzAdIoBN3x4Ce94c92r1l0Qx8YA3i0SCpo1eGqO8puOIYc9WolgCHcPP8oWShA
         bAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738625229; x=1739230029;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7wihRwgcusVonD88DydIp9aglMQX2URY0cSBXWxNjM=;
        b=H4ZOLfMuibrUUkdK+rqO+NeNvuU1gtpZOgSp3Qm/0DpIfNSF9gtbon3Tbi/y+EBvdZ
         0W4FLUc7jr53wMw/i8TM4IojP6iL1/ZFP1Tt1+4B2pUQF39MnfO9GEzskOyCInBYz1D2
         /+f3dz6siuMjSz7y9qun3RHZFLTN46I6mimUoiIFsCSJ/BWPONfln8eDWqkr8dPKShP9
         K7q8j7IgFc6giDpYcojXn7gvZeWoj/Eek/EZ+NXpjQ+teuor9dbPZXnKFRszPrWOha1p
         2PorPXz1xL6Skt8QFWsAoRj5w0HvqJpWml1Ig7IScaAN4mJPPsdDDZ99ygAwzNaSasF3
         yqOA==
X-Forwarded-Encrypted: i=1; AJvYcCWIpZchvw/XYIjs3q0HUs/zXJMi3G77RMgPSmkh4V1el6YEtuI1JKjRWszJE9SklJjhN5ZR7XIkIusd6ccO@vger.kernel.org
X-Gm-Message-State: AOJu0YxwAaUaSJJFLOagaqCQdzY5CH0XqE/a6ilsZyF1h0n0gJKciBKk
	8XVA/KAK2Y2fzbIGAP+xSRpzUt1DdNtE/GQoutoByTNWCKaBBWG9c84fbX6nlhEU2FvCG+6zUb7
	h
X-Gm-Gg: ASbGncvaRHzUsaEiUJGyRvV053JTrJpsgawbUXr/qhKwi+uJ/hC15hX2NzY6fF6RBmN
	jB7O06SEKZzcMmOmFVaxrjtoLfNr4BS7f2GGKLlE1U2YpqKKFIG/I/xqcxsEgIocS0t/kDISYN+
	YbSDokDwP9xib2qdiYpwK3OwxQDXW/Rq8v2V6qTdjbZIzCOcS7TpRrH+sj5YVL9blMgBmgM6uIc
	Z8XbAf6QjYe/2AEPSRoITH1vMbe5MvEzVSmIkonGxBE3deZRNxNbyfrC/BA9KiwEwmCxPxhzkIl
	4ZfHnggM8vNK7QzhGn/0BKw=
X-Google-Smtp-Source: AGHT+IH7VglpuOrvoGelSu/OEVcUq3P12Ew/XlWE8HGA32pm+QlQ6mJlcZFbE4X9m982bWpBOTZiMA==
X-Received: by 2002:a05:600c:1f15:b0:434:f335:83b with SMTP id 5b1f17b1804b1-438dc3a84aamr235318645e9.5.1738625228711;
        Mon, 03 Feb 2025 15:27:08 -0800 (PST)
Received: from localhost ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc1317fsm209055245e9.8.2025.02.03.15.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 15:27:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 00:27:07 +0100
Message-Id: <D7J77FB0GLG2.1SDETF63DWW8Z@fairphone.com>
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: enable primary mi2s
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Danila Tikhonov" <danila@jiaxyga.com>, <neil.armstrong@linaro.org>
Cc: <srinivas.kandagatla@linaro.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@mainlining.org>,
 <~postmarketos/upstreaming@lists.sr.ht>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250203113857.34728-1-danila@jiaxyga.com>
 <df4580ff-7b45-4485-9664-4cae731b7c53@linaro.org>
 <bcb4585e-1426-444a-9112-6cd95a81f8bc@jiaxyga.com>
In-Reply-To: <bcb4585e-1426-444a-9112-6cd95a81f8bc@jiaxyga.com>

On Mon Feb 3, 2025 at 5:33 PM CET, Danila Tikhonov wrote:
> On 03/02/2025 17:23, neil.armstrong@linaro.org wrote:
>> On 03/02/2025 12:38, Danila Tikhonov wrote:
>>> When using primary mi2s on sc8280xp-compatible SoCs, the correct clock
>>> needs to get enabled to be able to use the mi2s interface.
>>>
>>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>>> ---
>>> =C2=A0 sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
>>> =C2=A0 1 file changed, 13 insertions(+)
>>>
>>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>>> index 311377317176..03687de1ebb0 100644
>>> --- a/sound/soc/qcom/sc8280xp.c
>>> +++ b/sound/soc/qcom/sc8280xp.c
>>> @@ -14,6 +14,8 @@
>>> =C2=A0 #include "common.h"
>>> =C2=A0 #include "sdw.h"
>>> =C2=A0 +#define MI2S_BCLK_RATE=C2=A0=C2=A0=C2=A0 1536000
>>> +
>>> =C2=A0 struct sc8280xp_snd_data {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool stream_prepared[AFE_PORT_MAX];
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_card *card;
>>> @@ -25,13 +27,24 @@ struct sc8280xp_snd_data {
>>> =C2=A0 =C2=A0 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *=
rtd)
>>> =C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0 unsigned int codec_dai_fmt =3D SND_SOC_DAIFMT_BC_FC=
;
>>> +=C2=A0=C2=A0=C2=A0 unsigned int fmt =3D SND_SOC_DAIFMT_BP_FP;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sc8280xp_snd_data *data =3D=20
>>> snd_soc_card_get_drvdata(rtd->card);
>>> +=C2=A0=C2=A0=C2=A0 struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_co=
dec(rtd, 0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_dai *cpu_dai =3D snd_soc_=
rtd_to_cpu(rtd, 0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_card *card =3D rtd->card;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_jack *dp_jack=C2=A0 =3D N=
ULL;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int dp_pcm_id =3D 0;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (cpu_dai->id) {
>>> +=C2=A0=C2=A0=C2=A0 case PRIMARY_MI2S_RX:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 codec_dai_fmt |=3D SND_SOC_=
DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_sysclk(cpu_=
dai,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Q6A=
FE_LPASS_CLK_ID_PRI_MI2S_IBIT,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MI2=
S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>>
>> How is this possible ? sc8280xp uses the q6prm clock driver, and=20
>> there's no
>> way this call sets the Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT, or I totally=20
>> missed
>> something.
>>
>> And prm is neither a dai nor has the set_sysclk callback.
>>
>> Neil
>>
> Oh, thanks for the answer.
>
> This comes from qcm6490 compatibility. Actually it is needed for
> Nothing Phone (1) and Luca Weiss just suggested me to use
> qcom,qcm6490-idp-sndcard like do they do it for FP5. (SM7325 is the
> closest to QCM6490):
> https://github.com/sc7280-mainline/linux/pull/5#discussion_r1848984788
> Actually I also think it is a bit incorrect.

For reference, this is coming from this and following:
https://lore.kernel.org/linux-arm-msm/e8a24709-de96-4d09-ba00-1e084a656c68@=
kernel.org/

Regards
Luca

>
> ---
> Regards,
> Danila
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_fmt(cpu_dai=
, fmt);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_fmt(codec_d=
ai, codec_dai_fmt);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case WSA_CODEC_DMA_RX_0:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case WSA_CODEC_DMA_RX_1:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>


