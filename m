Return-Path: <linux-arm-msm+bounces-53084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E7A7A202
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 13:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88DB5176982
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 11:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F2F24C689;
	Thu,  3 Apr 2025 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WLT9SW9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC4B24C062
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 11:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743680003; cv=none; b=ihMGjWgGsd6/0HBH/FqUIMZ4weXLl8qHWozRqX80TSva6Bp+AggcQJ8zz4kAHrx3KAJzsBCLFzVT0ZoeNVjnpm1/cENj95GibgY3T9DEN5flzoTuL3UfXJho3BKhYmfWYW8N/60faYiTv9hCoSobgAiF8A7s78qww1iAE6tBM0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743680003; c=relaxed/simple;
	bh=ENjCOqZlKPp/D7qWHLdDXx/2Hgf7yk6/ptGgwF9MJKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIcURlUYxBVFI2TMHR2PLYqxI+4JMbOjrW3A82zDrgO6+32ynjxlgBhximzmqbIuTAGMBIYOxyghCFAFMGwEruOyC6wQsysW0z5Tn+uxGm4/Zbuwo2wZFKCoLkQfYzckt6ISHRkt1vcV0Szq7onO5YEsc0+A0OrvHuLOvfqvv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WLT9SW9A; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4769e30af66so834261cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 04:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743680000; x=1744284800; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gEMObUoyn3JUJ1C/U9ykdrbpQA2uh4Mz7RwOIB0uCd8=;
        b=WLT9SW9AVwnfSziiWjGOmTezf8G0L1CVPVx9TXB7LE9BzL1Fr6Y29XpMNRgjc3DEbz
         kJbcdRUdDi6hhfOOd3ax16T8whbd4RIRGzhT3Rd9Hi77XD2taDmVj7HIZ0KlMIWpcqR/
         +KIfCpQDqFTjd7XnczxdEYBwC551hYTUO5M5dMMLrtqS++kaO2dIx3Uh0OnUP5SgIppj
         SmB90lz/e9ZPhG3/MpHOp4+jvbGgUB8jdoXOSAJInxUwZvcdzGwlUsXfJh4XmoMpfGQI
         MX37PUARDVBX73wVWPSokub98uB8/UAjfa9VolvHxOGzkA/yxl3x9I1KuDGiHXbqnOwJ
         TUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743680000; x=1744284800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEMObUoyn3JUJ1C/U9ykdrbpQA2uh4Mz7RwOIB0uCd8=;
        b=FtHWX9aSbTMysTpLo2k+2CMo7tUvFLMC6KIzcQWP3dQ8Nn+/MCw8Xj6QCu1AWmc/Lt
         WN5jnQYnE7speEn52xImJ84NBszMKriC7V1FflSYR9ss3q37iwjX7wWjarBNl0Uoos4g
         gZD3Qp53Rh6H44qRy37cD+/OzdH/fG2K/BJgpShfv6t/2HZJ3n3PRHY0ZJl4jM8tE4ld
         83Pgi+tu/wSiYm+lClj53GN+Nx8tz4S07piouhkpsEZBI9YS8Slw1JmCf+IyWvG8nUIc
         PtlsViorQAulfogyi1gPJj7gGrIMm3rFfxbl6g6d6KPLlMe0u88bKLI2rcdPv4ETwTqB
         IKcA==
X-Forwarded-Encrypted: i=1; AJvYcCXWIHwXC8MhaKzUGmHe84m9/VeFL+mWJ7X3YtCCWuqXPzuxm4nFYPKaTc3uCDnLNmfYJ924gaE/UKi6t1a/@vger.kernel.org
X-Gm-Message-State: AOJu0YwcQFacdV67mB+/F2EB4Z/dLrOCjlcTltuqjTKC979n3eej/lgf
	zVxNP9zd2O8zq2KWPx6LjGZ2oiz8J7t7qvcDjNk7p9gvWJ0syzLDzO3jazxJ26mK9NHjuNgV8EF
	wEFs0xFdfhD/OLtzE/WRQD57x8kUjyBSx24wR
X-Gm-Gg: ASbGncvwARyMD87Fp4eWNUnfVOupRdtzSpNbWEby5aQEZLseZOBR5nDiFlHXcXIflhk
	WkHXW007ZEicg1ZSbzaFWBBZYUdXbZBWljL7E2Or3bnkG1zki+f+RGZdhLdLansGvPiJoG83zJp
	ETGrlm7Pxvozm8xY8AlQTGAvwJMQ==
X-Google-Smtp-Source: AGHT+IFomZU1HMl8dHzvwzaPBWQoixQ5c08Z91Ow3ggUIuXK//3qzyPh36fz8VwRQ2X3bgMszlZm14KOtw6OkXzulBI=
X-Received: by 2002:ac8:5809:0:b0:477:c4f:ee58 with SMTP id
 d75a77b69052e-4791752498fmr4216301cf.24.1743679999618; Thu, 03 Apr 2025
 04:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328153133.3504118-8-tabba@google.com> <diqzv7rmmahy.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzv7rmmahy.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 3 Apr 2025 12:32:42 +0100
X-Gm-Features: ATxdqUEPebUlHzj5-92DkCj0iX8Rt4t2SxCxCMdVt6zFFuAFssAocEZowoZO9AY
Message-ID: <CA+EHjTwy7BqWvTLsWMJExrerx6+AMoYaNib61of45v2hAsR--A@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] KVM: guest_memfd: Add a guest_memfd() flag to
 initialize it as shared
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Thu, 3 Apr 2025 at 00:03, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> > Not all use cases require guest_memfd() to be shared with the host when
> > first created. Add a new flag, GUEST_MEMFD_FLAG_INIT_SHARED, which when
> > set on KVM_CREATE_GUEST_MEMFD initializes the memory as shared with the
> > host, and therefore mappable by it. Otherwise, memory is private until
> > explicitly shared by the guest with the host.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  Documentation/virt/kvm/api.rst                 |  4 ++++
> >  include/uapi/linux/kvm.h                       |  1 +
> >  tools/testing/selftests/kvm/guest_memfd_test.c |  7 +++++--
> >  virt/kvm/guest_memfd.c                         | 12 ++++++++++++
> >  4 files changed, 22 insertions(+), 2 deletions(-)
> >
> > <snip>
> >
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index eec9d5e09f09..32e149478b04 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -1069,6 +1069,15 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
> >               goto err_gmem;
> >       }
> >
> > +     if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM) &&
> > +         (flags & GUEST_MEMFD_FLAG_INIT_SHARED)) {
> > +             err = kvm_gmem_offset_range_set_shared(file_inode(file), 0, size >> PAGE_SHIFT);
>
> I think if GUEST_MEMFD_FLAG_INIT_SHARED is not set, we should call
> kvm_gmem_offset_range_clear_shared(); so that there is always some
> shareability defined for all offsets in a file. Otherwise, when reading
> shareability, we'd have to check against GUEST_MEMFD_FLAG_INIT_SHARED
> to find out what to initialize it to.

Ack.

Thanks!

/fuad

> > +             if (err) {
> > +                     fput(file);
> > +                     goto err_gmem;
> > +             }
> > +     }
> > +
> >       kvm_get_kvm(kvm);
> >       gmem->kvm = kvm;
> >       xa_init(&gmem->bindings);
> > @@ -1090,6 +1099,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
> >       u64 flags = args->flags;
> >       u64 valid_flags = 0;
> >
> > +     if (IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM))
> > +             valid_flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> > +
> >       if (flags & ~valid_flags)
> >               return -EINVAL;

