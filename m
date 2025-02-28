Return-Path: <linux-arm-msm+bounces-49871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359FCA49EAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 17:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ABEB3BBD76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 16:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC635274267;
	Fri, 28 Feb 2025 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z4Tyj+lP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0274017A2E8
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 16:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740759846; cv=none; b=GmQh74zwdeEP/vh6jdU11Hk87Nr9Ln0AQBfIuqUBCWiiX5wI72wSEHUYQupLF+GfYarfNgmDh9YH4NBJLTAaIBSigSw83+Hbz5gUoIkJ+wzKKuWkWluMxeOZfjiwcNjAyP1gw59C8C9UzefEjjYPbumUO8Vtm498HxehP8Uo7tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740759846; c=relaxed/simple;
	bh=DIdk9cvonh0cWhcywg/PEu7UTE2tXfjWkb0MBkIpE2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxaxBCcxLs5E8EzMSdEAfHJNcE30+5Tz0qjmGd/JjHWBOuvtIlndGj9nme3NJraR6cewZSf2FMLA7bIEZ/mIIxmW7lijrbUWR8Z0HsJBVvqNl0YUZvtaIpkt+BRyJPbnB073qSPT6NE5XaUrg0rSG1oO6EWFWtWUWfZ3G8bbuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z4Tyj+lP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740759844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uYI0vlZyC64AS4GVxFaAT8W4ll0MhAyDbelrl5Y3Uek=;
	b=Z4Tyj+lPRp7xblEccEXyJBY3S0vHmnEfKLGaLzeoGPA8DMjTecSBIhduhTiZ/s7VSTgtHu
	/fSf1AiCXkffeF3tt9k1BWiH4YNlDZFOmbibJHvPY7jklSEJt6WYQHs4jFMPw2Zjlxbiza
	w/BlhvnDUGjIn3bKIoEfCv6JqgG+JQ0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-AqUefWFeOZqlVdsCEJIPyA-1; Fri, 28 Feb 2025 11:24:02 -0500
X-MC-Unique: AqUefWFeOZqlVdsCEJIPyA-1
X-Mimecast-MFC-AGG-ID: AqUefWFeOZqlVdsCEJIPyA_1740759842
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c09f91e480so394568085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 08:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740759842; x=1741364642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYI0vlZyC64AS4GVxFaAT8W4ll0MhAyDbelrl5Y3Uek=;
        b=dfmJQPbO1nMH3EDAzVtkmVeu79b9EFmiHy87GDvMyRqng5hDCie9dtl5z3wTtmWGOp
         uYnKuuZwGQA1QBKAlb1D/BVZBDvj0Ht/4WvL68o2X5VX2v/bpE6ZA2zzOL2DRn3eYL0t
         2n8s8Ij7lR7cKzhXQS8rQixtXI3QVK/ko4oBAxSZ+HIPwDClH+Xa7iaMlpUGrz97Bnf8
         ly861W4Fy24djWTwlOP+9j37e2Fj/6rAlSz4+yDMatf2sjiGd29W0fHIVSwLAeCJGnTM
         mAkDDyJ5xwcyTQGdrZ2cx6Ia1nwOMT1Fegamt3IHTdkFoDX0fLyIhyWDKffIojCH+GCr
         2aVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSRxzmqxREV11h8nTaN0lYIemJmWMADVvbvfwv8rOmsSaEYHPXrnC8gCB6C2MCDmG4ebKhfs6fGhSyOh/j@vger.kernel.org
X-Gm-Message-State: AOJu0YweFhFD1Fz1w7Z8OuaOw3j68ZXbYm2wlimzwxYV/398LubfegqK
	G22fiN/bEzPPViLg3zTwO4MBv2L/5QhKims9QKdhJniyE00io5vqYE7cB6Fhtw35RABIPu8iPMk
	Mw43AAJnZ7fZJOhKGmyghayTr+jYeE5rLwb56oqTpRwNiIULp1YX4hGEBXBaYb54=
X-Gm-Gg: ASbGncuh7jvH7lQn3c97TBuCExDIiR/BI50AD3ZhD7lVbAQUdyb5B5AtJsFohlEpvaY
	tCcizqdyFqeVzUbnsdCr9ZXFpKgGQfLzBzP9QgjaZhzBRHMLlKvYrt/VdUA27ZEuYSOfI+AWSra
	hL2xx30zdCMBqwojW7GJth3Iq7EtRUF3AXy7c2b+NOhdrrn0oTNWW9w+bnp9A6WlWIq1ZK/dvx3
	lYbQLttRCv2Vnb8TNlJZCmzzwJQloRtZqVk+odtW3h5N3WZOsanlsMIaxerYqXqvhRMMK+UU9eM
	KdOTE8M=
X-Received: by 2002:a05:620a:4608:b0:7c0:c13f:4185 with SMTP id af79cd13be357-7c39c49da23mr583605685a.7.1740759842046;
        Fri, 28 Feb 2025 08:24:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExnELW4Wgs0tRW9CQ35XcwJhUH+A1yMpSXnIV/5wwwvQCQtoXyGWAYFfR96/rPAP9Kfr+Sjw==
X-Received: by 2002:a05:620a:4608:b0:7c0:c13f:4185 with SMTP id af79cd13be357-7c39c49da23mr583599685a.7.1740759841731;
        Fri, 28 Feb 2025 08:24:01 -0800 (PST)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c36fee963esm265695385a.23.2025.02.28.08.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 08:24:00 -0800 (PST)
Date: Fri, 28 Feb 2025 11:23:55 -0500
From: Peter Xu <peterx@redhat.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
	xiaoyao.li@intel.com, yilun.xu@intel.com,
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com,
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net,
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com,
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com,
	wei.w.wang@intel.com, liam.merwick@oracle.com,
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com,
	quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com,
	quic_pheragu@quicinc.com, catalin.marinas@arm.com,
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev,
	maz@kernel.org, will@kernel.org, qperret@google.com,
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org,
	hch@infradead.org, jgg@nvidia.com, rientjes@google.com,
	jhubbard@nvidia.com, fvdl@google.com, hughd@google.com,
	jthoughton@google.com
Subject: Re: [PATCH v4 04/10] KVM: guest_memfd: Add KVM capability to check
 if guest_memfd is shared
Message-ID: <Z8HjG9WlE3Djouko@x1.local>
References: <20250218172500.807733-1-tabba@google.com>
 <20250218172500.807733-5-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250218172500.807733-5-tabba@google.com>

On Tue, Feb 18, 2025 at 05:24:54PM +0000, Fuad Tabba wrote:
> Add the KVM capability KVM_CAP_GMEM_SHARED_MEM, which indicates
> that the VM supports shared memory in guest_memfd, or that the
> host can create VMs that support shared memory. Supporting shared
> memory implies that memory can be mapped when shared with the
> host.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  include/uapi/linux/kvm.h | 1 +
>  virt/kvm/kvm_main.c      | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 45e6d8fca9b9..117937a895da 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -929,6 +929,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_PRE_FAULT_MEMORY 236
>  #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
>  #define KVM_CAP_X86_GUEST_MODE 238
> +#define KVM_CAP_GMEM_SHARED_MEM 239

I think SHARED_MEM is ok.  Said that, to me the use case in this series is
more about "in-place" rather than "shared".

In comparison, what I'm recently looking at is a "more" shared mode of
guest-memfd where it works almost like memfd.  So all pages will be shared
there.

That helps me e.g. for the N:1 kvm binding issue I mentioned in another
email (in one of my relies in previous version), in which case I want to
enable gmemfd folios to be mapped more than once in a process.

That'll work there as long as it's fully shared, because all things can be
registered in the old VA way, then there's no need to have N:1 restriction.
IOW, gmemfd will still rely on mmu notifier for tearing downs, and the
gmem->bindings will always be empty.

So if this one would be called "in-place", then I'll have my use case as
"shared".

I don't want to add any burden to your series, I think I can still make
that one "shared-full"..  So it's more of a pure comment just in case you
also think "in-place" suites more, or any name you think can identify
"in-place conversions" use case and "complete sharable" use cases.

Please also feel free to copy me for newer posts.  I'd be more than happy
to know when gmemfd will have a basic fault() function.

Thanks,

-- 
Peter Xu


