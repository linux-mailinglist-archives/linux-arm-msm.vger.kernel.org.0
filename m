Return-Path: <linux-arm-msm+bounces-56300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7CBAA4F12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 16:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 880A97B8A9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 14:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D471C173C;
	Wed, 30 Apr 2025 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CAj4omOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2FF1B21AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746024562; cv=none; b=MYX67sJ39QMD9T+4iqIVW+bJ6v6OmTuKdp1+Y73Ph/Ivi+XX0o8sMv8xL5O6ZPo/yBhWJj14FyJhDd9VMVREnDRYtiKt/AnaOAoEsg1NEYVTI2XhFZPqn5XmrHLKr86HZa3zPwhCqDgAq2u3gWCnkpluCTMusqj0eXbRC64fzUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746024562; c=relaxed/simple;
	bh=Mh4L0mJABHehFFXvT03a6+r04/PDHSlYVQ8aYmt8T0A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aFHAJUKO7iEiDP2E19uxulMIiiLt9jipSGOZodmv5tsnfaBxo8Ef9xluJMT4XS1tKmC40ZhFesNvVijjv2XG2hLfOg3sSBiJMjbtvyoWLh2liFj5+y3NRCaGc3jW2qlOH7n6Nzann2PYU+5g5LjwwTXcL0ykfgWheX2GfXSVfi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CAj4omOS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c14016868so8031623f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746024559; x=1746629359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RqdX/DnBKaAL2ccd0QiLQOKQZs79JYq/OxFCxJknp8=;
        b=CAj4omOSXQRu7s31Yag3mMp0RlpqEe394bDpLSeIk2C9an/vBF5LUiJAQxS67BDZwX
         FN6VEiCHhK2hvt0tnhlBwM7r+gL/IJpTvh9dQ1yyz0+EzTZ3sPABMeFsOhgh0rNdnnZ0
         WvFbbeEBJ/qPC2vUr3h3UiwjidZ9T0Cq5nBtrYsfImDt82FZv+E1R90ZgbjKJrWuh7sz
         xzQFYsAcyJVOvy8j7fzLTG0521ec7ae5+LHhUJKf5wCvlZm1MSALY9J+x86bnNHcWgis
         c4IECWFxuIhTqaTQXuABakQ3AEWL1shNoG6KsAbd144U789Up0+P9SyJbP9xWi/gKVl4
         wHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746024559; x=1746629359;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1RqdX/DnBKaAL2ccd0QiLQOKQZs79JYq/OxFCxJknp8=;
        b=tDT/Kd7EswvbL4ml3lo4cXTE/adphydp2NK8FspibJpqvCnQCczvCe+qtCJZT0Zx7v
         fHBUiyy/XI2uI3LEiN1uCxix1eRaxjrVfgsaBGJe5eu2q2F9j8mEvNZ6DdjRxNRFunmf
         ymTqPiGY9/R2pXXcIVMd/HuO69yn8Hpgyr24LYF3+Hj/AEoLhs1SL+Dj5hBiPRCvo/BJ
         Rg3DxPsgIvklkN/TntrEvItzzlxPHrzIzDZrDoeQME42gO+V9e7xYuGX9N9GvT7ugWCW
         YsTwAGO+W5j19ts5aAqW6ceBor5tyqNIFcONKVR55fFdpfDIVDPqCYl1NZQU7yAtzSRZ
         BX9A==
X-Forwarded-Encrypted: i=1; AJvYcCU0jsNHl5UREpXRA7WUHc+y8CMk3DLyv6/0Bt+q58ics3fss4422KLPa634nmaBtQgAA53F/uRXugq9gjRu@vger.kernel.org
X-Gm-Message-State: AOJu0YyfkIeGSDz9/BnHYRUtTkPmMb0T70WTI0m6UM2RtsE74+IHbVOv
	L75w8AtZUjVEwZOBXsQMnFom8aMC8dNSSJpNNTHtyQ7jM+UL2gVYboEXcN46ixk=
X-Gm-Gg: ASbGncvMH+fqCTmfeCBhBHuePbO20NMqAUD+14AGCemxL5qiJKlZkvA9UveLPl8axiv
	JngXGllQWgW0QwslSppDIKnWduwTwimBFxzEFvnY+ZiYQtB+2gOG9l5BzrJRPbgUGEAt8JJu/V0
	nhvRpX5aouT5lqss/3UPvgI+YP3S8NqU8wh4grDa5X6b+8aqrBUzg1H6A/89F9dvVxYzjy/ZRP/
	9kl+4jtq0wK5yTQr3UaiMV5Cyi4Ki3JzSPC52AiOQGi96Ku8jqe8GbwE7rANWEZhPUVEvOg3OTt
	bufprUIG0P+GPiusZ7G584i9QxdkwJFnykhBOTcLp1ldm15xIjT5IvfGsXkieqBvTy77UXm/3HJ
	NMAr4ndXrIwfgEI4NZg==
X-Google-Smtp-Source: AGHT+IH5RToavPzsqmcP3rrYHSVRaH7ZbG3bUAXbFz2vDPdI/yavfdXM8NVtxQIg8VPdzVXTGW0OoA==
X-Received: by 2002:a5d:5887:0:b0:390:f0ff:2c11 with SMTP id ffacd0b85a97d-3a08f7538dfmr3670511f8f.2.1746024558772;
        Wed, 30 Apr 2025 07:49:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3d6:213c:5c50:7785? ([2a01:e0a:3d9:2080:b3d6:213c:5c50:7785])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e4684csm17177628f8f.76.2025.04.30.07.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 07:49:18 -0700 (PDT)
Message-ID: <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
Date: Wed, 30 Apr 2025 16:49:17 +0200
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
In-Reply-To: <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/04/2025 15:09, Konrad Dybcio wrote:
> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>>> Hi,
>>>>
>>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>
>>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>>
>>>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>>>> should be speedbin 1", but what the values are for said "everything" are
>>>>> not known, so that's an exercise left to the user..
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>>     1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> @@ -11,6 +11,9 @@
>>>>>     #include "a6xx.xml.h"
>>>>>     #include "a6xx_gmu.xml.h"
>>>>>     +#include <linux/soc/qcom/smem.h>
>>>>> +#include <linux/soc/qcom/socinfo.h>
>>>>> +
>>>>>     static const struct adreno_reglist a612_hwcg[] = {
>>>>>         {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>>         {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>             },
>>>>>             .address_space_size = SZ_16G,
>>>>>             .preempt_record_size = 4192 * SZ_1K,
>>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>>>
>>>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>>>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
>>>
>>> What I'm saying is that all other entries that happen to be possibly
>>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>>
>>>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
>>>
>>> No, the default was to allow speedbin mask ~(0U)
>>
>> Hmm no:
>>
>>      supp_hw = fuse_to_supp_hw(info, speedbin);
>>
>>      if (supp_hw == UINT_MAX) {
>>          DRM_DEV_ERROR(dev,
>>              "missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>>              speedbin);
>>          supp_hw = BIT(0); /* Default */
>>      }
>>
>>      ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>>      if (ret)
>>          return ret;
> 
> Right, that's my own code even..
> 
> in any case, the kernel can't know about the speed bins that aren't
> defined and here we only define bin0, which doesn't break things
> 
> the kernel isn't aware about hw with bin1 with or without this change
> so it effectively doesn't matter

But it's regression for the other platforms, where before an unknown SKU
mapped to supp_hw=BIT(0)

Not calling devm_pm_opp_set_supported_hw() is a major regression,
if the opp-supported-hw is present, the OPP will be rejected:

https://elixir.bootlin.com/linux/v6.14.4/source/drivers/opp/of.c#L538

	if (!opp_table->supported_hw) {
		/*
		 * In the case that no supported_hw has been set by the
		 * platform but there is an opp-supported-hw value set for
		 * an OPP then the OPP should not be enabled as there is
		 * no way to see if the hardware supports it.
		 */
		if (of_property_present(np, "opp-supported-hw"))
			return false;
		else
			return true;
	}

Neil

> 
> Konrad


