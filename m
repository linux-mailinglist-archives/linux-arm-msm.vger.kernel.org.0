Return-Path: <linux-arm-msm+bounces-56314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B2AA522E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 18:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C66A63BB9C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 16:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A52625A341;
	Wed, 30 Apr 2025 16:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFz7x+Ze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF7190676
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032205; cv=none; b=b5qAK04u61XdCXdhaUXlBxefnNnb6lZZUTUXp0K26XPKOvOFzkijO1VN9nloF618GeDvVIY+abkY0yfiydQzVfpDf9276uRwGOMBxO4A5IxDRnLIRCo0wN95CLYCo/t1D+ECbbBieia4o+WcYYnef8AIbC3nJPK/ksOIKqdiV5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032205; c=relaxed/simple;
	bh=/dxYoRu+4KqTlUicTKF9EduBfr81zO2I3ZHtmVi88nc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fr2eRR8TeTaO96wdEPCf7Rf1qlgslPDJU1o6wq9GLoVIuAgqGVFshRGRsTMFga8ROby/cZDmDA3KVQ5rt0o5K/P5+ljihfscFBMqYrvEbV4Jm8Yj90dAL2GS7TD1XctPLE/0qi9gx5KnBGagkjoYATofmvb0cZicT/a7yu0hNDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFz7x+Ze; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso3914f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746032201; x=1746637001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=id03RDFSRtNU+AgoIp2Qps5kQXILwW32S+2Gf4se98U=;
        b=kFz7x+Ze/+XH1I455p3vp504jhpbSLsMMIdE5OW+LDiQyHl2ciT7ny7EslAjdyujJ2
         POb1Otm3ZeF6qDOLuLb2gaOWrsimuuz2i4s9lQajIWPVnLwsvDlp1Ijz+Px/UCPxE6Np
         lfip0FoWRp7N6/INZeR3lizYxJJPto1SjK4QLX6ELawvH6i4Yc1u6jBzb3bxgjQzy3jb
         w/z9J6cJHHw8PGq37RtJXFPihlYTlZW2GZ92EVjVWekv6FkTKkhHdweSUq7WmgVfsuRU
         RWvWkL5Cm4ioIxYGkGvYaSxkb5aWY7KiM7diaJc3mkSkmaRK/sbqmrBQn6KSFeAOikUU
         LapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746032201; x=1746637001;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=id03RDFSRtNU+AgoIp2Qps5kQXILwW32S+2Gf4se98U=;
        b=n36aPpgAbLFt9AZhzM1PkaPrpRcKuhNEjyuxPc3XKzBCqNeMJwBRqkh6iawCeOanKe
         /lpdfm+bs1/fT7Ve3wBVw4eqR7XERCr6pnwoX4vzM/tgJpPmyX4SZzSm1tN9q3dy9Nno
         u9pxnD+9F5Ujq6psqoqqdKfawEMd6ChIDI6XJYronBnKJsL6AuEPcUbmfNBzpyhN5y/e
         Y5tVFVRlAsRlvZZZAU1FHwcTTGy0cN6Nb5lRvbHk8il5uKRCYjN1S9B+4/afogVpDLjK
         rSnwuRUooRhMl5SRUafYXYwuEw3mr1CpMROMIZHgAk0H6pvnBTPVUoWeTVlwdqKJ2Q7U
         XP0A==
X-Forwarded-Encrypted: i=1; AJvYcCU28Mc5kdDiW7vPc50qXK9QeE95OZ8qFEdJTiJsCZWFvX/l0IDRhfCiVC8Co9SZBGRSN3yQaDUGutmZ5ddG@vger.kernel.org
X-Gm-Message-State: AOJu0YxjCdLXt03ObmutI6EwyMFR0omMgoBgiAottV8ERmqAfI6frZ1b
	mbCqpKkC7zSFVV9Mbs8sbUHwy8TguTqTxcIqaFYLfzW9j4IZIiEPWrbNvdKoVb0=
X-Gm-Gg: ASbGnctpDsfuOO/hMtwSPdOZGa3IHQQwSBn3MdRQrQw0IRQ7wz+WHbxJKtoLS8HR6Cc
	7b+TLWOuNzR4TB1v4V4zIKwZPvUxfiIfPoBd/1knMswgcLABSpxBoG0qBby7tt4Knw96mp8Heyd
	oSeCxgEvgc2+IP7r19CigsCQDFhRbkv6laaDWcBMq9JKDXQuVC3Zd3hTEEFkkrlggVXMXfJk8ll
	DlnwJorPH/GfuuBm+gEa55IHNbJnyYaxD5LdPI+GwtNN40p80EkJXpNtrIXv8Zztb7JpDHuUnA7
	+LTW1KV6GlZWUCOGMN09nBQcI5croug6W9DYctzEc/Z7Ww9RrFZZ8kMyizDsXnrTzqLeT1/M62q
	nFS5ur28EVNr5IwIMgw==
X-Google-Smtp-Source: AGHT+IFD5KIvLNb6vBtQgYPmLBg7jNujfEu6i6ZfUHVNDgYFSeJl0l7ZTdnc+rCHEb6ZS3flmHAzHA==
X-Received: by 2002:a5d:598f:0:b0:3a0:7f9c:189a with SMTP id ffacd0b85a97d-3a08f726d1cmr3753710f8f.0.1746032201225;
        Wed, 30 Apr 2025 09:56:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3d6:213c:5c50:7785? ([2a01:e0a:3d9:2080:b3d6:213c:5c50:7785])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4cbcsm17227028f8f.25.2025.04.30.09.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 09:56:40 -0700 (PDT)
Message-ID: <b989522d-bd41-4d76-91a9-3cf680214003@linaro.org>
Date: Wed, 30 Apr 2025 18:56:38 +0200
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
 <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
 <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
 <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org>
 <892fc1eb-efd3-4fb6-9110-2df3349960a6@oss.qualcomm.com>
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
In-Reply-To: <892fc1eb-efd3-4fb6-9110-2df3349960a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/04/2025 18:39, Konrad Dybcio wrote:
> On 4/30/25 6:19 PM, neil.armstrong@linaro.org wrote:
>> On 30/04/2025 17:36, Konrad Dybcio wrote:
>>> On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
>>>> On 30/04/2025 15:09, Konrad Dybcio wrote:
>>>>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>>>>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>>>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>>>>
>>>>>>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>>>>>>
>>>>>>>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>>>>>>>> should be speedbin 1", but what the values are for said "everything" are
>>>>>>>>> not known, so that's an exercise left to the user..
>>>>>>>>>
>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>>>> ---
>>>>>>>>>       drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>>>>>>       1 file changed, 8 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>> @@ -11,6 +11,9 @@
>>>>>>>>>       #include "a6xx.xml.h"
>>>>>>>>>       #include "a6xx_gmu.xml.h"
>>>>>>>>>       +#include <linux/soc/qcom/smem.h>
>>>>>>>>> +#include <linux/soc/qcom/socinfo.h>
>>>>>>>>> +
>>>>>>>>>       static const struct adreno_reglist a612_hwcg[] = {
>>>>>>>>>           {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>>>>>>           {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>>>>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>>>>               },
>>>>>>>>>               .address_space_size = SZ_16G,
>>>>>>>>>               .preempt_record_size = 4192 * SZ_1K,
>>>>>>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>>>>>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>>>>>>>
>>>>>>>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>>>>>>>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
>>>>>>>
>>>>>>> What I'm saying is that all other entries that happen to be possibly
>>>>>>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>>>>>>
>>>>>>>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
>>>>>>>
>>>>>>> No, the default was to allow speedbin mask ~(0U)
>>>>>>
>>>>>> Hmm no:
>>>>>>
>>>>>>        supp_hw = fuse_to_supp_hw(info, speedbin);
>>>>>>
>>>>>>        if (supp_hw == UINT_MAX) {
>>>>>>            DRM_DEV_ERROR(dev,
>>>>>>                "missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>>>>>>                speedbin);
>>>>>>            supp_hw = BIT(0); /* Default */
>>>>>>        }
>>>>>>
>>>>>>        ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>>>>>>        if (ret)
>>>>>>            return ret;
>>>>>
>>>>> Right, that's my own code even..
>>>>>
>>>>> in any case, the kernel can't know about the speed bins that aren't
>>>>> defined and here we only define bin0, which doesn't break things
>>>>>
>>>>> the kernel isn't aware about hw with bin1 with or without this change
>>>>> so it effectively doesn't matter
>>>>
>>>> But it's regression for the other platforms, where before an unknown SKU
>>>> mapped to supp_hw=BIT(0)
>>>>
>>>> Not calling devm_pm_opp_set_supported_hw() is a major regression,
>>>> if the opp-supported-hw is present, the OPP will be rejected:
>>>
>>> A comment in patch 4 explains that. We can either be forwards or backwards
>>> compatible (i.e. accept a limited amount of
>>> speedbin_in_driver x speedbin_in_dt combinations)
>>
>> I have a hard time understanding the change, please be much more verbose
>> in the cover letter and commit messages.
>>
>> The fact that you do such a large change in the speedbin policy in patch 4
>> makes it hard to understand why it's needed in the first place.
>>
>> Finally I'm very concerned that "old" SM8550 DT won't work on new kernels,
>> this is frankly unacceptable, and this should be addressed in the first
>> place.
>>
>> The nvmem situation was much simple, where we considered we added the nvmem
>> property at the same time as opp-supported-hw in OPPs, but it's no more the
>> case.
>>
>> So I think the OPP API should probably be extended to address this situation
>> first, since if we do not have the opp-supported-hw in OPPs, all OPPs are safe.
>>
>> So this code:
>>      count = of_property_count_u32_elems(np, "opp-supported-hw");
>>      if (count <= 0 || count % levels) {
>>          dev_err(dev, "%s: Invalid opp-supported-hw property (%d)\n",
>>              __func__, count);
>>          return false;
>>      }
>> should return true in this specific case, like a supported_hw_failsafe mode.
> 
> Not really. opp-supported-hws = <BIT(0)> usually translates to the *fastest*
> bin in our case, so perhaps that change I made previously to default to it
> wasn't the wisest. In other words, all slower SKUs that weren't added to the
> kernel catalog & dt are potentially getting overclocked, which is no bueno.
> That is not always the case, but it most certainly has been for a number of
> years.
> 
> Old DTs in this case would be DTs lacking opp-supported-hw with the kernel
> having speedbin tables. The inverse ("too new DTs") case translates into
> "someone put some unexpected stuff in dt and the kernel has no idea what
> to do with it".
> In this context, old DTs would continue to work after patch 4, as the first
> early return in adreno_set_speedbin() takes care of that.

No.

With only patches 1-4 applied (keep "old" DT) on today's -next:

SM8550-QRD:
[    7.574569] msm_dpu ae01000.display-controller: bound ae94000.dsi (ops dsi_ops [msm])
[    7.586578] msm_dpu ae01000.display-controller: bound ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
[    7.597886] adreno 3d00000.gpu: error -EINVAL: Unknown speed bin fuse value: 0x2
[    7.605518] msm_dpu ae01000.display-controller: failed to load adreno gpu
[    7.612599] msm_dpu ae01000.display-controller: failed to bind 3d00000.gpu (ops a3xx_ops [msm]): -22

SM8550-HDK:
[   10.137558] msm_dpu ae01000.display-controller: bound ae94000.dsi (ops dsi_ops [msm])
[   10.151796] msm_dpu ae01000.display-controller: bound ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
[   10.163358] adreno 3d00000.gpu: error -EINVAL: Unknown speed bin fuse value: 0x2
[   10.171066] msm_dpu ae01000.display-controller: failed to load adreno gpu
[   10.178118] msm_dpu ae01000.display-controller: failed to bind 3d00000.gpu (ops a3xx_ops [msm]): -22

With:
=================><==================
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 61daa3315679..7cac14a585a9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1435,6 +1435,7 @@ static const struct adreno_info a7xx_gpus[] = {
                 .address_space_size = SZ_16G,
                 .preempt_record_size = 4192 * SZ_1K,
                 .speedbins = ADRENO_SPEEDBINS(
+                       { ADRENO_SKU_ID(SOCINFO_FC_AB), 1 },
                         { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
                         { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
                         /* Other feature codes (on prod SoCs) should match to speedbin 1 */
=================><==================

SM8550-QRD:
[    7.681816] msm_dpu ae01000.display-controller: bound ae94000.dsi (ops dsi_ops [msm])
[    7.694479] msm_dpu ae01000.display-controller: bound ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
[    7.705784] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[    7.714322] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[    7.722851] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[    7.722853] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[    7.722855] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[    7.722856] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[    7.722858] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[    7.722860] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[    7.722861] adreno 3d00000.gpu: _of_add_opp_table_v2: no supported OPPs
[    7.722863] adreno 3d00000.gpu: [drm:adreno_gpu_init [msm]] *ERROR* Unable to set the OPP table

SM8550-HDK:
[   10.119986] msm_dpu ae01000.display-controller: bound ae94000.dsi (ops dsi_ops [msm])
[   10.133872] msm_dpu ae01000.display-controller: bound ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
[   10.147377] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[   10.161640] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[   10.171198] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[   10.179756] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[   10.188313] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[   10.196868] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[   10.205424] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[   10.226025] adreno 3d00000.gpu: _opp_is_supported: Invalid opp-supported-hw property (-22)
[   10.234589] adreno 3d00000.gpu: _of_add_opp_table_v2: no supported OPPs
[   10.247165] adreno 3d00000.gpu: [drm:adreno_gpu_init [msm]] *ERROR* Unable to set the OPP table

This behaves exactly as I said, so please fix it.

Neil

> 
> Konrad


