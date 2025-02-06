Return-Path: <linux-arm-msm+bounces-47015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B573FA2A4F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 10:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390BC161F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C911422616D;
	Thu,  6 Feb 2025 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="apzDrG5p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C0226530
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835177; cv=none; b=ElW09toIkgNeYiGpoEV/k0S7fsNAZLB92mmS1kOrbth8lh4SBrUkrL+luxzmJRvhU4UeKAlPc4hOs4BK66cHTDghU1wvWucMOLS/mzcPW6rJZJsOmaBm+8Sa/379DOEGNbR720YlqU0A6Gw44FeHEJWKYqmADOAsRFaokw0Ypk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835177; c=relaxed/simple;
	bh=3JSdsFwwBWCy1KTlBRuVwKE7ZbhfmuWgFGTX7Kj5tas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUIQbsAdOh0tK5Pr3wS0V2DG7RWHUk+n5UoVPPmk9HSz0T+nehH/FEfnSoVPd++6crT9evhd8fnNgdfrwGwC9Vl73GQoIlJCKYqgmrqL0nypTBqBF7qAdqWM6yOij2Kf99srAPlL9UgXcuuqLX+tbvw8kYxoPkCLnOnLiuGp1R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=apzDrG5p; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467abce2ef9so202721cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 01:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738835175; x=1739439975; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7BKAt0NEQXysy6sKnPuYIWKvPg1dRJqyEHJ9MeAxGgY=;
        b=apzDrG5pyZe/IPOmphM3zr5IfKhZB8aSLsXg8jOJGdD0nYGpcTpFRJX8bLHkxBWZ+X
         r1hHjTswlnKSGy7y2JxNrRdru71zZa/pcmrvV/OiV7djw0tivpwOAY1f5SkkXSjPPX3p
         eomY4K+Ss6c7Dj7tj3gHP2PfRrBwD0xNKSFf+bBidiILskLrAjB6eoCzaXG8+u5+Ryqy
         IFLLqau813Y/OzuGyJoZ6Az4usq5Bi3faOK+3uaJVK2rFfB8SGxTsgcdeJkojA17dzh+
         UPyWM5DmMEmhhzCbCddmFwc+HU7hDlUi+8NxOGemJfCjHzQaN/dcDNG1VSEglxcOyClN
         bPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738835175; x=1739439975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BKAt0NEQXysy6sKnPuYIWKvPg1dRJqyEHJ9MeAxGgY=;
        b=K2T5odDgRm+wz+uxGY7RWxWK9qcG0ZFd03W7glFd5kAl4W3Oqdt3oAFhdf2G+oOFF2
         NEPxMfl2lowoYn+n8pPpbu3OFnrZneHOQvww+/SyF1q/kiq818ZB9aI/2rwv0K0tx2up
         HyLIXWwhG6GGQz/CYiSclh4FO6LrfhpbI2mxLto/mSttZDGBGpTdc0+LlHaaXbL0zOEr
         OLncXRM4cxAjYNQ/nNCMeWHiguxsDsmKIuCk56ebe4Zr+EThSyncbzehtYlJ15Q1IOCi
         T9K/6H7DfDv9MNGWz6R5B7Z8+7qSbPFFyWpsrWuOFQqx+1QGLyKyCTxG2ilFLbhmZp0R
         8McA==
X-Forwarded-Encrypted: i=1; AJvYcCXTVHvgHWIFw7x8bJMeGHjOoyZO4UnTTrTTkVTPZr/GBhddu+ElTTRsedsNRZ4ZQL7lLzUw7/Sz/zv3qrv+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb1zWxsrJjngzFUrQqZgB2quOfahHCUJD9P8pTGZ+bLskmt7Yo
	qmsiI3H94Ev3jg7tvMcqxWfk3AMrO3qzGYnTRQEBKx7xM2u6yQm9T6Qyub/ZY/8U9m3HhIOdi1/
	e0vG//COakHKmn7fotodxtrGBbFUUeE/3KFeu
X-Gm-Gg: ASbGncs6mNHibFvBvirFgoAxshGwcdULObLOcosXO3NU3oF1PGhFANfIgqE4uusV5D7
	FRFctKpxUiAEwpCW/zLAla0hCbigr3APUvgoKx/43dufjTr3xsh041UM1+wmFY3WIQWgwe/mm5b
	1/mcCkGPMAem4TIXVdyj7qia4Vew==
X-Google-Smtp-Source: AGHT+IEuDo660q8ak3VegRH5ye6TRiM/Y+Jo49jMGjPSMpFsCFYfKqUL6UwwSsHkBvoSSSe2L3a7QsltEoQK936WK0Q=
X-Received: by 2002:a05:622a:350:b0:46c:791f:bf46 with SMTP id
 d75a77b69052e-471130d4434mr1694721cf.19.1738835174541; Thu, 06 Feb 2025
 01:46:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+EHjTzRnGoY_bPcV4VFb-ORi5Z4qYTdQ-w4A0nsB91bUAOuAg@mail.gmail.com>
 <diqzbjvfsr1n.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzbjvfsr1n.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 6 Feb 2025 09:45:37 +0000
X-Gm-Features: AWEUYZnkYtrz5pt-vUwH-yMpFx5wLZBryRWV4TMPGtW_CAGutG2Hm9Bf6oCnBOc
Message-ID: <CA+EHjTxFTFi0PFALHjLtBbS5kUHBCW2d91SPhM_ZfthxN=ShWA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 05/15] KVM: guest_memfd: Folio mappability states
 and functions that manage their transition
To: Ackerley Tng <ackerleytng@google.com>
Cc: kirill@shutemov.name, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
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

On Thu, 6 Feb 2025 at 03:14, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> > On Mon, 20 Jan 2025 at 10:30, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >>
> >> On Fri, Jan 17, 2025 at 04:29:51PM +0000, Fuad Tabba wrote:
> >> > +/*
> >> > + * Marks the range [start, end) as not mappable by the host. If the host doesn't
> >> > + * have any references to a particular folio, then that folio is marked as
> >> > + * mappable by the guest.
> >> > + *
> >> > + * However, if the host still has references to the folio, then the folio is
> >> > + * marked and not mappable by anyone. Marking it is not mappable allows it to
> >> > + * drain all references from the host, and to ensure that the hypervisor does
> >> > + * not transition the folio to private, since the host still might access it.
> >> > + *
> >> > + * Usually called when guest unshares memory with the host.
> >> > + */
> >> > +static int gmem_clear_mappable(struct inode *inode, pgoff_t start, pgoff_t end)
> >> > +{
> >> > +     struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
> >> > +     void *xval_guest = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
> >> > +     void *xval_none = xa_mk_value(KVM_GMEM_NONE_MAPPABLE);
> >> > +     pgoff_t i;
> >> > +     int r = 0;
> >> > +
> >> > +     filemap_invalidate_lock(inode->i_mapping);
> >> > +     for (i = start; i < end; i++) {
> >> > +             struct folio *folio;
> >> > +             int refcount = 0;
> >> > +
> >> > +             folio = filemap_lock_folio(inode->i_mapping, i);
> >> > +             if (!IS_ERR(folio)) {
> >> > +                     refcount = folio_ref_count(folio);
> >> > +             } else {
> >> > +                     r = PTR_ERR(folio);
> >> > +                     if (WARN_ON_ONCE(r != -ENOENT))
> >> > +                             break;
> >> > +
> >> > +                     folio = NULL;
> >> > +             }
> >> > +
> >> > +             /* +1 references are expected because of filemap_lock_folio(). */
> >> > +             if (folio && refcount > folio_nr_pages(folio) + 1) {
> >>
> >> Looks racy.
> >>
> >> What prevent anybody from obtaining a reference just after check?
> >>
> >> Lock on folio doesn't stop random filemap_get_entry() from elevating the
> >> refcount.
> >>
> >> folio_ref_freeze() might be required.
> >
> > I thought the folio lock would be sufficient, but you're right,
> > nothing prevents getting a reference after the check. I'll use a
> > folio_ref_freeze() when I respin.
> >
> > Thanks,
> > /fuad
> >
>
> Is it correct to say that the only non-racy check for refcounts is a
> check for refcount == 0?
>
> What do you think of this instead: If there exists a folio, don't check
> the refcount, just set mappability to NONE and register the callback
> (the folio should already have been unmapped, which leaves
> folio->page_type available for use), and then drop the filemap's
> refcounts. When the filemap's refcounts are dropped, in most cases (no
> transient refcounts) the callback will be hit and the callback can set
> mappability to GUEST.
>
> If there are transient refcounts, the folio will just be waiting
> for the refcounts to drop to 0, and that's when the callback will be hit
> and the mappability can be transitioned to GUEST.
>
> If there isn't a folio, then guest_memfd was requested to set
> mappability ahead of any folio allocation, and in that case
> transitioning to GUEST immediately is correct.

This seems to me to add additional complexity to the common case that
isn't needed for correctness, and would make things more difficult to
reason about. If we know that there aren't any mappings at the host
(mapcount == 0), and we know that the refcount has at one point
reached 0 after we have taken the folio lock, even if the refcount
gets (transiently) elevated, we know that no one at the host is
accessing the folio itself.

Keep in mind that the common case (in a well behaved system) is that
neither the mapcount nor the refcount are elevated, and both for
performance, and for understanding, I think that's what we should be
targeting. Unless of course I'm wrong, and there's a correctness issue
here.

Cheers,
/fuad
> >> > +                     /*
> >> > +                      * Outstanding references, the folio cannot be faulted
> >> > +                      * in by anyone until they're dropped.
> >> > +                      */
> >> > +                     r = xa_err(xa_store(mappable_offsets, i, xval_none, GFP_KERNEL));
> >> > +             } else {
> >> > +                     /*
> >> > +                      * No outstanding references. Transition the folio to
> >> > +                      * guest mappable immediately.
> >> > +                      */
> >> > +                     r = xa_err(xa_store(mappable_offsets, i, xval_guest, GFP_KERNEL));
> >> > +             }
> >> > +
> >> > +             if (folio) {
> >> > +                     folio_unlock(folio);
> >> > +                     folio_put(folio);
> >> > +             }
> >> > +
> >> > +             if (WARN_ON_ONCE(r))
> >> > +                     break;
> >> > +     }
> >> > +     filemap_invalidate_unlock(inode->i_mapping);
> >> > +
> >> > +     return r;
> >> > +}
> >>
> >> --
> >>   Kiryl Shutsemau / Kirill A. Shutemov

