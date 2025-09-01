Return-Path: <linux-arm-msm+bounces-71391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E92B3DF6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 12:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F9F81881974
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 10:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F802309DB1;
	Mon,  1 Sep 2025 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CQix3hq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D9E2FB986
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720926; cv=none; b=VsD/pEq6kjPYRcvVIZC06O+7r++h8aF/8y8uMCzvQleeDB387g6cPH3IDq9boUkQTL7uUsdi6jJx6PYUuzj1Yk3w4MEufWf8FO/q7Vp10XxXuhbQCGLOAvPRxPzhGR4iLntKcwLdocnFO3uyk/2oiwFVe7l1cYVyaNrjQgBk8JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720926; c=relaxed/simple;
	bh=ypTD0sEZG5IOONmhSh4yZK8w8GcKNQIdnI9zf9EhGuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZf+1j14hKCRyyBJ6aGqZ529BkCJrLHyhSTh0Wj+rPowS8b0Rg4sL9kpZmueERs5wJPc8y92ajpzAFJhBY3UyO9NuHMVr43sr+Zv+nv8U427i+KNjGPOlaetcvdYROAm8Dy+0iyeO1jeixJ+KGoPHKTTTDnnyvPiInM493+4/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CQix3hq0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756720923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+lQeSnVszPSSY9ZXSFHEL5gERJYR6xjSMj4HUufxrw4=;
	b=CQix3hq00bRBN/IAtV2Cr9gNpZENe+1tROP+kSGL58N0dnlhFsldM187IW0CtjcPWtx1Vg
	PSnbTzJY4ClUpo6rOT298GBiBNxn6jKvcrxSDwmAcCEN580wH0S9i35dWGfBX2q5FL6Iib
	pPI4v+7/tL5l2fBHBiYRjNzS2/9NFNs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-cYMa36RKNIWJXEJNDx9NLw-1; Mon, 01 Sep 2025 06:02:02 -0400
X-MC-Unique: cYMa36RKNIWJXEJNDx9NLw-1
X-Mimecast-MFC-AGG-ID: cYMa36RKNIWJXEJNDx9NLw_1756720921
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3d160b611fdso1260703f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 03:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720921; x=1757325721;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lQeSnVszPSSY9ZXSFHEL5gERJYR6xjSMj4HUufxrw4=;
        b=EIh5+s6Yffuoi9Z2CD0/8++N8JiTHGH+qgCFMjo7+pP+z5v09eN/3mc7RofwTzibtz
         BY0B4QgcBiI2++56DZLWrWkbV8vmpsX84R1wnZ9T4SN9Ie/R5adRRYLLCANE4OOuk1Kn
         45Oza4n6RF0aOvNW1VHosTGbbGRPySxYIq+xN9Y4aj7kxMGyWuaQIeVtBrs/XedeRIii
         1SQTtoMGog7ZjDVaX9bddb82UzX67pmxpHhRM+/PMrZ/hIUzQcg/3s7qNXv50NhUaqL7
         VATw2CeQzcjJF05TMFlB0/bRWg5TizTrzAyk0TPyGdFshRsV5sUUqa76CYqHlvfC//Mr
         WEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWotQ4JWLgw5Hm7FtXfbX9z+e692cxxclwtnJvXgKpBL9VxwrwyO3J8PEEIjT+kzX2gBEcZW8uPuh1DHgPb@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzlkW5wxzVvbDid0Z+dgzOI/3Rz8TCpZYRVzG0o9Yay6kosAe
	QSNli3ZZLciQAdmoA3rQ9qMiA78VWyUQYpDfXMV+JWrpmzepd9PnxJMlsO+iDotae4I2cU6uUxU
	Sf2ln3h8CkC043kE52bq107cxxgim63fHqnVJ4kBRveqH86+TPfHmQCifBju3J1ssXvw=
X-Gm-Gg: ASbGnctt1njIpJFM7sHdQLRNgULVp3eh8IF4yeM4h9Tjvf1BoLk7AQKYKix/4BC0dNe
	LfHWZj2fBXzXaGO52RHTzZ1sH3zLyisFnQAKIiX5pBW6fPOSfOfKJ3COiGnEEpSQ2QthhcD2gJl
	E9wjg4H16K0cHw+x9TRoZ/hripE93TBSy/1YN+yYtUGI0VARt20Ivl2vYsZAiTdnUoyEALDjvuK
	YXuGDBOFtaKsH/AFK7rwIMsGF3oDFNzzO5/+SL9sPHOwycbqC28v5tbkJCnLznwWxL9qi2Bfa/t
	ycwRzMlb08PqPSZ4SseSHJQ6RP1hWbX52ySfiFlzgrvG7IO3XdcWeh0a/JJu+XezJINIpOvSsa5
	m5jhppUPODBOdjscTIgNoS0Vam20TPOEPg6s5RyHjivMIQJU5LAXMQV0ZFscQS+GDyNU=
X-Received: by 2002:a5d:64cd:0:b0:3d1:abf7:e1c8 with SMTP id ffacd0b85a97d-3d1d98d60e1mr4874719f8f.0.1756720920946;
        Mon, 01 Sep 2025 03:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvPsDFpHZYqBUf8mT2gRUFJpfAuTdUtgOPMP4pMlCUZ06zRhnpYdXw7CHR6fjLFikWold/+w==
X-Received: by 2002:a5d:64cd:0:b0:3d1:abf7:e1c8 with SMTP id ffacd0b85a97d-3d1d98d60e1mr4874687f8f.0.1756720920452;
        Mon, 01 Sep 2025 03:02:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf275d2717sm14699314f8f.15.2025.09.01.03.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 03:01:59 -0700 (PDT)
Message-ID: <7e1f4f64-dfc4-4366-8e01-0891b2d4d2b4@redhat.com>
Date: Mon, 1 Sep 2025 12:01:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
 <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
 <aJCRgXYIjbJ01RsK@tiehlicka>
 <e2c031e8-43bd-41e5-9074-c8b1f89e04e6@linaro.org>
 <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
 <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
 <77d17dbf-1609-41b1-9244-488d2ce75b33@redhat.com>
 <ecd33fa3-8362-48f0-b3c2-d1a11d8b02e3@linaro.org>
 <9f13df6f-3b76-4d02-aa74-40b913f37a8a@redhat.com>
 <64a93c4a-5619-4208-9e9f-83848206d42b@linaro.org>
 <f1f290fc-b2f0-483b-96d5-5995362e5a8b@redhat.com>
 <01c67173-818c-48cf-8515-060751074c37@linaro.org>
 <aab5e2af-04d6-485f-bf81-557583f2ae4b@redhat.com>
 <1b52419c-101b-487e-a961-97bd405c5c33@linaro.org>
 <99d2cc96-03ea-4026-883e-1ee083a96c39@redhat.com>
 <98afe1bd-99d2-4b5d-866a-e9541390fab4@linaro.org>
 <c59f2528-31b0-4b9d-8d20-f204a0600ff6@redhat.com>
 <40e802eb-3764-47af-8b4f-9f7c8b5b60c1@linaro.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <40e802eb-3764-47af-8b4f-9f7c8b5b60c1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> What do you think ?
>>
>> Looks a bit over-engineered, and will require us to import a header
>> (likely kmemdump.h) in these files, which I don't really enjoy.
>>
>> I would start simple, without any such macro-magic. It's a very simple
>> function after all, and likely you won't end up having many of these?
>>
> 
> Thanks David, I will do it as you suggested and see what comes out of it.
> 
> I have one side question you might know much better to answer:
> As we have a start and a size for each region, this start is a virtual
> address. The firmware/coprocessor that reads the memory and dumps it,
> requires physical addresses.

Right. I was asking myself the same question while reviewing: should we 
directly export physical ranges here instead of virtual ones. I guess 
virtual ones is ok.

What do you suggest to use to retrieve that
> address ? virt_to_phys might be problematic, __pa or __pa_symbol? or
> better lm_alias ?

All areas should either come from memblock or be global variables, right?

IIRC, virt_to_phys() should work for these. Did you run into any 
problems with them or why do you think virt_to_phys could be problematic?

-- 
Cheers

David / dhildenb


