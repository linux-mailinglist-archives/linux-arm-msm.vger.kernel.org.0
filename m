Return-Path: <linux-arm-msm+bounces-45960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E4A1A37E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BE3D16E693
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DE420F095;
	Thu, 23 Jan 2025 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JDxF0r1E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327C520F08F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632581; cv=none; b=C2K71T1OE1G9Fi5dfC5MnthBWM39/rzY614/7UaETD87DSiYyihIXgxJotS2ST5udrCfckCGUX1s4mZn3pMX2TyrXebdJXB/ViGw53YTpI4ivnTJ2Y7RKeDs68yTuVNoWPZ27cPtD5+cnaUVUw8EGMGRhNEo7XF8AGAYJ7gkZgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632581; c=relaxed/simple;
	bh=5u/llC1flgSONOBU7hNXVx1Y0FRKypMF7wPudazKlr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaZnxwQNFfS1si0IXgiA4/QQNZABzE8YXm/Fr7WhK41ilRhgSRZkYFudrmU5CUnoEtQMzw+L4Hg9+qTgNGvRh6ToGQRuFqzoHGXIRwMIu1kRC6ZTwUlmgNqk1/MQrVReaQLH1bPRx4LUYvlrxODuX0kiuGQ2qTUZfCjmWxXWte0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JDxF0r1E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737632579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TVX3CIkG2/VCAiZdJGvwfY2rLb0MgfxmSCmmUyR3aRI=;
	b=JDxF0r1EvLmhliR5VUUz55ORyVg9EGNkGlQtutuLhX9u1sLKNwOsW+PuiJpCskKBTMjlTc
	tyFOnhUwlZsJGgwBo6dJJE/ER3Dpsf8gc4LKRDQ6WgfWdOVNVWlXrAzXu4RzsK5GwJSwiw
	9DjBxbUa1ZdZr4Y98P9Sl/t+ZKES4wA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-vWPyTfFoOhCNsMR1jaZbmw-1; Thu, 23 Jan 2025 06:42:57 -0500
X-MC-Unique: vWPyTfFoOhCNsMR1jaZbmw-1
X-Mimecast-MFC-AGG-ID: vWPyTfFoOhCNsMR1jaZbmw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38a873178f2so443810f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632576; x=1738237376;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TVX3CIkG2/VCAiZdJGvwfY2rLb0MgfxmSCmmUyR3aRI=;
        b=qFDwoxXSxm+5d3PIfIGBL0pt4D7IPGhnDWX2FE0+4fQfNepHJPTPMWvKl/PWHTMKvz
         19q5bmAcghoqa62r4Z5RQosQ6jeKSCiC62dn7VkUqdeaDgUEqkCiSpBscYRDqEH2gQxe
         ZGtt+b9EK0iKd8AtbR2fgGmnz7lGj+mCAEBlXFyu09g/X6+9FpuqXAL1HZYNzc9BLJvU
         j4RCFqB/KIIYVg4QSow8F8H2ivNchzSQ/a1xrTN+AMTwc2A84C7HezDl3nwrG5gMEblP
         2AcNUh9uRyU68M6NmUIxhlBS0XKlOa3nAXwtvLQX3CXJN9PnJuU6l/BbyT00jr7A7qZP
         9M7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvFLQUvD+SY2HO68gQ05EgluajrQvRCIH7hESvj3MNUEYFiA20vLcJAbPJGXli3m7i+n2FlQXLjZxRZlIH@vger.kernel.org
X-Gm-Message-State: AOJu0YyzAJU/HHzq7kvAdBvnJLKi7/8hj9MZSTEjUNiQsO+LDTEMfqPj
	QpcEx3rRHSPhgBErbg3Ni/vu2hFB3UweYSQtmToALGr1HSQr6nzsNjbejsM2ZuxetCrDEt18E1I
	5QvX8JcQaSBN4yX6mUAgnA4oCZSIdDmwBjKSFWNqCmXCKI1fTibvQVZEwSTusAgA=
X-Gm-Gg: ASbGnctjEPUE0OLmbEGUwHFtTF4nkTaiR/OeIB2vE/Vw3Gqqd+XMqgQiqI0KZ7Dr0rd
	gA0WH/GI3+t9G9di4yEUXCI6v3thzHpJ9ZHSI0f+XohfpdNIrP6otMWGbtLNSOrIm1jUF/J2cRo
	SIF7LM4//3a3Zd3AXAe8nZaOvguzY0oRSEGjx6zbjfr7+f284i3hdZ3oaUNX4HfjAuwmBF3Jp9Q
	ZVb5WsSh4888p6rcMGt3nar0teWkDg/1w5sR4Rxefo5ncdr8kaAyV3eBAu1FMKdh5/8aFuTDa0o
	T3j3DCK8XFhMRd/OKyH/KlfupL32FyiQFsWd8Odv6uxg/avsUiCkz+jxpexG0gqLHYl06jgA6DR
	DtDAZg4HUrBjzwksoUOoCew==
X-Received: by 2002:adf:ee0a:0:b0:386:380d:2cac with SMTP id ffacd0b85a97d-38bf566c309mr18345978f8f.26.1737632576572;
        Thu, 23 Jan 2025 03:42:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnHoqmdm5qC8HFnk0B+t3lP6QBJmziONHN8ngxtcJgr1NNcGwtNx+KvhusoPLMP6lV5qmRng==
X-Received: by 2002:adf:ee0a:0:b0:386:380d:2cac with SMTP id ffacd0b85a97d-38bf566c309mr18345934f8f.26.1737632576123;
        Thu, 23 Jan 2025 03:42:56 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:b400:e20a:6d03:7ac8:f97d? (p200300cbc70bb400e20a6d037ac8f97d.dip0.t-ipconnect.de. [2003:cb:c70b:b400:e20a:6d03:7ac8:f97d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3288f79sm18899367f8f.100.2025.01.23.03.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 03:42:55 -0800 (PST)
Message-ID: <b3568243-5154-424b-9114-9c28588be588@redhat.com>
Date: Thu, 23 Jan 2025 12:42:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 3/9] KVM: guest_memfd: Add KVM capability to check
 if guest_memfd is host mappable
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
 <20250122152738.1173160-4-tabba@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250122152738.1173160-4-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.01.25 16:27, Fuad Tabba wrote:
> Add the KVM capability KVM_CAP_GUEST_MEMFD_MAPPABLE, which is
> true if mapping guest memory is supported by the host.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   include/uapi/linux/kvm.h | 1 +
>   virt/kvm/kvm_main.c      | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 502ea63b5d2e..021f8ef9979b 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -933,6 +933,7 @@ struct kvm_enable_cap {
>   #define KVM_CAP_PRE_FAULT_MEMORY 236
>   #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
>   #define KVM_CAP_X86_GUEST_MODE 238
> +#define KVM_CAP_GUEST_MEMFD_MAPPABLE 239

Maybe similarly consider calling this something like

KVM_CAP_GUEST_MEMFD_SHARED_MEM

No strong opinion on this one, though.

-- 
Cheers,

David / dhildenb


