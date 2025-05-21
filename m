Return-Path: <linux-arm-msm+bounces-58843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1E1ABECDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B28FB3ACA8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 07:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A5823184D;
	Wed, 21 May 2025 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Muo5qskG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1B01BD9F0
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811749; cv=none; b=IMe++pM+DTnkpiXvL0dG+KUSO/zPXBmLtrnf6kDO7f/A7Fl5Je6rq6svnDsaf8Wl+ufkNG4iLZpyyb3mN6fRDHn7iy5yS1q7QJi+UDYhL3+w1Tt6+nERq7j5Eg+Fh0ZNCH+Tlm6bAaweJ10vkfEtndWoKOYxrli+h7xcxLYg1lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811749; c=relaxed/simple;
	bh=Dhs9aqVFQO7vGhW/AbPEHotwKf42ldZ1I3nFiGVGM+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mda+GzKFJT5to+6TzX3k//kQ6wCuo4kSoyuD7E1Ck3zfXGVUiTYsRR9FwwzzTlKpBYQdYBwxxFypKfqa93udxLq1R7X51uk2fFp/YlUYN3rfDHk6YpUap1Ylti8yZLrWkkyXuZL0riIUi5vLQQNk/Bl/VWct4yPa1YO98lKL0kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Muo5qskG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747811747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3eiQUkXSkK+bklax3ox1Ui1i+w4bQkjTtwkcHXejTA=;
	b=Muo5qskGZMgqBFxVerM6aZYit0Aa5Wj2DDKk4DRGnGykESLilu+BJmg0l49ywJVJo7wbWa
	Bq+IGXdDZgSTGZpW0W2c1ARZGoVGIa/AaiC1BDfnbe/dLTVE2EelzH95EOYPp8f/97/WZ5
	ObIl2Ow6hgQLmj54KjZTqhxoMqwdaCM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-8a8yPmqwOLaAAHM4Y4wwrw-1; Wed, 21 May 2025 03:15:44 -0400
X-MC-Unique: 8a8yPmqwOLaAAHM4Y4wwrw-1
X-Mimecast-MFC-AGG-ID: 8a8yPmqwOLaAAHM4Y4wwrw_1747811743
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2320d1cb313so36318115ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 00:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811743; x=1748416543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3eiQUkXSkK+bklax3ox1Ui1i+w4bQkjTtwkcHXejTA=;
        b=F09EM+AhkyVOERx8uGscbnRSojUBPmD5/7lh7AaQlEXZNcDPrjLx9lh/YMlzJJgJg0
         zg6ihPKHdEOr4P8gEzu5cYKbwlcyHGIC7rtPYtEao/ak53lCcSCk7gdt7OKsuZ2HUpFD
         Kk8D9uzt5H0Ku+W+D8R1j6iyX2Lpc7w6Dg25yIXzKR70/3V5umJMGri9JaRP0gAnJjFY
         zCABMZcyuXNrTX/KhEOMZmyxgkXRClw06EKySjjPvtwn8n7E0Zx9alQ9dm3gH+JR55CB
         c+V+HmM6WNrLBFtq4+FxQkgAJPWOXOYeg9/mWSSTdDEI1/NzNa7naFLVIWlnn+zz2nMQ
         1IdA==
X-Forwarded-Encrypted: i=1; AJvYcCV30wcjIsj2j6oUXiA22ZRb6zu0vvJOjBKhzPhw40g+DfWT/8LCCtnBnB4b71ktWDG7OfSg0GDdhLgrD041@vger.kernel.org
X-Gm-Message-State: AOJu0YykDa8TZs7lt+RrZ1y2sUROJWDjCtQv0hR8lLBfUIHAl4ItKal7
	1HWy9gG32BJVzj6eGage+1AVE0c1IEGC/HmWzbk6NRJBRMYI5JxaMHntW2fpCUmSwpAsGFwUMtY
	jMzfq+b5suRW6Pve3cWxIXdvkXQH3tVXWw+uLr1YNfYLDE6JTmykyNRQGAwNUwhnBorw=
X-Gm-Gg: ASbGncvZ1FcE+6kdhnOOhEZ5yd2gcp5ojVkiUWy1Kv5+diiqSAC+ESSuH+7kwSlPbXq
	Uopb/TQL3KGefYPtZiuQF57jQSZGB6dBKkdIKtEtHqYEoBpiQ+YdYKIPksfj7A43WSegl+Pcpq/
	gqBy4b6WDN0LF1aAV6Mf10bIAQOf519pnRmvpXwPN4wMNXC45gUlzkmLouCV7WxNfThRZ7BPHU+
	JtEkk4PfHPrQ5YzQ66zQsk0IA59DUSTH/aLod9A/4z3HpG0Oh0Cu9TvURy6UJGmfgFPetgQdOQZ
	IdQlHSZ4k/1W
X-Received: by 2002:a17:903:22ca:b0:22f:c530:102 with SMTP id d9443c01a7336-231de376f89mr268311205ad.31.1747811743475;
        Wed, 21 May 2025 00:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmbyky+/u+zNiEA4cQCcmmtH/5YoDoowrj/kDIVN48q3vqKSgBxzuL9bb5zKnIev64FChL+g==
X-Received: by 2002:a17:903:22ca:b0:22f:c530:102 with SMTP id d9443c01a7336-231de376f89mr268310945ad.31.1747811743083;
        Wed, 21 May 2025 00:15:43 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9510sm87300165ad.8.2025.05.21.00.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 00:15:42 -0700 (PDT)
Message-ID: <6227b34f-5f34-4f50-a762-c5cba775b5d2@redhat.com>
Date: Wed, 21 May 2025 17:15:21 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/17] KVM: Rename kvm_arch_has_private_mem() to
 kvm_arch_supports_gmem()
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
 <20250513163438.3942405-4-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250513163438.3942405-4-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 2:34 AM, Fuad Tabba wrote:
> The function kvm_arch_has_private_mem() is used to indicate whether
> guest_memfd is supported by the architecture, which until now implies
> that its private. To decouple guest_memfd support from whether the
> memory is private, rename this function to kvm_arch_supports_gmem().
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Co-developed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/x86/include/asm/kvm_host.h | 8 ++++----
>   arch/x86/kvm/mmu/mmu.c          | 8 ++++----
>   include/linux/kvm_host.h        | 6 +++---
>   virt/kvm/kvm_main.c             | 6 +++---
>   4 files changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


