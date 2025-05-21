Return-Path: <linux-arm-msm+bounces-58858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3998ABEDCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8B8F4A438F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38022367D3;
	Wed, 21 May 2025 08:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QIugF1aa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A12367AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815936; cv=none; b=P1TsS7wqF6z8AKEqwQ6lUgMBqCEJ9AQHGwYu/WfiZR65MS5uyDwgdXl7aVtY1D4mfaEVFjP+rs9fxM0D/vDQEN75aeQzD511T91DqCnG3VYNGjkxoB9RN79ZAG7QM/LmzSxYObfP/LUl3oZkZH28batwcdb/65yv6fTrPLY3oZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815936; c=relaxed/simple;
	bh=gkPxuc8IWsThKGRoMoIgd0Z0CzgLNCg9WoKdzqAkMWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7unJztHK0MeHsHMZU9lRFBxVS14nb0EgyTzjXgp74jQm49An8aZyzYC6YiEGRWDhK8Lj9XDgSVVZAazhQnjItPMTACQfobzIvJpZRtLZ+JUW4AkiSZ4TaHnKU6Lev/e8dKNzhQ2okENcBrnLOwB1i91u2Wh6SBUS+U1yWszBnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QIugF1aa; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47666573242so1347341cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 01:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747815934; x=1748420734; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q0EB3ECbJOPZow2xPGp/wd2YN15YtEgDGZvrmPbzrSM=;
        b=QIugF1aaSvSZixMlJ+VB0rUDtUBtrKJA6J0xKO57YZPW75JBETQl+QrD1Ec3vzJiDl
         cQazE0TSunRn7Ozjg0SChN98nnTKvNRw6V8Fwb19xHk0ZoxQt5i/GJ+fd0YBZ+4Xdvjz
         dil7Y0J3oH7iT0IHaV478v1E/aYILlQoDTKwkoJng8f/RxSCAbUkbollfsiNaqW9CkJL
         1IB1KDttPmgVGmIdahvkbQvkdgL5XRItLRP9PhpBwCq9ld+WDDbgSCBcL+PoNJ71BJXw
         93B+HWT8muRBm1R7ll7CRdXYJVAWKgJFx8ypisKi7o7POZgmTlzbKUFYmTM60hKalJ1M
         /D+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747815934; x=1748420734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0EB3ECbJOPZow2xPGp/wd2YN15YtEgDGZvrmPbzrSM=;
        b=RbzLvW14Yhrr9Z+Qjhic/7frdgrlK934myHXWS8JGKBcNoSyWBJEPB6NNR4pBJ1XNw
         PgHKuq6JlIH8oS6quiv1AT5csTelCtC/7oltCAM5ng6W/uL/iyV0QT6BSNL1xZCZhXeB
         jfp91DgpfwAUc3hAeXlMz3rCRY2PwCY6qZNJCRuQ3rSyP3favGdcswhuqXKUu4ghR3OT
         KEsbX/urL4DYv/23hdB2cTGWamupczEiuSNosdnPp6ToKqEumob18FIlpnnPjyiKac0R
         fexeFTyqAfr+67VKjB65jhdspBU77CbuE+K199D7cq+Wi09cV9UYoTT9pSdt5ME+G/t7
         qqDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxYXikn7O5OI6vQVkyZTu/kDMHEpINPkq30qNxHcNw8ALM/PG0pA7wil5qAkqm46uOekQ9ewUuFvkiv0A/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6dwjj8SuqZVwejbqi7+lXV7whwajLDd29TyLkoV2e2pVqGP2Q
	Pmj48+AqG4EUGUdTMeun069/micIdX6+L70bAClt4vD6yY2HzCOYUZNfwfzFzIh+jVI2QbnzhmI
	57l4MR/ZfPr4xyhaOIbyLh83/HaT1cRHPiZ243LMj
X-Gm-Gg: ASbGncshYx1mE91NU4DBLS70Iiml5KJBZaxBTcOH2lKdMkHOytJ5n5W1cAEDvKZ7TK8
	EyQ5xqpcSk/HVMFuKISuvAnj9impEbEFOKrKAFP9HrCF9uKN0Dho8C1q+8Y42CApoFCTzK4Pizr
	D1j2+iE/24aQPxCpXEkdIZS7Boeqr9vpU6SzzW8L+NUHi64GqA2yBR9SGPQbiRxhVE8ea6T34qi
	hp8mp/p5k4=
X-Google-Smtp-Source: AGHT+IGAQdJ9rx7y7CxhzsHg4Xr7q2gSSor8M5gS3b2MfFzTlRji2bA/N+wytl7r35uThXcrXXRLnLMP6Iv+gWrOlTc=
X-Received: by 2002:ac8:7d0a:0:b0:48d:8f6e:ece7 with SMTP id
 d75a77b69052e-495ff7c853fmr13965871cf.3.1747815933516; Wed, 21 May 2025
 01:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-16-tabba@google.com>
 <498765f6-c20e-48f2-98e4-4134bfe150a3@redhat.com>
In-Reply-To: <498765f6-c20e-48f2-98e4-4134bfe150a3@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 21 May 2025 09:24:56 +0100
X-Gm-Features: AX0GCFsFoNB1ieKR8Mpy2mR32AeGSlXaGdfHcg37_uYu8TA3HACi0fD0QWeAtgU
Message-ID: <CA+EHjTya4pAFcJcVo3YNRuCv6=tkym-D1h9K8KD5EOch=ctPAQ@mail.gmail.com>
Subject: Re: [PATCH v9 15/17] KVM: Introduce the KVM capability KVM_CAP_GMEM_SHARED_MEM
To: Gavin Shan <gshan@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 May 2025 at 03:47, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Fuad,
>
> On 5/14/25 2:34 AM, Fuad Tabba wrote:
> > This patch introduces the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
> > indicates that guest_memfd supports shared memory (when enabled by the
> > flag). This support is limited to certain VM types, determined per
> > architecture.
> >
> > This patch also updates the KVM documentation with details on the new
> > capability, flag, and other information about support for shared memory
> > in guest_memfd.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   Documentation/virt/kvm/api.rst | 18 ++++++++++++++++++
> >   include/uapi/linux/kvm.h       |  1 +
> >   virt/kvm/kvm_main.c            |  4 ++++
> >   3 files changed, 23 insertions(+)
> >
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 47c7c3f92314..86f74ce7f12a 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6390,6 +6390,24 @@ most one mapping per page, i.e. binding multiple memory regions to a single
> >   guest_memfd range is not allowed (any number of memory regions can be bound to
> >   a single guest_memfd file, but the bound ranges must not overlap).
> >
> > +When the capability KVM_CAP_GMEM_SHARED_MEM is supported, the 'flags' field
> > +supports GUEST_MEMFD_FLAG_SUPPORT_SHARED.  Setting this flag on guest_memfd
> > +creation enables mmap() and faulting of guest_memfd memory to host userspace.
> > +
> > +When the KVM MMU performs a PFN lookup to service a guest fault and the backing
> > +guest_memfd has the GUEST_MEMFD_FLAG_SUPPORT_SHARED set, then the fault will
> > +always be consumed from guest_memfd, regardless of whether it is a shared or a
> > +private fault.
> > +
> > +For these memslots, userspace_addr is checked to be the mmap()-ed view of the
> > +same range specified using gmem.pgoff.  Other accesses by KVM, e.g., instruction
> > +emulation, go via slot->userspace_addr.  The slot->userspace_addr field can be
> > +set to 0 to skip this check, which indicates that KVM would not access memory
> > +belonging to the slot via its userspace_addr.
> > +
>
> This paragraph needs to be removed if PATCH[08/17] is going to be dropped.

Done.

Thanks,
/fuad
>
> [PATCH v9 08/17] KVM: guest_memfd: Check that userspace_addr and fd+offset refer to same range
>
> > +The use of GUEST_MEMFD_FLAG_SUPPORT_SHARED will not be allowed for CoCo VMs.
> > +This is validated when the guest_memfd instance is bound to the VM.
> > +
> >   See KVM_SET_USER_MEMORY_REGION2 for additional details.
> >
>
> [...]
>
> Thanks,
> Gavin
>

