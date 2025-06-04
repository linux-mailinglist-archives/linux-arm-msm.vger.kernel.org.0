Return-Path: <linux-arm-msm+bounces-60199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FEAACDA72
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 11:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B0C2188C0B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 09:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BABF21FF35;
	Wed,  4 Jun 2025 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8buhdlb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CF5171A1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027646; cv=none; b=hTXFrCxDraFBoBl8J1FhdC2wIBJbBFI0szl8hmdoFzSnuvG+SV35vI4FnriBDMeZIL2qF29Pb33hktJVMDBVlLEPw0UCe4uZZ39YnYQx3IW6gWj0E3iQPe9Ipnj9kfG7Dk/T7HOTwu298RqyH/XJRDTmj2yTL4FwuSOjDjJdZk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027646; c=relaxed/simple;
	bh=sFDPx9PnIyChyotF3uSxA9GPbPhQSr+kEJuQAkIqOL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyFnIap8KrHKxKh1vst2NGQ79qf3KIsxAv4tMyyzmFzkQHErf3wicf7+bGODTMskxWkAnX7OK0NTLqXNC39x3EZHgnxcptWJ3kv97LRVCQ7uw8UlUczdVHnh4o6oZB2pFEm2SX7z+pEQKACFEX/37knxIqZnl91IABoYlAk5oGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g8buhdlb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749027644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I1MGX4dUL85emYMb1ED5ErxsocvR1puK9Nem0HjGHKw=;
	b=g8buhdlbNTyNHj5XDW29qdHLmuuvgZOjxcrLLgUDD9kGRkW7Gvlurb6k5YissU+WsPao9p
	fpl/qKEknOaDbzZtz+DMFsDt9kdo35BUukyqLNFmbWjiE9P5JWmJycUuhPs/Myb3vhFdRM
	uWOQEivVjSRSzpv16BjblqM6kK7iwo8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-6ehKvMfXM-W9JDMHuMqZxw-1; Wed, 04 Jun 2025 05:00:42 -0400
X-MC-Unique: 6ehKvMfXM-W9JDMHuMqZxw-1
X-Mimecast-MFC-AGG-ID: 6ehKvMfXM-W9JDMHuMqZxw_1749027642
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e0fee459so558799a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 02:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749027641; x=1749632441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1MGX4dUL85emYMb1ED5ErxsocvR1puK9Nem0HjGHKw=;
        b=iPYAnX1fa3Ff4Kn8IfB5gonyFemYnTBRz2vOD1S3oBdPtfDA8kqjOoyxUdKqYtIIMw
         r2G720tsh0Fr7j7qlR2bpEcy+IrkopX1kewn+Jhu9rottqIvEuY4llnJ7wMFLVNAe7Dt
         4Y1edbZtZZz+2p5zzIbfDkLgDOCV4rLQj6oEPX5hyTXl0MP5eZ0h9SzaLAPHdz7uz95e
         jTn2PneGeftSj4znzxp936F3VNOC0M4GxPJPA3fi9+hcDCBhsbJ9/pHQvtDH89/sSKEP
         NkDv88XgP6PEhY7h7koPCya2VBCMmg2vgZFBVOJxHxUBh3QFIvJ/1nT0U0q4fRaavn72
         4NEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwJ+GSxRN62vI/9zDnN4LyLe9zpmkNm0vLK5+YdVH9mFAAbLG7BKrUz+wQpgK2btAQ6RjUHz7y9DO/ncM/@vger.kernel.org
X-Gm-Message-State: AOJu0YzSWPzJNyY7zS5yyjTTxdts/HE0owJ7juopXzMoZu2WaVkGK0Rc
	aqGuQYOJbMEsAnQndhKxzKw7PmzISbRWKcLxnlikBHslAyWW6U31qleAOUx1sKdLXyDJLLmsDJI
	qNF6ZT3og411nzCulo3liMcb+Io0YL65FP0w3fuEYitLAcFPTiXPqkPh/xMA95X8mKvlEWxJ6mm
	A=
X-Gm-Gg: ASbGncsN+UVN5VqiOBuyJB89ZH729zU4zUtLPhReAAQKeO04f1juO/tTcXPb9CCv5cz
	z3ton22MArG7+uj/cbgempezH2WSAYOTt5NnA5IqdwTJPAr3lxluCd5Bzus1nQ5qtXFyDyeU2F1
	41hz5nevNMBhGsLHq4zLWJP8PmBXkjVh5Np6/sRMhTwl8vQzwry/X/KqWjCW9YeGtCNgCerRvcR
	DxpNenznnHi5k3cf8TnwVIvGpRpORcI9lIFxW1Pz18AhiXCExi2eTDDly4dYGSRRBPRtTXyCa4d
	0TNYShQ4kQiA9f95WNfnf20qQBsgLmbl0vtTdwHeZztV6Wwm3KY=
X-Received: by 2002:a05:6a21:a4c9:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-21d2275affamr3281368637.18.1749027640783;
        Wed, 04 Jun 2025 02:00:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtTWWeA9jam1fT8PmW5xs6BajYthggeHnemnm+gzA3QybPaPwl9UDtfWtk6pB2dDDU19J7fA==
X-Received: by 2002:a05:6a21:a4c9:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-21d2275affamr3281298637.18.1749027640329;
        Wed, 04 Jun 2025 02:00:40 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe9670bsm10688114b3a.30.2025.06.04.02.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:00:39 -0700 (PDT)
Message-ID: <56a7b265-a863-43cb-b119-372673bb0e26@redhat.com>
Date: Wed, 4 Jun 2025 19:00:18 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/16] KVM: Fix comment that refers to kvm uapi header
 path
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
 <20250527180245.1413463-8-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250527180245.1413463-8-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/25 4:02 AM, Fuad Tabba wrote:
> The comment that refers to the path where the user-visible memslot flags
> are refers to an outdated path and has a typo. Make it refer to the
> correct path.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   include/linux/kvm_host.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


