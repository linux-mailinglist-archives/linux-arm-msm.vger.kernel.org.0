Return-Path: <linux-arm-msm+bounces-47321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30407A2DE9B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 15:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C8C11886E07
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 14:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCD6243368;
	Sun,  9 Feb 2025 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aTC35yCm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252581BD9C9
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739112296; cv=none; b=gM6haFv7YyrLZfzeDy8oA9JZRx08ZrcDC8WL63gE3yCZsqjU/EXZW3Bg3wOYNoHCWv1S/8pPvSLg2JhG2wnQEruh30ub/oVgrCL81OvfOyMAIiOYwW4/P0PodfK5qf5h8TIAr8nsoxJiHxoA+Giok9b6oWOBHtvuzKqZ1J0r2jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739112296; c=relaxed/simple;
	bh=zy7inQn8IlL22OlQ3SOSyDR4h8QdypuUqFZ0yVIeMHo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qfSkYXxmBVgg7D7M5joPXpLTJI3CrvDkY/EAZpjAlhSH5uuJyGXVB43DA+9MINWJ0uHWitDlb9YxMIYU98lKusf/dghsa1+hku/VoGG+8n90yUaW3p0gYek5nEqIdzPeSU6RYhX+S/iT725QzJzxpzIMDbebL7rGEUfpnQWysmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aTC35yCm; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467b74a1754so52912591cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739112293; x=1739717093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5QvikTKCFNL7WLcBiL2Nw7xhGaRFi+kZbVL6GI4dUg=;
        b=aTC35yCmfXuMRKr5srPrqM3aiYRh4Ofn7dODvHKotZyfNJgTFlHjTDjMOIVSWc40kw
         ++sXDjFaaJczlMeZpCTwN6Ku139sXTjdqITJUemb7FN+m7feWo7N2b/LR7oblshrqWDK
         u8YLBKB48aHHjqWUGKc7KKDAbwhlptL9A+cgAfG8UL+20rndsFHg3aHXny7kQavQJFsd
         EjjP7jmXBafO912RIjRz18jDR2wYk+CxC1MwIu9oRAMn2yKkNgUdQ3OXstVl67yP8p7L
         UWdPFpFsSosI5FW/CZOvdd9F8jv5GzMVN7QhhhscZWVydZSlE2kSsrsx4mUI93/15jUV
         iTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739112293; x=1739717093;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w5QvikTKCFNL7WLcBiL2Nw7xhGaRFi+kZbVL6GI4dUg=;
        b=TU2hoeXxqaBkGrmxva1hbIBYPTwsBFbQXGwMwVutfpuzzR1LthHaw2hyXoct7/Jyad
         ePtKhyVK7BESHVQ9Vgtj7RYJ9LNDBP5/S8w+lLkf/iKZe9bKzstUyhfpuRTI2LGvNxzn
         l2VX/CQ44HGLjQl0GRXvkg2LCinrawlii1m/VDDQBbwl5QqGNIIWmqWOl2y96y+i6uJN
         MLLtCvp5f8vDGSad1QHNfhOS1E4CtjYfnf1zCCkMcCwtVLX0o+adpJds7rm403UEHHeG
         UR/cezFN0eW2s4xDldWwBe1GEhVl4y8ww6s36PGbxDyrHJkmWahnP1WxZ06tvne5mC0B
         Kb3Q==
X-Gm-Message-State: AOJu0YyCQJJ8e4fmMS6VkCQqap7M93XiCc4AKMDzDCvBT3byBhcT1vIj
	t5yHXarMOG+ysOVdncjGblT6NWKGBltUl4NeYXlFjef4b8dQSiSQPkmKWU3BVoQ=
X-Gm-Gg: ASbGncsirth5SdVuk2FkObikA0SPvWLeEILPvaYJSzFw2EWYwlL/SaM/YVFKXtJ/9ov
	qENVC3tyV8/RQTr6muYanhEl1cTjUu0rZsMHxbjy2OloeqDbh7EjBYeXp4JfS0Y91mF4bz4Y9gM
	AGBMbYL5kw7lBRgGrHDJIqUbpLXXB1cP8CHokDa4QZJhG7s3G3vkx+0OopL64A3+iB82d6yWbob
	jiNifC6i8e4Qo6nDrhKtkUGfTZGT9PkT7fmI6pwm8NATJ7rYqtreHc2JfNqWb4GkWU02Y1Zcm6A
	RATIIjOt71Vgk+QW6DsodlD7CyFpZZQXI0YNqBlCIhHQpY2sfBn65yigf5T535pyy/kF
X-Google-Smtp-Source: AGHT+IHSNH3EcOtRNo838aV35hz3kX1wpHeFZVgLNa9gNU5K5QGpwy99/u8FN8FkHYN4asPsNSwJKg==
X-Received: by 2002:a05:6214:1c09:b0:6d8:9be9:7d57 with SMTP id 6a1803df08f44-6e44570afe8mr189702836d6.37.1739112292975;
        Sun, 09 Feb 2025 06:44:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6e2e:988e:3133:72bd? ([2a01:e0a:982:cbb0:6e2e:988e:3133:72bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44d545327sm21696666d6.33.2025.02.09.06.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 06:44:51 -0800 (PST)
Message-ID: <6aa71142-3b1d-476f-9c78-1207fbbed3f5@linaro.org>
Date: Sun, 9 Feb 2025 15:44:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <ba546075-cfc0-4b17-9129-f99054e2e1ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2025 21:30, Konrad Dybcio wrote:
> On 7.02.2025 11:31 AM, Neil Armstrong wrote:
>> The PMUs shares the same per-cpu (PPI) interrupt, so declare the proper
>> interrupt partition maps and use the 4th interrupt cell to pass the
>> partition phandle for each ARM PMU node.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
>> @@ -5309,6 +5309,20 @@ intc: interrupt-controller@17100000 {
>>   			#size-cells = <2>;
>>   			ranges;
>>   
>> +			ppi-partitions {
>> +				ppi_cluster0: interrupt-partition-0 {
>> +					affinity = <&cpu0 &cpu1>;
>> +				};
>> +
>> +				ppi_cluster1: interrupt-partition-1 {
>> +					affinity = <&cpu2 &cpu3 &cpu4 &cpu5 &cpu6>;
>> +				};
>> +
>> +				ppi_cluster2: interrupt-partition-2 {
>> +					affinity = <&cpu7>;
>> +				};
> 
> I'm not sure this is accurate.
> 
> I *think* it's cores 0-1 and 2-7, but I can't find a concrete answer

Core 7 is a Cortex-X4, and has a dedicated PMU node, look at the cpu compatibles.

Neil

> 
> Konrad


