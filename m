Return-Path: <linux-arm-msm+bounces-66732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CF4B124BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 21:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ED431CC4851
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 19:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB2B21CA1E;
	Fri, 25 Jul 2025 19:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f7QKuCPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9357A3D994
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 19:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753472076; cv=none; b=Te+f3M/vC3m9u0WEGnG4KWF6kVz5W1o9Eg9HHLcQf9ILlB8GK1rFvGi6slPO605lOoBLJn6sbhuXNrVv+BSIpeBrPc7yL1RtsQErWVogaLPc5Cw3Sl3HHecFUONw9MA94dzs2g10eGXTaaIsmwJcZ5pziLCi08qB5b9H4o6/0hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753472076; c=relaxed/simple;
	bh=YCSf2LFjWmxkPM80kmN2uNirM0gX9ysri+FUBUCzaU8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TE7d4sgp5Fh0kNP8N9bAuyADsFHpaaxVbNzP8VVQeNRwVXqkoH8mpgSYQDF6NJVRLpTtKjmmRUL80g26/pNz77QvRxcuHRovNTX5q7UFvTWylKGvhOu76gSaZm+jESheFFplh6p8h157T/7m4N/sx+9rM938aUOuXVy0gNTzefg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f7QKuCPI; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b3928ad6176so2291093a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 12:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753472074; x=1754076874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNIIO64ZvPt1HNs+swyYLqJ+PxWQ4jTBObewY8wp0+4=;
        b=f7QKuCPIEfypsYvzx+PAYz0jmubKdq6lJdp4gpu4aiNvpW3yc9SEgTMW14uAylmunh
         oGhUbwfZmFPq9BjMLh9h9ySSxTcYkxxOU9SOVTCZKbg+VDueUjqUmx2KWB+yDugoh9R8
         3ghoOqzVS7dVmWC0C+p4VoTSGTT1uTdKpFqnkWEnQRdvrHel5ibH08HM2Ujoliik3ctu
         aKeaQqCjo6OH2XyGHd7cHrR7INf/LWVfacGIMxNANZq7i2BGqo/unH0+4DUOEmKRQl+o
         MbUeODLZJYSVjdW6ho9Hy1sKCZmCq1GEL0BbhIjaS/D7Mp5RqmcY3tUQbeJpqHoZQXv/
         +WJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753472074; x=1754076874;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FNIIO64ZvPt1HNs+swyYLqJ+PxWQ4jTBObewY8wp0+4=;
        b=kz9g+40WMScBC+luWBow5ueUCzx9id5kZlddrvceoxkEUZICpght1lSppnJC8J6r29
         sYry7BDK6krGxkPsuIimIbCSTqksa2yZMk+/1J+7LXQsFBOenRbqib0DtXGDvqzhKvTQ
         Jh/h18rXfxOHEtC+T7HcrMYbv2BfGH+Y+euYpgeHE1wMd4HUanoGT/B5Joey5cGjDyBw
         TvYA3jIjzSN78MnzuYKZWBPR6OYcB48z0h4uhgJFBq9IqXd+vJvBxYLixCnyKW0zyTLD
         jHx9z+R6FZ4y5vJ3IU0epfI6b4TY4bExD6cHLI1ydF+oQ+kuDORFsG9x8rR4N50f+h85
         Usqg==
X-Forwarded-Encrypted: i=1; AJvYcCXwkS4HJ4imMyA6SvYCTE9XOK29M2KLZelyR80abH1kAA2KucRrawqPfVmFA1wd3oQSOGzfh+vJ2VGRDNHv@vger.kernel.org
X-Gm-Message-State: AOJu0YxDb0mxZrZ/8V5SWEQG7+ureYnOOx5cLvKqKiSCsaHhMVf2cYuT
	58+eqzREISD4+ZGDmmx9o2I6gpwgGycUg1UK7Db+0Udi/4xyPH+TB54lfSD/hx5a8gk5fghXL1U
	FGGQusCOHklh673lR7VXEj1MYUA==
X-Google-Smtp-Source: AGHT+IGnEr3d6PZ3nIW41bH2DK3NPEY+F29AhLyvRFiA1YTCx5wX/C0Qtpn2kKuofqLWGxfCAZp6KUT5h5T5fvXdlg==
X-Received: from pjzz6.prod.google.com ([2002:a17:90b:58e6:b0:313:274d:3007])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:37ce:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-31e77af4429mr5242184a91.17.1753472073748;
 Fri, 25 Jul 2025 12:34:33 -0700 (PDT)
Date: Fri, 25 Jul 2025 12:34:32 -0700
In-Reply-To: <aIO7PRBzpFqk8D13@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com> <20250723104714.1674617-16-tabba@google.com>
 <diqza54tdv3p.fsf@ackerleytng-ctop.c.googlers.com> <aIOMPpTWKWoM_O5J@google.com>
 <diqzy0sccjfz.fsf@ackerleytng-ctop.c.googlers.com> <aIO7PRBzpFqk8D13@google.com>
Message-ID: <diqzseikcbef.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v16 15/22] KVM: x86/mmu: Extend guest_memfd's max mapping
 level to shared mappings
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, mail@maciej.szmigiero.name, 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jul 25, 2025, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>=20
>> > On Thu, Jul 24, 2025, Ackerley Tng wrote:
>> >> Fuad Tabba <tabba@google.com> writes:
>> >> >  int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fau=
lt *fault,
>> >> > @@ -3362,8 +3371,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm=
, struct kvm_page_fault *fault,
>> >> >  	if (max_level =3D=3D PG_LEVEL_4K)
>> >> >  		return PG_LEVEL_4K;
>> >> > =20
>> >> > -	if (is_private)
>> >> > -		host_level =3D kvm_max_private_mapping_level(kvm, fault, slot, g=
fn);
>> >> > +	if (is_private || kvm_memslot_is_gmem_only(slot))
>> >> > +		host_level =3D kvm_gmem_max_mapping_level(kvm, fault, slot, gfn,
>> >> > +							is_private);
>> >> >  	else
>> >> >  		host_level =3D host_pfn_mapping_level(kvm, gfn, slot);
>> >>=20
>> >> No change required now, would like to point out that in this change
>> >> there's a bit of an assumption if kvm_memslot_is_gmem_only(), even fo=
r
>> >> shared pages, guest_memfd will be the only source of truth.
>> >
>> > It's not an assumption, it's a hard requirement.
>> >
>> >> This holds now because shared pages are always split to 4K, but if
>> >> shared pages become larger, might mapping in the host actually turn o=
ut
>> >> to be smaller?
>> >
>> > Yes, the host userspace mappens could be smaller, and supporting that =
scenario is
>> > very explicitly one of the design goals of guest_memfd.  From commit a=
7800aa80ea4
>> > ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing m=
emory"):
>> >
>> >  : A guest-first memory subsystem allows for optimizations and enhance=
ments
>> >  : that are kludgy or outright infeasible to implement/support in a ge=
neric
>> >  : memory subsystem.  With guest_memfd, guest protections and mapping =
sizes
>> >  : are fully decoupled from host userspace mappings.   E.g. KVM curren=
tly
>> >  : doesn't support mapping memory as writable in the guest without it =
also
>> >  : being writable in host userspace, as KVM's ABI uses VMA protections=
 to
>> >  : define the allow guest protection.  Userspace can fudge this by
>> >  : establishing two mappings, a writable mapping for the guest and rea=
dable
>> >  : one for itself, but that=E2=80=99s suboptimal on multiple fronts.
>> >  :=20
>> >  : Similarly, KVM currently requires the guest mapping size to be a st=
rict
>> >  : subset of the host userspace mapping size, e.g. KVM doesn=E2=80=99t=
 support
>> >  : creating a 1GiB guest mapping unless userspace also has a 1GiB gues=
t
>> >  : mapping.  Decoupling the mappings sizes would allow userspace to pr=
ecisely
>> >  : map only what is needed without impacting guest performance, e.g. t=
o
>> >  : harden against unintentional accesses to guest memory.
>>=20
>> Let me try to understand this better. If/when guest_memfd supports
>> larger folios for shared pages, and guest_memfd returns a 2M folio from
>> kvm_gmem_fault_shared(), can the mapping in host userspace turn out
>> to be 4K?
>
> It can be 2M, 4K, or none.
>
>> If that happens, should kvm_gmem_max_mapping_level() return 4K for a
>> memslot with kvm_memslot_is_gmem_only() =3D=3D true?
>
> No.
>
>> The above code would skip host_pfn_mapping_level() and return just what
>> guest_memfd reports, which is 2M.
>
> Yes.
>
>> Or do you mean that guest_memfd will be the source of truth in that it
>> must also know/control, in the above scenario, that the host mapping is
>> also 2M?
>
> No.  The userspace mapping, _if_ there is one, is completely irrelevant. =
 The
> entire point of guest_memfd is eliminate the requirement that memory be m=
apped
> into host userspace in order for that memory to be mapped into the guest.
>

If it's not mapped into the host at all, host_pfn_mapping_level() would
default to 4K and I think that's a safe default.

> Invoking host_pfn_mapping_level() isn't just undesirable, it's flat out w=
rong, as
> KVM will not verify slot->userspace_addr actually points at the (same) gu=
est_memfd
> instance.
>

This is true too, that invoking host_pfn_mapping_level() could return
totally wrong information if slot->userspace_addr points somewhere else
completely.

What if slot->userspace_addr is set up to match the fd+offset in the
same guest_memfd, and kvm_gmem_max_mapping_level() returns 2M but it's
actually mapped into the host at 4K?

A little out of my depth here, but would mappings being recovered to the
2M level be a problem?

For enforcement of shared/private-ness of memory, recovering the
mappings to the 2M level is okay since if some part had been private,
guest_memfd wouldn't have returned 2M.

As for alignment, if guest_memfd could return 2M to
kvm_gmem_max_mapping_level(), then userspace_addr would have been 2M
aligned, which would correctly permit mapping recovery to 2M, so that
sounds like it works too.

Maybe the right solution here is that since slot->userspace_addr need
not point at the same guest_memfd+offset configured in the memslot, when
guest_memfd responds to kvm_gmem_max_mapping_level(), it should check if
the requested GFN is mapped in host userspace, and if so, return the
smaller of the two mapping levels.

> To demonstrate, this must pass (and does once "KVM: x86/mmu: Handle guest=
 page
> faults for guest_memfd with shared memory" is added back).
>

Makes sense :)

[snip]

