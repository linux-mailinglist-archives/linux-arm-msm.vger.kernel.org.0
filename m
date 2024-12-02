Return-Path: <linux-arm-msm+bounces-39795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B549DFC64
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 966A4283FE8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 08:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930311F9F6C;
	Mon,  2 Dec 2024 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zb2yPi8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C91D6DD8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 08:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733129271; cv=none; b=BPd0RKplMq81j669ux8rR8HEJGloHdgEYfe3IN6WaB1ssqsC3FvkAE3p6hQ5f3hti9JNbPlewn2zGqGvyNs9tLbzhC1boS13qpQ2nmUedJouXZmJH3H9KFmjuai/093r685UHc3yYqSoNxVYCrIdvskKu5WQCNLcOFrEo7EYJWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733129271; c=relaxed/simple;
	bh=iQswkUcZqkc3rR4ZXaPjtScTrAFdnuNfZ8doDQQU5jU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U3FDMrP6CD2KdqyPzQVAGlz2X1OU6Avcdv9rGEbKbgPdOwTfUDG+ceIWo9O8v64NO3p3d0ToWEH+Kqet2oiIXHuctgDEazxzXTlhmzJFicK6NuKd4NmTqtCnxOgpPnDJVQ3SNxGPerEKYiy1DxShmimPMsyHsm3X5xdvv17HQVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zb2yPi8A; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so33981415e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 00:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733129267; x=1733734067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=868g4RybWVTONYV+5WNJ4Psz8+PDv8VmyMXOni0Et/E=;
        b=Zb2yPi8ACqP9AgTihZD7sit1rkGQU9Eq/kkTAv/aXe0KDMv/pZg955arVNi0ALiUp/
         tqXlUomr6UC4R8A7cByVcB/D4Qj//hWa/HWLsg5mly5f+sSyg6C++AxcwhbfWQX5YLD5
         tJ1PThhKpXAtYDi/tl/QMArnSEqMjpkKQeaX/47DlXcdo8CMuU8Ri3P34H3LqA36jjwJ
         yasCGSV9psfWgd3//YzNCHpGDo3MUGNCbH6bhoQRaiafko/gxXo9n0R7QLvn+Jlmd6Px
         1BY2dG5b9cV7NktVqOW6Av15WW5ofkYy2H4UCGEIJkgNOAw9UVyPT8oJ+YZygKlic3/4
         ckfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733129267; x=1733734067;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=868g4RybWVTONYV+5WNJ4Psz8+PDv8VmyMXOni0Et/E=;
        b=UgnFx5Ne6qvCA615zhFFZe9zHEAFLk/zGrwr6Ewq/6NutHxGwicdY7jOLFhHCfRk5m
         DAV2DB3iYjfxtt0w1ma72bZm9JfKcJ+nz3mNQcZUoJqvSpO/MCHUT+VXp3tYOzdWYHAI
         Y1wVIAq6tJ+4YQg6mBLow5gnTzRHzReCJC6XEHim2qmU4jDGqJuTm0U1UNQ9qJS7dL/i
         oXX5VHJjAwbVDbrjViL0i1yysNJX2TFCxg7yY44+yMz3iplV9ZGJOmrq0OHMKHICICB1
         MGACJCRaAtZ5Ng4IuiEBF+wxyxNPq3hvCUafIDkDlLCoWRbuWym59OrYZMiY9fdA9TST
         Bujg==
X-Gm-Message-State: AOJu0YyVnulX2/xrlRn4UupjiGCkiJpxaDWHn9Gc1RO3OHR9Cwx/ce8s
	6td6u6m1h5zSY2R6loT5Q+UZLGs0xlYOFDJEynzpVGYBuGtceqhRzfZmGc8XOeY=
X-Gm-Gg: ASbGnctK8JAJvUN7DdD5m+i80qBuT09kOQnVkMw/GYy3nn2L+LS+MlPXkkd28lKasFb
	0mloWj0ieV/prvPcHVFcjsMwVxO3dSchzDMSH8fkdVQhS3XoUTQTzq3yNKF756UbFoe3YakOnlH
	+q3QCQSakgg7wQgieeWtO8PhKzTzIcW2ghMWWJtJjVqMKPX9/iNZWL3v10KYUqZCp+VKkun2D8q
	kcBW26mQLyqZYnfKkkhqfO7F4XaNfATUHKQ7Hm/PT4B52D3qHBrHf47Cj8oIKMkFPJ47bvwHN0l
	RvJw2fMl874Hs3fdyx2O2pVsf+0=
X-Google-Smtp-Source: AGHT+IGJHbzNJoBprBMkButUw4pIj5gIiLHg+0YoFuF1r/DNY4OA1vmPgg66dYl398uyPtEYyLRRXg==
X-Received: by 2002:a05:600c:1d9c:b0:434:9ef2:f6e3 with SMTP id 5b1f17b1804b1-434a9dbf66bmr188026545e9.8.1733129267215;
        Mon, 02 Dec 2024 00:47:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1485:2a78:787c:c669? ([2a01:e0a:982:cbb0:1485:2a78:787c:c669])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f0056637sm3156494f8f.15.2024.12.02.00.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 00:47:46 -0800 (PST)
Message-ID: <9add2288-36eb-43cd-a591-68f1819fb911@linaro.org>
Date: Mon, 2 Dec 2024 09:47:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>
 <5fc71011-7a67-47b9-b372-b5e52ffea757@oss.qualcomm.com>
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
In-Reply-To: <5fc71011-7a67-47b9-b372-b5e52ffea757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2024 16:25, Konrad Dybcio wrote:
> On 28.11.2024 11:25 AM, Neil Armstrong wrote:
>> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
>> is in place, declare the Bus Control Modules (BCMs) and the
>> corresponding parameters in the GPU info struct and add the
>> GMU_BW_VOTE feature bit to enable it.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.gmu_chipid = 0x7020100,
>>   			.gmu_cgc_mode = 0x00020202,
>> +			.bcms = (const struct a6xx_bcm[]) {
>> +				{ .name = "SH0", .buswidth = 16 },
>> +				{ .name = "MC0", .buswidth = 4 },
>> +				{
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(3),
>> +					.perfmode_bw = 16500000,
>> +				},
>> +				{ /* sentinel */ },
>> +			},
> 
> This is not going to fly the second there's two SoCs implementing the
> same GPU with a difference in bus topology. I think we could add
> something like drvdata to ICC nodes and use it for BCMs on icc-rpmh.
> Then, we could retrieve it from the interconnect path we get from the
> dt node. It would also reduce duplication.

I don't want to go into that, we can optimize this when adding topologies
for other GPUs later, as-is this is a pointer so we can already share the
same table between GPUs.

> 
> Konrad


