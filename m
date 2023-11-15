Return-Path: <linux-arm-msm+bounces-725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433767EC8C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0FF8281465
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 16:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8901D3173D;
	Wed, 15 Nov 2023 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w8JTp+Q5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5AF3BB30
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 16:42:05 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAED196
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:42:04 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507a3b8b113so9848889e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700066522; x=1700671322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5FiyfL45nK0ILrQvVCbcGAZ+fU64odztAJCZA6s8wQ=;
        b=w8JTp+Q55DB8fIErRIQl66qzDKUi8oR0HOplYEqwpzXkFZGGSsLeS2SSxAv9yYiweT
         fZVIbHq7i9UR3e+9tya5DSmUayK5QEp8kkTIkQD6biYq4L4SzRG3bTIEsnhkMtLnFlaI
         q6bbnOvhEgQ1RYQxZVhUMbDCQC0b7pVi2kyM9fWz7v+NUwdE1H0xk5SjC2DejRzsVVG1
         AX4ggUTB4IRvNe034wjRUP8vXAOOlCN+S+Mow7jK/QhC/+ZbACekgduWoBUJst8kCcnK
         dx6aKD/Pog7O8hnrGbSxUfGt/Rk9Vo6rRbKCf81RT5f1sGBHeY7MpT42H7Ff2arprLWf
         Lddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700066522; x=1700671322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5FiyfL45nK0ILrQvVCbcGAZ+fU64odztAJCZA6s8wQ=;
        b=bX5+uOL/3r/Ixk5i1g+g5rn7pv8px1waOGlJYy+kGaXw4D1R9dwUvWdPtX7023bekY
         TdiIa/QdNLGUTYpOeMnGb7LXihLigl3JGrk6nyGPnH8+mZzt0IItWM+/HMBDlM3j+HsW
         mt6fAyXm7cGqPsaMRlQcoDwinUKjxts4EkC6cEK1LrQmydwI34rg9pOhesbfonmdwDk0
         qFbKTgp4kD05+MFFZ7X+rcPSbivVcHpN8hOVBuReBMV2VpUVX4zDbb5PyLIlNnCWqXkJ
         Pio4is4WNA3J4gUK19JiVeBimh+Tu3X//5bGQv7n7usbApsiSylEZLqOPKgLgdD+sPFC
         34QA==
X-Gm-Message-State: AOJu0Yyv/lpKJPIq9Beubn3B2o5qXOXSBtyuaAiYIvrlU387YOJOU++v
	AF1aru+LRvCDGwBsAhZEUjTzao737PWTl6nPDobU/Q==
X-Google-Smtp-Source: AGHT+IFWMZo39Dt217xz3YvNvg1OMFxweVuoh5j1w9Sgi0b6RPHP9gLOt/PkYJVEHjLB5ztGS8bf8Q==
X-Received: by 2002:a05:6512:234d:b0:508:268b:b087 with SMTP id p13-20020a056512234d00b00508268bb087mr11812039lfu.26.1700066522540;
        Wed, 15 Nov 2023 08:42:02 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d27-20020a19385b000000b0050a026d3a26sm1705739lfj.227.2023.11.15.08.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:42:01 -0800 (PST)
Message-ID: <be9675a6-a01e-4cf7-95b3-174220d4a042@linaro.org>
Date: Wed, 15 Nov 2023 17:42:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iommu/arm-smmu: add ACTLR data and support for
 SM8550
Content-Language: en-US
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 a39.skl@gmail.com, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 qipl.kernel.upstream@quicinc.com
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-3-quic_bibekkum@quicinc.com>
 <CAA8EJpr1NzqiuNVZ0YcLpJ=yeOYFbLouAFgN9VMOiKpmoGVdtQ@mail.gmail.com>
 <7edad996-f148-42d5-8e72-0334d3b9101f@quicinc.com>
 <CAA8EJpqzEvC-LEjJrOk6Ed8utFNnqgP=qkb0mq-dOfMZd5ij4Q@mail.gmail.com>
 <dba223a1-0456-40b8-b295-ea960867dcf9@quicinc.com>
 <CAA8EJpqvXb_Zdmq0O0KEA8mn5UkSriCZ02w16dts7Gd84R30oQ@mail.gmail.com>
 <aebdf7f6-48b7-43d3-95af-83859ddc593f@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <aebdf7f6-48b7-43d3-95af-83859ddc593f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *



On 11/15/23 13:49, Bibek Kumar Patro wrote:
> 
> 
> On 11/15/2023 4:15 PM, Dmitry Baryshkov wrote:
>> On Wed, 15 Nov 2023 at 11:51, Bibek Kumar Patro
>> <quic_bibekkum@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 11/15/2023 3:08 PM, Dmitry Baryshkov wrote:
>>>> On Wed, 15 Nov 2023 at 11:22, Bibek Kumar Patro
>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 11/14/2023 7:42 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>
>>>>>>> Add ACTLR data table for SM8550 along with support for
>>>>>>> same including SM8550 specific implementation operations.
>>>>>>>
>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>>>> ---
>>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 92 +++++++++++++++++++++-
>>>>>>>     1 file changed, 88 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>> index 578c662c7c30..0eaf6f2a2e49 100644
>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>> @@ -25,6 +25,70 @@ struct actlr_data {
>>>>>>>            u32 actlr;
>>>>>>>     };
>>>>>>>
>>>>>>> +#define PRE_FETCH_1    0
>>>>>>> +#define PRE_FETCH_2    BIT(8)
>>>>>>> +#define PRE_FETCH_3    (BIT(9) | BIT(8))
>>>>>>
>>>>>> What is the difference between PRE_FETCH_3 and PRE_FETCH_2? And
>>>>>> PRE_FETCH_1? Are these real numbers that refer to some amount / count
>>>>>> or just dummy names?
>>>>>>
>>>>>
>>>>> No,these are not real numbers, but prefetch settings for a particular
>>>>> perfect configuration.
>>>>
>>>> Then I'd ask for some better names or descriptions.
>>>>
>>>
>>> Noted, PREFETCH_SETTING_n / PREFETCH_OPTION_n sounds like a better name
>>> in the following case. Would it be okay to use this name instead?
>>
>> Not really.
>>
> 
> Any suggestion you have in mind, if not this nomenclature?
Dmitry's concern seems to be that you provide:

PRE_FETCH_1 /* prefetcher with settings preset no. 1 */
PRE_FETCH_2 /* prefetcher with settings preset no. 2 */
PRE_FETCH_3 /* prefetcher with settings preset no. 3 */

whereas it would be both useful and interesting to see what these
settings mean, i.e. what differences there are between all of
these presets.

Konrad

