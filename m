Return-Path: <linux-arm-msm+bounces-58178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA16AB9695
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 09:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33F8F1BA1C1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 07:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B9C224248;
	Fri, 16 May 2025 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l0ph8pTd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F95218AB3
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380716; cv=none; b=ZPRHDZe+9/1iKmhxbIuqFq4hQglUaALmlSGtjQrmZ+6skpo82Fkf+uI342X/IOoz5ckT4v10gW1YcHGo67g8Ze54gX0vfVcq04jxdGoVfGlLTQMuxL1o+VFuZ6vsjECVbuRg8VDD5Yy3YWCB+wsvTPLilWs2IHEy6Vi7q9aGcVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380716; c=relaxed/simple;
	bh=LhfYgGIX3YUwIHXN3lQkb6hB2C/8lRXsP6fXy+yG9z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNMRNscox7gm4f+NwNnqhBHxcPKyFc7wYlbNkbMdUkKXdL/+OzpDD3pPqwyBZ6OQT9ubSbUg5N9D6R2DlaSSh8bXHCJm2dfLSgQvACqk344Q3id4SR9jpOGtA7ohL+I4pp5ZTTHGPVsw9u8dG3z8CZOITQFpPnv1+OANRwkpnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l0ph8pTd; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47666573242so249431cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 00:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747380713; x=1747985513; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iA5Rlo6gvEycOSiSoroWMXnzZM7Pfdgqe3zhq/cG5C4=;
        b=l0ph8pTdIu7sg28rAVA76lRc1S2DHuumJFo8i6VmrZMxQV4kLd+ISADtL2TPtSghw0
         HL4DgaUDkCNmtcsE4OjLbXw4bGyfKJcKK9iSHtjNX96Qh/50pKhF/0WoJmMbEPvPC3M9
         G0LvTKk6tBvemwT6zVa0cRk5+O+QDvM1U5qd9eZRvhi07yRaJaJ1JqtRxVJJ62liFRlm
         Mn76Ze8o0Itnrb+ruW3AuFk5qZM0/CKJpY+nio9C1LL2e6R9qIQmvcemCKK60HutINMf
         l2cMHeEewdib4VhEn4Pv6sBN/BRr6TMgHmfFT8HpyvDiRptpTICZPlfG3pWdUZdCtQG8
         5SNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747380713; x=1747985513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iA5Rlo6gvEycOSiSoroWMXnzZM7Pfdgqe3zhq/cG5C4=;
        b=WxPjWeCXeISEeBSqKB2OJdND9MpfZtycnBpI3aoKfTPG7rOrSfE9MvboboRzjcD1hI
         SwBfS/3aPdPn2S0kOcKbgFXPN3n/n5F+DwgkB+w1M00VC0KTsdJkyY36ZsKjhZcJXJtY
         597frdsMHRRgrK6ow/wZKpnToz8b66jLmG4/U1VNUzXwFkFSlu38yV6XQRmi1HfTJdAO
         TSK3qFBMnUuRbiubkTDn8X07SjoBHnaFOTOHXjEwXk2VS4TeCRw1YxT8HGBdFSclkpph
         Nyl80E3ohI3jvhn/hn8Ql2n5+T0hth459cQTNlS1OOH9nxqe9ZHev3sPia6x8+e3a4X/
         uhNg==
X-Forwarded-Encrypted: i=1; AJvYcCX7oNuX2EStJRv3w0aXMdsaJXHNYA5hehxAn12wtU46k0gnlA+f4NHx62mb0HORjUPwGKXyJPk6QU1EGjNe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy61pCLnlDYVkc047r6Td5bbQbS0DBvWuRZlDwVhVAAoOgL2ET9
	PZqOBrE2Sdcox5R4HOnI3/PX1Lz+0nlAm9UB35twBhttg64R9IIU1QuvHXzULROBMoNA6/aaMXa
	rP0WrjExbWDLMTitfKemOgZQa7AYNS15E/XviKpYN
X-Gm-Gg: ASbGncuEVrYqiRKji3GiIZJ4LpZoKqImZQp1Nfq445+sMIM+KfPLB5TTSZS8vAwKAfR
	bxnQxGL9TIPlJEbFwav67ynV8FcTlDBu5tSZfbT3Z2Fle1z9bLfGAR4WjsXJ8c0HnvVDJehJq2t
	j1H4lUsjWPo0c3N55ONWntz5YUAvqZZ20pDfJQgoBswDPz1p39JVZdvTRGPLgVlGsmQ+Qe0A==
X-Google-Smtp-Source: AGHT+IFxiV5iPu5dQEBJoe6TlPITSBOzNWDezJ/h5fJxvEvCNoIQw1B7R4bYKnaDO/kUBLpxtnmGTwV6DQlu2P800G8=
X-Received: by 2002:a05:622a:13cb:b0:472:538:b795 with SMTP id
 d75a77b69052e-494a1dceb95mr7011001cf.22.1747380713230; Fri, 16 May 2025
 00:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-8-tabba@google.com>
 <9a2431e0-252d-41c9-a91d-9e02a8779e8c@redhat.com>
In-Reply-To: <9a2431e0-252d-41c9-a91d-9e02a8779e8c@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 16 May 2025 09:31:16 +0200
X-Gm-Features: AX0GCFtTFrYptZZw3YHVysqXM1_O1MRDVTMCRaXQ18VXjYBBDwJ72qpImK1p7N0
Message-ID: <CA+EHjTxCnBB3w8anujPkfarbq3K7pOu7bFGY3h9-v7gFaORrsg@mail.gmail.com>
Subject: Re: [PATCH v9 07/17] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
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

Hi Gavin,

On Fri, 16 May 2025 at 01:42, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Fuad,
>
> On 5/14/25 2:34 AM, Fuad Tabba wrote:
> > This patch enables support for shared memory in guest_memfd, including
> > mapping that memory at the host userspace. This support is gated by the
> > configuration option KVM_GMEM_SHARED_MEM, and toggled by the guest_memfd
> > flag GUEST_MEMFD_FLAG_SUPPORT_SHARED, which can be set when creating a
> > guest_memfd instance.
> >
> > Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   arch/x86/include/asm/kvm_host.h | 10 ++++
> >   include/linux/kvm_host.h        | 13 +++++
> >   include/uapi/linux/kvm.h        |  1 +
> >   virt/kvm/Kconfig                |  5 ++
> >   virt/kvm/guest_memfd.c          | 88 +++++++++++++++++++++++++++++++++
> >   5 files changed, 117 insertions(+)
> >
>
> [...]
>
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index b6ae8ad8934b..9857022a0f0c 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -1566,6 +1566,7 @@ struct kvm_memory_attributes {
> >   #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> >
> >   #define KVM_CREATE_GUEST_MEMFD      _IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
> > +#define GUEST_MEMFD_FLAG_SUPPORT_SHARED      (1UL << 0)
> >
>
> This would be (1ULL << 0) to be consistent with '__u64 struct kvm_create_guest_memfd::flags'

Ack.

Thanks!
/fuad

> Thanks,
> Gavin
>

