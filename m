Return-Path: <linux-arm-msm+bounces-65217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E41B7B07429
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 13:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E93471897CCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 11:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5812F363F;
	Wed, 16 Jul 2025 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RlmPnJ0B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F0727602B
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752663622; cv=none; b=Q+W5poYwAwhtn4Fli/0Vt7j+0FoWYxia+Jejwr+elKBHfJRK1yq2v8Ya98zdkC4J10Og5jmPNG7lDyIuM3Q7kOqlTWty6xR/nEtmCw5VYYou7Z7neoJ07GBNj/imiWY1g2K3OejGeHtSQGKAi5O9TP0UoNE+ByCB93tJNyKblMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752663622; c=relaxed/simple;
	bh=WEL3KqF/GpMex8AfuvzJH2hVcfhrkUtP29xcoofDR0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szvtPNnYmo5sUeOxZ/eLNpLHAWmwtm6yufaOXd+3SeiuKvdLc4cwTZoqN2d3TA2szmR+t5IL0DiZ2pRIxQKbXKwH9V0oFPOVJY7RboBUwrr9IuFFLxWfWPFN3seIC/u1dvww5G376MC0UC2UFlLypFFiU4SNwct16c7RSKmii1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RlmPnJ0B; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso411701cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752663619; x=1753268419; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WEL3KqF/GpMex8AfuvzJH2hVcfhrkUtP29xcoofDR0M=;
        b=RlmPnJ0BemczLuoFKbeIpwUQ+ZNuAyS8Sbu1/R9IzFNdsA95C33L/aTD+TT7RBsDyA
         +ZprIEblkeVdXi+EC1wXyhh3nAxLQju5wZbqv/9pCZgn9Ugvx9UVUz2p6ifKQHHmDBwX
         d9Ddmm681BQyJs4UPAg9phQLOFPE5mCE7XuoujXO1bBoNyBs5dMqZtjWY9NjrSxt7RZC
         1RcMzVgBXx4QQ3rjPMCZ6urETxFm8OIbkGtV53tDIk0IjniEJyMOKF2xIar9lm8tzMzZ
         hStOUsATibSasZe6miU4YS5QPdIKU/Xsw7z/vRSsG/7Mjvnysm2N8ZhImjGhFlGgklMX
         eGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752663619; x=1753268419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEL3KqF/GpMex8AfuvzJH2hVcfhrkUtP29xcoofDR0M=;
        b=oKkc82l0DOJSSZeuDxSpHeCPClJzu5AjLrXn75hgliya1C3J9/BPfHa99uFSjNWPBH
         wrdwCxeUQrZ27ZWxOUD4DNvFP5ZUv/9n0XKQpb28iIezWffYynor0gw1LWLylzozEq4G
         jele3u5dXRLoeWSjH6p1KuP+QMgGx9YG1+tZ4wUQij6BvM24bn5MPBLioU94HJ5ap346
         LD7vHte4LZbPnKlsUzjo3YixcvXwUuzxl2wAZ2jGu8Ayf4A99L5z9GgF+QxM2t0nzjsX
         AhpFxPwtQ1iXlBQ3LjNZN68bDPktXJqNYIaxl0kU+U/lLqpp/RHO3C3hcDTZqBAc5Cd0
         ATJg==
X-Forwarded-Encrypted: i=1; AJvYcCVsoV41uJwNGKU1hAVKfNtF6Z6HBXOQxqdBbf/COuU9t7YLJtg16wNiULXKGAPBDeUs4laDny/UNmZ+jwT6@vger.kernel.org
X-Gm-Message-State: AOJu0YymZxzLCT0N1quO+nCjwvB+doe2r0MLc4uQZNDNNv3tC5HCAGiK
	KGywsr72D/T7mNM9Tx26Dk3e7nC+SItqsNbRNHrnIQ2YaSi2kfGxlaIZzxiPJNbKMebQ2enasrp
	FFe2QEc6C+WfGV+VttTtBArbLCYr8S+S9N2593zf/
X-Gm-Gg: ASbGnctmKIkICdJ8qN2szLlasvQcqYCGMxQQtWRm2Ee2qhbRAsozy+ooMOdPpbkysi+
	s87xDT8jMrEavyygmLljp4cwNSKxjG1daEBnyVgpjH5XzvPQ/ETPG98hbC/w9KSNTTAqOSzUwWV
	Gxqe+nWEWD25efFp4mj3mBiVyT+8gmZPlJl/5kaDWr4BoGFE+M0iG63FagqY9VWEFgGH1pM94km
	i88ysOkOK2CTrCJVZ6ODo6ddttGjXs1sS86
X-Google-Smtp-Source: AGHT+IGm95NUdK5ftP1jftdordV3iftsesNlsHHVUEP+SmlFPVMmNXMBat3YpfN3rnpVHPoTr0gIhtAtDGvUQcp/clk=
X-Received: by 2002:a05:622a:8317:b0:4a9:d263:d983 with SMTP id
 d75a77b69052e-4ab954af75emr2016961cf.22.1752663617597; Wed, 16 Jul 2025
 04:00:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715093350.2584932-1-tabba@google.com> <20250715093350.2584932-10-tabba@google.com>
 <eb9d39b4-0de8-4abb-b0f7-7180dc1aaee5@intel.com> <CA+EHjTw8Pezyut+pjpRyT9R5ZWvjOZUes27SHJAEeygCOV_HQA@mail.gmail.com>
 <b7feea89-be2d-44a9-b116-fb07d16e3bd3@redhat.com>
In-Reply-To: <b7feea89-be2d-44a9-b116-fb07d16e3bd3@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 16 Jul 2025 11:59:39 +0100
X-Gm-Features: Ac12FXx9zd9JVkXqY3lez4L9ptxfAF4QCJ83KzlvcvcQhQV6SV5GBIjlcQUn8Vo
Message-ID: <CA+EHjTzCRvg130oZFy6xRYr4WTw0afo3sjBSZgLf_4XEe8iBTQ@mail.gmail.com>
Subject: Re: [PATCH v14 09/21] KVM: guest_memfd: Track guest_memfd mmap
 support in memslot
To: David Hildenbrand <david@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org, 
	amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, 
	ackerleytng@google.com, mail@maciej.szmigiero.name, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
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

On Wed, 16 Jul 2025 at 11:31, David Hildenbrand <david@redhat.com> wrote:
>
> On 16.07.25 10:21, Fuad Tabba wrote:
> > Hi Xiaoyao,
> >
> > On Wed, 16 Jul 2025 at 07:11, Xiaoyao Li <xiaoyao.li@intel.com> wrote:
> >>
> >> On 7/15/2025 5:33 PM, Fuad Tabba wrote:
> >>> Add a new internal flag, KVM_MEMSLOT_GMEM_ONLY, to the top half of
> >>> memslot->flags. This flag tracks when a guest_memfd-backed memory slot
> >>> supports host userspace mmap operations. It's strictly for KVM's
> >>> internal use.
> >>
> >> I would expect some clarification of why naming it with
> >> KVM_MEMSLOT_GMEM_ONLY, not something like KVM_MEMSLOT_GMEM_MMAP_ENABLED
> >>
> >> There was a patch to check the userspace_addr of the memslot refers to
> >> the same memory as guest memfd[1], but that patch was dropped. Without
> >> the background that when guest memfd is mmapable, userspace doesn't need
> >> to provide separate memory via userspace_addr, it's hard to understand
> >> and accept the name of GMEM_ONLY.
> >
> > The commit message could have clarified this a bit more. Regarding the
> > rationale for the naming, there have been various threads and live
> > discussions in the biweekly guest_memfd meeting . Instead of rehashing
> > the discussion here, I can refer you to a couple [1, 2].
>
> Maybe clarify here:
>
> "Add a new internal flag, KVM_MEMSLOT_GMEM_ONLY, to the top half of
> memslot->flags. This flag tracks when a guest_memfd-backed memory slot
> supports host userspace mmap operations, which implies that all memory,
> not just private memory for CoCo VMs, is consumed through guest_memfd:
> "gmem only"
>
> And add a pointer to the list discussion.

Ack.

Thanks,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

