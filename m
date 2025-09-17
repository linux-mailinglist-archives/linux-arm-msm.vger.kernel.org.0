Return-Path: <linux-arm-msm+bounces-73958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 713FDB8033E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D31FD7A4B2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4672A2EB869;
	Wed, 17 Sep 2025 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cuge4Jht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3462D877E
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120411; cv=none; b=YQ1R76bRP7YbrZF4dh4aMKrmOMEoCL0yQwEglbUxygUKqdEnt+v6VAj/yEaGOR/aeMYsKTVbm+grOzrtjuw8sQDvNce7NvZ8u8BjO2uWH5pcxTo7IGCDu7OkkQlr82j/EI6neFVyByYg9DrdbN74n2CxCeKZ2MFzgnXFLy8o8AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120411; c=relaxed/simple;
	bh=2lwqeabpS4Qb/h6rApISah5NsygIIWv9QS8376+S61s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=daIovojI/HSXuZa9dSiPzevLYROiatWqC+3uR33MoKo3e3QPNtg6biCGgXGaPvb0Z9ts9tM7OIQ9EbfNO8Nu74L4LWXsYoV5pPIOnj8EWitym480W2MrBNwv2RE4tYxeSzEpQFEiTX5/PBEScMtAWIWwn9PHoEMzUlVwgFZx2YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cuge4Jht; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758120408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ovZ8mJqkmoqvvz8O8MVpBxVpu4t3oTHY8vOE+XFxYc0=;
	b=Cuge4JhtO1yMWelYdt+JfqTqQcSpd0gMcxkhFRO2hm1DRasUVL/OET1QIu8ncbRtKWnjz5
	nBWrzMIt1kt6tOWZD8pr5M2JPp4LHOt4wgZFEqT4hKsECb4ClawkyfiLQz1DsZPxiCkcFE
	EF/ZqVvR8JncI4HjdxbF2PQai+BB6rc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-TQ4Zsk1dP-ePUXioH_71VA-1; Wed, 17 Sep 2025 10:46:47 -0400
X-MC-Unique: TQ4Zsk1dP-ePUXioH_71VA-1
X-Mimecast-MFC-AGG-ID: TQ4Zsk1dP-ePUXioH_71VA_1758120406
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45b990eb77cso8086505e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 07:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758120406; x=1758725206;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovZ8mJqkmoqvvz8O8MVpBxVpu4t3oTHY8vOE+XFxYc0=;
        b=t/hmj9TURGGAu+MJGYea18b07nuwFV3bJBnBkn+hGch9ZAgq1CQMDntHfOTDB5FI+Q
         cYlZ40fEWkpm2oRDjXvZhxK9P40/bakJjVO8ZHevs0bt95z+wLCyo4yGY/xjj6fhEge6
         7xwzlx0YO65t1r/WwvPjZWrqmF6HTq+ByMIB0f76Fp3H7FSiIsqcJdbExth9o9XXgHPZ
         iN52LvR2ctLRh9FBIXAJ9TtP+ijqnO2W16bapHpdQhkn6SzayGul0kiD7agtIENi8by9
         A+beSV5vsdM1upoCGTJ2mU6vWrlzjVZ/v60h3FitHAS4LCh0imZcqTUhH+ZTajYHF0VS
         FC8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCyKtkRJQxwpfvCz/zwj6C7L9NhSa/DPrsNDPsw15FZGFxVUKgDvqL6MqKiVFUs2nf01g0GzD9yIHgD4Ws@vger.kernel.org
X-Gm-Message-State: AOJu0YwzX3KM2/H5reEMycQW66FXxwAdUYwat4jy70c/bWUGl6zWtIfM
	Ng4hJwDCPwwkA5tZeWoiT0BLwwn8ojUWHOrMjiYfNETBFL5xPgkDwLJbPldIiFXxn0k3HEJFo5b
	cwzkJ26W3lbBHnmIcPsnNu1fUCghc9jbeAPrgthKvb7Qj+D4FwQ5oqe6P+wtih1E/blw=
X-Gm-Gg: ASbGnctMrYquO9JLhgyUncJa+RCGFoE4d6E6IwUVfGu/gyX5hLzJLL1zRxkbzLjD9n6
	Gi+kV9855ZnM7ziQgCY1elv0pOxf2uJvwER6EdpMOImiOgPCOLH/hG5QUPQAQgCVbZUPJPCBJvp
	+sh1cMaU9Ba2YhSyWl0q7r0XxranHtVT1RQrZJI6RBH9c9HBuegLrMbEMlWn4w0C+F+6V4lN6f0
	uiaqGGGPspGZIHfIVNXVAu8gHpeHSVNjQed7+al1s9BIKkpD0sFEV1Kvge1jRSG12h1dCsylPfz
	0iE+hmM+nZWbD21xInH9FegstqTAHrPUTeIGO3jpTi+zO4fbSfW4+tRqU91CTPOdSRVdQ35ECO5
	+k0Q4DPG63dVphrMZmIW2JLdVBrHuJ0IZs7a0Kz9mAroWYS/RpTd4v6tnpl9Q3M0q
X-Received: by 2002:a05:600c:4888:b0:459:d577:bd24 with SMTP id 5b1f17b1804b1-45f32d0869fmr46709625e9.7.1758120405801;
        Wed, 17 Sep 2025 07:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/Ufl1M6AshTZE+vFOVXEwIa1YoUqQ1InS/YuHHadh0wrsGDimF+1HMnmk4PGp9MwHqliWqQ==
X-Received: by 2002:a05:600c:4888:b0:459:d577:bd24 with SMTP id 5b1f17b1804b1-45f32d0869fmr46709295e9.7.1758120405326;
        Wed, 17 Sep 2025 07:46:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f325a32f6sm40132415e9.2.2025.09.17.07.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 07:46:44 -0700 (PDT)
Message-ID: <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
Date: Wed, 17 Sep 2025 16:46:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Thomas Gleixner <tglx@linutronix.de>,
 Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com> <87v7lh891c.ffs@tglx>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <87v7lh891c.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.09.25 16:10, Thomas Gleixner wrote:
> On Wed, Sep 17 2025 at 09:16, David Hildenbrand wrote:
>> On 17.09.25 07:43, Eugen Hristev wrote:
>>> On 9/17/25 00:16, Thomas Gleixner wrote:
>>>> I pointed you to a solution for that and just because David does not
>>>> like it means that it's acceptable to fiddle in subsystems and expose
>>>> their carefully localized variables.
>>
>> It would have been great if we could have had that discussion in the
>> previous thread.
> 
> Sorry. I was busy with other stuff and did not pay attention to that
> discussion.

I understand, I'm busy with too much stuff such that sometimes it might 
be good to interrupt me earlier: "David, nooo, you're all wrong"

> 
>> Some other subsystem wants to have access to this information. I agree
>> that exposing these variables as r/w globally is not ideal.
> 
> It's a nono in this case. We had bugs (long ago) where people fiddled
> with this stuff (I assume accidentally for my mental sanity sake) and
> caused really nasty to debug issues. C is a horrible language to
> encapsulate stuff properly as we all know.

Yeah, there is this ACCESS_PRIVATE stuff but it only works with structs 
and relies on sparse IIRC.

> 
>> I raised the alternative of exposing areas or other information through
>> simple helper functions that kmemdump can just use to compose whatever
>> it needs to compose.
>>
>> Do we really need that .section thingy?
> 
> The section thing is simple and straight forward as it just puts the
> annotated stuff into the section along with size and id and I definitely
> find that more palatable, than sprinkling random functions all over the
> place to register stuff.
> 
> Sure, you can achieve the same thing with an accessor function. In case
> of nr_irqs there is already one: irq_get_nr_irqs(), but for places which

Right, the challenge really is that we want the memory range covered by 
that address, otherwise it would be easy.

> do not expose the information already for real functional reasons adding
> such helpers just for this coredump muck is really worse than having a
> clearly descriptive and obvious annotation which results in the section
> build.

Yeah, I'm mostly unhappy about the "#include <linux/kmemdump.h>" stuff.

Guess it would all feel less "kmemdump" specific if we would just have a 
generic way to tag/describe certain physical memory areas and kmemdump 
would simply make use of that.

For example, wondering if it could come in handy to have an ordinary 
vmcoreinfo header contain this information as well?

Case in point, right now we do in crash_save_vmcoreinfo_init()

	VMCOREINFO_SYMBOL_ARRAY(mem_section);
	VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
	VMCOREINFO_STRUCT_SIZE(mem_section);

And in kmemdump code we do

	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_mem_section,
			     (void *)&mem_section, sizeof(mem_section));

I guess both cases actually describe roughly the same information: An 
area with a given name.

Note 1: Wondering if sizeof(mem_section) is actually correct in the 
kmemdump case

Note 2: Wondering if kmemdump would also want the struct size, not just 
the area length.

(memblock alloc wrappers are a separate discussion)

> 
> The charm of sections is that they don't neither extra code nor stubs or
> ifdeffery when a certain subsystem is disabled and therefore no
> information available.

Extra code is a very good point.

> 
> I'm not insisting on sections, but having a table of 2k instead of
> hundred functions, stubs and whatever is definitely a win to me.

So far it looks like it's not that many, but of course, the question 
would be how it evolves.

-- 
Cheers

David / dhildenb


