Return-Path: <linux-arm-msm+bounces-58841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6984EABECD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1946C4A4A9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 07:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2619123505F;
	Wed, 21 May 2025 07:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qu8fIb8s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775721C6FE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811702; cv=none; b=cO2y6fKPtK0HaE1Nb8Va7Ea8IQ0OyY92V5J/pO3dpHwShkZtkr8KnfVxEEK4Gt08xgeomOue/EXDKigQaxsvBeil8jYjoPCMfWtwlZ+SFvQCsaDrerP9mjRQniQVxcuAEGFwGpDG0857rpz23rzSeIfPkTAaGEd/9yNJqUhcjFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811702; c=relaxed/simple;
	bh=27N//sgpUvINXwzlWBTx/oTGY+oOdmZxMUtIWjJ1tyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqsfT5aVQ6JJF+WxDg+5ulmywRGIao4H5z9+b0pB8cB0+F9U1I7OoxNJJHs2Ht3KJP+FNSYGzFtrtFOil5vnMIk5eTTuwpZl91HCEfwSC9S6sQ7WswXSXaCu1N7F0ce7W5buzd+vwiBJ25bn3BZlOZH/FuS0oGBbkNpKZxlJCQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qu8fIb8s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747811699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMLgAYcXkQ7ab1MRKxScrwK5iXyGw0HpuxGnY+yOMMk=;
	b=Qu8fIb8sDnXNZnkw0xuFhNqZ8WpUy57tugXTGz54YcpADLRYPrkopv3tUBwF/YQQz7dHkm
	CS5lUEjDi6ZJtVGOD/ATteMhH9Ytzgo62XKnWFdx/rtHOcRBPIOi6LzalHAic4JavhaKfK
	YzSiFITxX+kiUj4/DHL6MGt/qDZba74=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696--fPztQ7zPSqEFp8i-aQXBw-1; Wed, 21 May 2025 03:14:58 -0400
X-MC-Unique: -fPztQ7zPSqEFp8i-aQXBw-1
X-Mimecast-MFC-AGG-ID: -fPztQ7zPSqEFp8i-aQXBw_1747811697
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30ed6bd1b4cso4777699a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 00:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811697; x=1748416497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMLgAYcXkQ7ab1MRKxScrwK5iXyGw0HpuxGnY+yOMMk=;
        b=nPc2Y8a3bC7Yr+CMHw9Z3HKOfI/yiJ4MBor5hE7sqAttiQ9saSd6Wjez1hYuZ3X9pN
         TsFpHQu7bSQFDVREP+f+SBMIcEruarIWclXIo0FfrxO+nR83WA8rYTRM7VwM9zjnTarf
         pLovbtCCNVJ9baKg5D2dOH3Z+j8jop06v2VcbB7sbKlbw2x7A2jGzulImEnway0Fc0yp
         NP07k6iNHGsU7Yxigh4eppVncdh52AlHFHl0BzGY+pK3EycrZK4z29ilaeGVLaSOI9Wp
         IgoPxLRgEw4BnTPWlpN6xxrLM0/ZiCJxLZw7uPSSeWMx+l+03ouqKjIbRxx7fMgnp35T
         nI1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHQzZ0gwN3kyXd9FBnKZwpr9+H9CdzWlVhnQRietZo34eIyWy0ZTFP6nE7oKobOU/4adrOKrJIbdmmXBvy@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/iE7naY9iRNYYr5YZ+g+npe+8fvX33A0qlo9FZI+nHmFDv1t
	RPEkvh3AhIEnOyGC6FctX2U46ALEbNfgTvDUrAIP3fZVYNlrl+xZP1QjSs6yu1fz/5cTb7T+bgR
	QDNIsMPRZ9SQ/5hODHkOG2H+Fa1TRQuNgRRxYBtcyj8cWRmIVY2z6jXfz9KeO6W0WSqA=
X-Gm-Gg: ASbGncv3NX8apf/xZv20WtS3hU4JwTQdaXTq8qOrqa0sIctWSYQpSCbo1WqzyRhE0jD
	JNY9SIc6kdvXE3SNo+qinDyXmLuPPvA/ROG+BK6EgyxKbs67aHq03JUyQEUdW0i1lWYPmwQ0/mJ
	rcXmqWje1eE4agyAfeI/bvb/x4riTaTTdCujXdm0LGVRJtaFixDHA1GM5AYbShP09Dx0tXf1Ajb
	klVBQ9jH7QCRan5UJkqW7rKXJpZbg6MCdjTZb/ErHlB9l7XwxkCVniV2lmTl5nzTY+W7kDX9/qq
	B3tgh4zJZPxJ
X-Received: by 2002:a17:90b:2d47:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-30e830fbe8fmr27072732a91.11.1747811697047;
        Wed, 21 May 2025 00:14:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0wnoGGQNK4jnpp++iVbLeuYLd164Ahc4bw0fjZBhvg2JpazbH+4EPDc8cfRErjMHlyGXurg==
X-Received: by 2002:a17:90b:2d47:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-30e830fbe8fmr27072701a91.11.1747811696660;
        Wed, 21 May 2025 00:14:56 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365d45e2sm2946400a91.27.2025.05.21.00.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 00:14:56 -0700 (PDT)
Message-ID: <793c5439-8656-408e-866a-3ef3c1643df9@redhat.com>
Date: Wed, 21 May 2025 17:14:34 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/17] KVM: Rename CONFIG_KVM_PRIVATE_MEM to
 CONFIG_KVM_GMEM
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
 <20250513163438.3942405-2-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250513163438.3942405-2-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 2:34 AM, Fuad Tabba wrote:
> The option KVM_PRIVATE_MEM enables guest_memfd in general. Subsequent
> patches add shared memory support to guest_memfd. Therefore, rename it
> to KVM_GMEM to make its purpose clearer.
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Co-developed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/x86/include/asm/kvm_host.h |  2 +-
>   include/linux/kvm_host.h        | 10 +++++-----
>   virt/kvm/Kconfig                |  8 ++++----
>   virt/kvm/Makefile.kvm           |  2 +-
>   virt/kvm/kvm_main.c             |  4 ++--
>   virt/kvm/kvm_mm.h               |  4 ++--
>   6 files changed, 15 insertions(+), 15 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


