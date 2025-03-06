Return-Path: <linux-arm-msm+bounces-50457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F6BA5454F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 743373A39C3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5FD2E3369;
	Thu,  6 Mar 2025 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="COQKXmaZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582FE1DF24E
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 08:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741250961; cv=none; b=ncxwPuqW+oyfPqlSsuH96BCrSIc2+lHR/bjHFGkvZUjYQqUaWFNBnjCHOE3kl7FRpsSHmu56VsY2mp4iwl+MWAsjimnOz2rg4czKC918KxbzhrYcmmuBmntvQpfJ9rWbwYb1LIUJnFD8O4uXlWCimZ9DNMDVCojVQTS2w+y3lIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741250961; c=relaxed/simple;
	bh=IHii5Uw4pnSE4gvuurjPHp1mIyurMUIqZEGJnfAAYeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUKf7lbenPNljvgLC5mbY5a+aoG/W9Sb/Z7w/OS/QtdtzRWDHihKQhg3kRt1Xd/G23/K7s8E0LIVVHDhG+k1dH+Ac14lyWQ69vLkJb+Ij0JpxeK58Fu6EWQsUyH0uXggOmXqfJCqRHCOr5Y+N8B9/YFO4UmxWxfLSLxm/TM8YEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=COQKXmaZ; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-474e1b8c935so217101cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 00:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741250959; x=1741855759; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YaJ5imc2Ngyr8E9KKVZNLqQ9tGVAPYT9wXbjUhwizE8=;
        b=COQKXmaZBsLQSe0iqKknfx8pfZ+40mzwCoggyK4LQjo/4L5xLxE5ZN3wwGkQvtsuff
         nmGQMKFtWW2TkTulXFK2JUkp2W4ylXVRK0qgObVbbB1Axwb0DLCJMC6OcMXh6bldAtuj
         dlyapg04lxoSIbqsl3l/2sTN5FcXHAlCCn679jiMr2wt00iGO3bjyQ76IZMYE0mnxiK7
         /UlQU2ro9uJfpP80F7hhECB0znr8/dCHdNWMO00rmFZ4jID8bMaO1YavwTpcdc49zP4l
         wPvjMBEqRdkT/L8rHJugPiTTFcP2mDzEm2Tq1amzgg0ml+KNRBIsRxpBXq+z4MBMP8Fo
         HBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741250959; x=1741855759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaJ5imc2Ngyr8E9KKVZNLqQ9tGVAPYT9wXbjUhwizE8=;
        b=cIrRHQlJte1DutPNraSMlMVSC4BnOThDqP2IuCR3F+GhsU9NeJ1tRLQQTEbzj68ig4
         dnbRq7e7Yuzwb40zzKwt4fF8BeVO0ynnu4Htxv5MhfVQtY4NMvIyDy80iXWlcRaLRkV0
         E8iSsqRY67FozgrdBf2+FaEwb1thMtu2K3MgCJebFoIqKw9RRl7L9ySQ5Ee5VdrH/1A0
         2fKm6vZ4+luRyFmNk90qDdkMvaxetNMvob1EY7+K0qgNMVMbACHFqvW996bbSc3oljtN
         tfnNS3ZVjDjf4E58t80NVYYcLQhliCBdPXyzCvSuOjgBVW4I6bYpDpKz6pldDuNfAg3Y
         LnKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRJFFzDCzQS/yYneBeCpzTZWA1dgvWRww9vGMPD7d5Jgh+nphObYOYEe6/vZP550O7NZfQdZr0bDQe14Xs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9erdYU3cdac+eMmpHjoWytHqJUWfqwAd4tB7LN2trexaOSd8O
	nffylp4HhjTyjb+tOYGKOQ9B4Jq4IqWPourcDIauCe6ziO2LQGcUR7uEierlyl00HIOm2W2gLUd
	cQsvPjHbozy613FEV8RNbafkSUZUQWIt79XDi
X-Gm-Gg: ASbGncsn5YQl6XtfqXMSGIyuC7fDwYY8XRhh9gycfLPvgkUq1fPkSfIJ2Ncf75c4tKs
	yWb4iubX69ExOt8VMWCs66OzENDM3+iBZpPsX9CB0YnP1X8oChEY6RAPt1WJyWZX/Fsb0glxWFL
	vLp/kuOtaA166lfYDkrY/4fH7d
X-Google-Smtp-Source: AGHT+IFVQ5+MnT7k0zC/yN7YRHNio4wgp4bB/nSw7B4UORXArvo/ohKiKOdEwTR0GaYylL+N9lYiPAGglmshKYyXfr0=
X-Received: by 2002:a05:622a:11d6:b0:474:b32b:8387 with SMTP id
 d75a77b69052e-4751b019d48mr3161521cf.4.1741250958810; Thu, 06 Mar 2025
 00:49:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303171013.3548775-4-tabba@google.com> <diqzr03bt4ay.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzr03bt4ay.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 6 Mar 2025 08:48:41 +0000
X-Gm-Features: AQ5f1JqHOa32gTN9SxcdVcOqUtRaTjP8QpQ0nQ6Rs8sRUeR-mnCOcOtr8-vKQjM
Message-ID: <CA+EHjTzOGuCvN91WS76Bx1dBOQNxv+Tqz=gTc85bVvjCrF0hyA@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] KVM: guest_memfd: Allow host to map guest_memfd() pages
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Thu, 6 Mar 2025 at 00:02, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> > <snip>
> >
> > +static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> > +{
> > +     struct inode *inode = file_inode(vmf->vma->vm_file);
> > +     struct folio *folio;
> > +     vm_fault_t ret = VM_FAULT_LOCKED;
> > +
> > +     filemap_invalidate_lock_shared(inode->i_mapping);
> > +
> > +     folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> > +     if (IS_ERR(folio)) {
> > +             switch (PTR_ERR(folio)) {
> > +             case -EAGAIN:
> > +                     ret = VM_FAULT_RETRY;
> > +                     break;
> > +             case -ENOMEM:
> > +                     ret = VM_FAULT_OOM;
> > +                     break;
> > +             default:
> > +                     ret = VM_FAULT_SIGBUS;
> > +                     break;
> > +             }
> > +             goto out_filemap;
> > +     }
> > +
> > +     if (folio_test_hwpoison(folio)) {
> > +             ret = VM_FAULT_HWPOISON;
> > +             goto out_folio;
> > +     }
> > +
> > +     /* Must be called with folio lock held, i.e., after kvm_gmem_get_folio() */
> > +     if (!kvm_gmem_offset_is_shared(vmf->vma->vm_file, vmf->pgoff)) {
> > +             ret = VM_FAULT_SIGBUS;
> > +             goto out_folio;
> > +     }
> > +
> > +     /*
> > +      * Only private folios are marked as "guestmem" so far, and we never
> > +      * expect private folios at this point.
> > +      */
>
> I think this is not quite accurate.
>
> Based on my understanding and kvm_gmem_handle_folio_put() in this other
> patch [1], only pages *in transition* from shared to private state are
> marked "guestmem", although it is true that no private folios or folios
> marked guestmem are expected here.

Technically, pages in transition are private as far as the host is
concerned. This doesn't say that _all_ private pages are marked as
guestmem. It says that only private pages are marked as guestmem. It
could be private and _not_ be marked as guestmem :)

I probably should rephrase something along the lines of, "no shared
folios would be marked as guestmem". How does that sound?

Thanks,
/fuad

> > +     if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
> > +             ret = VM_FAULT_SIGBUS;
> > +             goto out_folio;
> > +     }
> > +
> > +     /* No support for huge pages. */
> > +     if (WARN_ON_ONCE(folio_test_large(folio))) {
> > +             ret = VM_FAULT_SIGBUS;
> > +             goto out_folio;
> > +     }
> > +
> > +     if (!folio_test_uptodate(folio)) {
> > +             clear_highpage(folio_page(folio, 0));
> > +             kvm_gmem_mark_prepared(folio);
> > +     }
> > +
> > +     vmf->page = folio_file_page(folio, vmf->pgoff);
> > +
> > +out_folio:
> > +     if (ret != VM_FAULT_LOCKED) {
> > +             folio_unlock(folio);
> > +             folio_put(folio);
> > +     }
> > +
> > +out_filemap:
> > +     filemap_invalidate_unlock_shared(inode->i_mapping);
> > +
> > +     return ret;
> > +}
> >
> > <snip>
>
> [1] https://lore.kernel.org/all/20250117163001.2326672-7-tabba@google.com/

