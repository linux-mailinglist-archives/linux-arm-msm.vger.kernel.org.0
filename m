Return-Path: <linux-arm-msm+bounces-44226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56215A04E4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 01:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B28893A05F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 00:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF9A18B03;
	Wed,  8 Jan 2025 00:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="2u5FrkuJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055CD29CEB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 00:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736297486; cv=none; b=CdfZYzou9taHjHFUviyQjDR6DELoiKg+yTZYzrT3vRO11pvXiE1tN6vK55rRJpKbC52eaNZb5niPrgIAA0x4Riku9erowIYIriHkMYwI7J0O0+jSAPyI7pPzsxEJAp8QYy9x87LCHP875wN2GNKJkX2liewF4pTrhHY4HdBUML4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736297486; c=relaxed/simple;
	bh=pKTmIKj6dk87aAiSMth1o8iDwOIclQ2hnSIsR/2wmJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpZiI4flLWTV2Z2nXSBIA3RcJ6UqVy31ILIxI7rDlz0q3VzDnl/Al+pJQXNTDBacs0jpk6j0mVY6Jv56DCUwxmWDmRTNc8CdSOowZLMu978QXNq7na4DiRTN00a2hlOFFshyrp/Z53sZUSByRuAtsSF4aD/1tIDSqkhwUoVAxR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=2u5FrkuJ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f441791e40so19246232a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 16:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1736297484; x=1736902284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPw9EGTFwrLCpBMazWk+ho4C9RYK7bwHgEByogycJAU=;
        b=2u5FrkuJ2Dni7h1YiGc8hQ6HbXlL2fEj0vNitLPR69puzZ2CwHIBsAEyvZaATqyVFo
         AIXGRtIqxss9Y5/bZhsLWA+Ry+q7qZ7ywg91ufZRqpu8j5wOWpc9MekBD/D13dxlKvlk
         du1EzlL0y/gpSbtNiMNuqUCJoFukI9W1DwPMQ+TvQ0IDlxalx4uJFR5NaXNj1OcrgVNq
         /p3laxIb2e0zaLjcwL9MwmzrOogXBx+Powp8NMGaeoFfTktzQ4xRoG1sZd3cIWUHmfXs
         G1cS/6KqXbB0OLL95jnZ2l/7c6cJ/YNcukuhHTQq9oGqxbrfWHC+GShs7ZkvIc1vvEu6
         /z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736297484; x=1736902284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPw9EGTFwrLCpBMazWk+ho4C9RYK7bwHgEByogycJAU=;
        b=rX09i8Qj2mXlhnhw+HRLsYqEw+li2grCJ6UlpUhIiwMsotJDtYpGmZiTA2B/gsVQb3
         018EnOigoff1CUvotUjCl/uJpkYA5tpX+nvQkYjc2ZejHntfwzwjYl7Mlq2X4HeA5SsK
         +33bOxsGp8myVerpfBJtANdQ3IfR1VWFUZZ4lqwTeUt0vxbsm3CXAX8yZcCo/3RCJmkv
         nWocHZH69qoSYhKPs6IgUmSj9BzhjgecXvD+bqF4umUr6WyQDj+AgafD4QQgoGz2fMYB
         kRNNeoz5M6Y1a/1WGG3gDtVv293OeKsXM5m5VKN3iKaBw5gCpDcco8UNkz9nFZJhDuJc
         45zQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+RE4idJmfoToR4ykHoiGSoR7xIRXK9gEts8IfGIETyZ7V/8yPXzA5gQrkUBt7KFaWAgXhlqfclvxK7qNJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/qPotdWfOhgftiAkmHfhlZxy+jygy+C/akUpgo/Ayawpuit6l
	7JQ3JmnHiDgTY67QraODapLUUFdrmyRDMfh5K/jCiq4z8dp6t9mZs19CMbnD7l0=
X-Gm-Gg: ASbGncsJU2DImw9lLZyaPmh+wUQMbuYD5lrCORawCU0pHBC0lFT0GT5GSINh8nkrBlR
	ebUeMA8/r0bhit1lqQl9VVLHMJfGK9QYowhSA/p46/PtkT1/di/DZB2KmVM1caS8+QYon+SbpHN
	fFPapIIQIiTH1enjmYbHhVKlUhxgWVAtA29GR83BCulqvBqXsR9Csrbh+bnPW6oWIIA6vZorLKn
	M7WALMeunlj1mSf4dnLwD2hia+9DU1wcrPeQcRRm6Fb7cNLzC+ta6tE+5PoyZrnbNukCbAAYgLj
	3OBKfyh/N1n2UPDDZhQLNZ8EmqrG+VwdIA==
X-Google-Smtp-Source: AGHT+IG91ZxpauY5DXHWgMbcPG5dNP1xFYOmixTv3N0GVXdMBEsC8q3uevYviW/l80oRHBchDnUI+A==
X-Received: by 2002:a05:6a00:1255:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-72d21f4b05emr1699879b3a.8.1736297484172;
        Tue, 07 Jan 2025 16:51:24 -0800 (PST)
Received: from [192.168.0.78] (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e36caf84sm31255890a12.74.2025.01.07.16.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 16:51:23 -0800 (PST)
Message-ID: <4fb21448-4ea5-4583-b55e-d06a53f5f770@pf.is.s.u-tokyo.ac.jp>
Date: Wed, 8 Jan 2025 09:51:20 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix an OF node leak
 inqcom_smd_register_edge()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
 linux-arm-msm@vger.kernel.org
References: <20250107081823.1682549-1-joe@pf.is.s.u-tokyo.ac.jp>
 <wry5yiqbw5bkqtyibh222wish6o2ufzinh4kicomirdd3vt2bn@lods4lgjvytk>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <wry5yiqbw5bkqtyibh222wish6o2ufzinh4kicomirdd3vt2bn@lods4lgjvytk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for your review.

On 1/7/25 21:40, Dmitry Baryshkov wrote:
> On Tue, Jan 07, 2025 at 05:18:23PM +0900, Joe Hattori wrote:
>> qcom_smd_register_edge() leaks an OF node reference when
>> qcom_smd_create_chrdev() fails, since qcom_smd_parse_edge() sets
>> of_node_get(node) to edge->of_node. Add of_node_put() calls to the error
>> path of qcom_smd_register_edge() and qcom_smd_unregister_edge().
>>
>> This was found by an experimental verifier that I am developing. Due to
>> the lack of actual devices, no runtime test was able to be performed.
>>
>> Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>> ---
>>   drivers/rpmsg/qcom_smd.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
>> index 40d386809d6b..6982015b218d 100644
>> --- a/drivers/rpmsg/qcom_smd.c
>> +++ b/drivers/rpmsg/qcom_smd.c
>> @@ -1509,13 +1509,15 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
>>   	ret = qcom_smd_create_chrdev(edge);
>>   	if (ret) {
>>   		dev_err(&edge->dev, "failed to register chrdev for edge\n");
>> -		goto unregister_dev;
>> +		goto put_node;
>>   	}
>>   
>>   	schedule_work(&edge->scan_work);
>>   
>>   	return edge;
>>   
>> +put_node:
>> +	of_node_put(node);
> 
> please put edge->of_node to make it more obvious what is happening.

Yes, addressed in the v2 patch.
> 
>>   unregister_dev:
>>   	if (!IS_ERR_OR_NULL(edge->mbox_chan))
>>   		mbox_free_channel(edge->mbox_chan);
>> @@ -1548,6 +1550,7 @@ void qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
>>   	if (ret)
>>   		dev_warn(&edge->dev, "can't remove smd device: %d\n", ret);
>>   
>> +	of_node_put(edge->of_node);
>>   	mbox_free_channel(edge->mbox_chan);
>>   	device_unregister(&edge->dev);
>>   }
>> -- 
>> 2.34.1
>>
> 

Best,
Joe

