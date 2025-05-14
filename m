Return-Path: <linux-arm-msm+bounces-57897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A540AB72FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F39A1BA0A3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6759E280CCD;
	Wed, 14 May 2025 17:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bWEbSAjM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF7D27FB04
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747244372; cv=none; b=jvk4WQPd+Lc40JHWOMxxrGhzSrdcm/YRPWCSc4kswy7EM/rpNF+rlmhVxxLbmXUWg0ENXNCTkzlpc6zgKki9gLDyFnWv3RKAyVC2MspFCzkOKVNkQG4gUEWlpJLIqek79ICHuL8XKAZVxI6zhV+9GCG5OABcQs8XffKZplxxObU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747244372; c=relaxed/simple;
	bh=DybxN6tHW3pRqRDzexg5O/mxkhdrtfiw60WByyFkILo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DtiIJhtnBh1ib2LOBgDoHEGKPLBcU0Sk/K0qrU+UAiS7/bcXQHr2tSfU4Zjq/07o5zelc1hl9TlnbEx+ZFWy/U7z4NWKVYQrK6HGCKRj67tvyrgVNed8f5vUCwdvTxk/uUxnrDOtXQHzIM5frRYYEVvdiRTozrNuAdzVhiezwhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bWEbSAjM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747244369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Vk9Xh8XvArJD+LRx2+377usNjpdXE43bkUgaFQ0lI2A=;
	b=bWEbSAjMpte0CuRvV0z9tfOLT9SaKpt66VvaM2OWpfH9AqXj9+rA17Al3pUgFqIRujF/2J
	knKoBkM4ei1nZnRx4Lb9Zp/i7JUBGCE7ypUeDM1FJl3T2rgxZEnPkmNhNv88bqT5ShUjQ+
	zCX/blkqq93FQYr6vhFqV31C9fJ6oM8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-nShaVPKDORaOKd_naI2j2g-1; Wed, 14 May 2025 13:39:27 -0400
X-MC-Unique: nShaVPKDORaOKd_naI2j2g-1
X-Mimecast-MFC-AGG-ID: nShaVPKDORaOKd_naI2j2g_1747244366
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so351335e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 10:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747244366; x=1747849166;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vk9Xh8XvArJD+LRx2+377usNjpdXE43bkUgaFQ0lI2A=;
        b=XDXfJt25W0C2sP9mvSQ3fZtQHWgqWO2iKjIAtksg36wsUjjWHY0Zh0Q0mRAlRiaBbH
         kzrnD3Qp25qvdM2iSsex9t3YyC1ovqqD458mDqf1VSb6cFufIAFikHNXrf5KJ7Tbk5SF
         uTIiI2Daf2NmteSf8lR/KPsaDHF2arqGMCoBo836Qms7D6Xl15vVJANPNpgBWUb2G9x8
         dkK8Z1bzHO0/wOGo+FSnOGZJlLdJj+8M80LViQVHk2YluhhSMSNKPAtc6qhI2AiwLI4i
         aO8LypBsLr3xde0Z86YccSJ/4TJNQs5fN4LZyfWQ4vbpFQeSlKkC9JCRq+U1e7n/YTGJ
         tvsA==
X-Forwarded-Encrypted: i=1; AJvYcCXCsXjuQ2IUTqwTZxF2jjE24D4O5/GngykipA4WbdW2Xy4PFDjghq3Nd3vZtK0Ghn1hrSnGJzbhFtiyV5kj@vger.kernel.org
X-Gm-Message-State: AOJu0YxZkLzJH5ChLaT+9/TjyYeoyp+30iC6RPBBglWqrm09f52aaV+F
	xyKAoJyuS+QcIpyuP5N5jDIQpd/LSUJqn+HzLac7mp2RbrZRsxfgygEJheL9O1INo+OrKQaf7OQ
	4ansJ/J4TXI/E7CJB4bf4tGhqP1YkRWo1+zhILq5cpRm14fR+CZAOPeZ8OsfE13Q=
X-Gm-Gg: ASbGncsbmsaN6RoskiK/rp/z7Ej8oj/T/II6dDQb7UgEMTGLKCNBnNXgCNB+BkWj6+5
	HWWfrHZuFLeLJQ5Y39plaJzas0KwwP6mBsAezNJI3xEvQbh58QBNs5jvS1bpdT09cIo1nzuhSQ6
	2VM/veVGOjNmYOkHQamHPXs1uISfEsT9FtxdiQgs8/xUvua0DuBlnhgvSnVGYK9GClftoBd+y9e
	cQZGHGZbs3OeC7bskbEnI9keyRFJ5vj/hMBaQc06Pdf4rLQUC0nMY5qMFENKVJlT4tWz0hINiYi
	7QhF6ZG1dvHpKbYfXYoUqivosYvILHrZ59K+xWjToa8Fr68AdO98wEn+W/8uhr0/ntt74ncbfsx
	kbm0Uxm7okM3FVxVwyjgFt911m6GBIEHSgGWfbCs=
X-Received: by 2002:a05:600c:358b:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-442f20e8141mr39825345e9.8.1747244365846;
        Wed, 14 May 2025 10:39:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQHpSZjD5VZhXH8bp5bUHN2OiSM/BgOW5x2KH7T+UY5v92NfRDDAwGcMz7DinxHmUBaaQbew==
X-Received: by 2002:a05:600c:358b:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-442f20e8141mr39825125e9.8.1747244365413;
        Wed, 14 May 2025 10:39:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f15:6200:d485:1bcd:d708:f5df? (p200300d82f156200d4851bcdd708f5df.dip0.t-ipconnect.de. [2003:d8:2f15:6200:d485:1bcd:d708:f5df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d96csm20462242f8f.69.2025.05.14.10.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 10:39:24 -0700 (PDT)
Message-ID: <d6acaa76-bba7-468f-be19-dc0696409eac@redhat.com>
Date: Wed, 14 May 2025 19:39:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/17] KVM: guest_memfd: Check that userspace_addr and
 fd+offset refer to same range
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
 michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com,
 isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com,
 suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com,
 quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com,
 quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com,
 james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev,
 maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com,
 roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com,
 rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250513163438.3942405-1-tabba@google.com>
 <20250513163438.3942405-9-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250513163438.3942405-9-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.05.25 18:34, Fuad Tabba wrote:
> From: Ackerley Tng <ackerleytng@google.com>
> 
> On binding of a guest_memfd with a memslot, check that the slot's
> userspace_addr and the requested fd and offset refer to the same memory
> range.
> 
> This check is best-effort: nothing prevents userspace from later mapping
> other memory to the same provided in slot->userspace_addr and breaking
> guest operation.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   virt/kvm/guest_memfd.c | 37 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 8e6d1866b55e..2f499021df66 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -556,6 +556,32 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>   	return __kvm_gmem_create(kvm, size, flags);
>   }
>   
> +static bool kvm_gmem_is_same_range(struct kvm *kvm,
> +				   struct kvm_memory_slot *slot,
> +				   struct file *file, loff_t offset)
> +{
> +	struct mm_struct *mm = kvm->mm;
> +	loff_t userspace_addr_offset;
> +	struct vm_area_struct *vma;
> +	bool ret = false;
> +
> +	mmap_read_lock(mm);
> +
> +	vma = vma_lookup(mm, slot->userspace_addr);
> +	if (!vma)
> +		goto out;
> +
> +	if (vma->vm_file != file)
> +		goto out;
> +
> +	userspace_addr_offset = slot->userspace_addr - vma->vm_start;
> +	ret = userspace_addr_offset + (vma->vm_pgoff << PAGE_SHIFT) == offset;

You'd probably have to iterate over the whole range (which might span 
multiple VMAs), but reading the discussion, I'm fine with dropping this 
patch for now.

I think it's more important to document that thoroughly: what does it 
mean when we use GUEST_MEMFD_FLAG_SUPPORT_SHARED and then pass that fd 
in a memslot.

Skimming over patch #15, I assume this is properly documented in there.

-- 
Cheers,

David / dhildenb


