Return-Path: <linux-arm-msm+bounces-56587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 519CBAA7C05
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6EB07B3CF6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED371FC10E;
	Fri,  2 May 2025 22:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lKefQ8E/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA451FBE87
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 22:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223607; cv=none; b=mQ0+mIuB/2Dies2TMFFXE/PDcS4F8qZTnXWPBGPejdUX9JL99V+ZxM2SqZP2oxALKtZEGsX8NxvilqwLWGszYR3dTTcYj30PKgPwKpErt4QM+84BYI4lVlwDiQH7U+jL3s/0GGFGV9uIivgm01hHsM6Wn2uX8P8/ctWphYCBKsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223607; c=relaxed/simple;
	bh=m5Hoh6pzAz9nIZOvX2sYjvUV7805XrUC575uenp3TJc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R9ABhC0FV9YvlCriDF1bzqrobS16KjlN4JnD4GPyQzCABdyvGgFAOTcvaDkqDE06cNRsDlmZ9JNwyw3twA+CFvDzKDxE6viwfuqvfAaXRY6GeTRnMoTML+uANtY2X/3Tk95EZADyXyz9T63GBQwwthJoxeklxKtRQRvVaFv6utk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lKefQ8E/; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73e0094706bso3580758b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 15:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746223604; x=1746828404; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u0rvKXfI40dUiDjZAFQTQvsOHlU9HrI0d7XiPQv+wf4=;
        b=lKefQ8E/UurTr1bTeDhbseQbkNQATFpSGnwiIo3a+Wfw5vjNaEtNHAz6oi1Su7XFik
         +hDn2YGSwgK+I15R7EAiUTyM+yhZBhVryq8aTVl4uKTJ2QsWY7DYSGVb3HCgKczNL2ii
         jOAFFImJezlSvXDpYeBkYvRa0u5qnCKqqv46F7ecF7vtL9AVws45sebbIEUQLgHTDObc
         unaimQfFeRTEjw1uxCwwrfLnPLsH+p2kprPmMLt/7dSFCPLeFR2ql5owQbnYrSrReDCx
         YRq66BjBq/rjo7ycruCqXPplWO3w+RzD2cysjdWKUhxeVaX9Hwuy9A1ORle0I+mCo5eb
         2vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746223604; x=1746828404;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0rvKXfI40dUiDjZAFQTQvsOHlU9HrI0d7XiPQv+wf4=;
        b=a+3i4uxGD1LQdWcZmUakfm/Hv2keXb8qrXc288xOQdT3khSAELpuztn5eedLMkO7wE
         GJcQ90uk1COG92wIuq0UgEmyLaNAHP+pO2sXcTfcxI+UFbDlvb+6RloDiaxfFOvba94t
         QyTrLQfwghLXaWMyK34ML/nSu2X2qBkv5v0d+aqFTkFCFLgIt572EI83UmoYK5yZyuYF
         sA9XBqycAKl8iFJ6GbMAWcSR5mG/zJG1tlkDntG5tBOkcQgBeYX9o1wNU37Bh0u0wmD9
         hgUngKdiF0U6UC7X6XOs7bBz1rc5Diih22QdrIcEWqEJFbyEmESJHrwmx8D5SNKgRRL7
         ++NQ==
X-Forwarded-Encrypted: i=1; AJvYcCULknmBwZre94bNUhVVm45c3p7zO8vsei5hCRS0NczOkhnqfbcrp9L1dz8MLX6rSTS9BNoQmC86xQAnrTZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzKaUzB9o7rSAPwzR+xPgkkr1X1bnPamfV2L4y0TV8QhwN+zshU
	k590uAUpkWFs4TLVBbBaRIOjbR6mcf2xflM6c0NByyLEl1/oZ9CYCnCfDQBlFFT7hyRcnsEXXIw
	C/cr2gL25ZZUH303F4A3WJQ==
X-Google-Smtp-Source: AGHT+IH1gv4RpFaDlQVit34hQ/BYrbtXVH0HRGTDjEqwVYkLbSyXOxx+M0Wdxyv5Mv70FNiqko9tqyIjIcC3tcU0Ug==
X-Received: from pfbdu11.prod.google.com ([2002:a05:6a00:2b4b:b0:730:90b2:dab])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:324c:b0:73e:23bd:fb9c with SMTP id d2e1a72fcca58-74058b1fd67mr4595140b3a.23.1746223604596;
 Fri, 02 May 2025 15:06:44 -0700 (PDT)
Date: Fri, 02 May 2025 15:06:43 -0700
In-Reply-To: <cd426cb8-e758-4028-adf6-9426884f6f7d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430165655.605595-1-tabba@google.com> <20250430165655.605595-9-tabba@google.com>
 <cd426cb8-e758-4028-adf6-9426884f6f7d@redhat.com>
Message-ID: <diqzh622pszw.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v8 08/13] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
From: Ackerley Tng <ackerleytng@google.com>
To: David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
Content-Type: text/plain; charset="UTF-8"

David Hildenbrand <david@redhat.com> writes:

> On 30.04.25 18:56, Fuad Tabba wrote:
>> Add support for mmap() and fault() for guest_memfd backed memory
>> in the host for VMs that support in-place conversion between
>> shared and private. To that end, this patch adds the ability to
>> check whether the VM type supports in-place conversion, and only
>> allows mapping its memory if that's the case.
>> 
>> This patch introduces the configuration option KVM_GMEM_SHARED_MEM,
>> which enables support for in-place shared memory.
>> 
>> It also introduces the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
>> indicates that the host can create VMs that support shared memory.
>> Supporting shared memory implies that memory can be mapped when shared
>> with the host.
>> 
>> Signed-off-by: Fuad Tabba <tabba@google.com>
>> ---
>>   include/linux/kvm_host.h | 15 ++++++-
>>   include/uapi/linux/kvm.h |  1 +
>>   virt/kvm/Kconfig         |  5 +++
>>   virt/kvm/guest_memfd.c   | 92 ++++++++++++++++++++++++++++++++++++++++
>>   virt/kvm/kvm_main.c      |  4 ++
>>   5 files changed, 116 insertions(+), 1 deletion(-)
>> 
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 9419fb99f7c2..f3af6bff3232 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -729,6 +729,17 @@ static inline bool kvm_arch_supports_gmem(struct kvm *kvm)
>>   }
>>   #endif
>>   
>> +/*
>> + * Arch code must define kvm_arch_gmem_supports_shared_mem if support for
>> + * private memory is enabled and it supports in-place shared/private conversion.
>> + */
>> +#if !defined(kvm_arch_gmem_supports_shared_mem) && !IS_ENABLED(CONFIG_KVM_GMEM_SHARED_MEM)
>> +static inline bool kvm_arch_gmem_supports_shared_mem(struct kvm *kvm)
>> +{
>> +	return false;
>> +}
>> +#endif
>> +
>>   #ifndef kvm_arch_has_readonly_mem
>>   static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
>>   {
>> @@ -2516,7 +2527,9 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>   
>>   static inline bool kvm_mem_from_gmem(struct kvm *kvm, gfn_t gfn)
>>   {
>> -	/* For now, only private memory gets consumed from guest_memfd. */
>> +	if (kvm_arch_gmem_supports_shared_mem(kvm))
>> +		return true;
>
> After our discussion yesterday, am I correct that we will not be 
> querying the KVM capability, but instead the "SHARED_TRACKING" (or 
> however that flag is called) on the underlying guest_memfd instead?
>
> I assume the function would then look something like
>
> if (!kvm_supports_gmem(kvm))
> 	return false;
> if (kvm_arch_gmem_supports_shared_mem(kvm))
> 	return .. TBD, test the gmem flag for the slot via gfn
> return kvm_mem_is_private(kvm, gfn);
>

Yes, I believe we're aligned here. I added a patch that will do this,
but it depends on other parts of the patch series and I think it's
better if you review it altogether when Fuad posts it (as opposed to
reviewing a snippet I drop here.

>> +
>>   	return kvm_mem_is_private(kvm, gfn);
>>   }
>>   
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index b6ae8ad8934b..8bc8046c7f3a 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -930,6 +930,7 @@ struct kvm_enable_cap {
>>   #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
>>   #define KVM_CAP_X86_GUEST_MODE 238
>>   #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
>> +#define KVM_CAP_GMEM_SHARED_MEM 240
>>   
>>   struct kvm_irq_routing_irqchip {
>>   	__u32 irqchip;
>> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
>> index 559c93ad90be..f4e469a62a60 100644
>> --- a/virt/kvm/Kconfig
>> +++ b/virt/kvm/Kconfig
>> @@ -128,3 +128,8 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
>>   config HAVE_KVM_ARCH_GMEM_INVALIDATE
>>          bool
>>          depends on KVM_GMEM
>> +
>> +config KVM_GMEM_SHARED_MEM
>> +       select KVM_GMEM
>> +       bool
>> +       prompt "Enables in-place shared memory for guest_memfd"
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 6db515833f61..8bc8fc991d58 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -312,7 +312,99 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>>   	return gfn - slot->base_gfn + slot->gmem.pgoff;
>>   }
>>   
>> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
>> +/*
>> + * Returns true if the folio is shared with the host and the guest.
>> + */
>> +static bool kvm_gmem_offset_is_shared(struct file *file, pgoff_t index)
>> +{
>> +	struct kvm_gmem *gmem = file->private_data;
>> +
>> +	/* For now, VMs that support shared memory share all their memory. */
>> +	return kvm_arch_gmem_supports_shared_mem(gmem->kvm);
>
> Similar here: likely we want to check the guest_memfd flag.
>
> -- 
> Cheers,
>
> David / dhildenb


