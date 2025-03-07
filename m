Return-Path: <linux-arm-msm+bounces-50579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F3A55D53
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 02:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 104213A5F44
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 01:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435971531E8;
	Fri,  7 Mar 2025 01:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GJsnaG9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5BA143748
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 01:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741312420; cv=none; b=C+nc/lC5eLBmT9SapVZxru/ozjSfevon6+KPDKUBePuIfebLDT/g0d9dsl63vY9Y5J5tIRFE9tarJ5FA+OynyYN2FHBbeAYlRdnoausflfgcX1mhzPee8aPki7x6yctShs29OwA3OQ0S6X6rFR+bDmqjo0LChEkbJcSbeLuiBgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741312420; c=relaxed/simple;
	bh=XnKYclYppJMRA9DFHu/pNYSpK/EG2IzbSQM3Hu9jSwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UI3/QIK8/6EKDLp+iFC1mYRE/N5j1XFMdZS1OcxtcbrjKOCgsfRkLck/JJ33E5J5YFP/IFNBQ6IY3KXcZ0Bs/hXqY8NGC8VLQrfZmKMTMb66fRIBdHEkFBVFgVZq7dNhiz/CQgg4vCRGRY58Zbny8faj3Gz95XVNbSM8YOt36kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GJsnaG9H; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6fda22908d9so10371667b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 17:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741312417; x=1741917217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCUWTnZ3pjMxXxrtYneWY/ixjpdncKxk56nrINlFuLI=;
        b=GJsnaG9Hrs+RDgkFYpzgBDFXPJmDylRebmNu5cyGdovExd7iJmW/ts3gPs6Tw+KqGt
         2ToHSHFL4iC5s7RV/1LYQ5IdvqQKwWeeDN0sJTCvLOh5h9VqApo4A7MeBe0DdFWr/m/8
         fTlQBqOitXgEa9m5+2GzV2mUtzZaOe1Iu9x0iM3rNjo32xJLXxRETRHZVUcSvp+0YPqe
         Wpemdj+MApPt6BsmyahSJgozC2kDNgG1SD5RmVKEJpfo7kBkjux5F87f6rnlnC0mIvnH
         GI+yh/dXeKRAe6ySZJdLIDSQNq8S97LeaJYOMaWKTCuIxbzwTlUu1m2vGhV+c04Ja7/F
         sC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741312417; x=1741917217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCUWTnZ3pjMxXxrtYneWY/ixjpdncKxk56nrINlFuLI=;
        b=hBuRFHHHmuvFB04PFsLFP5zEAxNeIXC4YEuBFDfy860dnMyDH3pKqAOYznd6AlZeXm
         Q1fBW83mrlEwAwDASv1quIdPm7Hk5X3rln/3zxz1gvhWm0ulgzlXw7xooHztRFMzlelb
         SY4LKFjLCDas8PwOjHCLcBjNgC8fqkINVJS+KDf9ZSPlUe7JaQNtfolkSBXNz1N9pDeX
         77PgZkEdrLCHQvy0Ik0CUrvxh3m0qVDKULaPeZBtCggwUdTio3KMOdRkQsrA+4ijr5uX
         geIv30oapGd9R/YUv39m2gm3mJGWQkLBjzTQvLJdgqlvrC1VoOL9zWsUNIUk+xjECZM1
         4pww==
X-Forwarded-Encrypted: i=1; AJvYcCUJkuOO2sAoPks1ZkvGp7s007AK80VPX6mA5p+P2f3Iu3ahBHKXKh0kEVX4pQhwH9XuvlcOTw4bmg/ulYLO@vger.kernel.org
X-Gm-Message-State: AOJu0YyzNarCmnj5E7/uuIm4ozflVWaQ5GqGa22DumpPZDBpzW6kFaF4
	3TP7a9py9hL+jyc3upSdp/1L50a+DlFOaMDeDkYKdzXU6tE/YKeSnq99K1S0kK2oIVfXKQlx4Wm
	rErgglrs7IV6F2ZGmTgKDpB8LxpwIbjQAIB4I
X-Gm-Gg: ASbGncscTGpdQuVY+0oovqB4mr/RMV7MBNT83bLyz0mPA/nYZ3Fo3V98E7Kd+dyMM68
	Kb7GOMThnfr3kooAfbI2+lYVFVUwlCByMRqmfd1fDGmKE+Nz/vXQX3IK//Au7at46Wq/kVmh941
	c7cmCVsxYXFk/z20YC1pdZ9iun4jshu4Y/aHdiUruon1kjVXuFd3S2kbrx
X-Google-Smtp-Source: AGHT+IEtSS+mpRhJKleMpaB3DbpAHfO3E4j/SkeoZwuqMVYrLHLfF7wB8kyvYfYSwwJ3d+GpQSCY5aetuJOZKgzlNfo=
X-Received: by 2002:a05:6902:983:b0:e5e:700:92f5 with SMTP id
 3f1490d57ef6-e635c1008c7mr2547657276.2.1741312417396; Thu, 06 Mar 2025
 17:53:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303171013.3548775-1-tabba@google.com> <20250303171013.3548775-4-tabba@google.com>
In-Reply-To: <20250303171013.3548775-4-tabba@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 6 Mar 2025 17:53:01 -0800
X-Gm-Features: AQ5f1JrvF2iBlwi15PAxAXyxJXz24tpZUppjb6AWgrXV7KSzTqTZn53OQRuxcas
Message-ID: <CADrL8HUAkzUdZEunCXgdECD+cNZi_O+HBdQZdN=EGiX_OuQJOg@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] KVM: guest_memfd: Allow host to map guest_memfd() pages
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
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
	peterx@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 9:10=E2=80=AFAM Fuad Tabba <tabba@google.com> wrote:
> +static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> +{
> +       struct inode *inode =3D file_inode(vmf->vma->vm_file);
> +       struct folio *folio;
> +       vm_fault_t ret =3D VM_FAULT_LOCKED;
> +
> +       filemap_invalidate_lock_shared(inode->i_mapping);
> +
> +       folio =3D kvm_gmem_get_folio(inode, vmf->pgoff);
> +       if (IS_ERR(folio)) {
> +               switch (PTR_ERR(folio)) {
> +               case -EAGAIN:
> +                       ret =3D VM_FAULT_RETRY;
> +                       break;
> +               case -ENOMEM:
> +                       ret =3D VM_FAULT_OOM;
> +                       break;
> +               default:
> +                       ret =3D VM_FAULT_SIGBUS;
> +                       break;

Tiny nit-pick: This smells almost like an open-coded vmf_error(). For
the non-EAGAIN case, can we just call vmf_error()?

> +               }
> +               goto out_filemap;
> +       }
> +
> +       if (folio_test_hwpoison(folio)) {
> +               ret =3D VM_FAULT_HWPOISON;
> +               goto out_folio;
> +       }
> +
> +       /* Must be called with folio lock held, i.e., after kvm_gmem_get_=
folio() */
> +       if (!kvm_gmem_offset_is_shared(vmf->vma->vm_file, vmf->pgoff)) {
> +               ret =3D VM_FAULT_SIGBUS;
> +               goto out_folio;
> +       }

