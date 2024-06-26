Return-Path: <linux-arm-msm+bounces-24372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601F99199D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1438F28162F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFE6194080;
	Wed, 26 Jun 2024 21:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzIuUJu6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064202AF1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 21:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719437919; cv=none; b=PjoKRdMdEZ/U4rcu/rudCbEjSMbZWP34TwshtOm5BY6ir+GxXlSwc5RIKn1d2OOfnKAwuWyJXVK7rPQZlS5wUwb44dP9aaU99wqMwfJv1eFjNOIvsbTqs37e38gR4DHL6aT1lW8pK515iy184OuI/iPVSQQdKpkFY+FvdA7Si48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719437919; c=relaxed/simple;
	bh=tLk9Bx3z811fPv9+ShRkrPRjpv+JzhNZtV85exzoRLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHmLoTOjpiEu69XLkvVGHazZ5VkjcLETc0NTSc7w7WxjAXpLfkFi1M7BYEbnKLNQGnNVD55ulWgGXl/+BupbtkAR+rq28ts4qspSn+g2FdpCVR0uDxSlNh+WOiV94hUQMuEP2xP8yHm5PaIj8cVKKNInlRx+L2HqOWkZ14fCUpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzIuUJu6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7252bfe773so482216466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 14:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719437914; x=1720042714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dbHxG2n5zP0Ww3GCk5hb1EwcyYJPFNAvcBAuRALNJvU=;
        b=MzIuUJu6bmTsflS6zOtqGtOb2y+p/3R7GIUmu0lWG9YLAn1EFyBm3ujo64035pdMKO
         OnVXxKEQIgUSjbHWoN5mhuq86BHirdjRe4V/2EzzfzjInakgrFDKPoEd1jMyLU4QKskJ
         kNbvUh1gb+kdERFfvhKyOWUxFjrMcxJnvMhik5ewopZZUGI4rZA2lvfbwWP7BBt+NB+f
         lT7XBjShVJF4mQirnaIpDw0HQ6o3F/v/A6qms5IVlpLnUkUIT72nLWlgrBu8w2JnhfDR
         J3YElcn/My5LUjI7voBppGNrPpyIudFYpnOw3Z+BBjo3Mr27RpPX+VjrPwDnd7xLPQm1
         +E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719437914; x=1720042714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbHxG2n5zP0Ww3GCk5hb1EwcyYJPFNAvcBAuRALNJvU=;
        b=ijHj/ywh6sX5q+1MSa+fkkkBwxkBusbuOkBn+W6Eqn/ZxvUKtaf1LXdpIR+Si7aePa
         aHHba4zK4XCdBErLA4Fsg7qz8b0kYHJiZDk+VnwLkTbmxtp4mSJCjjSih3wJM1hOoHG2
         gjhe6mcLUbwa1zrUGS4XH/dXsXPyBzpo+719Hzp+pdlo02iLnVdmIYSUqLKYwwCYmzlr
         bkm6lplhiHyGww1OFZAVcn09jFmUoxDJpYnyNm0PUvgjCQbk41mppbQhf9ebj9Xl8zaK
         1+xNUUIJwAWW1QwB2b5+UvjiQXvS/RV7g8hbzlPaOjcnGuiN5m/HDTVLjJI2fcVdmRg5
         JvKg==
X-Forwarded-Encrypted: i=1; AJvYcCU0xBurTSW6WJrw8SEu5XxVQHzRw0jwDWY6Ag5iEwt5rmLU2VkFPCoxxLzGdO1sX6pofYpmuabwBjcT9r+/oir+R8MoaLWo91K2Gk+Cpw==
X-Gm-Message-State: AOJu0YxUA9HQHRUWNCq7qnhSvclF2zOvgBFAUduFWZ2mjodnkUZCQj88
	O8fJpvVwsBxnCcSzY/ZznGzFpYZb525duSRiFHRYmvxXrzdYIjPh/0k7LDyhYvU=
X-Google-Smtp-Source: AGHT+IFf0QxabGJyvOOpKnyFK5uJAobBhEVchG12Uzd06lWam1G+0KgRr0bmxh6PFnZEeNYo+QcrUg==
X-Received: by 2002:a17:906:2a5b:b0:a6f:1785:d18 with SMTP id a640c23a62f3a-a7245cf2ee7mr729935866b.44.1719437914088;
        Wed, 26 Jun 2024 14:38:34 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7247ccb868sm432535066b.208.2024.06.26.14.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 14:38:33 -0700 (PDT)
Message-ID: <853849b4-69f2-488f-ab17-dc550c235e3d@linaro.org>
Date: Wed, 26 Jun 2024 23:38:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
 <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
 <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGvCaGq8ukxra_bzc=4pUf8y5NndKRagQspD0=uCZdBfoA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAF6AEGvCaGq8ukxra_bzc=4pUf8y5NndKRagQspD0=uCZdBfoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2024 8:43 PM, Rob Clark wrote:
> On Wed, Jun 26, 2024 at 1:24 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>
>> On Mon, Jun 24, 2024 at 03:53:48PM +0200, Konrad Dybcio wrote:
>>>
>>>
>>> On 6/23/24 13:06, Akhil P Oommen wrote:
>>>> Add support in drm/msm driver for the Adreno X185 gpu found in
>>>> Snapdragon X1 Elite chipset.
>>>>
>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> ---
>>>>
>>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
>>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
>>>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>>>>   4 files changed, 36 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> index 0e3dfd4c2bc8..168a4bddfaf2 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>>>>      */
>>>>     gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
>>>> +   if (adreno_is_x185(adreno_gpu)) {
>>>> +           chipid = 0x7050001;
>>>
>>> What's wrong with using the logic below?
>>
>> patchid is BITS(7, 0), not (15, 8) in the case of x185. Due to the
>> changes in the chipid scheme within the a7x family, this is a bit
>> confusing. I will try to improve here in another series.
> 
> I'm thinking we should just add gmu_chipid to struct a6xx_info, tbh
> 
> Maybe to start with, we can fall back to the existing logic if
> a6xx_info::gmu_chipid is zero so we don't have to add it for _every_
> a6xx/a7xx

If X185 is not the only occurence, I'd second this..

Konrad

