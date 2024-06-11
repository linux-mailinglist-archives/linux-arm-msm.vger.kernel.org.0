Return-Path: <linux-arm-msm+bounces-22347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B25CA90472D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 00:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BD2F285729
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 22:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD4C15532C;
	Tue, 11 Jun 2024 22:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwzQXKBx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447CA495E5;
	Tue, 11 Jun 2024 22:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718145963; cv=none; b=i68/xodT+nUFzXeY4eyMpW9MU534K44PSJQOGNBmqqw0K0tYSUmEeh90UE+nhWGQnD56q8O8wPstwNPfF6cqN7CoO1S4sV88pHCs3VvYtdwUa2yaXGvxdOLRAyRl3pi6nab1AwMiTgc7c7mlfyLq/n+y15Q2K03bpukSC//r+tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718145963; c=relaxed/simple;
	bh=8a5e6jI6LD77T7UiwIQsyyR5CriP4XU8Bwe7mMBynno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNwnEl+nu4DKIMuIyK8k9iMcawCdWWWPOV0q3ItXAC+PvUrln2Xcm7sKvPIhxrnhPhOX2w+ldtgLieSznLpZKI2a/IndNqB16XZHN+jQflOOIZWKIZkg3sZQWbxTv+SpmOlka0j8o/YyZGvwd5OqcOqFSqKcpdoLWaGpm/C2RW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwzQXKBx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42165f6645fso14129735e9.2;
        Tue, 11 Jun 2024 15:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718145960; x=1718750760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cDt7JzP/wsVoWXx6U+apUWSbCYtUPbPCYm2lOF3PwfU=;
        b=EwzQXKBxhHYx7YtG7FOE7lggixfJVqkj2uK1h/tuqfkF/h/+KjcTEu4OOrrXz5ZJg5
         McTmIGUP0V760AlW/bJc4d2ScGYloDYRAP2jgbCuuhGEAVG69kJUmXrJrdQATlMI/Rcj
         GSjnjT5zh7iCHbvgZJI1mKp0Iauqaa5N6TbK7ikdNUyk8yzI4O0PVgcfEr+sjy4MsolU
         X/SDplxxi0S+RLRdo5eBiM+lexgUZenDM1iC0ZXuyKMkYMhWWATXdCR9BjRAu7CEY8GG
         JVDsQa4KTkl3IgqDNw8VUn064Jp4JFncCOadQWv5CjQtN0699LeK200carB7o8cSA1UP
         lR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718145960; x=1718750760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDt7JzP/wsVoWXx6U+apUWSbCYtUPbPCYm2lOF3PwfU=;
        b=gwo3T89Rhb8f+S1TeMGsNQkt9w29es5W6O4tXyvsHgOKF/a5tIS08G2dpIeg1nr6R9
         rz9hzJ3eBLAQvMoWb+mQXevdi6E8sMyaP4dMgIsP68+MHy7YgG74HOANNTfPOY4xMwYr
         6l+v8jCIBLVkXpjqmK0Wo9lNKkVeGaQYqZO70NR7cf6GDpGBUcf67/zdvOUlUdVOA7GI
         xqtur+5u6AYgZYrtJh9UK5n2ws850bZrZRXniumwCjyStd9fbmGmn2bciPMFdDCxN3QQ
         qUFmYJPEHupj7u8GtYFu9+A1UaGdR1saTDADDRpr/rYdRssEVKNfXVlY4/UsCxatYHFs
         HApQ==
X-Forwarded-Encrypted: i=1; AJvYcCWccNK1rwLrcxNuxDMEYRvKvU6QNi3mn3oOPXmJG6OXO59mx5kjXgMn5aCcSl0dc0D0ovdimen4o60777KFPvvhkLOnIvPtD1fMBaiJzv1whYjFCDTcUG4PDmLkGcc2BEode9ZyGpRwZvEI74Jt2OD7JJR9wH1wez7QQ0HxEYqZUSULiw==
X-Gm-Message-State: AOJu0YzQ85W7JK9l0iux+JaX0bOwofvmzLH6QpbN4m2rfhijhe/QCL8d
	AS5SJYKj58s9tUMjF5gsJPKgsXDqIbad101sjNVblKs2c5SSnLun
X-Google-Smtp-Source: AGHT+IF+oobXt92lcfFLWV10Dxh5c7Wni6UQC6z2b4c6YM5u+M0APmT3j3qqiW3ERqliDhJEARuKLg==
X-Received: by 2002:a05:600c:1d21:b0:421:9cb0:77cb with SMTP id 5b1f17b1804b1-422866bedc3mr2705325e9.40.1718145960308;
        Tue, 11 Jun 2024 15:46:00 -0700 (PDT)
Received: from [192.168.0.5] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e6b63sm2544005e9.39.2024.06.11.15.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 15:45:59 -0700 (PDT)
Message-ID: <c292fcdc-4e5b-4e6a-9317-e293e2b6b74e@gmail.com>
Date: Wed, 12 Jun 2024 01:46:33 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] net: wwan: Fix SDX72 ping failure issue
To: Slark Xiao <slark_xiao@163.com>, quic_jhugo@quicinc.com,
 Qiang Yu <quic_qianyu@quicinc.com>
Cc: loic.poulain@linaro.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org,
 "mhi@lists.linux.dev" <mhi@lists.linux.dev>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <20240607100309.453122-1-slark_xiao@163.com>
 <30d71968-d32d-4121-b221-d95a4cdfedb8@gmail.com>
 <97a4347.18d5.19004f07932.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <97a4347.18d5.19004f07932.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.06.2024 04:36, Slark Xiao wrote:
> +More maintainer to this second patch list.
> 
> At 2024-06-08 06:28:48, "Sergey Ryazanov" <ryazanov.s.a@gmail.com> wrote:
>> Hello Slark,
>>
>> without the first patch it is close to impossible to understand this
>> one. Next time please send such tightly connected patches to both
>> mailing lists.
>>
> Sorry for this mistake since it's my first commit about committing code to 2
> difference area: mhi and mbim. Both the maintainers are difference.
> In case a new version commit would be created, I would like to ask if
> should I add both side maintainers on these 2 patches ?

No worries. We finally got both sides of the puzzle. BTW, looks like the 
first patch still lacks Linux netdev mailing list in the CC.

Usually maintainers are responsible for applying patches to their 
dedicated repositories (trees), and then eventually for sending them in 
batch to the main tree. So, if a work consists of two patches, it is 
better to apply them together to one of the trees. Otherwise, it can 
cause a build failure in one tree due to lack of required changes that 
have been applied to other. Sometimes contributors even specify a 
preferred tree in a cover letter. However, it is still up to maintainers 
to make a decision which tree is better when a work changes several 
subsystems.

>> On 07.06.2024 13:03, Slark Xiao wrote:
>>> For SDX72 MBIM device, it starts data mux id from 112 instead of 0.
>>> This would lead to device can't ping outside successfully.
>>> Also MBIM side would report "bad packet session (112)".
>>> So we add a link id default value for these SDX72 products which
>>> works in MBIM mode.
>>>
>>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
>>
>> Since it a but fix, it needs a 'Fixes:' tag.
>>
> Actually, I thought it's a fix for common SDX72 product. But now I think
> it should be only meet for my SDX72 MBIM product. Previous commit
> has not been applied. So there is no commit id for "Fixes".
> But I think I shall include that patch in V2 version.
> Please ref:
> https://lore.kernel.org/lkml/20240520070633.308913-1-slark_xiao@163.com/

There are nothing to fix yet. Great. Then you can resend the Foxconn 
SDX72 introduction work as a series that also includes these mux id 
changes. Just rename this specific patch to something less terrifying. 
Mean, remove the "Fix" word from the subject, please.

Looks like "net: wwan: mhi: make default data link id configurable" 
subject also summarize the reason of the change.

>>> ---
>>>    drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
>>> index 3f72ae943b29..4ca5c845394b 100644
>>> --- a/drivers/net/wwan/mhi_wwan_mbim.c
>>> +++ b/drivers/net/wwan/mhi_wwan_mbim.c
>>> @@ -618,7 +618,8 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
>>>    	mbim->rx_queue_sz = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
>>>    
>>>    	/* Register wwan link ops with MHI controller representing WWAN instance */
>>> -	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim, 0);
>>> +	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim,
>>> +		mhi_dev->mhi_cntrl->link_id ? mhi_dev->mhi_cntrl->link_id : 0);
>>
>> Is it possible to drop the ternary operator and pass the link_id directly?
>>
>>>    }
>>>    
>>>    static void mhi_mbim_remove(struct mhi_device *mhi_dev)

--
Sergey

