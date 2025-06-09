Return-Path: <linux-arm-msm+bounces-60557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF7AD1648
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 02:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EED60168B6E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 00:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9B0F510;
	Mon,  9 Jun 2025 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fmlflVHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA59217597
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 00:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749428998; cv=none; b=IaJP1AcNJGuJQfGddO7KX1PoJ8DiFGvyavp05ZalXpn2e65ACosMQp7Gdbq+GuWiHG369fGkIoGElhUlS2dpKhE0SfGPsgSUBKG7jPUEbBIShscSDwpkOn0gHCNI3nqa0Z7ZYxCTjBfFJbZrz4XNlc6wq57enq2bTH40iYFoPCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749428998; c=relaxed/simple;
	bh=DndXz279didVTDDBPj10bwY/XQ3srYBXtm7PwGKhlsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4ZAEGjGMrp1ICPxGo8R0QBbfihhNQLQ6pS7IQflkBMv+dMVSxi+j1idg6lZ4NDqhOXPn+zFPMuwtquDcK2Oqn9mvh4dLTafQ2296NVPLMfQFxCH4Sz5h9XH9KqS+p0lb23Sx13kfVtruaBaZqP5KumoRIWJuxXqQjyP+CGS7XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fmlflVHb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749428995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zWLcc9JilgS7Cncp/Oc4IwhgNWLN/WG8IqO7PXvDI+0=;
	b=fmlflVHb49u0p4gZHzdorbr66vTVyaWgL3qplL1mLNCqOTXFXriTTaTZzcIyDYYrpQiO+k
	eBmIKsxzSnQRUDx3rRN6uSF//76gm7kq1zOojPhX17CgsUn8F06JnZOorNiwJihxBtQilL
	f4hsg9QG/L9lERad3hWNukiXqQiHra0=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-WIqeGCQeNUmKUf-839BnaQ-1; Sun, 08 Jun 2025 20:29:52 -0400
X-MC-Unique: WIqeGCQeNUmKUf-839BnaQ-1
X-Mimecast-MFC-AGG-ID: WIqeGCQeNUmKUf-839BnaQ_1749428991
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742b6705a52so5881539b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 17:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749428991; x=1750033791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWLcc9JilgS7Cncp/Oc4IwhgNWLN/WG8IqO7PXvDI+0=;
        b=YG+zpv5CqIRtci1h/EIzaqeBf8Aio6ak537bNyKByVp3lfGGzYzfZUtuVll6GzR2Ko
         gW3yWwG1QHfM1Lf5FoMMg5vwf9dXLCXrGZhvC4E0ixHzhhfBPhaTY87518r+O8Zy2KNa
         wb8vLFGBItkz/ElDRXuArHbh32J1A1jkZnqMhcSPQOMhqWHiltnIYqq5h4uY1Ejh+gV5
         jntSfcQvpgfm5q3jAGALGTBly3ewo9kgg7mPKcuOnHJrQBL37RLk0UjHujMqwZCi1Cv1
         yZAVSVC5G8HkcXkw1Q+pMhyHCG2geBMfniFf3ez3plK6dDihedMvig5GQB+ddFifhGPG
         wGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmctw8mgAE5INBI2Wku3NQJ9JaYerMbUmvR/AkV1OeWB6wFFPQ9sE2IyJfFwrpClv7ZkruUTCoON/RD+Aa@vger.kernel.org
X-Gm-Message-State: AOJu0YzUN1yJBXpxxvga7NCo6oKbBvmwOdDtGMC5IcOMSWy2+uLn7Z+w
	aWgcKBxtolTxfJYS+PeHq7x45pZXRPRqs1N8Z7sXChRmXr1FuD/QtjykNQ2/SffocKrbrQVMpgk
	iON1Lpi9UYBgxiuL0bp7kq4j/Png1BDuMBReY0YjnmvgveRJsKQGYc/iwLfP+lG9P/4M=
X-Gm-Gg: ASbGncsz/WUFRHwwHm8ctFQgPZMQ73iHIcHjv34rEUP3lzuWsPxq+Fev+Rr7qC8SsyW
	sDI7cTyJkagexhJsuXXBqulP/tEP3ElWP42nPblGfVTm8Q6YtUmJDRhGVDs269xu+D9T+DaMS/k
	C1gb9KGS9fMLzxmbDPoaR2pk/aaaPPy7Gb7NeXHZi9k5G+LPQj4UAts1C03woMGA5zvmt2ke3Mg
	MZ+j2fFG0uCivC4deF3NbzM2HbB3uo8MFTTYkqLotefLlKVzrmQTB5owEvRcp6eF0OIMLihreb9
	D6q+jimxcByUCIRwToc0Ys8fNw9ZexVa/ZDsK+JcHOMXlrsiLrDb/xBHG9Q2CA==
X-Received: by 2002:a05:6a20:1595:b0:210:4397:82a5 with SMTP id adf61e73a8af0-21ee68c8a34mr16624009637.21.1749428991517;
        Sun, 08 Jun 2025 17:29:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFINCLkeeM7uiQsUy2zEm0wbd522yAG1P7DJCZj34b2eGZNRzbL4+KX+dNqfXF3CZRxH1g4JA==
X-Received: by 2002:a05:6a20:1595:b0:210:4397:82a5 with SMTP id adf61e73a8af0-21ee68c8a34mr16623956637.21.1749428991023;
        Sun, 08 Jun 2025 17:29:51 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7ad57sm4659019b3a.65.2025.06.08.17.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 17:29:50 -0700 (PDT)
Message-ID: <ea372927-08eb-4b07-b444-8985f7710894@redhat.com>
Date: Mon, 9 Jun 2025 10:29:29 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 15/18] KVM: arm64: Enable host mapping of shared
 guest_memfd memory
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev
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
References: <20250605153800.557144-1-tabba@google.com>
 <20250605153800.557144-16-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250605153800.557144-16-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/25 1:37 AM, Fuad Tabba wrote:
> Enable the host mapping of guest_memfd-backed memory on arm64.
> 
> This applies to all current arm64 VM types that support guest_memfd.
> Future VM types can restrict this behavior via the
> kvm_arch_gmem_supports_shared_mem() hook if needed.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 5 +++++
>   arch/arm64/kvm/Kconfig            | 1 +
>   arch/arm64/kvm/mmu.c              | 7 +++++++
>   3 files changed, 13 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


