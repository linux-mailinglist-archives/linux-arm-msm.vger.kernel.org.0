Return-Path: <linux-arm-msm+bounces-42091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E57B69F12C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01AD616AB20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD381DF977;
	Fri, 13 Dec 2024 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dzp+pZlU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB4C1E47AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108496; cv=none; b=uZ470KxM09Y+w+bREpFMn4pb8UVlUj2Zs8mPt5SLDDOb2DZy34jrmF+6mModyxXbXDx09UyHHzuTnsYVBp86QtQHHtODDfKFvooS/QFtfOHKFhFL8TJvMYDurtKJrF+ONa4JI+6PQV3dk462FdJFf0aFrGKEAOtHr7p4YTUzUWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108496; c=relaxed/simple;
	bh=r+HyORnvoVi0/ofpUpkrBmDYo1B6a7NTdhOnqSZIzXo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=o7DFswbPbFBXQvtwxFtSt7RJcezOLe2ezDhjitYz/AaR6SluVI6MbxrSBVT+tnLlKAXCl4VYCChwiYKsMgtDG/vi3zqapXNuqY7j691K4bCdKCB1+EZ124MRu9uE7E3UD67zpSbFpRaYkrzdLMJrwYnq5uZZvfjpYNSpIUv2sdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dzp+pZlU; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4362b9c1641so4707605e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734108493; x=1734713293; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l49nZBQWbj/tqR0pfbsQBWP6JXQh3gfv222a0VGKOo8=;
        b=dzp+pZlUZYOQQryw2z9CZ5a75SNpCt3ArokQKkqDzQIy1o9enyy5xJiDMaQ5R/bat9
         RDBDusPCzUxb1bKcXDfHmdUhRd5NOSKbH6I15EorpJYqSN3O1Exm1cjjLamuk0XfFXQK
         jGHp3UveA8dbX5wAFhdNqILn65vrKCxXP7nL4D3KVIF9hiNUGVmRDIlaM55MKjfvyWio
         iyOCWMlgGOE7hw2W+tT68fINxGSZQBjfyHn5deJ0KCMBi6AcVGlvcXY7kXILhN26UYpu
         m6h1b5HhRiWjS0dOIcT7YTTRievIyNaAIbcqUY/PeyyW0L135cXFSeDH4Qbhxjlq+NaY
         quTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108493; x=1734713293;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l49nZBQWbj/tqR0pfbsQBWP6JXQh3gfv222a0VGKOo8=;
        b=YpSqChyG9ji8TCZrjlN4ftIjd2q4QK1v0N9W0VeSgZ4H4CmvwaiwZFchfPieTaDSgf
         ts0mabiSShRndHnXSfERMaJwvWyhaQX1DzXUHKl02cZyDsmmTT8pu6rQmLXdLidlipFH
         yzDEs0yXQbVoycAenltDj2jLhGXZYpoxOX0kv5KW9y6A5sA+oC9YLsZXdg7jGzux/cJH
         /Ps/KDeaxU0wtDrGLVpMf1olHUV8cwWnO4C1JdYWHcxDshU/vtFilGixt5Kg/isdf6/c
         biAvuhDbDNImcHrgIlsEgdT0VFW5+8+Rt+M6KWf35LuC5rXF1EBgKvCX4p92eram21V2
         8NqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdcg4Ha+C7giWi3t+kf6cIvv1UTw+FhAXQBNTt5SJ18dID9VmFOVc7odvtdB87kwmpWnJBrnVSt8WUTcUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxfBMl+UEyTSiW07DzEBcUFObPjaeLv4VlAJnjzHdEfPRnpqW1R
	a8OicAwbMZ21MYd3D0CpVFHITdng9ZfXf+Q8KwfGdjujhiPnhvsCFsyAcIwb4ErxUvyeg55WQg=
	=
X-Google-Smtp-Source: AGHT+IHeXWv9UlvNwtt49TJOJkvo4Sw+243biArECpj/wEQYlB+Xl6ffPPZWh7+IujbdTMPrByuwczoUyA==
X-Received: from wmph6.prod.google.com ([2002:a05:600c:4986:b0:434:e96f:86b0])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5986:0:b0:385:dea3:6059
 with SMTP id ffacd0b85a97d-3889ad32e66mr2769505f8f.49.1734108493083; Fri, 13
 Dec 2024 08:48:13 -0800 (PST)
Date: Fri, 13 Dec 2024 16:47:56 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241213164811.2006197-1-tabba@google.com>
Subject: [RFC PATCH v4 00/14] KVM: Restricted mapping of guest_memfd at the
 host and arm64 support
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

This series adds restricted mmap() support to guest_memfd, as
well as support for guest_memfd on arm64. It is based on Linux
6.13-rc2.  Please refer to v3 for the context [1].

Main changes since v3:
- Added a new folio type for guestmem, used to register a
  callback when a folio's reference count reaches 0 (Matthew
  Wilcox, DavidH) [2]
- Introduce new mappability states for folios, where a folio can
be mappable by the host and the guest, only the guest, or by no
one (transient state)
- Rebased on Linux 6.13-rc2
- Refactoring and tidying up

Cheers,
/fuad

[1] https://lore.kernel.org/all/20241010085930.1546800-1-tabba@google.com/
[2] https://lore.kernel.org/all/20241108162040.159038-1-tabba@google.com/

Ackerley Tng (2):
  KVM: guest_memfd: Make guest mem use guest mem inodes instead of
    anonymous inodes
  KVM: guest_memfd: Track mappability within a struct kvm_gmem_private

Fuad Tabba (12):
  mm: Consolidate freeing of typed folios on final folio_put()
  KVM: guest_memfd: Introduce kvm_gmem_get_pfn_locked(), which retains
    the folio lock
  KVM: guest_memfd: Folio mappability states and functions that manage
    their transition
  KVM: guest_memfd: Handle final folio_put() of guestmem pages
  KVM: guest_memfd: Allow host to mmap guest_memfd() pages when shared
  KVM: guest_memfd: Add guest_memfd support to
    kvm_(read|/write)_guest_page()
  KVM: guest_memfd: Add KVM capability to check if guest_memfd is host
    mappable
  KVM: guest_memfd: Add a guest_memfd() flag to initialize it as
    mappable
  KVM: guest_memfd: selftests: guest_memfd mmap() test when mapping is
    allowed
  KVM: arm64: Skip VMA checks for slots without userspace address
  KVM: arm64: Handle guest_memfd()-backed guest page faults
  KVM: arm64: Enable guest_memfd private memory when pKVM is enabled

 Documentation/virt/kvm/api.rst                |   4 +
 arch/arm64/include/asm/kvm_host.h             |   3 +
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          | 119 +++-
 include/linux/kvm_host.h                      |  75 +++
 include/linux/page-flags.h                    |  22 +
 include/uapi/linux/kvm.h                      |   2 +
 include/uapi/linux/magic.h                    |   1 +
 mm/debug.c                                    |   1 +
 mm/swap.c                                     |  28 +-
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  |  64 +-
 virt/kvm/Kconfig                              |   4 +
 virt/kvm/guest_memfd.c                        | 579 +++++++++++++++++-
 virt/kvm/kvm_main.c                           | 229 ++++++-
 15 files changed, 1074 insertions(+), 59 deletions(-)


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1.613.gc27f4b7a9f-goog


