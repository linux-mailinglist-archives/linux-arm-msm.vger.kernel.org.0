Return-Path: <linux-arm-msm+bounces-46578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0BA22FB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 15:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AFDE1882F51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 14:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981551E6DCF;
	Thu, 30 Jan 2025 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qw5w364u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A881E522
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247070; cv=none; b=SWTL0++bW47ST1kwy8GJGajb18Kd4BsMgOM7HpaE/o/h6dJY3f/mAECupE1yOkZObJMtj/6SGzCVGFTKTlPy8zgb2fB70+ph1JzZBzkdv2KU/l7E6Xt7PvKG0cLCfK8MgM29dpCat7KCqcZ7zUc/Ew+DWusBKbUDZyIGGRq6zpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247070; c=relaxed/simple;
	bh=WUswRbBOEewCpy5n2d0Rk0KhGjaWHZygn+/Y3XA878o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eiLH0sHGADnMQx8V5pyS/8hWLJtTuTIIuMWPi/gtQjjkhZpFSaOLONuN3J+U/7feEHZHNpNq3FHHL1YlGmhmwp18KNI0W3Qa70U70W/cWF0GxVtoxJp+XLsr8F3fpWTmKHrL6km7DRFEi+jYjUqOjurAP5xeIPYRuS8r/ACrDfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qw5w364u; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-467abce2ef9so236341cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 06:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738247068; x=1738851868; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lFuJbZiTQXk3Z1XPQsFgKQ9iLshj9zg6jIIn1xLK2qc=;
        b=qw5w364uRvebUrQU56Y81gMVMqqIEDASpEfffhrdJXV/kPUb5ovpflJ0yWu3ipbL9Y
         U8ijSa/kM0keSAMK+CarpAU6jrTH8lyunetKegc6+1/NxVEYspU6u9cVUmvkheoucst3
         AsPw6P8vGICFU1oO5oCGa5ocrFwfp9gvBcYMSKGaX7i9+WcBgCiQHnnzxW0b/Lx0v8Fw
         VKrlYkKfh2SdglQPUWG7BArI9/ykwkkLQVR/CqTfBwHSNPu74S7mCh4lb2gulK328JjA
         iSSbwoeVfnpkBpjvA9tirihinb9WR/xv7Z/wlOYqIfgyCzOrs+g9ny65005VToZwJDwe
         Dcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247068; x=1738851868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFuJbZiTQXk3Z1XPQsFgKQ9iLshj9zg6jIIn1xLK2qc=;
        b=Vph6cRFjxwgRYXi0IkKmCjYFRKB+34jDDbbCEwtttvDKqmnyh3UsqGyKDSzXOzpgfO
         QD2NiF+Jo4tULJR++LyfJJ2Z5mGpfFxH3P7Ufd9rgjlhTFTGvBQAncHchfo7xbSkoGqk
         B062t5173r2WY0DZEJB1O8w4LQBtXQ4SI8WZN/ryRjdwgHYK0Jvg6t/maiVoW3mbt6JK
         ZPDKXFEOQTuO6bz3leribctKqpCvGxEi/ufhCd7+7lC3AGQPggKGMyH7AnaZI8/tgNpU
         BySTGXyf07v5dGTTPzigc0YbL+pMmc/EUFaLLSwYCUzPH4j1zruaj7hVkHb5whFMXOGz
         LS9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFTjyhw3pSq/9ETshbkTRMd9rRYedftnuldURZ4Qu3pTpjBdGRnyzytmA+jkqoQmtZdgUcaufXvWJQOCBi@vger.kernel.org
X-Gm-Message-State: AOJu0YxP+YMpVeITcLzg/CThfkWpYS53VsKXQUZ5E4n470TrQl/FweLt
	2Gk3/k8K79OHg3mZXlXqUiURuiJQAcTZduVHyP1ApYSY2+yk+kVWFnJt0hcy1eY7zTBdvcn+kMj
	P0tzBVk+N3AhCeIpi5KKzYL4thB1QnbgY89xy
X-Gm-Gg: ASbGncu9ZJ7i4V6x3tKW6G/fBKjHX/01ySB7HZwe78OcuKlY0mHq7fygZgHM7aCyJu1
	e6RBHvjkbpKkOL5AgeuDv/XZMEN7lc/gytXi7zERyuEWFbV9ZaTdb/+cfRSd8mSomM1704iYF6j
	ZWQOoOKb8y17gYekRxhhRfZTUC
X-Google-Smtp-Source: AGHT+IE/Ql3C7G878f8upYkFw0LvJ/RXPD8cDOYa1Sn4OttpavWcQAXouw8LV0l9x4PGB3UAEK73GOm53+8mg9ag3aQ=
X-Received: by 2002:a05:622a:420c:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-46fde4b14efmr3494451cf.26.1738247067542; Thu, 30 Jan 2025
 06:24:27 -0800 (PST)
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
Date: Thu, 30 Jan 2025 14:23:50 +0000
X-Gm-Features: AWEUYZknmNOaLyQ73iST8WH591zVF9JPiXujRejW7T2jbpOjiO3gHEXquwThsNI
Message-ID: <CA+EHjTzO+po41r1QR-160X6u2m=ko9iKh+qVoNqPkBHpCZhocA@mail.gmail.com>
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

Hi Ackerley,

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

In my last email I explained why I thought the code was fine as it is.
Now that I'm updating the patch series with all the comments, I
realized that even if I were right (which I am starting to doubt),
freezing the refcount makes the code easier to reason about. So I'm
going with ref_freeze here as well when I respin.

Thanks again,
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

