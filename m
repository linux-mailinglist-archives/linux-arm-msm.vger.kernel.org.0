Return-Path: <linux-arm-msm+bounces-58874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD0DABF08F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 853404E350E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1537253F3A;
	Wed, 21 May 2025 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Azip3qNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5723815C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821487; cv=none; b=BcYSDbrB0mcEdo+Yng1Eg/TRL9dysewr0aDz91CpWb56jbjoODw2HQy1ZJNuLeV/wHMbCfndl9RW/6Uiu0BnzjmWiSLaKNJ6fBqgWHvPcUpEdfh79najZWC7RDXT0I4eszLJzvpZxkLxRyRXIvOf6sGOOCZkM0nN1ilAd4ezeVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821487; c=relaxed/simple;
	bh=804um4pYrd2HSgN8dt45mOMK8q7gMzv6hk4VaVM5Lb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fgf951xxGgeqOWPb+5zVlM9ZyoF4WNfkBfgrwYr0Kwc+2bGlNA8Vn7cRlIdY1sYy7mzKPiC34s+XJjg7WhXgI2/ogU7zkLOec7sGBmw1DwMmwjx8NFOmiSaN8kF0XMhpVsoWV8ktf0ksDeYyWTpJVC93Kf7YItRcI8Vw4yQI/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Azip3qNP; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47666573242so1369501cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747821485; x=1748426285; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ad5tTssSvvJSV/hIQ2/yoAH3fpDKHmC0VyQ1XWz8SsY=;
        b=Azip3qNPDp8M/322CES1AWuvU9R+tm0Tc0W4zm8cFYrEMnKhNz8F3lFtfYkl3wnMDF
         o15iZcI8+sYF1cNMYZVIyOYtiopBY2HAj660haJQSr2/2eVEpZNFumK7R44PPpqFN5D2
         o2fHz9nqHVdhzVBlSqkc2XHHm7B2AQG9ihFwYb90JYgZHnq+PcHuL3FikOQV9SMNxjP9
         KxWoufZIGR30U6FnpRuc11+I2RpzAzzbNdsWWZ1Yoi1NdvOyDo9/CaZHwbTurVP7DDt3
         oTKjzMDIFObOJy+Vr9WrMV0FbJmoW8nbpo6IRHgtbl52esn8BVbW5oqfV5YKl58Zh+Kk
         xuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747821485; x=1748426285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ad5tTssSvvJSV/hIQ2/yoAH3fpDKHmC0VyQ1XWz8SsY=;
        b=oxKqPmO7Ma/EvyTXxt8UNJNYDP1jkCb6JOTrAPRFNAZ4XPBfQKIwrFeOfI65Hyqtrf
         BH0TI3BDlSGsvsxJp/PIL26E4moBKmT9bWnfj0Tsq1ozMDo8wjTuAbWiZbXp+gE8MOZI
         rp/+PNlmEopSIbmSNxXOxWmVlXw9nv1h1jiIyXpckr1wzwS7YQ2jOA4hMqlAETbcuIYW
         YsWKnIPQ4ryBm76IkBawS+rHbMHIfVIfpE+WcjLY9+V10isvFmJ67qxx+dq5BXIEy9Rr
         JFaECkXuVFRilvxZN/vSOQRdzANlZzg+LR0/Pk7EyMve108hb0AZiDoxmxozk6PZLSPH
         tpYg==
X-Forwarded-Encrypted: i=1; AJvYcCVsSGQ1lvVkfD2QAyE7diUKc2H5xd/m9wNE3rYosl7ugiac0SDNGaR5qdjJ3/cOz8ZJwLW6aqTByOsCwZhB@vger.kernel.org
X-Gm-Message-State: AOJu0YzIR8+7+WjolnUvLPRgMb8Eyhf7sy0JwzUjRwYpIcGIvtLaG5uA
	QuMJzadphm+JofHvVtnfs66OU3scrtCoQNvokM4PqjahELbs803k/poEIYc4Jf7dj4pfClQuCdc
	zphIsi071HBsBqokMY6ln5oBqY46mllt3B23NaxGH
X-Gm-Gg: ASbGncvgJ/BW05lyVPiZzrAoC15MbQB6ugtt8rFPS/hLAQ3zfWqYuqA/L39+Zf+17Gc
	JZNPKHutrZ7NCgxT1k08CpApWMcaeh55p75PX+j4hKmkidk/zdugy3k/6m9CU8s7ORNdMhbiDuG
	nG7UVi4D6UmRpFVtiVBiGdGH7A3fucmPYwEmwEl+w0CUF2faOEj/a0r3pWYHAPxfz5xbX6X61qA
	Jgl7kdXeVc=
X-Google-Smtp-Source: AGHT+IHYpY3Q9g3JOq11dLs1LUtNSXh9tz4zLNdyFUWuBFtv/7x94Am0WXGexcTYuCAAK3RlpzJYkCP2ifAlrCMkLPI=
X-Received: by 2002:ac8:7f4c:0:b0:48a:5b89:473b with SMTP id
 d75a77b69052e-49600c85c06mr14582151cf.7.1747821484573; Wed, 21 May 2025
 02:58:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-13-tabba@google.com>
 <fd84d609-936f-4ff2-b495-22d31391181d@redhat.com>
In-Reply-To: <fd84d609-936f-4ff2-b495-22d31391181d@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 21 May 2025 10:57:28 +0100
X-Gm-Features: AX0GCFuVxsTCj98Zq8bTXqyVrhdO3LELJGYKoRJOWR5nfIgy9REIGN4QCBpniz0
Message-ID: <CA+EHjTyNyPFyGtnPMAdAwuGrFKifAaOjmSd9oDfgVi_EjKA17A@mail.gmail.com>
Subject: Re: [PATCH v9 12/17] KVM: arm64: Rename variables in user_mem_abort()
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

On Wed, 21 May 2025 at 03:25, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Fuad,
>
> On 5/14/25 2:34 AM, Fuad Tabba wrote:
> > Guest memory can be backed by guest_memfd or by anonymous memory. Rename
> > vma_shift to page_shift and vma_pagesize to page_size to ease
> > readability in subsequent patches.
> >
> > Suggested-by: James Houghton <jthoughton@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   arch/arm64/kvm/mmu.c | 54 ++++++++++++++++++++++----------------------
> >   1 file changed, 27 insertions(+), 27 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 9865ada04a81..d756c2b5913f 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1479,13 +1479,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >       phys_addr_t ipa = fault_ipa;
> >       struct kvm *kvm = vcpu->kvm;
> >       struct vm_area_struct *vma;
> > -     short vma_shift;
> > +     short page_shift;
> >       void *memcache;
> >       gfn_t gfn;
> >       kvm_pfn_t pfn;
> >       bool logging_active = memslot_is_logging(memslot);
> >       bool force_pte = logging_active || is_protected_kvm_enabled();
> > -     long vma_pagesize, fault_granule;
> > +     long page_size, fault_granule;
> >       enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> >       struct kvm_pgtable *pgt;
> >       struct page *page;
>
> [...]
>
> >
> >       /*
> > @@ -1600,9 +1600,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >        * ensure we find the right PFN and lay down the mapping in the right
> >        * place.
> >        */
> > -     if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE) {
> > -             fault_ipa &= ~(vma_pagesize - 1);
> > -             ipa &= ~(vma_pagesize - 1);
> > +     if (page_size == PMD_SIZE || page_size == PUD_SIZE) {
> > +             fault_ipa &= ~(page_size - 1);
> > +             ipa &= ~(page_size - 1);
> >       }
> >
>
> nit: since we're here for readability, ALIGN_DOWN() may be used:
>
>                 fault_ipa = ALIGN_DOWN(fault_ipa, page_size);
>                 ipa = ALIGN_DOWN(ipa, page_size);

Yes, but that would be a change beyond just renaming. I could
introduce another patch to do that.

Thanks,
/fuad

> Thanks,
> Gavin
>

