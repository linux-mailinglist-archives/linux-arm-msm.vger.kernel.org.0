Return-Path: <linux-arm-msm+bounces-65219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D618B0743A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 13:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8BD51AA623C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 11:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893AF2F2736;
	Wed, 16 Jul 2025 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="07w/j5tE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00D02F2359
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752663949; cv=none; b=LuHNv8NfrvGKA+ESQXEmQl61bY0QA01VK2DpS9UJOQ+ElOu3ELzKncE8Mrro22V+CvfoeosXO9VIbty4e+skq0poa/AGomr0NuF97KZtRXM8QZpso8pz73tLP5XVqxz3MLzHbLJCGpVs7puhIPpLxGxe6rk2mmSIUIu+dAxFAuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752663949; c=relaxed/simple;
	bh=Q0um87P4/3R8smq76yisAQlQe7fLie4Eoep5/bLrQas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8wRxqIXNzccoPxyWHCmnuW3YAuOJALeniksJ1e/FyK/fzHtNpmFj7WydIxgP8UaVUhK9HKIsOunQxCnMuU+QxhLjT2KexflXinc4qoA0OKwG/yi045ySaFKumWS4WQqbErpqcCqeIVobDgmP0BmwVMxv2f9N8bHqDa1zkY4PgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=07w/j5tE; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ab86a29c98so410461cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 04:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752663947; x=1753268747; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0um87P4/3R8smq76yisAQlQe7fLie4Eoep5/bLrQas=;
        b=07w/j5tEZvCLYvQbr/F7+UBXMz7LerwAsuDbCx5TniG3MWGv2K/CgtAGYnwtf2H+v8
         /GhgOk4mK25qr6EjsVhDNY1wfCRCdkpusaUKPiYL+TQX+M0YVGM1mj9S9GwlJwQ9Wq0p
         Vn1zG/9fj/lrUg+S+yXHmEg+S30XPVrGpxiHR7NZqQacEV8A7SUABEO2KUXRWTkjEG1a
         cVz5soh76/FR20fmb0mqoe9CaHGyxT9vqZIdkG3yHY1CUJJPyWtX2r8YX1k5xWQxxUkU
         jiKHja7hRFwKyVfKIvLIO7WTjSSg1UkuRtUVVhhnb2FPDhpgec6Fr3QqF+NxnIhur4WX
         vbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752663947; x=1753268747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0um87P4/3R8smq76yisAQlQe7fLie4Eoep5/bLrQas=;
        b=slE6tZih3fU5vPZwc3rN6keKIxiHK8VZxiTr1EP/SImkB1nho3bSS4o+o665Tl0Bt5
         J0KO+j6XxpkMPYgIpe/JXdOqh4LX65HMXKATERelQwN8lM9uW4G1eWfgwaa24oaNaPld
         KXQncK8fIcxgy/PJgnK6p6UwR84RGQXar+Emw3qcKfkAELAfao0qqW7sKONJRyv+Ma/K
         +qXqkwR2UWCQpBj4an9T9A+j7OeLOqNL3JFvG9rdU+Ft/1FaXITSQo1CkaSvKVZHGgQR
         xiU2543IRWGbEa7FE0bfufhdPdgKX8a+dFX0JZnVf9CGptZuSLKOQj5lKeHDX2CgpAtE
         NvAw==
X-Forwarded-Encrypted: i=1; AJvYcCVj095Lad0yz90aWN8mnovgf68QsW19ZIO4yFTYyO6qQn1PxKLTF378H6Pi08KmkHAFRFISAEuYx3SQpeOc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/n1X9nNyRzeHGG/cinaTdwIrjqVKgPuip+2nvb8PY+xIxfV/K
	NUNfuQgpC/4iLF+5v3i+Ih7S22toGgDXgpMi3obTr458aZwcJ/ndmXw6tHLJZgsg+CAvFJqUo6Q
	RxJw3GfmQ6YnV0PfbvHwc2KVntl2Qf2CQO9FkhrT5
X-Gm-Gg: ASbGncurroUk+p+W82l5/RQKPiXHvXIvpJOM+4k7tfJWp/Ggtp2N9pqsXWc333xqGki
	Pr4H9nX+Eid9sGjmcvgMVGCO4dwbOkJM6dJDl5ZwS0lK6P3EB9aOsy9FJtNFBvVT05gDydGuibF
	Pp41CbuNWqGlc52usmPLF9rIbg70HqRi2kTOsWuWQC9d9TJWKYb7QLFmRSxaZ8PIbJGCtl90Ntk
	uq5+n1H5DbfeBZcEH3DRvfAjRDdAHuLOmE9
X-Google-Smtp-Source: AGHT+IG34MfGj/Zl62zVn178UZKzeSI18O6et/oIgJa6CLuO77Ce5w+YXMKKyouWv/4JvQ+6pdezBz48FGUKIecZjcI=
X-Received: by 2002:a05:622a:1aa0:b0:4a9:b6e1:15a with SMTP id
 d75a77b69052e-4ab954d8746mr2391171cf.24.1752663946223; Wed, 16 Jul 2025
 04:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715093350.2584932-1-tabba@google.com> <20250715093350.2584932-3-tabba@google.com>
 <a4091b13-9c3b-48bf-a7f6-f56868224cf5@intel.com> <CA+EHjTy5zUJt5n5N1tRyHUQN6-P6CPqyC7+6Zqhokx-3=mvx+A@mail.gmail.com>
 <418ddbbd-c25e-4047-9317-c05735e02807@intel.com> <778ca011-1b2f-4818-80c6-ac597809ec77@redhat.com>
 <6927a67b-cd2e-45f1-8e6b-019df7a7417e@intel.com>
In-Reply-To: <6927a67b-cd2e-45f1-8e6b-019df7a7417e@intel.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 16 Jul 2025 12:05:09 +0100
X-Gm-Features: Ac12FXwLnudqPBETDUTkvUad_Ou8IyTTedPM6CDydpNfw0kKmZr9XGnTtqO-hwY
Message-ID: <CA+EHjTz7C4WgS2-Dw0gywHy+zguSNXKToukPiRfsdiY8+Eq6KA@mail.gmail.com>
Subject: Re: [PATCH v14 02/21] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to CONFIG_KVM_GENERIC_GMEM_POPULATE
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com, 
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

On Wed, 16 Jul 2025 at 12:02, Xiaoyao Li <xiaoyao.li@intel.com> wrote:
>
> On 7/16/2025 6:25 PM, David Hildenbrand wrote:
> > On 16.07.25 10:31, Xiaoyao Li wrote:
> >> On 7/16/2025 4:11 PM, Fuad Tabba wrote:
> >>> On Wed, 16 Jul 2025 at 05:09, Xiaoyao Li<xiaoyao.li@intel.com> wrote:
> >>>> On 7/15/2025 5:33 PM, Fuad Tabba wrote:
> >>>>> The original name was vague regarding its functionality. This Kconfig
> >>>>> option specifically enables and gates the kvm_gmem_populate()
> >>>>> function,
> >>>>> which is responsible for populating a GPA range with guest data.
> >>>> Well, I disagree.
> >>>>
> >>>> The config KVM_GENERIC_PRIVATE_MEM was introduced by commit
> >>>> 89ea60c2c7b5
> >>>> ("KVM: x86: Add support for "protected VMs" that can utilize private
> >>>> memory"), which is a convenient config for vm types that requires
> >>>> private memory support, e.g., SNP, TDX, and KVM_X86_SW_PROTECTED_VM.
> >>>>
> >>>> It was commit e4ee54479273 ("KVM: guest_memfd: let kvm_gmem_populate()
> >>>> operate only on private gfns") that started to use
> >>>> CONFIG_KVM_GENERIC_PRIVATE_MEM gates kvm_gmem_populate() function. But
> >>>> CONFIG_KVM_GENERIC_PRIVATE_MEM is not for kvm_gmem_populate() only.
> >>>>
> >>>> If using CONFIG_KVM_GENERIC_PRIVATE_MEM to gate kvm_gmem_populate() is
> >>>> vague and confusing, we can introduce KVM_GENERIC_GMEM_POPULATE to gate
> >>>> kvm_gmem_populate() and select KVM_GENERIC_GMEM_POPULATE under
> >>>> CONFIG_KVM_GENERIC_PRIVATE_MEM.
> >>>>
> >>>> Directly replace CONFIG_KVM_GENERIC_PRIVATE_MEM with
> >>>> KVM_GENERIC_GMEM_POPULATE doesn't look correct to me.
> >>> I'll quote David's reply to an earlier version of this patch [*]:
> >>
> >> It's not related to my concern.
> >>
> >> My point is that CONFIG_KVM_GENERIC_PRIVATE_MEM is used for selecting
> >> the private memory support. Rename it to KVM_GENERIC_GMEM_POPULATE is
> >> not correct.
> >
> > It protects a function that is called kvm_gmem_populate().
> >
> > Can we stop the nitpicking?
>
> I don't think it's nitpicking.
>
> Could you loot into why it was named as KVM_GENERIC_PRIVATE_MEM in the
> first place, and why it was picked to protect kvm_gmem_populate()?

That is, in part, the point of this patch. This flag protects
kvm_gmem_populate(), and the name didn't reflect that. Now it does. It
is the only thing it protects.

Cheers,
/fuad

