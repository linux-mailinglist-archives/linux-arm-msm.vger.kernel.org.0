Return-Path: <linux-arm-msm+bounces-53540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEBDA80C0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 15:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A96D89073CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 13:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F8D139CE3;
	Tue,  8 Apr 2025 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vu7oLHHK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81F486358
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118287; cv=none; b=aUMC4I4/W7qC+mxrJvFAWWfnTmTTWR8YWJJ53VDqBLalh9ykuFsm1vIJcQO9KpkQzqehkosEEA2E7VEYW6hcaALsr/aDXMre6qBqB7UpgqklGJ6Pml9f24WMgvyUYT2/u+Yk56nTc4vOtPKAlQ9BulpGYvZXJPC4FB7i7WYaljA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118287; c=relaxed/simple;
	bh=k7NlXqsYUX8pjXrcoPJ1o3a0IqbR/uG74F9gP89IH/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1/J53+fCjsHYX/ZuJ5WXeK5HaCGf5DSYqIXFpC5p2uqY4DDuDjSa+tmucoQ2Z0hu/l4Cv32FlAfh7ORmArs+jeD1mMu3+e5upetyBR5xxjsGNn1+M2yBklrFTrvORT7leyU6ZwFzZ1UX2pFpx5LLvYODsw/v0qvsTuqgtpSA5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vu7oLHHK; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47666573242so430871cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 06:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744118284; x=1744723084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DLkZ8H10u754bzDEYxG0pGG1Vym3BSRsC007lFUVMA0=;
        b=Vu7oLHHKYkipZ45DEkKT5ZOLz1c60VJkQEoEC/K9LhTMh/hbedx5IXt57cAhmoXbrv
         WjpLlo6DRuCz7uzhChRoMQnVfshVjT6rnGsgsOodXusaJ2xv0Qnynyca3zZNdWCytmSC
         V2WGMWwwavTG6ZGL4h9bHURiLEeSzmuyr9UfbQZBlbo4g4erKqP127dSTbUEsMJxvy04
         l2XAKisHPi1jvF3JcIWa2U/+PbuKw8RUTReIGw1RiTz7lJgT1s1tM0N0pS2RBQkOXeUA
         hS1kd72jK/6n/uX3rYKWwtIHBKZfO4WQCAtJxVGxx4L7HiTsogfn+YdF7BHLuXaWHrBF
         vohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118284; x=1744723084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLkZ8H10u754bzDEYxG0pGG1Vym3BSRsC007lFUVMA0=;
        b=p2eCUzjgE4ngKYQxVR1cHHXN1uEQrLWjfYTvc5ivn51S8kGq1tRALkZ2+wBNh1Ggby
         xouqQtWwV2Ukrw5LKnNtjaUq48aGsA+4BPJLqudY6VSG7RXxeoa40oTZGG014Eskbwt0
         irGaZCYMxrmpeyY2xXyNPH1Rwb5Dq7Mbk+nll2eWio6/Wh6hCWdTXaVQHzYFFZBIMlyl
         rVXkMGsZgFJyCaByurR4yDEIykby7WEHnHQoJyb85m70pjmkzc45YP87a+pz+WC4u+Rn
         muS4OPFZwYRKkbIYV8+6NwdTvEswv5kxDvVsqO0JvamE7MZpza7oPXvNwHamUyIgmvCD
         u6zg==
X-Forwarded-Encrypted: i=1; AJvYcCWKxZh1xVugx3UIjqQbCHo0Rnjx5RbWzfQUDJBmq8V+0i6HND/qt7T5NzuKB+VehMDBdhxvUGOeQO7moMDf@vger.kernel.org
X-Gm-Message-State: AOJu0YzFFNBkebiqMSODhE+xDWNLRykrKTJTk9wOlgauwRSuqEFrLezg
	fEwW8rY+03RzsrMwxxF6lJGGMFm9Kfwp7DrP3uvfm8+NU/zRfCGj5Kr2qUXuhpmjSroik+4ooOR
	P2fikcQMZF7CV0NDD8cnFiK4tSVIbJ18wj+4N
X-Gm-Gg: ASbGncuJd5Hdh7cul5VaP+TP5Dk0Pth0IT7esT1y7EEsd1tZb0bk7u6vPEEgOhTUe2K
	4OFGyaFJWS5a9uryZAl3bAj7dxH3Vy7P/CIKNHoeBjI+ZVs0k+H2n8NkO60C7fTxJf+7dW7Bts0
	AgeTfzudCI11DQOAfAu8Sum547yShMLzecaGSkmrLRV9UIY6kTL0JJI5s=
X-Google-Smtp-Source: AGHT+IEDCj75uLOr9P2Vigx7J1ItMHWGrGRbxd2MN7PC6r4Wx5Y0g7b6KNz8RZ4KgdK933NpM5luHDRK5PVCe5NSW9Y=
X-Received: by 2002:ac8:5a8f:0:b0:477:8577:1532 with SMTP id
 d75a77b69052e-47954f896a1mr4329511cf.28.1744118284214; Tue, 08 Apr 2025
 06:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318161823.4005529-1-tabba@google.com> <20250318161823.4005529-4-tabba@google.com>
 <aeed695d-043d-45f6-99f3-e41f4a698963@amd.com>
In-Reply-To: <aeed695d-043d-45f6-99f3-e41f4a698963@amd.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 8 Apr 2025 14:17:27 +0100
X-Gm-Features: ATxdqUFr2igflPFe3Ha6eBMgg_-Ahvty9YC0a3MzdgeJzRB0x5YKJNf2b56gIOM
Message-ID: <CA+EHjTzmxuGK2i1C5bgFeNMOxdupnMcR09ELZzZttvuvHtS7og@mail.gmail.com>
Subject: Re: [PATCH v7 3/9] KVM: guest_memfd: Allow host to map guest_memfd() pages
To: Shivank Garg <shivankg@amd.com>
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
	jthoughton@google.com, peterx@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Shivank,

On Tue, 8 Apr 2025 at 13:04, Shivank Garg <shivankg@amd.com> wrote:
>
> Hi Fuad,
>
> On 3/18/2025 9:48 PM, Fuad Tabba wrote:
> > Add support for mmap() and fault() for guest_memfd backed memory
> > in the host for VMs that support in-place conversion between
> > shared and private. To that end, this patch adds the ability to
> > check whether the VM type supports in-place conversion, and only
> > allows mapping its memory if that's the case.
> >
> > Also add the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
> > indicates that the VM supports shared memory in guest_memfd, or
> > that the host can create VMs that support shared memory.
> > Supporting shared memory implies that memory can be mapped when
> > shared with the host.
> >
> > This is controlled by the KVM_GMEM_SHARED_MEM configuration
> > option.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
>
> ...
> ...
> > +
> > +static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
> > +{
> > +     struct kvm_gmem *gmem = file->private_data;
> > +
> > +     if (!kvm_arch_gmem_supports_shared_mem(gmem->kvm))
> > +             return -ENODEV;
> > +
> > +     if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) !=
> > +         (VM_SHARED | VM_MAYSHARE)) {
> > +             return -EINVAL;
> > +     }
> > +
> > +     file_accessed(file);
>
> As it is not directly visible to userspace, do we need to update the
> file's access time via file_accessed()?

Makes sense.

Thanks!

/fuad

> > +     vm_flags_set(vma, VM_DONTDUMP);
> > +     vma->vm_ops = &kvm_gmem_vm_ops;
> > +
> > +     return 0;
> > +}
> > +#else
> > +#define kvm_gmem_mmap NULL
> > +#endif /* CONFIG_KVM_GMEM_SHARED_MEM */
> > +
> >  static struct file_operations kvm_gmem_fops = {
> > +     .mmap           = kvm_gmem_mmap,
> >       .open           = generic_file_open,
> >       .release        = kvm_gmem_release,
> >       .fallocate      = kvm_gmem_fallocate,
>
> Thanks,
> Shivank

