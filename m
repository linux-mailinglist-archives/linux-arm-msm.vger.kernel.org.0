Return-Path: <linux-arm-msm+bounces-57490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFECAB1E93
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01C061BA83BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 20:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D878925F78D;
	Fri,  9 May 2025 20:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PPeRCq7I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425262550AF
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 20:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746824080; cv=none; b=ar8sOYuhVZaNyB756zgx9zT3/y7hWIRFS5JqMd2hWXNDw3qLbVC+OSdtQH6EIp9vB03YVDkuGgdZBIbNzttm9TzLQwoHQUuMgaD1AgPrqXXWuj3aq9kNDTNpxngT0Bv8khmwIOexEcbixUnw9sU6dBc0pYynevGORVALm4U+Enk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746824080; c=relaxed/simple;
	bh=4OALAvXo9+lipv0xjA2AawQMhuHbGUTriBP+yDkWhFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJ9jziq1gRDyBUWkA04aTYvzbpwOWEF/60LjSr5Pi3DnaNsP3pWrLEvYeLD5FnWK3l9SzFWPsP15mFXzL+UmZCSSjACr4wPDB8eO3UaSgxqc1oWGCTdaXhjCNa6J//vRH2yVc+pN1Sbps3dbLDBI82NrA9CTMGhj3sOQDbjkcag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PPeRCq7I; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so2607076276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 13:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746824078; x=1747428878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YDh7AUtJazlpCVEpTi9HcGNJAhAqUebSltmnVaJLqs=;
        b=PPeRCq7IqRyEzqDGgjN+rju5q1iWgNBG4NgZF/Vh+l208dKMsIOtAfcODRJzwMMdjg
         wbZbF5ju7hf7tGUJ4I7dAJnv7WAHbAaXvJf+rn67Mjh0cxXCs0hpKIWM9PeUtNy9Y0ET
         ZrRX4q1KKYIOl5+NScOy97j2g+H2WLMVldzVKdjeRbsIgKXa52jDypOejuYwrHudyaqJ
         oPp4isiBZkvLqDYGHHT+P6jkmfSMb7MWGhp7ihOP9cFod/62smyN5UsSytrbbvMgS7zx
         FUQPfpDC6FWfBIvnbwDD8SEiSIqa7encA98D9gj1/Ai4lRIwxVvoADUODxRrJcF8u/UA
         wz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746824078; x=1747428878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YDh7AUtJazlpCVEpTi9HcGNJAhAqUebSltmnVaJLqs=;
        b=YmSK0uzZz6aKaWiDmt8tqk5TtzwqHSPLf0AlEhqr1uuB1QoR385U6J3zVRYYI0PUjv
         QNzA9hVHsIti3CcOYjNVfUFROaiG6W8zceHalV2eN+1a+DWqjaf0rGBorsQONZGWJMK4
         QCegNPzrTiVkAmX3kSqmT5J87pc7Dfwf4CqToXDXKhVHwdiSMohva81uHrxpnJ/ga3Nk
         gxDiZb3ANlt7s3TPMCMCQlZ5aW9KuDoAQFp4C2DDg0p2wqGAkuHquNfkqkde+mkjWXNM
         mFqAZY1eRGKY3xFNk/bvOCynb8lAVrJCpAGowjt1Ag4klObfqXtvvKinZHnOGFtBLmru
         2oJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWol7GS/DiCxUKnKO/H3huMFYQHOHyBQpFd8fOeXATrERynWhrZBV5/X02TVotEiq5aOJQhkS+Q9lriuzcB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy51ouVPjtdhP5Lbfab+NmYHRmU8J2ZYKtO9lga08SywFKGdqAj
	w51sTIpivJ4mFqluVKQznVHegQAR7CFsVJRobH53G8hK0lo/VVUB1Ltdybvw33guSf6LGo7s+YY
	UJ9ypDlT1zB8xMbY5eRxrJ0lJ6pK8YmJa49OHOEK6JkR6EhideAfFQFY9Qw==
X-Gm-Gg: ASbGncssJxa5PErz0F4EKwWwDNadqEtaypGJA4VqlldsS3BEIYgiinmc5M9FX+q8X3P
	n16x+EYiUqiOkiRR4TolEbGTTkL83DIartfNvolUUTfnnMa11IHVGMX6f0XmXn/K8c28CuuERyZ
	4ZC8rEGuHWbCY3rCz52lLIuT4N6b6Z8VXi5pEV8WnKRP/4BxjxEhKyGnL225Q4AtQ=
X-Google-Smtp-Source: AGHT+IFiewDsh+KtQaHc0+sMyr5WyQmEk6swjiDZjCjdcy6OqRcTDauDDFEFO1+U8aLuAUaLbLYDQ/fh6Pt9jjFl3vM=
X-Received: by 2002:a05:690c:6a13:b0:702:4eb0:6af with SMTP id
 00721157ae682-70a3fb50442mr71919297b3.31.1746824077805; Fri, 09 May 2025
 13:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430165655.605595-1-tabba@google.com> <20250430165655.605595-9-tabba@google.com>
In-Reply-To: <20250430165655.605595-9-tabba@google.com>
From: James Houghton <jthoughton@google.com>
Date: Fri, 9 May 2025 13:54:02 -0700
X-Gm-Features: AX0GCFvn133p0WfcWXRvPwPeSy4C7Kx4OsjhoiQ9viApK0YRW3SBt1Ynv90_jo0
Message-ID: <CADrL8HVO6s7V0c0Jv0gJ58Wk4NKr3F+sqS4i2dFw069P6ot7Fg@mail.gmail.com>
Subject: Re: [PATCH v8 08/13] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
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
	peterx@redhat.com, pankaj.gupta@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 9:57=E2=80=AFAM Fuad Tabba <tabba@google.com> wrote=
:
> +static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +       struct kvm_gmem *gmem =3D file->private_data;
> +
> +       if (!kvm_arch_gmem_supports_shared_mem(gmem->kvm))
> +               return -ENODEV;
> +
> +       if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) !=3D
> +           (VM_SHARED | VM_MAYSHARE)) {
> +               return -EINVAL;
> +       }
> +
> +       vm_flags_set(vma, VM_DONTDUMP);

Hi Fuad,

Sorry if I missed this, but why exactly do we set VM_DONTDUMP here?
Could you leave a small comment? (I see that it seems to have
originally come from Patrick? [1]) I get that guest memory VMAs
generally should have VM_DONTDUMP; is there a bigger reason?

[1]: https://lore.kernel.org/kvm/20240709132041.3625501-9-roypat@amazon.co.=
uk/#t

> +       vma->vm_ops =3D &kvm_gmem_vm_ops;
> +
> +       return 0;
> +}

