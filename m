Return-Path: <linux-arm-msm+bounces-58241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F09ABA3B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 21:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C9DA25421
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 19:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C89D27F727;
	Fri, 16 May 2025 19:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C1CMQbKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98902280019
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747423357; cv=none; b=UMCQjRtRAUiVuxcTlgGwQ9zqIBWmXckSFxS9X2QMgSKVzHzBNTIwGOtqBtjl6dPP0plbxZ/UxGRABbwZ5f2191xry0t9GNOcRW9C7aiNtiYHI6wqFvb7cI2oWpNrUYBAxBx3en+45ZJFMlkG4fpb3fe4ixw17JRe7sb2mhYFMRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747423357; c=relaxed/simple;
	bh=mv1Ins7jvbobKa3n2jnizEHtuD4BULDUPYaGteSuvOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6eAO7X/pVtH82qDxH/mjs3EBQrv0/UnOsqrYKF7bBAoD16wnKB06Q0L5GlAm5NuoZmjsCna7Z3s0c4iDaEpgI1J5gwTZQtusuvDUoOfYwfXKCt/vbZX8vQoVg0c+y8w4WoaJ7jjwZTLWNKufMYo+QjpS0yW4uTlqO/9Mm0EobQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C1CMQbKb; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7082e46880eso24149307b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 12:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747423354; x=1748028154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5csGcQ8badg6OQc2j12fcylP9C8BoCep+FBckAp9xQ=;
        b=C1CMQbKb13wdheh5RbK8OT4VZyiX0o20ZWgRmHOLxPPIR43ZifNSAwB/mWzjpKjZ3t
         m6Vc1TMJlIP1vIxm2vN71sGPbl8cKSzcPARflld3T/wD4T3+TGT10f+lDIoOGdjxpnAZ
         NuCZwYKxj7NhM/eCw9AF5zbanrdpyCdS3ucNI0x/DkO3CEPJPxwKD05bM2rgIR0Oa2vE
         lpxSkXlZBzv4Cr6avrKeRcWaJKCzxyY67ZVRBiW4lBOJDY3GjMO7WIpSBYFnaW2itO8d
         lMsHsskl8O+496VKaT8UpDFRY39DWnSgy1OSyIcpaSzIEeiryIGI2NpLX7nWtTJcof6B
         b9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747423354; x=1748028154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5csGcQ8badg6OQc2j12fcylP9C8BoCep+FBckAp9xQ=;
        b=uxQu32A9LKfSGZsCtz7k7++Q6KliiK9sshJMI/cPNEtxZghmbPL3YLfImMjESTBJsC
         FJCFL/wSJ3hoRpytMibktHcELSILnpaGdj1BzbGqMieqML4CbcaD5De97JTst+o7AUQt
         4XmYNRFC/tQm3jpVpg5rPZVMwIb9hdU88pwybzHJXTi/FxMhg9RHoWNn9qENZcSD+jj9
         FeSjpt7VTKyz5YHiT+o8errTpFU56+CHefaRj8vtW4Ki00VCFkfI10+o32cPtNcLiyaL
         zOmgWd9C6ihgUJqqsIuJWxHPZUWHoR9rKNZ7c4tKllt6fQMR4nDk0pbm33B9y9n5UhaI
         qhZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlYeyXCj5kXMzyArADkUMLjBUkG/gnwYVwOotNQT9y2KSzQ6n7QXMUn6SP9FcifLDXuDG9IOBn8RwIY9+8@vger.kernel.org
X-Gm-Message-State: AOJu0YzvKNGbO5mV1zJKDa3Y+g5nP1yC8ZQcp8PzpQmdnP19H26ugIVA
	hUG1tSNcRo4shuycTkEDFWiCXxMa8WYbmP6rfaKFJ9u1NfWCONj3xZJaKnf/BJt52oiU4GZi2KI
	1pKo5XnDGw5YCohvmjfPDnCCDOMla95igNjmh1iHc+7aNk8Aj+OGJ183i04H1gw==
X-Gm-Gg: ASbGnctVFBl4NjSaRYK/hZ5Ju1hncOab0Jcz1ejSZLMZtLalq5+iPXns48ZpLXohOQK
	Tl0Ds3M1hN6ppi55M0QPAkadLDnbV8Kg5egR8zkyB2fZrdna9lUpppDRsorA4plRSea3MeHJ6B9
	+rGcZ88R73NL1NBh3GhWTP8oPPB8r7k7qc3oQYYJaGyPuy6c1pAyf2hYAGEkKOOw==
X-Google-Smtp-Source: AGHT+IHmB5XBLYghERElfsJfzIa8m2PhXb5Oe8yfTFbW3QD907B5QsRiG5OVykLoPEH8ozkVNKkbLJW7xYSYXhG8Zqs=
X-Received: by 2002:a05:690c:6f03:b0:6fb:8461:e828 with SMTP id
 00721157ae682-70ca7c108f1mr74013577b3.30.1747423354023; Fri, 16 May 2025
 12:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-8-tabba@google.com> <diqzsel8pdab.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzsel8pdab.fsf@ackerleytng-ctop.c.googlers.com>
From: James Houghton <jthoughton@google.com>
Date: Fri, 16 May 2025 12:21:58 -0700
X-Gm-Features: AX0GCFtvTxSjQg-C2lcu7Fqz9j01UftX46-yoNDwQ9IypZOUYYVgSBCYUAztoPs
Message-ID: <CADrL8HX4WfmHk8cLKxL2xrA9a_mLpOmwiojxeFRMdYfvMH0vOQ@mail.gmail.com>
Subject: Re: [PATCH v9 07/17] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
To: Ackerley Tng <ackerleytng@google.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
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
	peterx@redhat.com, pankaj.gupta@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 11:37=E2=80=AFAM Ackerley Tng <ackerleytng@google.c=
om> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 6db515833f61..8e6d1866b55e 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -312,7 +312,88 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memor=
y_slot *slot, gfn_t gfn)
> >       return gfn - slot->base_gfn + slot->gmem.pgoff;
> >  }
> >
> > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> > +
> > +static bool kvm_gmem_supports_shared(struct inode *inode)
> > +{
> > +     uint64_t flags =3D (uint64_t)inode->i_private;
> > +
> > +     return flags & GUEST_MEMFD_FLAG_SUPPORT_SHARED;
> > +}
> > +
> > +static vm_fault_t kvm_gmem_fault_shared(struct vm_fault *vmf)
> > +{
> > +     struct inode *inode =3D file_inode(vmf->vma->vm_file);
> > +     struct folio *folio;
> > +     vm_fault_t ret =3D VM_FAULT_LOCKED;
> > +
> > +     filemap_invalidate_lock_shared(inode->i_mapping);
> > +
> > +     folio =3D kvm_gmem_get_folio(inode, vmf->pgoff);
> > +     if (IS_ERR(folio)) {
> > +             int err =3D PTR_ERR(folio);
> > +
> > +             if (err =3D=3D -EAGAIN)
> > +                     ret =3D VM_FAULT_RETRY;
> > +             else
> > +                     ret =3D vmf_error(err);
> > +
> > +             goto out_filemap;
> > +     }
> > +
> > +     if (folio_test_hwpoison(folio)) {
> > +             ret =3D VM_FAULT_HWPOISON;
> > +             goto out_folio;
> > +     }

nit: shmem_fault() does not include an equivalent of the above
HWPOISON check, and __do_fault() already handles HWPOISON.

It's very unlikely for `folio` to be hwpoison and not up-to-date, and
even then, writing over poison (to zero the folio) is not usually
fatal.

> > +
> > +     if (WARN_ON_ONCE(folio_test_large(folio))) {
> > +             ret =3D VM_FAULT_SIGBUS;
> > +             goto out_folio;
> > +     }

nit: I would prefer we remove this SIGBUS bit and change the below
clearing logic to handle large folios. Up to you I suppose.

> > +
> > +     if (!folio_test_uptodate(folio)) {
> > +             clear_highpage(folio_page(folio, 0));
> > +             kvm_gmem_mark_prepared(folio);
> > +     }
> > +
> > +     vmf->page =3D folio_file_page(folio, vmf->pgoff);
> > +
> > +out_folio:
> > +     if (ret !=3D VM_FAULT_LOCKED) {
> > +             folio_unlock(folio);
> > +             folio_put(folio);
> > +     }
> > +
> > +out_filemap:
> > +     filemap_invalidate_unlock_shared(inode->i_mapping);
>
> Do we need to hold the filemap_invalidate_lock while zeroing? Would
> holding the folio lock be enough?

Do we need to hold the filemap_invalidate_lock for reading *at all*?

I don't see why we need it. We're not checking gmem->bindings, and
filemap_grab_folio() already synchronizes with filemap removal
properly.

>
> > +
> > +     return ret;
> > +}

