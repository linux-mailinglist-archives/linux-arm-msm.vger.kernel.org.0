Return-Path: <linux-arm-msm+bounces-67167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D5B16254
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 16:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A4855A5410
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86862D978D;
	Wed, 30 Jul 2025 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b5nMs5zt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BE82D979D
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753884617; cv=none; b=sHv7bOg5w+WiB6arVA/40Rs3xS8njC8tGkSpotBppuPTJ+5F2vrNTF9lYXhUj/c7um3PvOERZrEAOjI9gRbcwfVQeDoAWyfNAcaWT3kd8fQB0rzA/t+HJQ/zAwodHzNnQ0JxUY/6NhTBvWw2QV8JbxH7cPSyVnHjIah7fifpi2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753884617; c=relaxed/simple;
	bh=42kUdey4mT9C9FWiNo6iXn+UnwxJJeEsgThw4Lai60o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TaPAyPFteffBnrqPBi6kk/+xgRgd0VaekPerVMUI1suBHR2/z9vrZg3iBmGHljGVCyAX0t6RWWtSi8lIlw5PtRB7QJ00ARCb9bovgvWCnvz+1g7NnTK3jTDYL5YBx9D6OG3zxnZdeGLutXCPC+zD2DSoW4aeFyxmP7FJZpEyDek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b5nMs5zt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753884614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gnZ654VJktjY7DlJyw7K20uF9HlUxbvhJdrYHHl0LaA=;
	b=b5nMs5zt27oxg80sO/x1jJ7II4kJm/IdtwYJfhN1pPyblh6AVCbJeTYsA7xjMKYyYsq7BG
	DHuDFxoFB23QyvBVMNi57HTgNxdqUG9V3F1LZWBXKK81UbfTvttNQL13je5Hj5NSocWjma
	Dxkhvf4phruPI9gZY/Cz7GgwLmwg8zY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-XCf-HwtKN5aMqxw2rXLfIw-1; Wed, 30 Jul 2025 10:10:12 -0400
X-MC-Unique: XCf-HwtKN5aMqxw2rXLfIw-1
X-Mimecast-MFC-AGG-ID: XCf-HwtKN5aMqxw2rXLfIw_1753884612
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab969af6e3so84236241cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 07:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753884612; x=1754489412;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gnZ654VJktjY7DlJyw7K20uF9HlUxbvhJdrYHHl0LaA=;
        b=gRXcD3/rnbqzVz/ow5G/Xya5oLVH5UBlx5LkWJ4mZoVfR8QDy2EPPz1A/jZ3dp/CFb
         7zd9FVDt3USD4ywsAxDQXj/jAc4Tp6VIIsD+iJuGbn8U7jr4i6zcLgoiT9DYPgEYvZfd
         pb45gGBVMUpz8xr6XjGm3UF8UqhGDmNrQJ/UkBh750ppjPRH3EL38thMGPoI9HxonbG0
         pXhkszs60SylcRYCJQNjhELKjhp5GaUJUsxdBNNgP0+wLKOial2UPivDQiOC9IXsOEU3
         eFu+EHTB///9vSiW7wjg5szicHYnJHMEYnTsw3eFX+0M8LmKhlXxzKUkCTyQr5e1HfH3
         lKqg==
X-Forwarded-Encrypted: i=1; AJvYcCX4YJY665dydZzcuPIpKUBmR2Eh5qxivFiRqbhzg8w+wSrHMjYjQ54ppsCW+zMaecBMyezWDfK0KWhI2ct5@vger.kernel.org
X-Gm-Message-State: AOJu0YzEaRaY+Am6lrbR2SP/PSoN8gtDg5zF60PyOfzlmsmLVeOsXlrH
	utwxUt7Vk2SU8FEgrEr7rEQMK41sjiRb+LAGZwnlFHgKQWtUc1pcziXUKeQoXNKzfFMjxB85dti
	i2Q0ETHr27Bvm3BbrZEl8JAwU/EUy2fEC+CtwPRZ35AjZQr7u8dl60XnMnm43ekKj6os=
X-Gm-Gg: ASbGncvWJTszGqX2TuSVlGwr5QZ6ylpxd2jrEm+HtV5Y8B01Z1B0FRPpVNixL0E/Iix
	Xm81y0UpoRm7SNPor70kH6RDfi8Xi/4CRUx4Kw0IvvaTsP3Gh/IKWEnH7qq3OpqwvTuvWYmTx30
	85XhfDfp3y5xym/qnYZPbwWE9Rh/c9+7fuOuTAUi2rua5J6kbbO6GvVLgugrRpKzMt6LZg5I99Y
	ZLW3WQ0eVcPfhmaKffd1gtCVZwi6YtzImiMXnxdjTSIkp1lRdIA58SSyBKVnjoqCISUpUjMtUiH
	ovYU2XG4ls9n+tmfEWH7zmjRsyZNURZn9NGCucdoawG3Vg7bBFSBUBBscgXXiQ==
X-Received: by 2002:ac8:5856:0:b0:4ab:801d:90b8 with SMTP id d75a77b69052e-4aedbc3c248mr59348471cf.32.1753884611808;
        Wed, 30 Jul 2025 07:10:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRI0a4WBkLYn70H72HNhtziWoHC5rtdHpSwJbmWuGXwrUwXU1BeUaWjWUTF/B/xcEp5ALnHA==
X-Received: by 2002:ac8:5856:0:b0:4ab:801d:90b8 with SMTP id d75a77b69052e-4aedbc3c248mr59347531cf.32.1753884611189;
        Wed, 30 Jul 2025 07:10:11 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae99573cbesm67000691cf.30.2025.07.30.07.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 07:10:10 -0700 (PDT)
Message-ID: <72485de0-d05e-4421-9b47-3449778d278b@redhat.com>
Date: Wed, 30 Jul 2025 16:10:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 16/29] mm/show_mem: Annotate static information
 into Kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-17-eugen.hristev@linaro.org>
 <7ecaae9e-a088-4c1b-9caf-6a006a756544@redhat.com>
 <9843578b-2adb-4f6f-b3c1-99dac003e2bf@linaro.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <9843578b-2adb-4f6f-b3c1-99dac003e2bf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.07.25 16:04, Eugen Hristev wrote:
> 
> 
> On 7/30/25 16:55, David Hildenbrand wrote:
>> On 24.07.25 15:54, Eugen Hristev wrote:
>>> Annotate vital static information into kmemdump:
>>>    - _totalram_pages
>>>
>>> Information on these variables is stored into dedicated kmemdump section.
>>>
>>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>>> ---
>>>    mm/show_mem.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/mm/show_mem.c b/mm/show_mem.c
>>> index 41999e94a56d..93a5dc041ae1 100644
>>> --- a/mm/show_mem.c
>>> +++ b/mm/show_mem.c
>>> @@ -14,12 +14,14 @@
>>>    #include <linux/mmzone.h>
>>>    #include <linux/swap.h>
>>>    #include <linux/vmstat.h>
>>> +#include <linux/kmemdump.h>
>>>    
>>>    #include "internal.h"
>>>    #include "swap.h"
>>>    
>>>    atomic_long_t _totalram_pages __read_mostly;
>>>    EXPORT_SYMBOL(_totalram_pages);
>>> +KMEMDUMP_VAR_CORE(_totalram_pages, sizeof(_totalram_pages));
>>
>> Tagging these variables that way is really rather ... controversial.
>>
>> As these are exported globals, isn't there a way to have a list of what
>> to include and what not somewhere else?
>>
>> Not sure if any of that would win a beauty price, though.
>>
> 
> Annotating the variable was suggested here :
> 
> https://lore.kernel.org/lkml/87h61wn2qq.ffs@tglx/
> 
> It does not win a beauty prize but it's simple and efficient at least.
> Do you think it would be better to gather all the annotations for the
> globals in a single place ?

See my other mail regarding VMCOREINFO.

-- 
Cheers,

David / dhildenb


