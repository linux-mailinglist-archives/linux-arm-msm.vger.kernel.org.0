Return-Path: <linux-arm-msm+bounces-66138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B395B0E124
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 18:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81890581216
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B61FEEDE;
	Tue, 22 Jul 2025 16:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VWtbYmBy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A727A461
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753200127; cv=none; b=XMebBtyuC3IeWUsbEwzVXvvJ/Mb435or31qVxmzFBT4zYBrs+ZNt4girnAOCH7dqNy5mzSguX0OMBC9X2tLdOpW6alsPOjlQDt+yL1IGrdjEGjcFxGzbnKtvzTOUnF7tFURb5/VG47I4bBe3/tiiWEwfIVcpD7pG5j5QzV+gjpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753200127; c=relaxed/simple;
	bh=9LyYeLmky4Pxwkj3LVEv54HpdyvuC1ah0EvaCPHukc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1P2BwkOAOBEe+Ph/p+sKLZJxh1NvBy8YN3owMxDE/5U32Sr+i0DPN3yJPbZIxzhBwNcq9mmGVYTowUZ8Z72g02tPmdIFnwoogUgzuGuNpHX0IUTviZjV03uFrtCLUFSgc7slu7Rd49HjBC/MswHyREPdSRfMX2ZPcQB06FMYUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VWtbYmBy; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso517021cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753200125; x=1753804925; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zJ5oDalvHQQyRD506B9hQPa7CZetF/bu3rVEuMz2nko=;
        b=VWtbYmByN82vJ26Qdvb8YDSRoDqEqlF5QhGIV/RpKoZUJi7ukG9tieq7l/QgatzE3T
         KHvY4v8VInzOaNDGSnl8eCnZNGHk+QZDxikgeItpSKde4FqfUYfG0q36OT1XTaELN7yx
         K+1BUS8srqxg+sYZwgak9qCWW3Jb8za/001Ker0sJ4+u1gCqSraklNeEccS1xGeuR6tD
         gucQuLyYIbcNGP6gNyRC6rRyJ6aHOMN/TeJGQp7nVHlNHS3+zTL+qTFpUhjH7qikyhti
         ceBf5GzLPawPsqX/DIeub0PA2F1IJesVwR8pOfghAw2nfG3UrJZPEm2QSSgL645J9IW4
         EY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753200125; x=1753804925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJ5oDalvHQQyRD506B9hQPa7CZetF/bu3rVEuMz2nko=;
        b=a2AqKo1MPeeuAWWXL5Ye6/e5XVhezZk37bJpZsYI2DXLz13yINl+ieGg3mlv/bfquz
         jmZwY7WF2qLv33aklNy3Fqw5QwjyefVoHsuaffYuPFqXK9uhgj6mKyF06lvWkV0y1fqZ
         BEQ79i8i7wJ9yHaRe6+RMNw6wGii1nBg+QnopX6eGtRjYtKm2IlmI0wRJwF1gEJlTmfj
         N6qQsMGpp8z1Y8WpSoWSSJDWUCML7nO4e/0iOWvtZCJbSHZv9bJb66hvK9DGqbGtxPvs
         PodHwCgOqMJuRXngURtjYo8IF7Rhyx+9SdxrRQd3vwc1HCNlf7rPLB6PeXPaM5IZWyko
         VaJg==
X-Forwarded-Encrypted: i=1; AJvYcCWwwS977/OLQ/IrtJZpwxdwHPaG5B9faHnz83jXqL3XMbrKEB2B+1dRiFsbgW4o46jPl4q22mZ6vzyoUFR5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkm5uChmdciY3S6MhoxkfvJB2+XI1E1i1CSskn5RdiozVGaJoe
	XpTmfHxcyFhTMGDQ0qbIsnzf3aF4tuPu5jrQRNMTEHjaz9HWf4pu7B4yavGye0fFnmb7ln7d1w4
	bcix9iEfNgHVPdG9MsEpovwI9WGrOKspsss+73c4O
X-Gm-Gg: ASbGnctbo1yXtx7oWTEBjTVc5kG9ylsKywSlVMYIJqOWqH4/3/+BsEi0bWqPv3M+YCT
	b+HBKiznQ3CRttPuTlYKX4ANhc2xC4y7gMiZ0U3Aj/R8FTFuqyOwFcmYQfTClQuWrbuchJAjsQ6
	Nbkj575L72sAO3Pa9KjCLVQ8couw/kyTR2/KgY+l8vUlA/j/NcQtvU62a0gkRXYYwGZW6y2OFQG
	/4vRpqe6c8zOhSa2A==
X-Google-Smtp-Source: AGHT+IHz1Md5CvjkMr0v63+zalLU7h1VJHuKRRiw/5Kb9EG5psNH9QWi7eZC9q9jEanCdF+aUxZTXQqWhAN+64R/RQ8=
X-Received: by 2002:ac8:628c:0:b0:494:4aa0:ad5b with SMTP id
 d75a77b69052e-4ae5cc6db00mr4063241cf.2.1753200124082; Tue, 22 Jul 2025
 09:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com> <20250717162731.446579-3-tabba@google.com>
 <aH5uY74Uev9hEWbM@google.com> <CA+EHjTxcgCLzwK5k+rTf2v_ufgsX0AcEzhy0EQL-pvmsg9QQeg@mail.gmail.com>
 <aH552woocYo1ueiU@google.com> <CA+EHjTwPnFLZ1OxKkV5gqk_kU_UU_KdupAGDoLbRyK__0J+YeQ@mail.gmail.com>
 <aH-1JeJH2cEvyEei@google.com>
In-Reply-To: <aH-1JeJH2cEvyEei@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 22 Jul 2025 17:01:27 +0100
X-Gm-Features: Ac12FXztwmXhhi72jh3H00X5S1zdW7e0Z4aKDTPt7mq7MLiUgNVB0JPJsFGM4PY
Message-ID: <CA+EHjTw46a+NCcgGXQ1HA+a3MSZD9Q97V8W-Xj5+pYuTh4Z2_w@mail.gmail.com>
Subject: Re: [PATCH v15 02/21] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to CONFIG_KVM_GENERIC_GMEM_POPULATE
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Jul 2025 at 16:58, Sean Christopherson <seanjc@google.com> wrote:
>
> On Tue, Jul 22, 2025, Fuad Tabba wrote:
> > On Mon, 21 Jul 2025 at 18:33, Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Mon, Jul 21, 2025, Fuad Tabba wrote:
> > > > > The below diff applies on top.  I'm guessing there may be some intermediate
> > > > > ugliness (I haven't mapped out exactly where/how to squash this throughout the
> > > > > series, and there is feedback relevant to future patches), but IMO this is a much
> > > > > cleaner resting state (see the diff stats).
> > > >
> > > > So just so that I am clear, applying the diff below to the appropriate
> > > > patches would address all the concerns that you have mentioned in this
> > > > email?
> > >
> > > Yes?  It should, I just don't want to pinky swear in case I botched something.
> >
> > Other than this patch not applying, nah, I think it's all good ;P. I
> > guess base-commit: 9eba3a9ac9cd5922da7f6e966c01190f909ed640 is
> > somewhere in a local tree of yours. There are quite a few conflicts
> > and I don't think it would build even if based on the right tree,
> > e.g.,  KVM_CAP_GUEST_MEMFD_MMAP is a rename of KVM_CAP_GMEM_MMAP,
> > rather an addition of an undeclared identifier.
> >
> > That said, I think I understand what you mean, and I can apply the
> > spirit of this patch.
> >
> > Stay tuned for v16.
>
> Want to point me at your branch?  I can run it through my battery of tests, and
> maybe save you/us from having to spin a v17.

That would be great. Here it is:

https://android-kvm.googlesource.com/linux/+/refs/heads/tabba/guestmem-basic-6.16-v16

No known issues from my end. But can you have a look at the patch:

KVM: guest_memfd: Consolidate Kconfig and guest_memfd enable checks

In that I collected the changes to the config/enable checks that
didn't seem to fit well in any of the other patches.

Cheers,
/fuad

