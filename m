Return-Path: <linux-arm-msm+bounces-66876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E38FB13D6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E2A169011
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A151E3DF2;
	Mon, 28 Jul 2025 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Skp28Z42"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C441C69
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753713706; cv=none; b=YcJuNicy89lqWxsw42gbUsEWRp9W4gQ376TfON9ETEN43LAwbJsVh6E9QKnq5IfthBPRgmnQwtiB16/PEKy25Qgmwm/sJyMi5dgIQY1Gte8JcjANKJMBfT6OMwYFArkXczu2gB/DdsAEpMtN4ht3lwrbzsnsNC62oVFpIg6ys5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753713706; c=relaxed/simple;
	bh=M/H6lCBVXPuWeNVFqGZWZn59+5BhoW70J9OBsYG5CbY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qkt0+3QMUo7fFVip/N7JB2Qowme1oZS78aEdJmFXX2oQhmqBAgsLfnXC60SylrHmWT2hp4+UfEvuuU5OUoGHC4Cd8RRgLVGG+LhXtXFY9DQQogNi6MXn6iNvtKDSQe78lvp43oMj93yGpiJZhuC7+CGBj3frchuuo+7oYWw2G2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Skp28Z42; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b7823559a5so939138f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 07:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753713703; x=1754318503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qO9rislSQFIwluOt7E5h1r2iem3vuZ96lsMt6UMcTQ=;
        b=Skp28Z42XLZ1avuGymdBKWBZx8SoMRdir1sZsKgSKEJicMjt0LRCA781J7OQmD2f+H
         u5vZMlFsy57dfHhxcGPQaNjxWjoweS0Li42QZx6Uca7/x8wSUKY3uBLM6R35n+AfceEV
         PEgob01UdcSKjbuy2PUBO3jnQlwCyEzVka1NSWdpWUVKw9RwISgT2IZo5A1sa7hc6LZ7
         Reapw9qfOkUzIO4U/bwgkuaG2Epbrx4fZ9N93kxo9bTNqplwJlOl5f5U2y7iIfnj41p/
         lZ1wIJkJJvQiFRXrn4CaEmTjo1eCC9Mldany5qzhRoiyp7lzceCubAFP9k9Xfom7PxkC
         oHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753713703; x=1754318503;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1qO9rislSQFIwluOt7E5h1r2iem3vuZ96lsMt6UMcTQ=;
        b=kAVW/VIYAm9IdmlAXJraw78VFp/XC8wx5Q6NnShoek9/ZlaCo9uSFbnVwKgBv8vDJP
         nzLIQfG87Qzx/isY2R+Tw7ZOvtCJs/4TqxrCnVtC6V3c/sla+KbIX4wLZXTtX9bbnITj
         8fRHvRUJwRE3fYHmTJ8gZk9i8c7VmUtjj3Zh8wakZxLwrgoJDUYlvxvyiAys4O4NYKWP
         QTBFGKQ13uAqmscchAsdpdM/Vz4pagPlOPIx8V+affxiYol0elK8iI2oCOrA0ibZEW2e
         +0rqJut/TwyZMDVlZMYNsp0Pv302yblE/I5iXz7N9WMdxG31JlaentmAEVNxZcN3SpQd
         OvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrp1BR+wS4ilocH4UjO4IFFbrQ09bDB/vGcfyDyGaFJ20O1mKjWXn9SdFw+kGRV7q8cC2JX5V436Z2JMb8@vger.kernel.org
X-Gm-Message-State: AOJu0YzU7l4Uhs9Ky0WEwCvMeKIcIQbcvh66y8ZaH0IooJkUNezL5wbC
	vLn1GSldJM07yLMzCareSEymJJiDmL4KoHQVa/sb1CXIHMUn3A+/6OiYjTdqpllYSVg=
X-Gm-Gg: ASbGncuhsj32dBgO3GwNepPRKHQpTM7ObGEHpsuUIKzLuXGTbZePAaB8/SV0oOeprk2
	56su4fe+425zvluTcZX2J2pUQXHJbNv8VfFkD7tu8i8vZ+CrPycidPOfFc5+Ll6Bm1fPhRg7mQd
	JYfQcKhOCji01kktfoR/IK9yDVqTsg6GsMc9u3v+GZ97X/woiA1MkaOOmwxAQgE3jbSKlOlnUrz
	brZ1R+5dYINg0VwyVHTOxj8BGK+g6vk8MEZsNCOMOieNK/MO2XEnxBNwyerp2vc6fNC14p6wB3p
	e7Ow+a9zJyj9i4KyaY3Xi9+vkRd7EgRCftQobTWjzxfudTADse29347DKkBvBBHtNETMXyGT7Ld
	HOSLXI7O4/kmj4Tj8wVyf6o+nF6Yeq2+/NFQbfUpnQ0D0t+c84pCKhjJixwjpV0BOsF0t89JolC
	I=
X-Google-Smtp-Source: AGHT+IFng4T0hStZzkamH3DtOc0H1/Sv2je6rSBEmc8c5iAV8VKtuyLNfkdChCIgYH081RXPy8BAgg==
X-Received: by 2002:a05:6000:1889:b0:3b3:9c75:acc6 with SMTP id ffacd0b85a97d-3b77678cc87mr8263507f8f.59.1753713703036;
        Mon, 28 Jul 2025 07:41:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9019:46ec:c6f1:c165? ([2a01:e0a:3d9:2080:9019:46ec:c6f1:c165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a43asm1720426f8f.34.2025.07.28.07.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:41:42 -0700 (PDT)
Message-ID: <754d5c83-ba83-40d2-9309-8eafcb885b9f@linaro.org>
Date: Mon, 28 Jul 2025 16:41:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] scsi: ufs: core: move some irq handling back to hardirq
 (with time limit)
To: Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 quic_nitirawa@quicinc.com
References: <20250724-ufshcd-hardirq-v1-1-6398a52f8f02@linaro.org>
 <f2b85e49152b80a63b20aa5ad67dfbee1190e356.camel@linaro.org>
 <53bfd619-4066-4dcb-b3f0-d04177e05355@linaro.org>
 <766fa03c4a9a2667c8c279be932945affb798af0.camel@linaro.org>
 <4enen7mopxtx4ijl5qyrd2gnxvv3kygtlnhxpr64egckpvkja4@hjli25ndhxwc>
 <cvh6t2hy2tvoz4tnokterj6mkdgk5pug7evplux3kuigs4j5mo@s46f32cusvsx>
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
In-Reply-To: <cvh6t2hy2tvoz4tnokterj6mkdgk5pug7evplux3kuigs4j5mo@s46f32cusvsx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/07/2025 16:39, Manivannan Sadhasivam wrote:
> On Mon, Jul 28, 2025 at 08:06:21PM GMT, Manivannan Sadhasivam wrote:
>> + Nitin
>>
> 
> Really added Nitin now.

BTW what about MCQ on SM8650 ? it's probably the real fix here...

Neil

> 
>> On Thu, Jul 24, 2025 at 02:38:30PM GMT, André Draszik wrote:
>>> On Thu, 2025-07-24 at 13:54 +0200, Neil Armstrong wrote:
>>>> On 24/07/2025 13:44, André Draszik wrote:
>>>>> On Thu, 2025-07-24 at 10:54 +0100, André Draszik wrote:
>>>>>> fio results on Pixel 6:
>>>>>>     read / 1 job     original    after    this commit
>>>>>>       min IOPS        4,653.60   2,704.40    3,902.80
>>>>>>       max IOPS        6,151.80   4,847.60    6,103.40
>>>>>>       avg IOPS        5,488.82   4,226.61    5,314.89
>>>>>>       cpu % usr           1.85       1.72        1.97
>>>>>>       cpu % sys          32.46      28.88       33.29
>>>>>>       bw MB/s            21.46      16.50       20.76
>>>>>>
>>>>>>     read / 8 jobs    original    after    this commit
>>>>>>       min IOPS       18,207.80  11,323.00   17,911.80
>>>>>>       max IOPS       25,535.80  14,477.40   24,373.60
>>>>>>       avg IOPS       22,529.93  13,325.59   21,868.85
>>>>>>       cpu % usr           1.70       1.41        1.67
>>>>>>       cpu % sys          27.89      21.85       27.23
>>>>>>       bw MB/s            88.10      52.10       84.48
>>>>>>
>>>>>>     write / 1 job    original    after    this commit
>>>>>>       min IOPS        6,524.20   3,136.00    5,988.40
>>>>>>       max IOPS        7,303.60   5,144.40    7,232.40
>>>>>>       avg IOPS        7,169.80   4,608.29    7,014.66
>>>>>>       cpu % usr           2.29       2.34        2.23
>>>>>>       cpu % sys          41.91      39.34       42.48
>>>>>>       bw MB/s            28.02      18.00       27.42
>>>>>>
>>>>>>     write / 8 jobs   original    after    this commit
>>>>>>       min IOPS       12,685.40  13,783.00   12,622.40
>>>>>>       max IOPS       30,814.20  22,122.00   29,636.00
>>>>>>       avg IOPS       21,539.04  18,552.63   21,134.65
>>>>>>       cpu % usr           2.08       1.61        2.07
>>>>>>       cpu % sys          30.86      23.88       30.64
>>>>>>       bw MB/s            84.18      72.54       82.62
>>>>>
>>>>> Given the severe performance drop introduced by the culprit
>>>>> commit, it might make sense to instead just revert it for
>>>>> 6.16 now, while this patch here can mature and be properly
>>>>> reviewed. At least then 6.16 will not have any performance
>>>>> regression of such a scale.
>>>>
>>>> The original change was designed to stop the interrupt handler
>>>> to starve the system and create display artifact and cause
>>>> timeouts on system controller submission. While imperfect,
>>>> it would require some fine tuning for smaller controllers
>>>> like on the Pixel 6 that when less queues.
>>>
>>> Well, the patch has solved one problem by creating another problem.
>>> I don't think that's how things are normally done. A 40% bandwidth
>>> and IOPS drop is not negligible.
>>>
>>> And while I am referencing Pixel 6 above as it's the only device
>>> I have available to test, I suspect all < v4 controllers / devices
>>> are affected in a similar way, given the nature of the change.
>>>
>>
>> IMO we should just revert the offending commit for 6.16 and see how to properly
>> implement it in the next release. Even with this series, we are not on par with
>> the original IOPS, which is bad for everyone.
>>
>> - Mani
>>
>> -- 
>> மணிவண்ணன் சதாசிவம்
> 


