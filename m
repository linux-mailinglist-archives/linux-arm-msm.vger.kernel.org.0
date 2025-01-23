Return-Path: <linux-arm-msm+bounces-45927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D12E1A1A134
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09E4B168905
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DC220D50E;
	Thu, 23 Jan 2025 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H6U4r2r5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63B720D4E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625882; cv=none; b=kO427bdUpQDllWUF+nph+5sUeISfVsG2LwsNbw9KTXngNtLMBN/QOPxet51jJr7pvXgQ4VdxKCA4iQ3G8C+r0mQIyj7isEE8O3LIVuzUlSnmqNqI7jDd1sZPmq5nE2fAnBhMvCX1jYRwMRj1EBNdJOP0xw9nUq4vlFmLEGEvpik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625882; c=relaxed/simple;
	bh=5vzqKP2X7TnSwJyvizFNr4OaD4j2CtDEN6uPpqu2oUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2K5mhjcc58NRRIcGO9zufIkXEPj8XPIyAAcO8GBIcikEObWWaY1MljYAjPF2ui+5Rb5ASgLwk12slRnrvQLYF48EdC/xLv7vJIQA77966o3dreg608d5tR+qmEs0qdGrezTarzIJa3rirnuABLnCpZpQ6pYxwdtyM+m1Rb9yv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H6U4r2r5; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467896541e1so209781cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 01:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737625879; x=1738230679; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yviuU7vMVVFib1+GlJJHR7UtIpXdMrw1DtytEsRq4SU=;
        b=H6U4r2r5g0AAGCQHHTxTrngXDHdJCaSVoS6pXucVXwDMJyAU3GiwWmGA+cykWEKy1S
         7gNRaDoMHCQNAVGHAm8btMH987ZrxwIKr7SoTwb8cIm7Ac+FKNm+Lu5+YIo0fIW8vUrD
         QFqzTl9RAFWaeTzHeLXZkEIsyDWbkal1TR0m+xnp5F9X/xFvGUaHHN3pxkIsQoF4gWvH
         Db4j4EuyvhE+qonr8Xr3eQ/aGsEnpAvf6QzJAn22wMVWCtXIP1t3uWeL+4z7zGwU+kj6
         7dbhq4NBZA0ydFqM6do63hPcZUveca7j2PVRfBNsfFVRIt839d+Je72S9N6D48Xbu/ge
         eepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737625879; x=1738230679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yviuU7vMVVFib1+GlJJHR7UtIpXdMrw1DtytEsRq4SU=;
        b=UPxV4PwNLwGD3SxKxDdTzZCPXrbAhoBGhtBD6wswKypsmiifKVnB2YW9ASN28dHYkt
         Zb+78w0unKHbMQup4lhX5CSzGNxEyFJssd6jfJkIpFD3b6rXVyfwekQUKevFxovbZTXp
         vW9oVV0SWLo4LYZfmTfeRO9fBm3Ef7EVVG2rtg8KgpzB1EVSziFOZY+byde9qX5+g6zR
         70rAcP3c64ToquKwitKExeDq3/CzYnDvJzDKAd0I808sD3aErRFGbdrTkNJnGAqcd/bw
         1qdJa0MJsVp9u0u1jye8KoDfMKDzOXBS/pwK1Kq5tX0Ju0OH1V6bHO4hNJK/nWlUjtPp
         Ui7w==
X-Forwarded-Encrypted: i=1; AJvYcCUWt0WS0cw6cVZng0kcI4rsKNXRHCLv+sO8FMHsRONi4pbxTT5+DyrxEbXd7v83RZyoNq4xNL/A4Zsg/aBE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzc/KV5XPmiIfpSRD00IXmHgdjG7q+uvk/vDK9z2E+ACwpGoBn
	g9u4aBZUCldeDIkQdjL/coEhV0mmAQWxsZ0xVzhBmgTlArT+mJb3hibxQ/vJHLAlgyFEjitG6z4
	+J/e9RMszt+y6TrF4bla9YJP0D8UUX8MVf9e4nfnWgmop2jJnxGmuWrY=
X-Gm-Gg: ASbGnctRbqRMAOddDYBbkZzI9N9NglXHPIAgNnATm/ASSQhT10S0pifaXJoDPkALkZJ
	/IUG/xs+3uinB5WicGBrzNVWItxft6oRGkoclGV4SFaJxr2yZwK4VZk3M4Yglc/iMfBSlKnn4Hy
	N34cD96PxYaswmSQ==
X-Google-Smtp-Source: AGHT+IGGx6fhGAGnD3JpCHn1/8lIrUk1LZpCG+05sYeACx+iitK5ZlJ3LsWzOvvIi0xtTpfhCDHLRJeFYIUXCTXHqJY=
X-Received: by 2002:ac8:5887:0:b0:46c:7d66:557f with SMTP id
 d75a77b69052e-46e5c0f91b5mr3437421cf.8.1737625879389; Thu, 23 Jan 2025
 01:51:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117163001.2326672-7-tabba@google.com> <diqzikq6sdda.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzikq6sdda.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jan 2025 09:50:43 +0000
X-Gm-Features: AWEUYZnBbulFTZGR1qtloKSczYkeBb6FihtEZxc8a8TdA87tJk3UxG7x1ydvWtE
Message-ID: <CA+EHjTzbBNRsQqeSh5L98Rx3QUwh9pUrpg-zkOd7fvnUbJZ-Kw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, mail@maciej.szmigiero.name, 
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

On Wed, 22 Jan 2025 at 22:16, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> Hey Fuad, I'm still working on verifying all this but for now this is
> one issue. I think this can be fixed by checking if the folio->mapping
> is NULL. If it's NULL, then the folio has been disassociated from the
> inode, and during the dissociation (removal from filemap), the
> mappability can also either
>
> 1. Be unset so that the default mappability can be set up based on
>    GUEST_MEMFD_FLAG_INIT_MAPPABLE, or
> 2. Be directly restored based on GUEST_MEMFD_FLAG_INIT_MAPPABLE

Thanks for pointing this out. I hadn't considered this case. I'll fix
in the respin.

> > <snip>
> >
> > +
> > +/*
> > + * Callback function for __folio_put(), i.e., called when all references by the
> > + * host to the folio have been dropped. This allows gmem to transition the state
> > + * of the folio to mappable by the guest, and allows the hypervisor to continue
> > + * transitioning its state to private, since the host cannot attempt to access
> > + * it anymore.
> > + */
> > +void kvm_gmem_handle_folio_put(struct folio *folio)
> > +{
> > +     struct xarray *mappable_offsets;
> > +     struct inode *inode;
> > +     pgoff_t index;
> > +     void *xval;
> > +
> > +     inode = folio->mapping->host;
>
> IIUC this will be a NULL pointer dereference if the folio had been
> removed from the filemap, either through truncation or if the
> guest_memfd file got closed.

Ack.

> > +     index = folio->index;
>
> And if removed from the filemap folio->index is probably invalid.

Ack and thanks again,
/fuad

> > +     mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
> > +     xval = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
> > +
> > +     filemap_invalidate_lock(inode->i_mapping);
> > +     __kvm_gmem_restore_pending_folio(folio);
> > +     WARN_ON_ONCE(xa_err(xa_store(mappable_offsets, index, xval, GFP_KERNEL)));
> > +     filemap_invalidate_unlock(inode->i_mapping);
> > +}
> > +
> >  static bool gmem_is_mappable(struct inode *inode, pgoff_t pgoff)
> >  {
> >       struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;

