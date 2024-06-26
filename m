Return-Path: <linux-arm-msm+bounces-24247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FD0917CA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 11:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA1A1B20ABB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 09:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3227D16B38F;
	Wed, 26 Jun 2024 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D8WDNRF1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8013412B144
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719394628; cv=none; b=hnVvbDC8XhT7Ukfdasin3+XazguhMqIU1t35ehuh/vRsXIUf+rSTpNhRpPTK8yGtbdgE9CvL43ADDoflZDkagI2FisR/KBqnZDs3UQdoKWD0PqdMISf2J44C3ClHCzZTnzB8B/KQDkLfJ/2G3FMpLRL5sMb43PGkRlJdpTJMoHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719394628; c=relaxed/simple;
	bh=IOe74BviUgYXIjE1Ibu85GUlLOQUmCeF+sTT7UuVvYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUYTmIn70mFeYTlY+TVTwRN5wtegeIdbH+xHMYf2fzVHqSZqNm1sRfYD9ZdAyANt55UbUIyKIhrMXekSDM0UhqdJRwdZPUvoZoP/rmzLuzRDwYIOHNOBphxW+fCoflh02NchX37KnD5MwuEfLlya2iVe2IMmgIrhkIo4a9JTsAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D8WDNRF1; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a72604c8c5bso355674666b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 02:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719394625; x=1719999425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AEVD+w0TTAAVvcUXpjCC9r3Xtde98FGUdgCPdfiAa2c=;
        b=D8WDNRF1wtHlVOi23WMvuW6ndEJWZfUiDtPKX6qz8NUjnDMP6VkLgWUgAr4dx7gKDO
         tINk5E/NqWrYKYTLl37gZ1z26s9RTZM0QAqxCy8wYQMVGrrJkVBk/tbjkaR03UGg3evt
         ydzmBVo35cBIyTfv7f3SFOXAdJtrPC/edYz6FVdzF0KKU5VtR35RvXV2fqFnFWbh5ih7
         jghFpWlO6l39fTKlmMO6JAA5ExKm/M8sFE1ctUP2X8wQ0U19/b8i6HKs4kIORPZdDwOU
         fsxzc2EQBE+UGvXkdoMJ3/6MFoyXWJK8P2N4Kloz8cbApXFfYLsqYMkp3uGNgeWELuPb
         ODyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719394625; x=1719999425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEVD+w0TTAAVvcUXpjCC9r3Xtde98FGUdgCPdfiAa2c=;
        b=m5IMYapbjSSSk3o2AY9krCiGLbVaX6jm45fypnTcF2JN8ih4PaCofWTVPxizobiveK
         IYVdfDApzzkYweyTHeYbFM6OzBbSV4wm+Jc9NNTJdYZNjL3uT4ofOvlQoO5XN1f2PcSE
         U0+Q75Yz0WldInuU+R2hqKIYWqPCvqCpaAM2hjCupo6sJpuif9dywlqcK/UNSkE9bqnT
         LoZv3TcNDoaMg2HkjjGzcn9diJOCjIq3DQjuRUPUt6czse/ZN8BiyaVq3+z8mbs2QOT8
         NnLVYfhmGQlTNCrVEi9xe4/wQ0etby643NLGWARwrdi5yb7i87OVp7yGE5RQkzn16liE
         U/xw==
X-Forwarded-Encrypted: i=1; AJvYcCWwUsR1ThgaM+NIw+ucfTYcP2usnZMOn2olmmCqvPlsuTUF+nJ7tNsNs5E5hNSfwxrtho4Mpit4/Fyj2LIPp4UtvY7v7vJFc233KiFC6w==
X-Gm-Message-State: AOJu0YzBR5ZiFL2X6V8Xcw2MSGIcxj0HPhJRBKFMVL1pHXdfSD0sR0tG
	xS+5gnk/hSZ5ljAU/Z1oBHCJ8JNrvy9ibueUf8HwiyoFegtDH/pVsTP/nLxWYUg=
X-Google-Smtp-Source: AGHT+IHMd5gcTGXG0btMMetTthXNYoimPBO8ehjkfI6u1J6Ceh0RTvs6sjMc+EPy7NGvsHh8ni7voA==
X-Received: by 2002:a17:906:a8d:b0:a6f:4c10:8da6 with SMTP id a640c23a62f3a-a7245b45a69mr587403866b.2.1719394624617;
        Wed, 26 Jun 2024 02:37:04 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a725cc93794sm246743566b.170.2024.06.26.02.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 02:37:04 -0700 (PDT)
Message-ID: <a33ac27f-ab88-40a7-9cb0-9d27342fed09@linaro.org>
Date: Wed, 26 Jun 2024 11:37:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
 <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
 <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 10:24 AM, Akhil P Oommen wrote:
> On Mon, Jun 24, 2024 at 03:53:48PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 6/23/24 13:06, Akhil P Oommen wrote:
>>> Add support in drm/msm driver for the Adreno X185 gpu found in
>>> Snapdragon X1 Elite chipset.
>>>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>>
>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
>>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>>>   4 files changed, 36 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 0e3dfd4c2bc8..168a4bddfaf2 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>>>   	 */
>>>   	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
>>> +	if (adreno_is_x185(adreno_gpu)) {
>>> +		chipid = 0x7050001;
>>
>> What's wrong with using the logic below?
> 
> patchid is BITS(7, 0), not (15, 8) in the case of x185. Due to the
> changes in the chipid scheme within the a7x family, this is a bit
> confusing. I will try to improve here in another series.

Ohh I overlooked this.. sounds a bit unfortunate.. 

Seems like it doesn't really fit the "else" branch anyway, let's
keep it for now then

Konrad

