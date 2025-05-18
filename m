Return-Path: <linux-arm-msm+bounces-58349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 761B9ABB0A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 17:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E30E175F17
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 15:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB661D6DC5;
	Sun, 18 May 2025 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mkooatep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A79372635
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747581486; cv=none; b=EUvERfQchdlyuwV2hz0MT/AiO/OZ7VDW8tH3BrdOlkvvKi76UvOGhpwxnKSiuhRGWGlxudYbmB8HcFAGPc4ZyKgEGc5yz8EDSkF7/ptxoT/3wDhlVYDoVPhZVvRRy0Q0LaPTxzet1YNmfdVzr7cPbmDFOt1mfpxk6bDuf6R+QXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747581486; c=relaxed/simple;
	bh=j5bH60nzc1Wy2cpmmt83VduYjN1P8wEIccp/ebbjVQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Da9402aG4g9AUIqcq+59Nnwz6HJCKDEAUDpNiGa9rbWCFbRjpr+GlBfxq2s3VMzmePBrZ5HGXvi3v9IL8Zh2BeXYGIRgsedkK62vxF1QnQJLKQIhmlsqxmJ0J0H0zAZ4/nds01NGWm41F5i2NqmUrMHDp04nmIMQ0ompDUduY28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mkooatep; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47666573242so370781cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 08:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747581483; x=1748186283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89H6l5EPE7llhy2U2sdeyWXbsFYSBwqQ2gw98qt9JjI=;
        b=mkooatepoRA1cYfwU3tdxhzWj+wrz1f1K2mP0VXbowySzDk2/FtBzH+7FjZ+JkZwTO
         Z+tcjO2b9QbkDZGylwOOAkN0QjYMGyNSAiL1UYX6fzCPWyrEnm5jlZCcTS66dXTwNgnB
         KBBeDutBsVJ6xMh6bc1k0oBcrRYHZt/XQ7z6I2c7nh5RGirF6J39LDsTx6tv0eWZMfmD
         9g3qx2hLzIfLuy/A5PmfyPqOpvGl3/TbWGOH0Vo69cmRN2ZqIRKGippvCEpBok9kg4Ob
         sKoH7oMYVnlJ4IUgGcSBoVdzKPogoMvD4E17/bDoPI7cWff3rA4gBvOqkW1WK734DLLy
         qr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747581483; x=1748186283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89H6l5EPE7llhy2U2sdeyWXbsFYSBwqQ2gw98qt9JjI=;
        b=NFfVcfNfF1yJ7cNXn01H4LMDVdHpj50e+wSraWNNDwHRyNxdjkat4OFGTiwRu7GznX
         54FHN9Ax62Pbp5siQqjpPCvQc10lFySyfjE9F7Q10WkJy39wPnzyj8PalF5LP6WuQoJd
         HvrloNw9hkp23GGOvxgw9yEuvSAU37uBuNfzpZK0RxO5ij7qXfyaQJOccw6zWR0IMonE
         Bg4qicbeexgIB0ldC5bwyWm8buAO61nvGfWGZa5bOgkQa2UxL5QaGc8SaQx06nE/xIfC
         pYaW3AS5vauHkSnmrxN68jsPCtwv2FrnR626XdYdtA0zy5tztdDwtJAJP+hWHSiT+sYo
         pdJw==
X-Forwarded-Encrypted: i=1; AJvYcCVKkh5zYyCJ9/xFtCTKhQR/D8QybwVgDAeqX13nOeAuacXn654PibUCAEmQJ4YsD8jFTiA6A+gyiN336/WW@vger.kernel.org
X-Gm-Message-State: AOJu0YyGwBD1RCrQKneGDMG9bFq9+oxOnBNj0qkrGeb+FrMnzxkbgtP4
	xeze5oTw3sRemSO35YSPStb3DyjG67brjIkxOYVRbA3mRNnZEgW45HN/ZjHM0GH7tgMBUMwAuYw
	nFhdzEMmyjyrrWZwPQ+RPnE3phiaMMKznmalq77QP
X-Gm-Gg: ASbGnctW/UYSsS/Ju9tIAOrFVp8jUjIIs5eyqV69I0tmZqOnr8Si/lFEKCNBqXTH59E
	pd6ez79hnRlVa1EsfTfs1Z5WJaIOJU4JsLE86MSVNFCJqQdfkyEnAzxnd1VzIQr4nLUMiHzRSum
	IfbVsmENJB9bOicxYLxbOTO8T4Nhal5QpgeNJ9BzxM+tkA4OjZg6HdMCM=
X-Google-Smtp-Source: AGHT+IFRzewsTYnfRaUxtfMHOlJKr+aHtCr5bWwYiAywfSAbjQ0plDNnk3E1Hhl9zLOMpM1iIOObSO8HVZNQbyqIF1E=
X-Received: by 2002:ac8:5a8e:0:b0:477:8686:901d with SMTP id
 d75a77b69052e-495ff6d3f0dmr3340951cf.1.1747581482781; Sun, 18 May 2025
 08:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-8-tabba@google.com> <diqzsel8pdab.fsf@ackerleytng-ctop.c.googlers.com>
 <CADrL8HX4WfmHk8cLKxL2xrA9a_mLpOmwiojxeFRMdYfvMH0vOQ@mail.gmail.com>
In-Reply-To: <CADrL8HX4WfmHk8cLKxL2xrA9a_mLpOmwiojxeFRMdYfvMH0vOQ@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 18 May 2025 17:17:10 +0200
X-Gm-Features: AX0GCFssYVagTak9Gz2PtNx886k7vA2OBbm85fBLGgkvBAmAIyAh5VjNRHYwgYY
Message-ID: <CA+EHjTz7JzgceGF4ZBTEuj_CidKe=pVcanuFfPMrXhubV7c2ug@mail.gmail.com>
Subject: Re: [PATCH v9 07/17] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
To: James Houghton <jthoughton@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, xiaoyao.li@intel.com, 
	yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org, 
	amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com, 
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
	peterx@redhat.com, pankaj.gupta@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James,

On Fri, 16 May 2025 at 21:22, James Houghton <jthoughton@google.com> wrote:
>
> On Tue, May 13, 2025 at 11:37=E2=80=AFAM Ackerley Tng <ackerleytng@google=
.com> wrote:
> >
> > Fuad Tabba <tabba@google.com> writes:
> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > index 6db515833f61..8e6d1866b55e 100644
> > > --- a/virt/kvm/guest_memfd.c
> > > +++ b/virt/kvm/guest_memfd.c
> > > @@ -312,7 +312,88 @@ static pgoff_t kvm_gmem_get_index(struct kvm_mem=
ory_slot *slot, gfn_t gfn)
> > >       return gfn - slot->base_gfn + slot->gmem.pgoff;
> > >  }
> > >
> > > +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> > > +
> > > +static bool kvm_gmem_supports_shared(struct inode *inode)
> > > +{
> > > +     uint64_t flags =3D (uint64_t)inode->i_private;
> > > +
> > > +     return flags & GUEST_MEMFD_FLAG_SUPPORT_SHARED;
> > > +}
> > > +
> > > +static vm_fault_t kvm_gmem_fault_shared(struct vm_fault *vmf)
> > > +{
> > > +     struct inode *inode =3D file_inode(vmf->vma->vm_file);
> > > +     struct folio *folio;
> > > +     vm_fault_t ret =3D VM_FAULT_LOCKED;
> > > +
> > > +     filemap_invalidate_lock_shared(inode->i_mapping);
> > > +
> > > +     folio =3D kvm_gmem_get_folio(inode, vmf->pgoff);
> > > +     if (IS_ERR(folio)) {
> > > +             int err =3D PTR_ERR(folio);
> > > +
> > > +             if (err =3D=3D -EAGAIN)
> > > +                     ret =3D VM_FAULT_RETRY;
> > > +             else
> > > +                     ret =3D vmf_error(err);
> > > +
> > > +             goto out_filemap;
> > > +     }
> > > +
> > > +     if (folio_test_hwpoison(folio)) {
> > > +             ret =3D VM_FAULT_HWPOISON;
> > > +             goto out_folio;
> > > +     }
>
> nit: shmem_fault() does not include an equivalent of the above
> HWPOISON check, and __do_fault() already handles HWPOISON.
>
> It's very unlikely for `folio` to be hwpoison and not up-to-date, and
> even then, writing over poison (to zero the folio) is not usually
> fatal.

No strong preference, but the fact the it's still possible (even if
unlikely) makes me lean towards keeping it.

> > > +
> > > +     if (WARN_ON_ONCE(folio_test_large(folio))) {
> > > +             ret =3D VM_FAULT_SIGBUS;
> > > +             goto out_folio;
> > > +     }
>
> nit: I would prefer we remove this SIGBUS bit and change the below
> clearing logic to handle large folios. Up to you I suppose.

No strong preference here either. This is meant as a way to point out
the lack of hugepage support, based on suggestions from a previous
spin of this series.

> > > +
> > > +     if (!folio_test_uptodate(folio)) {
> > > +             clear_highpage(folio_page(folio, 0));
> > > +             kvm_gmem_mark_prepared(folio);
> > > +     }
> > > +
> > > +     vmf->page =3D folio_file_page(folio, vmf->pgoff);
> > > +
> > > +out_folio:
> > > +     if (ret !=3D VM_FAULT_LOCKED) {
> > > +             folio_unlock(folio);
> > > +             folio_put(folio);
> > > +     }
> > > +
> > > +out_filemap:
> > > +     filemap_invalidate_unlock_shared(inode->i_mapping);
> >
> > Do we need to hold the filemap_invalidate_lock while zeroing? Would
> > holding the folio lock be enough?
>
> Do we need to hold the filemap_invalidate_lock for reading *at all*?
>
> I don't see why we need it. We're not checking gmem->bindings, and
> filemap_grab_folio() already synchronizes with filemap removal
> properly.

Ack.

Thanks!
/fuad

> >
> > > +
> > > +     return ret;
> > > +}

