Return-Path: <linux-arm-msm+bounces-58844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1577ABECE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C0C73AE826
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 07:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995A623505F;
	Wed, 21 May 2025 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hA1CPmxZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE9023184D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811768; cv=none; b=V1PTWhED8hVExeqAO7BsBw1cFcHndmdyK+XRrU2pnGE35gm8965lprzbkUL9+3daeuLe7xpxjk9hyiTGIstovOq86UxuD2L8qsKdqHdWbCa25LCTH/k8xAcauK3+wSB0TeA/KqsbN50N4SgVhZLJDsf8ZHVMWtb/HgRJWrb6Nhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811768; c=relaxed/simple;
	bh=N91vqC9Hqi+eO1F3rNUagcwYTQ+xFmyfxxc4v4ZM04U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgf7PiwRz5iDQ7O8lsZQ3N4+RAmxdFZmmjJdLAUwEHIpBm00/eAEle6zsYrfUUTHtuQz+1q231/SyPcUilf2HJFBY48K8Nl1nkVYnRA1sYd3/u44YWcfp3tEBZXBbSFeWTLhFBgZIc8DyIFWyi0WuYrZKzAjP+j3Z+6kC6KCJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hA1CPmxZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747811766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gTzaRFPWQ7i+4l9KZqODL9pww/5z8T5OunpdIlu57pU=;
	b=hA1CPmxZ56Domhwlx2wO3FCX1WfryDuS8178cJ+/lAnJ/7q49vnDgyouSVeV6CPAq6OLCq
	AiRSKphQPquyjMtZtX2N/SnyVMaGLoKxi+oyiWo/iisWKjo3dJevGQvCIcay25jDACmRoj
	yg6/xvSn28UP+fJO3uvQnwH+ZAY29Tg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-cNBCzGcwPG25Epx8hOC2wg-1; Wed, 21 May 2025 03:16:04 -0400
X-MC-Unique: cNBCzGcwPG25Epx8hOC2wg-1
X-Mimecast-MFC-AGG-ID: cNBCzGcwPG25Epx8hOC2wg_1747811763
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-231d4e36288so48569395ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 00:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811763; x=1748416563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gTzaRFPWQ7i+4l9KZqODL9pww/5z8T5OunpdIlu57pU=;
        b=b5IXVlYfWP/x/gQby2PgD8qrz/YMmek2lXtkCNRJB0izGPVHqCopa4xz7GylB0tVaO
         ZQIvVYYa5Q4qDKEejlgvIsCx1dBJSTVnCwpyJuWJtyM4hyrTPhHkBa0+KPi9TA1/30nT
         4dgNFPabt5DPf04uCjzpYXLfokekc0/HzyUNRDw0xUSk/azYRVuuUWgTQfRkhlzoj0TL
         09SkcScsI9jOK9/7EFYJsdeXuktqbtKQ2Y/2fGfMB5su9Nj57SXLrWQ2A/8Pt7y7GyzK
         tDct/p/igEuTHpSivJ7D1kHVYXPYxk9OIsel2epKtJDiWyPvOKaKuDqCkTvPaR12316w
         4l2g==
X-Forwarded-Encrypted: i=1; AJvYcCWMtwTxEQboswWblV5qAu5uDIfT4R0E3avhD+nefxSXq0uGUf4csZbzQcYGwUL5Zj+05NHbSuR36wcaym1L@vger.kernel.org
X-Gm-Message-State: AOJu0YxNOt7HB8a8QT/CEKk+m96X2W3F6eUWE/0yzg34jLWMbhbMCPeC
	R4dKhWhe9X8Q4GPRNEWPv8QEjxpI2ljjXqBO97GIoy1uK6CW5i18OBqwaG8LzJ8Dyw5k2LFw6ZZ
	AItMW5Kb3NwyAyU1xao4tQhv9TIUArj4TfjWaG/vQBQUl2TmehwUgagCdaoK+14TebVQ=
X-Gm-Gg: ASbGncsoU6QCqy9MppptXbTbEps8tbaNQ1I+VQMWSRtGfYyizdlv+ZzoShyfo7VeUr7
	O/baEsM6sfmkuUS7tgnAU3o65F15ESfYXMtrmGt2jCz23M3yeQQ75RIfhHpF80U5xVGPVpus1ym
	P1DV4vehQ1qQBhB27h0ZLj6Sz4GllNFBOYYtXhnFxBpCtj44yHh4t0qvOvMubUU4gSSJsa1wiFu
	nDF2wvHqN2SEuTJel1mNfQRTaDmzmQopaYIBAKye39KfMpIhkvu6hBWnWzlCgR2JYpU/4WJmO/m
	7pvdbeqfQep5
X-Received: by 2002:a17:903:94f:b0:220:ea90:191e with SMTP id d9443c01a7336-231d43d9ca1mr296462075ad.4.1747811763209;
        Wed, 21 May 2025 00:16:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnoK8g0q1NOZMt9xynSASmFWdt2Pi3yBk1BSUGkKrW8z0TeuRgmx1uzimzxvzt4Fm3Wu+lsA==
X-Received: by 2002:a17:903:94f:b0:220:ea90:191e with SMTP id d9443c01a7336-231d43d9ca1mr296461265ad.4.1747811762838;
        Wed, 21 May 2025 00:16:02 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9510sm87300165ad.8.2025.05.21.00.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 00:16:02 -0700 (PDT)
Message-ID: <0daeb046-67d0-4ca3-a0ea-16c6ba52b7cd@redhat.com>
Date: Wed, 21 May 2025 17:15:43 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/17] KVM: x86: Rename kvm->arch.has_private_mem to
 kvm->arch.supports_gmem
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
 <20250513163438.3942405-5-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250513163438.3942405-5-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 2:34 AM, Fuad Tabba wrote:
> The bool has_private_mem is used to indicate whether guest_memfd is
> supported. Rename it to supports_gmem to make its meaning clearer and to
> decouple memory being private from guest_memfd.
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Co-developed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/x86/include/asm/kvm_host.h | 4 ++--
>   arch/x86/kvm/mmu/mmu.c          | 2 +-
>   arch/x86/kvm/svm/svm.c          | 4 ++--
>   arch/x86/kvm/x86.c              | 3 +--
>   4 files changed, 6 insertions(+), 7 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


