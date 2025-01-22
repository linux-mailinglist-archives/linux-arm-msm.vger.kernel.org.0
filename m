Return-Path: <linux-arm-msm+bounces-45840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD23A1957F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD2173A4436
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996BB213E61;
	Wed, 22 Jan 2025 15:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X+QkDJlx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E738DC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560518; cv=none; b=A4vfwbmdtcOj8vWI/908wk7zXN14PF+M652fxPBNXo7fF0zhQyugQn+tTQ7AhW7CUkzgnzRnHEQ0QSD3eaEFXC+PABLwP64ZnJ+c6gcfRk+lMh2azOOiBV3wyLbn6CZ4u0TCzSNAb7h56unDJZ0IiGm9o8kbzHDGbqe3y8X/5Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560518; c=relaxed/simple;
	bh=PKC2POi1qhlwD4rqr2dlYIMLgUzX/fFU8BYlzBjUldM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uWmPUzt/omyjpZdLfmKPGCpbOJ6UHSqN/ei0iCcvIQL+rRs7taM1sfNI6nMbZgrNPVIhjw5vIwTVVkkUAOSErurm2V6jTNGcEseCtk0S3ehIkXVHm/XUdqOPsIfuMseGHOuml9p5rVZkqU+x2FidWWifVa1L1O5ApOWbadS3Cx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X+QkDJlx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737560516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3LPxMC28whlVawfhtdbW+UVOeFlWG5kdp8cWN9v2fOY=;
	b=X+QkDJlxr2JnRlDfEGKFkRjUsdcY+TkgETcf/kdBkIu2ARLwCjjFiZAORIW7BDaRCpd8Ul
	2Z+RSLsCoV3Ybu0UpuiVali4qpMmWIt7hQCptz44aF/Ok/MOML+zUyAbd00rHtPVO8vBWV
	C+cEs64VBpO3E7RVD1N7Q9gE0iJgtvM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-8KFqH3DLM4q7GMx7-jheCg-1; Wed, 22 Jan 2025 10:41:54 -0500
X-MC-Unique: 8KFqH3DLM4q7GMx7-jheCg-1
X-Mimecast-MFC-AGG-ID: 8KFqH3DLM4q7GMx7-jheCg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385dcae001fso3120888f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 07:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737560513; x=1738165313;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3LPxMC28whlVawfhtdbW+UVOeFlWG5kdp8cWN9v2fOY=;
        b=H5U3kPc/JcMEd6Y33Pp7OuieDZufEcqtO1Kb3moJqw6eb2RjvPDG7bA+fEW11oO3Zv
         CvzF+ocjkgD1kZ0XQyke0WtwM22I2Q3T/Gj7lBC0PiOb4k074VX7CAUUZ8esdK5WBmoR
         5euc7P1O/T2/ObfBjefOUE7VPBNe0O7XTY2b+0Y3WFqgjxsdjq5vHPZMkTLw09h3Hrih
         wRMLlVdXsn9AxQx7TSwjocsulvXiI21nFsTE9+bpuTHQMl2m6AT+XaJd4mB37KjVKFd8
         pChlOgiwMxMkBy0dv6RScZr9wEwuaxLG4uvRa4KPwz/RoVdVQ4rg7j+wK1HxE4jHGstV
         wLQA==
X-Forwarded-Encrypted: i=1; AJvYcCVF2T0FjNJZ6ygEB+tsxh5g6cso3J8A9D/nbcVgdjr7B69tN6wuBCXokTOjGaVkxIM0wSETsbmFVZ7QOYuU@vger.kernel.org
X-Gm-Message-State: AOJu0YyjaxZyZcw3r0CH8JIpe75pCGVu0g6x4LxH1wsHykrFqRAGYS3w
	4geUlrPclCCCht7UNOFbuJksbYpKYwYScCAUOYqZx7vUOoTGT9HDhOqEzWLzI4veG61KNTwD+Jq
	pXzBcJXi6THcsAqNafhMk43fvBMuCItDZrMi1/N4SEVjLMENG48eCO1KyscGQ6CE=
X-Gm-Gg: ASbGncvLtKyPdoDbk+Gtui7R9bWQXHLagBIMPK68+2owVYPeUFMtZg0ApmqXqfNF6Qx
	5sgK2ARWY10QcWqydKdltXts/mPFUOLQgokMPUtv5TsUG9DDj1n8PcPgFTQq1zkUgdlj6JEEmTe
	ErDg1T9duh/TMAXXdvX0uWhEs6Jsidbf2LoQaVb0yF6dOsRRm56KyFwc/uMLC/BrcUaM0gCyVhK
	XgOQ8dfFqivrRtOj1abAp8msYDz1IV5OCMSYgWdBmIperxNM2PwKvAFrXFLmnNrD3DE6wdaiFEf
	StBx5HOJpdDNI/BPqy4X4UNEJAlYqxiiDMthA7GylFllvHwd0f8egNh5pA1xPfmH9Z/1owyZT3O
	qvbJabtXe/nHFea/EgIwVog==
X-Received: by 2002:a05:600c:1e89:b0:434:a1d3:a30f with SMTP id 5b1f17b1804b1-438913bf921mr214939535e9.6.1737560513514;
        Wed, 22 Jan 2025 07:41:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH/9fMChqw+o00VgnMMfaLBpxWMNJ2VPijZY+Z7M4XjVw7qQ8l7+U7MnkQVGb7zyHBYboqiQ==
X-Received: by 2002:a05:600c:1e89:b0:434:a1d3:a30f with SMTP id 5b1f17b1804b1-438913bf921mr214938965e9.6.1737560513097;
        Wed, 22 Jan 2025 07:41:53 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:db00:724d:8b0c:110e:3713? (p200300cbc70bdb00724d8b0c110e3713.dip0.t-ipconnect.de. [2003:cb:c70b:db00:724d:8b0c:110e:3713])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31b1566sm28584345e9.24.2025.01.22.07.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 07:41:52 -0800 (PST)
Message-ID: <03bbcd00-bd5e-47de-8b20-31636e361f52@redhat.com>
Date: Wed, 22 Jan 2025 16:41:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/9] KVM: Mapping of guest_memfd at the host and a
 software protected VM type
From: David Hildenbrand <david@redhat.com>
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net,
 vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com,
 mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com,
 liam.merwick@oracle.com, isaku.yamahata@gmail.com,
 kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com,
 steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
 quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
 quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com,
 yuzenghui@huawei.com, oliver.upton@linux.dev, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
 shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
 jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com
References: <20250122152738.1173160-1-tabba@google.com>
 <c15c84f2-bf19-4a62-91b8-03eefd0c1c89@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c15c84f2-bf19-4a62-91b8-03eefd0c1c89@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.01.25 16:35, David Hildenbrand wrote:
> On 22.01.25 16:27, Fuad Tabba wrote:
>> The purpose of this series is to serve as a potential base for
>> restricted mmap() support for guest_memfd [1]. It would allow
>> experimentation with what that support would be like, in the safe
>> environment of a new VM type used for testing.
>>
>> This series adds a new VM type for arm64,
>> KVM_VM_TYPE_ARM_SW_PROTECTED, analogous to the x86
>> KVM_X86_SW_PROTECTED_VM. This type is to serve as a development
>> and testing vehicle for Confidential (CoCo) VMs.
>>
>> Similar to the x86 type, this is currently only for development
>> and testing. It's not meant to be used for "real" VMs, and
>> especially not in production. The behavior and effective ABI for
>> software-protected VMs is unstable.
>>
>> This series enables mmap() support for guest_memfd specifically
>> for the new software-protected VM type, only when explicitly
>> enabled in the config.
> 
> Hi!
> 
> IIUC, in this series, there is no "private" vs "shared" distinction,
> right? So all pages are mappable, and "conversion" does not exist?

Ah, I spot:

+#define kvm_arch_private_mem_inplace(kvm)		\
+	(IS_ENABLED(CONFIG_KVM_GMEM_MAPPABLE) &&	\
+	 ((kvm)->arch.vm_type & KVM_VM_TYPE_ARM_SW_PROTECTED))

Which makes me wonder, why don't we need the same way of making sure all 
references/mappings are gone (+ new page type) when doing the shared -> 
private conversion? Or is this somewhere in here where I didn't spot it yet?

-- 
Cheers,

David / dhildenb


