Return-Path: <linux-arm-msm+bounces-39567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B3B9DC2B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 12:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B329D281B30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 11:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0D2199938;
	Fri, 29 Nov 2024 11:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kkGOZng4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930931586C8
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 11:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732879240; cv=none; b=jPJcaKs2AlB9D63m2w9E7qn+R/53OaCdV0dABASmsYCq5TK3GHZYC6z7QyOfUIamnff5nr0VFy56yX1G4SHcyoUcuY2h2j/9FLKz00GEXjV/FIGuCp5BWGKmFT7ostwBnD/dX358N5jvcMsEkTxuDWjw7SZ4yi9aBTzD5m6+1ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732879240; c=relaxed/simple;
	bh=QiPALT6HvBmOInux1rl+mRvBSruP2GPb88EaCDzQodg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgeW6UHqRzrcjDqjIlrry3vX9YheASYtwdxEPjBNaATtmVhsMRpvR+g1L+JFUfsog/I5Apjf48yyIhmwD3QdLA4uFq39oB7YbLhUrddSL6aFcguQ3jA8WjXOCT3MTqTy/B6G812r9qXpNZ0c6OY2Ga0QN3UUIzyFLKAAi3o5pN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kkGOZng4; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-2ffd5c3622cso1469461fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 03:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732879237; x=1733484037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aEngJ1u6bI6pjXw8ducjp4PDvEGzLJeEExC6wehZeKI=;
        b=kkGOZng4crPgn/i4Ir/OJoo6vX4d2o7HDzRSp4haO+DK7PAyZRxC9OHqvky/8CQUOP
         6p8ZJYoW2EjNQVMydScPU+jY0eom8IYNBz6NpP/R3dKTjqHf44wCQWIk3Yh8K5dYPxEa
         sh4xMWuGY+mvyRaPGewNIqrTIGwZC/byAWNbYgydK5rFB6lQKOD05mmqNj95F2R5b0XH
         sgXHKG+ex5E7bi8btbKupd2PuGKX54V/dsX6Nat4gVDZTIiVU0XKiKoDlbLzdZYk6ZUQ
         O0sFgO0wgp4DYVhgFPPS+PGte0vmZZ8oX5vHnQWkQhZTk8VwZa+nfkVjtqemwnaCOc4T
         HpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732879237; x=1733484037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aEngJ1u6bI6pjXw8ducjp4PDvEGzLJeEExC6wehZeKI=;
        b=Wgj7cnUVG3YO55x3/pXQDOb5BcDorZ9MVzZlC3XwupZ8wGAXDf3HRVE8gWW+kc2uPE
         VloLiwTKQO/wp3T/seTbrDC9OJ80APO6lm8XI3r6hN5hnGq+W4zSuEFDaCCe5x9Xud+U
         fvR56PMd4fduvMhJXr1hoW4nQvI39rphXhRevmJvc0MWnD51GL6Zxdd9gznYfbKAeEWy
         vBVV+wachakKIok4ej6KXLgM1VGz2JaYDEHX4imNuhNof97ElouPGaXdAQORqqlVJdLD
         WmqkgMoF22CN+q10ACIH5CFXrrskWd7ZDslkm2dYMKrcxedTQJtZsP+BxIfzCX0YyjC+
         YDnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNEA55hGWiQnyJ2OurZc1E2DxYIJM7ohun42i0mrmpNt4i2c+PLAwm0wPL+trO88+gI4UrlSuF26CLQe+m@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq4gRVtuSeObjFNmCxj73Dl0Wobp2J/wac3WsmzG0mlqsIYkwE
	wLu5LA6Vvv/oq5w/iAU2pDQj8M0KFUUDfVzBot42QPiXZrvIwWzqRUSA0cB5eKM=
X-Gm-Gg: ASbGncueO2HEVlCnGtvdjWXkBk4jnAoJNGrqCaWYShjmyHmbJ+Kp5944Cm8fTHcFhY9
	WXErzGetsFk0HVMdqf6U+D8M3Y6AXTkVmoKoaAnpIkUzkDJEMDXFxEyljU44dxcNI+PLzNgM84l
	eVR+uDYY1nwuid+rHognADmMOZCh6HuLzpMOvNVFzGl4rQB/3B5Pk6+5m9UmZfT9haabFfZ5vIA
	ecMA3gj54nZvXziJ8jOmRrW2UwD4InYxnTocciy1FLdSFCUW7Ky3gdxQEF7X0dLORWTBVZ/G8mb
	K/n3j9JT+A6+mc0BvZLkdaXkWSIq
X-Google-Smtp-Source: AGHT+IGLP9pjTswQ9pA+XlvlVMAV/Cw9gk2FVDbOAgGTKgsbtSCZ4/Q14zA7kCVHOCBJ0aMb3gbP8w==
X-Received: by 2002:a2e:a98f:0:b0:2ff:9449:fe02 with SMTP id 38308e7fff4ca-2ffd5e9a69cmr13646731fa.0.1732879236728;
        Fri, 29 Nov 2024 03:20:36 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc7471asm4267261fa.71.2024.11.29.03.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 03:20:35 -0800 (PST)
Message-ID: <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
Date: Fri, 29 Nov 2024 13:20:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
 <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/29/24 13:06, Bryan O'Donoghue wrote:
> On 29/11/2024 08:48, Vladimir Zapolskiy wrote:
>> On 11/28/24 21:39, Barnabás Czémán wrote:
>>> Fix NULL pointer check before device_link_del
>>> is called.
>>>
>>> Unable to handle kernel NULL pointer dereference at virtual address
>>> 000000000000032c
>>> Call trace:
>>>    device_link_put_kref+0xc/0xb8
>>>    device_link_del+0x30/0x48
>>>    vfe_pm_domain_off+0x24/0x38 [qcom_camss]
>>>    vfe_put+0x9c/0xd0 [qcom_camss]
>>>    vfe_set_power+0x48/0x58 [qcom_camss]
>>>    pipeline_pm_power_one+0x154/0x158 [videodev]
>>>    pipeline_pm_power+0x74/0xfc [videodev]
>>>    v4l2_pipeline_pm_use+0x54/0x90 [videodev]
>>>    v4l2_pipeline_pm_put+0x14/0x34 [videodev]
>>>    video_release+0x2c/0x44 [qcom_camss]
>>>    v4l2_release+0xe4/0xec [videodev]
>>>
>>> Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE pm_domain_on/
>>> pm_domain_off where applicable")
>>> Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>> Changes in v2:
>>> - Add backtrace to the commit message.
>>> - Link to v1: https://lore.kernel.org/r/20241122-vfe_pm_domain_off-
>>> v1-1-81d18f56563d@mainlining.org
>>> ---
>>>    drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/
>>> media/platform/qcom/camss/camss-vfe.c
>>> index
>>> 80a62ba11295042802cbaec617fb87c492ea6a55..1bf1473331f63b9ab106d21ea263c84d851c8a31 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>> @@ -595,7 +595,7 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>>>     */
>>>    void vfe_pm_domain_off(struct vfe_device *vfe)
>>>    {
>>> -    if (!vfe->genpd)
>>> +    if (!vfe->genpd_link)
>>>            return;
>>>        device_link_del(vfe->genpd_link);
>>>
>>
>> I object to this change, there might be a problem in the code, however it
>> is not yet identified.
>>
>> vfe->genpd is not NULL, if vfe_pm_domain_on()/vfe_pm_domain_off() are
>> called appropriately, the "fix" does not fix the real problem, it veils it.
>>
>> -- 
>> Best wishes,
>> Vladimir
>>
>>
> 
> Let's walk through the logic.
> 
> vfe->genpd =
> 
> Can happen in vfe_subdev_init();
> 
> vfe_pm_domain_on() can fail @ vfe->genpd_link =
> 
> If it fails then I _suppose_ we are still calling vfe_pm_domain_off() at
> least that's the only logically way I see this error can manifest.

There should be no room for suppositions, the source code is open.

If the described by you case is true, and vfe_pm_domain_on() fails,
then vfe_pm_domain_off() shall not be called, otherwise that's the
real problem and it shall be fixed instead of being veiled by the
proposed change.

> @Barnabás can you confirm that this is the case ?
> 
> If not, can you please provide more detail ?

The change does not describe how to reproduce the problem, which commit
base is tested, which platform is testes, there is no enough information,
unfortunately.

--
Best wishes,
Vladimir

