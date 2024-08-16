Return-Path: <linux-arm-msm+bounces-28838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D24789552BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 23:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90B56285086
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 21:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF871C57A2;
	Fri, 16 Aug 2024 21:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aqHTPrmy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3AD1C579F
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 21:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723845149; cv=none; b=mhoDoCD1nuhvMx9l/1yimplSWW3M4800yHrBQQiGQ8udYRX5y1PMaP9bxEg7Ng2VbRpP25SeEdzZ2Nw/LpPtt8ZmDxV3x1QKSzIFwM0oMvDOyti4yqHXbW9MH8i41ZNZXb2reRHp+qc8kWFToEmEmaT3OT2EDBPuNVoRlMHsXhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723845149; c=relaxed/simple;
	bh=Tb2YsmBZ9MOyDI/stnMDhfutA+rVZT0BSt77il9pWyo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TlC385JfzYavNjP+kUHegRloetwU9dSyOF8P6y6Ue6hyyzW6pVeY/iT02AoHYaos8GvL8V6ItdcCXOQIBHoSkHVxmAB9OPoqdbt69PcO83u+wEL6BuoVyIyoWk69OENwCHyP5kFYS/25Hmshga1hUvR1G91m4U2S4ixuANoAAT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aqHTPrmy; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e03b3f48c65so3793893276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 14:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723845147; x=1724449947; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4vUtlej2XubFdEQblSjm6EcKT3Hh6Wknx4PIkCBxnA=;
        b=aqHTPrmyOPiy5wnLyIbdHWPcjD9ICyxdfWkYWwelrsCQhcIr/5UawMt9fRxpkK1q/t
         wYjrV2Yk4kuFxsH1m8FnekLVd5RQI2ne3fNwMzoprenGs1/kUc5PTG2gJz++U5NtGtXj
         vOccOAtVDky2y6orpb21VCYBzauWVJyNn4bh/+nrx+63Su56hD213JWLxPJXEWjZ3BIw
         UqcTx/M2Rr5GUw3ZjuxMuq5S6pC65X4hu6WWnQ8vlji16NvG8T0bowJZUkUQZfuaAncY
         Uzd/YOqB5wQpHfc/dDIWbBJqT39+dYzSkr//SdaS4IZuJIFa8f9mOW/JufBzjJUbvsZC
         IFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723845147; x=1724449947;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4vUtlej2XubFdEQblSjm6EcKT3Hh6Wknx4PIkCBxnA=;
        b=s1sWbqFcv2U+ZSvV9qbh/9RkrSt3zZoxaDkoUT4ao6/0FHtgh4Grptev/MaFB0hAGI
         8faFi5DoTgUInHidOEcwq7sM9QbqdlgvcG3qs+hT98b14nJqNCSrkKNm1y8g+6V75s9T
         ThN2QOo0V0Vey3kUgiox9j4KwK3DvjKKp4uqmFbFT5F64m/8vuo7Eu5j34kExnL8OtMy
         eSC4aMJrNprzxTEIp1hatEQOYjJcB1iLtxxi5/RbGBd9Jyis3Qqw6tbPW0uc2E7Mjtcg
         VoA18XEvTt9kyTHNkjH1egVd9vO+L2romcDtdVS7leXHkAZHyh9NRPa1tYwLA2FytN8o
         agJA==
X-Forwarded-Encrypted: i=1; AJvYcCUUnUdXog5/t7VNqT/3Waibi3EFHTHIoX9mlc/qSTkHc3UkTHedcNOg81JRV2AaX+fN6o10/LaIJb3Ii1Pu@vger.kernel.org
X-Gm-Message-State: AOJu0YzSEsnsSPaNBlSIykH4Om+EySCRi9S2cmiWeRLsAf8/fQLEEtZH
	oCK1PqadhX5L/2D+LrhUW/CFAWIKEKw6yzFj2Udh0yoHE+3BMmu27HcFhgQBUMkUp6VxyytQMjL
	KjxyCCnzfVLUiLuKGRgAAyA==
X-Google-Smtp-Source: AGHT+IEs8zyvsoWuEvbphvAg5cMjHgbJYgPfPLSoGdtpOJDuLoPEAib3HGlcNl6V4/E+t5mIJiod+fTrhqt78lV+hg==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a25:8751:0:b0:e11:6fcc:b656 with SMTP
 id 3f1490d57ef6-e1180e97369mr34695276.6.1723845146700; Fri, 16 Aug 2024
 14:52:26 -0700 (PDT)
Date: Fri, 16 Aug 2024 21:52:25 +0000
In-Reply-To: <94c5d735-821c-40ba-ae85-1881c6f4445d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240805-guest-memfd-lib-v1-0-e5a29a4ff5d7@quicinc.com>
 <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com> <4cdd93ba-9019-4c12-a0e6-07b430980278@redhat.com>
 <CA+EHjTxNNinn7EzV_o1X1d0kwhEwrbj_O7H8WgDtEy2CwURZFQ@mail.gmail.com>
 <aa3b5be8-2c8a-4fe8-8676-a40a9886c715@redhat.com> <diqzjzggmkf7.fsf@ackerleytng-ctop.c.googlers.com>
 <94c5d735-821c-40ba-ae85-1881c6f4445d@redhat.com>
Message-ID: <diqz4j7km8yu.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
From: Ackerley Tng <ackerleytng@google.com>
To: David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Patrick Roy <roypat@amazon.co.uk>, qperret@google.com, linux-coco@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

David Hildenbrand <david@redhat.com> writes:

> On 16.08.24 19:45, Ackerley Tng wrote:
>> 
>> <snip>
>> 
>> IIUC folio_lock() isn't a prerequisite for taking a refcount on the
>> folio.
>
> Right, to do folio_lock() you only have to guarantee that the folio 
> cannot get freed concurrently. So you piggyback on another reference 
> (you hold indirectly).
>
>> 
>> Even if we are able to figure out a "safe" refcount, and check that the
>> current refcount == "safe" refcount before removing from direct map,
>> what's stopping some other part of the kernel from taking a refcount
>> just after the check happens and causing trouble with the folio's
>> removal from direct map?
>
> Once the page was unmapped from user space, and there were no additional 
> references (e.g., GUP, whatever), any new references can only be 
> (should, unless BUG :) ) temporary speculative references that should 
> not try accessing page content, and that should back off if the folio is 
> not deemed interesting or cannot be locked. (e.g., page 
> migration/compaction/offlining).

I thought about it again - I think the vmsplice() cases are taken care
of once we check that the folios are not mapped into userspace, since
vmsplice() reads from a mapping.

splice() reads from the fd directly, but that's taken care since
guest_memfd doesn't have a .splice_read() handler.

Reading /proc/pid/mem also requires the pages to first be mapped, IIUC,
otherwise the pages won't show up, so checking that there are no more
mappings to userspace takes care of this.

>
> Of course, there are some corner cases (kgdb, hibernation, /proc/kcore), 
> but most of these can be dealt with in one way or the other (make these 
> back off and not read/write page content, similar to how we handled it 
> for secretmem).

Does that really leave us with these corner cases? And so perhaps we
could get away with just taking the folio_lock() to keep away the
speculative references? So something like

  1. Check that the folio is not mapped and not pinned.
  2. folio_lock() all the folios about to be removed from direct map
  -- With the lock, all other accesses should be speculative --
  3. Check that the refcount == "safe" refcount
      3a. Unlock and return to userspace with -EAGAIN
  4. Remove from direct map
  5. folio_unlock() all those folios

Perhaps a very naive question: can the "safe" refcount be statically
determined by walking through the code and counting where refcount is
expected to be incremented?

Or perhaps the "safe" refcount may differ based on kernel config. Could
we perhaps have a single static variable safe_refcount, and whenever a
new guest_memfd folio is allocated, do

  safe_refcount = min(new_folio_refcount, safe_refcount)

>
> These (kgdb, /proc/kcore) might not even take a folio reference, they 
> just "access stuff" and we only have to teach them to "not access that".
>
>> 
>>> (noting that also folio_maybe_dma_pinned() can have false positives in
>>> some cases due to speculative references or *many* references).
>> 
>> Are false positives (speculative references) okay since it's better to
>> be safe than remove from direct map prematurely?
>
> folio_maybe_dma_pinned() is primarily used in fork context. Copying more 
> (if the folio maybe pinned and, therefore, must not get COW-shared with 
> other processes and must instead create a private page copy) is the 
> "better safe than sorry". So false positives (that happen rarely) are 
> tolerable.
>
> Regading the directmap, it would -- just like with additional references 
> -- detect that the page cannot currently be removed from the direct map. 
> It's similarly "better safe than sorry", but here means that we likely 
> must retry if we cannot easily fallback to something else like for the 
> fork+COW case.
>
> -- 
> Cheers,
>
> David / dhildenb

