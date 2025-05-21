Return-Path: <linux-arm-msm+bounces-58884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D40D5ABF278
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80B2D4E45BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0662609F7;
	Wed, 21 May 2025 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4JBxJzie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4522609D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747825876; cv=none; b=guDYbGGbPMiDF7XGur+JJeTv9oGnMbtf+GBPygudNXDQoDWXQ79ESoT1yrbgzx3y39LrZ3tI3ty/Q9KCHvdwDte0Wf7vNQZAV+hRisRt76dLocpdK46SohXkSoqBY1nuIIibYcAl28KSH/xY0mhSGuGZs37xDpx8D9tVP1YTp0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747825876; c=relaxed/simple;
	bh=tQ/q7iXtF5UPGh8+ohOv6KaZ9+fEVRStSIj96suCIB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9DaHsV9NIiPbAT90sBbmYGOqvrUO0GbSVIBvfX8JtCFt716h7kbupG1RXR0AYV/ZrBGzeBzXXl6P0brAxfgqt/uXC8TTZniWCU0xrI/470AV3cOn66wHJux1viOKc7idxUy/GthsRBBmbiP0T55CNeXPE2WNstARtvjhIAwmTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4JBxJzie; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47e9fea29easo1646531cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747825874; x=1748430674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ctqvgl2a53wbdaZxWTIiQHG1DssGpGTbCqmvno6TQ2s=;
        b=4JBxJzieXV4M+/XM1CzLtAPCSME2CcMGJZsxWzk2sHqB7d6VuoNX764w3qez8pln27
         3atpkGykCF03eq88vqbRkPvZL35ytjfSJuJpJ9kjm5Q2d4J1zQYiBLEffXUtY5MK+TkW
         fXXOLaVKkmLz5l1Ixaxh1WDwfBEFNKnntHMu0VXrP7QJr8TxO7QqmY1N1ftkqilWBUyQ
         7cehPPOnlwd/4/daATpNIWG9Rh4WNNc4Frj4gmKvjgk9GwNrVtq30Ftjgaxfg7c+s5T3
         FBqIIL9IhJIpeZf+oTy2lvbhd8BvoL3OlbgT3oAsjEhG6iXg4rqjlj8fsbobdDRtgB94
         LCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747825874; x=1748430674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ctqvgl2a53wbdaZxWTIiQHG1DssGpGTbCqmvno6TQ2s=;
        b=lNyQwoG4Pqcl7vvMrZ73/1AhxpQYCiKp3qwpuor32iHUFI44QuXz5i8r4eMRSRePOE
         p2fhxtk3fwiBFm/ErcJPVyRr/wGm9FfSx9x+G8jj4TndzQhnO1P80X1W9dE+beOhjlNy
         EkmvQS1VJPZYPiuiPkJUZ0hwsIG3bRdzVb1WCmnJEY6Y+CB6bZInwoXlGjkmpL7LxrJg
         1gLH2Yx4tpGNpDS1C+5RiGmbVPLYF0vzzhd4ijABfQsI0/JRudkqM/Uj3iP6gQE6WR5w
         30+RRnleEw+98HBMOVw1TxDwpj6OlD9aGC9HO4KD6AQJ+uAn8MMwqKyvvY05tPCmvWhY
         03JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs845B+8yo36qVynZSNB8zGCfoM1YnZqePRuH9h6thEm8m4j/B2tDGHWTqng1/+Qiy8S8SH4HhXG90FJfV@vger.kernel.org
X-Gm-Message-State: AOJu0YzX40r+0QkWjjL16ko5f4GK/SWpp4T/3HEClLf7ybnooR0Q4eps
	qvlH0GiUQw9KwLRBsE2BxN8xg/R2K75FSTELSRSLNY+Jdqh5xosSLMmVhl6tCWSeGpzjBT2BslO
	wQ32m9fEn344W9Ug8YG0JhyRYD+ROdChm6zG+Hzkd
X-Gm-Gg: ASbGnctkFBb3pETk+q+f3+kCUv5SLhOzWFZN18Ji5YP6qh4qssOrE/vbWwV1DkPV03f
	bMyR9rnGg9b9TjH7bi+NBYUmI+lWIJOeMixjhLdyBhNoUQdgIUUlntYAmd+f1ZtJpxpkJoTj/Cz
	Pt2b3KKxYqme0FFE0hTG3/8LPO7NQMq53uxUxAzRusQQs7ZlCWoPD9RSuEaPyP78nf/BoQZWjU
X-Google-Smtp-Source: AGHT+IG9JRLddwi7FWo7PGi8OFQqYZvIkWzFiMZ2eJyY+7GX2T8rNZIySJy/QKfkLbtNb5b9H6nducMJim1V/SX7ZEE=
X-Received: by 2002:a05:622a:13cd:b0:47b:3a5:8380 with SMTP id
 d75a77b69052e-49595c5d9f6mr15353851cf.28.1747825873334; Wed, 21 May 2025
 04:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-14-tabba@google.com>
 <8d6eb79a-a68d-4116-bb42-ed18b0a0d37d@redhat.com>
In-Reply-To: <8d6eb79a-a68d-4116-bb42-ed18b0a0d37d@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 21 May 2025 12:10:36 +0100
X-Gm-Features: AX0GCFsGsg3FxndHSZGJf7TgUxTEca7xqtxeGk7gRA7wW8yw3Stt3ibiefTaF9w
Message-ID: <CA+EHjTyPp0OzbvvwG6AB+GJ9nSXroeJ6M2EnmERqvQ+sO+4E+Q@mail.gmail.com>
Subject: Re: [PATCH v9 13/17] KVM: arm64: Handle guest_memfd()-backed guest
 page faults
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, 21 May 2025 at 09:04, David Hildenbrand <david@redhat.com> wrote:
>
> On 13.05.25 18:34, Fuad Tabba wrote:
> > Add arm64 support for handling guest page faults on guest_memfd
> > backed memslots.
> >
> > For now, the fault granule is restricted to PAGE_SIZE.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
>
> [...]
>
> > +     if (!is_gmem) {
>
> Should we add a comment somewhere, stating that we don't support VMs
> with private memory, so if we have a gmem, all faults are routed through
> that?

I guess this is related to the other thread we had. This would handle
private memory correctly. It's just that for arm64 as it is, having
private memory isn't that useful.

There might be a use-case where a user would create a
guest_memfd-backed slot that supports private memory, and one that
doesn't, which only the guest would use. I doubt that that's actually
useful, but it would work and behave as expected.

Cheers,
/fuad

> > +             mmap_read_lock(current->mm);
> > +             vma = vma_lookup(current->mm, hva);
> > +             if (unlikely(!vma)) {
> > +                     kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
> > +                     mmap_read_unlock(current->mm);
> > +                     return -EFAULT;
> > +             }
> > +
> > +             vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
> > +             mte_allowed = kvm_vma_mte_allowed(vma);
>
> --
> Cheers,
>
> David / dhildenb
>

