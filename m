Return-Path: <linux-arm-msm+bounces-51299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE1A5F63C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 14:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0D3E3A46BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 13:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE61267B13;
	Thu, 13 Mar 2025 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MZNKDB+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309D486334
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741873566; cv=none; b=Hes+tcuNqyIkSuqF2OoSafXR1XDvlHTH8V79yb+CGpMVc/2dsDQpsdlnZL8O7j1dwJ3Wu3++HvBTVyaSwERQrETI88i967AkNdZFttN1BoYHnLCATFY6y5zvmeoHA1S0X5Dg1E8+WK21sobU0+ZbfKkbxaGT7T+WxzUc6D8NgKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741873566; c=relaxed/simple;
	bh=JhH/G33xlgUDc5fGZAmQj6oFOu/IAnb5cVYbjKxgCFY=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=K871tU55fUfHvKj9++0Q1TSvmttSmtlrt9Hxb+8kOUNHcbK0DaPYEYYkXHNrwfu+cBwDS7ersGeShNgFsY9bc9aOTwAoA/MqqjKlA9uHO8GB7MRdhgiU4cFry8Dl1olRmKKiRfYLN7uITH5V8hpaPMNLxIedPtgjP6uU7Y+W26I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MZNKDB+U; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so1635295a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 06:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741873563; x=1742478363; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+q0qvY/TGgLG06XL8YIgS/nLJoWR0rj9CjBle27wqTo=;
        b=MZNKDB+Ue6s6ATP0tXYYsO9HF/sVImyTzVPb4tHArDQCue/t7bhkavBxqVQDc6g9Zb
         l9jwDeqstDWScsmfuG2nPOLU1ffVLTw6XWdZdyvUk/EUO9NjebVaJNNd83zofDEJFN71
         m7rOYc406Nw5jKOeqaim7p73IUae3rrqAKxqgXYqzeBsHltMQ//1mO+5d1XKCDEPI6/a
         rB3yM5IgzY+/JKezYwMdbsTRIXPlKb0kxxUL3+oFGoaqVmLDA7RlhKVvZ12fhqcP8ROY
         DXgEJL5DMT+plhTYjyYuKjim6Pdx/DJpwo6sJMFsLgWXNGdjiV/wiaESnNgNmoAOuAba
         3R2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741873563; x=1742478363;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+q0qvY/TGgLG06XL8YIgS/nLJoWR0rj9CjBle27wqTo=;
        b=CzWct8Au1bpE7RnTCdBkOcUvDCI0x7nJ8WrEAH9NEGcax6FCwg2J37YQ+YXIMVJ/zP
         sQY5MdP1js9ZuWVVgLNnbWlvGSYYmj7AzTZ7RJEzjqs+HZaeBsqMKtvrK7vmmw+aDz/4
         YQg/5C2Y+BeOWGiXXjzQwmSrAv+2iWuaX093+7XwHu3M877AziPG39oHcfHoVI7i/PgZ
         A4W/j/6JhdfnKuXPBwGAGLED8Nm473Cwhdg1FrJttBMTKkiUyUqAt1LPSbN2ksv0zXvP
         kRAlwJ8pvfSIgsWo3jq5k8j6nDjkdVSEkurkHinOMPLg1oPxYPApDCCe1XXyDl2/yfvf
         s+xg==
X-Forwarded-Encrypted: i=1; AJvYcCW+VVoc7siIIOQM8tq5ci0RFJjFLfGmINawDPEWmMeZqDbhUR5U0rJuI/ba9xGnQt1OmtsZ8L9A/nIJnSPp@vger.kernel.org
X-Gm-Message-State: AOJu0YwFK9Wfv378mGM+acy3pUlwJ7gjbUkJXO88fxRX8QuXFNK/bsWF
	bzRrnUTfRMaA8o07tG2qnb5LTq/pHksgkc1QqLRnwz0uQDmVhKKwSq4aN5iJ2nU61/T9IX8qA5B
	5BOD86QNnNK9Rd8HVpRuQIg==
X-Google-Smtp-Source: AGHT+IGLRXewZE6/3Z+HmLDNn9LacFatmvoh5VTCuVAJ4SkFg24rzX49qnEitSWoWj2PYntmyy2EBQ/LunKs8BcMVw==
X-Received: from pjbse12.prod.google.com ([2002:a17:90b:518c:b0:2fc:2ee0:d38a])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d610:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-300ff0ca033mr18619186a91.12.1741873563344;
 Thu, 13 Mar 2025 06:46:03 -0700 (PDT)
Date: Thu, 13 Mar 2025 13:46:01 +0000
In-Reply-To: <20250312175824.1809636-4-tabba@google.com> (message from Fuad
 Tabba on Wed, 12 Mar 2025 17:58:16 +0000)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqz1pv1t55y.fsf@ackerleytng-ctop.c.googlers.com>
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

I was thinking of having a static function pointer within mm/swap.c that
will be filled in and mm/swap.c 

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

