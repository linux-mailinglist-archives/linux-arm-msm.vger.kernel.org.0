Return-Path: <linux-arm-msm+bounces-15301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD1688D018
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 22:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27DCD1F81136
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 21:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235AE13D63A;
	Tue, 26 Mar 2024 21:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XqdNI4Uv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A9313D61C
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 21:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711488696; cv=none; b=FI+r41oCDXeAtcHYZVK9zk4kRReasA9y5T/G5Dgi+A0yaD1nJ6Drm4rkvr9JJLClOAqfIFfIc7cP/S3B5v5/FbKy8WRUwLm8vtrEbWsK9Lx66G/NwsGE4FFHC2pMko9f/wRIo4ett4/6DUY6HIX/Ek4Iqkfaz7N9tLWVG5Ok0jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711488696; c=relaxed/simple;
	bh=2b2iswpmhzrhhGsFbXhQA2SK05/fhLqjPLFxGalyfWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FMKGTfkHrb5OO7Qbgqpk0bLcr3rJP41NTeM87tgYhAT5t9UiPYsywIpu6gmQ2yEyJz7SjMwKxk8y2RXgJlFxllaAG1CofnxWzeIsOLcNyrTC7y8tL545empJWuOfxyO5O+wSZTnEdBDDydyCKG8dsgBFn7inT3keEYdTjpY07Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XqdNI4Uv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513d599dbabso7826510e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 14:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711488692; x=1712093492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bgSJDrIUVsXQMfKvel9wfZ0njlDv710JAdsSE3N3rYY=;
        b=XqdNI4UvMbQO7xpZSKO/D1W6KJ9pD3/WosTSq488oPvcvVIElK6M+v7VkUvoKpmhlF
         tcjUBd25a33KN3MrgQqY3Lclt48HKNqYN7TzTZyfsmePG8CAQ+T8U253WRXlCHmQXQ7d
         yLQZW+d0rBBu8g1roIsnEPjR0yeQL5DZfvKCAiPRDvJWlmR1IExxVqmuI3LHkzamD4Nk
         2LUr/dxu0kF+IpT2Umgn8e8tY053Ui4M/2f8eoqq5LGVADzrXnBK1o2AxdKUcHSztrl/
         djQhedSm2+kb9pO3X3hfjbn0zjSy5iZjA9dD/kG1M23PFxS9HjxLCzp5DQmerXMFOGdC
         WNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711488692; x=1712093492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgSJDrIUVsXQMfKvel9wfZ0njlDv710JAdsSE3N3rYY=;
        b=KaiuJLOzzfnvhVo6vJizE0ClRtNMYUlysWv+E4k/cX2mw33m/rYFHMPxPpgeJh7u9p
         X0tEvoRxxG8KS231EYtafNpm+zgan9ehGHFVlsghVm8ITKEEoWBcirBHm8m3WUBPLL8q
         0OQ9bYi8RifzLMHPkDem9P7Zzye5XDn864rLyPW3HCYGsLFLCXyyZrKzApL/j/vb0Ch0
         NyK8qwIFXMZn9z33F9ToIt5FmPVB2yUs43y+3fnPYR4HUFMV5UxqJm/qfqt5pxaDN3QH
         jMyyU+pUspb3kJ/7/ewHWvAcKheF529dKYoEwj+xylxAtiX46C89FL2YtLbJk+nc4/rs
         drPg==
X-Forwarded-Encrypted: i=1; AJvYcCXztPEY+pPaPSQIYZp9KUttfuhu9PQJALhyOPiisE6tWKeTJZky+inE07ruoLxIuSqOE0sxhUiiip9diTQ2zBDEnOBPwN0sVNyDBlUd3Q==
X-Gm-Message-State: AOJu0YxDDUnYZops1FEFF/E1GiqVC50APOMLFRJdHSGBuhCmZhK7NQD1
	DkB1i/PHxVi6bQ6/Y7vBSF1Z2KvF8Gawpir2iRDuOI2tGZsMgLoQcSl2LSpXaZ599kc91gJdJUL
	P
X-Google-Smtp-Source: AGHT+IHtaLjv0C/ep18lwpotFW/QbQbObmn3/uTfEpJP432ZOWn4425i2gRettQqwUoVlJn7Zhs5mg==
X-Received: by 2002:a05:6512:3a8b:b0:513:ca96:dbdf with SMTP id q11-20020a0565123a8b00b00513ca96dbdfmr11956446lfu.12.1711488692267;
        Tue, 26 Mar 2024 14:31:32 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id qs25-20020a170906459900b00a4663450fa9sm4659206ejc.188.2024.03.26.14.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 14:31:31 -0700 (PDT)
Message-ID: <06df4365-7e9e-4ed2-bdbd-b12f6a304c37@linaro.org>
Date: Tue, 26 Mar 2024 22:31:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/20] media: venus: pm_helpers: Commonize getting
 clocks and GenPDs
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
 <20230911-topic-mars-v2-17-3dac84b88c4b@linaro.org>
 <11164c40-492c-60a0-72a8-1176e017ffb1@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <11164c40-492c-60a0-72a8-1176e017ffb1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.03.2024 8:13 AM, Dikshita Agarwal wrote:
> 
> 
> On 2/10/2024 2:40 AM, Konrad Dybcio wrote:
>> As has been the story with the past few commits, much of the resource
>> acquisition logic is totally identical between different generations
>> and there's no good reason to invent a new function for each one.
>>
>> Commonize core_get() and rename it to venus_get_resources() to be more
>> meaningful.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.c       | 8 +++-----
>>  drivers/media/platform/qcom/venus/pm_helpers.c | 5 +----
>>  drivers/media/platform/qcom/venus/pm_helpers.h | 3 +--
>>  3 files changed, 5 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index 680674dd0d68..873affe17537 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -334,11 +334,9 @@ static int venus_probe(struct platform_device *pdev)
>>  			return PTR_ERR(core->resets[i]);
>>  	}
>>  
>> -	if (core->pm_ops->core_get) {
>> -		ret = core->pm_ops->core_get(core);
>> -		if (ret)
>> -			return ret;
>> -	}
>> +	ret = venus_get_resources(core);
>> +	if (ret)
>> +		return ret;
>>  
>>  	ret = dma_set_mask_and_coherent(dev, res->dma_mask);
>>  	if (ret)
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index a292c788ffba..1cbcffbc29af 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -326,7 +326,6 @@ static int load_scale_v1(struct venus_inst *inst)
>>  }
>>  
>>  static const struct venus_pm_ops pm_ops_v1 = {
>> -	.core_get = venus_clks_get,
> core_get is initialized with venus_clks_get in patch 4 and then being
> removed here. It would be better to combine both patches.

Generally I'd agree, but this series is rather big and both patch 4 and
this one are logically separated well enough, so I'd rather not waste time
moving things around and fighting merge conflicts for no functional change

Konrad

