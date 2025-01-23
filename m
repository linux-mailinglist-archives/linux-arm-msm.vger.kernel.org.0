Return-Path: <linux-arm-msm+bounces-45942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B89A1A261
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FF2D7A10C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44D71C5F14;
	Thu, 23 Jan 2025 11:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oEXb+faT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AE920CCE6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630067; cv=none; b=fAB8sHpfNzAXmtXg8b5D8MibuI/VL/YDxdhs+BwpDEbMbVPCapcOXI/uNnPNgG4RKVeVDesW6K4VUCpM9dOrFmTDWJ2IIpXzny/8tD6xMHIjfBRdoLgYlQzOUPRTb00iTk87XIJB+9IkM21PQFnZPiHBC15i9Dn7icA57mvS4VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630067; c=relaxed/simple;
	bh=YLZwZLwKvEG7K66awaOqN7r7oG/jNNWldLQ6bL6Hxxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0wVQHhLC06rCtQVs6WL/JxVtuJnO3kCxc74K/707RwqpzT4xeglO6HTLdv1wU99PK8xaKc9wh+U3PKrr9w4Fp+KfnALElr3X9XN6TW2PVoLm9EeSeg6NXF078f6Q65GCuVCiGr0TPPqM9A7zzPa/YJVotnbJRyj4Bjgwppl0OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oEXb+faT; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4679b5c66d0so164231cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737630065; x=1738234865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qKRF6KNk8zRTiJg3LmDGov/DwkKeuqzVdlm7H5Xf/Bg=;
        b=oEXb+faTh28l2eMp16117FSg0g3MFYA1hUoZVQemj+hRIgsqhbAeNeBbvQAXZMD6aS
         azWFwdyQD3di6v1UF5qSPxx2uv7pu51jzpTzi41Yv7bQzq37p3NkuCcJltE9Agr4AJSi
         iU/2dwMcYPgnSmOE3vNNz8CeRPWqFIQHI++keSI+tPgsGtxTX09NwtPSefHUxFpOulDG
         SzP/XSLHRXXc3Nq5l31WTSos5iJiwp4KbiH+F2Ht/eKdinGfS+7iZ7XOmoE+3jxClv99
         /WW+n/9XNRt7P8uhFJLFLszB59ZroGZpnxgjgwp8YYgTfO1TZK310qO8sTPHsezJl9BU
         kkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737630065; x=1738234865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKRF6KNk8zRTiJg3LmDGov/DwkKeuqzVdlm7H5Xf/Bg=;
        b=sweMkRZ04jGmfrF1SWt0KcQv1wvBA1+PzHnS9c3KvyX63LoUQFLoTCgTejAZ7ArnUO
         01sW3yRPJf+l6GeulYTpPsxNZWD46YOFx7UiseS93AVbo5Rao2Avj2yFCP1Auiit13yt
         VpUKXmKqsA17vmniSldKz1tgvlvyKGwrK+N9S5lsMQWPXkpy0+mP/CISjsiG07r4OtIl
         KfejVBGgl4SkV1JKhURUwpVZm9kd6fxOAwFfSexlwlAUTxHo8y+Kw5IMrOP5DiEAtu5I
         ThX+JGPigfquQFdqXWR5mePkeseSjtxynoqnINAD/RyyuL6Y1CsuybtmqEl5B0Zt9i7W
         cpeg==
X-Forwarded-Encrypted: i=1; AJvYcCUAAjdAv6pWQ7cRccOZcnBS4ZvjOuuFE8ENZOZRSnY4hknFD02TFNrEYki7s91yREsc7RbqtIyDQdKHDIZb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ib7sm1fyN420BpDPvm9PGPKLlViXAS9OQyAJWuykvvE5qAtj
	5gf/oaA4RSvoN7lJYLYvF8UtVsrRg3Gop9T5s4oSzMh/2DU5ZQWNH3RdJHnTzXrJUWtBVDeY/Rx
	hnMWmNPqhZCPIEbNSwUSjYLjRrRE2ZgwexHf8
X-Gm-Gg: ASbGncvfHC12MUb1DxrL7tR1QP36q7f2UXrEYhlS5+JTLAVfS84BAhnyM7EzJvhAEch
	jJ/P1GV8ms5iE1mREr1hjgI0+0LYbF464ur8n92ybNpkAxd8i793GqCvu3CJimlP3paWvF5oZ3C
	PwIQCpjTyozNtgrw==
X-Google-Smtp-Source: AGHT+IEhDcVu8ACTJ7IG91GJ66VbO065GG5aGxDdFcDLyw0CtQceKN6CYY8visH22Gzo45SduUQpbbJ88bKa06sEE8E=
X-Received: by 2002:ac8:5d54:0:b0:46c:9f17:12f6 with SMTP id
 d75a77b69052e-46e5dad893cmr2548431cf.27.1737630064616; Thu, 23 Jan 2025
 03:01:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+EHjTxrsPnVYSsc5bJ=fL_tWFUsjqiiMpJ3GURw6s4uwn810w@mail.gmail.com>
 <diqzfrlasczw.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzfrlasczw.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jan 2025 11:00:28 +0000
X-Gm-Features: AWEUYZmBN7k_cteavGpHUkL6JKKUlnvikxSs7bQNdXkQX1RxN1tVPQnaNeluCco
Message-ID: <CA+EHjTyToQEHoKOQLgDxdjTCCvawrtS8czsZYLehRO1N_Ph2EQ@mail.gmail.com>
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

On Wed, 22 Jan 2025 at 22:24, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> >> > <snip>
> >> >
> >> > +/*
> >> > + * Registers a callback to __folio_put(), so that gmem knows that the host does
> >> > + * not have any references to the folio. It does that by setting the folio type
> >> > + * to guestmem.
> >> > + *
> >> > + * Returns 0 if the host doesn't have any references, or -EAGAIN if the host
> >> > + * has references, and the callback has been registered.
> >>
> >> Note this comment.
> >>
> >> > + *
> >> > + * Must be called with the following locks held:
> >> > + * - filemap (inode->i_mapping) invalidate_lock
> >> > + * - folio lock
> >> > + */
> >> > +static int __gmem_register_callback(struct folio *folio, struct inode *inode, pgoff_t idx)
> >> > +{
> >> > +     struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
> >> > +     void *xval_guest = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
> >> > +     int refcount;
> >> > +
> >> > +     rwsem_assert_held_write_nolockdep(&inode->i_mapping->invalidate_lock);
> >> > +     WARN_ON_ONCE(!folio_test_locked(folio));
> >> > +
> >> > +     if (folio_mapped(folio) || folio_test_guestmem(folio))
> >> > +             return -EAGAIN;
> >>
> >> But here we return -EAGAIN and no callback was registered?
> >
> > This is intentional. If the folio is still mapped (i.e., its mapcount
> > is elevated), then we cannot register the callback yet, so the
> > host/vmm needs to unmap first, then try again. That said, I see the
> > problem with the comment above, and I will clarify this.
> >
> >> > +
> >> > +     /* Register a callback first. */
> >> > +     __folio_set_guestmem(folio);
> >> > +
> >> > +     /*
> >> > +      * Check for references after setting the type to guestmem, to guard
> >> > +      * against potential races with the refcount being decremented later.
> >> > +      *
> >> > +      * At least one reference is expected because the folio is locked.
> >> > +      */
> >> > +
> >> > +     refcount = folio_ref_sub_return(folio, folio_nr_pages(folio));
> >> > +     if (refcount == 1) {
> >> > +             int r;
> >> > +
> >> > +             /* refcount isn't elevated, it's now faultable by the guest. */
> >>
> >> Again this seems racy, somebody could have just speculatively increased it.
> >> Maybe we need to freeze here as well?
> >
> > A speculative increase here is ok I think (famous last words). The
> > callback was registered before the check, therefore, such an increase
> > would trigger the callback.
> >
> > Thanks,
> > /fuad
> >
> >
>
> I checked the callback (kvm_gmem_handle_folio_put()) and agree with you
> that the mappability reset to KVM_GMEM_GUEST_MAPPABLE is handled
> correctly (since kvm_gmem_handle_folio_put() doesn't assume anything
> about the mappability state at callback-time).
>
> However, what if the new speculative reference writes to the page and
> guest goes on to fault/use the page?

I don't think that's a problem. At this point the page is in a
transient state, but still shared from the guest's point of view.
Moreover, no one can fault-in the page at the host at this point (we
check in kvm_gmem_fault()).

Let's have a look at the code:

+static int __gmem_register_callback(struct folio *folio, struct inode
*inode, pgoff_t idx)
+{
+       struct xarray *mappable_offsets =
&kvm_gmem_private(inode)->mappable_offsets;
+       void *xval_guest = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
+       int refcount;

At this point the guest still perceives the page as shared, the state
of the page is KVM_GMEM_NONE_MAPPABLE (transient state). This means
that kvm_gmem_fault() doesn't fault-in the page at the host anymore.

+       rwsem_assert_held_write_nolockdep(&inode->i_mapping->invalidate_lock);
+       WARN_ON_ONCE(!folio_test_locked(folio));
+
+       if (folio_mapped(folio) || folio_test_guestmem(folio))
+               return -EAGAIN;
+
+       /* Register a callback first. */
+       __folio_set_guestmem(folio);

This (in addition to the state of the NONE_MAPPABLE), also ensures
that kvm_gmem_fault() doesn't fault-in the page at the host anymore.

+       /*
+        * Check for references after setting the type to guestmem, to guard
+        * against potential races with the refcount being decremented later.
+        *
+        * At least one reference is expected because the folio is locked.
+        */
+
+       refcount = folio_ref_sub_return(folio, folio_nr_pages(folio));
+       if (refcount == 1) {
+               int r;

At this point we know that guest_memfd has the only real reference.
Speculative references AFAIK do not access the page itself.
+
+               /* refcount isn't elevated, it's now faultable by the guest. */
+               r = WARN_ON_ONCE(xa_err(xa_store(mappable_offsets,
idx, xval_guest, GFP_KERNEL)));

Now it's safe so let the guest know that it can map the page.

+               if (!r)
+                       __kvm_gmem_restore_pending_folio(folio);
+
+               return r;
+       }
+
+       return -EAGAIN;
+}

Does this make sense, or did I miss something?

Thanks!
/fuad

> >> > +             r = WARN_ON_ONCE(xa_err(xa_store(mappable_offsets, idx, xval_guest, GFP_KERNEL)));
> >> > +             if (!r)
> >> > +                     __kvm_gmem_restore_pending_folio(folio);
> >> > +
> >> > +             return r;
> >> > +     }
> >> > +
> >> > +     return -EAGAIN;
> >> > +}
> >> > +
> >> > +int kvm_slot_gmem_register_callback(struct kvm_memory_slot *slot, gfn_t gfn)
> >> > +{
> >> > +     unsigned long pgoff = slot->gmem.pgoff + gfn - slot->base_gfn;
> >> > +     struct inode *inode = file_inode(slot->gmem.file);
> >> > +     struct folio *folio;
> >> > +     int r;
> >> > +
> >> > +     filemap_invalidate_lock(inode->i_mapping);
> >> > +
> >> > +     folio = filemap_lock_folio(inode->i_mapping, pgoff);
> >> > +     if (WARN_ON_ONCE(IS_ERR(folio))) {
> >> > +             r = PTR_ERR(folio);
> >> > +             goto out;
> >> > +     }
> >> > +
> >> > +     r = __gmem_register_callback(folio, inode, pgoff);
> >> > +
> >> > +     folio_unlock(folio);
> >> > +     folio_put(folio);
> >> > +out:
> >> > +     filemap_invalidate_unlock(inode->i_mapping);
> >> > +
> >> > +     return r;
> >> > +}
> >> > +
> >> > +/*
> >> > + * Callback function for __folio_put(), i.e., called when all references by the
> >> > + * host to the folio have been dropped. This allows gmem to transition the state
> >> > + * of the folio to mappable by the guest, and allows the hypervisor to continue
> >> > + * transitioning its state to private, since the host cannot attempt to access
> >> > + * it anymore.
> >> > + */
> >> > +void kvm_gmem_handle_folio_put(struct folio *folio)
> >> > +{
> >> > +     struct xarray *mappable_offsets;
> >> > +     struct inode *inode;
> >> > +     pgoff_t index;
> >> > +     void *xval;
> >> > +
> >> > +     inode = folio->mapping->host;
> >> > +     index = folio->index;
> >> > +     mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
> >> > +     xval = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
> >> > +
> >> > +     filemap_invalidate_lock(inode->i_mapping);
> >> > +     __kvm_gmem_restore_pending_folio(folio);
> >> > +     WARN_ON_ONCE(xa_err(xa_store(mappable_offsets, index, xval, GFP_KERNEL)));
> >> > +     filemap_invalidate_unlock(inode->i_mapping);
> >> > +}
> >> > +
> >> >  static bool gmem_is_mappable(struct inode *inode, pgoff_t pgoff)
> >> >  {
> >> >       struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
> >>

