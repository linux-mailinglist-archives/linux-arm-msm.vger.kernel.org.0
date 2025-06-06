Return-Path: <linux-arm-msm+bounces-60460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3DAACFFA3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 11:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41C573A36A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 09:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C50C286423;
	Fri,  6 Jun 2025 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6U3bP52"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1CE286404
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749203338; cv=none; b=ji2Y8Y95/NEnpOzPsbw50g96Xb8tCBnQh1dhx/NVWjnLw53pospdb86cibfehJbqYFNHCbZcxPXcnPB+JYvzUL/oO7uCyMOBxNCHHanJoRQeRUjJi/1HDUn0xk/Hfchp5QgFc4bgrCLPJOA1iWf7Q3mTIWcMHOQAEnxdpNM/TvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749203338; c=relaxed/simple;
	bh=YKrpoWufmzB3xu8DloFpS79I3uBwj1qNWUgY+1KOZtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=By9v05LNGe2u7PH5GXqxjJv5Cb4H+B5NO5FfYew+HlY4cp++5kcx5g5QEygh0A5jeva+5wpDcWGtpfJOzhL4Tr2ZLNvw+nj2gEYO1Lg5FK/FBZtZ20OFNGGkOvs2+IzBY7SO9YqECvpNW8dGq69nLwHKTeXhgHkWRsrq1xovslc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6U3bP52; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a5ac8fae12so349541cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749203335; x=1749808135; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LCDKfsXlZzurcM1ezkFJ6H0HklmVMiMXd+AkoFUM1Qc=;
        b=t6U3bP52vl9qtwgl7O1QnXLMSzjbzltQoK1PlCJUtzTmz71f6aH3nuiv5N3+tyyK7M
         E+jC5YIpFPrhm/L5qAkaPbGCBJsd9s5HgDqXm9SMNgQ4EQrwrk0TkfMAizlatlb+js87
         BG1lM2KemAh48S5DLgel0UPuiuHAgv5f03ta7oy9EYCjhPnIEV6JLs6Lb0yIkiW8y0ti
         /HkOl1stmQuSabtpj3pJKWBBW6FIC+XhfxmNY1l3rRsySgFXJu8H3Jivv1Sqy+zZdqTp
         3M/b/Eett6VY1yK7qw2HZhx9GHVWcfk/R7/q8mgyO3pFh4RWynB7yeYCOkBJLETCwyDI
         F+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749203335; x=1749808135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCDKfsXlZzurcM1ezkFJ6H0HklmVMiMXd+AkoFUM1Qc=;
        b=XZCFf1ae37enWqJa0EgxBzLfVrRineBa+dNBS3WQtVo3lo5UVzJsWkqCqQEHZW6VFi
         8TjBmtLkbBAUMReeXshd0PNpVTxMvIKalKh1wq3HjcbJ4EMCl/pcKjcUEciIYhelewox
         C/K8IrGdabU6EWsqVAAxTu7ombyuRtpNDOl3bzoBb0c5wsrmmQUgH1OzX2AoAwj78GM+
         nKC8Vd8wA0aiS6q00GaxnVyFUmqDFqnk/TxC8IRriafNaiyMvZ/eArCuUiFOImE/63c6
         Cxn+/kSDHeTYyzft2qdx83R67EiiCt9XlWAsZb0lI5UKIsusm12fUqYXx9rIGZ9ytD2R
         N/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTQuPBerVD4M1hQWdO25TAiO+gKjImsFlXibX/hIWbwR9P2blei1krpCU79yVCXitdBZm8QHxhhoXEOAPK@vger.kernel.org
X-Gm-Message-State: AOJu0YxokS0ToLRehcGbWJ7j6GMUBecQ6MPma3GRjfRnRUW1tpJDJj68
	Eri0Rh1DNdMSZmVRl0j7uz3IfGZHTpEs8GmmJTsd4lIZdHhOggUiXO3IqsLT7tbVhqHWq3uoeGR
	Ij38lhfBItX9gQSDCFw+Ow8KBy4E0dpRgW91LrtKeE1FZ/AV9+Ipq8yD53HfACUFC
X-Gm-Gg: ASbGncs3OARze6xsj5MxvjSks5ynTG3L08jOBbi6INhpM41A+Xun7ltAbcebs1Z9Uw6
	To2yqhd0XkxqF6VJUy0My2cS3Rnp3QG4HyrpqKFh4xziSbIpupYflzRTdaLHlZonVpe5wZUA+m1
	S/l2kAPS4ysqQyD8q/feTmZgTdF9VnJk/H2ODXNF9mIUc=
X-Google-Smtp-Source: AGHT+IG6E/J9MfX2i8oW0aNRitzNLiDBnW8BoUvZFi+PsgUTsFLCcluC/1qihGgfccxw0D/xPEa7YdyrZSgObmD9Gpk=
X-Received: by 2002:a05:622a:3d2:b0:4a4:ead0:92c4 with SMTP id
 d75a77b69052e-4a643a2d4camr2437051cf.5.1749203334828; Fri, 06 Jun 2025
 02:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605153800.557144-1-tabba@google.com> <20250605153800.557144-12-tabba@google.com>
 <aa9701b7-a550-46bf-bb2f-b73462671c7d@redhat.com>
In-Reply-To: <aa9701b7-a550-46bf-bb2f-b73462671c7d@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 6 Jun 2025 10:48:18 +0100
X-Gm-Features: AX0GCFsIRwALL9qxco1UxN6YH4tCXZf-K_YUSzqBvF-siNiwfomILhB3vusRSbI
Message-ID: <CA+EHjTwVHg=-uPwDuQ+UF-XbwTR87WtvCWcbwb9HdQJwcDY86Q@mail.gmail.com>
Subject: Re: [PATCH v11 11/18] KVM: x86: Consult guest_memfd when computing max_mapping_level
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jun 2025 at 10:14, David Hildenbrand <david@redhat.com> wrote:
>
> On 05.06.25 17:37, Fuad Tabba wrote:
> > From: Ackerley Tng <ackerleytng@google.com>
> >
> > This patch adds kvm_gmem_max_mapping_level(), which always returns
> > PG_LEVEL_4K since guest_memfd only supports 4K pages for now.
> >
> > When guest_memfd supports shared memory, max_mapping_level (especially
> > when recovering huge pages - see call to __kvm_mmu_max_mapping_level()
> > from recover_huge_pages_range()) should take input from
> > guest_memfd.
> >
> > Input from guest_memfd should be taken in these cases:
> >
> > + if the memslot supports shared memory (guest_memfd is used for
> >    shared memory, or in future both shared and private memory) or
> > + if the memslot is only used for private memory and that gfn is
> >    private.
> >
> > If the memslot doesn't use guest_memfd, figure out the
> > max_mapping_level using the host page tables like before.
> >
> > This patch also refactors and inlines the other call to
> > __kvm_mmu_max_mapping_level().
> >
> > In kvm_mmu_hugepage_adjust(), guest_memfd's input is already
> > provided (if applicable) in fault->max_level. Hence, there is no need
> > to query guest_memfd.
> >
> > lpage_info is queried like before, and then if the fault is not from
> > guest_memfd, adjust fault->req_level based on input from host page
> > tables.
> >
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Co-developed-by: Fuad Tabba <tabba@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
>
> [...]
>
> >   static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >   {
> >       return false;
> > @@ -2561,6 +2565,7 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >   int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> >                    gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
> >                    int *max_order);
> > +int kvm_gmem_mapping_order(const struct kvm_memory_slot *slot, gfn_t gfn);
> >   #else
> >   static inline int kvm_gmem_get_pfn(struct kvm *kvm,
> >                                  struct kvm_memory_slot *slot, gfn_t gfn,
> > @@ -2570,6 +2575,12 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
> >       KVM_BUG_ON(1, kvm);
> >       return -EIO;
> >   }
> > +static inline int kvm_gmem_mapping_order(const struct kvm_memory_slot *slot,
> > +                                      gfn_t gfn)
> > +{
> > +     BUG();
> > +     return 0;
>
> As raised, no BUG(). If this is unreachable for these configs,
>
> BUILD_BUG() might do.
>

Ack.

> Apart from that
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!
/fuad

> --
> Cheers,
>
> David / dhildenb
>

