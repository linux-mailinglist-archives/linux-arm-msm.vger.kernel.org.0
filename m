Return-Path: <linux-arm-msm+bounces-52238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7DA6C3F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 21:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AEC53B7E72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 20:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFD522FDEE;
	Fri, 21 Mar 2025 20:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="szvwozRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAA01EEA3C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 20:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742587779; cv=none; b=nG45u+pf+EgruO4mdl5IpRAN3R3gZlRX9WRFRDg+bA2y0XbgvtVKM7UuX3bmDEGkuBBUUuZTI8zaL3ThG2H1SuyQ/7C215u5y+OMQ/t7M0IoAybQmt4QUPuoKLHzT5X5RutGG6HUVlOvMvjeagbxqMSnF1O9R8VUjSzCpDkD78s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742587779; c=relaxed/simple;
	bh=j7v4UyN3Lp06V7pnTSO7Y60kFvGuFMETg8UlG/4uups=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWEb7RaonsgMBrGZjfuKn2kkJ5pqJ2Fw6MjixPp+ZM7iZc+y6bfoWovPgpZgRzAwbVnPzlaT/kvYCxLiJ0J/5akonIneTFxBqdV3L8OdBlwVQ4PKEDoYmKxwV/5HXeLKodtxsS8uLf9MCXP5sG9Zl/hyeG6p47RNW7anw9pdm14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=szvwozRf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2240aad70f2so53905ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742587777; x=1743192577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOafnUEiyJ1Gb55WuZtMSsEWQiRaElw+RW4n0rhAEXA=;
        b=szvwozRfWB1grVVyT/c9RDVTC1ET42xEP4iJo4c8YjiGcRzYKpcDI1e1HZQ2USUPbF
         JrFVHwfe+fAxVBig+UD8HTBxs5NUeyNRZdf/bqusEu322/HwBHm9BP7JzLBx3qFWRY3T
         E93TCKWRJX0qMxkKG3R0Amitjdvu486yRYvw1eWLFijogyzV1APC1v93DYPTV/M2xbxl
         rvlT+3ZgowlaINKibrJkC2WUUsAz2yb4nvvAGeMQ+Vlo77Bcr9AG4wI+5yu0CtXrYKtW
         +GluraDVDHwbZFLann+YMJFgB5iSldf8gZ5XfJhKKJ/gQhvhg1E08Yy4tZie1oF9f5zk
         KONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742587777; x=1743192577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOafnUEiyJ1Gb55WuZtMSsEWQiRaElw+RW4n0rhAEXA=;
        b=CyQdVbfNovmImqSFj2GGRllTK/6YLJZyqA3IBaqERB0nUBCw/MUmUN1SVVtTUPIKZF
         IumI5a1QYqYgOnUytE9zZWFF+jcV1wSi5U9yrTzyn40UrwpS5SeZ4KrATPCCCwqTag7s
         nxluLrN0MRtdf9KM9MG4y1drZLS3rQguGz1bXP1K488AwEmH43Ex2IsyyRhwoaTViYkZ
         lpcqnkZ4iDzBR0c3aidZUe/9wXTSGavZbfoEiFDQLUIgNionjp3q1OuGwi8394USYGaq
         zrf0BF2Y3oAFgvqIgWKTekuc9NW1HGUo7rc3KJ1uuWzJ1+85pPBoRMaDXpqo5HdK3oBt
         yxjA==
X-Forwarded-Encrypted: i=1; AJvYcCVqNiNOPoRYtdizMyVFoWvSJnGEbyUmKWpsPNTmsiheVcIKPVDwA2xicvn3bjo92nteDDRqwG5fzLxXJs2x@vger.kernel.org
X-Gm-Message-State: AOJu0YyLS4H6om8DvU3HfZZySJ8UxYMnzF9LrPcjfJyRSQ6zRtIP7acg
	TVen5b3LiRx32P0y1oKjhNNACTdG1OxL9kO+13RfE17SBKf+LTehLB4FRc2M36NHxEJp60yCpfM
	IcU59T7rxCEcmF5ZR9yqMOSJB4llRIyvJMghm
X-Gm-Gg: ASbGncsLuVnj0vvJUzjbv5l0vtwVe5sGbuAIOqcq4Vi7hmQYZ3NdSFY9IRSiIc1MTsQ
	2ltUMvUrwK4lb7dkA+DbxuEiyLKtk19Ee2fU7FuiC1ATD+q8iyVptjk87RzK4i+5XjlWstyYG3z
	4HdqtyS+uGMfooBONf3Dqnbrt3jo9YDwFmW1KJevbh30MHYtbqtRtRBIMj
X-Google-Smtp-Source: AGHT+IGvpFGTBfp+MabVEeRllxzafgiPZ/ufd88zI3l9ZzdBHzykrz1eH56xXT4l0ISQ7CCp7LJf4v9pVr8aBdYDYqU=
X-Received: by 2002:a17:902:9a48:b0:216:4d90:47af with SMTP id
 d9443c01a7336-2279877f21amr402005ad.29.1742587776587; Fri, 21 Mar 2025
 13:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318162046.4016367-1-tabba@google.com> <20250318162046.4016367-6-tabba@google.com>
In-Reply-To: <20250318162046.4016367-6-tabba@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 21 Mar 2025 13:09:24 -0700
X-Gm-Features: AQ5f1JrkVc_diymZ4izcsLOGZymRKApPTUtoUgAcDro_HwSXX5c65PWftGZjJzo
Message-ID: <CAGtprH-aoUrAPAdTho7yeZL1dqz0yqvr0-v_-U1R9f+dTxOkMA@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] KVM: guest_memfd: Restore folio state after final folio_put()
To: Fuad Tabba <tabba@google.com>
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

On Tue, Mar 18, 2025 at 9:20=E2=80=AFAM Fuad Tabba <tabba@google.com> wrote=
:
> ...
> +/*
> + * Callback function for __folio_put(), i.e., called once all references=
 by the
> + * host to the folio have been dropped. This allows gmem to transition t=
he state
> + * of the folio to shared with the guest, and allows the hypervisor to c=
ontinue
> + * transitioning its state to private, since the host cannot attempt to =
access
> + * it anymore.
> + */
>  void kvm_gmem_handle_folio_put(struct folio *folio)
>  {
> -       WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progr=
ess.");
> +       struct address_space *mapping;
> +       struct xarray *shared_offsets;
> +       struct inode *inode;
> +       pgoff_t index;
> +       void *xval;
> +
> +       mapping =3D folio->mapping;
> +       if (WARN_ON_ONCE(!mapping))
> +               return;
> +
> +       inode =3D mapping->host;
> +       index =3D folio->index;
> +       shared_offsets =3D &kvm_gmem_private(inode)->shared_offsets;
> +       xval =3D xa_mk_value(KVM_GMEM_GUEST_SHARED);
> +
> +       filemap_invalidate_lock(inode->i_mapping);

As discussed in the guest_memfd upstream, folio_put can happen from
atomic context [1], so we need a way to either defer the work outside
kvm_gmem_handle_folio_put() (which is very likely needed to handle
hugepages and merge operation) or ensure to execute the logic using
synchronization primitives that will not sleep.

[1] https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/mm.h#L1=
483

> +       folio_lock(folio);
> +       kvm_gmem_restore_pending_folio(folio, inode);
> +       folio_unlock(folio);
> +       WARN_ON_ONCE(xa_err(xa_store(shared_offsets, index, xval, GFP_KER=
NEL)));
> +       filemap_invalidate_unlock(inode->i_mapping);
>  }
>  EXPORT_SYMBOL_GPL(kvm_gmem_handle_folio_put);
>
> --
> 2.49.0.rc1.451.g8f38331e32-goog
>

