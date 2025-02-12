Return-Path: <linux-arm-msm+bounces-47821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D63BA3316C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 22:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED759166440
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 21:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F3B1FBC8D;
	Wed, 12 Feb 2025 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G9w3PeSe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD0202F8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 21:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739395448; cv=none; b=gxls8lJ6HNJ6cNp4fjG87N1tP42MRPSNKKSgsv0v51LKeRDk2FOLNGM7iSutz8cYRlPtUvDgddskZhS/DdFloi0S3L1rcRof59DL0FKrd7by9MyxsT+5J//jUeGX4fLu1ZRB8IDF+9OCl23LknJMua6v30/NknCB3wnjNt6rKzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739395448; c=relaxed/simple;
	bh=TT8QDCIDQGCMkNj7vFXoOL/LNDDnvNdI2Z4hRrVEWhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYkn2tju2TJQuuxcraeuxhSXaq7w9yUAFvTGIo10YbazKTw1OtjImE1bJOxfFbE8ouAGUUFtUW8NMPMVLZh+OvL7e8Nm8f3ky06bS0F5PWaiVSLbv3d+az+SUHKet8fIesOPvsdz2pRT86R4zXJNjF7jCjnm45gJRr6uwE4KwX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G9w3PeSe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739395445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rMR3xW0eowjAI1vyo1tpASMiTeQNf0mRWejyS2lahAE=;
	b=G9w3PeSe9t7Mow091HPKIcFonqZEtgd1MON6PKBWfTeEWMzPlAwWsCMj+ltLDgS245FtqJ
	mVEJsPebAG13nWCcStgSb587ZjJ1ShJ1zWOZXeYM+yMTAFJriilCGGcqAHAq6rYqYIi0VU
	mW1eSyNmFcPES18vlebgpJUQi2Ita44=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-3zf9QbqTNXupJU7zNk_kBA-1; Wed, 12 Feb 2025 16:24:01 -0500
X-MC-Unique: 3zf9QbqTNXupJU7zNk_kBA-1
X-Mimecast-MFC-AGG-ID: 3zf9QbqTNXupJU7zNk_kBA
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3f3afd33d15so172669b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 13:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739395440; x=1740000240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMR3xW0eowjAI1vyo1tpASMiTeQNf0mRWejyS2lahAE=;
        b=FjDTiqCYFhGUYQK5GCg/xpVPBhg1/bzNVvdbEFrYg24Pafocjf1jF0mo5xIBGaAhh3
         b28GnRQ/osxDOEMVnxxUEfSAsXx5rQjUNJVcvRTm53IKdtgBk7/cTW6GeNwhgn3Z+jsM
         7SP+RNPy33GQI3UnBBIsPdAsenFgXYrKxYwQaNeZbwSPSsRNKwyoQfbQ5gtrlDqqgto7
         9Jwunmco++ajDQsYT0z7q4lskXkcLwsbpRfno5dfUMI//oFB2B0TSMO8xDJMZIujbtes
         hNl1tL7MKqa07vRQVDszlonRVXviLq/cF7am9K9GiKCXB4cKeMw3tXpoinN4i2fHmDZg
         0L5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKwgGUAKZO7G5CsdH2OK5jBGF8qXeMdnmois0nNTOlVUdqp4ehB7bZSL7zwoVxjbHW/9jionuVg/K+suW2@vger.kernel.org
X-Gm-Message-State: AOJu0YwFL7lP0GAbquKyue1EpJE393hT/G6DgEiNSwFEnY/pZxYLZWFg
	0Tw7yWty3cgfPAUVmzqazQ5cNam0bn/rV8P59HggWIUCXwmc6f70HN7+u/ZKF/aAHnTIi3196bS
	DSUVBE/aoCN8BnE/yNCX5PhpJVMGIfKDGEvxlfesivSSHqlwFLu9MVySpqyA/d5k=
X-Gm-Gg: ASbGncvm94ylVxVYfuuRloEpyROzG4fv2z71d6jj9QhbsK5090Ezjvumu2NYFHTSK92
	Y8STVLTbo35tLDQ0l8+hzjavoxc3hmnAOS/2eyhpuvRYJsc89tQhd6bPC28MMRglZyEJ3jK+lLg
	gsIYDrhhHNBgaLwypTDakPWmBOMzRO+KPH40bQKg1p/jyB9NYqmVXO+XtADPhCcBrUog9F+ua9Z
	EOZYrXCCNclLvPhIfjfw8zacLn+Yw6usjBIVL9C8ZTrUtIsiMS3mY1oPMc=
X-Received: by 2002:a05:6808:2e9a:b0:3f3:beb0:f89c with SMTP id 5614622812f47-3f3cd5cd00cmr3215260b6e.12.1739395440673;
        Wed, 12 Feb 2025 13:24:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY2m3xIb+XCqqJUt5LWlRvkVKJprpgK78iqDdhGlaeRGKuKuddp8PHVk68yR2vDMJ2oP4DmQ==
X-Received: by 2002:a05:6808:2e9a:b0:3f3:beb0:f89c with SMTP id 5614622812f47-3f3cd5cd00cmr3215250b6e.12.1739395440341;
        Wed, 12 Feb 2025 13:24:00 -0800 (PST)
Received: from x1.local ([2604:7a40:2041:2b00::1000])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ea9194sm4723990b6e.10.2025.02.12.13.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 13:23:59 -0800 (PST)
Date: Wed, 12 Feb 2025 16:23:53 -0500
From: Peter Xu <peterx@redhat.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
	xiaoyao.li@intel.com, yilun.xu@intel.com,
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com,
	dmatlack@google.com, yu.c.zhang@linux.intel.com,
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz,
	vannapurve@google.com, ackerleytng@google.com,
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
Subject: Re: [PATCH v3 03/11] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
Message-ID: <Z60RacIJMwL0M8On@x1.local>
References: <20250211121128.703390-1-tabba@google.com>
 <20250211121128.703390-4-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250211121128.703390-4-tabba@google.com>

On Tue, Feb 11, 2025 at 12:11:19PM +0000, Fuad Tabba wrote:
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 54e959e7d68f..4e759e8020c5 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -124,3 +124,7 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
>  config HAVE_KVM_ARCH_GMEM_INVALIDATE
>         bool
>         depends on KVM_PRIVATE_MEM
> +
> +config KVM_GMEM_SHARED_MEM
> +       select KVM_PRIVATE_MEM
> +       bool

No strong opinion here, but this might not be straightforward enough for
any reader to know why a shared mem option will select a private mem..

I wonder would it be clearer if we could have a config for gmem alone, and
select that option no matter how gmem would be consumed.  Then the two
options above could select it.

I'm not sure whether there're too many guest-memfd stuff hard-coded to
PRIVATE_MEM, actually that's what I hit myself both in qemu & kvm when I
wanted to try guest-memfd on QEMU as purely shared (aka no conversions, no
duplicated backends, but in-place).  So pretty much a pure question to ask
here.

The other thing is, currently guest-memfd binding only allows 1:1 binding
to kvm memslots for a specific offset range of gmem, rather than being able
to be mapped in multiple memslots:

kvm_gmem_bind():
	if (!xa_empty(&gmem->bindings) &&
	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
		filemap_invalidate_unlock(inode->i_mapping);
		goto err;
	}

I didn't dig further yet, but I feel like this won't trivially work with
things like SMRAM when in-place, which can map the same portion of a gmem
range more than once.  I wonder if this is a hard limit for guest-memfd,
and whether you hit anything similar when working on this series.

Thanks,

-- 
Peter Xu


