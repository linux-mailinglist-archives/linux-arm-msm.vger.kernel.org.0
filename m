Return-Path: <linux-arm-msm+bounces-51300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8715A5F64A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 14:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 571B83A79F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 13:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4A52641FD;
	Thu, 13 Mar 2025 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lpCd+Y1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E6541760
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741873795; cv=none; b=c/6OnuvPIHkv43LQvIqY4n/mwyPP0al+MouCektclH9cVnDSfiajxkq7vOwDmEIlssh3Hwc3UtG+RDx5m3BGm0u4P/jcNnliaoFygHaeEuXhHxe+LMEYm32CdMrfiBckOTulY8j+Wb0Kwm6Rk5W8SGwoHhK4i+tAgF7q2VkIVEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741873795; c=relaxed/simple;
	bh=gMCfqiVCtSUA4PcPW4KCsEWkN4hHQAPeVYOcAUqrgXE=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=a88vREz2y0wnoKg/oXu6qAP7PD8qzb1tSN2nyECE3BH0TLaN6X4kCjXyhPoz+WpTLPeRJWxEWyHLIS28KBJ8eEDuewC5EVludXDKu2wRroQLYZFschFB7zIOTqjxMbO/7STDTxgXCgj1d7qpogRX/zyZI3Q7RvCrxvwHWeR7YUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lpCd+Y1t; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff8c5d185aso3048315a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741873793; x=1742478593; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OyNJjs/gNu8oshRQuCS4jUqblJqtSPB3m+r3xFEElV4=;
        b=lpCd+Y1tPVKZgn3BexlncXMOOxdkvKadrki57GYxjE/mXEuWww0m150kL3u4Mr1t1p
         +/ycqppcEPSqvgzKCGU7NYA1WMV+QtAPIGju+dN4406NJbq9Sb835PPelIJyhc3co3F/
         NtHLp2AWPOfToXW7nJXSGmeMgKKaFzLfbVeIUIVLQC3r50RLpM2aXhVcHjbD84/tud4G
         p8Wzpp0fnRBQI3jhU/gK1fdcFK+mLRL+JAp1LwA779OSul2zaV1fcOjetEd/UOscdHrx
         8sNA2lGe39V/BhJj8hZ4oM8NAw4wqMQKMEvqymb6uRjds6KnU61Fn9xOUhxbOEbwW6iR
         z6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741873793; x=1742478593;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OyNJjs/gNu8oshRQuCS4jUqblJqtSPB3m+r3xFEElV4=;
        b=Rz0v0eNefFGOPyaWUHF3UO3cBPW9OlNPtwxJDkYy7ElQkKAoy/TpLBeo+XlR5V9NcF
         wv3oB/NEhG4S+iHCK2s+kug6I6QOENsd9U+/G8nMvoqoA71Kcic1hkBFJwHvjVkhz3OO
         w0wGQnVu4bWVtBP3SqUv9jcUACrOBOOuPTZy8OLlskpy4+WdkUKCLVhthjfxbejiH79Q
         dd4v0FycxMZ0tNhkLEj7ZyZd82Sqvfql0yXPkU+HKbSuxw2r2MRZsOrP8l+5gLpHgjqR
         dyjfCBrO/MUcwXHW+3658wynHFsAJdgBldKKrWoPZOB5epztFUVu2PpyZg0e0dEgQwX/
         H5Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVUe8R7KXcoqWtBGUMfTc8j78i3vsuSGEwIIlzPHmGKm+GPXAtiJbWXu9m19drj4UBbTSacljDOpJXj6nix@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1oIHAKtXtDsOIIBADTY+9fZeYqhTU1GAgqda9ZT7Z+ypf/cWa
	Ib2ptZY4MHAA1da5Wo2v4quEj05r1a9LTC7f/6TjVS6oMBWfo20xOiDm86TNLLuucPJZK/3CwX+
	I2HEMwr1KGP314NB3jp8wmw==
X-Google-Smtp-Source: AGHT+IGfsAmdTxTQYHYplZzycHsKG/hPYjcXb+RZOYsTu+CeVMuSfI1qOJSKxQHDz2gmbEGo5OI61WdiyIF8ghhPdQ==
X-Received: from pjbpx16.prod.google.com ([2002:a17:90b:2710:b0:2ef:9b30:69d3])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1b0b:b0:2fc:c262:ef4b with SMTP id 98e67ed59e1d1-2ff7cea9a99mr42242805a91.18.1741873792782;
 Thu, 13 Mar 2025 06:49:52 -0700 (PDT)
Date: Thu, 13 Mar 2025 13:49:51 +0000
In-Reply-To: <20250312175824.1809636-4-tabba@google.com> (message from Fuad
 Tabba on Wed, 12 Mar 2025 17:58:16 +0000)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzy0x9rqf4.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v6 03/10] KVM: guest_memfd: Handle kvm_gmem_handle_folio_put()
 for KVM as a module
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

> In some architectures, KVM could be defined as a module. If there is a
> pending folio_put() while KVM is unloaded, the system could crash. By
> having a helper check for that and call the function only if it's
> available, we are able to handle that case more gracefully.
>
> Signed-off-by: Fuad Tabba <tabba@google.com>
>
> ---
>
> This patch could be squashed with the previous one of the maintainers
> think it would be better.
> ---
>  include/linux/kvm_host.h |  5 +----
>  mm/swap.c                | 20 +++++++++++++++++++-
>  virt/kvm/guest_memfd.c   |  8 ++++++++
>  3 files changed, 28 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 7788e3625f6d..3ad0719bfc4f 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2572,10 +2572,7 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>  #endif
>  
>  #ifdef CONFIG_KVM_GMEM_SHARED_MEM
> -static inline void kvm_gmem_handle_folio_put(struct folio *folio)
> -{
> -	WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
> -}
> +void kvm_gmem_handle_folio_put(struct folio *folio);
>  #endif
>  
>  #endif
> diff --git a/mm/swap.c b/mm/swap.c
> index 241880a46358..27dfd75536c8 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -98,6 +98,24 @@ static void page_cache_release(struct folio *folio)
>  		unlock_page_lruvec_irqrestore(lruvec, flags);
>  }
>  
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +static void gmem_folio_put(struct folio *folio)
> +{
> +#if IS_MODULE(CONFIG_KVM)
> +	void (*fn)(struct folio *folio);
> +
> +	fn = symbol_get(kvm_gmem_handle_folio_put);
> +	if (WARN_ON_ONCE(!fn))
> +		return;
> +
> +	fn(folio);
> +	symbol_put(kvm_gmem_handle_folio_put);
> +#else
> +	kvm_gmem_handle_folio_put(folio);
> +#endif
> +}
> +#endif

Sorry about the premature sending earlier!

I was thinking about having a static function pointer in mm/swap.c that
will be filled in when KVM is loaded and cleared when KVM is unloaded.

One benefit I see is that it'll avoid the lookup that symbol_get() does
on every folio_put(), but some other pinning on KVM would have to be
done to prevent KVM from being unloaded in the middle of
kvm_gmem_handle_folio_put() call.

Do you/anyone else see pros/cons either way?

> +
>  static void free_typed_folio(struct folio *folio)
>  {
>  	switch (folio_get_type(folio)) {
> @@ -108,7 +126,7 @@ static void free_typed_folio(struct folio *folio)
>  #endif
>  #ifdef CONFIG_KVM_GMEM_SHARED_MEM
>  	case PGTY_guestmem:
> -		kvm_gmem_handle_folio_put(folio);
> +		gmem_folio_put(folio);
>  		return;
>  #endif
>  	default:
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b2aa6bf24d3a..5fc414becae5 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -13,6 +13,14 @@ struct kvm_gmem {
>  	struct list_head entry;
>  };
>  
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +void kvm_gmem_handle_folio_put(struct folio *folio)
> +{
> +	WARN_ONCE(1, "A placeholder that shouldn't trigger. Work in progress.");
> +}
> +EXPORT_SYMBOL_GPL(kvm_gmem_handle_folio_put);
> +#endif /* CONFIG_KVM_GMEM_SHARED_MEM */
> +
>  /**
>   * folio_file_pfn - like folio_file_page, but return a pfn.
>   * @folio: The folio which contains this index.

