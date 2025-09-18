Return-Path: <linux-arm-msm+bounces-74038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50918B83818
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 10:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF2BB189C6E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 08:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6198D2F291B;
	Thu, 18 Sep 2025 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3+bEKqPq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MqbntZVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5BE2EC0A5;
	Thu, 18 Sep 2025 08:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758183813; cv=none; b=CT/Y/ImyFHd9ZYCtu4qgw/MzJWL6F9nPMppkbPGJpV9TTjgwbf+oGBkfEYIlRboeHwzUZ8CUloBc24P11s2DphIjMYh9pwq7bKNqEojVMvadzclXDn11/lDmumpQ3MF/NtCfRc0sUcTiRgX8lR9uCdSB7Nzi9qmoRxWZ6SsuGnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758183813; c=relaxed/simple;
	bh=dPFZQ/J95tFGsWzkbIWX1hhJmkV3E3HPGj+Ah84D+lQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B5YBKUy7jfs36wOl1yE6OEhq4k1VeKAS+F8dEG2dzWpfrXjPsfzIJERWtUZWe359E9PNNX+QC1ZL/pgS44p8uulG5KE9qRGZdjZzNKHszqK5i0OvPfhyaNrIE2Z4lclj/czvbqLYr347x2DPOSAFAMMySeI717YAU0zrVPq8aVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3+bEKqPq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MqbntZVI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758183803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dhEheeaLjj12Q7mtWCuLhPIe+EYJsdjTeuBePvxpVHI=;
	b=3+bEKqPqOkUEh6yS9o4ChhOb1k52Ky5bVGvD9xyofVq2LCseV4zCUGvhpgXwjYxYsC5WQx
	yGf7WKJhXXYD0Ru9gsJ2HhWSCvTY8ZssNzpV3GhTySt+XxFzO6qDcVtS4jpjLDDB0sp2CG
	nZ7oWjZkVT/YcKju2TTXTEedsmjkptE8yCpJczw/jGJrnsU1+4R5P1g/EB6TKbndSV/0fJ
	UFMSz+q/92de2si2SyyiSBpZf4y843jj/KRsTtTztTQ8QK6WmaGWMuuZhfDfANJZPWZkYg
	VrBaCRba5VrbCfUUWBvx0YZ+UyvQoF7XZml/fh7TnM0nfgpAzfuBSlrL7Tr2HQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758183803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dhEheeaLjj12Q7mtWCuLhPIe+EYJsdjTeuBePvxpVHI=;
	b=MqbntZVIqi5UZvsyX/yRC/8YSYRz4x5RYd09EJQ+DsufyRhtx9gmkUl8tFF7x7EneRFTin
	SNeyNBFCRxEVhFAw==
To: David Hildenbrand <david@redhat.com>, Eugen Hristev
 <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
In-Reply-To: <f8d3c2d4-8399-4169-8527-3c87922f2ef1@redhat.com>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com> <87v7lh891c.ffs@tglx>
 <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
 <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
 <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com> <87segk9az5.ffs@tglx>
 <f8d3c2d4-8399-4169-8527-3c87922f2ef1@redhat.com>
Date: Thu, 18 Sep 2025 10:23:21 +0200
Message-ID: <87jz1w88zq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 17 2025 at 21:03, David Hildenbrand wrote:
>> As this is specific for the compiled kernel version you can define an
>> extensible struct format for the table.
>> 
>> struct inspect_entry {
>> 	unsigned long	properties;
>>          unsigned int	type;
>>          unsigned int	id;
>>          const char	name[$MAX_NAME_LEN];
>> 	unsigned long	address;
>>          unsigned long	length;
>>          ....
>> };
>> 
>> @type
>>         refers either to a table with type information, which describes
>>         the struct in some way or just generate a detached compile time
>>         description.
>> 
>> @id
>>         a unique id created at compile time or via registration at
>>         runtime. Might not be required
>
> We discussed that maybe one would want some kind of a "class" 
> description. For example we might have to register one pgdat area per 
> node. Giving each one a unique name might be impractical / unreasonable.
>
> Still, someone would want to select / filter out all entries of the same 
> "class".
>
> Just a thought.

Right. As I said this was mostly a insta brain dump to start a
discussion. Seems it worked :)

>> @properties:
>> 
>>          A "bitfield", which allows to mark this entry as (in)valid for a
>>          particular consumer.
>> 
>>          That obviously requires to modify these properties when the
>>          requirements of a consumer change, new consumers arrive or new
>>          producers are added, but I think it's easier to do that at the
>>          producer side than maintaining filters on all consumer ends
>>          forever.
>
> Question would be if that is not up to a consumer to decide ("allowlist" 
> / filter) by class or id, stored elsewhere.

Yes, I looked at it the wrong way round. We should leave the filtering
to the consumers. If you use allow lists, then a newly introduced class
won't be automatically exposed everywhere.

Thanks,

        tglx

