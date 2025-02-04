Return-Path: <linux-arm-msm+bounces-46862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89BAA26F07
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 11:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 641863A262D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 10:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88592080E0;
	Tue,  4 Feb 2025 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z5kkHwPP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6AC2080C1
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663706; cv=none; b=hDeMLEs2L/CYZ9VB69yFsvW1rfR1nuWWOCW1e/rY/QpyFeAH8p9tK+vRRremj5Usm4RgOi4D82e67ux4csfeSViafKKVO3p5Qc9L5bDRi7o1rh0LtZf3KwhsfDMAHiX/qljend3S3iJx1OIVhPRRsLIHspolPYj3UzkiPmVnvQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663706; c=relaxed/simple;
	bh=oJ5ilFc6EIBLNd9RD+HALk65hUVaw7xoA7947igedgA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NTeTeIS0QqOJgCht9Qfq+eTGpZTECW/fJ3qcZwinpoIwgKAUJe0fvzttjtwJDGenSKE96FQKIPZ6Ips8Do3V50PcRKgr2U2qrHtltciJ/8KxL7yElB5DKZjPCidYMmkuidyDn/2WgLt+5WqN/vIxxdLJLFdP2Kqlif/hmZ7g2SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z5kkHwPP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43618283dedso54901625e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 02:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738663702; x=1739268502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zIjvrO6ssyej4wt8HX0jpMSZoBBUMQv8ogZGOdGu48=;
        b=z5kkHwPPxBWZ6qiVizcnRGz9z+lwlGYAGZoRI9c9LwEUVME1TgGd5FV888l5NkImdp
         GeE7EekiaXaj4ES0yXzdxTxCVBfrjbenj8TprCT/sTbXT0XRjxqJO2wRlPcyq2JKsjEy
         eY3Rz7W+eCqcmkuKz3aOl1hBu1FXMx04yI6sccJZ69ChAfd3f/FPXpLFu44pzCl/ElFR
         v6WyuyJUzrTbyGN04Am2/ErMeMZG7kh6767udB6IjsXS8/1ji3eR0ZERUEP6UzTF/U+g
         kZB0qeM/jb3khDrpX4oz2uE2K3ixGBSzeKxnNSywRyegVMAJJuFiKi8fizFYTmVrM5b9
         JJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663702; x=1739268502;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2zIjvrO6ssyej4wt8HX0jpMSZoBBUMQv8ogZGOdGu48=;
        b=PSmzXhKzFJ24QPB/ktYIyDHQriBnUArYPWQ+Hnsh9BhccyKdct2RcCNH0LvvIeIMzm
         EnuE4MbfMwZJ6OKtllGZ4iPK1H0fFBffBZEaeHK8Eo3bUos/iJs5tVyy8BJci7kiWn6i
         4H0JkKC/WcuUPMWSoKFR2cwCI8xUIzPVHjPBVvbl/CMd+PCr+ultoRTSN08Qk6URc9jD
         CpZcUHVvVRCbLJbj5MhoaU9Ly97KWx+IH1OJuo/MRi3IXGFCKH7Pn0v3waOJ/teUbxjZ
         SpEmHyDvuNvKDnN4XLDwjHrK1Q4RoUd/m4WCmhEo9Bh7RmY1H/4xTSYcLaYasnMnVAmH
         KtSA==
X-Forwarded-Encrypted: i=1; AJvYcCU/vD6Eq3aavBM3TPzMIr7plTZT7O/SlhRnSOZkyC6tVAeoKQYOLOcrCSek7cw4OZcchk3N3l0I19H7ioKG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3kCeXpp3TBGfA55o9dRxzuxODPr6YpC+kVtOXHqrVjUyJ13dm
	uGxZn56vnW7e7y5uExj52amU94Rg/NVdBeFaD5GlbN/f+BFOVUlppAvtWr6+3XE=
X-Gm-Gg: ASbGnctzEh63obQ+IobII4yIH6qzAqRNiIUmSR2FcUoYlPRw8qLOisB4VgM34hxxp2o
	qSO91oKkZjc1lJTNJZh+LxJk9O5iagPRm6TNQv9St3qNXtpLyzxq0Qum0s2vYiToFiV3lQ8aWDe
	uQBv3Re2+CTTGzUr3R+VOQ5kupLmwfxIFaDcmHT8VkNH+Z3iS45rBCCfJXuLY8+YRd3Ec8x4D88
	hDVrb1fYxGrO0QLxgohLmB4tdiy/Rhrea7PYuIcnlnvjDUTLmRZC1uSdJHYEExx9htiWlvRwZ97
	58zJiEvY3Jumy/KJhCxz7DS2lzLdMpp0UL4yNvE29o8hFmyvqff0rj0w6VNPOvMwELCt
X-Google-Smtp-Source: AGHT+IGqsAZdQEmVVkbeJpaNL+XAZKTgDkM4NecLCiPVE9Z711OuYUgYNErUH2YK9lvt5Un2fA5dQw==
X-Received: by 2002:adf:ee8b:0:b0:382:3c7b:9ae with SMTP id ffacd0b85a97d-38c51943ddemr18396963f8f.16.1738663702354;
        Tue, 04 Feb 2025 02:08:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8db5:d196:bd48:5fbb? ([2a01:e0a:982:cbb0:8db5:d196:bd48:5fbb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245f41esm185365745e9.36.2025.02.04.02.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:08:21 -0800 (PST)
Message-ID: <7ac9b23a-6138-46ad-8af8-fe283b765565@linaro.org>
Date: Tue, 4 Feb 2025 11:08:21 +0100
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
 <842284b1-343f-4991-98f4-462f547ad2bc@linaro.org>
 <D7JKR1YB6PSS.PRWFJ8NDA9BZ@fairphone.com>
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
In-Reply-To: <D7JKR1YB6PSS.PRWFJ8NDA9BZ@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/02/2025 11:04, Luca Weiss wrote:
> On Tue Feb 4, 2025 at 9:19 AM CET, neil.armstrong wrote:
>> On 04/02/2025 00:27, Luca Weiss wrote:
>>> On Mon Feb 3, 2025 at 5:33 PM CET, Danila Tikhonov wrote:
>>>> On 03/02/2025 17:23, neil.armstrong@linaro.org wrote:
>>>>> On 03/02/2025 12:38, Danila Tikhonov wrote:
>>>>>> When using primary mi2s on sc8280xp-compatible SoCs, the correct clock
>>>>>> needs to get enabled to be able to use the mi2s interface.
>>>>>>
>>>>>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>>>>>> ---
>>>>>>     sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
>>>>>>     1 file changed, 13 insertions(+)
>>>>>>
>>>>>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>>>>>> index 311377317176..03687de1ebb0 100644
>>>>>> --- a/sound/soc/qcom/sc8280xp.c
>>>>>> +++ b/sound/soc/qcom/sc8280xp.c
>>>>>> @@ -14,6 +14,8 @@
>>>>>>     #include "common.h"
>>>>>>     #include "sdw.h"
>>>>>>     +#define MI2S_BCLK_RATE    1536000
>>>>>> +
>>>>>>     struct sc8280xp_snd_data {
>>>>>>         bool stream_prepared[AFE_PORT_MAX];
>>>>>>         struct snd_soc_card *card;
>>>>>> @@ -25,13 +27,24 @@ struct sc8280xp_snd_data {
>>>>>>       static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>>>>>>     {
>>>>>> +    unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
>>>>>> +    unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
>>>>>>         struct sc8280xp_snd_data *data =
>>>>>> snd_soc_card_get_drvdata(rtd->card);
>>>>>> +    struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>>>>>>         struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>>>>>         struct snd_soc_card *card = rtd->card;
>>>>>>         struct snd_soc_jack *dp_jack  = NULL;
>>>>>>         int dp_pcm_id = 0;
>>>>>>           switch (cpu_dai->id) {
>>>>>> +    case PRIMARY_MI2S_RX:
>>>>>> +        codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>>>>>> +        snd_soc_dai_set_sysclk(cpu_dai,
>>>>>> +            Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
>>>>>> +            MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>>>>>
>>>>> How is this possible ? sc8280xp uses the q6prm clock driver, and
>>>>> there's no
>>>>> way this call sets the Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT, or I totally
>>>>> missed
>>>>> something.
>>>>>
>>>>> And prm is neither a dai nor has the set_sysclk callback.
>>>>>
>>>>> Neil
>>>>>
>>>> Oh, thanks for the answer.
>>>>
>>>> This comes from qcm6490 compatibility. Actually it is needed for
>>>> Nothing Phone (1) and Luca Weiss just suggested me to use
>>>> qcom,qcm6490-idp-sndcard like do they do it for FP5. (SM7325 is the
>>>> closest to QCM6490):
>>>> https://github.com/sc7280-mainline/linux/pull/5#discussion_r1848984788
>>>> Actually I also think it is a bit incorrect.
>>>
>>> For reference, this is coming from this and following:
>>> https://lore.kernel.org/linux-arm-msm/e8a24709-de96-4d09-ba00-1e084a656c68@kernel.org/
>>
>> Sure, but do you use sound/soc/qcom/sc8280xp.c ? it's designed for audioreach
>> compatible audio architecture (post sm8250).
> 
> I would've also thought qcm6490-idp and qcm6490-rb3gen2 are
> pre-audioreach, so sm8250.c would be a better match - but these two
> devices already use sc8280xp.c driver for some reason?

I think they were added to sc8280xp.c because it has the logic to change
the card name and some other tweaks for record channels setup,
but it can be easily added to sm8250.c.

Neil

> 
> Maybe someone with more insight on these devices can help clarify this?
> I'll also need this for qcm6490-fairphone-fp5 soon.
> 
> Regards Luca
> 
>>
>> sound/soc/qcom/sm8250.c has already support for PRIMARY_MI2S_RX via
>> the Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT, and it compatible with the previous
>> audio architecture (non audioreach).
>>
>> Neil
>>
>>>
>>> Regards
>>> Luca
>>>
>>>>
>>>> ---
>>>> Regards,
>>>> Danila
>>>>>> +        snd_soc_dai_set_fmt(cpu_dai, fmt);
>>>>>> +        snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>>>>>> +        break;
>>>>>>         case WSA_CODEC_DMA_RX_0:
>>>>>>         case WSA_CODEC_DMA_RX_1:
>>>>>>             /*
>>>>>
>>>
> 


