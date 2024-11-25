Return-Path: <linux-arm-msm+bounces-39067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DE79D7CB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 09:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 260941627FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 08:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F10155747;
	Mon, 25 Nov 2024 08:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r8PdVuYV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3916126C10
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 08:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732522611; cv=none; b=S6sRiXDqEASsK/MjbGg380c9fBEHQ8z51zY3jz2+I7zWViJ68W4yV46lvdpDZyIeMOqOToZPNGnpaLl0O4iM91ZJfSGrOYs5dTh2Za7zpGLQvvbyti9HpxpwwnN5y8+XdJ+rMkF/urCTpEZx45ixB5fB27PKE0PR3d4ZxV5agEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732522611; c=relaxed/simple;
	bh=Wn8WbXy4R2JTFTHi8lxXWT4zCxEbVpkKy/jG2BmbjZM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uid0trPSOcMl83Ca0zMuNwKBV3htgqSDiVhT9Yh4f5+OrOp4yk6u1kEtDyCtyYkh8a+SZy7lwAh36vAq3rtovgDc5oMRuXL3M6OkVsnE0Uz+6+3rCgwrmIFb1p/mBMOEgw0OvHU80YC1LUjHpNNrMl1xuu/gUajgo3J71pOqono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r8PdVuYV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43169902057so36423795e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 00:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732522608; x=1733127408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9tDhyHhmMtVAvULrIAhFRVk5xrXZSSMlYMbhL2ls4g=;
        b=r8PdVuYVLt5hg4Ju86fl2d3nhMDyOuoWCy3Q5EVbKiscBzhxUYqPX+PY/tg6qPpuwS
         +ZjcqfkcBbWpjterNXWO2qeOEpBwFe6Vwj9UQxzfC98eTpQdTY9p0wzVJ18Mj1IRhCXp
         DZoHfn+VvaG8Y+rbdYQWqDNDfalT89p5nMLlrbhjXSTV948MEag6mU4pNe1AJGw6b9UY
         uPmXQD2UVh4FsRdp0cDoZVeNDLWDwgrhQEV2OpQ60kbjvvuQLA0k2yWYqmTaMsAo66fz
         WBhfHPG77WoGR7+EX/LnBlpmWqoZZsd7h/37I139cOG8GWLPPNjcqtAu2JV2r2VzHOJs
         0IAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732522608; x=1733127408;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D9tDhyHhmMtVAvULrIAhFRVk5xrXZSSMlYMbhL2ls4g=;
        b=RUIBLLMuQptkb6RDMb6CrEHujUtHitmGvTTb2EI3GLKyt5b+BfpIeHOJK9rcnBZK4B
         5AHI/gpSwBqLTitMtdix3Vxnr5gB/U2QTgI/OnDP972hinLD4A9dGqQzyO4jtVGzrB+F
         38w7qcd5yLfvd0mWN8H32YdE8+JooWP5UtQjkZ7dsvIq1kGW217tXcFu1AWrujvmzJc8
         IVqwZ1pi9yybI98kJYxV1wEaD8//qlsBcpjEyexHFYWGrBcygcZO2V4fwhJgr6v9txbI
         B0Hu0DToxnIgmdFKDIQKVcprOcAlDy9RmBdBcYGhzULTyBAldxXuZLImfYglXU1iwD8G
         Jkdw==
X-Forwarded-Encrypted: i=1; AJvYcCVPJuaZWgtil0Z9OMXXaslWNZ078eF16zAPUFqYpKChc6XWWKvgNI2qcPgT8d+UJezcWmD5tozLbMTgOl03@vger.kernel.org
X-Gm-Message-State: AOJu0YwkGfMzLtaTH6kxt/8vZYg5kBSOR37t3xBShSRJuboDZbopCosw
	Z1BODuh9lmwvA8pJqk0NyJOp79wcB26zznfucwVAOKBt979C1J77Y9Dz9Rw64Vc=
X-Gm-Gg: ASbGncuL34HpI+DT8NiCtTa9ZLspu0KI5NqIgswAb5pa1mWo7oXGO/6bzNuVPbXmymp
	C24MIk1ejJwPus/UkAQBy7+Rbz1OUKSUv2b0vLqT5t1vbgFi1SAfZnUo/5e6O+wmVJsUKkC2zv7
	ezLbPF/2Cyl585oLn9Rqm2NyK2BNbZZO1vC8nmEJ7etqo6nFy8nXTPzSCctrE3hHDDskwUnS5/o
	itv+kYSAjJCelyNlUKDp48OsCUmsgCwC4VMmTOEqVNy8y9l/Nl1L/HQF3daZi63UzfWBWIp9xwW
	d942ZjHj2BGjy5/+guLwrSu+Ao8=
X-Google-Smtp-Source: AGHT+IEHqbnxQqxNnabskvp/0vuLynuKH8d+VUfNVbcCpoeFlsv4NGAWYmcyUTS6ZjyH1Zls0XDyDQ==
X-Received: by 2002:a05:600c:4690:b0:431:2b66:44f7 with SMTP id 5b1f17b1804b1-433ce4d4c6emr114888875e9.31.1732522607986;
        Mon, 25 Nov 2024 00:16:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b? ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b463ab6csm187362095e9.35.2024.11.25.00.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 00:16:47 -0800 (PST)
Message-ID: <a936a9fc-6632-4f44-94d1-db304218b5a5@linaro.org>
Date: Mon, 25 Nov 2024 09:16:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 04/11] drm/msm: adreno: add GMU_BW_VOTE feature flag
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-4-4deb87be2498@linaro.org>
 <20241123194316.yqvovktcptfep4dr@hu-akhilpo-hyd.qualcomm.com>
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
In-Reply-To: <20241123194316.yqvovktcptfep4dr@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2024 20:43, Akhil P Oommen wrote:
> On Tue, Nov 19, 2024 at 06:56:39PM +0100, Neil Armstrong wrote:
>> The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
>> along the Frequency and Power Domain level, but by default we leave the
>> OPP core vote for the interconnect ddr path.
>>
>> While scaling via the interconnect path was sufficient, newer GPUs
>> like the A750 requires specific vote paremeters and bandwidth to
>> achieve full functionality.
>>
>> While the feature will require some data in a6xx_info, it's safer
>> to only enable tested platforms with this flag first.
>>
>> Add a new feature enabling DDR Bandwidth vote via GMU.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb..394b96eb6c83354ae008b15b562bedb96cd391dd 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -58,6 +58,7 @@ enum adreno_family {
>>   #define ADRENO_FEAT_HAS_HW_APRIV		BIT(0)
>>   #define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(1)
>>   #define ADRENO_FEAT_PREEMPTION			BIT(2)
>> +#define ADRENO_FEAT_GMU_BW_VOTE			BIT(3)
> 
> Do we really need a feature flag for this? We have to carry this for every
> GPU going forward. IB voting is supported on all GMUs from A6xx GEN2 and
> newer. So we can just check that along with whether the bw table is
> dynamically generated or not.

It depends on the bw table _and_ the a6xx_info.gmu table, I don't want to
check both in all parts on the driver.

Neil

> 
> -Akhil
> 
>>   
>>   /* Helper for formating the chip_id in the way that userspace tools like
>>    * crashdec expect.
>>
>> -- 
>> 2.34.1
>>


