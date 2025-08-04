Return-Path: <linux-arm-msm+bounces-67673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ACDB1A168
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 14:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43C9C179D17
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 12:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0971C258CE9;
	Mon,  4 Aug 2025 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlVoQuAs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BDB24502C
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754310563; cv=none; b=SjaYy99BK1q51wYtib7jMa1l3AvUZNbM25v1A+asImZnbwrYAV9IhfS+0KmGt+ltfKQ1tvj8TRH56fbiD5PQHHknDSIRvqJx9libzSXtQkaR8tbsuH5Nn1GE2emYsc4K1D/MZjtmI2e77axwkrlBKPczb9yIc5CIuy9MBogugyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754310563; c=relaxed/simple;
	bh=U9cIk5nNOFMjn3FiFMd3fKsKPPWOiLNS76Io6aFJNBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnhARBnlqZGZn56Tc0qKOWNmYGJ2DsDNmpt0QSITQUiWXIY5xM4oX59MxmnDyX+kYG8VlCLQeZB1i6Bt9l7ZAJJ8evmd3Az8P3nbxaPeHrYn9uGZG8a1qmovJdtgeUBM3Pq4/0E8a9MynVTIzrBevWhonEbQCBvEi/122ThLVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vlVoQuAs; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-af949bdf36cso332732166b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 05:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754310561; x=1754915361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bh2VbEr4+GPS+zCP6PyGLcsH4RZmjBkc+JIVLTQNkVU=;
        b=vlVoQuAsD4eWwVR59xX98IhiaftMxzstKUi+ZO5aVLoZkM+qSu28A+UNKGnj7jWK3A
         680Gc/kXxG76MSmYRjvP43pbRcaIsCaJZjTJzj1e8Clu1J8XkFKfsgVN23cv20oVXuCb
         W94XdGoBc8I5x7eIQk4Ik/nREcRRS+E8+sEX9BbP1mZYalfSKs3svWp3qIYaRKR6xaDa
         oKv5oEc5+OEsdU/bmoAw4QoH6gBC9a9t9vuTHRUtCYw69T0+bKYGSVreXwv+ri9+qIbD
         3QdhpEzlNjLG1eFJg72CKMVGly187TGial8+G8OOZcmae12v4443afAEXLl/eoJi3gbD
         XEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754310561; x=1754915361;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh2VbEr4+GPS+zCP6PyGLcsH4RZmjBkc+JIVLTQNkVU=;
        b=Cf13mdQDoEicN3xl0xOEjeLAj2YAqI6pym6AoRQhP3APe8wOE7KYSj4KA/0Ui41J3T
         uQWByuiLr/g46FIY/o3l+rb0XTmxzX9hLeDxy5Wg5qCiOTB+9S5GRX1IMFLvBQejaWg6
         uaGraXOEDnjS2zz8N5UqTdU0KzHpBY85T4w/9gkY5AVnFF0jwOeRt4uTHQiIKT6HNe0C
         9XHFrZgHxj/RWOX1E4F5uffev8YFlIAhPhNKxB6Vn3/4r63axe4FCxSl+cmglXMGkLaw
         A0GWWUqt906VwxakQT0/LfzlVXnsbqn7Nv2Ewib1WAczzJHUM/iQeG/pT8uBaBHiYPNw
         fTug==
X-Forwarded-Encrypted: i=1; AJvYcCVNWqK8jz5NiZnqpEER82hcFDn7g2UQ2ObEYbpXAPodBmBc3mooS5FLwHf7Ch2wMaVFwSbnlhbgn6qcW8BQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxvRTFYWlsrkjtOgFELUYilfIJZDk1VcZez+6Zl1NA3pdhONv
	8m+owG7q43bJTaLd8Gh6iW5IBMKvLJ3tBkyiIcRgXYn62F/SkOK1UyvhcUvrYE/Iwag=
X-Gm-Gg: ASbGncuZdvOI8dDduAJX3v3ImUShoW2nWTB8liXRPiyBpT64aq4nK8NH2V3tkUzc0Ak
	KCks5TgZ975QVymwy0NcKuxy1ATnbMa3tKJrrp8NLrK7gwVLIsbQT/iT+1m+f3l6gqmMp3GfcbF
	VWnCXrbGR7Fp0E7afym1BXDL9f/DAoB1WGzovneQa4gDhRjziCJidylo5qAr6WKhmittw15fMeC
	sc1lbMVXcc26iY96CA2SxnVHF94xa0O7cX5I5p9G9I7NQBsaaxQ/HcD7it9N7Tbc2ZGA3cbndUt
	nQkUPcMiUeJMDcoRJtUXRq6ASZ77F/5LEJpJcfKKIX3h9jKBOCvNrmZChAyN0fujsgZ4J8602pU
	qk7Ej19fOu0m0d3fKWHTgRDDvUrz7Ug==
X-Google-Smtp-Source: AGHT+IEosZgeKp1ejcWL+SBts1B/aCmksQ8kDwupILaEdVqhNGaIFVMrjj1IxUFnhsLruybLH3boPw==
X-Received: by 2002:a17:906:298c:b0:af9:68d5:118d with SMTP id a640c23a62f3a-af968d534d9mr304131066b.58.1754310560610;
        Mon, 04 Aug 2025 05:29:20 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a38aasm730599066b.37.2025.08.04.05.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 05:29:20 -0700 (PDT)
Message-ID: <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
Date: Mon, 4 Aug 2025 15:29:18 +0300
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
 jonechou@google.com, tudor.ambarus@linaro.org
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-23-eugen.hristev@linaro.org>
 <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
 <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
 <aJCRgXYIjbJ01RsK@tiehlicka>
 <e2c031e8-43bd-41e5-9074-c8b1f89e04e6@linaro.org>
 <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/4/25 15:18, David Hildenbrand wrote:
> On 04.08.25 13:06, Eugen Hristev wrote:
>>
>>
>> On 8/4/25 13:54, Michal Hocko wrote:
>>> On Wed 30-07-25 16:04:28, David Hildenbrand wrote:
>>>> On 30.07.25 15:57, Eugen Hristev wrote:
>>> [...]
>>>>> Yes, registering after is also an option. Initially this is how I
>>>>> designed the kmemdump API, I also had in mind to add a flag, but, after
>>>>> discussing with Thomas Gleixner, he came up with the macro wrapper idea
>>>>> here:
>>>>> https://lore.kernel.org/lkml/87ikkzpcup.ffs@tglx/
>>>>> Do you think we can continue that discussion , or maybe start it here ?
>>>>
>>>> Yeah, I don't like that, but I can see how we ended up here.
>>>>
>>>> I also don't quite like the idea that we must encode here what to include in
>>>> a dump and what not ...
>>>>
>>>> For the vmcore we construct it at runtime in crash_save_vmcoreinfo_init(),
>>>> where we e.g., have
>>>>
>>>> VMCOREINFO_STRUCT_SIZE(pglist_data);
>>>>
>>>> Could we similar have some place where we construct what to dump similarly,
>>>> just not using the current values, but the memory ranges?
>>>
>>> All those symbols are part of kallsyms, right? Can we just use kallsyms
>>> infrastructure and a list of symbols to get what we need from there?
>>>
>>> In other words the list of symbols to be completely external to the code
>>> that is defining them?
>>
>> Some static symbols are indeed part of kallsyms. But some symbols are
>> not exported, for example patch 20/29, where printk related symbols are
>> not to be exported. Another example is with static variables, like in
>> patch 17/29 , not exported as symbols, but required for the dump.
>> Dynamic memory regions are not have to also be considered, have a look
>> for example at patch 23/29 , where dynamically allocated memory needs to
>> be registered.
>>
>> Do you think that I should move all kallsyms related symbols annotation
>> into a separate place and keep it for the static/dynamic regions in place ?
> 
> If you want to use a symbol from kmemdump, then make that symbol 
> available to kmemdump.

That's what I am doing, registering symbols with kmemdump.
Maybe I do not understand what you mean, do you have any suggestion for
the static variables case (symbols not exported) ?

> 
> IOW, if we were to rip out kmemdump tomorrow, we wouldn't have to touch 
> any non-kmemdump-specific files.
> 


