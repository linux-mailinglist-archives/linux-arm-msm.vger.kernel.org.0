Return-Path: <linux-arm-msm+bounces-50645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A55A56E9F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 18:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21C303B796B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 17:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC1C23F438;
	Fri,  7 Mar 2025 17:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BAaQkjZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F6A23F27B
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 17:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367054; cv=none; b=R+ta1IRwvBKHje4Fot57OkiCE3VRlj8o5hUWQFp6gwqDH+EGGX6c+OiwFkNh6W3asDCB5JneAy38swjzNWtqX9zDuOJzisjACu1YxQbCHgZ7rA13qVxbR7etK1d9z+rhIyiEwJDRP26qO8q0lq7wzmlnO41VE68o5qqHwmQNFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367054; c=relaxed/simple;
	bh=An48yV85CNjFH2J0pfyshY4UvotJSpWmM2w2afmLg9g=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=lN6kd1ckYu0O6jYm0MDP3BRqrvi00KHwm+xy1/NHF963uhQvplOStMpZaQD+ULWpsDna5QKJBw0VOjgSVO1f9br/eOqnPoG9U70z86mSayG9uiwT6XQatNjrAwOuyoLQiZbLtEK3cgVCBCsArBYUBj79/CxTH2x3PWDm6SDU0rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BAaQkjZx; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso6210779a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Mar 2025 09:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741367051; x=1741971851; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rmlhlPewNEBG+pQdCXEcSr0zWXtYtplwY6Z+RVb7xs=;
        b=BAaQkjZx/Govb4ULkSzcakHwRa3HS1ytP9vjasyHsgIRZMDp/5GiN0tfCvXIGubLFk
         xm4Mbs+1Lr/RVPkzCeJxzomRqoKCl6s10pn4GmdaLQetj/87CAMJeAGhtRUn5AZkUQjD
         cjVGT53gqwKg6wCpeIEjDgttuGUn/wBe3JlszTCKZXyVk8IN8HxLZXRxld3NPXT20Jnb
         0jhOKn9SWOQE45Kpdp3cCsrY5QykxWzOuS8WVAxNLzDmf3E2/H5poKObYrh1w37FZ5OB
         BpjgwQIyWp43ets2ckgUb5O+kknWqtq9hOG5aDPxa04VdiaVfyW5UvC03l0XxMJxsE/w
         I6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741367051; x=1741971851;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5rmlhlPewNEBG+pQdCXEcSr0zWXtYtplwY6Z+RVb7xs=;
        b=K1fy+Tw4YTvNZ6QEMx0queT8bTgQKUQMQILjV6SQ/FCXiCV9uMFwcyLIECk5vg+kEe
         Co5SoUN1AQocYTlLofa3jMrkquB3BYQAk5E/cvU3y20KopzkpVjHrNsvgjjiznr8kUb3
         o6QZfP7h8h0/E91S7ABriO6nrygvJ1PVJ6jPteswjLCqH639LMTIL3w/HUSn3XAJOR5i
         +HyxVXLyudUwoxnG+oc2n+j/DdRZBwRlhZq6QLQrrdBzM/XeoenEJkd2BEe8eyAh30eg
         A9gGDXSXDuKBa7RZSnIMOupaGS6lJK3WORjYrfV4lFD0/1ZijTUYo3AEgYVeVKZgWFKy
         amDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLlwtcJ3IegDInDVMb/Tkf5DZyD2xmDgLSmcyFWjugE5IlwpLuIhsPFo5UgiDHVDlDXiHRoz7ROT6e/viX@vger.kernel.org
X-Gm-Message-State: AOJu0YwJskpc6sSmkQkGJB7dE/Qkb/DPXWLWYaZUV7nGbDM9r4Pal//c
	gS224w4DNl9T9iZA+amBVVkd3TvhpmA1RT+Ln3l+svocwewera7qDmZzVipWkWQ6NGxy1mZMdLU
	YNXfKAZSa2oFw4Lf7ZP6ILA==
X-Google-Smtp-Source: AGHT+IG6gHdllcDNQV4+hoCTAlEMUZwJ3RkEUZgkLlJluFlZCeWSULH+9PhODAFdQurLMAd2+VXO5p8Z3HLOThloWQ==
X-Received: from pjbsp5.prod.google.com ([2002:a17:90b:52c5:b0:2fa:1771:e276])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4d12:b0:2fe:8c22:48b0 with SMTP id 98e67ed59e1d1-2ff7cea6125mr6687647a91.15.1741367051284;
 Fri, 07 Mar 2025 09:04:11 -0800 (PST)
Date: Fri, 07 Mar 2025 17:04:10 +0000
In-Reply-To: <20250303171013.3548775-3-tabba@google.com> (message from Fuad
 Tabba on Mon,  3 Mar 2025 17:10:06 +0000)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzbjucu60l.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v5 2/9] KVM: guest_memfd: Handle final folio_put() of
 guest_memfd pages
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>
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
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> Before transitioning a guest_memfd folio to unshared, thereby
> disallowing access by the host and allowing the hypervisor to
> transition its view of the guest page as private, we need to be
> sure that the host doesn't have any references to the folio.
>
> This patch introduces a new type for guest_memfd folios, which
> isn't activated in this series but is here as a placeholder and
> to facilitate the code in the subsequent patch series. This will
> be used in the future to register a callback that informs the
> guest_memfd subsystem when the last reference is dropped,
> therefore knowing that the host doesn't have any remaining
> references.
>
> This patch also introduces the configuration option,
> KVM_GMEM_SHARED_MEM, which toggles support for mapping
> guest_memfd shared memory at the host.
>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/kvm_host.h   |  7 +++++++
>  include/linux/page-flags.h | 16 ++++++++++++++++
>  mm/debug.c                 |  1 +
>  mm/swap.c                  |  9 +++++++++
>  virt/kvm/Kconfig           |  5 +++++
>  5 files changed, 38 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f34f4cfaa513..7788e3625f6d 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2571,4 +2571,11 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>  				    struct kvm_pre_fault_memory *range);
>  #endif
>
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +static inline void kvm_gmem_handle_folio_put(struct folio *folio)
> +{
> +	WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
> +}
> +#endif
> +
>  #endif

Following up with the discussion at the guest_memfd biweekly call on the
guestmem library, I think this folio_put() handler for guest_memfd could
be the first function that's refactored out into (placeholder name)
mm/guestmem.c.

This folio_put() handler has to stay in memory even after KVM (as a
module) is unloaded from memory, and so it is a good candidate for the
first function in the guestmem library.

Along those lines, CONFIG_KVM_GMEM_SHARED_MEM in this patch can be
renamed CONFIG_GUESTMEM, and CONFIG_GUESTMEM will guard the existence of
PGTY_guestmem.

CONFIG_KVM_GMEM_SHARED_MEM can be introduced in the next patch of this
series, which could, in Kconfig, select CONFIG_GUESTMEM.

> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 6dc2494bd002..daeee9a38e4c 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -933,6 +933,7 @@ enum pagetype {
>  	PGTY_slab	= 0xf5,
>  	PGTY_zsmalloc	= 0xf6,
>  	PGTY_unaccepted	= 0xf7,
> +	PGTY_guestmem	= 0xf8,
>
>  	PGTY_mapcount_underflow = 0xff
>  };
> @@ -1082,6 +1083,21 @@ FOLIO_TYPE_OPS(hugetlb, hugetlb)
>  FOLIO_TEST_FLAG_FALSE(hugetlb)
>  #endif
>
> +/*
> + * guestmem folios are used to back VM memory as managed by guest_memfd. Once
> + * the last reference is put, instead of freeing these folios back to the page
> + * allocator, they are returned to guest_memfd.
> + *
> + * For now, guestmem will only be set on these folios as long as they  cannot be
> + * mapped to user space ("private state"), with the plan of always setting that
> + * type once typed folios can be mapped to user space cleanly.
> + */
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +FOLIO_TYPE_OPS(guestmem, guestmem)
> +#else
> +FOLIO_TEST_FLAG_FALSE(guestmem)
> +#endif
> +
>  PAGE_TYPE_OPS(Zsmalloc, zsmalloc, zsmalloc)
>
>  /*
> diff --git a/mm/debug.c b/mm/debug.c
> index 8d2acf432385..08bc42c6cba8 100644
> --- a/mm/debug.c
> +++ b/mm/debug.c
> @@ -56,6 +56,7 @@ static const char *page_type_names[] = {
>  	DEF_PAGETYPE_NAME(table),
>  	DEF_PAGETYPE_NAME(buddy),
>  	DEF_PAGETYPE_NAME(unaccepted),
> +	DEF_PAGETYPE_NAME(guestmem),
>  };
>
>  static const char *page_type_name(unsigned int page_type)
> diff --git a/mm/swap.c b/mm/swap.c
> index 47bc1bb919cc..241880a46358 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -38,6 +38,10 @@
>  #include <linux/local_lock.h>
>  #include <linux/buffer_head.h>
>
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +#include <linux/kvm_host.h>
> +#endif
> +
>  #include "internal.h"
>
>  #define CREATE_TRACE_POINTS
> @@ -101,6 +105,11 @@ static void free_typed_folio(struct folio *folio)
>  	case PGTY_hugetlb:
>  		free_huge_folio(folio);
>  		return;
> +#endif
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +	case PGTY_guestmem:
> +		kvm_gmem_handle_folio_put(folio);
> +		return;
>  #endif
>  	default:
>  		WARN_ON_ONCE(1);
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 54e959e7d68f..37f7734cb10f 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -124,3 +124,8 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
>  config HAVE_KVM_ARCH_GMEM_INVALIDATE
>         bool
>         depends on KVM_PRIVATE_MEM
> +
> +config KVM_GMEM_SHARED_MEM
> +       select KVM_PRIVATE_MEM
> +       depends on !KVM_GENERIC_MEMORY_ATTRIBUTES

Enforcing that KVM_GENERIC_MEMORY_ATTRIBUTES is not selected should not
be a strict requirement. Fuad explained in an offline chat that this is
just temporary.

If we have CONFIG_GUESTMEM, then this question is moot, I think
CONFIG_GUESTMEM would just be independent of everything else; other
configs would depend on CONFIG_GUESTMEM.

> +       bool

