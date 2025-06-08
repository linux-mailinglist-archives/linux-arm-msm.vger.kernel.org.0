Return-Path: <linux-arm-msm+bounces-60554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1AAD15F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 01:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 220F47A1174
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 23:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F428BFF;
	Sun,  8 Jun 2025 23:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BV97lYU2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50A20B1FC
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jun 2025 23:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749426227; cv=none; b=kO8L/OLHmkk7bSuekpIiXInxwJguQSDG0YsULA8+IPrD3u601IygeJp5fiJSx+sXVMi/CfZ7N26eacCty7p1Q5HdGk3zgJmYARaPNGzgEzSU3OxnqHROcCEYCDu/wsejpWRPyhlF4gX/jlVijc4HPALTmxc9kAxuLhu3Rpw+pLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749426227; c=relaxed/simple;
	bh=eognrAOK5phWj4syA8utC5cWw/hE0DYWnC/1UPPwauM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mmREJBokVYpfssgqasipfsFPSNU2vJbKlYIxuynzUxLWI5/lfGPYjoMyWAHbghJ2nP2G4pZBjWSHbjx6jjY4voov3rL/6Gfmoa3voxQ7kezH7Jb3e6EZprMhKn4SHvhtbX3fNxltAzA64KSLb8NnaGo9e0jzfWzOKSObWsp7d0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BV97lYU2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749426221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DZTYuUEgwsSSH/seLrjyp4437G/xo/ld4sW2rsZ41WE=;
	b=BV97lYU2v34Yy/blL148fMwVBipBd/4o0azOrZ0g72C19fhRuAUhcb8pUQOZ3MxJvZKB3r
	v3LUk+i4RWRyxDgci5AIVinRtQkW7pu9tsKTwqV7lBufE4wp75jTNEy8kP8JmvHfNTIy0M
	9IspRGbCdpkQ5MuZN68XJdIva33FMdU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-NlBUN8xbO36TDyLNnLMRLg-1; Sun, 08 Jun 2025 19:43:39 -0400
X-MC-Unique: NlBUN8xbO36TDyLNnLMRLg-1
X-Mimecast-MFC-AGG-ID: NlBUN8xbO36TDyLNnLMRLg_1749426218
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7425efba1a3so3046988b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 16:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749426218; x=1750031018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZTYuUEgwsSSH/seLrjyp4437G/xo/ld4sW2rsZ41WE=;
        b=dJ45uB+iruiaYK+0ArUDInogJzzQZTMJ81EmY97hpSl3zua8LmXyMpV/ehnQB+f/Lg
         h0o9jvjr+iHrHh5dEzWa/g10KjvXnE+FLLOYzifVWqOGQRWNl9HxWoSqRZEnF5S7+lyJ
         nRuEE4eqbNcHF+2IJlUsl+7utVztAihKLUD2XFJ1TAnAQDt3EbEW3Q5EtpjsfGTgFtI2
         tYS0ZxdncLuNPvOgHQUz6/1X5TaQZF2hNFHpUYEc93gqWwqGWBunqrgMMPCgTRo/WWM6
         FUBURUaP/lpoxkgKUcRq/c/vLRpkPHeF6fBZi/dVHvW+25HGzzkEPOqJPbeHxtZshFW0
         EX/w==
X-Forwarded-Encrypted: i=1; AJvYcCWLyVQMArRRUla5TPBZWkdTzmHPYaD29MEcai5DYdzshBFJCXZvllymMpef5yAq6khZjIZeHddpMAVSQ2uW@vger.kernel.org
X-Gm-Message-State: AOJu0YxmU7Vjhg2e/V4zjfXWgeRU5RKJdziyzecO6Q7TsCP47B3wxf0L
	8mmg561ruNOqHyqg4VtMO+Nk13lvhfJbxS0RI4kAy4UZ5+aYUy5Fq1a4aiw7R2iG3S184nJEKie
	N3ou07dS5EMW3CFE12NhP6N4aXwt8AJzjUQv6xXQF4WTXM1lhmJ10hAfTqC1799oEvMQ=
X-Gm-Gg: ASbGncubtUPxmaLhN3Hfh9c+atb4XqiX7GxYtBLQyiJbuGoVnSQwYTz/IHgr7QAvM5R
	fmT6BXlrkdNcM2y6M/t5nPrdmqdATWn1uM2LkE0vcxfL1GnFSVtCzECmlIuqbsXyQHuOeUGbEID
	+WLrfDVmsVcFGzpSbbvbIL6ucl132PrEBREApWWgHNubQMwFtOHZ/FdiuhRIR0CiOpbhftgKXVs
	hMnwPOLJyV6/DZcqm//EEtAmFqXSAVfYWH+TpENaxfmBt9MF6vBWloGCaddoh4JCoA0sW6msuVK
	gFVR/7VhmI/CXe6UGzej2wnRBw1tJZPTKyIn6jBTNim1Z8JfUuQ=
X-Received: by 2002:a05:6a00:94a0:b0:746:2217:5863 with SMTP id d2e1a72fcca58-74839af6c88mr7041897b3a.6.1749426217839;
        Sun, 08 Jun 2025 16:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMrZVN3nL20lU8KRAFANwYTY3wAoHW2KVfIcHNcKcpCW87hvtDrgtI8DfNiEq6ldydFzu9YQ==
X-Received: by 2002:a05:6a00:94a0:b0:746:2217:5863 with SMTP id d2e1a72fcca58-74839af6c88mr7041844b3a.6.1749426217481;
        Sun, 08 Jun 2025 16:43:37 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7b2aesm4695870b3a.61.2025.06.08.16.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 16:43:36 -0700 (PDT)
Message-ID: <ab9f3307-893e-461c-aa1f-54edc032e11b@redhat.com>
Date: Mon, 9 Jun 2025 09:43:15 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 17/18] KVM: selftests: Don't use hardcoded page sizes
 in guest_memfd test
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
 <20250605153800.557144-18-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250605153800.557144-18-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/25 1:37 AM, Fuad Tabba wrote:
> Using hardcoded page size values could cause the test to fail on systems
> that have larger pages, e.g., arm64 with 64kB pages. Use getpagesize()
> instead.
> 
> Also, build the guest_memfd selftest for arm64.
> 
> Suggested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   tools/testing/selftests/kvm/Makefile.kvm       |  1 +
>   tools/testing/selftests/kvm/guest_memfd_test.c | 11 ++++++-----
>   2 files changed, 7 insertions(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


