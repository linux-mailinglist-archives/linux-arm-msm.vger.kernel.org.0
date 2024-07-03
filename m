Return-Path: <linux-arm-msm+bounces-25174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9109263A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 16:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFE9A2883F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1523017C7A2;
	Wed,  3 Jul 2024 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YMWpgNuk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3424C17C212
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720017757; cv=none; b=lOWg3id9i/LAdI7Wa8j4UaOa99aTmOA6nMAEEoY+EdH7oaiC3cDUuy0TmQTTXPLbiJfn0G3J8lsZOzMvnaLk6JJpFTxqfACcjDxVciRxSa0gH+30ZDcILzh0c0YOjVazYmSHtUpuVhmW88g+eDrbAFmHu/6RQX0wF61GqcIjbPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720017757; c=relaxed/simple;
	bh=C15t/sdBdK2pqoieRzfm0iDE3WaqQ1vxRVz4kCxIp70=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bovJY1kNdqf46+VMBjs+MnupGq7mKjbNyjGLPDi0GPJj7DOvqzauC5/MVKeGDYbdB1IesmybijDUopdqfQu9t6wIv5ec5yRE7fST5eK1k2nGvg+HSewSGWGgCjyzRor75rihR730AiVBpA2V2ia769Pd7Pr/VJ+h5n3MOhhTVLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YMWpgNuk; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so67009621fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 07:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720017753; x=1720622553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUiYUTX4uw6YTF8+5ehB1MO6FQf/YNFuHtJtecY3i88=;
        b=YMWpgNukH3mZw0v9TaDNg6ZT7ky7eNtSP28Si7gUuNaEOjOjulRwI7u1O6VGmr8LJO
         /gY5lSe7L6D2ZqLWJvwP5sdL8k8wOI8Q5OOsamhGAO/90rTqk++4Zc1SgbxbhEIm+prb
         CZgSpa2/5Oa0kiC8LyNNxIXNTkxjBG2adaDgGQZenRRdbDna4MzJ7Qs4DFonCKp5q6mM
         M+25FHq7CO/lCCwwFefgxcXo7mpSRqmNHRmf/7H5cP/9jb/SZMocwOWRbepb5+zVvP4I
         Se5lncJ/OLC2BQvhW6Hyj+ihWRNlEQLJ54AeuUqVBIEWQEP7XNgyEB15cbXE3J9C5ugf
         E5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720017753; x=1720622553;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WUiYUTX4uw6YTF8+5ehB1MO6FQf/YNFuHtJtecY3i88=;
        b=YRv3rfoAPDmBMw8KKm3RlVQCeSDQ3ywrA0oszYL5B2zj6w7kzaFHPl1RLFFk3oj1Yo
         XxU8eF6u0Hk9dDYed4NxDJDV+TcLt6tUdHYgJZhCAHlUxOAw3QJG4ml7A/zPuWXYiMBw
         fYo1B1XXHEcwv78YkAXiJehcUKUY20UkFnPmGl0mgg1KlKUht3UlngtWWyVo18+z3bpN
         9HgOKkYOJAzAyX8quIIaix2WRJRtvTQsO61UeAKnK+FIEiF+XXY/2FwJJy3E2ET5syl+
         4yaXjwhv15GyhjOmeMrBqjNKcFOIHCTPpg0vQh+QM3ZrvxZkXnJIF8myX1xs0ts0uEaC
         bhCg==
X-Forwarded-Encrypted: i=1; AJvYcCWfjUZT0BTDhw3ENCeSDjMT3xg6PCw/GmW0A4yoMZh7vE+Au1Nc7mmAgrHbj+pcOATY7tmBvlHh/TR3SNUK4q1dXQBggH2wKdJsW/Gkog==
X-Gm-Message-State: AOJu0Yx4GdVe9kU11xcdqfWQ+uxD1s1BaPVnow+em0bsXifzVAN1Tzux
	O4nAvK4j0aqACZ28eR8IdFuPVHKsrCi/AnIidwnjKSQdrHgAJ/IZ2hl22x69fn4=
X-Google-Smtp-Source: AGHT+IHBzq9dEW29kEqNN4LDlotId1dB+PxWXtoeJ6QEnDFpAhjD/42H7fT4DP7lT+3GUim7ec21Uw==
X-Received: by 2002:a05:651c:49b:b0:2eb:d9a3:2071 with SMTP id 38308e7fff4ca-2ee5e6c9cd8mr65401681fa.50.1720017750942;
        Wed, 03 Jul 2024 07:42:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71? ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b068e93sm241883765e9.24.2024.07.03.07.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 07:42:30 -0700 (PDT)
Message-ID: <ce6c2e8a-65a7-4cb2-a91d-fbcaeef6edc1@linaro.org>
Date: Wed, 3 Jul 2024 16:42:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] thermal: core: Call monitor_thermal_zone() if zone
 temperature is invalid
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux PM <linux-pm@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Zhang Rui <rui.zhang@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <2764814.mvXUDI8C0e@rjwysocki.net>
 <2ed4c630-204a-4f80-a37f-f2ca838eb455@linaro.org>
 <8d91a3c1-018f-495b-83be-979b795b5548@linaro.org>
 <12c5c133-9519-4a26-b9a3-2da1d3466e94@linaro.org>
 <15b67ce6-3238-435d-ad28-7c06efbe9153@linaro.org>
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
In-Reply-To: <15b67ce6-3238-435d-ad28-7c06efbe9153@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2024 16:00, Daniel Lezcano wrote:
> On 03/07/2024 14:43, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 03/07/2024 14:25, Daniel Lezcano wrote:
>>>
>>> Hi Neil,
>>>
>>> it seems there is something wrong with the driver actually.
>>>
>>> There can be a moment where the sensor is not yet initialized for different reason, so reading the temperature fails. The routine will just retry until the sensor gets ready.
>>>
>>> Having these errors seem to me that the sensor for this specific thermal zone is never ready which may be the root cause of your issue. The change is spotting this problem IMO.
>>
>> Probably, but it gets printed every second until system shutdown, but only for a single thermal_zone.
>>
>> Using v1 of Rafael's patch makes the message disappear completely.
> 
> Yes, because you have probably the thermal zone polling delay set to zero, thus it fails the first time and does no longer try to set it up again. The V1 is an incomplete fix.
> 
> Very likely the problem is in the sensor platform driver, or in the thermal zone description in the device tree which describes a non functional thermal zone.
> 

It was at 0 but the delay was removed recently:
https://lore.kernel.org/all/20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org/

That doesn't explain it because only the last platforms have this error message printed.

Neil


