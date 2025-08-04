Return-Path: <linux-arm-msm+bounces-67685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AE1B1A2CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C58A3A265B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D0F26C3B0;
	Mon,  4 Aug 2025 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RnDB6aCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F845EEB2
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 13:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754312598; cv=none; b=aMvtpJczhJVG9CPcs5vfZKI0LnXCBZ4LzyhBtOBvMttTtsenk9lBBccaenxRyDoB9KirZCVnoQe4+6OU2AQCHYcxkCC8f2tV3OjXBCSiFshYqewlbpxmx7esJXA1vhHlbXm7FmvTeJfxvcj2vZWDLwQyDNOGtXlFdC9cPAwVDyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754312598; c=relaxed/simple;
	bh=AsROPsVEl1oTjmpB6nCLhCvRE0hr89auEqbCmM9WAyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sy5lhvf0TWV+1UPG0KYjTYI3ytTODVrYeMsTXLwFxebsvZ5mp/rSPP0gffC/UBlg/nIiafGrMruELOwXH2fAYlSATaGYTd1yJrjtOyqpPCVt1c2nXgKfkZUZ4yZ0Grkw7VDgrUJJKhVpBJju4KaPbxNKS50qKiSujbfRtU2lBjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RnDB6aCW; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-61576e33ce9so7995680a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754312594; x=1754917394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q47hRQ8aof0UlFDXgmcMzO/kJRO5vpkzZCiWS2hBN/U=;
        b=RnDB6aCW1UjoSRMWGFE7N9JFBPSIznZeCv+jxcKhGjHmS/GP/+gbpqhnlwWwv0J3sd
         5t+sGNahuwexVNIhVhcbqQgZBh00DLOvSUf8HqOsafXZOdVQS0+2yaooe94FVdcyZk9g
         v+E6gAVC15CMK44ik9/vtjEwOfJxN1ZIqt4K87WNI+TfgZPbUi33fBVuSKE9yonTzSs+
         ATbggjLfxmoP1eQUFUIXJf0b6G1eifgvwmhYImKuoHmKTticmgli8XSwtKbCb+p2TjZx
         nrq4EnbcSe8tn/fhv+JwGc3ptxzjPtuwEfTvK2L+URggJBTFilY87ZYEc4GFtapsnEgR
         4m9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754312594; x=1754917394;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q47hRQ8aof0UlFDXgmcMzO/kJRO5vpkzZCiWS2hBN/U=;
        b=C7DbKttCFX1VPFogEKnRPrF3+E+P+JjpGyAcgDPLe9HdcPrmIrpnSxrw0JvoAye+Jb
         vE+jda0xMv4XWrcEtXQcec+sLNHs4qBylL+WujJ+hNXfYmLOXf4njej76d8pgsDX89pd
         9NOSsFNngF7lrX7UBeV3dAryMxPYUpLGARAPn2i0gVDC5zl0UFcUNY9/AGRltmU5JcWH
         nnna9ng/TcsDEMpaOg5NU14vr2W5VG4vWTcpsPv3MizTak5AIvmP4ZIiYam2W5M+xyIB
         UINK+C+dnXrAGPiGB2Yu9+NSzrfFdDQL7d/FW2V8ym1ErJ5ClU8GAQVKq74OR2mi+aqE
         drSg==
X-Forwarded-Encrypted: i=1; AJvYcCVpGWopamEkYLKLj35FyyNdjTHANHZeAwYcAmUHZJOutMcmTcg+k8nC+U1Yy7Feu99Zk71pCHxsAhYvV+Kp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc+6lMqywh17DI0Yor8V3NHQYftFtoyPJCNGmsFS4tsn71+dGv
	4Gxlv+3uGuXmoB/9iFb/i112y/E/vTxoZbPGVlMA/uVfAcQIfTiBTg05B4eFVYW/914=
X-Gm-Gg: ASbGncvk/0v/2Y7K6M1PlWPxpzQxSGng3voLCPNREAeO3uNOc+Eg9Dxn1uGFz/CsvXP
	hDof6wCOWWmWWvYvnV/jjxRISMH/YzQk+J6iU0D9ItsNl8lwJEJ0ufr6ZcG1kf2gZzqplHPdSGz
	AMZ3f4R6M57j4Lfx0mwAa1GmxtbyW/ARqh6TFGf947cdpFr7PAL6V9dhbc60y+pxUbCN5DOJ+kq
	/S9dY6JHiikDupDpXF81IjhA3DJ43SELN7WOOf/S9ydxvcIHw0CGc9NXRlpHCkvttC6DTllEeit
	FScQiFjWd4M2iNci5jUkhmf/rt8RMdbCYjT977IxT296UeME9Xa6VDUUVIeTrFCR/k/yTlnC3Ye
	1aVKBMaRKb/Kbbvia+sRy3fpk7qWj7g==
X-Google-Smtp-Source: AGHT+IGvSWWoom5PCcQotC2cJOEy0b1eBZ0+mNZIcNqIApwylioSaULTySuV/h+PeeW7g5S3kYnbAQ==
X-Received: by 2002:a05:6402:27cc:b0:607:35d:9fb4 with SMTP id 4fb4d7f45d1cf-615e5e52361mr8637535a12.15.1754312593561;
        Mon, 04 Aug 2025 06:03:13 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8effda1sm6755395a12.1.2025.08.04.06.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:03:13 -0700 (PDT)
Message-ID: <ecd33fa3-8362-48f0-b3c2-d1a11d8b02e3@linaro.org>
Date: Mon, 4 Aug 2025 16:03:10 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-23-eugen.hristev@linaro.org>
 <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
 <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
 <aJCRgXYIjbJ01RsK@tiehlicka>
 <e2c031e8-43bd-41e5-9074-c8b1f89e04e6@linaro.org>
 <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
 <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
 <77d17dbf-1609-41b1-9244-488d2ce75b33@redhat.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <77d17dbf-1609-41b1-9244-488d2ce75b33@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/4/25 15:49, David Hildenbrand wrote:
> On 04.08.25 14:29, Eugen Hristev wrote:
>>
>>
>> On 8/4/25 15:18, David Hildenbrand wrote:
>>> On 04.08.25 13:06, Eugen Hristev wrote:
>>>>
>>>>
>>>> On 8/4/25 13:54, Michal Hocko wrote:
>>>>> On Wed 30-07-25 16:04:28, David Hildenbrand wrote:
>>>>>> On 30.07.25 15:57, Eugen Hristev wrote:
>>>>> [...]
>>>>>>> Yes, registering after is also an option. Initially this is how I
>>>>>>> designed the kmemdump API, I also had in mind to add a flag, but, after
>>>>>>> discussing with Thomas Gleixner, he came up with the macro wrapper idea
>>>>>>> here:
>>>>>>> https://lore.kernel.org/lkml/87ikkzpcup.ffs@tglx/
>>>>>>> Do you think we can continue that discussion , or maybe start it here ?
>>>>>>
>>>>>> Yeah, I don't like that, but I can see how we ended up here.
>>>>>>
>>>>>> I also don't quite like the idea that we must encode here what to include in
>>>>>> a dump and what not ...
>>>>>>
>>>>>> For the vmcore we construct it at runtime in crash_save_vmcoreinfo_init(),
>>>>>> where we e.g., have
>>>>>>
>>>>>> VMCOREINFO_STRUCT_SIZE(pglist_data);
>>>>>>
>>>>>> Could we similar have some place where we construct what to dump similarly,
>>>>>> just not using the current values, but the memory ranges?
>>>>>
>>>>> All those symbols are part of kallsyms, right? Can we just use kallsyms
>>>>> infrastructure and a list of symbols to get what we need from there?
>>>>>
>>>>> In other words the list of symbols to be completely external to the code
>>>>> that is defining them?
>>>>
>>>> Some static symbols are indeed part of kallsyms. But some symbols are
>>>> not exported, for example patch 20/29, where printk related symbols are
>>>> not to be exported. Another example is with static variables, like in
>>>> patch 17/29 , not exported as symbols, but required for the dump.
>>>> Dynamic memory regions are not have to also be considered, have a look
>>>> for example at patch 23/29 , where dynamically allocated memory needs to
>>>> be registered.
>>>>
>>>> Do you think that I should move all kallsyms related symbols annotation
>>>> into a separate place and keep it for the static/dynamic regions in place ?
>>>
>>> If you want to use a symbol from kmemdump, then make that symbol
>>> available to kmemdump.
>>
>> That's what I am doing, registering symbols with kmemdump.
>> Maybe I do not understand what you mean, do you have any suggestion for
>> the static variables case (symbols not exported) ?
> 
> Let's use patch #20 as example:
> 
> What I am thinking is that you would not include "linux/kmemdump.h" and 
> not leak all of that KMEMDUMP_ stuff in all these files/subsystems that 
> couldn't less about kmemdump.
> 
> Instead of doing
> 
> static struct printk_ringbuffer printk_rb_dynamic;
> 
> You'd do
> 
> struct printk_ringbuffer printk_rb_dynamic;
> 
> and have it in some header file, from where kmemdump could lookup the 
> address.
> 
> So you move the logic of what goes into a dump from the subsystems to
> the kmemdump core.
> 

That works if the people maintaining these systems agree with it.
Attempts to export symbols from printk e.g. have been nacked :

 https://lore.kernel.org/all/20250218-175733-neomutt-senozhatsky@chromium.org/

So I am unsure whether just removing the static and adding them into
header files would be more acceptable.

Added in CC Cristoph Hellwig and Sergey Senozhatsky maybe they could
tell us directly whether they like or dislike this approach, as kmemdump
would be builtin and would not require exports.

One other thing to mention is the fact that the printk code dynamically
allocates memory that would need to be registered. There is no mechanism
for kmemdump to know when this process has been completed (or even if it
was at all, because it happens on demand in certain conditions).

Thanks !


