Return-Path: <linux-arm-msm+bounces-60297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A72ACED32
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 11:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44DC3AC32C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 09:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF08B20E023;
	Thu,  5 Jun 2025 09:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RAk2DVu4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2271C2C3242
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749117566; cv=none; b=IT0LVRfMqgsps0AFv8OLZKquPEhhvl6TFgRtCftCoLzQSF9bW7bLfLLl/WnsvaktOVVYy4vvDJL4AdAHaa6rv69b5uHLxjcmgg/uOjMRLKk7TmmsanfNTeXEbwKdJUBp9mVltyb0tlUUu8SzaarS3pW69W0UpP54k5W+7zbH2Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749117566; c=relaxed/simple;
	bh=qWbpizDlWV+4rfjwxkDCtQHGIV13qSmCC/6p3Vf8Rmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+RGtppKEGBauadsDRtPwZcPqrFiHG+90OwlnOTw9I08lNiiJ+ZyZEgUybDXByAiGRlnfBxUhHIjTn3dsfDbPF+bxnL4rlf2IHM4EkMbngwkb6PcS90EDUhRdwRr+A8YfS1utP3cg3XSGCfs+rm0KaOdFkpkxrWRNId8aAq+5RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RAk2DVu4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749117564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CvrMDhlWszi0keWJlBW0yQr44STIzAIf2eScUi0AOJs=;
	b=RAk2DVu4Cu3+FsIstNIQz5NxfU53XZzX76DPTeMRpRmQig91K730EbgMDI9dEfT0wS+/f+
	wy4gJmZEhLFMw63QdSkh0h91nnyYWpa7oXfmi9+YO3RvB5qi3ise390+ZTdEOAYyaukk6t
	4x4LyDydn6sNCNrGkePxwlqvvArChs8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-dV9SBug_Mq2JWGMcKWG47w-1; Thu, 05 Jun 2025 05:59:23 -0400
X-MC-Unique: dV9SBug_Mq2JWGMcKWG47w-1
X-Mimecast-MFC-AGG-ID: dV9SBug_Mq2JWGMcKWG47w_1749117562
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235089528a0so16865105ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 02:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749117562; x=1749722362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvrMDhlWszi0keWJlBW0yQr44STIzAIf2eScUi0AOJs=;
        b=W/6+V32vwRjPBrbyt4Z9jLB3yEh/sqX0VLDhXn47HwPiuYLwmFxo537zXhjhfjwcdZ
         L4zC/wUmHP6fjl7k4EIe6oO0IVRvIM07eMglxnzEuA27kDJhM33+aUfkBRGo6P6AP5eV
         w1hVGs128qFpnc0hGfe6XUFlSCVnCA2Lv57iKAnDKFhP1PfEZHt6unku9XQXF9cZpPvn
         9U1giBxtgUYn5zaFSIqUkwvRhnRsX6yMNm49ZbUsdOuPRy3zsOfOONjlaOJAQxXuvZ4M
         zcs1ZfIN9+fibzOeLFsfpNWukn0puKvsznrgel9WsI6NNTodhXkmCNMBc68WXQS8fcnP
         wVVA==
X-Forwarded-Encrypted: i=1; AJvYcCVOuDS92FtGlxhuXvmETlYAGW6suZ//05YHmnKii5NIWnEofFBIeyGFOwVOdQ3qfUx90aOYPFpDC6V7uaLF@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNgi7L32Qn/LpGVRyK63YEd1pNCjWiRRldGNbu6Bjw/HftaAT
	fgtKVvbPRsH9uZKYpdQtPGuDY86ODucl8HEOoSY1/w9GJqOU3BvkWe8Cty/23RV6Jq2GCf2uzNy
	ORN8VS/JffkWbxLb4+VRBHXvI8++8nqvk8V5vLbmqYdqm5G+ubaixPrHNKfCLO0oIuA8=
X-Gm-Gg: ASbGncvMGHwV1NG2j2RSPKsCQ3Wtn24dTm0+QkIHzqne3+jNrJcPmVbs+tTbxKRjv+b
	BB14pc+uhmP0rixTHQGgnksXt8tD967WNBwuPiqd9omEzX+kfrl3Ms5HfCfTbkO3mRqHFCoOrYA
	PZRi/M964865CYJXD/sIP6MVKZo5NAwac0WqBd4WcF0+1WVD2RuuhL8LbWXTajY3oAPP9vQn+y7
	dxW8J2d9GWHvtN+4//mTlhsX247hXb6IwPL9re2/aKmVP5zwfJhz/i8elywU6bNUGpdr3SjnDjO
	4vQflT551OS9dj8fkCzCeG5b9bRWKIDeDcMFyHaH4Dr30r1DSd4=
X-Received: by 2002:a17:902:d4c2:b0:215:6c5f:d142 with SMTP id d9443c01a7336-235f168bf97mr42628665ad.20.1749117561872;
        Thu, 05 Jun 2025 02:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9cjR2JYFAnN2N4gG1ebHDB79lgrRQXScktsAHkDD1ZcOUnhM4BJ6wXqjCQ6YZbZqsfs0/kA==
X-Received: by 2002:a17:902:d4c2:b0:215:6c5f:d142 with SMTP id d9443c01a7336-235f168bf97mr42627905ad.20.1749117561444;
        Thu, 05 Jun 2025 02:59:21 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd8e2dsm116565275ad.56.2025.06.05.02.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 02:59:20 -0700 (PDT)
Message-ID: <0b329f63-dbb6-4652-b598-2b07bd4f5e67@redhat.com>
Date: Thu, 5 Jun 2025 19:59:00 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/16] KVM: Introduce the KVM capability
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
References: <20250527180245.1413463-1-tabba@google.com>
 <20250527180245.1413463-16-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250527180245.1413463-16-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/25 4:02 AM, Fuad Tabba wrote:
> This patch introduces the KVM capability KVM_CAP_GMEM_SHARED_MEM, which
> indicates that guest_memfd supports shared memory (when enabled by the
> flag). This support is limited to certain VM types, determined per
> architecture.
> 
> This patch also updates the KVM documentation with details on the new
> capability, flag, and other information about support for shared memory
> in guest_memfd.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   Documentation/virt/kvm/api.rst | 9 +++++++++
>   include/uapi/linux/kvm.h       | 1 +
>   virt/kvm/kvm_main.c            | 4 ++++
>   3 files changed, 14 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


