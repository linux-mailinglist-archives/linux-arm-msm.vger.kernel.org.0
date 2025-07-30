Return-Path: <linux-arm-msm+bounces-67165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7BBB16232
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 16:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35F50188C0E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A1C2D978A;
	Wed, 30 Jul 2025 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GP0fX2fT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A092D94AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 14:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753884267; cv=none; b=rWZJZ438neQj0UYzKWSfyMXl3OO32/Tx+5VfrgvLgV2fbONJNQAscFnsmft4pyO2Css7hUouFq7dYQQVEM6re+H0H60p2ZjppL8NJtSXFZ7z04+IxkNKHPzLAYbwycvkGt8tn6eEbcmyEOXCpcqlq6ijCMT+zl176ZgO5t6Yk9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753884267; c=relaxed/simple;
	bh=nZU05SYgwuxz9tXqf+2n4kG2ZxRFgsh3LY/Vsv1Amyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/SzsjA3wlMDe51PfdAN1Fnjd1TbtxsfDxmUsEcgY2pcpQ3hEhFilPmEUm1xzAf2nCbYzploqaiKmcM2G4rem2sMbL8ilmUpxfRntWmcNNoOHQjbHk+fxImOpzFM+jy7Zipqnr/crDuwBkyW/PUCqS6aDFQtSpfaPP4kQ8QGDO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GP0fX2fT; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso66528005e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753884264; x=1754489064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jk6Gtn926lXsIj4x4Dh1A7mGQexyVuqQFAqQu1Vz/9Y=;
        b=GP0fX2fThCo+QUvvVO00lJN+qe8vl5TFgrK3Xpk8vqL+HVZmw9sa0mofHBToGJwgjG
         bdkseuVtRNtOOIt/sEG2U+sFFFz2v4K8RIevJvOBZ2Eq8ivawkjruCwlAMJQ/EeRvmG+
         9IpmRlM0qsUlheO7CsEy47dri87oHrHZtiEwnl+uYMAFT44GzICOWXwC799VBYgYf3NU
         roL9RYmN3xcScWFf2t5TEaZl8nwI3jIOKmC2cDBHii7u+1j8ZXa+31X6LmAZGkRIP083
         VKJBp3dbhvXX8Dcnh5xYCCqeLE4rIMpBaUSOhM88NwIIEGIFc8Q729FI9CiCzbR5wfEn
         eN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753884264; x=1754489064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jk6Gtn926lXsIj4x4Dh1A7mGQexyVuqQFAqQu1Vz/9Y=;
        b=pyGZskqhOtvZEZtGqAynZEpe5GEQEWDVGrGWzptwqFeZZfmaIIwtWHdvJ2IcTDH2x2
         SVkbdsf1WzzM2nJXCVKuIv3hrAvq1KJKXYDvCrPFwSR3INlMPIpuOn8OUFeyawtiJs6p
         uo/sK3FhI6EfcF8yun9e1dLwaSSGcolyGbATYKfR43Yb8QlcYN7e+bp1iHhYbY7Or8gT
         PPnSWa0qWoDBf5K6hTrpPiLJcf3HASRI2921QD4CgXezqa7493mHNHYIaKlSxbK/MW36
         avqw73vzkCPRRnOJ1CjCTRzZEq+EC2olud9gZ/O5q2mJ1ZzL5bwVyNSNekCXso/MFny6
         +5og==
X-Forwarded-Encrypted: i=1; AJvYcCUxLYfFOt/9lJ7hiVWVV3oIYdD69BE/j6U6j+MBBDUCnphSKUxJthzJgqDD0AxcZUqGjWxSiiVUxkrQRpnp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfesn2TKFhzpF9w0nNnMfU8X854fWsiAQCs370CIGn5a46JpT2
	aVkrNJDY14dX+7CHjCNM0ncKUR97PU/PCSc9SVcJr3jmfheciqlDYGYl+QPlCEKwlec=
X-Gm-Gg: ASbGncsZwiMEl9TKuQYEVcaYb9TezFg51jjJWvBD669+wc+UYtMFhx+7quRvPpEN+PK
	4IXa44ptZ8klGhtB1W58tFh0NiIImtJ3WpKa6CAq+ExNeMdb4TPf31utYQJTKon8oQRvYn3Uj+B
	koaLe7qP64ab2lfjHPF6/QEqSPPNOisUfzvnVguXmSBGgDai+FppnjLu8Kc0UdpEX4dRXk9VT2h
	cyAC85kJhKM72lAzDf2pa+e3RNOjNOGCDzHbKDFdb93Lv1Mi7f4sOkRVQUkJXf2Z2NblE5IVQw3
	Q9GgVgZelmx5ZYRVQl6o5WCByTCDeeaDdmRO8JkYfrGMzingqM0VFTB2qxO5h6pDsajs+HxLcz2
	A7TPaTVNDNFle5Yn2qXPw0MRFc7CnyzFMsGzlNDAO
X-Google-Smtp-Source: AGHT+IHNA6XybUky+XOgMeIdLaBli11kALj6z7ErPNCO0GKInoPJQDHw2ePlzrIieSLuzlwB0GbSLA==
X-Received: by 2002:a05:600c:630f:b0:456:18ca:68fd with SMTP id 5b1f17b1804b1-45898a828a3mr27912095e9.10.1753884263659;
        Wed, 30 Jul 2025 07:04:23 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b788f5f255sm10023729f8f.13.2025.07.30.07.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 07:04:23 -0700 (PDT)
Message-ID: <9843578b-2adb-4f6f-b3c1-99dac003e2bf@linaro.org>
Date: Wed, 30 Jul 2025 17:04:22 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 16/29] mm/show_mem: Annotate static information
 into Kmemdump
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-17-eugen.hristev@linaro.org>
 <7ecaae9e-a088-4c1b-9caf-6a006a756544@redhat.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <7ecaae9e-a088-4c1b-9caf-6a006a756544@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/30/25 16:55, David Hildenbrand wrote:
> On 24.07.25 15:54, Eugen Hristev wrote:
>> Annotate vital static information into kmemdump:
>>   - _totalram_pages
>>
>> Information on these variables is stored into dedicated kmemdump section.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>> ---
>>   mm/show_mem.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/mm/show_mem.c b/mm/show_mem.c
>> index 41999e94a56d..93a5dc041ae1 100644
>> --- a/mm/show_mem.c
>> +++ b/mm/show_mem.c
>> @@ -14,12 +14,14 @@
>>   #include <linux/mmzone.h>
>>   #include <linux/swap.h>
>>   #include <linux/vmstat.h>
>> +#include <linux/kmemdump.h>
>>   
>>   #include "internal.h"
>>   #include "swap.h"
>>   
>>   atomic_long_t _totalram_pages __read_mostly;
>>   EXPORT_SYMBOL(_totalram_pages);
>> +KMEMDUMP_VAR_CORE(_totalram_pages, sizeof(_totalram_pages));
> 
> Tagging these variables that way is really rather ... controversial.
> 
> As these are exported globals, isn't there a way to have a list of what 
> to include and what not somewhere else?
> 
> Not sure if any of that would win a beauty price, though.
> 

Annotating the variable was suggested here :

https://lore.kernel.org/lkml/87h61wn2qq.ffs@tglx/

It does not win a beauty prize but it's simple and efficient at least.
Do you think it would be better to gather all the annotations for the
globals in a single place ?

Eugen

