Return-Path: <linux-arm-msm+bounces-73867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD7B7C9E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCBA7171787
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24BE29C32F;
	Wed, 17 Sep 2025 07:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RwfhhQZ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0878326059D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093396; cv=none; b=Sge+94GuYLfj4RBcMvsqwtixyCDmaPQ5OggUtqfLKWcRvooCvlyMISpzZdxafoHc+lum6KAmEz1txySkVRvqS9/5oEV+7LQKRzqvu18ZxVqJCPWYoJJV2fHXJHcNYM5c2szl6zsvB2hUfQmeqk3zYqm4v5p2mZF6bBYspXg2+MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093396; c=relaxed/simple;
	bh=T5zrGXefk5YqzH+xL7lyiCx6Qqp0h29OwnsxViUW03c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T65u5A7QEQk6G6svNpaaF7ti0/sYSwKrfdkoivwsQlNBBOerVuZcIi2w2TbpxUbf7OCthR1/zIB9xOFNl4vUT9ggCKo+bVTUYz1YLz+VgzIs1cB1lxLFrGCWjxK/v5WNMn+F2c9TspCsgAPpRy1j9d5l/eIV8mz7AyQPGH1Aqbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RwfhhQZ0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758093394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dVrVz1y1JTYA35iR89KO57gWYWUGvkIopfwpVXaBh+A=;
	b=RwfhhQZ0nGYUBf/zLChUZ31fGuBHJ8Z4MVzNZGayr5OdngOfmrPQEwVB91dDc4NEjKHKB/
	KOf6SCCd5HC/tVsgEKmEsU7Pjz42Sd+nmD8OsH34aEfwgeqN9rnHj0suwvydz/5jUvv0Zm
	LISK7ZgwZ6hx1oK+mNnZwUYilPrqpJs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-X1rDn9phMTGEzUucmpPN6A-1; Wed, 17 Sep 2025 03:16:32 -0400
X-MC-Unique: X1rDn9phMTGEzUucmpPN6A-1
X-Mimecast-MFC-AGG-ID: X1rDn9phMTGEzUucmpPN6A_1758093391
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3eaed4aea75so2251575f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 00:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758093391; x=1758698191;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVrVz1y1JTYA35iR89KO57gWYWUGvkIopfwpVXaBh+A=;
        b=VEEDd5xiwuBFcI3GpWQgzhz+InVj1lc5D1qmi/JScgriAuTg9lr/MShnMJ4ITIHWw8
         5TdKq/VBAwrjuSwYym7dEhVNVnoRMOQcDsGfxSm+jp0Hvr6LHbAnSv/eG0WvLDvkrgiW
         U78UdjzH0HkrCwssz44rvd6SpGguqBY3rN2RGL7iJHI6Hz8Qdrh3g5cz39X1OREMbMcO
         IJsxlGrmos6a+FyFkiiBeb8kyy4aPnffqMPdM8drzO863jscbiTP/g2iK3XjDIx6eQmf
         wQYlrlD8ZT6DXiQ2xNqpp0Z7sgzb6mdyJQRwbt+5fu1bIWxcCnY7XOdMnwKSZ7SZxy9a
         1jQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjXku6dyQoyOHQXDEPL58eVJZrNWn4739Zx11mVIBExwPGzu/TuaDUwh3yw87DvLzz5U5yh5H59sdRTaEE@vger.kernel.org
X-Gm-Message-State: AOJu0YwrjCy9pbMMaZ9L98NrMs4/cUsJCbZI+ggXr+c/M6juND8OE2+k
	PDcWPZQgEkIimTkVhTzLz8WlF8VgZaTf8hPAzOFmgxCpzRfuyi3SNGGItHIV5NAlJwUJN45RU7J
	s0mZ7Uj+zDMVjJbCo2DvXsRkS89G+kion5EStC1oC5KirCGCGLyo0kBpfGH1ZOG437Zg=
X-Gm-Gg: ASbGncu1K3eo7dds6WAcKXQypweMwvAHEWa2rsApa7Ot18Qp0xL2KaYbOjnRoYrfWax
	9cGwc7ZEIv2K2APPnhCoRWQoUQG1LMhP39O7lJB9Afc9CokaJh3B4jilD+LTuTOWx5vVwnGSlQe
	dykg/eW5KMefu0iQm/JETaG0qcp7KwJxpylU9eqdVvFF+HZgN5ZfAAn5O7SpGrBotcHEk4AKVx9
	1IH2rKnODM5zvf/YZiNZUR74sb9nwOxU/MhbLGieY4vnRmpiTGqI1MqMq9//7CTNFyFMbhsAL9Z
	q10qu/UI3DlHUV+z7BiPWWQMtF/TUhrsKdwfMxi4TGwJ6uYPzTBcDBvNDxa2SeB1rzkWw3+8usC
	aMJkYunwshFq1j4Q/jKby1feyoCwKSN9GIluxP+Q7l1yW2vl5FF8RVuIX51047xtw
X-Received: by 2002:a05:6000:24c5:b0:3e8:b4cb:c3a0 with SMTP id ffacd0b85a97d-3ecdf9afe4amr737088f8f.8.1758093391105;
        Wed, 17 Sep 2025 00:16:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6KvkUbAw/hWHVpyZFeQHd7+eZojTjephumHug7ngWtVuZzWRraD7sIx3LIE+G0iYk+zOhBg==
X-Received: by 2002:a05:6000:24c5:b0:3e8:b4cb:c3a0 with SMTP id ffacd0b85a97d-3ecdf9afe4amr737058f8f.8.1758093390674;
        Wed, 17 Sep 2025 00:16:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139122a8fsm23710285e9.7.2025.09.17.00.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 00:16:30 -0700 (PDT)
Message-ID: <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com>
Date: Wed, 17 Sep 2025 09:16:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Eugen Hristev <eugen.hristev@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.09.25 07:43, Eugen Hristev wrote:
> 
> 
> On 9/17/25 00:16, Thomas Gleixner wrote:
>> On Tue, Sep 16 2025 at 23:10, Thomas Gleixner wrote:
>>> On Fri, Sep 12 2025 at 18:08, Eugen Hristev wrote:
>>>> nr_irqs is required for debugging the kernel, and needs to be
>>>> accessible for kmemdump into vmcoreinfo.
>>>
>>> That's a patently bad idea.
>>>
>>> Care to grep how many instances of 'nr_irqs' variables are in the
>>> kernel?
>>>
>>> That name is way too generic to be made global.
>>
>> Aside of that there is _ZERO_ justification to expose variables globaly,
>> which have been made file local with a lot of effort in the past.
>>
>> I pointed you to a solution for that and just because David does not
>> like it means that it's acceptable to fiddle in subsystems and expose
>> their carefully localized variables.

It would have been great if we could have had that discussion in the 
previous thread.

I didn't like what I saw in v2. In particular, having subsystems fiddle 
with kmemdump specifics.

I prefer if we can find a way to not have subsystems to that.

>>
> 
> I agree. I explained the solution to David. He wanted to un-static
> everything. I disagreed.

Some other subsystem wants to have access to this information. I agree 
that exposing these variables as r/w globally is not ideal.

I raised the alternative of exposing areas or other information through 
simple helper functions that kmemdump can just use to compose whatever 
it needs to compose.

Do we really need that .section thingy?

-- 
Cheers

David / dhildenb


