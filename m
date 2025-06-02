Return-Path: <linux-arm-msm+bounces-60053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE4FACAC4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 12:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC252189DA00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 10:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C961EDA1E;
	Mon,  2 Jun 2025 10:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GOTOxTsL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA761EDA02
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748859098; cv=none; b=XUQIzt12PWuJM4ZVli9fneYmvhAOclzo8d5G+hGb7b/7U/+hab8xvrxJBhI2v5HwLOflJair9q/YmNn9ZMFpcKINgVNWQsnU/kPzCPGJ/TIxiKEQg6zsZ6rZ7J+nSjKlajIbzoY07ZTU3q7LISnn9u4lMKWrNzQYlnknaK7J98M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748859098; c=relaxed/simple;
	bh=zdvVq0aMSK5d0BnKt2W/ADHf8bxDhoqsW+0UrPH1piw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qNo95c7fT/WcHIqkwe2XGfgeS8Tl74slnDjl1cTaVX5zsHp7X1y1VOPDcQWpcm1fv56rlC4FqfUxfQjrR8Bz7fb9ygIYLQKWOHTu6+0D9qJAAcf1uyvnvzC/a0px/0DkRk8nr8Cvm71uBikBImMNQDmPiO42UQepnMIY+J0U9Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GOTOxTsL; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a433f52485so659291cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 03:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748859096; x=1749463896; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aEMJl8VP8eSua4t/ZJoJ6QaKy8c9YP11jQlZ2pAxubw=;
        b=GOTOxTsL23qVYaLT7SDXwI+KE9rOjgxtYoj8ReN4+h25nCzXlR5DMBS55mF8b73H65
         BAcy+j7dey2uFIAnKdVRyZinuOalCYuWRtXtwt+q7HmA6A81kMWjVlUqtaYzQXAoFbyD
         An9FaVvmw/zyAHx53PpwiqMUDeLKizWw7zze+WBaRhWjc8kSB7pDteQV2HmDoMg4SMgR
         rBejYJ2HhluBwpGP2KGMh0bp5paVhfY6g/Gc0ydb741SNQBXIz7xs4lq8pkh8qi6U5rr
         47LNXhUesWxFV+qLjZ+Mw7O78gQewRmWM0o1VActmVoyqN6SYsO1lGyCgUm6QE+OhIo6
         EAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859096; x=1749463896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEMJl8VP8eSua4t/ZJoJ6QaKy8c9YP11jQlZ2pAxubw=;
        b=S0OucT38ciXfFYKs2EHlzMZ26fPmHsjSsvaEo69YXKbCmNaKm+4pyPryb7DzWKcYS+
         G72G1S9S/8qZ4UKuGv7LSIwvh+k5YGpvk04dVRId116OXAu7PFs+lwaV9zyRoFM+tM6g
         JzGOUm+9lsraEgiwTcRSeHx+x9wRX7TSOrWa40jzSN5gZsP3Z3yG6WTAuqhJml8+Yqi5
         fluH1KLP+3s4kBPFw6cXYISO6l+Iuc6AunNp0Er10z4+eVEvmcyge1/y1P9z4vL91n7J
         68XaciaHCmxTol1Vp4p2cVUKyZ0hwO0l64Cb40gCeNukwk+enOOwys4QUSOY8F0PDz8G
         uHHA==
X-Forwarded-Encrypted: i=1; AJvYcCWCm2PB9rfsHZO47hlIkbtn6cI8hhGgeWYIlJfy89fJ7QrL6YI0gKc6ydLKyXmb5mlx97V1tmCwwKtR3Z2B@vger.kernel.org
X-Gm-Message-State: AOJu0YyoMdjrGfAyS1GEXxGZGUVGFzJPzfGTSFw6Qa+JiL7g6JMPfHlT
	ASpTtrGMs2Nrivzqk5Oax09hiZV1t88bYMC1AJbA451yPAT9hkQ12QID7pmY20HGqSb8ph1/Tjb
	vbfmlH/+o1hzFgbGk9Mw/zOWECuAsZr9lEmB0IYI8
X-Gm-Gg: ASbGncvwe87uJPayEHo4iPZw+SIKm6tS5uwy/I/bSBpcA0sXbqtXaTN0mQk06dfANzO
	KRD3WakMFMSLZC5KzzWo9OQWK9JVOs2mWQUiYrZdYa5yKoUdPvlSCve5xPJCIVKcfsu5Le4QLQu
	bWZKTnFi1jQZFEguqtvCVLU3sWvNiw3sI91buypjew9Xw=
X-Google-Smtp-Source: AGHT+IGyZ8TYf2gCqbOaJDuJwc/O9EQLav/L5nwyBub3SzdxM20y8bC/tbZw3UHBX5ZtnAKdi9jl4ilRG9VgGsxXyzQ=
X-Received: by 2002:a05:622a:1f0e:b0:47e:a6ff:a215 with SMTP id
 d75a77b69052e-4a44e01f677mr6657231cf.0.1748859095642; Mon, 02 Jun 2025
 03:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com> <20250527180245.1413463-8-tabba@google.com>
 <a78fcd95-b960-4cf2-aa66-37f01e8d57ae@amd.com>
In-Reply-To: <a78fcd95-b960-4cf2-aa66-37f01e8d57ae@amd.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Jun 2025 11:10:58 +0100
X-Gm-Features: AX0GCFsAz9baqVDDaagY-dVtivpJkBd9gnOBR10o4G1KuVwZ_ot-AmGx08LfEAM
Message-ID: <CA+EHjTy2yQrdgsGo6pJ7CUWA5HZH8C0G4HCe3+nQM6O-+yDUSw@mail.gmail.com>
Subject: Re: [PATCH v10 07/16] KVM: Fix comment that refers to kvm uapi header path
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 May 2025 at 20:20, Shivank Garg <shivankg@amd.com> wrote:
>
>
>
> On 5/27/2025 11:32 PM, Fuad Tabba wrote:
> > The comment that refers to the path where the user-visible memslot flags
> > are refers to an outdated path and has a typo. Make it refer to the
> > correct path.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  include/linux/kvm_host.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index ae70e4e19700..80371475818f 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -52,7 +52,7 @@
> >  /*
> >   * The bit 16 ~ bit 31 of kvm_userspace_memory_region::flags are internally
> >   * used in kvm, other bits are visible for userspace which are defined in
> > - * include/linux/kvm_h.
> > + * include/uapi/linux/kvm.h.
>
> Reviewed-by: Shivank Garg <shivankg@amd.com>

Thanks for the reviews!
/fuad

> >   */
> >  #define KVM_MEMSLOT_INVALID  (1UL << 16)
> >
>
>

