Return-Path: <linux-arm-msm+bounces-46861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B618EA26EF9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 11:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DE36162210
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 10:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285DC209679;
	Tue,  4 Feb 2025 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pIU29/YK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B04209668
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663447; cv=none; b=rDGLVi6zwibunVg2bv6gSeADRqe2eckwB/sMbS3hB0XqHmeXDn/82/tKZtPLd1G0SzRPb2356vypiuRhRyP4A4YV0THNBPvLCgtfoUJzzHWBpYBNjT/v4sgYi8AvVHwElIztX91hiE0B7TXV9jCntt1NmcudpmTyi+6GNHN/6cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663447; c=relaxed/simple;
	bh=FzgyHT9jrbXQXJVlFEZ0/ooOFZK+eNEdP1AxmZZsRug=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=VKPaw3UyEexrbKxvtgUqNlCu25btk0qPPeH5KEna5875KfzBNwmOPFPwfSST6apa4ORbexsW5ahfvoXuKGc/hV6s01j83l3BmBWpJeTCxW6Ca/sxegFivnPlkjiTtkdxe/fLEatBKCKQEIzspdwwlrg8fXKbtA5s7AdFfuH/S94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pIU29/YK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43624b2d453so62316485e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 02:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738663442; x=1739268242; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtZe2ir+7kEXz6rq6Gkp5T3tCNxsiNE10GMYYDGHKmk=;
        b=pIU29/YKFvtpBytd5VpF2p4X7Mfn4NaCeYnvzNlUmbeLbJYT4BSjp1wAfPHgJ/fRbo
         aG4slNoQFKC2pyoWjxSRyUGWZL5OgvqpdaYVGxniNjubc+Yt9LatTocpVtgG4Ulj2ki4
         UarDUg+i+LhYAjhNOKr97nrYLBABmoBEt5AqyoyS1hxp6zU7JNzAqZGFQArc/hzh5/N6
         dTqp6iVAjKcYM8zwC4ruLoqCcTCT2FFP+3JASdE7vgJ7Gmo7s1eGoEA4LzaZdW1DGJYa
         58Ucp0F88xXRuKAQabFPUyd2A40Rpup+p5ppqBjV+liWtETrZf0kdN5+JeDIaJkPyDm5
         aLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663442; x=1739268242;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OtZe2ir+7kEXz6rq6Gkp5T3tCNxsiNE10GMYYDGHKmk=;
        b=V2HbNyFCVXCvo3oCRzopmTWBDbmpDlCUnlqtiQOgxNYl/S4+nQG32pSuiMG4I3TeQd
         4uHCUsWz913KDQQhv9UW4jxiM7KLrqSYWMZ3TsODA0vMuTleVqV53DIs1QYcTM5o+p2M
         lYBYqxQA4YotHZW4+hhZUHfWyhXrUE8aQTy0wuxCB3FSLHXMh2cHz0N4jlJQGaLYJisR
         A8Hs7deqNCmLEW9BQcuaAXGA3r4B2TrXsj4KObdQxY6RyhQup7kux0GKRUg7srEML8VH
         CF7GiyhaiGiHtMFUYpPbpCwt5nNBVH38Oevb0DllbxjorPserJbVpjKetTQ28WUXSimU
         8VGA==
X-Forwarded-Encrypted: i=1; AJvYcCUp2z3BBCSa8vUZGhdnUqkdxDYIcEKn3TVVXAszKsh4l0+wzp2pyHSo8zbk7EOOEnyd8Yp48CjMnDxaTnXF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ccA6AoFKEYMNY1y2Vz1ct7vuZKDDrMH+4nmBARtcPzcVpAOG
	KctEcgFuM9dLP3JfBc5V8kc65yzYxcqh3xuAA6B5+4isil/aiW3ukBBNP+c9PQo=
X-Gm-Gg: ASbGncs/ByIiEzlxtr7eW18h9ZV3OwfshUmzC1YCl7bbwNE30+/hKjxXN9wf+kOFria
	t5CKDatqbtpdvUnQo5CRubvM79eejDA0BEwsWOuaMTAhG5kB1zA4k19HvM3iQutpKxksOLi5Sqa
	Z0b7RDemS49aaBxC2t02EAnMRNsMu1jY2AWqvvq32CbrDDYR2tVte0rpWs5q0Or/7qu6/1D2/7K
	EMyFDFw49JJjrDHV/zLhdBnEnBSxx3u2LJdERYigj+gFiM1UPG6J1bh1dIejRE8amj/+4LA40iE
	xOBEqfVz/x5DYQg018RmZ6g=
X-Google-Smtp-Source: AGHT+IGVXH+Mb2lrYsUc7UoobTqoCN8FlHlh/PM2xgXfqoRoYMzaOTJGLuoVwWgGv12sGGazNZZcLw==
X-Received: by 2002:a7b:c314:0:b0:439:90f:ba9d with SMTP id 5b1f17b1804b1-439090fbd1dmr9554185e9.8.1738663441773;
        Tue, 04 Feb 2025 02:04:01 -0800 (PST)
Received: from localhost ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f19247sm10047355e9.1.2025.02.04.02.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:04:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 11:04:00 +0100
Message-Id: <D7JKR1YB6PSS.PRWFJ8NDA9BZ@fairphone.com>
To: <neil.armstrong@linaro.org>, "Danila Tikhonov" <danila@jiaxyga.com>
Cc: <srinivas.kandagatla@linaro.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux@mainlining.org>,
 <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: enable primary mi2s
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250203113857.34728-1-danila@jiaxyga.com>
 <df4580ff-7b45-4485-9664-4cae731b7c53@linaro.org>
 <bcb4585e-1426-444a-9112-6cd95a81f8bc@jiaxyga.com>
 <D7J77FB0GLG2.1SDETF63DWW8Z@fairphone.com>
 <842284b1-343f-4991-98f4-462f547ad2bc@linaro.org>
In-Reply-To: <842284b1-343f-4991-98f4-462f547ad2bc@linaro.org>

On Tue Feb 4, 2025 at 9:19 AM CET, neil.armstrong wrote:
> On 04/02/2025 00:27, Luca Weiss wrote:
>> On Mon Feb 3, 2025 at 5:33 PM CET, Danila Tikhonov wrote:
>>> On 03/02/2025 17:23, neil.armstrong@linaro.org wrote:
>>>> On 03/02/2025 12:38, Danila Tikhonov wrote:
>>>>> When using primary mi2s on sc8280xp-compatible SoCs, the correct cloc=
k
>>>>> needs to get enabled to be able to use the mi2s interface.
>>>>>
>>>>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>>>>> ---
>>>>>  =C2=A0 sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
>>>>>  =C2=A0 1 file changed, 13 insertions(+)
>>>>>
>>>>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>>>>> index 311377317176..03687de1ebb0 100644
>>>>> --- a/sound/soc/qcom/sc8280xp.c
>>>>> +++ b/sound/soc/qcom/sc8280xp.c
>>>>> @@ -14,6 +14,8 @@
>>>>>  =C2=A0 #include "common.h"
>>>>>  =C2=A0 #include "sdw.h"
>>>>>  =C2=A0 +#define MI2S_BCLK_RATE=C2=A0=C2=A0=C2=A0 1536000
>>>>> +
>>>>>  =C2=A0 struct sc8280xp_snd_data {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool stream_prepared[AFE_PORT_MAX];
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_card *card;
>>>>> @@ -25,13 +27,24 @@ struct sc8280xp_snd_data {
>>>>>  =C2=A0 =C2=A0 static int sc8280xp_snd_init(struct snd_soc_pcm_runtim=
e *rtd)
>>>>>  =C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int codec_dai_fmt =3D SND_SOC_DAIFMT_BC_=
FC;
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int fmt =3D SND_SOC_DAIFMT_BP_FP;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sc8280xp_snd_data *data =3D
>>>>> snd_soc_card_get_drvdata(rtd->card);
>>>>> +=C2=A0=C2=A0=C2=A0 struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_=
codec(rtd, 0);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_dai *cpu_dai =3D snd_s=
oc_rtd_to_cpu(rtd, 0);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_card *card =3D rtd->ca=
rd;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct snd_soc_jack *dp_jack=C2=A0 =
=3D NULL;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int dp_pcm_id =3D 0;
>>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (cpu_dai->id) {
>>>>> +=C2=A0=C2=A0=C2=A0 case PRIMARY_MI2S_RX:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 codec_dai_fmt |=3D SND_SO=
C_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_sysclk(cp=
u_dai,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Q=
6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 M=
I2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>>>>
>>>> How is this possible ? sc8280xp uses the q6prm clock driver, and
>>>> there's no
>>>> way this call sets the Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT, or I totally
>>>> missed
>>>> something.
>>>>
>>>> And prm is neither a dai nor has the set_sysclk callback.
>>>>
>>>> Neil
>>>>
>>> Oh, thanks for the answer.
>>>
>>> This comes from qcm6490 compatibility. Actually it is needed for
>>> Nothing Phone (1) and Luca Weiss just suggested me to use
>>> qcom,qcm6490-idp-sndcard like do they do it for FP5. (SM7325 is the
>>> closest to QCM6490):
>>> https://github.com/sc7280-mainline/linux/pull/5#discussion_r1848984788
>>> Actually I also think it is a bit incorrect.
>>=20
>> For reference, this is coming from this and following:
>> https://lore.kernel.org/linux-arm-msm/e8a24709-de96-4d09-ba00-1e084a656c=
68@kernel.org/
>
> Sure, but do you use sound/soc/qcom/sc8280xp.c ? it's designed for audior=
each
> compatible audio architecture (post sm8250).

I would've also thought qcm6490-idp and qcm6490-rb3gen2 are
pre-audioreach, so sm8250.c would be a better match - but these two
devices already use sc8280xp.c driver for some reason?

Maybe someone with more insight on these devices can help clarify this?
I'll also need this for qcm6490-fairphone-fp5 soon.

Regards Luca

>
> sound/soc/qcom/sm8250.c has already support for PRIMARY_MI2S_RX via
> the Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT, and it compatible with the previous
> audio architecture (non audioreach).
>
> Neil
>
>>=20
>> Regards
>> Luca
>>=20
>>>
>>> ---
>>> Regards,
>>> Danila
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_fmt(cpu_d=
ai, fmt);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snd_soc_dai_set_fmt(codec=
_dai, codec_dai_fmt);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case WSA_CODEC_DMA_RX_0:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case WSA_CODEC_DMA_RX_1:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>
>>=20


