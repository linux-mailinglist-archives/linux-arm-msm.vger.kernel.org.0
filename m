Return-Path: <linux-arm-msm+bounces-45873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3794A19AC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 23:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5796B1889568
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 22:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27251C461F;
	Wed, 22 Jan 2025 22:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GVpznsGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430AC4C9F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 22:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737584213; cv=none; b=LY49uTvdbbDWjS6T/h9Rd018L9JaQgExiH4tJeQCyUIYJK8RO4STS2EncoFWfCp24mwHgjg9xpKH8RTbSEFhFjCS8YB07nYBKekcAOOhtaJas0fFBZxc6Vj/H/SiVPFTYpGUvGddW8Xp7LqungEAuFYaJv2pd8sYf0+xZDLG9xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737584213; c=relaxed/simple;
	bh=YRBj9r1/vH8+ADkRAd/xRm3bNslcVk24kKUS21NY9Ok=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=mezAdd1c9mMVOgGIn+lqBPCMRFG9mqkluTI0fubHl/TW3OYoZzbl81yak7z3a0K4ZZMNkzERBdxVCs4rSekbisNc+2kG0cIcRjQC/mKA0ySAeEb7lrDfZIiWNZkMSs68t9cRdhoTfnfQc2cONMkXxvz0IZoYHr3m2nrtz5BZyeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GVpznsGm; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2161d185f04so2517385ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 14:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737584211; x=1738189011; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l3V32wmuFdo3eyYq3ItjWLe5TmAQhDXOPpNz76RK2rI=;
        b=GVpznsGmzj9rnZ/j1XSVzUZ8f3vZwlw4A88OBya4wtYH1As6k5/qzjrYoxPjxeWq5P
         BrL5ibvINg5FmRDhEP3uxlH69QSKUBtazxBevoh1637D/O+byatT4OQmvjOvL8KkzkD8
         /zTE/BgymQwnRoNLiYkQik4Qo1lmYg9x2fVQ5OganGy5R5QMtSwSQr2IGtgaOZc9frAa
         8I9HC4eY5tPzqYus/30YBqvkJql7VKw+SG8mI8vHRX492f5gjcb48AJAAF4timEp3nLe
         h40lxy/9mwBxXMLxU6ASp9Ov63rT6tRNYSx1X7DUEVIr+MT38oMSm0K7AHOdbaFjV071
         GTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737584211; x=1738189011;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3V32wmuFdo3eyYq3ItjWLe5TmAQhDXOPpNz76RK2rI=;
        b=hUqHW/BTetEocJeNjup2Cj1v/dIgppNORRoOaTjGPfQeyrDWvhj/TmVHzmLmjX8qSe
         6D9Jw1LBwUgRvB0hrOUk5vbKvb7Y/tjSJRaOdErd6GsYLnkUXRo9XScMfFOebWdxAY8l
         8m0KcxmGgerz8YYNi4qCfXTEJLOjv3mGHtRHpvL3mbBmK5W22cgMVatVM695bJUIKYQU
         O/M04PpDEdBz7djflroXrwhDGPqvUMVp1ZHB0f2eyqVtr5xL3P1z2qagkzLMAjwMdVKp
         YOonnPtBC+LaMEmHDTsxzozSSzquRxlgO46YSaZu1yhr7gUaF2dURmaVgzVDinv01Pk/
         yHWg==
X-Forwarded-Encrypted: i=1; AJvYcCVNK8dYVnc26eRlJTL/hVhnUkvk5wreG+YdFYjUleMH4GeE2SwQ24l8XOB92wj7meU3/Hg/YYWwsl/1qmYr@vger.kernel.org
X-Gm-Message-State: AOJu0YyyQXsl56kIaxeGTVvPXYhYxZGDMx1bR42cBoHROhn9dmhN8Sgd
	sxBGeVuNXZr7lmD12L6wzbGoNqV9f9/2nqhlH6/2GCKGznb6psLY1GGTqeAlHdNfUBeBuGnS8/L
	vSHsFIRfYRnY4sQNY2EQngA==
X-Google-Smtp-Source: AGHT+IHawiM1cnWjjBgTMESBdCjxT4zEuIO00j/eJjzTR5bXkQ6p3w/HrFV8L27JfxuD2cLer72tmGSBr5cfS1Cwuw==
X-Received: from pfbjc33.prod.google.com ([2002:a05:6a00:6ca1:b0:728:e508:8a48])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:8412:b0:1e1:96d9:a7db with SMTP id adf61e73a8af0-1eb2147021cmr35174465637.4.1737584211338;
 Wed, 22 Jan 2025 14:16:51 -0800 (PST)
Date: Wed, 22 Jan 2025 22:16:49 +0000
In-Reply-To: <20250117163001.2326672-7-tabba@google.com> (message from Fuad
 Tabba on Fri, 17 Jan 2025 16:29:52 +0000)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzikq6sdda.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>
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
	jthoughton@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

Hey Fuad, I'm still working on verifying all this but for now this is
one issue. I think this can be fixed by checking if the folio->mapping
is NULL. If it's NULL, then the folio has been disassociated from the
inode, and during the dissociation (removal from filemap), the
mappability can also either

1. Be unset so that the default mappability can be set up based on
   GUEST_MEMFD_FLAG_INIT_MAPPABLE, or
2. Be directly restored based on GUEST_MEMFD_FLAG_INIT_MAPPABLE

> <snip>
>
> +
> +/*
> + * Callback function for __folio_put(), i.e., called when all references by the
> + * host to the folio have been dropped. This allows gmem to transition the state
> + * of the folio to mappable by the guest, and allows the hypervisor to continue
> + * transitioning its state to private, since the host cannot attempt to access
> + * it anymore.
> + */
> +void kvm_gmem_handle_folio_put(struct folio *folio)
> +{
> +	struct xarray *mappable_offsets;
> +	struct inode *inode;
> +	pgoff_t index;
> +	void *xval;
> +
> +	inode = folio->mapping->host;

IIUC this will be a NULL pointer dereference if the folio had been
removed from the filemap, either through truncation or if the
guest_memfd file got closed.

> +	index = folio->index;

And if removed from the filemap folio->index is probably invalid.

> +	mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
> +	xval = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
> +
> +	filemap_invalidate_lock(inode->i_mapping);
> +	__kvm_gmem_restore_pending_folio(folio);
> +	WARN_ON_ONCE(xa_err(xa_store(mappable_offsets, index, xval, GFP_KERNEL)));
> +	filemap_invalidate_unlock(inode->i_mapping);
> +}
> +
>  static bool gmem_is_mappable(struct inode *inode, pgoff_t pgoff)
>  {
>  	struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;

