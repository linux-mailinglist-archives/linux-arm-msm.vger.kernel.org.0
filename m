Return-Path: <linux-arm-msm+bounces-61275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3798AD9724
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 23:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53E854A1870
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94EA27147B;
	Fri, 13 Jun 2025 21:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W/+KmpmN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B+7CxHUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF2F272E45;
	Fri, 13 Jun 2025 21:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749849011; cv=none; b=Ka6w8RLcfIAvRzP7/5JFOpFduE6qTIhcoCSe6F1dnHEpm3cCPPCd+VjJsh0aGNb5cNUvX+xaiICegbIMnQM5gpaURWZhOYMsXUP2pvVbvnhCv8t86f6AQZ+kRG1TZIRVuqzSTT4eJEeMgTGcsYAWjnnJFZllF2ct/e0ClcIOW0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749849011; c=relaxed/simple;
	bh=OmkcJNAV0hfO/+rD4d1mO4Zskm+DdbNdyEKY6x3S9ZA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NFIHgkYtlaCEl8vktKQGX2Tz0D31a/kKZXDcqYvbQ8QNEAbigNgzHOupWPwr5sMSWkluRBUgXC0dIjImoG2kRhrpiAex7EbSUIzAatKykAVDuYxM8wpH1ZWiNvH2rTRbWIsmuxmPgTwHYdYKOdFaYJM9vYDiZBzaHi6BHKsS4dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W/+KmpmN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B+7CxHUz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749849007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MuBzFJ8bax/C07ekYms0nJGiLaxwPvHrXMpn69ItGCE=;
	b=W/+KmpmNybGnuRoYv0AkuKtnsKYy49mDsnZqnAuVFR1iteOuBy0nacsuwGwXn52voU6/A3
	rlpGxKzE17HSzJPSKGvwNQJEKPQ2IFAH0QXreT8YqKLVvYCy/n1ZCmO4AAVX15Jd+MYBUZ
	f078Jahg2V4fzWuEaulUv7ngS3jkX9Tek/CfN3Gn+gU1TOIbsKZQYlPliMSLFsqyqornBW
	lsIadsSDSfNHZTi+A/6p2ZwnwTvAdvZSMEF/OVyDAxeAFC4jk3gJJG1QVukp+FAy2z+3wo
	2gYCjOHwj5rC7TfnnNYbSEVUNJgT0ejodJqurt21ADxWP4ylesQwYB2SVPEGEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749849007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MuBzFJ8bax/C07ekYms0nJGiLaxwPvHrXMpn69ItGCE=;
	b=B+7CxHUzslKZqG2mQ5S8cP+m4qTSW7M8mzh4mOWSOA/tKqAiCbq9U6NTQHVBHdo+sCpJ1L
	VBPCCiAD4jsOM0DA==
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 andersson@kernel.org
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
In-Reply-To: <f916cf7f-6d0d-4d31-8e4b-24fc7da13f4d@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
 <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
 <f916cf7f-6d0d-4d31-8e4b-24fc7da13f4d@linaro.org>
Date: Fri, 13 Jun 2025 23:10:06 +0200
Message-ID: <87ikkzpcup.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 13 2025 at 17:33, Eugen Hristev wrote:
> On 5/7/25 13:27, Eugen Hristev wrote:
>>> Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
>>> kmemdump specific section and then kmemdump can just walk that section
>>> and dump stuff. No magic register functions and no extra storage
>>> management for static/global variables.
>>>
>>> No?
>> 
>> Thank you very much for your review ! I will try it out.
>
> I have tried this way and it's much cleaner ! thanks for the
> suggestion.

Welcome.

> The thing that I am trying to figure out now is how to do something
> similar for a dynamically allocated memory, e.g.
> void *p = kmalloc(...);
> and then I can annotate `p` itself, it's address and size, but what I
> would also want to so dump the whole memory region pointed out by p. and
> that area address and size cannot be figured out at compile time hence I
> can't instantiate a struct inside the dedicated section for it.
> Any suggestion on how to make that better ? Or just keep the function
> call to register the area into kmemdump ?

Right. For dynamically allocated memory there is obviously no compile
time magic possible.

But I think you can simplify the registration for dynamically allocated
memory significantly.

struct kmemdump_entry {
	void			*ptr;
        size_t			size;
        enum kmemdump_uids	uid;
};

You use that layout for the compile time table and the runtime
registrations.

I intentionally used an UID as that avoids string allocation and all of
the related nonsense. Mapping UID to a string is a post processing
problem and really does not need to be done in the kernel. The 8
character strings are horribly limited and a simple 4 byte unique id is
achieving the same and saving space.

Just stick the IDs into include/linux/kmemdump_ids.h and expose the
content for the post processing machinery.

So you want KMEMDUMP_VAR() for the compile time created table to either
automatically create that ID derived from the variable name or you add
an extra argument with the ID.

kmemdump_init()
        // Use a simple fixed size array to manage this
        // as it avoids all the memory allocation nonsense
        // This stuff is neither performance critical nor does allocating
        // a few hundred entries create a memory consumption problem
        // It consumes probably way less memory than the whole IDR/XARRAY allocation
        // string duplication logic consumes text and data space.
	kmemdump_entries = kcalloc(NR_ENTRIES, sizeof(*kmemdump_entries), GFP_KERNEL);

kmemdump_register(void *ptr, size_t size, enum kmemdump_uids uid)
{
        guard(entry_mutex);

	entry = kmemdump_find_empty_slot();
        if (!entry)
        	return;

        entry->ptr = ptr;
        entry->size = size;
        entry->uid = uid;

        // Make this unconditional by providing a dummy backend
        // implementation. If the backend changes re-register all
        // entries with the new backend and be done with it.
        backend->register(entry);
}

kmemdump_unregister(void *ptr)
{
        guard(entry_mutex);
        entry = find_entry(ptr);
        if (entry) {
                backend->unregister(entry);
        	memset(entry, 0, sizeof(*entry);
        }
}

You get the idea.

Coming back to the registration at the call site itself.

       struct foo = kmalloc(....);

       if (!foo)
       		return;

       kmemdump_register(foo, sizeof(*foo), KMEMDUMP_ID_FOO);

That's a code duplication shitshow. You can wrap that into:

       struct foo *foo = kmemdump_alloc(foo, KMEMDUMP_ID_FOO, kmalloc, ...);

#define kmemdump_alloc(var, id, fn, ...)				\
	({								\
        	void *__p = fn(##__VA_ARGS__);				\
									\
                if (__p)						\
                	kmemdump_register(__p, sizeof(*var), id);	\
		__p;
        })

or something daft like that. And provide the matching magic for the free
side.

Thoughts?

Thanks,

        tglx

