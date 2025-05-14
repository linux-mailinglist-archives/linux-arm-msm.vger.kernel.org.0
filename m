Return-Path: <linux-arm-msm+bounces-57866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94745AB6FB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1484A3A44A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA17199EBB;
	Wed, 14 May 2025 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I7PftzNH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69892AE8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235780; cv=none; b=gbiGsu3b9hGZSHXCA7sL4qVSXwAnlKzr/t8nu/2rErYn1yXjp1QJJzi/P0d99Qbnk/lBG2eaNCrnXiq3nTHZYjkI23s/Vy2o+1NLukQmJSjxyz0lvtNzztDv7Nx2votHCHWrCDIiBOvwBqM2O47pKXOK/eJ8Zt6ItUxy2yubmTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235780; c=relaxed/simple;
	bh=A+ZREnFnjy7WnbyzA04zfHjDIR84YL3agT01BU5S4iA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkWYiTIE5HFNfIRqRtimkcymq1thojQxERtaO3+Z6kw8/+75GjcDtrFtpiGyBQuadjv9NjUCTdKaJjNvUfxCeSMqcXM46/Xymf8+q/0KjpLwr+osyVGrlI4uJ60bitVlQhMFRNIU6pRMiM6xnPu7lZancZQWAjofbFNilC9hEQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I7PftzNH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442ea0b3b46so3015575e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747235777; x=1747840577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLLB2JgoE/wciIQn8PJQyEZ3gk5gElbJqmLV5zYv7MQ=;
        b=I7PftzNH9+uKqbxwPT8FNhThm+8VDi7N3xAfWoH6ZPEs2V92vDzWVMEIPwCuuWd1/e
         NNwnQ3agYhkAwf4qJ5qTw8s7GF0f+a4eepwksjgeRHYUgxqpd4Sd7B+gbpFemxJMziDS
         qYEq8sH2U5x45XcfLJCM/iJhcBdMNgREfeKGlxPd/avCHGmWe7zfKaw+CoFe3oV2PQzf
         uT500UZcAmx5oz8hV0ptOgRG3d+QMFjF2Dg/kL0/1bLtnnc3irB2ZiwK2PORq4XEuM5T
         ROvj2LFy4mzvrfKNPrwddLZ2CO/Lu1vDJEDDbtXpHVyWthpJ0AMR4rqgpcmgxzBrD02P
         IbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235777; x=1747840577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLLB2JgoE/wciIQn8PJQyEZ3gk5gElbJqmLV5zYv7MQ=;
        b=wpjmJmAF3nriExorGkOBp+Rto7SVNfwm3rs/779RnwXzfJIRDWVg1OnpNE4dqngOUe
         ncY+1YRd9BolMna1/EsyR15uaW9o/pEw3bq2/Ucx17hxOnKCOV0NAT0MTB/jA+BJZwvM
         v3Cp6D2aLx2PGQB9zL0/ARLhudTyTdRD6l7PMNukkFaNiExmXqV9Xv5qgPw9SY1YBlot
         LKJb1HuufdC1unwiAHeL3vatTsZyR9PvvVYbM0uKJ1xx5tEUN/zgLt8gEHqEC+1pX1Jr
         IkeP4K9pvEZpcupL5hjPtM+Zum4DqKHe6F69OzL1KDsvjnTuHWFCm/TESMyj6ZgD9X2T
         lJXg==
X-Forwarded-Encrypted: i=1; AJvYcCVdExlBXHRJAzOWG3cVIWDSbWnTuq+w8PQrLdfLbIzVuE2LicE3xAxEjsV/nxucjhlPAIh6st0L5LoLOSps@vger.kernel.org
X-Gm-Message-State: AOJu0YxFImrd+bcRkpVqb7HgowojgZjvUPfmnAs+/rCgy2n/crbLab83
	BVk3Igt5CtW64pqBwhF2qCX4jVkNFfvOK85RziG5b+mdObZK35qAGUlBEvq1Zw+oEJT9J3ugjLs
	d
X-Gm-Gg: ASbGncuhj6MWGmPqDbitN7SC32hb7zcm6gIRqItOvktDYB4khsJ3bQauL5/LOIpDc8r
	p5i8nNqVXqTUH6xw6lyXRyv1d4+pDRHdaAqNghjBPf1dihUu1m23acz+fBDZX4EY/hP+cFTuzd6
	jxxgVOCFLPKSXgw6uLA0QYd3joR/hCAiRgL/7+7n8wFrq/Et+uBLYyfQ/Qeu0upvyhJkcgSE/Dj
	JD35I7Vxypp3vtySNWHUA1St/fOvMBIDDauTEmjiNV8eADb7AoRMW0xn1xoEhEBKCpi1U4/wey1
	usdleEntmnd7roik8532wEWFesxTV2r8kdsnkdZBW0ZUSlRCxwQJh3at2MQVyHto6YllUfv2usg
	dZzKumObvXnX2rxNX
X-Google-Smtp-Source: AGHT+IGRdqEZoH0m8g2XpOtD2dtSxKfER2HIpxDhVxDms9lqGHZslGS6DbXQ+jZD7wxOe3qZZbBy/w==
X-Received: by 2002:a05:600c:3582:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-442f21778d8mr12217105e9.6.1747235776744;
        Wed, 14 May 2025 08:16:16 -0700 (PDT)
Received: from [10.61.0.69] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368f36sm36810025e9.1.2025.05.14.08.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:16:16 -0700 (PDT)
Message-ID: <4184cb3a-bbdb-481a-9a82-f487f9ac3689@linaro.org>
Date: Wed, 14 May 2025 18:16:15 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] media: qcom: camss: unconditionally set async
 notifier of subdevices
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-6-vladimir.zapolskiy@linaro.org>
 <33caa974-75f7-4054-9f75-9b97981335f1@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <33caa974-75f7-4054-9f75-9b97981335f1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 5/13/25 18:46, Bryan O'Donoghue wrote:
> On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
>> For sake of simplicity it makes sense to register async notifier
>> for all type of subdevices, both CAMSS components and sensors.
>>
>> The case of sensors not connected to CAMSS is extraordinary and
>> degenerate, it does not deserve any specific optimization.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>    drivers/media/platform/qcom/camss/camss.c | 30 ++++++-----------------
>>    1 file changed, 8 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 976b70cc6d6a..4e91e4b6ef52 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -3556,7 +3556,6 @@ static int camss_probe(struct platform_device *pdev)
>>    {
>>    	struct device *dev = &pdev->dev;
>>    	struct camss *camss;
>> -	int num_subdevs;
>>    	int ret;
>>    
>>    	camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
>> @@ -3627,11 +3626,9 @@ static int camss_probe(struct platform_device *pdev)
>>    
>>    	pm_runtime_enable(dev);
>>    
>> -	num_subdevs = camss_of_parse_ports(camss);
>> -	if (num_subdevs < 0) {
>> -		ret = num_subdevs;
>> +	ret = camss_of_parse_ports(camss);
>> +	if (ret < 0)
>>    		goto err_v4l2_device_unregister;
>> -	}
>>    
>>    	ret = camss_register_entities(camss);
>>    	if (ret < 0)
>> @@ -3647,23 +3644,12 @@ static int camss_probe(struct platform_device *pdev)
>>    		goto err_register_subdevs;
>>    	}
>>    
>> -	if (num_subdevs) {
>> -		camss->notifier.ops = &camss_subdev_notifier_ops;
>> -
>> -		ret = v4l2_async_nf_register(&camss->notifier);
>> -		if (ret) {
>> -			dev_err(dev,
>> -				"Failed to register async subdev nodes: %d\n",
>> -				ret);
>> -			goto err_media_device_unregister;
>> -		}
>> -	} else {
>> -		ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
>> -		if (ret < 0) {
>> -			dev_err(dev, "Failed to register subdev nodes: %d\n",
>> -				ret);
>> -			goto err_media_device_unregister;
>> -		}
>> +	camss->notifier.ops = &camss_subdev_notifier_ops;
>> +	ret = v4l2_async_nf_register(&camss->notifier);
>> +	if (ret) {
>> +		dev_err(dev,
>> +			"Failed to register async subdev nodes: %d\n", ret);
>> +		goto err_media_device_unregister;
>>    	}
>>    
>>    	return 0;
> 
> If I've understood the intent here, don't think this is right.

Please elaborate, so far it's not completely clear.

> For cases where we want to run CSID TPG or standalone TPG we would not
> necessarily have a sensor connected.
> 

That's correct, and this is not broken by any means.

As you mention it there might be so many usecases, but fortunately all of them
are covered by the code, which is noticeably simpler than the original one, and
which opens the path for even further code optimization and simplification, as
you find it in this changeset.

--
Best wishes,
Vladimir

