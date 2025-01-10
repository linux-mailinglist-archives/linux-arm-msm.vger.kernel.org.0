Return-Path: <linux-arm-msm+bounces-44720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D77A08CAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 10:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0793D16480E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 09:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2EB20C005;
	Fri, 10 Jan 2025 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BrFn6hxy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B220B80A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502258; cv=none; b=hLbgZF0PqEqX+VcI5NaYRBYkptlhi82+Y2Zq5+PCb9k4NKXU7DHI7LhHtsUnT8OysHRZW6kx+0NlX4q4gWVVXf7djKaGDDPJJ3jyD1Dh3qpF0j9dq4OU5cXiA0tFhOSimhtged6jhi2AEGHR+f+/KVweJ01BzTyjuKrGS9hjTGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502258; c=relaxed/simple;
	bh=VK1PDMoAC7rTFOLfb/x378eRNEay/b3TsU0SXAT+ry8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NI7Yq/ruqVd+OwDoITI08IaY/CaBcx/ploo1g1NUUcH14nue66futfXjc1tm7zMqQ/Q/wZRIOsg+h6NwIgFzJQGR6JJB83stSOMK7D1/cT4LrrUNLNieW83m83m0kSVkLORAo8gcymOMfL+yg/gf6UWrjRvo/YC4pc8AbeOMVM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BrFn6hxy; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e87b25f0so1911343f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 01:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736502254; x=1737107054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ufz3XtWARX6FZk6lg3wAgAdnFvATiLwF5jnmYQrY9Ik=;
        b=BrFn6hxyH2zfeGgiHfFier39FAowyicCQMG1HCPu7CCBe8BZl6EFhLhEihttr/+494
         r5+lZsJnSLl+I7uqNXRqxJnE/qHHzx2iIP9crQ15SloohBYwPVicVo9XKFE4GLRAK6IE
         ZrxIllfmzz4bbEwk0oyMJPdZXkMNqw1N5KEJAaVCXbuh2eHo4o8lvzPIn3vpE7j1LfGu
         SUy5AU2W7etEoKVPIOSuuE2JLTeY6oz2IGihm7IZAELzRP06Ilr7aoiyMrniyD30CXvC
         5sPpiDAAz37tSJAPTcIj04/G614WHw7jmkENtqhClhdPArq6Xftb86Nu+Zsj+P/N+py6
         A5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502254; x=1737107054;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ufz3XtWARX6FZk6lg3wAgAdnFvATiLwF5jnmYQrY9Ik=;
        b=PPoBlIjqQNEr3jvibSJz523aeJjRoSCIDiK73Rc614hp88aYrxPoshQB7d7vM90B6Z
         CCjp/GNlTMg0zHmQnrttuOe1n3YJOTnPZRLnaH1tmAC/dSzT1ghi5qH5Jzq6U8G/3VgW
         qgb6STHEit1Mu3LUtGTY/CsCD3QWrBVgcyZp8xhLCi//nf26L+OoLKDOwxP3Lxzkz5hc
         WvqHuxzDlfb/9WJgYJSe+tC2oxqynsKuAm8XWEXv1n10vKnp3Ot0sd8yQbZxvAS/7sik
         oEKC1mgB5+lI5e/PWHdTjodzuvNWOCoVbWilK9N5Ek9xg6Ul2dD2KvuhkDIYHczyNGAc
         BMVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhy6ToaQRP+skJool1fwJwcuiNP9O3cL/USJ9U1CdJcraismkdLEgAVWclYp6iJU9VCI703z5TZDOf3lZe@vger.kernel.org
X-Gm-Message-State: AOJu0YwHG0n9QrwHCLFpkyUj18A5gng0IVx0fM7vAKRIrE94Gfq6gWWG
	qBy71uAdfDwUXDMnD6v0q49jXAIjf1FoOR7XNB00nh1L7uHZCCD7VfxGla4ycm0=
X-Gm-Gg: ASbGncslaMTFK9eh0+O3mgdDkuCkQqnKZXa2hfVii4wc2Yt1c/NOYdMi85mil3TWPaQ
	HRHvTsnyLRD7/+epPrNcMI3a7zcWefWaR/KEwTUFByTVIFO2uI6tk8yD/pts2NJglC9TLzvmieY
	Oh+/MNkLZMGiXTQkhEkSGVy6HwSz0/BiGJEU9yB8rrF0fDYsldT8w9IpmrCvoXfS+EEx6HjeB0x
	uFmokgJmkT//gRtbQdwkCCA7zso962nFFnQrDGhV7GxzM9IkylwSlCvK272ix1yDZ0MZBqFWAb3
	o73ZuxeXO+i3fpJPyaN0xWbK9DB8RxjNXA==
X-Google-Smtp-Source: AGHT+IGaKOzAJrJwxaaNHX70BlAoW4/vaex7QuF2dhKrgRFoaRw7P2wU55Opybov80BrpNHMR3zkeA==
X-Received: by 2002:a5d:588e:0:b0:386:4332:cc99 with SMTP id ffacd0b85a97d-38a8b0d61c6mr5854791f8f.17.1736502253763;
        Fri, 10 Jan 2025 01:44:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8? ([2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dd14dfcasm88786565e9.1.2025.01.10.01.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 01:44:13 -0800 (PST)
Message-ID: <99747e37-1288-4d70-a678-0a73bb4c3b3f@linaro.org>
Date: Fri, 10 Jan 2025 10:44:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: add missing cache node for cpu1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250109-topic-sm8650-cpu1-missing-cache-v1-1-0e85148a48a8@linaro.org>
 <549d15ae-34db-497c-89d7-c9b9c18d8681@oss.qualcomm.com>
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
In-Reply-To: <549d15ae-34db-497c-89d7-c9b9c18d8681@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/01/2025 19:30, Konrad Dybcio wrote:
> On 9.01.2025 4:24 PM, Neil Armstrong wrote:
>> Add the missing l2-cache node for the cpu1
>>
>> Fixes: 20eb2057b3e4 ("arm64: dts: qcom: sm8650: change labels to lower-case")
>> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> subject: missing `sm8650:`

Damn

> 
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..832f3a2c400e8348847bc24b27397e2a0dc08db8 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -119,6 +119,13 @@ cpu1: cpu@100 {
>>   			qcom,freq-domain = <&cpufreq_hw 0>;
>>   
>>   			#cooling-cells = <2>;
>> +
>> +			l2_100: l2-cache {
>> +				compatible = "cache";
>> +				cache-level = <2>;
>> +				cache-unified;
>> +				next-level-cache = <&l3_0>;
>> +			};
>>   		};
> 
> You likely wanted to hook up this new node to CPU1 as well.
> 
> Reading some Arm docs [1], it seems like with A520 specifically, both shared
> and unique cache slices are permitted, depending on whether they're
> implemented as single- or dual-core complexes (not to be confused with
> multi-threading)
> 
> [2] suggests CA720s always have their own cache pools
> 
> In 8650's case, the slowest cluster has a shared L2 cache, whereas cores 2-7
> have their own pools, so this patch is incorrect.

Damn you're right, so the cpu1 cache should be linked to the cpu0 cache somehow

Thanks,
Neil

> 
> Konrad
> 
> [1] https://developer.arm.com/documentation/102517/0004/The-Cortex-A520--core/Cortex-A520--core-configuration-options
> [2] https://developer.arm.com/documentation/102530/0001/L2-memory-system


