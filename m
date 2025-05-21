Return-Path: <linux-arm-msm+bounces-58826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1539DABEA0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 04:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CF431B67263
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 02:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BD720DD75;
	Wed, 21 May 2025 02:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZMHbAm9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6C148827
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 02:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747795648; cv=none; b=XTmGGpF4X8tR2j/Rd/hGlcT3HUPCoII59VTMvAw93FSX45FYFkV1ZnURvCAO930LX1dcOuLkYGKjFFpCvE4C6e5suI8JPSxNQzT6ABVRkqfvRwWrKW6hEUI3zc5ABmL2Chym0kwfS8DB8F8peZawAc5gA967ZmrionZY0TBdKxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747795648; c=relaxed/simple;
	bh=vxbtc1EDqSXR3qS6Mh7hkJsbnUOQ20m1M8ob4WnjGJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcJ6XdF67XkWkfaLn+xYXSE+Fg1j964qQwE1th/ymNl6hwDzdvSQGFjDXNawKBYBPzCoXdKlaocEdb/TmJ9SngQm6oUzSkUyLwPEoM3vyHu+PjsEJ5oBCSYMKprJyAbDc2u9Aw8EqYq/vXHyAVsj4zk2UUthI5YOTwBszN5zZ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZMHbAm9b; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747795642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uu12XEh7AToGw+jGxDZjXo2gU6G0yYISDzb3cxuu9wE=;
	b=ZMHbAm9bGNrmWwACSPAJkG1CIKMAH9ncz8VPUrBwVQfOa3I2sNXcnk0QucpurwrOCr2toN
	mz7rvKF2+ScgUz32gwooFqMh4qDC5yIi/lkrC4dlyuvONdKUxE0i9kiNUMulOlolvokFS1
	Nv947MdWCTMOoKFBlh1OL4x3YRvNoYE=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-QRu6K7fxMoGTr0_uKAT_hg-1; Tue, 20 May 2025 22:47:18 -0400
X-MC-Unique: QRu6K7fxMoGTr0_uKAT_hg-1
X-Mimecast-MFC-AGG-ID: QRu6K7fxMoGTr0_uKAT_hg_1747795637
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74299055c3dso8861499b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747795637; x=1748400437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uu12XEh7AToGw+jGxDZjXo2gU6G0yYISDzb3cxuu9wE=;
        b=mthMAWZyakwJSV2hYLHvt2vgdxwtSZXe9eH01C4uZuZF8sus9ybUtq6T9BsnZoYZBX
         GKbsz6FlVfpTP+n+X2dqNoZU7dDeuqGor0HELVkaSNNeUVI7/BJOZ9S0Oqrmhbm52503
         f1oMpvW/Mh0BG6b/lsdJg5jgR9EXbca2fOMfuD8gnkV/XiuTnnMs04NTOOjcF8mgMx1q
         FUrw0VXoLQ05WjB8gcfjxjnU3zPWpWV8aO8Bea+9harKm3avECrOnIHStfz4ODSvu1/A
         Qiuj6eWES4lurJwgbRM70kXSs/NctFbL3b3zP9GHn+T4XhDiktiXKG6wc+W70VSBPP53
         1osA==
X-Forwarded-Encrypted: i=1; AJvYcCUVa2Uh0K06fIXm5O5K6ZGXvGY2bEaQ21xzUjpP7aWrvu3ngQsZ+CqKRKfv8V44/Y9bjZyluo61mtCqPBgk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8+roVP/Y5pxcfGiv4ud0cSWNMbw8v5OyWoG3nCmU8AfmNWIZd
	HAvgW9HUQgsWvEtH1/RxIMBGPy++AFjBm92rE1XxRSkTZqADnbI5IYKA9Ud3EbtP/DL0T7wHWmh
	drp1zwDUQ2KEu54BtMNEJZLY1OsLuWXIsLXmG1fUpbEOYUWeHMZ3JnuGgvmD5/O00QPg=
X-Gm-Gg: ASbGncsuCbCWGWb5qVoTL/lnN3w8qAMpDzcnWcrJwIz80+lNstgdRqbtNNUJqtVzOiX
	zKYdGHAWk/TNq6t+8BkikMoFQaACeKY45kuWluRXePIDlSO0OYG3zxE6f7TCizopXEqv3PuXnWL
	oIFbfAQjpqKTg985Jcs9tdZPOd95m/RXpJJ0sBA40ladEpsp8+ifVa7M91L8t2ynzVD6YfgeEzk
	jzHw0OZUW/UMTajmSP8ydkDNqlFvQ4Z8WVMfXd3LUIAJa3DH+EhvdDWZ8R3bBi/b3K06yrk7IRT
	nBB5lrMCszsA
X-Received: by 2002:aa7:8e8a:0:b0:742:b3a6:db09 with SMTP id d2e1a72fcca58-742b3a6dbdbmr19583166b3a.16.1747795637079;
        Tue, 20 May 2025 19:47:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzkHF4ER+v9r//dGWI45mzF35nZdjti9WpLsYuT60Xr9ICzKlggdIDgLPRs9dM7JzLT2yOBw==
X-Received: by 2002:aa7:8e8a:0:b0:742:b3a6:db09 with SMTP id d2e1a72fcca58-742b3a6dbdbmr19583136b3a.16.1747795636622;
        Tue, 20 May 2025 19:47:16 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d1b2sm8941786b3a.66.2025.05.20.19.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 19:47:15 -0700 (PDT)
Message-ID: <498765f6-c20e-48f2-98e4-4134bfe150a3@redhat.com>
Date: Wed, 21 May 2025 12:46:55 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/17] KVM: Introduce the KVM capability
 KVM_CAP_GMEM_SHARED_MEM
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
 vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name,
 david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com,
 liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250513163438.3942405-1-tabba@google.com>
 <20250513163438.3942405-16-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250513163438.3942405-16-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 5/14/25 2:34 AM, Fuad Tabba wrote:
> This patch introduces the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
> indicates that guest_memfd supports shared memory (when enabled by the
> flag). This support is limited to certain VM types, determined per
> architecture.
> 
> This patch also updates the KVM documentation with details on the new
> capability, flag, and other information about support for shared memory
> in guest_memfd.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   Documentation/virt/kvm/api.rst | 18 ++++++++++++++++++
>   include/uapi/linux/kvm.h       |  1 +
>   virt/kvm/kvm_main.c            |  4 ++++
>   3 files changed, 23 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 47c7c3f92314..86f74ce7f12a 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6390,6 +6390,24 @@ most one mapping per page, i.e. binding multiple memory regions to a single
>   guest_memfd range is not allowed (any number of memory regions can be bound to
>   a single guest_memfd file, but the bound ranges must not overlap).
>   
> +When the capability KVM_CAP_GMEM_SHARED_MEM is supported, the 'flags' field
> +supports GUEST_MEMFD_FLAG_SUPPORT_SHARED.  Setting this flag on guest_memfd
> +creation enables mmap() and faulting of guest_memfd memory to host userspace.
> +
> +When the KVM MMU performs a PFN lookup to service a guest fault and the backing
> +guest_memfd has the GUEST_MEMFD_FLAG_SUPPORT_SHARED set, then the fault will
> +always be consumed from guest_memfd, regardless of whether it is a shared or a
> +private fault.
> +
> +For these memslots, userspace_addr is checked to be the mmap()-ed view of the
> +same range specified using gmem.pgoff.  Other accesses by KVM, e.g., instruction
> +emulation, go via slot->userspace_addr.  The slot->userspace_addr field can be
> +set to 0 to skip this check, which indicates that KVM would not access memory
> +belonging to the slot via its userspace_addr.
> +

This paragraph needs to be removed if PATCH[08/17] is going to be dropped.

[PATCH v9 08/17] KVM: guest_memfd: Check that userspace_addr and fd+offset refer to same range

> +The use of GUEST_MEMFD_FLAG_SUPPORT_SHARED will not be allowed for CoCo VMs.
> +This is validated when the guest_memfd instance is bound to the VM.
> +
>   See KVM_SET_USER_MEMORY_REGION2 for additional details.
>   

[...]

Thanks,
Gavin


