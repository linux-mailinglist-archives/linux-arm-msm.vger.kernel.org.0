Return-Path: <linux-arm-msm+bounces-47870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB388A339E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 09:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D834166BC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3358C20B7FF;
	Thu, 13 Feb 2025 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JIYVhPuo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEB5250EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739435137; cv=none; b=iEZRUH+aH0XC26JndS3HzstG/uREQ1a/GiDGhU5v1lRx0ghYsrJOukvOX3NVFYonyLzhJHVNj+jYl62Ji41gUh8htiluUu+rWMRR9PqXUqiWG8xuHkWyt72iT+QFAmxNRoTSYOPqdaez9Rg9Ektl/EbnOkSok0iPtW0NGjjrrWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739435137; c=relaxed/simple;
	bh=kPO1tc82x3B/hTEAGztrzX0xKtUpDpnoP9c35ehnQ6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAbW45YkD8ktwkH7krXOYJgBWRenV6JwWO4kLGwCw9H/UjXwsXRoj/WWExLblyOCVDiinx3HL8/HplDT1EiEu/mEOR7k7CbOJHEqCTAL3lXZ+UV6XmlQml2yRsrxFNI363UaP1QlJc3YGXczq32ktVLhv+5U4ZT2qqpTlyIkrWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JIYVhPuo; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-471c9947bb5so8191cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 00:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739435134; x=1740039934; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YIO7H+WXIoRkEaRZulor7Xae9SUOPAovGJ7X7Qex5fY=;
        b=JIYVhPuoJmw47DgKaQRrMfyWP0zq9yL2GHyir/1vVW8pj2dmyUYhvoPcEW8URvFWgi
         0tUqWZC0C8wi55c9p8nieWeE76hyFmJXElv1v19PXTY+TDV8JgK+bXl3Nq0cnewQka4b
         PXEWvgIeCUUqgNnh9WjWz1KYVn+cu1tIhwjykmFxj0ECkY6hyxLE0iE9QxiTId4fmUON
         oY4wi3bFgI8hc0tzsAGxUvswNjMd8/tT77kfA7y/F7eSsH6Q5yvhlfl6mmMdA3D+k/Ve
         82PMLIMZE3vxEEgjIGhthhot/Xen4Vx9z9M8CxWD1qmDPNHq6OM4WYaLaBTKQdZ/t8bj
         j6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739435134; x=1740039934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIO7H+WXIoRkEaRZulor7Xae9SUOPAovGJ7X7Qex5fY=;
        b=Jm3754cDfhatASR++avofxe8OOyTUBC6zAZthnjWRT6viFarzKlpHCTtSZ0f2h7m8a
         JjIt6qAPn1HxviIs934QInTJTWtqmqB/hHbMNQZsphIInxgT1pPkngrWkUTXjoxN9Mge
         wsCeZHURt1WXEM72sfN6FWwiI1iIgqDWFbZ0vqsMQt0YAwNCegk63Obod+2Ry5nJc8HO
         GlhAu9fChTwBXNRELF+SvrsUCVKWoC47cSOnrNvcobmq6hZVbkZwZaGYpf+i54UE8KPy
         rrr/vZsNbYcInNPg2RNKnZlGlkkVn6hNAYZV3nD3xYBQQ0lbnd1IXV00hde2IPWM7/QE
         yEdA==
X-Forwarded-Encrypted: i=1; AJvYcCUIZQJ5awg8r50eUZphm5FW8Z8vXWBmUDw0lwE6x+h89+4rat0G3f5oRAUoosHZl2kTeUyMDgsHpM1nyoCf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hDin7m6lmk68klcl7pR3FJrp+YtlcIaiMjEj+RyrW/XO0Jpl
	UCAddAOdbDSgnLFQdVrPBJT6ux7VUkEldr6+UIaKg+C26xw6dBy0pC40E0KLajbMHjz2U0Nls/5
	a+0MgTOVZi4wPntxG2QxInKSpNg32ww8pb/65
X-Gm-Gg: ASbGnct6wNHmRosYqqVSNOGXISwWZ1RA2LoQpjYHpjHhsxZUZgjD48P3DmrUGglPkV1
	PgpZC6rIT5MSWASSt2vVGvWWJlHQYfBZq2+KE1l+KRRMcflFd7C9f+wml2TOdkvslkVnMrCE=
X-Google-Smtp-Source: AGHT+IGVzyHE/LU6Zw8g4d72LuWGhrfsFDxlcENmVL6AWJe3zwC9RJAf2owdTYpyFdLFDhp308ql/pjxSLaUBWAke3s=
X-Received: by 2002:ac8:5dd4:0:b0:471:b96c:726c with SMTP id
 d75a77b69052e-471c0216bcamr2640151cf.20.1739435133955; Thu, 13 Feb 2025
 00:25:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com> <20250211121128.703390-4-tabba@google.com>
 <Z60RacIJMwL0M8On@x1.local>
In-Reply-To: <Z60RacIJMwL0M8On@x1.local>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 13 Feb 2025 08:24:57 +0000
X-Gm-Features: AWEUYZkM07o7Zzm_Om1YM784wK6IGgklVseiQzsh4GkkLThpFRZEVr5Ei8mNkKQ
Message-ID: <CA+EHjTwRNgozO++uK1bFyiRwH7j816g_7Qfhj9VdX55Kh_huSw@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
To: Peter Xu <peterx@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
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

Hi Peter,

On Wed, 12 Feb 2025 at 21:24, Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Feb 11, 2025 at 12:11:19PM +0000, Fuad Tabba wrote:
> > diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> > index 54e959e7d68f..4e759e8020c5 100644
> > --- a/virt/kvm/Kconfig
> > +++ b/virt/kvm/Kconfig
> > @@ -124,3 +124,7 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
> >  config HAVE_KVM_ARCH_GMEM_INVALIDATE
> >         bool
> >         depends on KVM_PRIVATE_MEM
> > +
> > +config KVM_GMEM_SHARED_MEM
> > +       select KVM_PRIVATE_MEM
> > +       bool
>
> No strong opinion here, but this might not be straightforward enough for
> any reader to know why a shared mem option will select a private mem..
>
> I wonder would it be clearer if we could have a config for gmem alone, and
> select that option no matter how gmem would be consumed.  Then the two
> options above could select it.
>
> I'm not sure whether there're too many guest-memfd stuff hard-coded to
> PRIVATE_MEM, actually that's what I hit myself both in qemu & kvm when I
> wanted to try guest-memfd on QEMU as purely shared (aka no conversions, no
> duplicated backends, but in-place).  So pretty much a pure question to ask
> here.

Yes, the whole thing with guest_memfd being initially called private
mem has left a few things like this, e.g., config options, function
names. It has caused (and will probably continue to cause) confusion.

In order not to blend bikeshedding over names and the patch series
adding mmap support (i.e., this one), I am planning on sending a
separate patch series to handle the name issue/

> The other thing is, currently guest-memfd binding only allows 1:1 binding
> to kvm memslots for a specific offset range of gmem, rather than being able
> to be mapped in multiple memslots:
>
> kvm_gmem_bind():
>         if (!xa_empty(&gmem->bindings) &&
>             xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
>                 filemap_invalidate_unlock(inode->i_mapping);
>                 goto err;
>         }
>
> I didn't dig further yet, but I feel like this won't trivially work with
> things like SMRAM when in-place, which can map the same portion of a gmem
> range more than once.  I wonder if this is a hard limit for guest-memfd,
> and whether you hit anything similar when working on this series.

I haven't thought about this much, but it could be something to tackle later on.

Thank you,
/fuad

> Thanks,
>
> --
> Peter Xu
>

On Wed, 12 Feb 2025 at 21:24, Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Feb 11, 2025 at 12:11:19PM +0000, Fuad Tabba wrote:
> > diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> > index 54e959e7d68f..4e759e8020c5 100644
> > --- a/virt/kvm/Kconfig
> > +++ b/virt/kvm/Kconfig
> > @@ -124,3 +124,7 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
> >  config HAVE_KVM_ARCH_GMEM_INVALIDATE
> >         bool
> >         depends on KVM_PRIVATE_MEM
> > +
> > +config KVM_GMEM_SHARED_MEM
> > +       select KVM_PRIVATE_MEM
> > +       bool
>
> No strong opinion here, but this might not be straightforward enough for
> any reader to know why a shared mem option will select a private mem..
>
> I wonder would it be clearer if we could have a config for gmem alone, and
> select that option no matter how gmem would be consumed.  Then the two
> options above could select it.
>
> I'm not sure whether there're too many guest-memfd stuff hard-coded to
> PRIVATE_MEM, actually that's what I hit myself both in qemu & kvm when I
> wanted to try guest-memfd on QEMU as purely shared (aka no conversions, no
> duplicated backends, but in-place).  So pretty much a pure question to ask
> here.
>
> The other thing is, currently guest-memfd binding only allows 1:1 binding
> to kvm memslots for a specific offset range of gmem, rather than being able
> to be mapped in multiple memslots:
>
> kvm_gmem_bind():
>         if (!xa_empty(&gmem->bindings) &&
>             xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
>                 filemap_invalidate_unlock(inode->i_mapping);
>                 goto err;
>         }
>
> I didn't dig further yet, but I feel like this won't trivially work with
> things like SMRAM when in-place, which can map the same portion of a gmem
> range more than once.  I wonder if this is a hard limit for guest-memfd,
> and whether you hit anything similar when working on this series.
>
> Thanks,
>
> --
> Peter Xu
>

