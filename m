Return-Path: <linux-arm-msm+bounces-47518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2512A3051E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CDC01882982
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 08:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042D81EBA14;
	Tue, 11 Feb 2025 08:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wlbj+/SH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E041EE006
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260958; cv=none; b=hEtrL3fpvtTfQdNJXrYPbUp5veWUYTeIsEDPgoVNekI8cNuEVDxPZnDZWQ7zAUGc0EzsJwbp7nLj0/i/gE8LgTsqmdaiQFbTRddvSSY9cHvAY8xAEDO107zvnkjAoaYbhIRmWhv+IF44gFKvDa/H1rakqwsNIGMOtEdr1zqzcJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260958; c=relaxed/simple;
	bh=G2Tj9U2QiygRFzai8G0V4PjrO9yxyYWRAy6UkUB0z3c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FhtF6l4XC4kSfBBvgHE/WwN/tKy8phei1mKc1BeSjxuanz5JHCNnn9lYghq+2s7WIJK5c0MbUAmrYo3QTQ+F3CJh89tug/3jIQ7934YYr3EQTSIkuFhHsAJYH4HJkIBdZLWTQKH5G7eRbTMvdQiiHkhrph/Sueel2qQf4NfYcaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wlbj+/SH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso1929820f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 00:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739260955; x=1739865755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/81V9ZSf9NBLsXDXid4XV/IytyYCIsEGvu0bzqqXvI=;
        b=Wlbj+/SHFjOcNUi2nHgIwgZsJdEhWKe2/+nAHTLG4zbGkC5/2L+2dSJo0cA6YP5oqS
         Wsd3z6Y9YOLtRQb5aU1vx/UsvyKfTDfGQCsIv+eGkfWJ3esjTK4BPpAp+uKsAlNFTaCI
         ZaCrcDVFZEI8c1ZzELE72eb/OL6OjPC/q2rSp0OILFoS6QHwn3HZbWBKjI/8R1tCVoFM
         zdYIXgM68R+8iaZJdM/7tAoNkdZfM0AZADTlOk2EE9jkkk8Ptl3JbJYpCZ6sRzDVZ2v9
         gY8UWlQMci/XEfcaL5bwexYQ135/hgl7GExrOlRa/c7E4BTxnQ4JlFqxT7GHgoInas6T
         s+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739260955; x=1739865755;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c/81V9ZSf9NBLsXDXid4XV/IytyYCIsEGvu0bzqqXvI=;
        b=C9MkdpuzXse+4fx4NsuWx9y+tJHIQ/6RaAqhuna86+jjokVDN8/yIqkJtggykv7dp5
         IbzJL/XtnavJ+Sizh0Hp71SkJCLmkgjNgDaIlfcrQbuROY4YsKLkesAPmht7tFWc8cv2
         K6ubmP/vRWzh7VGA59+vLu6KyrELUV90qzL15RyrU+nZWSXGlEyiTIcLpiNVZZwPb6bW
         +dpnVywo+cxPAXT5n2HQsnRrpoHz334XE5/ciTQyz3QTh5B9NDyRrNcuRmZCFc74t1I8
         MXCt3JfkMTmSNbzA3a9XdkMtXyDY1MTXO1R3Sv7B+H02jDm/Rj0/AnRqSt/NFb6tIeuB
         AUUA==
X-Gm-Message-State: AOJu0YxWpEClxFPiVT2VstSs4fgRU338tqFjefmFgyUXUUzUW+Tsg8W/
	6bMh44dkj6m05/OSPCXNnzsCxTReWGIDB5k096zgMrYNYelHN7HpCpj9eUFRi9c=
X-Gm-Gg: ASbGncu5ufYZELa4uLE3hM9WMjDaEcsc4SlQ75cTyvLX64yLXvK+G65/aayjD4qzfqB
	wn4qnIFziBY2pY2fl8JlKqjTixlSdQD+zB2PaWmojPtjvwL3NA4NgF0T2WmO1/g0T4Y8ZfbJ8Ml
	dX9/jHZOLsQCpKZlFouLmO56VY2Qm3Y+zaEgIvS1FIbfuFazOHQiyI3x8SsqPgmtQTyMacXyLjY
	8biNC2fWkhBK0orFmLsLCR+E4HU+ogmxeRNOgeH8zA7FTjotzZg+cXpOJdmCPYK96+2SmvSUD+p
	N0dbFb/J1fAb3oApFVs5gifN3mfsFipD89y3nFYf68BLfM0FLGdGo1NPTim+xfq15dpx
X-Google-Smtp-Source: AGHT+IE80X4KXV0Nc5thndKYShw6pJWnP0kJtdeefzpyYP2qRDRRq+UXoGPKVEz1U/KhRoWLReibgQ==
X-Received: by 2002:a05:6000:1f84:b0:38d:af14:cb1 with SMTP id ffacd0b85a97d-38dc93548f2mr14711590f8f.54.1739260955171;
        Tue, 11 Feb 2025 00:02:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b96:57e9:d7dc:bc01? ([2a01:e0a:982:cbb0:5b96:57e9:d7dc:bc01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd6548b25sm8158077f8f.32.2025.02.11.00.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:02:34 -0800 (PST)
Message-ID: <36ba4696-1af2-49e7-90bf-f6f559b76fb7@linaro.org>
Date: Tue, 11 Feb 2025 09:02:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: add PPI interrupt
 partitions for the ARM PMUs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-2-dd3ba17b3eea@linaro.org>
 <ba546075-cfc0-4b17-9129-f99054e2e1ae@oss.qualcomm.com>
 <6aa71142-3b1d-476f-9c78-1207fbbed3f5@linaro.org>
 <bbbd36a1-d67c-404c-b749-eefcf493ed7f@oss.qualcomm.com>
 <a2fbae9e-d1cc-44a7-86b7-9e15aa0490b1@linaro.org>
 <21f7eb11-bb0d-4e4d-a4b1-780c03fb86d9@oss.qualcomm.com>
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
In-Reply-To: <21f7eb11-bb0d-4e4d-a4b1-780c03fb86d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/02/2025 19:29, Konrad Dybcio wrote:
> On 10.02.2025 4:30 PM, neil.armstrong@linaro.org wrote:
>> On 10/02/2025 16:23, Konrad Dybcio wrote:
>>> On 9.02.2025 3:44 PM, Neil Armstrong wrote:
>>>> On 07/02/2025 21:30, Konrad Dybcio wrote:
>>>>> On 7.02.2025 11:31 AM, Neil Armstrong wrote:
>>>>>> The PMUs shares the same per-cpu (PPI) interrupt, so declare the proper
>>>>>> interrupt partition maps and use the 4th interrupt cell to pass the
>>>>>> partition phandle for each ARM PMU node.
>>>>>>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>
>>>>>> @@ -5309,6 +5309,20 @@ intc: interrupt-controller@17100000 {
>>>>>>                 #size-cells = <2>;
>>>>>>                 ranges;
>>>>>>     +            ppi-partitions {
>>>>>> +                ppi_cluster0: interrupt-partition-0 {
>>>>>> +                    affinity = <&cpu0 &cpu1>;
>>>>>> +                };
>>>>>> +
>>>>>> +                ppi_cluster1: interrupt-partition-1 {
>>>>>> +                    affinity = <&cpu2 &cpu3 &cpu4 &cpu5 &cpu6>;
>>>>>> +                };
>>>>>> +
>>>>>> +                ppi_cluster2: interrupt-partition-2 {
>>>>>> +                    affinity = <&cpu7>;
>>>>>> +                };
>>>>>
>>>>> I'm not sure this is accurate.
>>>>>
>>>>> I *think* it's cores 0-1 and 2-7, but I can't find a concrete answer
>>>>
>>>> Core 7 is a Cortex-X4, and has a dedicated PMU node, look at the cpu compatibles.
>>>
>>> Look at what these compatibles do in code. Nothing special for the X.
>>
>> So you suggest to revert Rob's change ?
>>
>> https://lore.kernel.org/all/20240417204247.3216703-1-robh@kernel.org/
>>
>> So what I understood is that yes the code is the same, but the perf
>> attributes are not necessarily the same between heterogeneous cores,
>> so each instance here would load the attributes for each core type
>> correctly instead of only using the ones from the first core
>>
>> Again, other SoCs uses this same scheme so I wonder what's the issue here ?
> 
> So I'm a little confused here. Is this partitioning scheme only describing
> a set of same-kind cores to Linux so that the PMU interrupts only arrive at
> one PMU device? Or does it reflect some actual physical topology of clusters
> and how they're connected to the GIC?
> 
> If the former, I have no issues with this version of the patch.

The former, we simply partition the PPI interrupt for each device node, it
has obviously something to do with the topology, but the goal is not to describe
the topology.

Neil

> 
> Konrad


