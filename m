Return-Path: <linux-arm-msm+bounces-41423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1D79EC702
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DEB61889103
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79511D86F2;
	Wed, 11 Dec 2024 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X+jivWVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAD11D79B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905428; cv=none; b=RMs49buP/PKuXEhi73eJ++u+Z5dTE6BMU03ppQk388VyBNZwGRw9VC3HZMlnmKiPNM6DQI6zquvK9Ccrqgf9piNqWJegWZCByAYm+ieBoraFUbmf7YwkjFTCYOUNlcMNQNJBdK5WYcA5ukGycgFQSXqE0gFmFO04Nupazh+IV3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905428; c=relaxed/simple;
	bh=hGrtyo4T6ECkwK1tjXoo7Q0FIH601agA6UGvl2fLa/s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=q2tSlWtmF/1BR2/ja6liTXn78lN5d4LKfMp6/gLLAD95vli/nL4FahQcdZ+VjGNKbeok4xbfZROrZTh7kVZ9KdACG7lzx9B6t0NdJ4nP1tQi+fz8NrSY9s8pyPXxl6gi9JlpJQ/37yoCgyB+7HrloxrMCQduKlY6du+lOQ4Tsd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X+jivWVu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385ed7f6605so2873897f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733905425; x=1734510225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tc6e8x3Y2yJVBLDwF3tycQz8lImgNaHz3Vj84SxFzmw=;
        b=X+jivWVuEa5+eF4kKkcDXkF8dLSziPgz14vVepcMtzoC2oDr8DtM6KvaWOkkSfJJbe
         MTT1xe+ulmb9WlaUZdIocH7wFSCZ+F0dbHywPOxg+jC5YoVlWIlp4fuxZtPtLJWMGvLX
         MTBmqDI7OxLlsLFIJQWSk9thWZ3PQvTZ6EOyy4tcs3LA6FPdSGU30eZoxiQJBtcz6PNY
         MpIyWH6krkiSvRS7PZWhITKyV8LBpSzUH7ock47tj6p+vzZ5ONr2OgCf+YQcVal3JRdH
         lGkNk+2OL5lbSP48+U3UwqCUcU1QgSihOUS6Z8pX4IdbwKJxozj7k/tNgOnrhBktMqeM
         w15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905425; x=1734510225;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tc6e8x3Y2yJVBLDwF3tycQz8lImgNaHz3Vj84SxFzmw=;
        b=CDx58Eni5HFgOBAVy8kXv08F/cnLBT7WKliewARQYwAeWPnsD+I5+/a01vDIPI2m9t
         euHTrvy15XVUTl/N4GaT3dvU6lhU/L2FZLpQ8dc6GeVzWcC066GcE5bp2aZY55T9RXWu
         TNo4Hab3gsrnHmbTMbTrvqnki6lkvWitHpQ+tEq45WwuxvfRkiHdPcuIQYB2pEHde68/
         /qVEaF0zX7IRSNdewBayllMVgAlqoFxCW/C3qfkS0oJkNOadqNK44CYEVjCWV/Hw39Bg
         u8DKUzBaoytuFL7S/rRiv5bJuaemjrhLacjLvxVB2WCmRKrqhM0ouFBI/sAv0gVU6zg3
         XMQg==
X-Forwarded-Encrypted: i=1; AJvYcCUVNdMQ44LMqFK0Ph4VeLi4CkeRlpsM8OP98WtsvhtcvB6Q3NVtXr9jpgc4s4WIB+Z5z1y9Fy/4c9lUHzcb@vger.kernel.org
X-Gm-Message-State: AOJu0YwhKxZO3a4AmLDbSO9EJcjNsh/vL208+MteCt+0nx7ol/SZuxAl
	T0B59m/8EzDaSlQiCtaaDCZoVkHH3XO64fCMHc0rOuAZt6JXgcFYJA0V9M4bN4A=
X-Gm-Gg: ASbGncu+OVwjGuxrCu9Ht/7iperY9vhQHAU83uyZXJahDj5/Gjo/Wr9WWsucJ2dYodP
	hA1jMMPfIFMZpyo8T+/hRxGnHEENYadvbbkHoie83GCiE8NPueq69tpUWuMQd0t8q0ocDwGDJvc
	ogjc1uzN9p1RMXArVU1lNrwONbwfgH+SyU1z1ga2uJXD60jKpU4mYmPEYD101G1497xEY5N+OC9
	pdOzDvmsHqmIz26Iq5vw0MQRkntJzco9M0U7YphqMlX7gZxmKmqpccp2zWvulCYqk7+kckgR0oL
	hAbaNahYsxATq4YsXbFKlw/WzEj+/tU=
X-Google-Smtp-Source: AGHT+IGEi9agyoEzTdWmCqTOqIAkVp1VR630KO2OVwmzbLRVaXPRYWwH67ybi3Ye9LMc/1v1TFeoPA==
X-Received: by 2002:a5d:6c62:0:b0:385:fae4:424e with SMTP id ffacd0b85a97d-3864cea43famr1492564f8f.52.1733905424397;
        Wed, 11 Dec 2024 00:23:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d426:8f10:1673:5657? ([2a01:e0a:982:cbb0:d426:8f10:1673:5657])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514dadsm707894f8f.68.2024.12.11.00.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 00:23:43 -0800 (PST)
Message-ID: <d7616518-f108-49f2-9e24-64ecb207be89@linaro.org>
Date: Wed, 11 Dec 2024 09:23:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 05/11] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-5-4deb87be2498@linaro.org>
 <20241123212246.46hdznrgusr2pj4v@hu-akhilpo-hyd.qualcomm.com>
 <20241123224648.kgc6hxdsgz4shhw4@hu-akhilpo-hyd.qualcomm.com>
 <1f322b31-a516-4ff8-84b1-5000cdfc1c4a@linaro.org>
 <16e646ff-7bc1-4dad-9fcd-d4346c1dde96@quicinc.com>
 <85977827-5f17-4071-a8a5-adefadce0ca2@linaro.org>
 <512701db-cdc9-44f3-819f-23752e28f06e@quicinc.com>
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
In-Reply-To: <512701db-cdc9-44f3-819f-23752e28f06e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/11/2024 21:36, Akhil P Oommen wrote:
> On 11/27/2024 9:17 PM, neil.armstrong@linaro.org wrote:
>> On 27/11/2024 16:29, Akhil P Oommen wrote:
>>> On 11/25/2024 1:42 PM, Neil Armstrong wrote:
>>>> On 23/11/2024 23:46, Akhil P Oommen wrote:
>>>>> On Sun, Nov 24, 2024 at 02:52:46AM +0530, Akhil P Oommen wrote:
>>>>>> On Tue, Nov 19, 2024 at 06:56:40PM +0100, Neil Armstrong wrote:
>>>>>>> The Adreno GMU Management Unit (GMU) can also scale DDR Bandwidth
>>>>>>> along
>>>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>>>> OPP core scale the interconnect ddr path.
>>>>>>>
>>>>>>> In order to calculate vote values used by the GPU Management
>>>>>>> Unit (GMU), we need to parse all the possible OPP Bandwidths and
>>>>>>
>>>>>> GMU expects a table of votes for each DDR frequency corners. Can we
>>>>>> please try to figure out a way to do that? Generally, we should
>>>>>> ensure the
>>>>>> data that is send to GMU firmware match downstream exactly. Because,
>>>>>> when something breaks in firmware or worst, at SoC level, it will be
>>>>>> pretty
>>>>>> hard to narrow down the issue. So, I prefer to be very conservative
>>>>>> about
>>>>>> this.
>>>>>>
>>>>>> KGSL keeps the ddr frequency table in the devicetree. That helps to
>>>>>> keep
>>>>>> the driver lean, but I am not sure if that is viable upstream.
>>>>
>>>> No it's not, opp table is here for that, and we can reproduce the same
>>>> bahaviour by parsing all the bandwidths in the opp table.
>>>>
>>>>>>
>>>>>> -Akhil.
>>>>>>
>>>>>>> create a vote value to be sent to the appropriate Bus Control
>>>>>>> Modules (BCMs) declared in the GPU info struct.
>>>>>>>
>>>>>>> The vote array will then be used to dynamically generate the GMU
>>>>>>> bw_table sent during the GMU power-up.
>>>>>>>
>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 153 ++++++++++++++++++++++
>>>>>>> ++++++++++++
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  14 ++++
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>>>>>>>     3 files changed, 168 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/
>>>>>>> drm/msm/adreno/a6xx_gmu.c
>>>>>>> index
>>>>>>> 14db7376c712d19446b38152e480bd5a1e0a5198..f6814d92a4edb29ba8a34a34aabb8b2324e9c6a4 100644
>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>> @@ -9,6 +9,7 @@
>>>>>>>     #include <linux/pm_domain.h>
>>>>>>>     #include <linux/pm_opp.h>
>>>>>>>     #include <soc/qcom/cmd-db.h>
>>>>>>> +#include <soc/qcom/tcs.h>
>>>>>>>     #include <drm/drm_gem.h>
>>>>>>>       #include "a6xx_gpu.h"
>>>>>>> @@ -1287,6 +1288,109 @@ static int a6xx_gmu_memory_probe(struct
>>>>>>> a6xx_gmu *gmu)
>>>>>>>         return 0;
>>>>>>>     }
>>>>>>>     +/**
>>>>>>> + * struct bcm_db - Auxiliary data pertaining to each Bus Clock
>>>>>>> Manager (BCM)
>>>>>>> + * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
>>>>>>> + * @width: multiplier used to convert bytes/sec bw value to an RPMh
>>>>>>> msg
>>>>>>> + * @vcd: virtual clock domain that this bcm belongs to
>>>>>>> + * @reserved: reserved field
>>>>>>> + */
>>>>>>> +struct bcm_db {
>>>>>>> +    __le32 unit;
>>>>>>> +    __le16 width;
>>>>>>> +    u8 vcd;
>>>>>>> +    u8 reserved;
>>>>>>> +};
>>>>>
>>>>> Shouldn't this be a packed struct? It is naturally aligned, but still!
>>>>
>>>> It's used as-is in the interconnecty driver, so I assume it's fine.
>>>>
>>>>>
>>>>>>> +
>>>>>>> +static u64 bcm_div(u64 num, u32 base)
>>>>>>> +{
>>>>>>> +    /* Ensure that small votes aren't lost. */
>>>>>>> +    if (num && num < base)
>>>>>>> +        return 1;
>>>>>>> +
>>>>>>> +    do_div(num, base);
>>>>>>> +
>>>>>>> +    return num;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info,
>>>>>>> +                       struct a6xx_gmu *gmu)
>>>>>>> +{
>>>>>>> +    const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
>>>>>>> +    unsigned int bcm_index, bw_index;
>>>>>>> +
>>>>>>> +    /* Retrieve BCM data from cmd-db */
>>>>>>> +    for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
>>>>>>> +        size_t count;
>>>>>>> +
>>>>>>> +        /* Skip unconfigured BCM */
>>>>>>> +        if (!info->bcm[bcm_index].name)
>>>>>>> +            continue;
>>>>>>> +
>>>>>>> +        bcm_data[bcm_index] = cmd_db_read_aux_data(
>>>>>>> +                        info->bcm[bcm_index].name,
>>>>>>> +                        &count);
>>>>>>> +        if (IS_ERR(bcm_data[bcm_index]))
>>>>>>> +            return PTR_ERR(bcm_data[bcm_index]);
>>>>>>> +
>>>>>>> +        if (!count)
>>>>>>> +            return -EINVAL;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* Generate BCM votes values for each bandwidth & BCM */
>>>>>>> +    for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
>>>>>>> +        u32 *data = gmu->gpu_bw_votes[bw_index];
>>>>>>> +        u32 bw = gmu->gpu_bw_table[bw_index];
>>>>>>> +
>>>>>>> +        /* Calculations loosely copied from bcm_aggregate() &
>>>>>>> tcs_cmd_gen() */
>>>>>>> +        for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
>>>>>>> +            bool commit = false;
>>>>>>> +            u64 peak, vote;
>>>>>>> +            u16 width;
>>>>>>> +            u32 unit;
>>>>>>> +
>>>>>>> +            /* Skip unconfigured BCM */
>>>>>>> +            if (!info->bcm[bcm_index].name || !bcm_data[bcm_index])
>>>>>>> +                continue;
>>>>>>> +
>>>>>>> +            if (bcm_index == GMU_MAX_BCMS - 1 ||
>>>>>>> +                (bcm_data[bcm_index + 1] &&
>>>>>>> +                 bcm_data[bcm_index]->vcd != bcm_data[bcm_index +
>>>>>>> 1]->vcd))
>>>>>>> +                commit = true;
>>>>>>> +
>>>>>>> +            if (!bw) {
>>>>>>> +                data[bcm_index] = BCM_TCS_CMD(commit, false, 0, 0);
>>>>>>> +                continue;
>>>>>>> +            }
>>>>>>> +
>>>>>>> +            if (info->bcm[bcm_index].fixed) {
>>>>>>> +                u32 perfmode = 0;
>>>>>>> +
>>>>>>> +                if (bw >= info->bcm[bcm_index].perfmode_bw)
>>>>>>> +                    perfmode = info->bcm[bcm_index].perfmode;
>>>>>>> +
>>>>>>> +                data[bcm_index] = BCM_TCS_CMD(commit, true, 0,
>>>>>>> perfmode);
>>>>>>> +                continue;
>>>>>>> +            }
>>>>>>> +
>>>>>>> +            /* Multiply the bandwidth by the width of the
>>>>>>> connection */
>>>>>>> +            width = le16_to_cpu(bcm_data[bcm_index]->width);
>>>>>>> +            peak = bcm_div((u64)bw * width, info-
>>>>>>>> bcm[bcm_index].buswidth);
>>>>>>> +
>>>>>>> +            /* Input bandwidth value is in KBps, scale the value to
>>>>>>> BCM unit */
>>>>>>> +            unit = le32_to_cpu(bcm_data[bcm_index]->unit);
>>>>>>> +            vote = bcm_div(peak * 1000ULL, unit);
>>>>>>> +
>>>>>>> +            if (vote > BCM_TCS_CMD_VOTE_MASK)
>>>>>>> +                vote = BCM_TCS_CMD_VOTE_MASK;
>>>>>>> +
>>>>>>> +            data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>>     /* Return the 'arc-level' for the given frequency */
>>>>>>>     static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
>>>>>>>                            unsigned long freq)
>>>>>>> @@ -1390,12 +1494,15 @@ static int
>>>>>>> a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>>>>>>>      * The GMU votes with the RPMh for itself and on behalf of the GPU
>>>>>>> but we need
>>>>>>>      * to construct the list of votes on the CPU and send it over.
>>>>>>> Query the RPMh
>>>>>>>      * voltage levels and build the votes
>>>>>>> + * The GMU can also vote for DDR interconnects, use the OPP
>>>>>>> bandwidth entries
>>>>>>> + * and BCM parameters to build the votes.
>>>>>>>      */
>>>>>>>       static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>>>>>>>     {
>>>>>>>         struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu,
>>>>>>> gmu);
>>>>>>>         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>>>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>>>>>         struct msm_gpu *gpu = &adreno_gpu->base;
>>>>>>>         int ret;
>>>>>>>     @@ -1407,6 +1514,10 @@ static int a6xx_gmu_rpmh_votes_init(struct
>>>>>>> a6xx_gmu *gmu)
>>>>>>>         ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu-
>>>>>>>> cx_arc_votes,
>>>>>>>             gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
>>>>>>>     +    /* Build the interconnect votes */
>>>>>>> +    if (adreno_gpu->info->features & ADRENO_FEAT_GMU_BW_VOTE)
>>>>>>> +        ret |= a6xx_gmu_rpmh_bw_votes_init(info, gmu);
>>>>>>> +
>>>>>>>         return ret;
>>>>>>>     }
>>>>>>>     @@ -1442,6 +1553,38 @@ static int a6xx_gmu_build_freq_table(struct
>>>>>>> device *dev, unsigned long *freqs,
>>>>>>>         return index;
>>>>>>>     }
>>>>>>>     +static int a6xx_gmu_build_bw_table(struct device *dev, unsigned
>>>>>>> long *bandwidths,
>>>>>>> +        u32 size)
>>>>>>> +{
>>>>>>> +    int count = dev_pm_opp_get_opp_count(dev);
>>>>>
>>>>> I suppose this doesn't count the opps which are not supported by the
>>>>> SKU. If we can go through *all* OPPs in the opp table irrespective of
>>>>> the SKU, we will get something close to a full DDR bw table I mentioned
>>>>> in the prevous mail.
>>>>
>>>> It parses _all_ bandwitdh declared in the opp table, without any
>>>> discard,
>>>> so yes we're close to a full DDR table. It only lacks a few low
>>>> bandwidths.
>>>>
>>> Isn't opp_table->opp_list created after filtering with supported_hw
>>> bitmask?
>>
>> Sure, but opp filtering is not supported on a7xx, and nevetheless only
>> the high OPPs would be filtered out, so I don't understand why it would
>> matter ?
>>
>> As of today, the gx_arc_votes are already constructed the exact same way
>> I build the BW vote table, so why the BW table should be the ____exact____
>> same as downstream while we don't care about the gx_arc_votes ?
>>
> 
> Sorry to comment on the older revision, but how is arc votes table
> different from kgsl? Just want to check if we have a problem. It should
> match downstream driver exactly.

It will match downstream _if_ DT has the exact same OPP entries, we can't
really control that from the driver side.

And since we don't support speedbin on a7xx yet, it's already different.

And obviously it's the same for the BW vote table.

Neil

> 
> -Akhil
> 
>> Neil
>>
>>>
>>> -Akhil.
>>>>>
>>>>>>> +    struct dev_pm_opp *opp;
>>>>>>> +    int i, index = 0;
>>>>>>> +    unsigned int bandwidth = 1;
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * The OPP table doesn't contain the "off" bandwidth level so
>>>>>>> we need to
>>>>>>> +     * add 1 to the table size to account for it
>>>>>>> +     */
>>>>>>> +
>>>>>>> +    if (WARN(count + 1 > size,
>>>>>>> +        "The GMU bandwidth table is being truncated\n"))
>>>>>>> +        count = size - 1;
>>>>>>> +
>>>>>>> +    /* Set the "off" bandwidth */
>>>>>>> +    bandwidths[index++] = 0;
>>>>>>> +
>>>>>>> +    for (i = 0; i < count; i++) {
>>>>>>> +        opp = dev_pm_opp_find_bw_ceil(dev, &bandwidth, 0);
>>>>>>> +        if (IS_ERR(opp))
>>>>>>> +            break;
>>>>>>> +
>>>>>>> +        dev_pm_opp_put(opp);
>>>>>>> +        bandwidths[index++] = bandwidth++;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return index;
>>>>>>> +}
>>>>>>> +
>>>>>>>     static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>>>>>>>     {
>>>>>>>         struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu,
>>>>>>> gmu);
>>>>>>> @@ -1472,6 +1615,16 @@ static int a6xx_gmu_pwrlevels_probe(struct
>>>>>>> a6xx_gmu *gmu)
>>>>>>>           gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>>>>>>>     +    /*
>>>>>>> +     * The GMU also handles GPU Interconnect Votes so build a list
>>>>>>> +     * of DDR bandwidths from the GPU OPP table
>>>>>>> +     */
>>>>>>> +    if (adreno_gpu->info->features & ADRENO_FEAT_GMU_BW_VOTE)
>>>>>>> +        gmu->nr_gpu_bws = a6xx_gmu_build_bw_table(&gpu->pdev->dev,
>>>>>>> +            gmu->gpu_bw_table, ARRAY_SIZE(gmu->gpu_bw_table));
>>>>>>> +
>>>>>>> +    gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>>>>>
>>>>> duplicate line.
>>>>>
>>>>>>> +
>>>>>>>         /* Build the list of RPMh votes that we'll send to the GMU */
>>>>>>>         return a6xx_gmu_rpmh_votes_init(gmu);
>>>>>>>     }
>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/
>>>>>>> drm/msm/adreno/a6xx_gmu.h
>>>>>>> index
>>>>>>> b4a79f88ccf45cfe651c86d2a9da39541c5772b3..03603eadc0f9ed866899c95e99f333a511ebc3c1 100644
>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>>>>>> @@ -19,6 +19,16 @@ struct a6xx_gmu_bo {
>>>>>>>         u64 iova;
>>>>>>>     };
>>>>>>>     +#define GMU_MAX_BCMS    3
>>>>>>> +
>>>>>>> +struct a6xx_bcm {
>>>>>>> +    char *name;
>>>>>>> +    unsigned int buswidth;
>>>>>>> +    bool fixed;
>>>>>>> +    unsigned int perfmode;
>>>>>>> +    unsigned int perfmode_bw;
>>>>>>> +};
>>>>>>> +
>>>>>>>     /*
>>>>>>>      * These define the different GMU wake up options - these define
>>>>>>> how both the
>>>>>>>      * CPU and the GMU bring up the hardware
>>>>>>> @@ -82,6 +92,10 @@ struct a6xx_gmu {
>>>>>>>         unsigned long gpu_freqs[16];
>>>>>>>         u32 gx_arc_votes[16];
>>>>>>>     +    int nr_gpu_bws;
>>>>>>> +    unsigned long gpu_bw_table[16];
>>>>>>> +    u32 gpu_bw_votes[16][GMU_MAX_BCMS];
>>>>>>> +
>>>>>>>         int nr_gmu_freqs;
>>>>>>>         unsigned long gmu_freqs[4];
>>>>>>>         u32 cx_arc_votes[4];
>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/
>>>>>>> drm/msm/adreno/a6xx_gpu.h
>>>>>>> index
>>>>>>> 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..5b80919e595fa1ba0a3afcca55feb89e60870cb1 100644
>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>>>>>> @@ -44,6 +44,7 @@ struct a6xx_info {
>>>>>>>         u32 gmu_chipid;
>>>>>>>         u32 gmu_cgc_mode;
>>>>>>>         u32 prim_fifo_threshold;
>>>>>>> +    const struct a6xx_bcm bcm[GMU_MAX_BCMS];
>>>>>
>>>>> This table is duplicated a lot. Lets keep a pointer instead. We can
>>>>> probably use
>>>>> this pointer as a flag to check for GMU_IB_VOTE support too.
>>>>
>>>> It's partially duplicated, basically only the permode bits and level is
>>>> different.
>>>>
>>>> We can move it out when we support more GPUs with this feature.
>>>>
>>>> Neil
>>>>
>>>>>
>>>>> -Akhil
>>>>>
>>>>>>>     };
>>>>>>>       struct a6xx_gpu {
>>>>>>>
>>>>>>> -- 
>>>>>>> 2.34.1
>>>>>>>
>>>>
>>>
>>
> 


