Return-Path: <linux-arm-msm+bounces-46996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D8A29F47
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 04:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2B701887377
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 03:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2CE14A4DF;
	Thu,  6 Feb 2025 03:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N7Daio+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7C6148850
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 03:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811671; cv=none; b=aYR5aWOVRD37b0CDm8/uLhC1uY0ORXwAiqmeKPW5R6QTT8Gd/vp9S2jUkp+13lMGiSlAvlE+k17JwaMq/k31u2PCb0LIfWrcAB9mqN3sQaSf8fmJQeZZd9Fh3Xgwi1wBzdmTxvGVZxmsXypaXsKS3tLIbUmVdnmbweIxJ1MO4mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811671; c=relaxed/simple;
	bh=yMKPK9uzSUHuCqAN+tFaf6kDFFq4fyb6+2qvfe9K+4o=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=aUFCvvLLpjn2s8xSJohk/P6RnOBz2kc2xVv7oBwKTn50ASyCwcKzu3OlMThb9sh7vCWWOtv9fsjktniwqUBVBma27l+8300qLitdxDA7YyaPLPf2m6XGXRTIgf9HvR+oiIaDqZWddJQjmLU2D27+LDw2LMjOmXOxasL2uReOtWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N7Daio+L; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso1283702a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 19:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738811669; x=1739416469; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i6OfEcg14oMUGhFkQ4MS2VHrc0kKqCPEn9U5y95RINg=;
        b=N7Daio+LCKNxi9tMY+bTSowKTmlLgE3XaOcCnJqDG1V4vtK0HmHiK2h84YE+/9QCUN
         hehglUCrsp15kFMN2C92nmETkpp0fLYWDt/KIVU2Xm5CJRzH4DIBprLt0gmDKlsJkdAJ
         8fy1rbdFCHxhYHCoucW5qFawGgmZWlxPdaMaIaup7s5CHvKDoGd8tmx+zziJQsock5gy
         PC4suB3xJjeNH0ZqSeX4S49+12VQh111oQSXimqTZAsqE2k/s+Genf7Cqww7rGORYuXC
         rXs/OBVngL48LpBRweXWT/YggjXZda0xWHyWXr2hlZJgrhKRy7Uhi5JoFABRPNTKULPC
         XChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811669; x=1739416469;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6OfEcg14oMUGhFkQ4MS2VHrc0kKqCPEn9U5y95RINg=;
        b=UwdLfhPCKZZRVDk9dhvQs6HpylKyQ8UHFSOCmILE2GJ1I7RKlY6EbT7D9xYOm5nYwq
         nGlzMP05sTfptJyxJ3nRwDufGNJquDs4VlcRG/zk5M2bPJtuzmgpHxzZs/JE6ZD1PA+n
         uvaE5cAWpitwNkxUCRyRq9H4IFkrtGK33y9cvuLH9ofHDKJ2ba8noPzIuBoOJn325MuE
         za+jyBy7rN+H9QaOXivdYKfoDQvel73bYv2YHJ2cCVvg8cP4JdY+EbBcarPBff3BXQUx
         Xfk+7/r6d3BjnRIdmDLI+qxr93uVFLM4CXiwe4p/L3NaRaEfMxp2usYmgEL8zRTjZ8gI
         XZpA==
X-Forwarded-Encrypted: i=1; AJvYcCWGDU8YbrzLVj3OfvgcGdWGdXUDxyWfSgl/BgMB+cwXRXgV/oZGzT3kyXf1BmKyE5qqqJw8khpjVUAf+xrm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2x9bwyd2OEZHpJ0eQOq1Yk7S/wJcBZ2uLUMsrPdaxmgG33mlO
	rWHvuQdylQe0bBA+5EI9cZYnluknM5GMMoZgtVjDI378IZvO1ewsKtFRX58YMlTTfHNlGLlD1eX
	XGXlUbYL/qEJhX+sVHxpaSw==
X-Google-Smtp-Source: AGHT+IEhjV8IoXhC7L0su0QVYZRadbNJ7mcE6NaQ3JKVlwcESeH3KZDS5WbZ0UWdb8GJZIGz7LQzpNil+0avQSZH8g==
X-Received: from pjbsu5.prod.google.com ([2002:a17:90b:5345:b0:2ef:71b9:f22f])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3a88:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f9e069bc55mr10139814a91.0.1738811669291;
 Wed, 05 Feb 2025 19:14:29 -0800 (PST)
Date: Thu, 06 Feb 2025 03:14:28 +0000
In-Reply-To: <CA+EHjTzRnGoY_bPcV4VFb-ORi5Z4qYTdQ-w4A0nsB91bUAOuAg@mail.gmail.com>
 (message from Fuad Tabba on Mon, 20 Jan 2025 10:40:49 +0000)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzbjvfsr1n.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v5 05/15] KVM: guest_memfd: Folio mappability states
 and functions that manage their transition
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kirill@shutemov.name, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> On Mon, 20 Jan 2025 at 10:30, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>>
>> On Fri, Jan 17, 2025 at 04:29:51PM +0000, Fuad Tabba wrote:
>> > +/*
>> > + * Marks the range [start, end) as not mappable by the host. If the host doesn't
>> > + * have any references to a particular folio, then that folio is marked as
>> > + * mappable by the guest.
>> > + *
>> > + * However, if the host still has references to the folio, then the folio is
>> > + * marked and not mappable by anyone. Marking it is not mappable allows it to
>> > + * drain all references from the host, and to ensure that the hypervisor does
>> > + * not transition the folio to private, since the host still might access it.
>> > + *
>> > + * Usually called when guest unshares memory with the host.
>> > + */
>> > +static int gmem_clear_mappable(struct inode *inode, pgoff_t start, pgoff_t end)
>> > +{
>> > +     struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
>> > +     void *xval_guest = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
>> > +     void *xval_none = xa_mk_value(KVM_GMEM_NONE_MAPPABLE);
>> > +     pgoff_t i;
>> > +     int r = 0;
>> > +
>> > +     filemap_invalidate_lock(inode->i_mapping);
>> > +     for (i = start; i < end; i++) {
>> > +             struct folio *folio;
>> > +             int refcount = 0;
>> > +
>> > +             folio = filemap_lock_folio(inode->i_mapping, i);
>> > +             if (!IS_ERR(folio)) {
>> > +                     refcount = folio_ref_count(folio);
>> > +             } else {
>> > +                     r = PTR_ERR(folio);
>> > +                     if (WARN_ON_ONCE(r != -ENOENT))
>> > +                             break;
>> > +
>> > +                     folio = NULL;
>> > +             }
>> > +
>> > +             /* +1 references are expected because of filemap_lock_folio(). */
>> > +             if (folio && refcount > folio_nr_pages(folio) + 1) {
>>
>> Looks racy.
>>
>> What prevent anybody from obtaining a reference just after check?
>>
>> Lock on folio doesn't stop random filemap_get_entry() from elevating the
>> refcount.
>>
>> folio_ref_freeze() might be required.
>
> I thought the folio lock would be sufficient, but you're right,
> nothing prevents getting a reference after the check. I'll use a
> folio_ref_freeze() when I respin.
>
> Thanks,
> /fuad
>

Is it correct to say that the only non-racy check for refcounts is a
check for refcount == 0?

What do you think of this instead: If there exists a folio, don't check
the refcount, just set mappability to NONE and register the callback
(the folio should already have been unmapped, which leaves
folio->page_type available for use), and then drop the filemap's
refcounts. When the filemap's refcounts are dropped, in most cases (no
transient refcounts) the callback will be hit and the callback can set
mappability to GUEST.

If there are transient refcounts, the folio will just be waiting
for the refcounts to drop to 0, and that's when the callback will be hit
and the mappability can be transitioned to GUEST.

If there isn't a folio, then guest_memfd was requested to set
mappability ahead of any folio allocation, and in that case
transitioning to GUEST immediately is correct.

>> > +                     /*
>> > +                      * Outstanding references, the folio cannot be faulted
>> > +                      * in by anyone until they're dropped.
>> > +                      */
>> > +                     r = xa_err(xa_store(mappable_offsets, i, xval_none, GFP_KERNEL));
>> > +             } else {
>> > +                     /*
>> > +                      * No outstanding references. Transition the folio to
>> > +                      * guest mappable immediately.
>> > +                      */
>> > +                     r = xa_err(xa_store(mappable_offsets, i, xval_guest, GFP_KERNEL));
>> > +             }
>> > +
>> > +             if (folio) {
>> > +                     folio_unlock(folio);
>> > +                     folio_put(folio);
>> > +             }
>> > +
>> > +             if (WARN_ON_ONCE(r))
>> > +                     break;
>> > +     }
>> > +     filemap_invalidate_unlock(inode->i_mapping);
>> > +
>> > +     return r;
>> > +}
>>
>> --
>>   Kiryl Shutsemau / Kirill A. Shutemov

