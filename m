Return-Path: <linux-arm-msm+bounces-60552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F9AD15EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 01:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20C0A1695F1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 23:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD314266EF9;
	Sun,  8 Jun 2025 23:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XEAdgQ0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EA1186284
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jun 2025 23:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749426166; cv=none; b=BHmMGcnsd44aostxBJGZd6rK/1LupVc8ks5GXqF0icLF+/uNJdG4q4WzQG/unT1nnRjCUDsLNsgzJdsSa9qYNicGNHodHbJyDRz4yL1iE2f16x2HffhxJe2OKQDFB8gvsAKLqVOzbJgiYsKgekyqV9Y1eOVqTgf4Pee8MTh9ne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749426166; c=relaxed/simple;
	bh=3BrPqick3GI480dewMt6lfWOE6CKi6PdWbeMGGqvCn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTS2XEPZ+MT7mE1noFbFT2D5QB6XWFUXf5EhdCJcP7xEO4ISuwK3tHyBx0jEX9aVvxWruX532hCo8ugBIZDRwbivttqUhxCdU+0y/0h82Uy6mPK7jNPvQHCwu+24AgT7em+GIg3coLuEmmHuK7e3I7aqACh5kLx9LT2428b9TX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XEAdgQ0Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749426162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BrhPYURkD84ucWukiI2OFvciF9PKhh9wNSV3UCxvffw=;
	b=XEAdgQ0Yd7sLbdcoPj59BFQOyjwPtdJibsFCaYF4X2/VGmGMc6AqEVme0+eVB6LxvFFndR
	jxROxGMxY1gn7o4zjJCZ7+nPBJYieHKJRZFswfPjRTRhoAuvhldeMiAic86pKWCd+2qEd0
	rHhipB4eUwTbha9bkR6N91pIAvGXiX8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-uB0w6HTlNh6aVKBQsaFBjw-1; Sun, 08 Jun 2025 19:42:41 -0400
X-MC-Unique: uB0w6HTlNh6aVKBQsaFBjw-1
X-Mimecast-MFC-AGG-ID: uB0w6HTlNh6aVKBQsaFBjw_1749426160
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-231d13ac4d4so57448135ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 16:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749426160; x=1750030960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BrhPYURkD84ucWukiI2OFvciF9PKhh9wNSV3UCxvffw=;
        b=A3UERLogN/YlrNZGhXgX20mzUOq/w3zQp+VTFJQCDAL/a0evwdHGJfMP7aLiYzKer1
         IhjKYFIej8KSohAte3K/6Yuk62QkKK8mSjEURwRNvJ13/R60EYoho0ChjS70xsOUe0yI
         FUTIsNdux8Zv+1NwxVVVLgCPZ6DPT0Ox4DXLvG6cD/9mdbTyQsD39uhnHLwEuuztNhOc
         6oL8PaTp4yC6BMRSLqO0RNhFb4O7mphKECKU/fqAEQZK0XrlVzvu7SlURD6xXOZHdX8U
         PpSb9h87zMWOkmAEYq7Qt8Z3uES4bTf9iiMOAuraZrypgqWg5E1Iiq//JCEszk2N+GL/
         dfsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbTb1kdCsGkq+AM+3w1ja4fK0hUtPfWSuaVBSqCQGsMwQWYlgZrfRR+/UnYChVzADx5t9CjJAurDVBUp33@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/r/aJf/aMIFRNvew+8GLIIe41icntPIB6+CWvS6gK6e2JTYXE
	AjLfjy8JUY96EzO0IAWEnO9QLqu2PFADHp5OydHNzsgoFfBmrEm6sD1gbVHuno7KQ+24sLUuSKB
	L6fkdKVAecwOPoWXTwKhtlPqT3rmms54mWkPxdwkDu05X3gufKII/EdFpfD11+hoKphU=
X-Gm-Gg: ASbGncvmbScMgqSaQ0x1vSSc3TaCP1w7fsdGKRSCQ5ahdDg7iy1/9Ynmgfuv+vH58dk
	gK+IKqctQJqX3anjhFNRnhDuAsY1T7FA5ESgXgNVjWtKaPbitVQSdg/EqQEqQkVg1XMKO7ZWuQT
	8YWN5eWQ4QinR7+9pWgahBpAGM6osKbBY474AiM9oXnbLp/ECrRO/htWSa7Ir97Zo+7KhoX/MQn
	hlhztWw++DIDl9PEVHgfbay/cDKpzeb+aGbz+gFUb1zNrtHGlafhMsovBipDdDMGqok2tA1H1Pt
	vCPebfuTaWBnx7a5NA8ElpZl1yKO9ZAtrFk0PXhknq6vnyGWQ3c=
X-Received: by 2002:a17:902:d483:b0:235:e1d6:4e29 with SMTP id d9443c01a7336-23601dc0136mr171113695ad.36.1749426160449;
        Sun, 08 Jun 2025 16:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhhqD14zLILdtjSL+nHgtl9T+hPRFKWMZ0ZPJay0gEN8OyStVlbzILHd0cwkG13OOqkgTWcw==
X-Received: by 2002:a17:902:d483:b0:235:e1d6:4e29 with SMTP id d9443c01a7336-23601dc0136mr171113545ad.36.1749426160106;
        Sun, 08 Jun 2025 16:42:40 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fceb2sm43669945ad.96.2025.06.08.16.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 16:42:39 -0700 (PDT)
Message-ID: <e37faba3-b0f6-4cb0-bafc-f99573fd4adc@redhat.com>
Date: Mon, 9 Jun 2025 09:42:17 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/18] KVM: guest_memfd: Allow host to map guest_memfd
 pages
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
 <20250605153800.557144-9-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250605153800.557144-9-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/25 1:37 AM, Fuad Tabba wrote:
> This patch enables support for shared memory in guest_memfd, including
> mapping that memory from host userspace.
> 
> This functionality is gated by the KVM_GMEM_SHARED_MEM Kconfig option,
> and enabled for a given instance by the GUEST_MEMFD_FLAG_SUPPORT_SHARED
> flag at creation time.
> 
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   include/linux/kvm_host.h | 13 +++++++
>   include/uapi/linux/kvm.h |  1 +
>   virt/kvm/Kconfig         |  4 +++
>   virt/kvm/guest_memfd.c   | 76 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 94 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


