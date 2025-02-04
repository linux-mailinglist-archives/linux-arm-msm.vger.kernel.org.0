Return-Path: <linux-arm-msm+bounces-46853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E97A26D21
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 09:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCEA87A4013
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 08:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B251E2066E5;
	Tue,  4 Feb 2025 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EiaDss9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920BA2066C4
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 08:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738657192; cv=none; b=DM7EGTLPBYyrYCUb1dbbgX9YyzWkwWnQiXSvD3scyOkdlf3D/w2RkQ4ceR5eYkqIJh5AjLu4fz/MUUGkJDtP2l3kI9YN7uKhPCGUHfDJjdUU36TUdnJRVS2eOl5k5E9yE2ouLuMp3GXBW1xD+WWabu1x+pKAwuLrYw4LXgTo5sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738657192; c=relaxed/simple;
	bh=QJoP5bpuVDnXG0hP+2j8Y5lK8cbNr/AX+eYxJkg7etc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=orLVIHq2FxWxTsZ6wGwtBoL0srtbQa6IqUlMNDlbZD4FRoNyxs442k9iDZVo87ro8VM10BPsoEqSVwUfQ8omdaOUj+Km5al90BvgMr8XBs6vhSrGu11LEn/ujxPK0VRo8ATGJUUjIMGX9unDpOx31OScVdOouC4LNozKfWMNi4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EiaDss9f; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38632b8ae71so4436150f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 00:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738657189; x=1739261989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VasOeDLqwO0DGgvAXrhPGy6KqMolkRSV5bMCtl5mMs=;
        b=EiaDss9fc/PaCleByjP5Ua5orAqKoZEy4ycVEKG9fD6FLM3/Cet1hrWKFnf21EGNSx
         CtSS2UIeRbXqEoeLjU+a5wGZpzHTV/dr8xVYE9hhUE9l70fiYsYqyMD5Qdf+pkc17NLZ
         I4l0FmRARtt3SOhC3q07gmc4Cbzl9G+RYoFkgANKl9TDgjExumnGQ57JrEWT7WRdlaE0
         QJ5GR7aWQh5wlo3HrPbr1CVpaeR8e2Ji4mKR3RzNZHSZZKiug/5tX2fwB6P0BVRhmJfx
         yBjJKz3/T/6M9tj0AmP5g19jix2EQx1645JHCVJq0H26UsmV3owTRdlYJBpHZhA5eewv
         LW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738657189; x=1739261989;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4VasOeDLqwO0DGgvAXrhPGy6KqMolkRSV5bMCtl5mMs=;
        b=Bv/raR0/23JM6qoXVYuG15AWxGAV/4TpsJ1p8lzeiZ6dACsDiX8BfoZ9ZGqtAxOJkt
         shwGYPUBGOX6Af0/w9PeuRIMEupGKrFbAuQACPit7C4HsZ+7At2yDKIKXaQj9dAdu07f
         olYHS0zg4r768EmbsIMu3cVzlKaEMGV3b4nZ1NylRtZQt0w7kAJ+m51Q0WYSYXUwLEod
         LX8E/0j+bp56gFcMFPLtU27p6EwyQxj+W5M+Fq4/p2HazEI3ogkxXAZRc/l7nUi2I3/r
         k2xsB80rw3U3g0b+PoPi9tCHd1zqwF8WMZsPJzOzHkcO/kc9bOGcI3UtdxVa1OUEs77S
         OIQg==
X-Forwarded-Encrypted: i=1; AJvYcCVKuI3qzVGf7L/pCjX3tjtg9x+WEDMfCQyMWSHsum5tMxusz6QeXK7JJE6aYwmK2peF8TnCphmhiYSp2OxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzB2Uky2npoFm6+Keq2xjJoBBxV+FZMgrh135+gKgbJLBGGijIC
	M4fA8uZKA4+T/Gi4sGyTsyEZidiM5HvZxqSdwxPnfQyICZ0bEEEVsbQ/R0Hxf3c=
X-Gm-Gg: ASbGncvHLAROPXbhyaCDYoSzLv83I6dA94qa4y31pYc8YyGi54KKsVO/dHgcphYyQsj
	M/rO1zM9r6Figklli7QHrcHhNadrkjyO4FUa77tyygb0bWrQG09KKlwlIvj70AXV0HWeYMC8KYK
	khQGzh9aoQwvCyx1AElfr26MMDTuFAYMoQllgY8hpvqEdbAabCmNYD75hyoU76T/Jj1z6vNkV5p
	VddAdwz1FaKVLJqjYdK6HJfh3+64r+eheiFFPRUuonEBlRPcoVaolvBeYLQWcPQgddfDcRLm0gh
	zjx0PFmc6dBmjdslZOiE/dyOJmwQ22pxvIi+QqaDPpQb7qbJsoqNiGTULkU8UZTsVWHc
X-Google-Smtp-Source: AGHT+IFbnJg2PuT9i73jomtjcF87nuxMc6wmD76FQvWnGe8UxJCAypV81miJ7w4UhG+d0OffsaA56A==
X-Received: by 2002:a05:6000:1f88:b0:385:e176:4420 with SMTP id ffacd0b85a97d-38c5194da70mr19435261f8f.10.1738657188754;
        Tue, 04 Feb 2025 00:19:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8db5:d196:bd48:5fbb? ([2a01:e0a:982:cbb0:8db5:d196:bd48:5fbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf364sm14910592f8f.88.2025.02.04.00.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 00:19:48 -0800 (PST)
Message-ID: <842284b1-343f-4991-98f4-462f547ad2bc@linaro.org>
Date: Tue, 4 Feb 2025 09:19:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: enable primary mi2s
To: Luca Weiss <luca.weiss@fairphone.com>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250203113857.34728-1-danila@jiaxyga.com>
 <df4580ff-7b45-4485-9664-4cae731b7c53@linaro.org>
 <bcb4585e-1426-444a-9112-6cd95a81f8bc@jiaxyga.com>
 <D7J77FB0GLG2.1SDETF63DWW8Z@fairphone.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <D7J77FB0GLG2.1SDETF63DWW8Z@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/02/2025 00:27, Luca Weiss wrote:
> On Mon Feb 3, 2025 at 5:33 PM CET, Danila Tikhonov wrote:
>> On 03/02/2025 17:23, neil.armstrong@linaro.org wrote:
>>> On 03/02/2025 12:38, Danila Tikhonov wrote:
>>>> When using primary mi2s on sc8280xp-compatible SoCs, the correct clock
>>>> needs to get enabled to be able to use the mi2s interface.
>>>>
>>>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>>>> ---
>>>>    sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
>>>>    1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>>>> index 311377317176..03687de1ebb0 100644
>>>> --- a/sound/soc/qcom/sc8280xp.c
>>>> +++ b/sound/soc/qcom/sc8280xp.c
>>>> @@ -14,6 +14,8 @@
>>>>    #include "common.h"
>>>>    #include "sdw.h"
>>>>    +#define MI2S_BCLK_RATE    1536000
>>>> +
>>>>    struct sc8280xp_snd_data {
>>>>        bool stream_prepared[AFE_PORT_MAX];
>>>>        struct snd_soc_card *card;
>>>> @@ -25,13 +27,24 @@ struct sc8280xp_snd_data {
>>>>      static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>>>>    {
>>>> +    unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
>>>> +    unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
>>>>        struct sc8280xp_snd_data *data =
>>>> snd_soc_card_get_drvdata(rtd->card);
>>>> +    struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>>>>        struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>>>        struct snd_soc_card *card = rtd->card;
>>>>        struct snd_soc_jack *dp_jack  = NULL;
>>>>        int dp_pcm_id = 0;
>>>>          switch (cpu_dai->id) {
>>>> +    case PRIMARY_MI2S_RX:
>>>> +        codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>>>> +        snd_soc_dai_set_sysclk(cpu_dai,
>>>> +            Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
>>>> +            MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>>>
>>> How is this possible ? sc8280xp uses the q6prm clock driver, and
>>> there's no
>>> way this call sets the Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT, or I totally
>>> missed
>>> something.
>>>
>>> And prm is neither a dai nor has the set_sysclk callback.
>>>
>>> Neil
>>>
>> Oh, thanks for the answer.
>>
>> This comes from qcm6490 compatibility. Actually it is needed for
>> Nothing Phone (1) and Luca Weiss just suggested me to use
>> qcom,qcm6490-idp-sndcard like do they do it for FP5. (SM7325 is the
>> closest to QCM6490):
>> https://github.com/sc7280-mainline/linux/pull/5#discussion_r1848984788
>> Actually I also think it is a bit incorrect.
> 
> For reference, this is coming from this and following:
> https://lore.kernel.org/linux-arm-msm/e8a24709-de96-4d09-ba00-1e084a656c68@kernel.org/

Sure, but do you use sound/soc/qcom/sc8280xp.c ? it's designed for audioreach
compatible audio architecture (post sm8250).

sound/soc/qcom/sm8250.c has already support for PRIMARY_MI2S_RX via
the Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT, and it compatible with the previous
audio architecture (non audioreach).

Neil

> 
> Regards
> Luca
> 
>>
>> ---
>> Regards,
>> Danila
>>>> +        snd_soc_dai_set_fmt(cpu_dai, fmt);
>>>> +        snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>>>> +        break;
>>>>        case WSA_CODEC_DMA_RX_0:
>>>>        case WSA_CODEC_DMA_RX_1:
>>>>            /*
>>>
> 


