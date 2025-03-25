Return-Path: <linux-arm-msm+bounces-52476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C67A705C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 16:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E81E7A4646
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 15:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA66B257ADE;
	Tue, 25 Mar 2025 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XwlmP6ii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EC921D3F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742918260; cv=none; b=tyG8J15Wx7s8cGhL8o8DR1UNpByRRpPslIk2xom7tqBbAlF/sRY9FGyWXGOzLriIXCUxzAFpk0zfCgjkGBxQCDz2XQVVdSh7OEIEbhOuZoJKNUvRD8YvEL0hRzRb7/9XR3tHmFHQmWQgWzrJUkk1Fun4QQbijJkkEaWUFaLAhDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742918260; c=relaxed/simple;
	bh=8F1NJ56bxjIwyjTv2treAxz+REJKUAEBG3yf9qS2wGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jM13Kgpoh91cIIgDMu4GDFayI/zkkWRTzTctpw08jyfpkaSlgT9DcG9g3vk3BwG3FioV4UQpNyC0O8MQ3RpQ1ajgH6JmlwnK8pPBjhAdW+XDwIZqmtNEgL5vG5fiimvnrgjJ1UzaEoCtWPSOwQfdA2ngRPYUX/LES2USv66NbmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XwlmP6ii; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4769e30af66so448171cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742918258; x=1743523058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74Qwj89IF8GjpANpjZfZDaQ2z8tGZK11oNXVHKtMIeA=;
        b=XwlmP6iiL/y9PBKQi8VZfDDpxnB1JYWWRnxUYeN4cNayiBZQCmstZmjPQW/u5MwcKe
         5koREoqYnnkc5ScTvjEobs2dko4K4LBgJQQ8VHDXivU9NwEN2VfUXGsuDy9uNBL3Pda5
         SrZw8zIegrKLuNwbNBMhEvdcHypIokrfjxJ5CcmBLzs1oLoNv8U20bPSWOofxL8dOu5q
         CGE4wy+/TkxjRa6GLSkW0zR4Y686/YzIYQ0u3j4iRmL8CbHxD336O1GeJoM/QiAoAT64
         N2iSrDrGUdI1KrMTQJGO9FJG9+4vNdej5PkWS9UqWlaeCjfYNbcbtpzZGzi8D7EEZk0D
         +LKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918258; x=1743523058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74Qwj89IF8GjpANpjZfZDaQ2z8tGZK11oNXVHKtMIeA=;
        b=vhNSnyjMDI4iD2XqTxfWVlL91aDxWBsre/T9cNF7tSziMtem2iWMIWzYkkLhuCSJpB
         hlNV9VLdD1rdVRtbP4Ff+fqQBu6qODjfkKZBKiksxOjpOsmlAvaawWHJCWWaSnRKm/eC
         q+apIYsxk/S756gko94gI2gtsfiezT7O3REGPLBdgEAGgyb3G9rt1fyhlDVHwsSNue8K
         FwBRub9tc1ufK34/D1iy5RdKE+myxQRe5E7Wqqxu7eG1uxhGM3EIPWH8HlGOxIoHLLkc
         qRXXNmF/A5T8NnQyRV6TW9bIP5Xr0Ovn8tD4OvvSyQXw6uj8eoOX7+9WNo3cJKJL+hRB
         EZwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtXT0e7pN1V0qirgqpT9MSNOi73PDEUeAwX95xiJldvvROuP1kxg9P3waTPH8P1qW0ygNC+ECmeUWZkzLP@vger.kernel.org
X-Gm-Message-State: AOJu0YzDjdKd/1AxCiYWdTpf/ZjzRm0YySVwvtLNKbMyg+ZV+BDnKiDV
	zob5/8n8rW0nnV3y4ox0XpVIdBbD5EEY6uhyGPQdg/iW6lX4T8f0n++E/RQqeEHAxmE5/PBrVTh
	dvuPRS0cblmFtXZN7JvOdnn8nLYfaOiPFw/X5
X-Gm-Gg: ASbGncuJz0fwB8XXj0RhKEH6pfQWs8LgbPCowSSfKl1qBWUR7tMityYM/g1EABWH1/A
	60wMrWlTN4Uu8Xnzu982t0Z04qg224I3ecUnGoUw+MqK3a2TEXwJK2qxRBrikqGVEfTDfTt9qq+
	gvBV75dpNroSLRicYZNmHvdcCG7g==
X-Google-Smtp-Source: AGHT+IHeh2gPA4DB1fZIeYy9PDd2izAMrAEkI1SyH2TI74S+jvSN+Ftr3W19JthWsvq2CGGaH+hiMPDVB1rq8Iwc7wM=
X-Received: by 2002:a05:622a:1f8b:b0:476:f1a6:d8e8 with SMTP id
 d75a77b69052e-4772be14c43mr13528291cf.11.1742918257692; Tue, 25 Mar 2025
 08:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318162046.4016367-1-tabba@google.com> <20250318162046.4016367-6-tabba@google.com>
 <CAGtprH-aoUrAPAdTho7yeZL1dqz0yqvr0-v_-U1R9f+dTxOkMA@mail.gmail.com>
In-Reply-To: <CAGtprH-aoUrAPAdTho7yeZL1dqz0yqvr0-v_-U1R9f+dTxOkMA@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 25 Mar 2025 15:57:00 +0000
X-Gm-Features: AQ5f1JrYL6iEPnJvzqrjUrKSPmUCLtNGb2xeLimK0jjw7tytAVKf6Eo11ig_wvI
Message-ID: <CA+EHjTwZaqX9Ab-XhFURn+Kn6OstN3PHNqUi_DxbHrQYBTa2KA@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] KVM: guest_memfd: Restore folio state after final folio_put()
To: Vishal Annapurve <vannapurve@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	ackerleytng@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
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
Content-Transfer-Encoding: quoted-printable

Hi Vishal,


On Fri, 21 Mar 2025 at 20:09, Vishal Annapurve <vannapurve@google.com> wrot=
e:
>
> On Tue, Mar 18, 2025 at 9:20=E2=80=AFAM Fuad Tabba <tabba@google.com> wro=
te:
> > ...
> > +/*
> > + * Callback function for __folio_put(), i.e., called once all referenc=
es by the
> > + * host to the folio have been dropped. This allows gmem to transition=
 the state
> > + * of the folio to shared with the guest, and allows the hypervisor to=
 continue
> > + * transitioning its state to private, since the host cannot attempt t=
o access
> > + * it anymore.
> > + */
> >  void kvm_gmem_handle_folio_put(struct folio *folio)
> >  {
> > -       WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in pro=
gress.");
> > +       struct address_space *mapping;
> > +       struct xarray *shared_offsets;
> > +       struct inode *inode;
> > +       pgoff_t index;
> > +       void *xval;
> > +
> > +       mapping =3D folio->mapping;
> > +       if (WARN_ON_ONCE(!mapping))
> > +               return;
> > +
> > +       inode =3D mapping->host;
> > +       index =3D folio->index;
> > +       shared_offsets =3D &kvm_gmem_private(inode)->shared_offsets;
> > +       xval =3D xa_mk_value(KVM_GMEM_GUEST_SHARED);
> > +
> > +       filemap_invalidate_lock(inode->i_mapping);
>
> As discussed in the guest_memfd upstream, folio_put can happen from
> atomic context [1], so we need a way to either defer the work outside
> kvm_gmem_handle_folio_put() (which is very likely needed to handle
> hugepages and merge operation) or ensure to execute the logic using
> synchronization primitives that will not sleep.

Thanks for pointing this out. For now, rather than deferring (which
we'll come to when hugepages come into play), I think this would be
possible to resolve by ensuring we have exclusive access* to the folio
instead, and using that to ensure that we can access the
shared_offsets maps.

* By exclusive access I mean either holding the folio lock, or knowing
that no one else has references to the folio (which is the case when
kvm_gmem_handle_folio_put() is called).

I'll try to respin something in time for folks to look at it before
the next sync.

Cheers,
/fuad

> [1] https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/mm.h#=
L1483
>
> > +       folio_lock(folio);
> > +       kvm_gmem_restore_pending_folio(folio, inode);
> > +       folio_unlock(folio);
> > +       WARN_ON_ONCE(xa_err(xa_store(shared_offsets, index, xval, GFP_K=
ERNEL)));
> > +       filemap_invalidate_unlock(inode->i_mapping);
> >  }
> >  EXPORT_SYMBOL_GPL(kvm_gmem_handle_folio_put);
> >
> > --
> > 2.49.0.rc1.451.g8f38331e32-goog
> >

