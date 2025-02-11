Return-Path: <linux-arm-msm+bounces-47625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD6A31230
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 17:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD82E1881ED2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32BC253B5A;
	Tue, 11 Feb 2025 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="riPTPQtr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D55260A21
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293055; cv=none; b=fmTu+FnkhTlg+AKLy5fEqW/giJ0skQQwy2s/W1eoxkXFYXRWXdjJBZxKIY8VJNyyqHjl9qgQO1AWEa3QkwaExaChS50Kp0lq8JA5j3cZV3XYFIUGm0KH2bH3epJ647DhgIze6JLdYXmxY0aHACBDjmQK90keseQgsH4sdwJtjI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293055; c=relaxed/simple;
	bh=xskn39v99O+DiTeeJhrlMEKE14ladxm2WDwo3FSn8N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJr/93WYGzsIK9qEMYjTk8kFz886ck4bIEWg0/LxgkQmz4sMvYUGezdwHwYcB3XHJeuVRuphZbitAU9PXSfv7584lVv23XjTMOpKod8yZQWVIoblnRIPo8JMNeqUOZz/aphZHxxxoChjH/cYl8N9rYT2oW+A00nbHOcIJMiwLOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=riPTPQtr; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso1013632666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 08:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739293052; x=1739897852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ITTWQB6rCRgMy4jz77x7qgpeW2xyYXF+QL7wz+KsG0Y=;
        b=riPTPQtrck9ghK1YjlYNCtR4hYqmSLuK0VcXr0YZgcClQRXSN3CJDThsTres4JZ/Wt
         yHPreb2oiDuh7mHVsbr0QHjybg2+x1FzbZbkSbpMLLHyKLysZyOrs2MThV1XEuXQcIDn
         F723LFLWgxCPTwdaDNko1Ngzt1ZbNeHVrPnbMmsz8K00RENwru5NK8/0u/t/3JrOM10I
         f7UYwLWMwhSyBbrSe8lVSbNk0vWnfqPTgV0hOtoDcpMNPpQnQkAty1ixd2E9icYzxPbN
         gmiLLO3HT5FX3/UBpX6utLbgiQIqaLeogozQfWtgg8NYjcfwDyBvZBU4O/1JV2RCGTJ0
         3mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739293052; x=1739897852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITTWQB6rCRgMy4jz77x7qgpeW2xyYXF+QL7wz+KsG0Y=;
        b=w9xRH+qM/CTKwICHLwBFgdpWTsEIxcyZlysnpYdYOHq+6K6ErgsvtIfwnsDDcKBu5Z
         SWlt8yBuh0q53JG4U8ZYfARDVkwYMIa4kGR4JAUwxk8xCc55F7Tnpno/kaAC0z447lTK
         4N2TnTztKupiYYfhwovrGPhjxrof+BcUZgC9Tg39HbjIDl2crGtyvo7P7vG3frdkC188
         e2U2uYixLhcxH0KilgpjhunBFDRXOUbdwJJZ7ZB/LuqVd/+0R5DpH9hbuIT2D/Q58jGC
         RukB3jqV2kXi0zSzgY/70TtW4A9W4eGEA8Blt7oveeOhl1mzQ+dtefG2T5eK7HGtT+Qa
         iShA==
X-Forwarded-Encrypted: i=1; AJvYcCXxjyxIlBgWbz2/GzvtyFpVmzhoISOiZ0o7cVtY5zozDbQO8y/Y78+5OzV6eLbqWqKI3Ku8PBXl79EFEUYj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6nk8sGCxY5Swf8j+F/Sg72nmbZYz8z6CQtaAhMIpYyemT8YRh
	bimhqlxbeNGhXNvdzYxXcsPxqd7EauBxPGIvBpm27jNcloW7AmNssFRVsU/pzw==
X-Gm-Gg: ASbGncvbcX6FalKNxfMXCpgTTgsI/vo1WsrsvLIcebQqW/4rfOLyJ4+eeN/ZVEqwWN5
	TRZ6RsKRENXnXznXIQN5R4oMO0lfWTPonIFJmbivYPQsC2AT4mHLQG2Yry57WUS19MhrugI1Dyr
	N/WQWnuGsDbrZQLxGO0M94BT62HpX65M1YiGQ+1w3YLp09ROC/1ZJzGqgAOy0OO+t3+JHiYg9kJ
	Bo+z0+eG11IsK2S/hgWRhABObhkefjut69ZSW2VNtSagDlgrMdeToCQf4uvOr1GKkKNpF8k0bOq
	+MonP7W+ROsI1Rgpw4TZipEdee1Y0X+iCMdPUgxsBTvQtmM7uKaF
X-Google-Smtp-Source: AGHT+IFUs3jK4RIVQ4CQAOv86F0kyLMNTuS8WIFx7I3ccayQfZmTMdyBqNyfcfDIo0b7kmJTS6fEGw==
X-Received: by 2002:a17:907:2d24:b0:ab2:ea29:b6 with SMTP id a640c23a62f3a-ab7f01cc9bemr45031066b.35.1739293052108;
        Tue, 11 Feb 2025 08:57:32 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7be7ac8a9sm459262466b.39.2025.02.11.08.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:57:31 -0800 (PST)
Date: Tue, 11 Feb 2025 16:57:27 +0000
From: Quentin Perret <qperret@google.com>
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
	maz@kernel.org, will@kernel.org, keirf@google.com,
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org,
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com,
	fvdl@google.com, hughd@google.com, jthoughton@google.com
Subject: Re: [PATCH v3 08/11] KVM: arm64: Handle guest_memfd()-backed guest
 page faults
Message-ID: <Z6uBd-L_npR_VqVY@google.com>
References: <20250211121128.703390-1-tabba@google.com>
 <20250211121128.703390-9-tabba@google.com>
 <Z6tzfMW0TdwdAWxT@google.com>
 <CA+EHjTy3dmpLGL1kXiqZXh4uA4xOJDeTwffj7u6XyaH3jBU26w@mail.gmail.com>
 <Z6t6FSNwREpyMrG3@google.com>
 <CA+EHjTyU5K4Ro+gx1RcBcs2P2bjoVM24LO0AHSU+yjjQFCsw8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyU5K4Ro+gx1RcBcs2P2bjoVM24LO0AHSU+yjjQFCsw8Q@mail.gmail.com>

On Tuesday 11 Feb 2025 at 16:34:02 (+0000), Fuad Tabba wrote:
> > Sorry, yes, that wasn't clear. I meant that kvm_mem_is_private() calls
> > kvm_get_memory_attributes() which indexes kvm->mem_attr_array. The
> > comment in struct kvm indicates that this xarray is protected by RCU for
> > readers, so I was just checking if we were relying on
> > kvm_handle_guest_abort() to take srcu_read_lock(&kvm->srcu) for us, or
> > if there was something else more subtle here.
> 
> I was kind of afraid that people would be confused by this, and I
> commented on it in the commit message of the earlier patch:
> https://lore.kernel.org/all/20250211121128.703390-6-tabba@google.com/
> 
> > Note that the word "private" in the name of the function
> > kvm_mem_is_private() doesn't necessarily indicate that the memory
> > isn't shared, but is due to the history and evolution of
> > guest_memfd and the various names it has received. In effect,
> > this function is used to multiplex between the path of a normal
> > page fault and the path of a guest_memfd backed page fault.
> 
> kvm_mem_is_private() is property of the memslot itself. No xarrays
> harmed in the process :)

Ah, I see, but could someone enable CONFIG_GENERIC_PRIVATE_MEM and
related and get confused? Should KVM_GENERIC_MEMORY_ATTRIBUTES=n
depend on !ARM64? Or is it KVM_GMEM_SHARED_MEM that needs to depend on
the generic implementation being off?

Thanks,
Quentin

