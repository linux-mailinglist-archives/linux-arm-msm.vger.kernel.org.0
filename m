Return-Path: <linux-arm-msm+bounces-46864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64329A26F0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 11:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43203A5917
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 10:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E7B208989;
	Tue,  4 Feb 2025 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ifkINHUh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEB02080C7
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663802; cv=none; b=RajHgH3l5cE5pQ9GoFvwWkPK9LB59XMPWVA7Ng4A6e+8B3SRJShs3No99JdNC7ukoSbP1GntAeeiTT1L7Ls1hE0H0PFJjL+GOT2wtqieWFWQg9MdqJthhbebTs7tK9R9+Ga0moOopSSjGJ2DL3mm6kVJJECgfCrEfTqhbplN604=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663802; c=relaxed/simple;
	bh=pBDQPSE9tXQoqKm+B6E6lo+ThoVCELM++WW2Zjoplh8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NWWc06kUbEQ9AmTxQTVS6sP9vr0o3Vo5dNRCLZ8GNSaSaTu7SGsQCeN4BemGUWai1cnYNFjn3IamjgCQ5Xv2mH0UKY2ZHzjlKD9weWcgqhP6g3H2/+fQcIAvx5u4WItROhem7utmFE8knKSLdgySkjDOkZsJg7M4B2Rs2Rt7+P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ifkINHUh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38632b8ae71so4524741f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 02:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738663799; x=1739268599; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCPScdOIofnuxRD1Nb8R9yFru3nVgqy06Tlym+YD8X8=;
        b=ifkINHUhW8YOeJpNaK6qlIbpegfbQNkepDUfTRjXOf7cVSzu26fQaQBYYo27iyaeqe
         D5TGP32MpdA4BsDx7YztHAps6X2ZQbtjXPDBBeQoNeOc+IkONXrPC1Xqrxw5AV/BYmyh
         91rAnE8RluDQSP/joyAutd/P4J22S1RkmegH4nwJPvFDqUWXEMdLA0PCHDx37MkQAI27
         ajcB+/MgqVjWZDa1/kvVK+NALezmd9SAZ/lljsXJS0fg9doTjfpVvMriGuNJSZILuhN+
         724JAGKupb1onicNskFfPUKAXFoQQAzBXfzrvhEHMq+nKGyN5dvAgfxeqpjuTSKZ2eZy
         URnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663799; x=1739268599;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OCPScdOIofnuxRD1Nb8R9yFru3nVgqy06Tlym+YD8X8=;
        b=weyv40wmeBX0eYHPuXv5qMh3nmrAHy7vYK2VoGeipfNY9GkQdeaPb6guL0d5KUlZOK
         ctNS+/8zQ6zKtwrsjrKxWTMb93LaqZfzdxRdQFtd8eAQAhB6RKPL33eM2vujmWZutwyr
         oI1c5zdp6qdBzl71F2kA32j5Zps2H/2phFPCd36vbG6DDB7neYhbCAYw9relru3nM6H/
         StM3+29G9o7Lfku2iaQ6kcP9Y1KLROdUT/eWGHlAErj6m5AY6N4H5ggJEhPpwDVBl8Mo
         GzqdKrwJqQi4WOPAxYlj5JpuBAx7LIXZs3z3cTRVZts+8QuVfZNwBO+sLtjcsf7r2kyh
         KegQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnIV3/eRVjoav+pFbpb4lL5kIRR58sAjzx8VPesM30yqhrqxcFgprS+JM31/Gnrp6yZu8M6bCKBKq9XMge@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+1yIPdIuY3Qdh9+QLcEYndSX8VahHddhaTSbHmT0/k1u6VJZ5
	+PERnCHgZXYVXBiyiHc7A+AUkJ4ju3pI/kk+Zlszl8cOv1nxJmlGxkQP/n1hloE=
X-Gm-Gg: ASbGncuf4UCzlTP56bpTb9cu+ndxlbeR73zTw3/e0NBcP+Ood+2s8LzIpcKv3eNIsUk
	ZsNvcpkvDHeuDz1L2uAJx2n6IXMCIscMktPEQaYTk/vBNgDGVFq8PmNyNz5zmBIXGeWn0jsnvnf
	+C9E8DLVKAvX6QojNlYm4vCpsnGW01gCbf+CDRusHtTV4PgAoGJe33PqGX6DiK085RpJiSKZkrs
	2wrHgVICd+Msid9N9aewC9WbUOBSlyJf+j0YQztqxuuepQNpJ0qXAROmZB+jbcE0csbAGRHJzie
	4oaBVIlUFsO0kg27IzVV9Gw=
X-Google-Smtp-Source: AGHT+IH9ELbzMRvX0qUmTPFuiDE5EWroyjCa7whMru5exnpe511SFcsg4pSld7R/Y+EzddPEaf717g==
X-Received: by 2002:adf:fbd1:0:b0:386:3835:9fec with SMTP id ffacd0b85a97d-38c520972d6mr17054643f8f.44.1738663798783;
        Tue, 04 Feb 2025 02:09:58 -0800 (PST)
Received: from localhost ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf571sm15077251f8f.82.2025.02.04.02.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:09:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 11:09:58 +0100
Message-Id: <D7JKVM7P6ZUY.24LUVX621VEPC@fairphone.com>
Cc: <srinivas.kandagatla@linaro.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@mainlining.org>,
 <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: enable primary mi2s
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <neil.armstrong@linaro.org>, "Danila Tikhonov" <danila@jiaxyga.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250203113857.34728-1-danila@jiaxyga.com>
 <df4580ff-7b45-4485-9664-4cae731b7c53@linaro.org>
 <bcb4585e-1426-444a-9112-6cd95a81f8bc@jiaxyga.com>
 <D7J77FB0GLG2.1SDETF63DWW8Z@fairphone.com>
 <842284b1-343f-4991-98f4-462f547ad2bc@linaro.org>
 <D7JKR1YB6PSS.PRWFJ8NDA9BZ@fairphone.com>
 <7ac9b23a-6138-46ad-8af8-fe283b765565@linaro.org>
In-Reply-To: <7ac9b23a-6138-46ad-8af8-fe283b765565@linaro.org>

On Tue Feb 4, 2025 at 11:08 AM CET, neil.armstrong wrote:
> On 04/02/2025 11:04, Luca Weiss wrote:
>> On Tue Feb 4, 2025 at 9:19 AM CET, neil.armstrong wrote:
>>> On 04/02/2025 00:27, Luca Weiss wrote:
>>>> On Mon Feb 3, 2025 at 5:33 PM CET, Danila Tikhonov wrote:
>>>>> On 03/02/2025 17:23, neil.armstrong@linaro.org wrote:
>>>>>> On 03/02/2025 12:38, Danila Tikhonov wrote:
>>>>>>> When using primary mi2s on sc8280xp-compatible SoCs, the correct cl=
ock
>>>>>>> needs to get enabled to be able to use the mi2s interface.
>>>>>>>
>>>>>>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>>>>>>> ---
>>>>>>>   =C2=A0 sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
>>>>>>>   =C2=A0 1 file changed, 13 insertions(+)
>>>>>>>
>>>>>>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>>>>>>> index 311377317176..03687de1ebb0 100644
>>>>>>> --- a/sound/soc/qcom/sc8280xp.c
>>>>>>> +++ b/sound/soc/qcom/sc8280xp.c
>>>>>>> @@ -14,6 +14,8 @@
>>>>>>>   =C2=A0 #include "common.h"
>>>>>>>   =C2=A0 #include "sdw.h"
>>>>>>>   =C2=A0 +#define MI2S_BCLK_RATE=C2=A0=C2=A0=C2=A0 1536000
>>>>>>> +
>>>>>>>   =C2=A0 struct sc8280xp_snd_data {
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool stream_prepared[AFE_PORT_MAX]=
;
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_card *card;
>>>>>>> @@ -25,13 +27,24 @@ struct sc8280xp_snd_data {
>>>>>>>   =C2=A0 =C2=A0 static int sc8280xp_snd_init(struct snd_soc_pcm_run=
time *rtd)
>>>>>>>   =C2=A0 {
>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int codec_dai_fmt =3D SND_SOC_DAIFMT_B=
C_FC;
>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int fmt =3D SND_SOC_DAIFMT_BP_FP;
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sc8280xp_snd_data *data =3D
>>>>>>> snd_soc_card_get_drvdata(rtd->card);
>>>>>>> +=C2=A0=C2=A0=C2=A0 struct snd_soc_dai *codec_dai =3D snd_soc_rtd_t=
o_codec(rtd, 0);
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_dai *cpu_dai =3D sn=
d_soc_rtd_to_cpu(rtd, 0);
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_card *card =3D rtd-=
>card;
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_jack *dp_jack=C2=A0=
 =3D NULL;
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int dp_pcm_id =3D 0;
>>>>>>>   =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (cpu_dai->id) {
>>>>>>> +=C2=A0=C2=A0=C2=A0 case PRIMARY_MI2S_RX:
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 codec_dai_fmt |=3D SND_=
SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_sysclk(=
cpu_dai,
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>>>>>>
>>>>>> How is this possible ? sc8280xp uses the q6prm clock driver, and
>>>>>> there's no
>>>>>> way this call sets the Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT, or I totall=
y
>>>>>> missed
>>>>>> something.
>>>>>>
>>>>>> And prm is neither a dai nor has the set_sysclk callback.
>>>>>>
>>>>>> Neil
>>>>>>
>>>>> Oh, thanks for the answer.
>>>>>
>>>>> This comes from qcm6490 compatibility. Actually it is needed for
>>>>> Nothing Phone (1) and Luca Weiss just suggested me to use
>>>>> qcom,qcm6490-idp-sndcard like do they do it for FP5. (SM7325 is the
>>>>> closest to QCM6490):
>>>>> https://github.com/sc7280-mainline/linux/pull/5#discussion_r184898478=
8
>>>>> Actually I also think it is a bit incorrect.
>>>>
>>>> For reference, this is coming from this and following:
>>>> https://lore.kernel.org/linux-arm-msm/e8a24709-de96-4d09-ba00-1e084a65=
6c68@kernel.org/
>>>
>>> Sure, but do you use sound/soc/qcom/sc8280xp.c ? it's designed for audi=
oreach
>>> compatible audio architecture (post sm8250).
>>=20
>> I would've also thought qcm6490-idp and qcm6490-rb3gen2 are
>> pre-audioreach, so sm8250.c would be a better match - but these two
>> devices already use sc8280xp.c driver for some reason?
>
> I think they were added to sc8280xp.c because it has the logic to change
> the card name and some other tweaks for record channels setup,
> but it can be easily added to sm8250.c.

This is probably a better idea then...

>
> Neil
>
>>=20
>> Maybe someone with more insight on these devices can help clarify this?
>> I'll also need this for qcm6490-fairphone-fp5 soon.
>>=20
>> Regards Luca
>>=20
>>>
>>> sound/soc/qcom/sm8250.c has already support for PRIMARY_MI2S_RX via
>>> the Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT, and it compatible with the previo=
us
>>> audio architecture (non audioreach).
>>>
>>> Neil
>>>
>>>>
>>>> Regards
>>>> Luca
>>>>
>>>>>
>>>>> ---
>>>>> Regards,
>>>>> Danila
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_fmt(cpu=
_dai, fmt);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_fmt(cod=
ec_dai, codec_dai_fmt);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case WSA_CODEC_DMA_RX_0:
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case WSA_CODEC_DMA_RX_1:
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>
>>>>
>>=20


