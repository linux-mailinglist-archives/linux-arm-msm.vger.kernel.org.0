Return-Path: <linux-arm-msm+bounces-76706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FA6BC9CD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 17:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA95B1A62A40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 15:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FE117BEBF;
	Thu,  9 Oct 2025 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xb5Z2aEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48E1EFF8B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 15:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023823; cv=none; b=rtA9bWKpIvDvKT7WQKVMgNsYasF5SgFj4DbE8ENoDaz8+f6UjHGi996lBJYo1wCqFuFOZ/pk7xaOWthfQegl1nC3ot5Vl/au6mXMsuvbc5YUltxJeD78HL6Zeh+2dtzYlvzmuvfWYxh49zfenO2YUyo+dB+B2lIuSAyzjyIvj1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023823; c=relaxed/simple;
	bh=thfHYurlbthid+DZICCyxI6F4AVTKLfU3gbgDUaAuE4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L+LcTmWqdKysw6xxfw2+jgsKWCddH9npHutrdedf1MGbCZegDvvH9cyq0xY8jaUW6Qebofv0h53filg5/TxOoW8e3mNNP1Vb0jIPnq4GP/TxPQZoqWYYqPU5gXCxg3uCOB8abgs5MX/QF5/PEIGx5aQiNSYt2FVm7bKrYJUQfN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xb5Z2aEK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so944636f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 08:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023820; x=1760628620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaR01KCIJ6ZP9VbmR0WJ2PYnA5mouv06D/TKethyhUs=;
        b=Xb5Z2aEKjlXsmdsR58qfnERrIlUFXOJN7uFfsCa102xCRmjkoMKe9/93S9zATibQcP
         KD+HMllAOQfPHb8v0iZ7i4JpqxM4XfoOpkoFBJ+KhB9+pEfIwabjGSz8SfqI+yQPPZrr
         eMjEhlZ73GH79EovoqmwiqADvgy0u46Vo0YNXmONSPoiieWv0jms5dcxIdMuPKqvWUvG
         j5jzic543or4d9zsVfoUp2R73s2MLFUxcfF5wQ/y1laQKpIhVlOCmC9gU1AeMLdq6TPn
         Fwg5hF1B60dgjJah23WguqIsupr3qq/iSRdKGgKmswLCqcPbd5aGkMY1TP5bXL5kspKh
         qyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023820; x=1760628620;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JaR01KCIJ6ZP9VbmR0WJ2PYnA5mouv06D/TKethyhUs=;
        b=nCAVVNt/9YXoW5OQmnXcbK0qsi6LmxvQvzZPHq8i1DAQ0E562XeHWfxL4b+URzeNiW
         xrbz7rDS8HBcHboARVN13OvkR5fM5CUuIRuaKYHHAYI5Az1wICdjb5xXmmtUiQnRxPcJ
         ECM1PaPWirpLNhvNcO2YQbwdyr/waJ1WtKNPy5fY19MnoKhTNsyrhY8/lrXU3C1Rnh4R
         DCQXNdO3PO8mBxwSv4RtimC0PBhAym0f1R1LuTUHD4Fif07MVg0kP4xDApDFF7os9WEd
         Q/7lmwIdPiaT+tWKI2pQk82kZ0S2YqHWkolV0HUCaCruZ7SbzMRdFyE022Bviny4aZHE
         OEoA==
X-Forwarded-Encrypted: i=1; AJvYcCWJQZu59814h4KSF7fRoNiskYN2ARPRFGkQGi/F8smRtyU8ZZ7tir1VSTaiuDfLN11Qw3cRBFyx+3TD8RD+@vger.kernel.org
X-Gm-Message-State: AOJu0YxTS3N/rNHYcMkNmDNtiaWsI8eIZRfxZdgVaxiB3WCdusMvah+B
	VE7FrgkVfud5InE09WXM2dd7jiifWUs5/BqTbysa08n0Wajal4RYbSZyyhndAPW5Q0Q=
X-Gm-Gg: ASbGncvYs96zEDV2Fp4kH8tcbAHMtjIJk1DK4ykhVSFCkZ4a/syURfNpIFU5YHZG840
	CNk9X/83j59RHjZycxYpNx7D4CcSsjl7tVyqjXwPNHuI1+6Rjktf4KJyrohyLAzaxWinb+MNe0f
	7J/x6DJ+nWKawEMXioSsXhfAt10+ns/9xXOqXmIqS0Wj+XESEH6rM7DyVT6+sngZmB2BepEA7vf
	zxUfk5jdT6gSA+ZEzDZpvDB120oQFGQl3S5VhwA512Zx7yo2o0jdlV21dEU8KKJ5JzBcCjvIeUa
	BzmI7FLpjIbyi+ljwvCZ8ybczjifVosFKBflC1KpxnsNscy9FDOep2kLdW19H4mZH+qPuQAiji+
	2mthaNl+9YLaItMRfTiXd5Z5OSVyySrXuwHwxi6u0PEdHT/OCjNAASp43V8mIZjhyG5o8h8dYYM
	8oNG5+5UkvaLtQM3T/bIYl9dJYp3I=
X-Google-Smtp-Source: AGHT+IHpP6w5GzvbXXFlvKAAQxHUSfL37e1hWvT3bz8kbu7/7Pa0mGOtryXuWMnczjfJlf1h6yPGeg==
X-Received: by 2002:a05:6000:40dc:b0:3ce:f0a5:d594 with SMTP id ffacd0b85a97d-42666ab297amr5168972f8f.13.1760023819556;
        Thu, 09 Oct 2025 08:30:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7a0c:da2f:6591:67ee? ([2a01:e0a:3d9:2080:7a0c:da2f:6591:67ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9762sm35723226f8f.38.2025.10.09.08.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 08:30:19 -0700 (PDT)
Message-ID: <4c5dc916-ea7a-4d73-b509-49f82ff36666@linaro.org>
Date: Thu, 9 Oct 2025 17:30:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v2 2/6] ASoC: dt-bindings: qcom,sm8250: Add clocks
 properties for I2S
To: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
 <20251008-topic-sm8x50-next-hdk-i2s-v2-2-6b7d38d4ad5e@linaro.org>
 <44606de8-3446-472f-aa6b-25ff8b76e0ec@kernel.org>
 <3620feb6-12bf-48c1-b47a-ccb486e5b5de@linaro.org>
 <c0b71974-65df-47ad-902b-45c2dbe66be0@kernel.org>
 <f27cad88-b1fd-41a3-bdb1-b07de3dea8a2@linaro.org>
 <b614913e-7ebf-4abe-9eb5-f41b81d91ad3@kernel.org>
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
In-Reply-To: <b614913e-7ebf-4abe-9eb5-f41b81d91ad3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/9/25 16:29, Srinivas Kandagatla wrote:
> 
> 
> On 10/9/25 3:25 PM, Neil Armstrong wrote:
>> On 10/9/25 16:06, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 10/9/25 3:03 PM, Neil Armstrong wrote:
>>>> On 10/9/25 15:36, Srinivas Kandagatla wrote:
>>>>>
>>>>>
>>>>> On 10/8/25 7:56 PM, Neil Armstrong wrote:
>>>>>> In order to describe the block and master clock of each I2S bus, add
>>>>>> the first 5 I2S busses clock entries.
>>>>>>
>>>>>> The names (primary, secondary, tertiarty, quaternary, quinary, senary)
>>>>>> uses the LPASS clock naming which were used for a long time on
>>>>>> Qualcomm
>>>>>> LPASS firmware interfaces.
>>>>>>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>>     .../devicetree/bindings/sound/qcom,sm8250.yaml      | 21 ++++++++++
>>>>>> +++++++++++
>>>>>>     1 file changed, 21 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>>> b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>>> index
>>>>>> 8ac91625dce5ccba5c5f31748c36296b12fac1a6..d1420d138b7ed8152aa53769c4d495e1674275e6 100644
>>>>>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>>> @@ -64,6 +64,27 @@ properties:
>>>>>>         $ref: /schemas/types.yaml#/definitions/string
>>>>>>         description: User visible long sound card name
>>>>>>     +  clocks:
>>>>>> +    minItems: 2
>>>>>> +    maxItems: 12
>>>>>> +
>>>>>> +  clock-names:
>>>>>> +    minItems: 2
>>>>>> +    items:
>>>>>> +      # mclk is the I2S Master Clock, mi2s the I2S Bit Clock
>>>>>> +      - const: primary-mi2s
>>>>>> +      - const: primary-mclk
>>>>>> +      - const: secondary-mi2s
>>>>>> +      - const: secondary-mclk
>>>>>> +      - const: tertiary-mi2s
>>>>>> +      - const: tertiary-mclk
>>>>>> +      - const: quaternary-mi2s
>>>>>> +      - const: quaternary-mclk
>>>>>> +      - const: quinary-mi2s
>>>>>> +      - const: quinary-mclk
>>>>>> +      - const: senary-mi2s
>>>>>> +      - const: senary-mclk
>>>>>> +
>>>>>
>>>>> I don't this is correct way to handling bitclk and mclks for I2S, these
>>>>> are normally handled as part of snd_soc_dai_set_sysclk() transparently
>>>>> without need of any device tree description.
>>>>>
>>>>> Also doing this way is an issue as this is going to break existing
>>>>> Elite
>>>>> based platforms, and the device description should not change across
>>>>> these both audio firmwares.
>>>>
>>>> This is only for AudioReach platforms, on those platforms the
>>>> clocks are registered in DT and are not accessible by the card.
>>>>
>>> Clocks will be acessable via snd_soc_dai_set_sysclk ->
>>> q6prm_set_lpass_clock once set_sysclk support is added to q6apm-lpass
>>> i2s dai ops.
>>>
>>>
>>>> Device description is obviously different for the AudioReach platforms.
>>>
>>> Why should it be different, its same device.
>>> We have platforms that use both Elite and Audioreach.
>>
>> I'm perfectly aware of that, it's the case for sc7280/qcm6490. And I agree
>> the card bindings is the same, but it doesn't mean the DSP elements are the
>> same and uses in the same manner.
>>
>> So let's forget the bindings and forget those clocks entries, and imagine
>> I'll implement those _sys_sysclk calls like for the Elite platforms.
>> This means I'll bypass the clock framework by directly setting the PRM
>> clocks, this is clearly a layer violation.
> 
> You can claim clocks in the dsp layer (q6apm-lpass-dais) instead of
> claiming it in machine layer, it does not necessarily have to bypass the
> clk framework.

The current q6afe implementation totally bypasses the clock framework:

static int q6afe_set_lpass_clock_v2(struct q6afe_port *port,
				 struct afe_clk_set *cfg)
{
	return q6afe_port_set_param(port, cfg, AFE_PARAM_ID_CLOCK_SET,
				    AFE_MODULE_CLOCK_SET, sizeof(*cfg));
}

I have no time right now to implement all that for q6apm & q6prm in the
way you propose, so I'll probably not send a new version.

Neil

> 
> --srini
>>
>> Neil
>>
>>>
>>> --srini
>>>>
>>>> Neil
>>>>
>>>>>
>>>>> thanks,
>>>>> Srini
>>>>>
>>>>>>     patternProperties:
>>>>>>       ".*-dai-link$":
>>>>>>         description:
>>>>>>
>>>>>
>>>>
>>>
>>
> 


