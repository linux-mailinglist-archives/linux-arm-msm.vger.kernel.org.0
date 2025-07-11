Return-Path: <linux-arm-msm+bounces-64519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E4B0181D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE1481896237
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76C227C879;
	Fri, 11 Jul 2025 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="frXUmO7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543FF27A477
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226626; cv=none; b=ONL51397DVUQGTLxSGBGjBY/yljH86blWDHhSIW5r0k6k+xtoXSow9NxOIVCLQQPZsjuohs5YJ/YiZOGUab9HHLkFMJVofR8lDSloqB0E+MdR3uk53lw1dHbH7P4wnTvpgSb3+EKaeDTin8VWmGO5/OPO5xvJOGN5tVPbpN/7Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226626; c=relaxed/simple;
	bh=9suKWsS0rHymfk9TQGmbQKs5zALFUrp1fPpFra/s9UI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlZAEUWehKWCaut7iUnyc/w2jBudIem6rOjPhcGkdsWTG0xMR1Vf4sdwGFP8JizVfynpD4N5oGWiDJPz2bgYA1neS0kEaZIhjJtfbipGhi4+J7OPaQtnVp00P9SBZe70oEeClK0HUFQGMQ4SLNGQLgfj4F2itDi4yPdb7WcZ0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=frXUmO7+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752226623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xA0OBovI0qiiKgM2RE7S4aciFKin8qkBM8MTFs6V5aA=;
	b=frXUmO7++R7pCUagMSAPdeh/LaQCQ7bMZkH9mv5x8BscF4aB4sqjzB1dfGialk4BT+iExU
	baQsE2y3vd1xxXcD59SYGrXJ0yLRsvLZSjjlFSromWgtbhibi3+1BDKFs9w9VuJ/S2LMMA
	5mBJcmUj+iJ4VfiizIPLQdejbMNkN6c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-3Z6EfNrjPJKhDfLTTR2GwQ-1; Fri, 11 Jul 2025 05:37:01 -0400
X-MC-Unique: 3Z6EfNrjPJKhDfLTTR2GwQ-1
X-Mimecast-MFC-AGG-ID: 3Z6EfNrjPJKhDfLTTR2GwQ_1752226621
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-453a5d50b81so14013455e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 02:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226620; x=1752831420;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xA0OBovI0qiiKgM2RE7S4aciFKin8qkBM8MTFs6V5aA=;
        b=Kcn9P3jZVwvDI5nEsS7nmLIj+ZZydgUGVnl9EVWwOr3FZ6lm34qrOeaOVjv9DWJgrm
         z9Dm74NdfUAt04fMWXlpaCQz6zglfaV609xenGP9/avYaYZmsB2x5dhYJypZnv5jsJ9x
         6h09yfG5OC3UGm7Y13Z8tEkgb5Nse2bENfeQYk5iljLghNGWIFN3bma6wd/zk3xb6dZy
         ORGo34vftHx89cxkyzz0wA1NbI6UQpVsnVxY+7hfX0bu+7kNrlSmlKMkJEjQf6CBTGyR
         vbTdvoR0mPBOHyRMriQIwPtpiEbslQhmciJrH/xoItM1kln2pPNRQm/6RSMyDN/4ZAvy
         SAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfO8dBMd6gz/Boabjy+fnv8qu8ZIACnq/VrlEuB2zvrW9pN7UaumGwB0VbxJ37BOn3czrysBZ+sFNcFfPV@vger.kernel.org
X-Gm-Message-State: AOJu0YxP2l0jmOTDCSObV7nSgVsTikKlH95WmOuvknVgEjSkh8aiR5UR
	eFtZy3lZmLUOUWwO/m+UB018O/40N4W9wnXv2WMCFSnZdaw3yiteiiMwTUBXM4lmiaRT0dp4mQg
	dZYCdYgLdDlsMpc75LXDYlfcBxKRebb1CXzFeQ5m/MMy1zB4gXF4Eihz6u6UxQbfbwQ0=
X-Gm-Gg: ASbGncvdMdgL3mL55PpuelIWvsIz0vlKxbm1AfyZlnx9IfnFULNxEfzTjqor12QLZit
	U2TP3KthMqntzIW91TRvscOp82U5+8JLgUXtVUJxeAZrFmCAL7RCnz5vKB5nz7YpMCulIfDgho8
	BHOizMHYsgfcAa1FoXuV8suJjL6glMJnQ6fBpNafRlsSt7iAooJ7xf/C+UXYVfZFpwDEZ7Aqcg7
	qdPKiJ12bOy2I9vX56dbVM1h/u/oZAFQRlOipRI1XVsCBrjKsqGYcKEMdhKzs9GYzK77So/sZ2y
	ZJm5c4wGf0gn1cS+PY3QvWXTk5Mw30dDZeAKhYa8KfWTRfhlthAcQPfYDXyxCcu1OnfJVRT8rj9
	Ge6SoYJk6Xi1dkADWr73u/0XTOjqHkMG2a8zTaYV10JcYaQ/iAkeuUJ7IyxEa3cZC/Ts=
X-Received: by 2002:a05:6000:4025:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3b5f2e1b641mr1754272f8f.36.1752226620412;
        Fri, 11 Jul 2025 02:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+hICpGbhlJGiLJG3KWJjiX9CPM0fHoBscZr6YOelTdPL05gMC9v1YCtA5hYWnCGxZHpNopg==
X-Received: by 2002:a05:6000:4025:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3b5f2e1b641mr1754206f8f.36.1752226619794;
        Fri, 11 Jul 2025 02:36:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd18ffsm3915762f8f.9.2025.07.11.02.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 02:36:59 -0700 (PDT)
Message-ID: <455fc70a-23e4-4c01-b502-37834473d195@redhat.com>
Date: Fri, 11 Jul 2025 11:36:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 10/20] KVM: x86/mmu: Generalize
 private_max_mapping_level x86 op to max_mapping_level
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
 michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com,
 isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com,
 suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com,
 quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com,
 quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com,
 james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev,
 maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com,
 roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com,
 rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
 jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com,
 ira.weiny@intel.com
References: <20250709105946.4009897-1-tabba@google.com>
 <20250709105946.4009897-11-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250709105946.4009897-11-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.07.25 12:59, Fuad Tabba wrote:
> From: Ackerley Tng <ackerleytng@google.com>
> 
> Generalize the private_max_mapping_level x86 operation to
> max_mapping_level.
> 
> The private_max_mapping_level operation allows platform-specific code to
> limit mapping levels (e.g., forcing 4K pages for certain memory types).
> While it was previously used exclusively for private memory, guest_memfd
> can now back both private and non-private memory. Platforms may have
> specific mapping level restrictions that apply to guest_memfd memory
> regardless of its privacy attribute. Therefore, generalize this
> operation.
> 
> Rename the operation: Removes the "private" prefix to reflect its
> broader applicability to any guest_memfd-backed memory.
> 
> Pass kvm_page_fault information: The operation is updated to receive a
> struct kvm_page_fault object instead of just the pfn. This provides
> platform-specific implementations (e.g., for TDX or SEV) with additional
> context about the fault, such as whether it is private or shared,
> allowing them to apply different mapping level rules as needed.
> 
> Enforce "private-only" behavior (for now): Since the current consumers
> of this hook (TDX and SEV) still primarily use it to enforce private
> memory constraints, platform-specific implementations are made to return
> 0 for non-private pages. A return value of 0 signals to callers that
> platform-specific input should be ignored for that particular fault,
> indicating no specific platform-imposed mapping level limits for
> non-private pages. This allows the core MMU to continue determining the
> mapping level based on generic rules for such cases.
> 
> Suggested-by: Sean Christoperson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


