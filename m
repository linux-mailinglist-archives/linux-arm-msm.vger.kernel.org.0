Return-Path: <linux-arm-msm+bounces-45974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35884A1A40A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62C3D188336B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A768288CC;
	Thu, 23 Jan 2025 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RoyszFv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8011020E318
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634628; cv=none; b=Zk9A8mdDYlJaFQbVl3ChsesVjRNQ2NQ9DCO2tbJ6OWUMDcYjuwZ0MSCaGFqI8ScDB9Fvfvh2Z2YIqHOKlmzmco1rj//2e3jFsXlPZHAXZ/5dCW65owbnMXxJyALhbJ6BiQ0L62dWeyDsmBYR8xEYiXVu8hKtC4ZL9SDcufHdJ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634628; c=relaxed/simple;
	bh=PP+gahMXQFB6TzKfhC6Dy2Zg4ehr5p/q5K2aXgevRO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRsoRtO7gscCGm7UEdBrQYc+mjC9Uzg+1CIWVFo/G96Y7KRARWAJWVxZjHc04eyiqaaZeDv8eE4Er4epcRkCMKpc2DhJocA9hmm9cYWvj9EbTkYD9kyuTJC4wMCcJEbOYFTLPMooWp1WgAxsP6TuWtj/JcjM2IUftLUnX/yr8Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RoyszFv4; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467896541e1so236351cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 04:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737634625; x=1738239425; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u7c2X9kc5POGVPycCORkuD5RHSMR1gSNujIx7A9z99U=;
        b=RoyszFv4ihCOhBgc5ec2EA8DKbacfmNQJnU4xSAaa6iphwLYRQy3t27R1T/4aQFvu6
         lph2R96lBqnud00CArgsWiOSdKREBU5Il5aURzMld4WmBmRoBxF5j8sjZB12dX+y8m2q
         AIrilBdRmHTLybVnIch1KrarJDwsKdhRAXVz/4AM01iwsrpQJmy31dNZlnmShEvvGGnV
         aTDyGLgbhKF4p3IBiMyaqLkj7TvEpqZR8L3lqE3NtXKQAcjvGb94CodDncuJyQtHvRhC
         gVXHpXgvOvOWYHsgwrpcyyXaoGgOdnSlth1Cn1tVcec+E+KEXuZoFnbv+4tGuxgR42gd
         mQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634625; x=1738239425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7c2X9kc5POGVPycCORkuD5RHSMR1gSNujIx7A9z99U=;
        b=vKHfblJmRjn0w8aPZFF6UvBJGZgtTZm3x6efbgIwcma34Ldqu1r6ZpMEgEXp6Fv+0G
         BBGS/VNvpLghZsD+pqcELO1/LObvAzXfcVRQSFZTeEca1DpOzw68WmBFaVPEgL4CXhgj
         DoNtIw0qHLCzwKrAWF/oNmQ/LMeXv0J0kQJc6+n1P0fhCWa0/6jEqotP+mPo0Cj/Y1zd
         Aqxx1f/HPvVvO07VMWbjf4+rScavCXC3wDaZR94h/mKZDe7OBlpyP2M4s8dzLFAhWYLa
         k0LZKlexeHMif167lOFeSxL5qN9SALAyvr/Ze2+KSbwf8g7KPmIX5YoDW4f3X8Y4KhOZ
         RStg==
X-Forwarded-Encrypted: i=1; AJvYcCU/sgOP/o/81G3MkyA7KSx6EyIB0IbONIBxUgOQvVvoUCZLxXdfBg2eFYfCmdl4VO9KYxhZ2+trJebMtpX0@vger.kernel.org
X-Gm-Message-State: AOJu0YzrYE9k73/AVtvzP8ZeXoMFMT72xlbNejZdBhrP65Hy17R133Ox
	vVU85vGbV+Xuys3skZka5PixDRnriKpGUAEORsUaKyLq7WAS/+Tb8tJRIcQSI2FDQJTcrp64hol
	ASO7tl9fEU95HCt1k7KqreCQK5wAk0UKk09GQ
X-Gm-Gg: ASbGnctbbDjlhibckqj8cW8gKY+eVYOatSAkJm3y4womE/biij/RHbLo+g3KYbn73Lf
	pWZEU8Jf8hSeLVDNzSmn+qZQWVpGt61ObiaTQv7bCiM1GJjybNNd6f1bTLMLkYgoj8JqeLxiVst
	3XTq51qyCMSutw3w==
X-Google-Smtp-Source: AGHT+IHg41VKduTv3xsbtO3UMFx2kzshM1QFv1Op/0w7ulZd5Nozoq7Hnn3XMZmqKWZNJuLvb6blkPsJkFfwWIaYc6Q=
X-Received: by 2002:a05:622a:1183:b0:465:18f3:79cc with SMTP id
 d75a77b69052e-46e5dacd7b5mr2799021cf.11.1737634625022; Thu, 23 Jan 2025
 04:17:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122152738.1173160-1-tabba@google.com> <20250122152738.1173160-3-tabba@google.com>
 <e6ea48d2-959f-4fbb-a170-0beaaf37f867@redhat.com> <CA+EHjTxNEoQ3MtZPi603=366vxt=SmBwetS4mFkvTK2r6u=UHw@mail.gmail.com>
 <82d8d3a3-6f06-4904-9d94-6f92bba89dbc@redhat.com>
In-Reply-To: <82d8d3a3-6f06-4904-9d94-6f92bba89dbc@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jan 2025 12:16:28 +0000
X-Gm-Features: AWEUYZmQL5kkD90_YRmG3RYm8qDIgmqchmZqRaBczok1nfibbnLskD3572ozPos
Message-ID: <CA+EHjTzZoGuUcZTNUzx2e3PNOOEtOJT5rUEhSSmYQ-kcoZQiYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/9] KVM: guest_memfd: Add guest_memfd support to kvm_(read|/write)_guest_page()
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
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

Hi David,

On Thu, 23 Jan 2025 at 11:39, David Hildenbrand <david@redhat.com> wrote:
>
> On 23.01.25 10:48, Fuad Tabba wrote:
> > On Wed, 22 Jan 2025 at 22:10, David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 22.01.25 16:27, Fuad Tabba wrote:
> >>> Make kvm_(read|/write)_guest_page() capable of accessing guest
> >>> memory for slots that don't have a userspace address, but only if
> >>> the memory is mappable, which also indicates that it is
> >>> accessible by the host.
> >>
> >> Interesting. So far my assumption was that, for shared memory, user
> >> space would simply mmap() guest_memdd and pass it as userspace address
> >> to the same memslot that has this guest_memfd for private memory.
> >>
> >> Wouldn't that be easier in the first shot? (IOW, not require this patch
> >> with the cost of faulting the shared page into the page table on access)
> >

Before answering your questions in detail, in light of this
discussion, and in other discussions I've had, I think the more
reasonable thing to do is to let the memslot for in-place shared
memory look the same as the other guest_memfd memslots, i.e., have a
userspace address regardless if it's needed or not. This makes the
interface the same across all guest_memfd implementations, and avoids
the need for patches such as this one, at least initially until we
realize that we need it.

That said...

>
> In light of:
>
> https://lkml.kernel.org/r/20250117190938.93793-4-imbrenda@linux.ibm.com
>
> there can, in theory, be memslots that start at address 0 and have a
> "valid" mapping. This case is done from the kernel (and on special s390x
> hardware), though, so it does not apply here at all so far.
>
> In practice, getting address 0 as a valid address is unlikely, because
> the default:
>
> $ sysctl  vm.mmap_min_addr
> vm.mmap_min_addr = 65536
>
> usually prohibits it for good reason.

Ack.

> > This has to do more with the ABI I had for pkvm and shared memory
> > implementations, in which you don't need to specify the userspace
> > address for memory in a guestmem memslot. The issue is there is no
> > obvious address to map it to. This would be the case in kvm:arm64 for
> > tracking paravirtualized time, which the userspace doesn't necessarily
> > need to interact with, but kvm does.
>
> So I understand correctly: userspace wouldn't have to mmap it because it
> is not interested in accessing it, but there is nothing speaking against
> mmaping it, at least in the first shot.

That's right.

> I assume it would not be a private memslot (so far, my understanding is
> that internal memslots never have a guest_memfd attached).
> kvm_gmem_create() is only called via KVM_CREATE_GUEST_MEMFD, to be set
> on user-created memslots.

Right, it wouldn't be a private memslot, but a user created one.

> >
> > That said, we could always have a userspace address dedicated to
> > mapping shared locations, and use that address when the necessity
> > arises. Or we could always require that memslots have a userspace
> > address, even if not used. I don't really have a strong preference.
>
> So, the simpler version where user space would simply mmap guest_memfd
> to provide the address via userspace_addr would at least work for the
> use case of paravirtualized time?
>
> It would get rid of the immediate need for this patch and patch #4 to
> get it flying.

I agree now.

>
> One interesting question is: when would you want shared memory in
> guest_memfd and *not* provide it as part of the same memslot.
>

My original thinking wasn't that we wouldn't _want_ to, rather that we
don't _need_ to. I mistakenly thought that it would simplify things,
but, especially after this discussion, I now realize that it makes
things more complicated instead.

> One nice thing about the mmap might be that access go via user-space
> page tables: E.g., __kvm_read_guest_page can just access the memory
> without requiring the folio lock and an additional temporary folio
> reference on every access -- it's handled implicitly via the mapcount.
>
> (of course, to map the page we still need that once on the fault path)

Ack.

Thanks,
/fuad


> --
> Cheers,
>
> David / dhildenb
>

