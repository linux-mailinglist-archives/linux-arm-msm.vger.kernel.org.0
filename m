Return-Path: <linux-arm-msm+bounces-79640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7EAC1F6F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE7721A2131C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEB1340DA0;
	Thu, 30 Oct 2025 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vXNOwtZI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4773043CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761818580; cv=none; b=hMklie+ICZBSot/SpCWQsj4szStpPQVbl18mgWDhLB+wp+X6XjYZXV7DaXFv+EnEd0lF9IDTo2ZCnJA+BGBPSEvqlSiZtOo+7/ZIxNfPV0l5VRneE9JTCbzxKRmbi8+3gv+qxZSseEo5BeBfocAU2048VSFZuhzAvhdAyV9W5rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761818580; c=relaxed/simple;
	bh=nI43meaPVv7LKFa6m5bLdpfOMMPXVjutydImS6u+Y10=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fzMm30Z4lyG1w58ymyW55zwGSzFv0GXwsGEAH760DDJiv2zRw81GKBjGAtYF8N7OGF/W32vx7bRHTF7ppbfHwWAUyMM4G+U4SBx9gyxxjEKRLvblwkKv+Em2/I3BdQib4tnkFYIk87ymYbYKe8fGMIvcnHZeidCi9wi0eDJuSzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vXNOwtZI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so11797915e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761818577; x=1762423377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cZyc2F+uCR0RhVCjuRr38GEFiWRVmB/pYGXqMvYdqk=;
        b=vXNOwtZIZCdW7/UzCfP1tgR9FuCJfPunxuWLHvdJiZK9KMK0EfLVq0crtIJOik6o8Z
         inCsZ2QTSY3Mg6vbKyXL4xV6TJ9yLsPswOs3qrPEdal3Ba/Ew8wxYZr26BFXLsnxDtMp
         AyOicRiPcXloYpJvr5/2j4SfWnmmBQMjapk/jxcps7Rqy8eRPnAn//Z6tuSad7hvX93F
         jYmWnljM4EelSP9YwMRslmF9MVgbjFEf/zy5ZGdzbWKJAe2R+PFWcCO+Igax/1zebaxR
         5ySS6N4bs9bFe1zJIg9mVbR1Q8C7hMjIUJFctTG7X94edh0dwKa/NTUZE9Slkn5IMMB4
         F/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818577; x=1762423377;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7cZyc2F+uCR0RhVCjuRr38GEFiWRVmB/pYGXqMvYdqk=;
        b=NWDaY8KotN5rEk/c5s/tKggKYSWVqAfc3rFX4gm1m4poUNc92SrtYHISOhnrlzzOHw
         W00jAzBKbSTksx3fiER4c5PzCgyOjikMAAbMDpB39fkaEK0RCgJujBspTAPXSoYlSARt
         tWUHqH6sBmz+pT8shs8DyE7FMhH6Xdi62ZKq8AaqnugIyonSJw3eGrO3Gz+94iOVihI5
         39cSIwkMd+U7LTvC0xGv/4/HW57MhRQYBUIwGhXOO7c0rAoteEBeqlqRYNS0vdH3Yq0z
         dzUoDujbMHLTfN2e5aVPDl6g5RxQph60l7ntQoRqusWAC59CXsObmkJAUOZiy1Ue1BFY
         +RRg==
X-Gm-Message-State: AOJu0Yzi4s5ikGdiWkpgC/C9VcznCmkRQ/7Ohw2S2n+AzkSn3H3hoJsv
	RWr7IN0Sz2GZ7Gqzxb7Wrd/Tz8dMzdHKG3bppswZN5048c9z/Va+UgmxsEYALlgsbDQ=
X-Gm-Gg: ASbGncvU4+RMS3xEXwryZc24/kM19uAgBrVwWn7oLDETOkbnwizIOEwYOSCj6OhL/V8
	apLZ9PJITSGUl8wrYjPsoxQfz018BrF8PoUI4+NCDPOtAmYZBL9yyrIvWg5pyTqevVV2qh0BPma
	DpaZtk/Pw+eVHdT+9EYZPGObHypfSSc628hlZcz88j73rxMfWGH51MRqVmNEVw+Bid9KM2Wkc/Q
	m+i9RMx+vC+nCoJ0C3l4NpcIHz6YwRWUoeEItizPTzfN5Y6MZVEF8Vx6EBrbgoNO/KVYJk5q/ro
	wHPzlz07DZZTbohRQp/5UxkZhbR5iQruBGXrPaq8gST05u0SKGeGAgou1vJIPLBGrA/9+QbXF8v
	7EiTn/orlYWKIcw5api5YhiMT/yzalEvVTMjYJrzh8dDMKDnLBYxDpZTiKoHDBHmIMEAWXZM4Td
	ILP0VGSS8PKW36tBt9p4ItEI7suf2HoAuCLXRxAIEUoyXifj6qxwnk
X-Google-Smtp-Source: AGHT+IFJBoa9YdfMbxiAk1SCPTzm/0RQQYulj8uAJ0Kt0YVpcYoKE4JtI4r67rxKu51doX5nxSQpwA==
X-Received: by 2002:a7b:cc0b:0:b0:477:f2c:291c with SMTP id 5b1f17b1804b1-477262baa1bmr18108475e9.14.1761818576676;
        Thu, 30 Oct 2025 03:02:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3e45:b3e1:4bfc:5477? ([2a01:e0a:cad:2140:3e45:b3e1:4bfc:5477])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728ab375asm31884385e9.17.2025.10.30.03.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:02:56 -0700 (PDT)
Message-ID: <36f62e69-ef7c-4f22-93ab-32bceade3fd1@linaro.org>
Date: Thu, 30 Oct 2025 11:02:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a
 driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
 <25e829f8-60b2-4b69-8d57-ded846b5206a@linaro.org>
 <c79c55fb-3aaa-4256-a71b-fa86cd0166f7@oss.qualcomm.com>
 <bed92353-da4e-4447-97d2-10e8a333e4e0@linaro.org>
 <a15e8316-96cb-452d-b2b8-731eeb6d25d3@oss.qualcomm.com>
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
In-Reply-To: <a15e8316-96cb-452d-b2b8-731eeb6d25d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/25 10:52, Konrad Dybcio wrote:
> On 10/24/25 11:11 AM, Neil Armstrong wrote:
>> On 10/24/25 10:55, Konrad Dybcio wrote:
>>> On 10/23/25 10:27 AM, Neil Armstrong wrote:
>>>> On 10/22/25 19:09, Konrad Dybcio wrote:
>>>>> On 10/22/25 2:44 PM, Neil Armstrong wrote:
>>>>>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>>>>>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>>>>>> full performance:
>>>>>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>>>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>>>
>>>>> Does this *actually* cause any harm, by the way?
>>>>
>>>> ?
>>>>
>>>>>
>>>>> For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
>>>>> to a pair of GCC clocks and GCC refers to VDD_CX
>>>>>
>>>>> and I see these prints, yet:
>>>>>
>>>>> /sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
>>>>> /sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0
>>>>>
>>>>> /sys/kernel/debug/pm_genpd/cx/current_state:on
>>>>> /sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes
>>>>>
>>>>> I'm not super sure where that sync_state comes from either (maybe
>>>>> dev_set_drv_sync_state in pmdomain/core?)
>>>>
>>>> The way we handle the GMU so far is wrong, it abuses the driver model.
>>>>
>>>> And this is a symptom, whatever the impact it has, it needs to be fixed
>>>> in a proper way.
>>>>
>>>> The sync_state is retained because the gmu device is never probed but
>>>> has some clocks and power domains attached to it, which is clearly wrong.
>>>
>>> Yes I agree, however I'm only debating the commit message claims of
>>> 'leaving the resources in full performance', which doesn't seem to be
>>> true
>>
>> OK so the wording may be a little bit extreme, perhaps something like:
>> the GCC and GPUCC sync_state would stay pending, leaving the unused
>> power domains enabled for the lifetime of the system.
> 
> The debugfs reads above suggest this is actually not happening

Oh yeah so let's do nothing, thanks for your very useful nitpick review.

Is there anyone going to review the actual change instead of the commit message wording ?

Neil

> 
> Konrad


