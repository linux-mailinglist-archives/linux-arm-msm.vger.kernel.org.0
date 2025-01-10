Return-Path: <linux-arm-msm+bounces-44719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6330AA08CAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 10:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23D9188E96D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 09:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE6C209F57;
	Fri, 10 Jan 2025 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m+1e96Ok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB36207E07
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 09:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502088; cv=none; b=DdsTMv6ELYWuL16Rktq4B/ize0gPePpYFvd5+mH2pWLi+n1hIIL8kx4ye9DX0km43uAT7YIwQmkx5vqpihbkEENnH/4IB1e29A2mydLVM4o3qUS0n/9TLJOGqiOj6CccM6HDxYfJvaHdwGYMeMBQkkDNE7TemPjYWhewdh0wIUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502088; c=relaxed/simple;
	bh=ZRELooL9AwzuHuGHG9zYQArMtcMBb1aUpSoSWzK4sJI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HVpuYqMGOycWo1t0e2Q8lea6L7bVS5H41EEgoH1fllvLtbX5CPU0nkKHaFNjxNw8vdWY2XU8qXrA6YnypYHG36T/hDXpKym1En7+CX1DYaQFY5J+tgCYieI7GJ5pKmtB2Vp3m6ogH7C+iVqw1IgRx24ih7cvgzta0S9ZnJx1SI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m+1e96Ok; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385df53e559so1447981f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 01:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736502085; x=1737106885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPUckqV1RqBJuu2mVNvWG/BiO3xnzDMMJWi+uTOIZME=;
        b=m+1e96Okzk+V1zvUkS++SdjNaSvzQKDNyGdLUMIuvxz9y+XuHpu5RDbYxwa2rJVkGb
         bvv3hrLSDqHbdpLGKyPSLcVRz0kazhjgfUdfj58W+1mvFgpeOtoA8UBDZTNmcz5FAGZG
         GTIg2MtclNTLsCpJmZ1tSp1rqri+3CPv2Gt67RMMsWDnrXfWWC2q/gjvsrFzgySWjcZI
         tW9EcuUxVM0IPmMyfO738q++Em4EBY9ba/XKZpn0rNHicKHxnsqzLhq3rKq/fcLK5zcw
         wUdL2QBn6P6jmt3cFKqJ3yBVxxtupSj3edCB3iboxpQtxqRDotYkA9sJOInAfa6m9FDO
         uL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502085; x=1737106885;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mPUckqV1RqBJuu2mVNvWG/BiO3xnzDMMJWi+uTOIZME=;
        b=TWBPLF0yl7WZt0iMFVwb+TVM53MyPV26Y91tJj691mAgs4SEVnOAbyZITfmPg1e95S
         9i7gQrQcbnLfyyYN4+7tO5Ko+V0w6z9SE5qX7FRDE3c2Ai7AwbW8NqypCKrJq9kOAQYZ
         IePZ7AmNdZxuH+HExkDyNUPxpFXNVoCAYj5OFE1qlwd/88TygXKwlyr3IdTT3f997P7v
         3y5RLdB6itELn5OeNwEEBVwycbZC7EjT1jgdpvNyEcuodX9YrJoLgB34H3P1Gc7qZ2YS
         FbTkqGRgWd2iDaAZ/lkvf3lyOIEuVQeyWSM4zKYThXImx9829AO990VSXf3XrJDQ4l7h
         r9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSsr5R4bg2zzJtP6s+eYKh+we1qXZaLfRoTopHvtA2H+8e6LzPHq4NnxJVYsM9a6g41munyzopFhh6U/es@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEXFq5j4xZe/JGT/kB3HW5+UQ9GaiRtP0kFhO0gHwUvUQT+kE
	a0f2EkiRvjkvpQIklNHqPLNGzQizN7r8O8l1TyZE41DN3Kh9jFGRmtZ3YHvnhPI=
X-Gm-Gg: ASbGnctIig/JMPXs8oYlpCPWYKSf7RbtJwhPK6Fzd9U3Fw8+RuCdf1QgRLZ90L+A+8H
	fHvHOOduEW/oFWBDepRVzcsQqUFFz4yPSf1YtjgNSbf+F6ysnBbGcdnvo/8nHHuIA0XCZJwI1aT
	KBj2CEXSCfn8xN3b0FNAKS3GqrOnloxHTK4d4Jm8Dj0j54TQR0UtlqxGRsMVtSvAjERLGRRK1ES
	cUIvUnSTBw9PTV9OBnwKoh4RRla2q49iOQNn7GJ9RXoGwBsvCXHpHf/jq1OA4la1eWkS8yKFfa4
	SD26d4u4O0T7Jsp0kOUduTeRndi+tEW9mA==
X-Google-Smtp-Source: AGHT+IEZQwcQdhG3DgJuIEFi67lfPf3OWbcw8SwSDCiLjZQ1r43WYKlQtwIuVHxkiRqXoXhs18yJNg==
X-Received: by 2002:a05:6000:1a8c:b0:382:4ab4:b428 with SMTP id ffacd0b85a97d-38a872d071cmr8925758f8f.8.1736502084862;
        Fri, 10 Jan 2025 01:41:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8? ([2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c880sm4093150f8f.57.2025.01.10.01.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 01:41:24 -0800 (PST)
Message-ID: <7317f895-f502-44f8-b5cc-dc89de850df4@linaro.org>
Date: Fri, 10 Jan 2025 10:41:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650: setup cpu thermal with idle
 on high temperatures
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250103-topic-sm8650-thermal-cpu-idle-v1-0-faa1f011ecd9@linaro.org>
 <20250103-topic-sm8650-thermal-cpu-idle-v1-1-faa1f011ecd9@linaro.org>
 <qszkxmtrqr62wgd3qx7uctu22w4qrkietasvffinzwmzt7ccum@r26dikuqp7a4>
 <11ca788f-67e6-4e5c-9ace-083b730bc9ce@linaro.org>
 <2xp2xz4w7drpnql5khevz4wenlmiu3omwcilfisb3vvq2jlnwg@tcmjb475kghk>
 <2fcd9a10-ae9e-480f-87a1-5b49e5082ef5@linaro.org>
 <66754bb1-44cf-4f22-af7b-450d4fede20a@oss.qualcomm.com>
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
In-Reply-To: <66754bb1-44cf-4f22-af7b-450d4fede20a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/01/2025 16:18, Konrad Dybcio wrote:
> On 8.01.2025 10:15 AM, Neil Armstrong wrote:
>> On 08/01/2025 04:11, Bjorn Andersson wrote:
>>> On Tue, Jan 07, 2025 at 09:13:18AM +0100, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 07/01/2025 00:39, Bjorn Andersson wrote:
>>>>> On Fri, Jan 03, 2025 at 03:38:26PM +0100, Neil Armstrong wrote:
>>>>>> On the SM8650, the dynamic clock and voltage scaling (DCVS) is done in an
>>>>>> hardware controlled loop using the LMH and EPSS blocks with constraints and
>>>>>> OPPs programmed in the board firmware.
>>>>>>
>>>>>> Since the Hardware does a better job at maintaining the CPUs temperature
>>>>>> in an acceptable range by taking in account more parameters like the die
>>>>>> characteristics or other factory fused values, it makes no sense to try
>>>>>> and reproduce a similar set of constraints with the Linux cpufreq thermal
>>>>>> core.
>>>>>>
>>>>>> In addition, the tsens IP is responsible for monitoring the temperature
>>>>>> across the SoC and the current settings will heavily trigger the tsens
>>>>>> UP/LOW interrupts if the CPU temperatures reaches the hardware thermal
>>>>>> constraints which are currently defined in the DT. And since the CPUs
>>>>>> are not hooked in the thermal trip points, the potential interrupts and
>>>>>> calculations are a waste of system resources.
>>>>>>
>>>>>> Instead, set higher temperatures in the CPU trip points, and hook some CPU
>>>>>> idle injector with a 100% duty cycle at the highest trip point in the case
>>>>>> the hardware DCVS cannot handle the temperature surge, and try our best to
>>>>>> avoid reaching the critical temperature trip point which should trigger an
>>>>>> inevitable thermal shutdown.
>>>>>>
>>>>>
>>>>> Are you able to hit these higher temperatures? Do you have some test
>>>>> case where the idle-injection shows to be successful in blocking us from
>>>>> reaching the critical temp?
>>>>
>>>> No, I've been able to test idle-injection and observed a noticeable effect
>>>> but I had to set lower trip, do you know how I can easily "block" LMH/EPSS from
>>>> scaling down and let the temp go higher ?
>>>>
>>>
>>> I don't know how to override that configuration.
> 
> I'll try to get some answers. SDM845 seems to expose a couple SCM calls for
> this purpose and it's already wired up in drivers/thermal/qcom/lmh.c

Would be great, thx

> 
>>>>> E.g. in X13s (SC8280XP) we opted for relying on LMH/EPSS and define only
>>>>> the critical trip for when the hardware fails us.
>>>>
>>>> It's the goal here aswell
>>>>
>>>
>>> How about simplifying the patch by removing the idle-injection step and
>>> just rely on LMH/EPSS and the "critical" trip (at least until someone
>>> can prove that there's value in the extra mitigation)?
>>
>> OK, but I see value in this idle injection mitigation in that case LMH/EPSS
>> fails, the only factor in control of HLOS is by stopping scheduling tasks
>> since frequency won't be able to scale anymore.
> 
> If LMH fails, your SoC is probably cooked already, anyway :(
> 
> I'm not sure why idle injection isn't enabled by default if no other cooling
> methods are found. Perhaps that could be discussed with some thermal folks..

Yeah this is good question, this should probably be the default "hot" behaviour

> 
>> Anyway, I agree it can be added later on, so should I drop the 2 trip points
>> and only leave the critical one ?
> 
> I think sticking with critical=Tjmax + critical-action = "reboot" may be the
> way to go here.
> 
> We may want to give some folks a heads up, so they can wire up skin sensors
> on their devices ahead of these changes landing tree-wide.

Yeah it's also my goal, will respin with only critical.

Thanks,
Neil

> 
> Konrad


