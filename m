Return-Path: <linux-arm-msm+bounces-65965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A66FEB0CB25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 21:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD4D617CEDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D6F1A23B5;
	Mon, 21 Jul 2025 19:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Z1VcrLQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3605523771C
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 19:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753127217; cv=none; b=audrCrRDtbhfi6KJ4YKCW3Yu945NaLakPWjWJRIfeD0d/9z6/g2qk5Kg+V+EWNXd8Ae51cNtao/6ocSKEy+Lx2pMc9QdeLiTWlkwnaNJU1nZMKjY7UZndPG5SwDEpTZ5QuHBd+rOObIh5dRPu9x7J3XwhSoG46VgoODVN/6431U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753127217; c=relaxed/simple;
	bh=ahaM8OfPRMeDGUWSbe2Ir10rA7XZXeQys+W1mU1oI/g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EY2u4LNVFwkAEmGnPxLUIqGxVL+Xe7OiWK81t5WTZXcPI4FBGgCGQMpawCEwph+vW37nF4vrxBRe4bTxce1JCPEz9YOlPEYL5wPU4i/AiUGNsZj8USAvp0SHyzEZbtbfrOnnuDxAjpCUEFAi2iKGsdFW+My+oj8q/iSxQ2xUu1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Z1VcrLQ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31215090074so7042122a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 12:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753127215; x=1753732015; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eAzCPpfQMz1gzK4so/oBZateRTf7Y7I8QQ8KelEOi7Y=;
        b=2Z1VcrLQRFdi3rzZ/urEazsk9glRXmI4Dd6t7cs7Gz6y7Pg8KbW3z9Osc/ZO4eiAtd
         nnp5Sme6BE5L8Y4k/bF4GAdOy8aJB91uRhbw8h4Wqibt+IBiMMUnIkjr55yG+z/PfHPI
         +oA0JlO6zioZSIRh6sYP9kv5NANp6sbFUd0MQCuwcCFeZsEp9LAisnX9Hd9A3STV8M+R
         wILEdObLbvqIe6LbOjoxx8zDN27k8FSYYIqydL/ZF15qUOv3iKSnf9T6sshL50W+bxWr
         vNsTsK0BaKBKE3mXxu1ur7KGMESIBY7eYZ/L+/ip/m3g5DXiUtCHrS6tyfbA7ITp69X8
         0rMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753127215; x=1753732015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAzCPpfQMz1gzK4so/oBZateRTf7Y7I8QQ8KelEOi7Y=;
        b=hbazCYRbSgL0QpEBpGo9Lyu099Ad0TzeGf9K0T+GgE+8q8ySjOhNH+4QePFnvSe4F7
         wnkppSWEvGUl2o2sV/X8F4HRCrGT06W4Z1ldQWNcd/mamzbEH81d7WYjARne/nVG2HLm
         3WEsFw1nxYJEwiyuUCgHsnpx7W4LKSMBe8fjLWUtI2TRrLFR0Q/kBPx2X1pG0uxiOjXR
         yusByflOFaxQ+yyW26ByLZXrzJgQBnWO3IYDYSnp2xi6U0oCvaADn7H2bVmz0enX2F3v
         6MK+TjVVqhHTdSbsAxPXaSC3cwG4pYHm8FmBNjmYlMn+3iI2KLfXQ0RqKhV+M6m5Ib8Q
         aqEA==
X-Forwarded-Encrypted: i=1; AJvYcCVimEZzkjGbDiz1V6ad2acxxwujVsE/1TixDuPyRxWCgSIgsWSYp+ItJixwZTA94uacUmdVeShFOU+x5J78@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ed9fWSP8JpY9UQHIUF0+yQ627PwIS7N5lUIFz1JjmpUgiIqt
	mYBfiqprMXAhPcEqdt+18jeQx9VTMLrY+TrARgjYgZ4dKOxia5dA2BNqdaevHnjgjFyPglP64Wq
	V/qN1gg==
X-Google-Smtp-Source: AGHT+IHCdTRyaZvpqo+/OPaDQY8r+AbasdEQ23wkQlt2bLrH8q67zZ1ProzQYNVQGguXSMigXOn343oEtxk=
X-Received: from pjbnw5.prod.google.com ([2002:a17:90b:2545:b0:313:17cf:434f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f91:b0:311:ea13:2e70
 with SMTP id 98e67ed59e1d1-31c9f3c612fmr34864736a91.14.1753127215555; Mon, 21
 Jul 2025 12:46:55 -0700 (PDT)
Date: Mon, 21 Jul 2025 12:46:53 -0700
In-Reply-To: <20250717162731.446579-11-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717162731.446579-1-tabba@google.com> <20250717162731.446579-11-tabba@google.com>
Message-ID: <aH6ZLYgwK0EdIERg@google.com>
Subject: Re: [PATCH v15 10/21] KVM: x86/mmu: Generalize private_max_mapping_level
 x86 op to max_mapping_level
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 17, 2025, Fuad Tabba wrote:
> From: Ackerley Tng <ackerleytng@google.com>
> 
> Generalize the private_max_mapping_level x86 operation to
> max_mapping_level.

No, this is wrong.  The "private" part can be dropped, but it must not be a fully
generic helper, it needs to be limited to gmem.  For mappings that follow the
primary MMU, the primary MMU is the single source of truth.  It's not just a
nitpick, I got royally confused by the name when looking at the next patch.

s/private_max_mapping_level/gmem_max_mapping_level and we're good.

