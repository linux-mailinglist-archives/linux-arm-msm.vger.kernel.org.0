Return-Path: <linux-arm-msm+bounces-58842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD8DABECD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3851D3AB714
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 07:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC907233723;
	Wed, 21 May 2025 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bBeQ0j/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C36D1BD9F0
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811722; cv=none; b=KbZe2hvN6hWjEacg1PWDcSILrashK6DEz6VmtK3Qqqr7VbtJOPHcUj9VUuKaY7dEQLFTq79D/98tKJujxyR5jaFZM/R8xqQbid1cSJsv0Do2eGB5Bja4nQEFFNwRwyz+khgACEufsYCu2kE+LVkFvBwuhXZuOeSMuofQQn45QO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811722; c=relaxed/simple;
	bh=CI4plDpiCDtrKsdg9jeepk7h6LuxWkyYQFmwGb32Suw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EU2uHuS0lugwu19ttHY4/EzLSfV4klKm3X1ejr149iaXhOoPqfTYWKS0YvNc5YCedRJDJR4qsfKTeEr7lt+eAkxqeAGdh14neLz0TOfmbDPZemkRJQHXcZn+THKfmii1zcRXNYRd4FbJ9EHaMcI5Eq0v7HglyF3H1DoOZ9LK8OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bBeQ0j/9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747811720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5q6ocmA/Yo8PeHXW01hgQZApSzAdd9sURO4wp5Q+bk=;
	b=bBeQ0j/9KrzKP/LTbb2IIL39uS0zrNzIlPW5YQOQ4KS7sFVPK3lUtYln33DI9GLLPagqhI
	c5FYCiJBvwf2anUG68ZVu18iJYN7QoK5UAMMQut7DPOp/pEGzoOSsV0EQzB6RzZalieNWy
	xsu7F6OvF5gmeYJVrzPJKhc7kSN3OH0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-blYMCoEqP0qAX78xCpSbDA-1; Wed, 21 May 2025 03:15:17 -0400
X-MC-Unique: blYMCoEqP0qAX78xCpSbDA-1
X-Mimecast-MFC-AGG-ID: blYMCoEqP0qAX78xCpSbDA_1747811717
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30e5c14b49cso4381645a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 00:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811717; x=1748416517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5q6ocmA/Yo8PeHXW01hgQZApSzAdd9sURO4wp5Q+bk=;
        b=CieWv9ykg6OH76FKgncTTq9/ugW5b5LIaU8fC7E4qiatgBxdZ8XEountw9u1xuTokX
         E22eJwHfM/adtYrOgkf4WscdkiQP+8XGWSswBewo49LO9hKhiqmXaayglrXY4pF9Hcqg
         BDChPihEI4voVq42r/Wl1xmxujV+niGNWemTuynRjiluWiExmVeov/1XX+WPSfHj6Wyl
         J87fBLnpidLkoLDDsh3TJoxe1n/QgxoXLuYBpv3pxhlonIOh/FKRDtx0iEO4rBKtJDE6
         rSEI84FrOVVkH+f3cCmOWdYf5n7daXrIgXreQpHFYzFnppvSGvOmkhCWhRnMWkH6KJaz
         VzoA==
X-Forwarded-Encrypted: i=1; AJvYcCUEsYOLnkUAfWN9O/oo9trf5YQs7Z8hQQDE+0dPwfaRcSjnkdgoaxM4i/eYE4pz2vG3knZGPN7I3x60G+FA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz033+sjS8hskre97NIQcERJGmBMbchCzmEU+rRpumJOzVcrGRg
	NnK8xu+MyIZtDLDBuGci/QStatVK6Sv+Atv0nGPutvLaYd1SqsM3tKqXsRCPJX8tXckGoZsYwyf
	tTLaipU4MGNDmNyXWjc2zPmU2FjFS5al+/ht0RLqe85urxklX61E5IX+4LAariU59Wbo=
X-Gm-Gg: ASbGncve0POHLMktZcRGsS9dMfxWuyjF/X3pletFZuxLh7XBedI7u5aLamXFHIfsbX6
	8IqEfpvNEvr8GXvWuIKnFD6pWXPI+s1x7xwrgWoz5ovRsf4UDdRz9Z4uDUZTq/d+RmxkDtOroqZ
	0YCRBx8MkF3uU5jbKzeB1jLwHCY3P0NZ5f1WzjFGRlhVxYaO9rHEbjoB1OLhrcXfbCojTgHy+oW
	AcTvJ13MsP7RPdYJwd9/hAD6+MHUE8DOskxsIDFwhNgPAVzRbRwtpqQwJv222XqKi/SCrzDjaTA
	fSJgul8EEZfH
X-Received: by 2002:a17:90b:1dc3:b0:310:8d51:1b91 with SMTP id 98e67ed59e1d1-3108d511e75mr2779603a91.13.1747811716839;
        Wed, 21 May 2025 00:15:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPQrJOppusNT7n/288CieATOm+5TnQ3RIWX65pwlg6vifomDzzfOtpe8AY90CV4bx44PPlCg==
X-Received: by 2002:a17:90b:1dc3:b0:310:8d51:1b91 with SMTP id 98e67ed59e1d1-3108d511e75mr2779550a91.13.1747811716397;
        Wed, 21 May 2025 00:15:16 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365d45e2sm2946400a91.27.2025.05.21.00.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 00:15:15 -0700 (PDT)
Message-ID: <003ec2e8-b195-4b3a-9afb-0b0e823991d4@redhat.com>
Date: Wed, 21 May 2025 17:14:56 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/17] KVM: Rename CONFIG_KVM_GENERIC_PRIVATE_MEM to
 CONFIG_KVM_GENERIC_GMEM_POPULATE
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
 <20250513163438.3942405-3-tabba@google.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250513163438.3942405-3-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 2:34 AM, Fuad Tabba wrote:
> The option KVM_GENERIC_PRIVATE_MEM enables populating a GPA range with
> guest data. Rename it to KVM_GENERIC_GMEM_POPULATE to make its purpose
> clearer.
> 
> Co-developed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/x86/kvm/Kconfig     | 4 ++--
>   include/linux/kvm_host.h | 2 +-
>   virt/kvm/Kconfig         | 2 +-
>   virt/kvm/guest_memfd.c   | 2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


