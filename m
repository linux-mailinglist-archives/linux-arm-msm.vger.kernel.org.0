Return-Path: <linux-arm-msm+bounces-56240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83916AA4983
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C12816E455
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E9A2192E3;
	Wed, 30 Apr 2025 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oRvVvbmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC3F258CC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 11:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746011262; cv=none; b=kJKWkzQObtqTBoiOGqLcY8lSkzNRePGJ+wzWgNS3s4JUd/cAJxCYl5RRdwiL1PDCCHGR0AG2L6+oAdV1adv7eUshiuSDK6xX5VyJ/eu6KR9zgu7elTOsrJEyDK9WwlDWKK4uQUDEjPUSSXerpDBG+7Z7ZWx/wEdF0oF5xpBS1vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746011262; c=relaxed/simple;
	bh=lcEFE4OIoe3/fFqDm7SgobfSfBzma2NbXfJRuUbbcdI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fqwo2LtdnCIpHsnLzNvufSfJ6YHs9nm6fpQMnq4CFKjA/cort/9E8wY0QKtUa3TGc7/ijG3GqP1gVMHlgE4K8oRErTR0lASGhl4VWuFcHttLnuLj/R8tMeIustNrUAKsUd4WFVQ+6vzf+zxuBykRO9KFQ3vRhpgUf0Z4UWXXTSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oRvVvbmM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so64206295e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 04:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746011258; x=1746616058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXOPLVrgIu7sic8DlJPfVPajfGRhXATZ7sT0XnoyCEc=;
        b=oRvVvbmMwYsyVrrCqbLuoXauIXcwkPjduQv1YinsFEAeGXyowx7BkwmouThmRIBK42
         ZxOcjfryBG9+jpUcSwNn6rgL51gITbsmbGLLP81lwY0FwBduMngJu976/eaRkKvI/B1V
         MYOuVymXs3H2CHYJeN+pQqZGSB5ACO9AleB/mAfZPsVFD4WXrXxmvNHdXNBoYMfTxIKh
         lYxTcDo/N/0ugjkBHT9uLZDfuZVPoQkemuJWv9a4i2ZlAO4jUIKHZ6sEqbZ+HByocrUH
         6S+pcDND5MK8aGb1HuQZGCp7WpdgGnC6OJnIjLEUVm1DtjTQXxRgqhxpsYJFlLInEp/I
         Qmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746011258; x=1746616058;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MXOPLVrgIu7sic8DlJPfVPajfGRhXATZ7sT0XnoyCEc=;
        b=ZAAx4vWjgk37dZRYgC/bcRkDYpbniJIYg7PqHfSHqmB5eIxF40T6FAdAOf/jH0OLGv
         9rVgJd350nau1i0GFiEy3aB55mUxeryiJ0TbOKUor0xapBlgB2eti+IxK6TgFEjNwzRy
         gtBto3vWHzn4/fTHQS43LPOvRnBXtBmN3ew9Zx13n+Tca498UoFKObTP5ZYco5ZnUDVj
         zjk1t/7gBJs8qdvdk4E+XCei201Og2EsiC65kdqQFNdwWbL0GsuzdOFfncy4oQyTpWXK
         WWhL9dnPNsnC5LuG9oLMKKgxCJoUX8yZUcIon39ahy5WWOQ6y1mwfDgcT77LoXVMB/KC
         tfCA==
X-Gm-Message-State: AOJu0YyPfiu6JsUi7L04uSchZNMl5683/M/9SprPh7jNxSzI9gr9he7Q
	Z/JO399SH1g/DNvGyFwqfVVvXHb4Bpcs1Q9jtRK1Us+S4ft/O68iAaN57n3Ws9g=
X-Gm-Gg: ASbGncuJ7RF7XDica324Tsvpg+mAjBswEQqwrf/d5H/2FTrQjCkROA4ziGmdhYNhgNf
	s5Ro1q1dkeuUqKZqYshS95mfBXxVFLdEEXfT8lwdCxgvnQ/2FItVfbjKOqAAn+gwRQR6x6XDO3B
	Mlgl39yYeBRp2aaE1ugPn/sqfBypiy+RYPQ24urhokusplzhiMAdoikOXDLHgxbUjzEjLM3NKAg
	Ob1r0fvQyhMNNl6dfafxL7SoqRxRhxrM3web27fjPPIV17DJUY5TqJAP4ARozgMq7Tkvfm6AWwC
	H2BMZ4oNYbZgu/CnBBbisT/BbhYlfgiyioZQ31/cb8f8ciAOyVJN5Ftm2NhdtELnvv269a+GnLe
	kQ8acIF4mFxwbSljMFQ==
X-Google-Smtp-Source: AGHT+IFsU8Bb5sXDiNkHEQN1sAf/uBf7iF62N5QejPb09MdzFFptJPMJvktv1k8+UWjYrzljXkouJg==
X-Received: by 2002:a05:6000:2284:b0:399:71d4:a9 with SMTP id ffacd0b85a97d-3a08f7d456dmr2453071f8f.52.1746011257957;
        Wed, 30 Apr 2025 04:07:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3d6:213c:5c50:7785? ([2a01:e0a:3d9:2080:b3d6:213c:5c50:7785])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc1842sm16935751f8f.54.2025.04.30.04.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 04:07:37 -0700 (PDT)
Message-ID: <877daf2a-9aaa-4501-a630-77643d2393bb@linaro.org>
Date: Wed, 30 Apr 2025 13:07:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-2-50133a0ec35f@linaro.org>
 <dd271e8c-e430-4e6d-88ca-95eabe61ce94@oss.qualcomm.com>
 <e61e17ca-fed7-4712-96fc-a9a2339de1fb@linaro.org>
 <9b6c5f67-0bbc-490f-9982-4e28218aa6eb@oss.qualcomm.com>
 <0e007f7f-d9ff-4b2d-914d-ad62b9983bba@linaro.org>
 <3a29e34c-d286-4673-adac-1fd8627c3eff@oss.qualcomm.com>
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
In-Reply-To: <3a29e34c-d286-4673-adac-1fd8627c3eff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2025 12:48, Konrad Dybcio wrote:
> On 4/30/25 8:19 AM, Krzysztof Kozlowski wrote:
>> On 29/04/2025 21:11, Konrad Dybcio wrote:
>>> On 4/28/25 4:41 PM, Krzysztof Kozlowski wrote:
>>>> On 25/04/2025 11:30, Konrad Dybcio wrote:
>>>>> On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
>>>>>> Add device nodes for most of the sound support - WSA883x smart speakers,
>>>>>> WCD9395 audio codec (headset) and sound card - which allows sound
>>>>>> playback via speakers and recording via DMIC microphones.  Changes bring
>>>>>> necessary foundation for headset playback/recording via USB, but that
>>>>>> part is not yet ready.
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +	sound {
>>>>>> +		compatible = "qcom,sm8750-sndcard", "qcom,sm8450-sndcard";
>>>>>> +		model = "SM8750-MTP";
>>>>>> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>>>>>> +				"SpkrRight IN", "WSA_SPK2 OUT",
>>>>>> +				"IN1_HPHL", "HPHL_OUT",
>>>>>> +				"IN2_HPHR", "HPHR_OUT",
>>>>>> +				"AMIC2", "MIC BIAS2",
>>>>>> +				"VA DMIC0", "MIC BIAS3", /* MIC4 on schematics */
>>>>>> +				"VA DMIC1", "MIC BIAS3", /* MIC1 on schematics */
>>>>>
>>>>> Is this a mistake in what the codec driver exposes, or just a fumble
>>>>> in numbering $somewhere?
>>>>
>>>> Which mistake? MIC4? Schematics call name things differently. They
>>>> always were, so to make it clear for people without schematics I wrote
>>>> which MIC it actually is.
>>>
>>> I'm not sure how to parse your response
>>>
>>> are you saying that there are MIC[0..4] that are/may be connected
>>> to different codec ports, and that the MIC4/1 lines are plumbed to
>>> VA DMIC0/1 respectively?
>>
>> Yes, as always. Nothing weird here.
>>
>>>
>>> I think I got confused about the MIC BIAS3 going to both and none
>>
>> What is both and none?
> 
> missing Oxford comma I suppose.. MIC BIAS3 goes to both MIC4 and MIC1
> and neither of them has a '3' in the name. I was wondering whether
> that's intentional.
> 
>>
>>> matching the index, but perhaps that's just because it comes from
>>> the WCD (which is the third piece of hw involved beyond VA and the
>>> mic itself)
>>
>> Again, what is the mistake you are pointing here?
> 
> I'm not necessarily saying this is a mistake, just thinking out loud
> how I understand the non-obvious plumbing
> 
> [...]
> 
>>>>>> +		/*
>>>>>> +		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
>>>>>> +		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
>>>>>> +		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
>>>>>> +		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
>>>>>> +		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
>>>>>> +		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
>>>>>> +		 */
>>>>>> +		qcom,rx-port-mapping = <1 2 3 4 5 9>;
>>>>>
>>>>> Does this deserve some dt-bindings constants?
>>>>
>>>> No, because these are hardware details/constants. Drivers do not use them.
>>>
>>> I'd argue it makes sense here - it makes more sense to pass meaningfully
>>> named constants to the driver, rather than blobs with a comment
>>
>> Sense of what? You want to make it a binding then answer what does it
>> bind, what part of ABI for driver is here a binding (answer none:
>> because driver does not use it)?
> 
> Sense of the magic numbers that otherwise require a comment.

There's no magic numbers, index of qcom,rx-port-mapping is the RX port,
value is the SWR1 port index. As the property name says, it maps RX ports.

The comment is here to understand why we map as-is, and what the ports are
used for, but for the soundwire perspective only the numbers matters.

> 
> dt-bindings don't exclusively contain enums-turned-defines that are
> indices of C arrays - some contain various forms of hardware ABI, be
> it register addresses, or names for magic values
> 
> Konrad
> 


