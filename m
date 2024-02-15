Return-Path: <linux-arm-msm+bounces-11162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E6B855E3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 10:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F4DDB26231
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D7F1759E;
	Thu, 15 Feb 2024 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bnrl+yuV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE27A1755E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707989402; cv=none; b=QgySeCljLaiPOYk4e+zOO2yk8euZ5f752KSnGBBB6Dp8+u9UiUrxXY35i5TdP0Wky+/83iay/29bRxhwn+D1mF69rw/aiuTaNVivwXgdohNSnIzp2pXj2vA3gshfZ4J1mHbytKT2+A4rwhDgzguDDF0txB12lYkA5p7rPEblv+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707989402; c=relaxed/simple;
	bh=sD1bsJwMjAFQ13ViHkkmSIV96Jgd7fYEtMS8umuilg0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dSTX27FWt/4EEW+6xSgSCQ09boLh0iTO/AinauAKYcstv6zlD1ufKmOKgwNJ30FPYgEzcC9/ZxWv3FhtbhRRccDejJQ0wP6mqUxjp1wgbtUcL/2p8TJwQ7bQWUYEIXFoLQPTl+veEfjtgTcfxgS+/u/7Fxfv6lMd7ltcXYYbZOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bnrl+yuV; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d208be133bso4806711fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 01:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707989399; x=1708594199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmOpXYe614s1w+uX5FaR6Zt6hCQGhtbYPhMdt0CcCLo=;
        b=Bnrl+yuVCsqw4eTWMKo6rcjFfj4MQqkw+i/n6v+T8v8OCXrxgUBuKMVqLmaHDya5eH
         3VBmEe0SCvNmIdoAE8KSgUBLeN6Zg42DSTF599MyMWXG6RfzAlbRzgEl5r85hXiZeelU
         mYaSjXHG+ExizlKAMBBKdtXaq3UjA6zx6kpnN0FHlzIcBUxkV8D1CzHTFKR1xF3z5XjA
         Vj5gKrFfdFfBqr+SNTaVp8c778+eO8cMRx+CQcRGEousHUs2jXYvnRjKGX2UGP+YgpBg
         Z0GELztWnJvDypduvVMPc1vsQYeRe+cy42cWKl2EvbgOM0l40ujNS/d1dEc14jmFc49x
         KOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989399; x=1708594199;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VmOpXYe614s1w+uX5FaR6Zt6hCQGhtbYPhMdt0CcCLo=;
        b=jdYFkmj9hJs5+YgPsOp7fNLMFImP9UQZQTEDLFPJokCAfs6vN1dvpu7EpR8s9OgpzZ
         TF5LUaqKuL8jthmdOWysDt9cBzvwy/F41pJEgDKBrSRVMzr2u9o//LQWSUJraVOtRisO
         muoCa+gb066qQfD00zV4KxtAMkmHWtXbLG4W/UXlgtm4Hh9GfRp6rtO0svrhY8ZPDNSt
         CNSf0Y/MmSYaRbMR7T83Ewbf3hKLpG0+mQugq6aNcljjnBIRZTp9ARiQ9nvdlyPgk745
         vmaWq21Q03EvUO4uSAJYNaZwiuAMYlo1bxOTInGbj0gcnw7WiBifcpqlPURNns57i1pJ
         n/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVfsEtUK0tQi7g1apKSvrX+0oorXz1LKb4ehbGV/DpFjTZdKH4wXMND/blD0FD6C1l6/8G0sbnwUINI0A/RSjb2vpt/VAQz/A9OeocYw==
X-Gm-Message-State: AOJu0YxvMc2ACyXCzYsoW2Wr5FEbZQdmdsJqMNgR/v3kop9KTjUU65jA
	FKPmIJ7HYGEEv8d1VV4nyueE1SrdQKyynoAxNiXI/o0Suq8HACIK6us3yYBjRjw=
X-Google-Smtp-Source: AGHT+IEuFGqFxGBfmmBUmEzoDATve7jHeXbEQRCoqEiqnF8PVK28X2sVOXLp6dDGXz+4L0UUY8TwFA==
X-Received: by 2002:a19:ca01:0:b0:511:79ac:ec0f with SMTP id a1-20020a19ca01000000b0051179acec0fmr963353lfg.26.1707989398807;
        Thu, 15 Feb 2024 01:29:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4589:7160:c264:fa3b? ([2a01:e0a:982:cbb0:4589:7160:c264:fa3b])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b004120b4c57c9sm1398694wmo.4.2024.02.15.01.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 01:29:58 -0800 (PST)
Message-ID: <ffb16ef6-fc9a-42b1-b9c3-4e8f6b52d849@linaro.org>
Date: Thu, 15 Feb 2024 10:29:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/6] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
 <20240215-topic-sm8650-gpu-v2-2-6be0b4bf2e09@linaro.org>
 <CAA8EJprpYEhGi5b+uWGWtOa+qbSwUR8C0j9NLC+ah_-nvy-=Ng@mail.gmail.com>
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
In-Reply-To: <CAA8EJprpYEhGi5b+uWGWtOa+qbSwUR8C0j9NLC+ah_-nvy-=Ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/02/2024 10:25, Dmitry Baryshkov wrote:
> On Thu, 15 Feb 2024 at 11:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Document the GPU SMMU found on the SM8650 platform.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index a4042ae24770..3ad5c850f3bf 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -93,6 +93,7 @@ properties:
>>                 - qcom,sm8350-smmu-500
>>                 - qcom,sm8450-smmu-500
>>                 - qcom,sm8550-smmu-500
>> +              - qcom,sm8650-smmu-500
>>             - const: qcom,adreno-smmu
>>             - const: qcom,smmu-500
>>             - const: arm,mmu-500
>> @@ -508,7 +509,10 @@ allOf:
>>     - if:
>>         properties:
>>           compatible:
>> -          const: qcom,sm8550-smmu-500
>> +          contains:
>> +            enum:
>> +              - qcom,sm8550-smmu-500
>> +              - qcom,sm8650-smmu-500
> 
> Doesn't this cause warnings for non-GPU SMMU on this platform?

No because it doesn't add those to required, it simply allows clock the properties.

> 
>>       then:
>>         properties:
>>           clock-names:
>> @@ -544,7 +548,6 @@ allOf:
>>                 - qcom,sdx65-smmu-500
>>                 - qcom,sm6350-smmu-500
>>                 - qcom,sm6375-smmu-500
>> -              - qcom,sm8650-smmu-500
>>                 - qcom,x1e80100-smmu-500
>>       then:
>>         properties:
>>
>> --
>> 2.34.1
>>
> 
> 


