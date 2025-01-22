Return-Path: <linux-arm-msm+bounces-45837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 594D3A1955B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F52018835C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859B62144B7;
	Wed, 22 Jan 2025 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cwBGNT11"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4F8214222
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560157; cv=none; b=GdgAu1J7Kk3eCqQdi3U5la01oUNoivgdHqBAxdRozRXaHqT+vNMJtb1h3c7wGiPW0hhnF/A+OArGX4/C0mLMHudFh63O2lO0R2ajHmND7iobg4N4Se7DS2dLo42AmjDifl9o52Hqr1ee275lI3SUcvTQN32Fc+STEB2J9CtBvak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560157; c=relaxed/simple;
	bh=Ip4NH+fhuRokBmenNFbP2yTN6gVeJlXM0m6WIrGcySQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdoUamTBB8VnVk+GNBjzgXIAJaz8IQvFrE9kOrowYRbC0niy9gjo7OgYri/ANWPmRWDujARVSYg+Ue9u8iDwUnwIn5mmW63oJSDclZaQBvtNmR6klz6DUHKlI1r+BNpeTK8wPhqEWtWQbiLG+r5T2yoaJALiyM5Bi4JPofHswyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cwBGNT11; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737560155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q38EjAxJ1lDLlHHWV9Wt2ZVxFDpzVDPBJs/duV0zwkY=;
	b=cwBGNT11lfBeRzBhe6PVonRHiaYxqPBqaHM0+kFIRhAeBnumD7B+vZR3IgfDm5QPiU56wR
	jQmJ8hYK7eHzUKY1TqGFxkzFRrMl8fcPIaFHRXe+TUrzR/73CLcf9PN6I0DPxNk/8zn8q/
	KF/1CB2zhaMn8AFJuiQrffKxGVTdpRA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-Ry1N-ftuODShXbz3L88B7Q-1; Wed, 22 Jan 2025 10:35:52 -0500
X-MC-Unique: Ry1N-ftuODShXbz3L88B7Q-1
X-Mimecast-MFC-AGG-ID: Ry1N-ftuODShXbz3L88B7Q
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so55676085e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 07:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737560151; x=1738164951;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q38EjAxJ1lDLlHHWV9Wt2ZVxFDpzVDPBJs/duV0zwkY=;
        b=nzqVOtlfzVprVzgTR1wOhjZbftk+d68ozlQvBPpvpD4CA4arE9FpZ1NxEN0U6dcuv9
         8uAfe5WF4WtzMBSROK+nYjHr80UUc54L4WT7Gg91CwW7kH8mFbrrWoSPpcL4vqvfnpr7
         Lw4TAQ+85OCfJsm7kaZ7htLAsB1seNQEHjuOqDZJFU/dfSwp3id8SqPLKTWe48EvLvMn
         rLpXTn6ZOxuX/ekCSPW3QtOkOx7GV21Q3zptAD650NCI+R7TvUabHpgUqGv2hOeGtPYV
         XqriQMWcVu7NxMG4tr63adAqE4ZeR9qbWJQdyB4tskSJWyX4ecfxOs4Tlti2WVtDD/Zn
         YNTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9G/w95J/H9mW4wnK4grktk6hEA2yY9lutD0ANRT8b37BWmERu/pLfObGUkysdgFIuO1BaGluJYfHX3OVQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6V2m8OAAEo5v24Do/vnkxBNhOeHA015oRTFzkuLtKbMRHbzCS
	muC7LUnNxZZFb8P0Y7tWson65Ji7+l4iexjI+H8f0uIVMMFsOaf9A1KNU3RXThVVZmL0bB1pcLg
	GgW1Kffk+jG664jE4povYDpgiqdqfWbU7MJ4w84O9j/mf15tZCb4zzn1P5X7NZhU=
X-Gm-Gg: ASbGnct/Ulf4T5HEHg9pZkUoKhVt2SzS7UnQ05zO1euT+ZKiPhZMnTYzN0867EbLjJQ
	QgrtBmnkP0KT4DgkJj3mhdTT8jd0zuoaUit7ZY0MV9/PrT/Su1kdS77LngN8vWRdtadHBnqINvM
	vH6+PHw966QCFT+MBOLQXTEj5sMBVCrphRlMwalyziPx+VWESJRAdBfFFmTa68mLjvf2MZD9JgW
	yW1cLtPcT632oTuFrFXsBhWOoCxDIqwxbjSGcKCVRrVlMJjJBNB7gwvmFmGb5nZmpD9LG0I3wSU
	m1dclLvOaEqf6Ks9dyzeC45HkiCuwWPVSzFO7z38H7t4M2JQ6rbYZi+bY2VAgHtGtChVFHHUNAr
	MmPZM2vZr59USf2Cv8AOUBw==
X-Received: by 2002:a05:600c:3d96:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-4389143b5dbmr192205085e9.24.1737560151612;
        Wed, 22 Jan 2025 07:35:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmQa/wKYEFJo1rFWtlQvMZdVHgrCX1WxhMRt4UkLW8LHiu9pFpZn5xxu1YGH2sHPbzaS+8Kg==
X-Received: by 2002:a05:600c:3d96:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-4389143b5dbmr192204875e9.24.1737560151242;
        Wed, 22 Jan 2025 07:35:51 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:db00:724d:8b0c:110e:3713? (p200300cbc70bdb00724d8b0c110e3713.dip0.t-ipconnect.de. [2003:cb:c70b:db00:724d:8b0c:110e:3713])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31df407sm29654035e9.37.2025.01.22.07.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 07:35:49 -0800 (PST)
Message-ID: <c15c84f2-bf19-4a62-91b8-03eefd0c1c89@redhat.com>
Date: Wed, 22 Jan 2025 16:35:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/9] KVM: Mapping of guest_memfd at the host and a
 software protected VM type
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250122152738.1173160-1-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.01.25 16:27, Fuad Tabba wrote:
> The purpose of this series is to serve as a potential base for
> restricted mmap() support for guest_memfd [1]. It would allow
> experimentation with what that support would be like, in the safe
> environment of a new VM type used for testing.
> 
> This series adds a new VM type for arm64,
> KVM_VM_TYPE_ARM_SW_PROTECTED, analogous to the x86
> KVM_X86_SW_PROTECTED_VM. This type is to serve as a development
> and testing vehicle for Confidential (CoCo) VMs.
> 
> Similar to the x86 type, this is currently only for development
> and testing. It's not meant to be used for "real" VMs, and
> especially not in production. The behavior and effective ABI for
> software-protected VMs is unstable.
> 
> This series enables mmap() support for guest_memfd specifically
> for the new software-protected VM type, only when explicitly
> enabled in the config.

Hi!

IIUC, in this series, there is no "private" vs "shared" distinction, 
right? So all pages are mappable, and "conversion" does not exist?

-- 
Cheers,

David / dhildenb


