Return-Path: <linux-arm-msm+bounces-65275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A62B07919
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288563B63BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F24E264605;
	Wed, 16 Jul 2025 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+AsWQSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431A8223301;
	Wed, 16 Jul 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752678504; cv=none; b=eSvl9Wxw5ZxB06gFgydNh3aQTFfP5SJkcZ+eRn9cN95d2OhRHPrMfxVY6w+xB5MZQhcrREa9PsQerenA02b4oYnJCcli8tjpJRxWpsWudNuBAeGYQJ7+z+bb30F4Yz3X88XUdkjJV7V/mKXyOEE31deTxoqpWUItxuyN+gr4mn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752678504; c=relaxed/simple;
	bh=xvi2l5ghTTIH9EH2CKcJOVCwTnyTxxYJYjbF2qW34Qg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMBQ9N45+0c9L+0hSwRokFFbdD+iZ4k2ffNVz84cHwqUqv2m88nYZXPnx7kilEjWuARq2e0DK+tkqnVhHKcO5BIUVf6gP/UOlxcG4xXrLrceLe6ebi13vuCCU6mMInfCnK7R5bny9bammBNPsr8Z0Vy+6HTVzj6UB1vzyuLCWII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+AsWQSg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B090BC4CEE7;
	Wed, 16 Jul 2025 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752678503;
	bh=xvi2l5ghTTIH9EH2CKcJOVCwTnyTxxYJYjbF2qW34Qg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z+AsWQSgn+VNalO3vBtg1zgV1GNqZj5ciXVkdEQbSthGfUjxN86sNtKDAoznNEOKI
	 JURIJX2yZ6BWvVhkNmv9AunldjcdZefjGBQkI/0GoLCm2OFJ1oqHyTLiXd3SkhBaHW
	 AhJ9EWNooUGxK0weNO/NYszgtXei1Gwahih6kZlJtUjYkd0uucFkuQTET7lAVTUYlh
	 tcQBfS2bmSE5FU8b/B67/D8ueukaYykW6QMU81Mv65sK03YFyMJqyz3lUKlEJN8POq
	 sP6QCPymMY0XdHc/l21pfal0J/fgt/XaxLMq/riK5wrPnti54scUOL7LdsigipPfPP
	 lS4UCDsHGjGMQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uc3k4-00GJsc-9y;
	Wed, 16 Jul 2025 16:08:20 +0100
Date: Wed, 16 Jul 2025 16:08:19 +0100
Message-ID: <86v7ns897g.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: David Hildenbrand <david@redhat.com>,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mm@kvack.org,
	kvmarm@lists.linux.dev,
	pbonzini@redhat.com,
	chenhuacai@kernel.org,
	mpe@ellerman.id.au,
	anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	seanjc@google.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	willy@infradead.org,
	akpm@linux-foundation.org,
	xiaoyao.li@intel.com,
	yilun.xu@intel.com,
	chao.p.peng@linux.intel.com,
	jarkko@kernel.org,
	amoorthy@google.com,
	dmatlack@google.com,
	isaku.yamahata@intel.com,
	mic@digikod.net,
	vbabka@suse.cz,
	vannapurve@google.com,
	ackerleytng@google.com,
	mail@maciej.szmigiero.name,
	michael.roth@amd.com,
	wei.w.wang@intel.com,
	liam.merwick@oracle.com,
	isaku.yamahata@gmail.com,
	kirill.shutemov@linux.intel.com,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	quic_eberman@quicinc.com,
	quic_mnalajal@quicinc.com,
	quic_tsoni@quicinc.com,
	quic_svaddagi@quicinc.com,
	quic_cvanscha@quicinc.com,
	quic_pderrin@quicinc.com,
	quic_pheragu@quicinc.com,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	yuzenghui@huawei.com,
	oliver.upton@linux.dev,
	will@kernel.org,
	qperret@google.com,
	keirf@google.com,
	roypat@amazon.co.uk,
	shuah@kernel.org,
	hch@infradead.org,
	jgg@nvidia.com,
	rientjes@google.com,
	jhubbard@nvidia.com,
	fvdl@google.com,
	hughd@google.com,
	jthoughton@google.com,
	peterx@redhat.com,
	pankaj.gupta@amd.com,
	ira.weiny@intel.com
Subject: Re: [PATCH v14 15/21] KVM: arm64: Refactor user_mem_abort()
In-Reply-To: <CA+EHjTz=4PbF9yVQPO-ucjSq=n4fC+-QP_HGpWO4Wa1273fXtw@mail.gmail.com>
References: <20250715093350.2584932-1-tabba@google.com>
	<20250715093350.2584932-16-tabba@google.com>
	<39a217c1-29a9-4497-b3b6-bc0459e75a91@redhat.com>
	<CA+EHjTz=4PbF9yVQPO-ucjSq=n4fC+-QP_HGpWO4Wa1273fXtw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: tabba@google.com, david@redhat.com, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, quic_pderr
 in@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, ira.weiny@intel.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Wed, 16 Jul 2025 12:26:13 +0100,
Fuad Tabba <tabba@google.com> wrote:
> 
> On Wed, 16 Jul 2025 at 11:36, David Hildenbrand <david@redhat.com> wrote:

[...]

> > A note that on the KVM arm next tree
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git/log/?h=next
> >
> > there are some user_mem_abort() changes. IIUC, only smaller conflicts.
> 
> Thanks for the heads up. I can work with Marc and Oliver to resolve
> any conflicts once we get there.

Yup. Ideally, a stable branch, based on an -rc tag, would do the trick
and allow us to solve the conflicts ahead of this hitting -next. We
can either take that in the kvmarm tree, or from the main kvm repo.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

