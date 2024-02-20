Return-Path: <linux-arm-msm+bounces-11774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D18685B578
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 09:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E99741F2204A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 08:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3985D732;
	Tue, 20 Feb 2024 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VD4gUbH7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EDD5BAE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708418315; cv=none; b=bs1AsPC4EJE3d9IZvqc1R4VH1r91VTm+FkMasWtP/NhppXok+jbsFOEneTeD/PGduNohGkny8qZZxtUJk9BFGkbiYr+mbpCUKCWAb2P8AGi5sy3ASxOxBgr++TKJPIOecfizP08gAn3XtkUoR71ixbBu1CJw3rQFKRW44iYYSDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708418315; c=relaxed/simple;
	bh=ALQjbo7dedlRuzpfkpxyD61RWnylLXK6v03q2r6nC0M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gE9EuaPeGhThcSVeouQ7eznYqGQWEygVr4Glq1uSjwaQGDza6TWflSRzMMTvUrOKIvRxK6l22+zyGYedZgIvepmYjK99+DRG5ABs9eA5k+cEOHgnzWcqK5x2UzBvvx3h6SKnO1c/v/1vjHpNEGs8FSmfS+FB1oIuV3zJPq1NZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VD4gUbH7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a28a6cef709so569996266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 00:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708418312; x=1709023112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJGa4Iif74KIq28HuBx0obq22VL2V9cwPjQcH9f77gk=;
        b=VD4gUbH7tcAAKtcwMJBpqOMorZhIomyKNkeVENdcaKW2LwK+/sTkuWGUpJ48rpiCkR
         iZ4rii2OwLqr8DHU1NgJWqBjWfoEA7ccFXC6jpmoqIPJOsaBzLeOE8vtpQd9SOCOMikB
         9WUjM6Um5YJFlmHH6doe94jdtAaNyiPXLBjyZrS5CMzc6zrqrd+TzEVgtjdNzQGkip7I
         4/v+0xnNlL1IuNUoMHDWmhtMrxSgBXd7TByxSdN1u4AEdRj8gJH3qwEil/7CaUm+tJCj
         OHVu6IbV8su0kteERUvjZmFNims7ObQtXEuBpSQ4NZ2sr93AakJ2Sl0I4ir/z0ktoiNT
         s0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708418312; x=1709023112;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kJGa4Iif74KIq28HuBx0obq22VL2V9cwPjQcH9f77gk=;
        b=VgLo6+YDRD7TwoOOJJpc/WlhthN72OWfTynhjm2m+DaT80MnjAsNBoG9y3//hJwwQp
         ig+N/xzJ2dScUOxdvIIW5cMt9DmKQ2TEqEGOnBKvOGVyay6PbIFz8HLT+rmi/zNW+aQ8
         LlCg/a65FizT2/lVR5osfUfvFy0LfnNhR2pRWoqAnCBfCJb5HxsYDqgFB40Sa3NtVsr0
         eMhWuvzFO7S9TAj5mIrezxmJvLfNQb8GgQWHpqBG0IGnIcaqKuYtLWLD1MHMCCVfNNfS
         N46mUtAbOitArn8R7Cn6pLWZUm5BQYDNxjZUyNxHMfejd0YCd4zo0xWMtHEMNhlV1f9e
         hC1w==
X-Forwarded-Encrypted: i=1; AJvYcCXhzbh58o/OkFWpJHqVtnr4aPVZsgQWS95L/BTnhRWbwdwnOmLLfENcVsB9CvuX7ZtT/m7MlEnZMIO0KP8C6shg3NVFWuKR7DlHx3zt5g==
X-Gm-Message-State: AOJu0Yzp4XYob+8Mp47GL0woS+MvicI3n/osxFNNZVl7qO4tlNK7DpuM
	JHliNEPFsvy7N1gbB+pLlw00JV++cCUNFiAb74jt/eaf2/iTBIn0fHShHYlMHLM=
X-Google-Smtp-Source: AGHT+IG5sof+uEBFLugZ3URqtm9eYBKvIS7ypPMXhjAaCDviRIT2l26ljktZ4RfQuw9pU3z3NdDz/g==
X-Received: by 2002:a17:906:ce4a:b0:a3e:720a:b961 with SMTP id se10-20020a170906ce4a00b00a3e720ab961mr4048248ejb.34.1708418312170;
        Tue, 20 Feb 2024 00:38:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bd84:e8aa:cf30:cb6e? ([2a01:e0a:982:cbb0:bd84:e8aa:cf30:cb6e])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c294500b00410df4bf22esm13596294wmd.38.2024.02.20.00.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 00:38:31 -0800 (PST)
Message-ID: <90290e71-6d85-4aaa-af5b-79c44bc786ef@linaro.org>
Date: Tue, 20 Feb 2024 09:38:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 8/8] arm64: dts: qcom: qrb2210-rb1: Enable the GPU
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-8-d260fa854707@linaro.org>
 <CAA8EJppPvXfkz=wVca8aFBhFaVUe9+OiVzcQUq7D8zPbK+T1FQ@mail.gmail.com>
 <b73e329a-02a4-46e0-bda4-5d5fae0a1180@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <b73e329a-02a4-46e0-bda4-5d5fae0a1180@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/02/2024 22:37, Konrad Dybcio wrote:
> On 19.02.2024 15:49, Dmitry Baryshkov wrote:
>> On Mon, 19 Feb 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>> Enable the A702 GPU (also marketed as "3D accelerator by qcom [1], lol).
>>
>> Is it not?
> 
> Sure, every electronic device is also a heater, I suppose.. I found
> this wording extremely funny though


GPU (Graphics Processing Unit) isn't accurate either since it can also run compute shaders do to non graphics processing,
so 3D Accelerator isn't that different.

A proper term would be Vectorized Mathematical Computing Complex or something similar.

Neil

> 
>>
>>>
>>> [1] https://docs.qualcomm.com/bundle/publicresource/87-61720-1_REV_A_QUALCOMM_ROBOTICS_RB1_PLATFORM__QUALCOMM_QRB2210__PRODUCT_BRIEF.pdf
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> With the exception of the commit message:
> 
> :(
> 
> Konrad
> 
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>
>>
> 


