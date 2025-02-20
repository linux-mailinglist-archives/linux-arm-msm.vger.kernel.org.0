Return-Path: <linux-arm-msm+bounces-48674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 897CCA3D8CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 12:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82B773BE7E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF8E1EC016;
	Thu, 20 Feb 2025 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fAZdZSgI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27671EBFE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740051147; cv=none; b=HOmM3g7A/f5xBSFh2irz70mUw7ZJqhctL3iO7cWaPk8Kfx6C6aMASybvoyi/CQQOoFgeayV7VXTaC4dScpinGmozeFTOFkthMtZV0rJ/mBfrWpzaziLdw0eK6FVpe6fs6tKUbTsjdKkAbpbLQv/4y4UIC9xQqTqzRW+c/pflq+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740051147; c=relaxed/simple;
	bh=pZ4bpSKEcwgSUFmHA2jLKYfeqeem7hzqJvyeEI0zvZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BABR9oH77emNAOh7rjJ775P7p44tNiKqY6awyJwl2IUIklJitXG0CdDwYYLL5ijypipFOZ/1y/QDfFFglutLJmNFSIEew+bHCkMfrm6ibbnXxzq66ViIEQNy7mNbVmCuXKJIHbEpYAXiP/AlxFVWAMWCC1LGGy8iD38DuEPR+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fAZdZSgI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740051144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8mRY+So1WivUpFbib9B31uZ25A0wN1i6jJh5GjV5nEA=;
	b=fAZdZSgIwceKXB09btM24Dql1YY4trW89+dEaxYSlSxYnQ6sZ1ih+03LGhTXjAxyDFmvVW
	/ujnoNVcMcNGUO2g/H9LYYuuoSyVaC4TIBPl022XPhPuwRMctWJ6fcxdtZb7CpmEVFJqCi
	VySck+hudZkVvgiA+LmpgYhyHDLfMyI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-X6xfswZJMmqKFghiwg6eEQ-1; Thu, 20 Feb 2025 06:32:21 -0500
X-MC-Unique: X6xfswZJMmqKFghiwg6eEQ-1
X-Mimecast-MFC-AGG-ID: X6xfswZJMmqKFghiwg6eEQ_1740051140
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38f2f78aee1so382971f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 03:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740051140; x=1740655940;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8mRY+So1WivUpFbib9B31uZ25A0wN1i6jJh5GjV5nEA=;
        b=xBz2hnzbS12DyJ4SCjkSSPAizXFBy33gBaEOXVu1kMplw4j/XBHBuLIG5iqgfCx48R
         UDLEimU8nb0oGSGixdxIk5ci5FO+zMocE5+MxbXJzqS30JumXeqeT+u5LlQBomfNCdKB
         9gn7MbXZK0726poZwM8g3gRAOMHm/zeR51Tcfqzr4ecXzm+qphuvMXXJteMrGM2Vyx7Y
         oB7nuo393r+CWxRxOpCQoh5hhtXf2BVvhxWAtUiho8PHZOdOgGGn5USMMlb5ghPtTO9s
         iRxdFDpbws1qR4FOM+WZ6+9CcoJ9lDV8fla6OCxuokp5gGI+Wx+L/wCZvcDFyKh3yY4z
         RvIw==
X-Forwarded-Encrypted: i=1; AJvYcCWH1pTt3micrWphcYADT/Ac8xHUaJXyvGCmncIRofXgwJtbhmwFcD4C3cBFGrL8WRsVvelwdrrFfuAyrpkK@vger.kernel.org
X-Gm-Message-State: AOJu0YyStMBZg4GXbxxa2AePgaaN8fxKyagjK80tYV45F8LivT6GCawN
	J/ypwqSJSD57El46bJekZAzh7Hs9/TXn6IVQdvW+StFqI5dEbWWJZtYbY/TjRVEXtan2HGNSGga
	pNC3f7yrEk/RJVTvJwQ3HonAjKXuyy1nlJckncIQm3cOE2ZOz9VSbPw8g5k5NT5s=
X-Gm-Gg: ASbGnctRkLmlyJUH0Z/IkAz5jgmzh5OjaImjiXMe0V1GwQDRdcmrJh5mCVdzCnySBuv
	mtbSOrgRDOuZd4YMlpezBU1weY6sAociboNj7CP/RVX1nVceSiTB9eeo0R4sX6yC9c4H/wyyitM
	T/IX+WvhF3zZu+EByYUea836AHiaACEBm4bRW223dHZY5SeAWuOQQHwIni7Cc9vS31AuiRHcl20
	DljcY3ttMfoz+iCtVBZ7O4rIJ8RhsQ2Nn2CN4kfglcpWiB0QVVCImaoFPYruvWjJ706f2w28BAk
	Q462bpnui59COV3XqiwHYXRs9NMCT1SMbVoxr5X8Nsu2XNKtMeyqdBKQPDcpihaLUvlRlbqZXcZ
	rV7L020o2QCoXgU7Kiv02a1dwI61lNw==
X-Received: by 2002:a5d:42c7:0:b0:38d:ae4e:2267 with SMTP id ffacd0b85a97d-38f615b890cmr2127883f8f.11.1740051140404;
        Thu, 20 Feb 2025 03:32:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOguLsURugLcUQPNyBziBSpfOAZiEb1o2YCCXBm2R48OoTq5r3QtDqKrDP7mjqjzclTzg1Lw==
X-Received: by 2002:a5d:42c7:0:b0:38d:ae4e:2267 with SMTP id ffacd0b85a97d-38f615b890cmr2127862f8f.11.1740051139991;
        Thu, 20 Feb 2025 03:32:19 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:2000:e44c:bc46:d8d3:be5? (p200300cbc7062000e44cbc46d8d30be5.dip0.t-ipconnect.de. [2003:cb:c706:2000:e44c:bc46:d8d3:be5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm20619360f8f.68.2025.02.20.03.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 03:32:18 -0800 (PST)
Message-ID: <6dbe4547-2271-4db9-9cf6-2c497c45eff6@redhat.com>
Date: Thu, 20 Feb 2025 12:32:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] KVM: guest_memfd: Handle final folio_put() of
 guest_memfd pages
To: Vlastimil Babka <vbabka@suse.cz>, Fuad Tabba <tabba@google.com>,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
 jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
 yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net,
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
 jthoughton@google.com
References: <20250211121128.703390-1-tabba@google.com>
 <20250211121128.703390-3-tabba@google.com>
 <8ddab670-8416-47f2-a5a6-94fb3444f328@redhat.com>
 <5746ef9f-92da-4f83-bdf8-96169b090cff@suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5746ef9f-92da-4f83-bdf8-96169b090cff@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.02.25 12:28, Vlastimil Babka wrote:
> On 2/20/25 12:25, David Hildenbrand wrote:
>> On 11.02.25 13:11, Fuad Tabba wrote:
>>> Before transitioning a guest_memfd folio to unshared, thereby
>>> disallowing access by the host and allowing the hypervisor to
>>> transition its view of the guest page as private, we need to be
>>> sure that the host doesn't have any references to the folio.
>>>
>>> This patch introduces a new type for guest_memfd folios, which
>>> isn't activated in this series but is here as a placeholder and
>>> to facilitate the code in the next patch. This will be used in
>>> the future to register a callback that informs the guest_memfd
>>> subsystem when the last reference is dropped, therefore knowing
>>> that the host doesn't have any remaining references.
>>>
>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>> ---
>>
>> [...]
>>
>>>    static const char *page_type_name(unsigned int page_type)
>>> diff --git a/mm/swap.c b/mm/swap.c
>>> index 47bc1bb919cc..241880a46358 100644
>>> --- a/mm/swap.c
>>> +++ b/mm/swap.c
>>> @@ -38,6 +38,10 @@
>>>    #include <linux/local_lock.h>
>>>    #include <linux/buffer_head.h>
>>>    
>>> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
>>> +#include <linux/kvm_host.h>
>>> +#endif
>>> +
>>>    #include "internal.h"
>>>    
>>>    #define CREATE_TRACE_POINTS
>>> @@ -101,6 +105,11 @@ static void free_typed_folio(struct folio *folio)
>>>    	case PGTY_hugetlb:
>>>    		free_huge_folio(folio);
>>>    		return;
>>> +#endif
>>> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
>>> +	case PGTY_guestmem:
>>> +		kvm_gmem_handle_folio_put(folio);
>>> +		return;
>>
>> Hm, if KVM is built as a module, will that work? Or would we need the
> 
> Good catch, I guess not?
> 
>> core-mm guest_memfd shim that would always be compiled into the core and
>> decouple KVM from guest_memfd ("library")?
> 
> That could also help avoid exporting the mpol symbols in the NUMA mempolicy
> series?

Yes [1]! :)

[1] 
https://lore.kernel.org/linux-mm/9392618e-32de-4a86-9e1e-bcfeefe39181@redhat.com/

-- 
Cheers,

David / dhildenb


