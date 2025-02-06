Return-Path: <linux-arm-msm+bounces-47016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E9A2A50D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 10:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA6D9168764
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 09:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C1D226193;
	Thu,  6 Feb 2025 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f0WATB7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957AD226198
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 09:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835279; cv=none; b=KR9b+BMnWi1koG8G7Y13U/u1IWWkrxyRNk+20XiO/1pKOhaGuZ/yPsBLm0By0NWcW7olWAgx0vTWM2JkreQZF7irtA0EeHQC1sozQrAMFxeZqIZpIsHT0i3hEF3DCniFAbE/WD9nnC7/Jjq898OvDKGbaSaSIY9fHOfNSZNyzrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835279; c=relaxed/simple;
	bh=CJXXj89u8MApNW9Ge6KcavC3gNPuVFKXTr48arVRo2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnIO1/mmzGNVz3zucyRvttZuIEugenMc9JdrzOpBtyCeqaUrQMolyQGMWn6fezTfCVeKmbeON8L0ZhIoPAJ14rwrULAHSy0X1FG7hmR3xnCf3kmWtUcj2tbzWzRpUEP7ag2rUzJwkI4gaucI8cMFcEicOz0yzfk5AlWjjoJ8U2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f0WATB7y; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4678c9310afso143411cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 01:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738835276; x=1739440076; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v6IYTK3nh6GBIDdKkLoNwhq9MdnRnCbo7ufzWqCaI98=;
        b=f0WATB7yCTKG0n4awq3uz+Au4Uck7TjUmLZHjFGqvNeiTvfi6/ne0f3vYG1eYgO6Z0
         m3OxAgmHXCu5U/WGQ6VBetxuadp+2uAzGdqF324kZo0hhQoWjHxXDWHvT7TEVQdORpMA
         aQ0zDpSsg2BfwwIQ1yXVKzri8ZpNS+umjKBkgk/XUD7FuNltYujqKRBwpK+d6B02b0IA
         wua1O2if8eV0rbNykQH2RypwsVommVPGnfL39BZR0xk6bPSleUm5h90ZnTYCyEY0PHTE
         jCu/uSdAHooz0URJzMoT1OoojGGQx/SbItZGRO/1kfTApAfhVrJ2G7A1THnJBdfuAGn3
         WzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738835276; x=1739440076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6IYTK3nh6GBIDdKkLoNwhq9MdnRnCbo7ufzWqCaI98=;
        b=wpdAxm5paO8m++CG3Y8Xh+hFsexZTteyn/3gK8T3Oe00Zvyr4a+Sx8/27EODmaqOg+
         EW8cH7mJWHsqRprOr5nYbQun+Fc0/7Kvn8iOxX+FwyBeqOjTr9yXQ+5EapsKJbbNce7J
         zs7sRKS9gnLp1LbVGIbWQMHfbOMBm5O9g1XDRXO9T99tFdzuMTAoe6HJeJQ83y8/qOMi
         7IU6N4snZygo4F3w59pb+IIgHFCyRgLFA6WmmG269XX4K0flmrsZNLcMppj/WWiypv2O
         Z/HKP1f2RkM/xgT3BJ+dQYO/Ig0BjM0n64utSTlIbsUE2kdgHoklKcleeezsE1tsMCII
         Cv2A==
X-Forwarded-Encrypted: i=1; AJvYcCVbxWH2PNNnZKfiqQeBfLXEKChs/6zzftJGz8/Cnhfejome9l6+3F/XwfgwAdoHXpmRc1OLpDlSPTH/w/LD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ryuYbzHzMmynZrkQ2XYMdPq6E72Q0DdtLGsVlXW94eTO/d3w
	PZ4TXpxgfej1V51r70NCGDxIMstNPpG9zJvFRDppsTGQWYdXxGcHWnfzvN7G/M4yf26xhBSMIK+
	72rY/yavr5mPAXBiI55FJUpw7ElAs0cscUGb6
X-Gm-Gg: ASbGncuUfNetCncRJ8KCaUU1u0FsXk95JU01V7FBRqMpoXfBddi0wWr1XTUOEz/zLPi
	7IxLxgXBxLoYAOjDqGlucqjsAORAGN08WkFp67oS2WShoB0mmVVRJmkRY1XghyTsvPUMmHPWY5o
	3FgRp/Dke1021QZ08sUS+hBKCbiw==
X-Google-Smtp-Source: AGHT+IH2kNovjjTMjexpacUe+GJCihFf0EH6lWEtv2ZG7xpTLVuPcxkrF5CQiQscN7rUc6TK6bBKq+QdNr3Yq+jW6tc=
X-Received: by 2002:a05:622a:1311:b0:46c:791f:bf2f with SMTP id
 d75a77b69052e-47106bf403bmr1991231cf.1.1738835276192; Thu, 06 Feb 2025
 01:47:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+EHjTyToQEHoKOQLgDxdjTCCvawrtS8czsZYLehRO1N_Ph2EQ@mail.gmail.com>
 <diqz4j17sqf3.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqz4j17sqf3.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 6 Feb 2025 09:47:19 +0000
X-Gm-Features: AWEUYZlPwv3dT-XNtR8vcSj1WxKNk3oUMwXJf-eGk9uS-zbbUk_RuCmnuO5yF_w
Message-ID: <CA+EHjTycQQ1Bx323n=w=Apzrr1Y9qk4dxQkcsKWKCfqRNF+Z4A@mail.gmail.com>
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
To: Ackerley Tng <ackerleytng@google.com>
Cc: vbabka@suse.cz, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vannapurve@google.com, mail@maciej.szmigiero.name, 
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
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 03:28, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> > On Wed, 22 Jan 2025 at 22:24, Ackerley Tng <ackerleytng@google.com> wrote:
> >>
> >> Fuad Tabba <tabba@google.com> writes:
> >>
> >> >> > <snip>
> >> >> >
> >> >> > +/*
> >> >> > + * Registers a callback to __folio_put(), so that gmem knows that the host does
> >> >> > + * not have any references to the folio. It does that by setting the folio type
> >> >> > + * to guestmem.
> >> >> > + *
> >> >> > + * Returns 0 if the host doesn't have any references, or -EAGAIN if the host
> >> >> > + * has references, and the callback has been registered.
> >> >>
> >> >> Note this comment.
> >> >>
> >> >> > + *
> >> >> > + * Must be called with the following locks held:
> >> >> > + * - filemap (inode->i_mapping) invalidate_lock
> >> >> > + * - folio lock
> >> >> > + */
> >> >> > +static int __gmem_register_callback(struct folio *folio, struct inode *inode, pgoff_t idx)
> >> >> > +{
> >> >> > +     struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
> >> >> > +     void *xval_guest = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
> >> >> > +     int refcount;
> >> >> > +
> >> >> > +     rwsem_assert_held_write_nolockdep(&inode->i_mapping->invalidate_lock);
> >> >> > +     WARN_ON_ONCE(!folio_test_locked(folio));
> >> >> > +
> >> >> > +     if (folio_mapped(folio) || folio_test_guestmem(folio))
> >> >> > +             return -EAGAIN;
> >> >>
> >> >> But here we return -EAGAIN and no callback was registered?
> >> >
> >> > This is intentional. If the folio is still mapped (i.e., its mapcount
> >> > is elevated), then we cannot register the callback yet, so the
> >> > host/vmm needs to unmap first, then try again. That said, I see the
> >> > problem with the comment above, and I will clarify this.
> >> >
> >> >> > +
> >> >> > +     /* Register a callback first. */
> >> >> > +     __folio_set_guestmem(folio);
> >> >> > +
> >> >> > +     /*
> >> >> > +      * Check for references after setting the type to guestmem, to guard
> >> >> > +      * against potential races with the refcount being decremented later.
> >> >> > +      *
> >> >> > +      * At least one reference is expected because the folio is locked.
> >> >> > +      */
> >> >> > +
> >> >> > +     refcount = folio_ref_sub_return(folio, folio_nr_pages(folio));
> >> >> > +     if (refcount == 1) {
> >> >> > +             int r;
> >> >> > +
> >> >> > +             /* refcount isn't elevated, it's now faultable by the guest. */
> >> >>
> >> >> Again this seems racy, somebody could have just speculatively increased it.
> >> >> Maybe we need to freeze here as well?
> >> >
> >> > A speculative increase here is ok I think (famous last words). The
> >> > callback was registered before the check, therefore, such an increase
> >> > would trigger the callback.
> >> >
> >> > Thanks,
> >> > /fuad
> >> >
> >> >
> >>
> >> I checked the callback (kvm_gmem_handle_folio_put()) and agree with you
> >> that the mappability reset to KVM_GMEM_GUEST_MAPPABLE is handled
> >> correctly (since kvm_gmem_handle_folio_put() doesn't assume anything
> >> about the mappability state at callback-time).
> >>
> >> However, what if the new speculative reference writes to the page and
> >> guest goes on to fault/use the page?
> >
> > I don't think that's a problem. At this point the page is in a
> > transient state, but still shared from the guest's point of view.
> > Moreover, no one can fault-in the page at the host at this point (we
> > check in kvm_gmem_fault()).
> >
> > Let's have a look at the code:
> >
> > +static int __gmem_register_callback(struct folio *folio, struct inode
> > *inode, pgoff_t idx)
> > +{
> > +       struct xarray *mappable_offsets =
> > &kvm_gmem_private(inode)->mappable_offsets;
> > +       void *xval_guest = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
> > +       int refcount;
> >
> > At this point the guest still perceives the page as shared, the state
> > of the page is KVM_GMEM_NONE_MAPPABLE (transient state). This means
> > that kvm_gmem_fault() doesn't fault-in the page at the host anymore.
> >
> > +       rwsem_assert_held_write_nolockdep(&inode->i_mapping->invalidate_lock);
> > +       WARN_ON_ONCE(!folio_test_locked(folio));
> > +
> > +       if (folio_mapped(folio) || folio_test_guestmem(folio))
> > +               return -EAGAIN;
> > +
> > +       /* Register a callback first. */
> > +       __folio_set_guestmem(folio);
> >
> > This (in addition to the state of the NONE_MAPPABLE), also ensures
> > that kvm_gmem_fault() doesn't fault-in the page at the host anymore.
> >
> > +       /*
> > +        * Check for references after setting the type to guestmem, to guard
> > +        * against potential races with the refcount being decremented later.
> > +        *
> > +        * At least one reference is expected because the folio is locked.
> > +        */
> > +
> > +       refcount = folio_ref_sub_return(folio, folio_nr_pages(folio));
> > +       if (refcount == 1) {
> > +               int r;
> >
> > At this point we know that guest_memfd has the only real reference.
> > Speculative references AFAIK do not access the page itself.
> > +
> > +               /* refcount isn't elevated, it's now faultable by the guest. */
> > +               r = WARN_ON_ONCE(xa_err(xa_store(mappable_offsets,
> > idx, xval_guest, GFP_KERNEL)));
> >
> > Now it's safe so let the guest know that it can map the page.
> >
> > +               if (!r)
> > +                       __kvm_gmem_restore_pending_folio(folio);
> > +
> > +               return r;
> > +       }
> > +
> > +       return -EAGAIN;
> > +}
> >
> > Does this make sense, or did I miss something?
>
> Thanks for explaining! I don't know enough to confirm/deny this but I agree
> that if speculative references don't access the page itself, this works.
>
> What if over here, we just drop the refcount, and let setting mappability to
> GUEST happen in the folio_put() callback?

Similar to what I mentioned in the other thread, the common case
should be that the mapcount and refcount are not elevated, therefore,
I think it's better not to go through the callback route unless it's
necessary for correctness.

Cheers,
/fuad

> >
> > Thanks!
> > /fuad
> >
> >> >> > +             r = WARN_ON_ONCE(xa_err(xa_store(mappable_offsets, idx, xval_guest, GFP_KERNEL)));
> >> >> > +             if (!r)
> >> >> > +                     __kvm_gmem_restore_pending_folio(folio);
> >> >> > +
> >> >> > +             return r;
> >> >> > +     }
> >> >> > +
> >> >> > +     return -EAGAIN;
> >> >> > +}
> >> >> > +
> >> >> > +int kvm_slot_gmem_register_callback(struct kvm_memory_slot *slot, gfn_t gfn)
> >> >> > +{
> >> >> > +     unsigned long pgoff = slot->gmem.pgoff + gfn - slot->base_gfn;
> >> >> > +     struct inode *inode = file_inode(slot->gmem.file);
> >> >> > +     struct folio *folio;
> >> >> > +     int r;
> >> >> > +
> >> >> > +     filemap_invalidate_lock(inode->i_mapping);
> >> >> > +
> >> >> > +     folio = filemap_lock_folio(inode->i_mapping, pgoff);
> >> >> > +     if (WARN_ON_ONCE(IS_ERR(folio))) {
> >> >> > +             r = PTR_ERR(folio);
> >> >> > +             goto out;
> >> >> > +     }
> >> >> > +
> >> >> > +     r = __gmem_register_callback(folio, inode, pgoff);
> >> >> > +
> >> >> > +     folio_unlock(folio);
> >> >> > +     folio_put(folio);
> >> >> > +out:
> >> >> > +     filemap_invalidate_unlock(inode->i_mapping);
> >> >> > +
> >> >> > +     return r;
> >> >> > +}
> >> >> > +
> >> >> > +/*
> >> >> > + * Callback function for __folio_put(), i.e., called when all references by the
> >> >> > + * host to the folio have been dropped. This allows gmem to transition the state
> >> >> > + * of the folio to mappable by the guest, and allows the hypervisor to continue
> >> >> > + * transitioning its state to private, since the host cannot attempt to access
> >> >> > + * it anymore.
> >> >> > + */
> >> >> > +void kvm_gmem_handle_folio_put(struct folio *folio)
> >> >> > +{
> >> >> > +     struct xarray *mappable_offsets;
> >> >> > +     struct inode *inode;
> >> >> > +     pgoff_t index;
> >> >> > +     void *xval;
> >> >> > +
> >> >> > +     inode = folio->mapping->host;
> >> >> > +     index = folio->index;
> >> >> > +     mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
> >> >> > +     xval = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
> >> >> > +
> >> >> > +     filemap_invalidate_lock(inode->i_mapping);
> >> >> > +     __kvm_gmem_restore_pending_folio(folio);
> >> >> > +     WARN_ON_ONCE(xa_err(xa_store(mappable_offsets, index, xval, GFP_KERNEL)));
> >> >> > +     filemap_invalidate_unlock(inode->i_mapping);
> >> >> > +}
> >> >> > +
> >> >> >  static bool gmem_is_mappable(struct inode *inode, pgoff_t pgoff)
> >> >> >  {
> >> >> >       struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
> >> >>

