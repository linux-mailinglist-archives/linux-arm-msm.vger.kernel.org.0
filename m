Return-Path: <linux-arm-msm+bounces-50530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69721A54F78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 16:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BDCD3B04A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 15:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F52148FF5;
	Thu,  6 Mar 2025 15:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xTyzc5Up"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7671624C8
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741276099; cv=none; b=JZNFTsBGEZINYJd09y6MHZA/g6qYnyMWw2FHxbVaQ1+nfU96MYH9q+7HeKRFWGxtGP/OY0JBhPI397qwnhK4ITHt285xu4fIpu04SRFVBBSFgrjjKrojUE9PWJbD6VVbIUWOQK3RrqOftwInKhmRKJ0Fbca11UMgw0/SMch5ihQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741276099; c=relaxed/simple;
	bh=sVoNZXopYL7XJzNhGxf33zifIINRMsLYqPItqDsaZWw=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=A6M4qM75nTO4B0kZYrMFnW9KLxA7UkJBPq5koTS4nuA5fYEooLfrfs0/2/gEu4+s3tON2l/xj4atQY+Ekd0hxCPw9MJc6uYndG26fukw7oe23HK0ZI9inr0GVK32R6Zrv27bNoDKLE/C1gARf3AYL/Kpu4BugPKj0aDaD3ByPL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xTyzc5Up; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff581215f7so1522894a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 07:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741276097; x=1741880897; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WN5n6yCvcOa+zM2USNjiOsagVXAB7Ffxj7AYdaUTQwM=;
        b=xTyzc5UpGVNhFtnyK7H5YbSq+jqYuvkR3ynLI4dWF+YZBpqdHwyOZy5tDy6yU44/fE
         BYp3eNn01C5kJFcutUvtJ2zs424XGHN56tG8QeIPg1+XvkdBP6kIVWpHaEH5Ta2qmJBr
         fL0noPFCqkql9bJBp3GXQzvS5XmTU24isbKDMYiXjdpMsZhge10ViIPZrCS7T/P82Ywx
         dDs3ui3zzqq0dDs/xQCA1ZIGI/v8ibKSG4ZPTrPXOmpw4uANo5mwsohCpknseQK7ZXle
         usLon1f0qqEwsMnVTkSawoiOE71S0KvVNT5sWqJEEKefbr4PNdZOdXljH472EcQYtQkE
         NEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276097; x=1741880897;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WN5n6yCvcOa+zM2USNjiOsagVXAB7Ffxj7AYdaUTQwM=;
        b=fKWrAl4ydjzPhDsZdj2jCBwIavw0HV/eoB8o6eVwHPhVlBJjTuCdKJqugjCgsFooav
         rDmEDwk9YKMoTe8OYQzuUBs2kTBAvHw7OlYv5WxLedXqz9E+Qr4M2LBi8z3zuFXdUWBW
         ACuFwukapEEVpX/8F+K4w0JQuHZLWN3Fauj/kiIrO6Mny2J9jPWZ5LBAHkHa0XRNKGgG
         uLUy0YqYgi/1C2ufNQU+Vqn8CXY4EyZix8A5z3te0BkOztFC4E4rYtb9gYdhaxWHyD5g
         eceGN98BnZhqQqL8ZvV3wlF1Ia3KDZJmEwgqpFgRM8I6nYI2Qa6krivEYHV71fCgoe7M
         nyJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbqYypqUMWzyzh6DeV011qoHK00v9rAaskiey6vXG7aQm1APN/oRVZaAaq4G2ej7BUazcz5bzyTNTvrdUk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvo8GTDnvDi9inm6IRG7rHX9gi6raUmnWADmj/HCDrbfapICuj
	84lVrtIWxSl/MvGhiGTGZ9agULEZyGZyBmHzbuoQDmcIAPzh6xOwmA9Tj9NLc9OoRVw8KZ0nTxA
	4cD5iSgdEDM9YKtGruR2XYg==
X-Google-Smtp-Source: AGHT+IGIpKIz67HLCauppdWF07A7kBE16hQeQDJtBmIWPGn65BdGHarhO9hkIPwx1gqSyqaBuxIwDSrAUaXKDp4m4A==
X-Received: from pjbqa14.prod.google.com ([2002:a17:90b:4fce:b0:2fa:1fac:2695])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a87:b0:2ff:682b:b759 with SMTP id 98e67ed59e1d1-2ff682bb96amr4351705a91.7.1741276096694;
 Thu, 06 Mar 2025 07:48:16 -0800 (PST)
Date: Thu, 06 Mar 2025 15:48:15 +0000
In-Reply-To: <5c394c80-bb2b-4f9c-9b76-78b0696fa316@redhat.com> (message from
 David Hildenbrand on Fri, 28 Feb 2025 18:33:30 +0100)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzo6yetb28.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v4 04/10] KVM: guest_memfd: Add KVM capability to check if
 guest_memfd is shared
From: Ackerley Tng <ackerleytng@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: tabba@google.com, peterx@redhat.com, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, xiaoyao.li@intel.com, 
	yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org, 
	amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, 
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
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

David Hildenbrand <david@redhat.com> writes:

> On 28.02.25 18:22, Fuad Tabba wrote:
>> Hi Peter,
>> 
>> On Fri, 28 Feb 2025 at 08:24, Peter Xu <peterx@redhat.com> wrote:
>>>
>>> On Tue, Feb 18, 2025 at 05:24:54PM +0000, Fuad Tabba wrote:
>>>> Add the KVM capability KVM_CAP_GMEM_SHARED_MEM, which indicates
>>>> that the VM supports shared memory in guest_memfd, or that the
>>>> host can create VMs that support shared memory. Supporting shared
>>>> memory implies that memory can be mapped when shared with the
>>>> host.
>>>>
>>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>>> ---
>>>>   include/uapi/linux/kvm.h | 1 +
>>>>   virt/kvm/kvm_main.c      | 4 ++++
>>>>   2 files changed, 5 insertions(+)
>>>>
>>>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>>>> index 45e6d8fca9b9..117937a895da 100644
>>>> --- a/include/uapi/linux/kvm.h
>>>> +++ b/include/uapi/linux/kvm.h
>>>> @@ -929,6 +929,7 @@ struct kvm_enable_cap {
>>>>   #define KVM_CAP_PRE_FAULT_MEMORY 236
>>>>   #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
>>>>   #define KVM_CAP_X86_GUEST_MODE 238
>>>> +#define KVM_CAP_GMEM_SHARED_MEM 239
>>>
>>> I think SHARED_MEM is ok.  Said that, to me the use case in this series is
>>> more about "in-place" rather than "shared".
>>>
>>> In comparison, what I'm recently looking at is a "more" shared mode of
>>> guest-memfd where it works almost like memfd.  So all pages will be shared
>>> there.
>>>
>>> That helps me e.g. for the N:1 kvm binding issue I mentioned in another
>>> email (in one of my relies in previous version), in which case I want to
>>> enable gmemfd folios to be mapped more than once in a process.
>>>
>>> That'll work there as long as it's fully shared, because all things can be
>>> registered in the old VA way, then there's no need to have N:1 restriction.
>>> IOW, gmemfd will still rely on mmu notifier for tearing downs, and the
>>> gmem->bindings will always be empty.
>>>
>>> So if this one would be called "in-place", then I'll have my use case as
>>> "shared".
>> 
>> I understand what you mean. The naming here is to be consistent with
>> the rest of the series. I don't really have a strong opinion. It means
>> SHARED_IN_PLACE, but then that would be a mouthful. :)
>
> I'll note that Patrick is also driving it in "all shared" mode for his 
> direct-map removal series IIRC.
>
> So we would have
>
> a) All private
> b) Mixing of private and shared (incl conversion)
> c) All shared
>
> "IN_PLACE" might be the wrong angle to look at it.

How about something like "supports_mmap" or "mmap_capable"?

So like

+ KVM_CAP_GMEM_MMAP
+ CONFIG_KVM_GMEM_MMAP_CAPABLE
+ kvm_arch_gmem_mmap_capable()

I'm just trying to avoid the use of shared, which could already mean 

+ shared between processes
+ shared between guest and host


