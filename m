Return-Path: <linux-arm-msm+bounces-56259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D59AA4B1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 14:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C49881899DF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43E71DF25A;
	Wed, 30 Apr 2025 12:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8t56v1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E7B248F59
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 12:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016010; cv=none; b=CET3jcos++i1Vf1fbgGYZTrN6D3ybbgtWxLf7ok+tQi025E4tg4MNHOJTe5T6MklqJSKeVmAnh68Xb+M8gBJX1DD2SedNR47lZoFboHLQhp5DgReXhd5H8M5FPGfKYCrLa/ebErTdEVLH1aIhIgZs8USV3LNq29WA7P5MxIALn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016010; c=relaxed/simple;
	bh=IoIqiiPMBMxvBCe5r5FT4TcBH6BpMSCgbPfMmWJaRcM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gn2HCpnqWf73ATAaHnOxQvBJxcQNwpClbBsF7sHyf1Yo8YuV92L+MoKgC3JIIkv7VzhDsplHkQepptd7GsPqM/eAS88lNob0p+NnzLxhA0F9Xf9qZKcPXwHpjiIGqRwusLHAQFqvfo/VYQq2K2BU7HBf0RqD2l7KNlkhA6P9xag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8t56v1X; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so66089515e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 05:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746016007; x=1746620807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfJnIXMhWtJuApKPo4ttd/C2DFx961fITYNRFoaF7cw=;
        b=B8t56v1XSZIl93RjTmfmM+s+/3ZFPIWjV6o4fnUvBJO0cHg1SB+OybCXlODLAor7NU
         AfdLgfP2XGJGLD52cAnsZ5AqAgfv2MBGvLzLk2e0lGSgqsFSY1YHiv95KEEtpXJ4LK0D
         YXp60QFSVwIwluo6P+DnyW9+wds2tm5AzBjLIQmOIp7AUfzwh0tI9q3wT3E3ZmZFzqTK
         nNOxMoQmOhPsKIGC9oyWOZTnNn5I5a0pqR1IAUq9kMC3Bpb4Wvc5unhZgkrsKMR6X9+v
         xPWqczPlBTJRN5ybrygkaCsjrDyQl/nXdu44YHetLEERgISL4+2kriVItfhnSTvbZaOF
         pAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016007; x=1746620807;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DfJnIXMhWtJuApKPo4ttd/C2DFx961fITYNRFoaF7cw=;
        b=c3v/b/YQVcufSEASd5IuJhUG2JueqspIzBtqKEFYwzSO6zst1rxki2szKV34aUDLCl
         OYUx0Tzt/IUkkYyLMWspW9M38e8Kpe6tZtLQh1khXF8yTB7SZ6ZA1M/0If8PXKmbF4t3
         O00R1yA2YU7wz1R68ipWQAwYpHxD/+AfR1UCvp5qd6cLb3ieHfNjaBSvqINDIRUcUv4u
         DW/t1g+c2uMOH/5tC+KonqMwqnyTbJFtoSvVSZjqkXDK9EqqQwnc5IgxSA3jhJ8kJxOO
         s2NqoAy3AcUV/qcvb7op+96/23KZ9AB9ZzGh2ZjJfNAEtUSLYEf08RgojsrmfDCU5/MN
         jZOg==
X-Forwarded-Encrypted: i=1; AJvYcCUPzOWFa+z7D0jpgquNxs51ztIjOXVtCZK/Dq+As4/r6OF1v/Zg3pm1kEZksgugpNjGJgEAApAkkBuZe09O@vger.kernel.org
X-Gm-Message-State: AOJu0YwO3+hAcrym8MFPOb/2vLOYZUk2DOd39AGWSjNnsEzYWj+dCGnI
	vljuZdAlbSJI9Cb935EnFR7App0IbafodzWa4GWz8c0n7DpIQ0WiBoB6/uiiTOk=
X-Gm-Gg: ASbGncvb1cbBBXHpg7YT+ksZMVW6KtFFlttGtjDMmLbXsHzO/iqugkvUrm5bhlQO3do
	0pL+/UkDFnkzS6Kw3G1VskEHYJdV3KS1ejGj6hHV6qVW5S79g/A09tElf8Se53Y7dC3nVpQsvLh
	uRsdXvM+0dpKNqvP9+CnGBoNqHn4vOKcbfZuiIZ90loqF5F5z87KxY+8Ugo/XLIDwK830ZBuR+W
	DZzthQ3agSJKOQNhossxqe+HadGZsXL4UVRyF2fhdwTMCHE2ftFcjBobOu7XtE13QS/j6wdDbY/
	Sb8JMAQ+0IpyeYuZHloC4sft/ljbrYg0WDTVRCVcCP2lN5fxZR5qymiRtyijBlZEfIuv2p6AWsB
	v8zleIWSDNaZSi7afEA==
X-Google-Smtp-Source: AGHT+IG6MqGYW7/50i6ev+VZL1WzPog5uew6KG1T5nQ/er1qsC85a42modlcTSimxs2lB5RGaw7g/g==
X-Received: by 2002:a05:600c:3b8f:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-441b1f2f0c1mr27861525e9.7.1746016007016;
        Wed, 30 Apr 2025 05:26:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3d6:213c:5c50:7785? ([2a01:e0a:3d9:2080:b3d6:213c:5c50:7785])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b20aa6sm23948875e9.27.2025.04.30.05.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 05:26:46 -0700 (PDT)
Message-ID: <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
Date: Wed, 30 Apr 2025 14:26:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
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
In-Reply-To: <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/04/2025 13:34, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Add speebin data for A740, as found on SM8550 and derivative SoCs.
> 
> For non-development SoCs it seems that "everything except FC_AC, FC_AF
> should be speedbin 1", but what the values are for said "everything" are
> not known, so that's an exercise left to the user..
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -11,6 +11,9 @@
>   #include "a6xx.xml.h"
>   #include "a6xx_gmu.xml.h"
>   
> +#include <linux/soc/qcom/smem.h>
> +#include <linux/soc/qcom/socinfo.h>
> +
>   static const struct adreno_reglist a612_hwcg[] = {
>   	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>   	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>   		},
>   		.address_space_size = SZ_16G,
>   		.preempt_record_size = 4192 * SZ_1K,
> +		.speedbins = ADRENO_SPEEDBINS(
> +			{ ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
> +			{ ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
> +			/* Other feature codes (on prod SoCs) should match to speedbin 1 */

I'm trying to understand this sentence. because reading patch 4, when there's no match
devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?

Before this change the fallback was speedbin = BIT(0), but this disappeared.

Neil

> +		),
>   	}, {
>   		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
>   		.family = ADRENO_7XX_GEN2,
> 


