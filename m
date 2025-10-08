Return-Path: <linux-arm-msm+bounces-76464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 334EABC62EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 19:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1650F189228A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 17:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640CE2C0288;
	Wed,  8 Oct 2025 17:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPnXhu5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF92BE655
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945865; cv=none; b=br2pk9i5fY/t39vM/gcT8NNnDGQ4DSkuxVCoH4JmzlKMASk7z9VZLQx4C/DBbF6DGVHNeNv5rAUCYpUwtuEPXIB5lD9qLOWpb9moX+FzJPQIqSLvu0IWCTC+4i3rYMgzbJtQtcxH3RMD2cjfDasOHAzSJWihS+rfHmCBVuAXD20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945865; c=relaxed/simple;
	bh=5zKR1u+5O6X6qT7L3XTDDpAJvDCMpie9d8WDsdi2TmY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=leVpoQJlhIlcKig6rBmfb5hoA4tRYZ5tz+x3oO9BEZhnI59F74Tz+qZrRTGcTec6EgmrCQIok7QKeP0onCrGcOD0PnQ8hI4Dorjf2WZARQ+41Asbmw0YrFtijYxaVQ3x9mBYwAeDVDX3uzioOaKA2YsxeGXXV4mPPdhTTa4w7Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPnXhu5B; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso1125925e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 10:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759945862; x=1760550662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMvlexrap1UfZtqdBkJ61xOQRQkYprF0LI3wVB2AJI8=;
        b=yPnXhu5B8ZNxvWTC727ZNrsXBKz8e/rti5l0G7Dsw206JjDYrDqmjzP6FTCh9lRFdh
         kM7FEmCVn84ZWCyUBx8i5BE2YXcam6/T/Fqf217tat/S++hW0c002cM1jxE5v5ffaPyb
         0F9wMk8OChp0FtzdkX8ZJG2bRMU7RfeOhCRzx8cfbO91vPWPcX/K/5kfNE6osZI78nnT
         54lbF/yeBuo+BepG+KF8BWmfxYemi6W2+OxnDohYAluaZ9EX05Olq+RG9Xogw5YzKlue
         47rMbOmX4BlMXMhuz/Tjb5AK0RPWjxo/qUBRRXBa8EXDAQj4HvEUaapWI4BD0orvjtxU
         0+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759945862; x=1760550662;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QMvlexrap1UfZtqdBkJ61xOQRQkYprF0LI3wVB2AJI8=;
        b=B9JNVoSDoi3bdXDzTSewU5isHf4BHQgt/1Qh0Nyv2cqZxtLgYzwiMRJab9syxP/ss3
         g8GMWY0+DqhkQkWW7ErzIz0pgqWh6WCXrV6rLvgWpISsHLjYaJMx2KTAA41tXz19WCLA
         IawD+q6duNnNmBITXAF5lmidJK4atDhgKo37mLFBl9OIxMqMHjDLYMtKKkXPf4N/9FtZ
         mPUbhaOfsDe2tT79sX/xIQpLYPJMmJVCjC/MfQCu05vrzYCzunphcu3siZ6MDj2paGGJ
         U3Tgm2/W2qdgqS9Xd92Jko5wSWBSclg3hamJsrUulvGrr6ihUidveCXZO4MkybGCXD4A
         8I2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnq5snSUt0Viv6ampAzdM4Yx/IDdux1Xg5+cFr0dc4TuRgHRoTtmplvxBod/RDRoMqrkWwnpzYceZLDMEd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/TNrQCM+e3JNQ67TtT31I8vJR8MbLuuxZI9CDLzuVEknqjMIQ
	7rqBBagY2kLejaycMUK3mwcXOX2Y/C96Q+tZcXo7WtMgW9ygt5O+0umZaQNVG3TRiQk=
X-Gm-Gg: ASbGncvOtlYRVoGwQ6t9JO89TZUbvtSg6S0JarBFjPKidfYLCekgd/byc/Erxv0fGYY
	/jKodGneKGQ0tydI1xuFe4nwbcqib+fyDbm7KFzU3rGg/WMi1st3dS2Y/ybn4cELMlTJvjnuJnR
	//jyNteGtcHuKrLKPATbOfEH199/8Jxu+EDzHUI3ivun2gB4CECd1zfAloz0r4r1Cs8giN08iDw
	KDIH3pNK/sB123hKHkeGtZrORgbq6Ve563lgqLsksFdbLLMrUIM0leUmI3Zt9LEnMK1GPiBbi+G
	EXdfBhJKfB13LCnH2olYQFh6KJ+ilMNwW+uWQFmuumVictKQnOFh5zje/OOUJeWEzHdf+VwUbfo
	3dBdmY9CIxUQ4nKn7s1SHyLrX92P0H6QKQJAlAHKMSOJNZcbPQRp8Nk8JiSh/r6g/umfwslMb6T
	oHDDLzbpmyPWICQs+t5vI=
X-Google-Smtp-Source: AGHT+IG7qpQnt1FsF9x3ySZnRp/NIaufnkQu3C1FxX1niEUSnihus2ASYwmcY3GOq7HcPld9Lp5UcA==
X-Received: by 2002:a05:600c:a104:b0:46e:4329:a4d1 with SMTP id 5b1f17b1804b1-46fa9a945abmr21089735e9.4.1759945861396;
        Wed, 08 Oct 2025 10:51:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b264:afbc:dee:3d? ([2a01:e0a:3d9:2080:b264:afbc:dee:3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab5250e8sm18983425e9.5.2025.10.08.10.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 10:51:01 -0700 (PDT)
Message-ID: <8ce94679-d6ec-4953-b430-24c493e318e2@linaro.org>
Date: Wed, 8 Oct 2025 19:51:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
 clocks
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
 <20251006-topic-sm8x50-next-hdk-i2s-v1-3-184b15a87e0a@linaro.org>
 <6492e444-4196-4900-a741-a74a8c506a6d@kernel.org>
 <1eab5200-1292-4d39-bdf8-0c5084cfaab9@linaro.org>
 <f15ea346-43f7-49bc-bd5e-47510a48892d@oss.qualcomm.com>
 <a5dfaf2a-d2c8-468a-9bbe-38d11b1214a8@linaro.org>
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
In-Reply-To: <a5dfaf2a-d2c8-468a-9bbe-38d11b1214a8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/7/25 17:48, Neil Armstrong wrote:
> On 10/7/25 12:23, Konrad Dybcio wrote:
>> On 10/7/25 9:02 AM, Neil Armstrong wrote:
>>> On 10/7/25 00:21, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 10/6/25 7:37 PM, Neil Armstrong wrote:
>>>>> Add support for getting the I2S clocks used for the MI2S
>>>>> interfaces, and enable/disable the clocks on the PCM
>>>>> startup and shutdown card callbacks.
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>
>> [...]
>>
>>>>> +static int sc8280xp_snd_startup(struct snd_pcm_substream *substream)
>>>>> +{
>>>>> +    unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>>>>> +    struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>>>> +    struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
>>>>> +    struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>>>> +    struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>>>>> +    int index;
>>>>> +
>>>>> +    switch (cpu_dai->id) {
>>>>> +    case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
>>>>> +    case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
>>>>> +        index = sc8280xp_snd_i2s_index(cpu_dai);
>>>>
>>>> What is the mclk and bitclk rate set here, we can not rely on the
>>>> default rate.
>>>
>>> The default rates are set in DT:
>>> +        assigned-clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>> +                  <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +        assigned-clock-rates = <1536000>,
>>> +                       <24576000>;
>>
>> Is there a way to infer these rates based on the DT audio
>> connection graph?
> 
> Good question, it's not done for pre-audioreach. Let me investigate.

OK so since we have fixed 48KHz stereo setup, we can hardcode those frequencies in the card...

FS is 512 and the MCLK / BCLK is 16, as standard so I can calculate those.

Will drop the DT rates and do it in the card.

Neil

> 
> Neil
> 
>>
>> Konrad
> 


