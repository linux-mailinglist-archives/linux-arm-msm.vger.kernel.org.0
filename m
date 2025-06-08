Return-Path: <linux-arm-msm+bounces-60553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B4AD15ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 01:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB4B93A4405
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 23:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5988BFF;
	Sun,  8 Jun 2025 23:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qb4TR9ky"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7A0186284
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jun 2025 23:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749426186; cv=none; b=OXR6omEb8XxM1rYqzg/8rzcXUqBUbDPHcZHq8c/FP5WUowIKmsqJeJsgbqgP7xeCHOELTvyqqu51RhaX+iUuxlO+Mrl835Vi0Z6T3G2+/5F4E9l04cI6kJrMIY2HrFtOyPMEyMw6uwgwIyXcB+q8tlh/pn40/iJu7APkfnAR/e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749426186; c=relaxed/simple;
	bh=CIQ9YYwRaWcxV9gZOomLEuovngdq15gjETsoqhAJEM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QeqLgPPpv2RzYGhkwzKi6ggxyen65xj+vhr0JsLlx/FvuJ4TCTb1yGcDV9Zx+5YzsIBzoSx5GW5sP+mREh+njI85iHl7belWT1IIi5N1DuKMZFI/ycD/LY5Y/XcI/Bl6BtPBRoqSS+uEeZ0fqmYYOoqOrYi+G+Ux/FeIwYDqHq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qb4TR9ky; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749426184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sV7jw4zv8DF/228SxSyGWu8M2zC9Ud0L/iBvUN6Lp8w=;
	b=Qb4TR9kyau/8PCgyYwTKpTxKwTi5ot1QT8322Z7riANPO9rpWbLuaDXuKoelLcTM2SsEkW
	H1qBn+pYmNnMiOy/Po9Sb++mHZV/frzJe21OYnWp1txcwS6HnQlaqcsm/w8iKGTGuNRsWA
	p64cBJnCMU8Vxfx4sDhfVcqHV4K84zs=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-ZQQfgFCMOQCm84KlYIvXsw-1; Sun, 08 Jun 2025 19:43:02 -0400
X-MC-Unique: ZQQfgFCMOQCm84KlYIvXsw-1
X-Mimecast-MFC-AGG-ID: ZQQfgFCMOQCm84KlYIvXsw_1749426181
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f6b829cfso24970435ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 16:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749426181; x=1750030981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sV7jw4zv8DF/228SxSyGWu8M2zC9Ud0L/iBvUN6Lp8w=;
        b=BmlL0kfpfuoKqVqux8jEe/mmIHLsjE7+N8jvU6LwZgUhhq38cTDqoIiMhPv7iFmNq0
         YXpLUFKlUcrsCm0Kg7qrVBV+hfXdXL3qXTa3QG4t3QcnjaUiJ5SpvrlDXF/JksjJToNR
         ryQOTOc3N8q1U21kt2ZhxP3RlLKtTuhTeQHkMuA3n2oVzvUb6xDR/u58mFlWJpBevB/8
         ZUFrkaz759Tj0cgwh22K5Ym3hLLy/s0np86BpEuQb4RfJFxd5OqyRuK/IYnZhtTcJ8hJ
         wQ5eFjlYs0kYalGVX/E/4gwIV22SZcjn61cYBH4OuQMStGzM49QCeqKdzKLhCleih1/q
         Hi/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqI91mnxuj5BslEUv2yam2eyQAe0cL8cjVRZcsxynVtGfhEsaC/9shj0XmRCDS6SjLvu9oGZHHsl1JJOVC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg0SEzRkoE5HnztcCewo1F5Z5b67K1qjJIvzHNjPqLOKV6mgKO
	KLC9q+qALxK8X/sXfUfAIP6i3Uzc+JG6hExJXJj1YN19K88DnOHeV95IibdGjqNY2CWtzS0rx1u
	nRwmpysluKaImNCjBuPDfytih1QarIgs+dDAXDcr6gvtDL2bzWfCJ7xja0um2LE7diJs=
X-Gm-Gg: ASbGncuXTj5jFSSyqCeF8IIO2h104Y4fBPpTFdSBLRAeYfzrq0ftPIwnHpawLhEaYEh
	Sb0zQ0W0y/J3u1vWWBBUzuGN4+Yc4FX6Iy9AEJFvWbae8DJEKJG0lcR86SN34PEzwhAA/d1nVau
	xvL3fb83brRFl7GeN4qQ9sSkpy85VWB9S2QziDHlcDgeq2776NsnZgVILL1AwTVNuB5MwP0o6hj
	1l/6GaNK+VP/ZIaG21dmAr2MhZocfQyi64dr8u39KvmZHaKnKeln0zRclzR95r1MXaGaW+EMopK
	lgvc4hr+TLtJ2vTxXC1BTn73CqRSvyTSyoW+ElHheefM8LQhjasPSYO527O4Rw==
X-Received: by 2002:a17:903:230b:b0:234:ef42:5d48 with SMTP id d9443c01a7336-23601d82cf8mr163243075ad.38.1749426181431;
        Sun, 08 Jun 2025 16:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7bor77vjvj+YZaqMIThNhyNLCg9HXt8FW1PEgAUkMFTVnRH59XUdt2gBjoBPbQYitKhphEw==
X-Received: by 2002:a17:903:230b:b0:234:ef42:5d48 with SMTP id d9443c01a7336-23601d82cf8mr163242965ad.38.1749426181096;
        Sun, 08 Jun 2025 16:43:01 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fceb2sm43669945ad.96.2025.06.08.16.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 16:43:00 -0700 (PDT)
Message-ID: <af2fe174-492e-4eff-9077-a450ab393ceb@redhat.com>
Date: Mon, 9 Jun 2025 09:42:41 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/18] KVM: guest_memfd: Track shared memory support
 in memslot
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
 <20250605153800.557144-10-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250605153800.557144-10-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/25 1:37 AM, Fuad Tabba wrote:
> Add a new internal flag in the top half of memslot->flags to track when
> a guest_memfd-backed slot supports shared memory, which is reserved for
> internal use in KVM.
> 
> This avoids repeatedly checking the underlying guest_memfd file for
> shared memory support, which requires taking a reference on the file.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   include/linux/kvm_host.h | 11 ++++++++++-
>   virt/kvm/guest_memfd.c   |  2 ++
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


