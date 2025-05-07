Return-Path: <linux-arm-msm+bounces-57196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A10AAEED9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 00:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 745FF1895759
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 22:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C736B2153C8;
	Wed,  7 May 2025 22:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nmayjh2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFE15D477
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 22:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658407; cv=none; b=k4bFOpFAv7wc+Kq2NTPjKR3PNVBYwuvCXm/kNa+OQjYJQ8HKl0+Ma+yJRbeJnxItkxEork3SF0dR9e3f1pDpJAo4rE7BJLm02jxuHgLoEDO6BYjG1pc+IIBM13Fp1XiZjPuLkbx+R06ICCOfsiQ55j3YclVvK15H/2y3UabXKmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658407; c=relaxed/simple;
	bh=JbzYhrgPmz/o7h2zZyoQ2HeZyaNllO07GDdTYgtL8QE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6yJnb1abooZpf8lmUwNLc4ht6reIc9lN1ZgsslBMBeHNRpDDGHVzIpEmyjHEAIXv9I6SKr3VMoaxpCHwiKk+4GJk8RFHiJFeN+hh0U7TRhKsqnSPzKsAReqLAvc31yUtLZzj3nnPiItEgpfEdWbDnjZyMQ3IvNPr7RKAHTCUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nmayjh2X; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54eac09aa50so56878e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 15:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746658404; x=1747263204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlVficwMHW5bnQrJgqz9lUT+ZGh6/8t1mCdFoRRa5Eo=;
        b=Nmayjh2XSSuV/SM20Nxw2PtR+ws00PMCtMdnYGffFMNy834o+nZmHvCJrFW45CEUZl
         soPuHTxp82WJISHNdmyxiovI3IoIN066D1UgJJVNJo0w5CKqFVb3EfXxdBjFejuFpcgG
         mu3u6ZA8WkNZSVhHRxii0JBA3Ks+dlLDM+OoQmdvztxJ62Yp6XGCEarc+GIvfegvYR78
         NRSgOxF7K9L+/frU1/jtwqsIQhcY4VHXZJs7VTyaH1dy2xwe024pslkxxTK4eLAQuWvC
         kFY6qHbHKDp+NBRbvLVevLgBhHtB/yzQ0A5MiuRsQkiP03Y6b5vl9oDT5mwGzj5lQIzs
         9TnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658404; x=1747263204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlVficwMHW5bnQrJgqz9lUT+ZGh6/8t1mCdFoRRa5Eo=;
        b=ZBj9+0ejtL55ZMLzWULYVz+YTZsUqWrVxnkVNezUeGkvoOLytN1Tfn0CgNiEyO32Q8
         L4PTKa6NstoLEsCOGE3zJ/CYHh8zyaPi2Mmck5w121PSARVDr2zZ+TgpiVblLiwb40zC
         AnF2JZG6/lAVNq4UF6OhU7va2rVPRwa3ZViQ3H3hiCx6PZEUOKEbw7Opgj3VkZ+/LBLD
         NUbEtLwosnTDFJvZN3PkLd2Lq9UVFKjZcY7NqnCXH2dFoZ7/tas7mGd+I3mjUEQGgkAo
         2J7Oyg2GsZqoc28lAhvwN+OEA9y72t1KGGUI5tki4bdHTJHvlUZ+A055qWiTYQbfbEVr
         Ro5A==
X-Forwarded-Encrypted: i=1; AJvYcCVBYXUr8DS61mVpc2YQQ1Af1RHWlHBlMQvDWmTTmFiQIYjJIEXkmwkA9dX8MDTRoItxR1+mfLAY/nLOJBTF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw27RLQphYOpesHuYOtRI+x4Mbq4PcAIbkXFffVgLiM1ScYjfsB
	w9dPRTukO7T6hgrgMQY0qwK3+OKf1HUV7KMxd9t+TD9RlTgiLVR411JeU3wXB2k=
X-Gm-Gg: ASbGncs4EIOQBQddhF+RABZ4d0nYv9Hb12C90GDabvtVdrr76gEnc30UAXu/pdrYaRi
	d1wpY6d1xR1PuS7ZCuW0Cb5XImUvQf/9EPNKyFHOEUVhBT+Cwwc0sfVm9qDxEUzJeEZYF6jCT2v
	yfRkOJrUi0gSECjvL/DnZ3OrO14yDDUXfYPGsQBLa3FHo3p9eLefv+PzP1pm+V1PEsg4jZh+Iyy
	YaokcCHkb9v8x+bmpzYxMAe4smBLE1H8t6kFEqvzVUBJguSOaQF1EyW9Oo7UbLbpEOuIRv+4iFH
	ArjkUprVSqfpqn9R7brRf0Mew9b2pd7kHQGcXyIkhib20JP7mrjr9rvFxjhJUCpQj390ReRxBfr
	ehZdpcM70ABKRqNqiI8k=
X-Google-Smtp-Source: AGHT+IGSPC0AEPj05+D6d3Mzs6vri+sTBq2zyky+s0YWr7AbwJ8/5Bp1988wfG7UTipNEAgT6KZp8Q==
X-Received: by 2002:a05:6512:ea6:b0:549:8faf:e21b with SMTP id 2adb3069b0e04-54fb95fff5bmr638518e87.5.1746658403798;
        Wed, 07 May 2025 15:53:23 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b1914sm2470283e87.38.2025.05.07.15.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 15:53:23 -0700 (PDT)
Message-ID: <765b0d28-7295-42ae-9ecc-58899dc2ea53@linaro.org>
Date: Thu, 8 May 2025 01:53:16 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: mdss: use devres version of interface to
 populate children devices
Content-Language: ru-RU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20250507193538.2140862-1-vladimir.zapolskiy@linaro.org>
 <xmpb6zrbnx2jcfjthkafj6viptkugowo7qdfxlg7vdfh3mqlua@2tcbsd4f3dtv>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <xmpb6zrbnx2jcfjthkafj6viptkugowo7qdfxlg7vdfh3mqlua@2tcbsd4f3dtv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 00:24, Dmitry Baryshkov wrote:
> On Wed, May 07, 2025 at 10:35:38PM +0300, Vladimir Zapolskiy wrote:
>> Trivial change, there is a managed device resource version of
>> of_platform_populate(), and its usage simplifies the code a bit.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>> index dcb49fd30402..116e8f93f8c8 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -550,7 +550,7 @@ static int mdss_probe(struct platform_device *pdev)
>>   	 * Populate the children devices, find the MDP5/DPU node, and then add
>>   	 * the interfaces to our components list.
>>   	 */
>> -	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
>> +	ret = devm_of_platform_populate(dev);
>>   	if (ret) {
>>   		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
>>   		msm_mdss_destroy(mdss);
>> @@ -564,8 +564,6 @@ static void mdss_remove(struct platform_device *pdev)
>>   {
>>   	struct msm_mdss *mdss = platform_get_drvdata(pdev);
>>   
>> -	of_platform_depopulate(&pdev->dev);
>> -
>>   	msm_mdss_destroy(mdss);
> 
> Unfortunately this means that the child devices will still exist after
> destroying the MDSS (IRQ domain, etc). So, it seems it can not land as
> is.

Due to the essense of the change this sounds odd, anyway thanks for review.
I'll perform a test, if it's a regression or not.

>>   }
>>

--
Best wishes,
Vladimir

