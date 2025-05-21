Return-Path: <linux-arm-msm+bounces-58825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E747AABE9EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 04:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDEC63AAE2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 02:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373ED22B8C1;
	Wed, 21 May 2025 02:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TUgPeHuT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1E922B8B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 02:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747794332; cv=none; b=PJwRBmAqGKExSMpMEylcnYXFmejBL/Dup+RkEQibggjwipgjZE9hKy1/rZ8n1W8MnYzEnQj7FPSRWxKV39y/L3ThLd02zAyqEgIdyjh6Vf5B0SNBYEz7zhcjggycK8Gqb5VQly31IrNkYOfvegk3eZBt2Usyuh1MV+HYx9NBRcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747794332; c=relaxed/simple;
	bh=tkPhK9LKALPm6nIelp3ZKXatSKhNAV0B1rYZZ8JKI28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqwLYCCLr15ngUv0FtJOs4CKRl6PqoPqn0AWtHxBnGj9C8aap3D5MAFIzdKzxMpG8OYzdcVbnTgWz+7AWoRszXM2/HakmWjJkkqwTRrY8HoubdMNjg58g25CP9OWNCzCGugsjMEAgu2PWhzKu+L3XU1RhVclye/xsg7p/v1ltvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TUgPeHuT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747794329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkRmm/Yp4BUDonwE4Xac96Ss8wcLW7noonhF13pZKss=;
	b=TUgPeHuT3IiJtFm/UW0VNevVCqfjwxw7LMGp6oh9I/z5NR+EwYHyI8sGagI7IEhA/NJv/I
	Kg7mHrEPaf3wnBafgTJD1oEcFL8hiE2hIVz6vfwLUFvi5PP1wXq9Ix36nQELAdwuahvWLa
	W/Qbkv+7IyDXDy6FIdf5HnqdG3pVCVI=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-rgjrJ5E9N2GLRo8guIGIxQ-1; Tue, 20 May 2025 22:25:27 -0400
X-MC-Unique: rgjrJ5E9N2GLRo8guIGIxQ-1
X-Mimecast-MFC-AGG-ID: rgjrJ5E9N2GLRo8guIGIxQ_1747794326
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7370e73f690so7533304b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747794326; x=1748399126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkRmm/Yp4BUDonwE4Xac96Ss8wcLW7noonhF13pZKss=;
        b=FUWW1LZ0TG/hM3bDu30wNM8y/VGh7dcn4mujBlUi8zsmgL0ReNbmoQBuSQGBVEzT8W
         Ji8xP7U1vDmWdiJ3N6+cVpwRCd3lV4ZSus1XTOvSfimJn9+nA8xmQxETxA2oZkYWhA7d
         bmErXknLPKB2ym+vNnjxaeZygPAXgPMPKOse3AqXlv77OBX907jFsX0Rchm5PPMM+HOP
         l9ikNb4gyhZr55MNixnrEBAG6kIXJxAbKxBx1H+R5WnhcR2nAHwso7sRrYwGm5P0ChAI
         eim8J/yEbGPfU2XrPuX960Wvm9+xHfmF5w0/jZ895h3xQ6wa05b486GDmJcAaoG/jeTM
         eCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhcdwsZfSKeTE/omQcdqg5XmbG4UzfgWE+TtUibOT61ZM3GMWU/udPtRiWRyaHsDLiMV3a8J3Hi4iZjQiN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk22Y0spNP5zPcsDTgcSBJluFl/81lny7eh3+ijE7Cr+EsLvV5
	A6eOk6wXVAIDd83BDfZ4UTmHHWozgUsmgV7bl/sR4dc23NMN9vQy6qR3JnmynVxnrVLMa/VTmUa
	/jLNzLQYvZGYhofKhlnlUl6buyr5Kb6QDNYdzg4xE/PI76/nTQ9XC9sfXRLG1jwRGgk8=
X-Gm-Gg: ASbGncs9O0FRJ8KPXyURm1uf30f/3uPsw5rxMpPk/dbNfnWoUyw+nFNTv74JUQSkaJV
	a0ds0XbcR4ODLbIYXjE2MSkk8lss5uAqc2g2G7pUJ7Pu6LrAdlBSYZawU4zEzgeYpHzYWd9zhH9
	eniwSOKlzupURGit2xkXXNepHkMHKCBTYpBuri2PzdfwsfjUTNHHBcpCRNyOoZf/3ERI6NWDm3S
	wW3DPBqr7OET2keNL090j9qyfLWNV+ckZOJn2lzK54y6WBoMECpJ3Mrbi/AFWi3sVzT6CRedU96
	VeX6vsarz509
X-Received: by 2002:a05:6a20:7d9c:b0:1f5:8e39:9470 with SMTP id adf61e73a8af0-216219b2560mr32316782637.31.1747794325923;
        Tue, 20 May 2025 19:25:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELH1Nkj6QBFRo2UbjW4nbg/CMv3zHb63Laxsznz8iimJrWPxaDEgIYMLdZSM4BBQAJnQlmzw==
X-Received: by 2002:a05:6a20:7d9c:b0:1f5:8e39:9470 with SMTP id adf61e73a8af0-216219b2560mr32316707637.31.1747794325507;
        Tue, 20 May 2025 19:25:25 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8e114sm8739609a12.44.2025.05.20.19.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 19:25:24 -0700 (PDT)
Message-ID: <fd84d609-936f-4ff2-b495-22d31391181d@redhat.com>
Date: Wed, 21 May 2025 12:25:04 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/17] KVM: arm64: Rename variables in user_mem_abort()
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
 <20250513163438.3942405-13-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250513163438.3942405-13-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 5/14/25 2:34 AM, Fuad Tabba wrote:
> Guest memory can be backed by guest_memfd or by anonymous memory. Rename
> vma_shift to page_shift and vma_pagesize to page_size to ease
> readability in subsequent patches.
> 
> Suggested-by: James Houghton <jthoughton@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/arm64/kvm/mmu.c | 54 ++++++++++++++++++++++----------------------
>   1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9865ada04a81..d756c2b5913f 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1479,13 +1479,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	phys_addr_t ipa = fault_ipa;
>   	struct kvm *kvm = vcpu->kvm;
>   	struct vm_area_struct *vma;
> -	short vma_shift;
> +	short page_shift;
>   	void *memcache;
>   	gfn_t gfn;
>   	kvm_pfn_t pfn;
>   	bool logging_active = memslot_is_logging(memslot);
>   	bool force_pte = logging_active || is_protected_kvm_enabled();
> -	long vma_pagesize, fault_granule;
> +	long page_size, fault_granule;
>   	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>   	struct kvm_pgtable *pgt;
>   	struct page *page;

[...]

>   
>   	/*
> @@ -1600,9 +1600,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	 * ensure we find the right PFN and lay down the mapping in the right
>   	 * place.
>   	 */
> -	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE) {
> -		fault_ipa &= ~(vma_pagesize - 1);
> -		ipa &= ~(vma_pagesize - 1);
> +	if (page_size == PMD_SIZE || page_size == PUD_SIZE) {
> +		fault_ipa &= ~(page_size - 1);
> +		ipa &= ~(page_size - 1);
>   	}
>   

nit: since we're here for readability, ALIGN_DOWN() may be used:

		fault_ipa = ALIGN_DOWN(fault_ipa, page_size);
		ipa = ALIGN_DOWN(ipa, page_size);

Thanks,
Gavin


