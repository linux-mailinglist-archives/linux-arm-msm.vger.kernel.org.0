Return-Path: <linux-arm-msm+bounces-58847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E79E2ABECF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC1527AEE96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 07:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EBA23372E;
	Wed, 21 May 2025 07:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZQCiupCX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EC8235368
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811837; cv=none; b=aux2n9kBSYc3fjUMtLReheAajq49gJ07cSrNF4A2+l+7Gwl4YupyFeBHMeCYEi3sW5yGb6pXqcvCPu4PBe8Xt4a6FMHEP7aAw4v+kpl0NXjYLiTEZUh9IkNSb2a9n/jMAEY+IV0a/KthmewzD77demo/1kz+ek4mR1lvx4u3FKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811837; c=relaxed/simple;
	bh=Lkb4xfg43buJTPC241hb9jmkYbrpsqLjqwpy+oeHVjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LqyrwG1wNe9GmJj/X95PTj8w9OV8rpSQLJ2HnesT070CLrJLHA+iqIHRGG1hWJuZYdUltVpZGZV7MwVyXXqE2AxAT6O1E+Yw0ihQMXC5dJTThg1zbXU7449GkyB9nOJCCnssuZRVZMVFK+YC3Xe9wVnmEt0RXCKNPotjXik3oB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZQCiupCX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747811835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2bYtpSD4eVttEZT2gQg7ORQmcIg0TegDdKXcW6Flfk=;
	b=ZQCiupCXkRx1bo65HvB0HiG/11nAJ89Pmf8bnsJbs5GEOATZlRPeBeG/nUvmKy9ErFEL2g
	CEWpH8DNOOif94QhpYOZ9yKXDcY12crECjPch8ZzPVmU3JH3sUFDpQkbi3bVqgkXt7A6Hj
	QO4m424eVloIFgvHsoWImBm1GTZBuJU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-VhvaLzvHPuSdAIgC9zvAhw-1; Wed, 21 May 2025 03:17:13 -0400
X-MC-Unique: VhvaLzvHPuSdAIgC9zvAhw-1
X-Mimecast-MFC-AGG-ID: VhvaLzvHPuSdAIgC9zvAhw_1747811832
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e3b03cd64so51006475ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 00:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811832; x=1748416632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2bYtpSD4eVttEZT2gQg7ORQmcIg0TegDdKXcW6Flfk=;
        b=l2nRor8mbILxf4c1Y23ZOSZXotSM7vdSswlGU8an0AIlRRRIq8CjtsBBUtceZ6RP9m
         u5ZrY0oY1IgByF1pQesbOawQ8oKUk1IIj5U0iUD2r4Hxaua7H+dSuQ6le8iQ4OIOzd9j
         4IUOclYQuNKTk+2Hn0EWQE535qtmLCrZmEXHmkirSLylXMHPC0623y5JsXkznJ2wSKAL
         09x/q641RZlX97qX7wibNmXdCiBEaVs3fFWEdGfbWp0GS1QXqvZKDHa6fMvpnUC/xlFu
         i+PHY5iyEb5+damzxHPH8KcIZY/UYfoqFqBQvT9D448Vh+AIs2EoWLOa1EyAsLDtLMzn
         dBXw==
X-Forwarded-Encrypted: i=1; AJvYcCWsUFWji1DWKDq8frA3lPcutOEOHKRKhYl1uUV9xfzqTXyX5FCNuEPcoNyUevsrY5eVR3LAATU8KeZr1Exd@vger.kernel.org
X-Gm-Message-State: AOJu0YzE3uSCtwtfQou4v2ChcTOyq9Cl1LhBvLViYa5mfYxFytz5Z84p
	TIRUNnAe2PRIt0ygjK+Ib943tQPn2Tg7yBzrSG1HmPNJyICECOopcKBpiZnfhGxt9JlkgPiJEGO
	eKnX9gLVMk/9i8TbLCuX4H8BMW3TlnYbxXFblQz1Q0U+36Jb64gFdT/RBRlQKaeDwtgc=
X-Gm-Gg: ASbGnctWbvCBrTGRp5wPpwMpCmo/ijgWIxs23A+qI3bNvM8jk02N9XbfmuUgTTqlEDt
	0nCSCsSId0mqXrv8DKzd03GiMB5VfB09VRGidI8tZFWHh6pfeILXiZIYGPyxuWMnrwOu/aFC8PM
	Ynp/DB8slcbd/Gp8j58TNgowFLE4XiYSmmgYnqd0F0PfKLjEt8sHS2IR0g8t8wzYNh8dl90Xs9r
	tHmYvdahqQHXvHorMNFh/VhN1ECYJLGADqiqOWHTQXq41z0cs830VjriwnxM7BFvUlhMGQ3UMTc
	zJw8UXoX8FgQ
X-Received: by 2002:a17:903:1a68:b0:216:393b:23d4 with SMTP id d9443c01a7336-231d43d9bd7mr296003025ad.11.1747811832153;
        Wed, 21 May 2025 00:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8rqtT6WPv8GL/EVV2bl7K5zo3KsgvBOogfBIPsa3s/As1SOUpRDCkufJp02pYEJy1oaRVXg==
X-Received: by 2002:a17:903:1a68:b0:216:393b:23d4 with SMTP id d9443c01a7336-231d43d9bd7mr296002565ad.11.1747811831703;
        Wed, 21 May 2025 00:17:11 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97db8sm87525345ad.110.2025.05.21.00.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 00:17:11 -0700 (PDT)
Message-ID: <7407b8b5-3a08-42fe-b7ff-07f7edb5cc88@redhat.com>
Date: Wed, 21 May 2025 17:16:52 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/17] KVM: Fix comments that refer to slots_lock
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
 <20250513163438.3942405-7-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250513163438.3942405-7-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 2:34 AM, Fuad Tabba wrote:
> Fix comments so that they refer to slots_lock instead of slots_locks
> (remove trailing s).
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   include/linux/kvm_host.h | 2 +-
>   virt/kvm/kvm_main.c      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


