Return-Path: <linux-arm-msm+bounces-69256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69205B2697B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 16:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7782A16C1DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B1C321447;
	Thu, 14 Aug 2025 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DlAmHPM3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8247DA6D
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755181565; cv=none; b=gJdJjNzib5RZhLRHZZPY7WTCL+p2j4d05YvyUo35PzFobpw6+Z9OdpADj4Gti7ExIEe5Kmg4BG4sFjVeZy0jUxSB0jdoSa3spmXi5j771XYjwV40uE1KoTh6v0+gpS5rpX4JsUuKnue8DUUzp8F5zu2OlWGE+j0jC8zeVkboxME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755181565; c=relaxed/simple;
	bh=gBxFOxvGALu7sDdFgybOnYEKn/o04vIZg4lyyrzwuEg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MHM+JA8pcmDn2c7x36hXG+kl0CXGrRHRyo9Scrrh9hYuII/uLVVnWr/J884CM2dgL45hWP6RwwwH9XXCzrc+HiCQlRWKxzkjizTRfG0TAcAvLNkdWidYZxIqrj0Jryn7d4EFN8BPXy0wENJ9wxdAhSqT1qZzSCkJzAWkF2RqGDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DlAmHPM3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b0990b2so6757855e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755181562; x=1755786362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUV3fUJR8K/LNtQMHHFa+NVRtvkhhAA1yMnYl/5MEqg=;
        b=DlAmHPM3v4Q7MdPk5x1gzGr8YS8hyzVRNWcy7yrqkdEzkPjv1ugpyvAuMFlY5nQbUo
         qe0S8qgaDsC0KptuqgFDpxrLk0JNsx58aQYePwTFF4qmlYaQ+7qMQezLHtA+T/sedbTR
         Vdqgb4jvxp2b1OlkeNS7KRYce22Ezip3veJuAH2FfwzJBB0bWZQHqwAgt5fy6vATL+PK
         WGpPqlN65ZTbl3oCV3f5YDWNs633CnIqRsoNeHluhCeUxgl1CwMtcLo9Em4tbADVMkA8
         yoH/Uy41qFbzWuSjo4PO9k/PqjCbsqL7uOoV1UoDESPRP1XROO9dCFySVxmgrBzO35sJ
         GUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755181562; x=1755786362;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cUV3fUJR8K/LNtQMHHFa+NVRtvkhhAA1yMnYl/5MEqg=;
        b=bS7zt0MieGFtvjrGOepNi4uXa6TEsKnRFl4fsGtVUZetHhDEtWjgptSVLMGGg0bI7L
         TPsIYwq8TpTOOJipk2SLCA3An6ii8m13POV3lQY2DhEGDeBJOhKIOKOxTjCeAOl2Wyos
         MXSlZYPi52vzjI8feAfwJdjC7y9C2mMxRu1aowy6J8ehoPtyHb0+rfCaZwC4GzZAeyJX
         jPPgOQ2ImNFNfL2kjjwOQbIqloRt849BxoAwDzS7bAP81XXvhS0CrobrHvdl4BOLXrXe
         0FHDB+aVdPaPVl9QLfLcxQ+cBY92WlIXKkN/OGhk3+MF1EkmeVdeOqXCsSNP1dW9rsZf
         AOQg==
X-Gm-Message-State: AOJu0YxQeGsH2DKiun6qIJXlgkUa2CW5dd86QEvUgsty7VOYdC+hbkJK
	dEurMsfVLiDuMrdBjFx0eXL3Yq8n71n/k7wYPi43lJOK2Crus5wdvNW7zDoyckYYtLM=
X-Gm-Gg: ASbGncu95mRtNwRIqLDyVC8rxpcASt0WdOI0yuc+bhwBhol3S2xG4DI7rpMBDrvbEIy
	FEAwuqL9dRvpzk3fD+YNZn3L8EbsfpDXh/B7nSEc9IFuwJQ7KHfIBlfgXMIHufEbMYqvaQ+vb/G
	poTTsqv4iySOMwINGkpTrqW3PxyA5E2RMFBDRPzktVMYEV8KLJTTzSUH/+u4WsNXbjdqCLo8LKD
	o+drvGxSpPQfCrGnJKw5N85PsjI3K/3fhJxDDDCnUMNfrjkoOXwYpYeGA/BZ5DuaeRlRZzrAYGM
	H9kLpZjq1+w5z1lL7EkLOHf7lepRyvo6iFMhhJV+Nsrf7psHJj+iL/1i86psVE0fPLlffgH6elN
	bSyahUIsLRAwzemeu9jjPQyJnE9B66sivINGNGNN63oFHxiYw5J1BiWXbS/6OdoR/Wgz+e0qG
X-Google-Smtp-Source: AGHT+IH26+hLzQJtX2ss5voCJMw3O/X67D5ManbVwKM2eqgig1E2QKvsougttThvAf89+ZGPYwzR0Q==
X-Received: by 2002:a05:600c:4587:b0:456:302:6dc3 with SMTP id 5b1f17b1804b1-45a1b65585bmr25542325e9.26.1755181562146;
        Thu, 14 Aug 2025 07:26:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7336:e60:7f9e:21e6? ([2a01:e0a:3d9:2080:7336:e60:7f9e:21e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b91b05b28fsm4802655f8f.21.2025.08.14.07.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 07:26:01 -0700 (PDT)
Message-ID: <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
Date: Thu, 14 Aug 2025 16:26:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
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
In-Reply-To: <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/08/2025 13:22, Konrad Dybcio wrote:
> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>>>> the Frequency and Power Domain level, but by default we leave the
>>>> OPP core scale the interconnect ddr path.
>>>>
>>>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>> Changes in v2:
>>>> - Used proper ACV perfmode bit/freq
>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>> ---
>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>   1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>>>   			.gmu_chipid = 0x7050001,
>>>>   			.gmu_cgc_mode = 0x00020202,
>>>> +			.bcms = (const struct a6xx_bcm[]) {
>>>> +				{ .name = "SH0", .buswidth = 16 },
>>>> +				{ .name = "MC0", .buswidth = 4 },
>>>> +				{
>>>> +					.name = "ACV",
>>>> +					.fixed = true,
>>>> +					.perfmode = BIT(3),
>>>> +					.perfmode_bw = 16500000,
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
> 
> This is *very* platform-dependent, goes without saying..
> 
> I see BIT(2) is also valid for X1P4


I'm confused, Akhil can you confirm ?

Neil

> 
> Konrad


