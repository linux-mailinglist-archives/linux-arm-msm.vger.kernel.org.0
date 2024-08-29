Return-Path: <linux-arm-msm+bounces-30050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 584DB96492D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 16:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D607C1F21730
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C501B150F;
	Thu, 29 Aug 2024 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3Y2ld7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D901B14E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943273; cv=none; b=CYK9tTJPnyZGLOS1Z5w+1Ca84x++V9i/V2WttgvuScNFSBG71+b5UVflu3CEpWLVIDUIwUW0J8ugRfShGIH3ODjsCnQSZ2Zo+ygkHTk8NR5aADEJn+dxUT488mNmWsbyZU0EaTGYqgWBkrUJLM9b2TtYSffpXjOKQ16R6OMLcA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943273; c=relaxed/simple;
	bh=WVKIpxyvSxvXJXDMoFBBlYcfXvBhD3sx8jPRqfscME4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dF9DhsqbaIgtMjfToECf0ZGopKESVJIaA+DhzK/+yOTqEzKuuhsT4X8ObvpqKTgCygQS81LVyvUWhzMZ5ALd7F0Zuw9FgIZOI+b4oLRAtEfK981+uxaeI1THYL6LCuH/9JNAsLnne9dNU74Dzj3rsUIzisJ3pg5sSI1A38+ihk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3Y2ld7a; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37196681d3bso477142f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 07:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724943269; x=1725548069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65MyFHHTA1PsDIlSg/rTxhPf0z2KfhQQqeQtyDirckk=;
        b=P3Y2ld7aIaUHGUKaIZe0OKdtYu4rmb+u7+FJ7DbG5ZviJ4GcTuvoPr+ES6nRtK33Yd
         J4VHJefA4zslFj1sMyEyKQJ7Bd+QT36NomumuyFCrzP0W8CE8PSihp6bNzbf4pMWDuVe
         kiBcZ+xAmPti7jZYEHD+e+OOw2ITU5JDmLgweOr07LSe3nYIPY8lgmTPE+ZJfKcRRUZm
         mxp/xVf2bhlKLPZtaweRxUStw8SXG/Nbf02pfF4JtyrF3emLtm+BEDfAHnwhqIOViUfo
         9Uy2LbG5/HJM0OJA7fx2afLdJpO07sTg4FWpFR6EpzzHFtdCquPSipc2PnA3EqZiYv5w
         K3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724943269; x=1725548069;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=65MyFHHTA1PsDIlSg/rTxhPf0z2KfhQQqeQtyDirckk=;
        b=nKjHB6qZaUiyiq7w8ALvXFjTw2cVFXrRQlvT8T3Fo1XNlUVsMeX3afEVYprlU5VM5k
         ENJeISu8mBvKakTPk4ADZuffpGdmNUCJZbjDJKTV8geOFxEiEMPYpgCaCWTws0Lki7pm
         WSS6f7YoiLhnub4U3MPg6vpl5gSY2XvPg/p34gjyPu5GjwxjdvhH+OqpAU7GWs1dV7R/
         a6rQ95ccDQaZ/z+y3KFYdXAeq9mY3xgSZsNgfDHzWYUdltqWtZzZYjg5l0QSVnYZSvDa
         NS/Wo60Iu09talhdtWHDcwBF12iZb0QtIQTPxx2L3lGYVICM+6lHUDSkzdEcso5zpUVR
         J+bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcd2ma5Q7Cu51BwaVgnQsY8MkNZX0nXsRncRoHhw/exBKjkNaVKTNExNY848gWgWcRp3ZctzQILUwun9y5@vger.kernel.org
X-Gm-Message-State: AOJu0YzGYDzQHMVJBme7LRRpy09Qo0U45jcianAzilT8wXGG28BRfDzW
	zWCaFzX6V1qdSnapEzYrPy791nc0k1wy26QTDlAkFRtvGv3JGu+jkgAqjn7BPow=
X-Google-Smtp-Source: AGHT+IHZH6stL4551rGqzrB66QW6+0W2V+BEhTdVDMA/uaumsNpkCQJsZo6bnlAOMG7WaWFSPvBr0g==
X-Received: by 2002:a05:600c:3596:b0:426:61e8:fb35 with SMTP id 5b1f17b1804b1-42bb02812aamr25983165e9.4.1724943268906;
        Thu, 29 Aug 2024 07:54:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915? ([2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6a10353sm17740285e9.1.2024.08.29.07.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 07:54:28 -0700 (PDT)
Message-ID: <8d630ba4-8f6d-427d-bfa3-8eeba002517c@linaro.org>
Date: Thu, 29 Aug 2024 16:54:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v6 RESED 1/2] dma: replace zone_dma_bits by zone_dma_limit
To: Robin Murphy <robin.murphy@arm.com>, Baruch Siach <baruch@tkos.co.il>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?=
 <petr@tesarici.cz>, Ramon Fried <ramon@neureality.ai>,
 Elad Nachman <enachman@marvell.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <cover.1723359916.git.baruch@tkos.co.il>
 <17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
 <1a0c7282-63e0-4add-8e38-3abe3e0a8e2f@linaro.org>
 <1a7ab0db-646d-4975-9974-7b911990055a@arm.com>
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
In-Reply-To: <1a7ab0db-646d-4975-9974-7b911990055a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Robin,

On 29/08/2024 16:38, Robin Murphy wrote:
> On 2024-08-29 2:42 pm, Neil Armstrong wrote:
>> Hi,
>>
>> On 11/08/2024 09:09, Baruch Siach wrote:
>>> From: Catalin Marinas <catalin.marinas@arm.com>
>>>
>>> Hardware DMA limit might not be power of 2. When RAM range starts above
>>> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
>>> can not encode this limit.
>>>
>>> Use plain address for DMA zone limit.
>>>
>>> Since DMA zone can now potentially span beyond 4GB physical limit of
>>> DMA32, make sure to use DMA zone for GFP_DMA32 allocations in that case.
>>>
>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>> Co-developed-by: Baruch Siach <baruch@tkos.co.il>
>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>> ---
>>>   arch/arm64/mm/init.c       | 30 +++++++++++++++---------------
>>>   arch/powerpc/mm/mem.c      |  5 ++++-
>>>   arch/s390/mm/init.c        |  2 +-
>>>   include/linux/dma-direct.h |  2 +-
>>>   kernel/dma/direct.c        |  6 +++---
>>>   kernel/dma/pool.c          |  4 ++--
>>>   kernel/dma/swiotlb.c       |  6 +++---
>>>   7 files changed, 29 insertions(+), 26 deletions(-)
>>>
>>
>> <snip>
>>
>> This change breaks the Qualcomm SM8550-HDK boot since next-20240826.
>> It doesn't affect SM8550-QRD or other similar SoCs like SM8650 or SM8450.
>> The last CI run on next-20240828 can be found at:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/pipelines/100936
>>
>> SM8550-HDK boot log:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/165617
>>
> [...]
> 
> Yeah, a 35-bit ZONE_DMA is sure to make stuff go wrong:
> 
>> [    0.000000] Zone ranges:
>> [    0.000000]   DMA      [mem 0x0000000080000000-0x0000000affffffff]
>> [    0.000000]   DMA32    empty
>> [    0.000000]   Normal   empty
> 
> Compared to before:
> 
> [    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   [mem 0x0000000100000000-0x0000000affffffff]
> 
> This'll be because the SoC DT is describing a general non-restrictive range:
>          dma-ranges = <0 0 0 0 0x10 0>;
> 
> Which proves we need more information than {acpi,of}_dma_get_max_cpu_address() are currently able to give us, because what zone_dma_limit actually wants to be is the *minimum* of the lowest highest CPU address of any DMA range, and the lowest CPU address of any DMA range + 2^32. I was thinking it had all ended up looking a bit too easy... :)
> 
> I think v1 of the fix[1] might actually work out for this, albeit still for the wrong reasons - if so, I concede that maybe at this point it might be safest to go back to that one as a quick short-term fix (with a big fat comment to say so) rather than try to rush the proper solution or revert everything.

Indeed v1 patches makes boot work again:
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x0000000affffffff]

Please add my:
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK

Thanks,
Neil

> 
> Thanks,
> Robin.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/731d204f5f556ad61bbaf004b1d984f83c90b4f5.1724748249.git.baruch@tkos.co.il/


