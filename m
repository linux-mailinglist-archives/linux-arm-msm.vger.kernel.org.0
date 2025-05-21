Return-Path: <linux-arm-msm+bounces-58845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C90ABECE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6790C1898C57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 07:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1184723506C;
	Wed, 21 May 2025 07:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JQYQrOTc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7680D22DF8C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811816; cv=none; b=edIrBZ5/MbddoaButwsXbMsvvrv5I6XSf1C89CRU0oGYdAht67jZFMJ+4PmkLhfHIo2zDaQUlxc7lFQK88JTN6B/i91CpLQCQ4UFEPLymyAeFIVDWGSufTQhIu4zRNaJxdAJhF8WTIjx+Ghyfm+rtBH46nbyzLZzjD2kuDMsJ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811816; c=relaxed/simple;
	bh=nlkbXinOjzB/xrsP6yQTWg5BI750WHLMRDlsM7d04x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iffURwrvZRcixQqj839hBNp8FkjpL1rsZYIVN7FeR8ZAfzfj5WUJJdiCsYQ2lzN+rsrP3OD+OE4fW4g0ONEcVzdALVW8bcCC0NVOA7Huj5GiEup4Im71nasjQDhGp5ntdYUz43DiF47J5/FL7X8GAj809WVPzbCK1geeOfTdm50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JQYQrOTc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747811813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+Ru9EDbsALsMtXdnHj90bVzgkjcy1FvneBRalBh/w8=;
	b=JQYQrOTcrUB2mchu+Bkv+ZQZON5HVc6A6PASTn/zvU1eWSd9eegoUOIBkzG7p2HXinSys8
	QK5yKRZS+Wu1QFIlnnG6o6LIB9TSj3yage3DYCAU/pzZtvAS8dOvDLH8dOW7yCajWHoNJz
	4Bo3KW6ckRRRhP77MF36rZqXPgRPD/w=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-T7jR-bJ7O16mu8Y-fYRXtg-1; Wed, 21 May 2025 03:16:51 -0400
X-MC-Unique: T7jR-bJ7O16mu8Y-fYRXtg-1
X-Mimecast-MFC-AGG-ID: T7jR-bJ7O16mu8Y-fYRXtg_1747811811
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231d4e36288so48574645ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 00:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811811; x=1748416611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+Ru9EDbsALsMtXdnHj90bVzgkjcy1FvneBRalBh/w8=;
        b=kHZ1ZnfYwzbnziu3QtAeyZm5sSeYZIoEPiehRgnY6t9YPX4JjriT7FDrHv1bn5Eq8/
         e8FU/JVXdZgZ4CWfbgrVbe04/Sf+5lAV+9+386xHUqrY65LyssP3a/syInLg1kBZCEm0
         ewpZoWrZ16hR5jXRiSgHJfCD8H4hruetYFGvKUC2sewi1SD/k2FT9CvJC93gRtL3GVOt
         VscRYD/m4NinStpK1RhJD/Xu/U3SMuIsCWLdrh/hzcMdYiRKqGfAlVvIpWGNv8Sv8GQr
         EeDuaXzLgkxu9CbVO5xglSPcPwZPxnvsEWmReeWDQKyElbDfw0uYXi+9Mj1yKFdqiFZL
         RdEw==
X-Forwarded-Encrypted: i=1; AJvYcCXpBhdlXoq2edRL6gC2vieiwss7Gku0PYpkki6vWu7Cii/9kPVDVPZBwZu3KuvGPspzwTk78MyUL14hnK8w@vger.kernel.org
X-Gm-Message-State: AOJu0Ywog0ZrowcOgRhomUyRBF2LpSuk3gwWi1fY06jCVacEVYoqCHvL
	1aUUvZjXRcZ32cXQSSb5YhDh2K4xJH35v6JcSLfTDcJ6lpB/fh1he4H6dl3qG3Y/ZKNhvCKqv4H
	nsM4rj2TnZ4cj8BwwAXOYT2sGDMQtqdMzRodZk39zm0z5rvMmyRjGOeZTZevYsMbUhv0=
X-Gm-Gg: ASbGncuti1xuYbjJtcRHl34mqdiD1c9iVkLLJMcsXtLbeRhbQt+8MGT/MyTjpqT+zi1
	4cD01YcNkh2dfsM8aWJvK94qVE+bnAXTS6qJY40DjiKNWbsKrKVjeHOov3fcAb7P4F9s8A1fN/n
	37C2UaXsfda0ww/LT/BzIKQqg/b03DG1Uk9dYHvjxkQgUq2tEPuiJ9YZwKFPLcdbZRs7umvHtdY
	4ysW/Hg1/rJCJBxtUqBbyQuYGolZHxkfdGF5rN1Afu4yUbqscUAKyJRqgOc9zODgqDKi2sFd+Fo
	rwViSohuAccP
X-Received: by 2002:a17:902:ea0a:b0:220:fe50:5b44 with SMTP id d9443c01a7336-231d45420a8mr274300935ad.31.1747811810758;
        Wed, 21 May 2025 00:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKtOvYj5TPFsGR1ANsFXDB27zGV36X3ObZ2CL/NKN84gcl9M8LlCEvqKva7FWbmrONkck+0w==
X-Received: by 2002:a17:902:ea0a:b0:220:fe50:5b44 with SMTP id d9443c01a7336-231d45420a8mr274300545ad.31.1747811810347;
        Wed, 21 May 2025 00:16:50 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97db8sm87525345ad.110.2025.05.21.00.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 00:16:49 -0700 (PDT)
Message-ID: <db7aeedf-7230-42be-b82c-62524bae188c@redhat.com>
Date: Wed, 21 May 2025 17:16:29 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/17] KVM: Rename kvm_slot_can_be_private() to
 kvm_slot_has_gmem()
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
 <20250513163438.3942405-6-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250513163438.3942405-6-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 2:34 AM, Fuad Tabba wrote:
> The function kvm_slot_can_be_private() is used to check whether a memory
> slot is backed by guest_memfd. Rename it to kvm_slot_has_gmem() to make
> that clearer and to decouple memory being private from guest_memfd.
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Co-developed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/x86/kvm/mmu/mmu.c   | 4 ++--
>   arch/x86/kvm/svm/sev.c   | 4 ++--
>   include/linux/kvm_host.h | 2 +-
>   virt/kvm/guest_memfd.c   | 2 +-
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


