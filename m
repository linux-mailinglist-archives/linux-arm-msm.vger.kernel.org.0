Return-Path: <linux-arm-msm+bounces-45434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1043A15440
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 397733A6D56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E5919DFA7;
	Fri, 17 Jan 2025 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e4D1XtMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EA919D098
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131409; cv=none; b=KpgBmvzUVp2ZE9uLT0bKBiJh5F/XLO0n0rGr7oZbVs7ctw/ZoB1djX7EUEpmKJWvSvLo4Ry++EFCP6LUIfMFXingU756A8vI+SFaKgtroQTMyKuxxb2rfVBxxbq4OzTQmKU/HuzvAhGQN93+cauE8jcsD6/poJzQV76I12voOcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131409; c=relaxed/simple;
	bh=DWGIP/qi5LWCgH8MHPzzsyVHVWs1vx0eOIEhhCoqOxs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=t2FbPwoapioVKqlHiH26UwWRotPAo30QJsaSK3nzumNWb57fqkMM1iiYY/TKGQpNw5h4/MhXG8DWimBw1PPGLgY5p0ik4atMvArxIffJhLPG0m5UNZlHT7EGhj0NUTCYGCKHtnFLM02eZBDc8SU3BqV3rKWWeOFajKKC8+Rax9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e4D1XtMz; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43651b1ba8aso16682895e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737131403; x=1737736203; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EFi/LeK1i1oYmoH0ZXeSnoaGN0kNaricZIbeo5WyKQo=;
        b=e4D1XtMz6YAxkwPPAnj0VQtt4vGvd1cz0Q+VKRn3Uiusi6IXovkTuA8End6m5qinGa
         HIfaBLBgd/Fsps5T06qiTr8+bzL4gm7zFaFcHVGZrz/XaFKVruTuVTb8+ibPDMYsnIkT
         UEB2W640LolkFamxl5RPrbAS4/h/uP2F42QA0gKYMB2zcgGNEu4a2jmbhqVS30PtPpI4
         3xNLgDuTdViY6D0FQTjHIlCdBVEyge6OFUca5VRDiC1diZCdsiO75r8GkL2zfyJUCMzO
         A/cfDV+pAIETxvG6I7obn+e1fTeAnLbGxLAVxWjuBeq0Rjq2QzAW2guEtP8s0Wao6pvm
         l4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131403; x=1737736203;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EFi/LeK1i1oYmoH0ZXeSnoaGN0kNaricZIbeo5WyKQo=;
        b=P+oLUIRzXdVHKnUaA/r7Rsws1dyDUWjE1TwmY+Opo9fA/DDgLd7TUrufpKHGk2EY1o
         T8ObN8TH8Lfa4EUvORTMWTHxZ2gPR/pbQsiTtIOkOM0T7E1bLlxWqYrTFZpKt1B5asHH
         fyvmZl+iQ5H49sgCKivJRY6Kp7hOCjGGuKAMXEtAjwi98hWDx5gdK2ZHU58XGwjIwQfZ
         +vEAldQ0FsQaVbYI0XI0or5PHAPLVvkz5zsJj5bAsspt972+0M+oue7QCa0EhA/ZDyL5
         8vdT+Y0cPcGOaLkEP//kThlUzmeJ+foxWOYKFEXwFDfEs6bw8fvpUCgCadUpQ7noQ/iJ
         9z4A==
X-Forwarded-Encrypted: i=1; AJvYcCWErdU2Src+YSmus9Bu3l7WH25FGonw11doczFPNI9xvLDppyH4c4IxVfdPZBOdRwNOtTQAjQ1P77PjdDrQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqkFy5mfpK+QklVlJjSKDz2Dpa7RCZcqgwaDzI5KRxibtt1JRg
	vxzS/ncJmevOmkVCda/C0B9i1pGgoDHkUvMnbFefcPAA0RlZz+jWGQ0MpfyhHNl+Q5hbvPpLBQ=
	=
X-Google-Smtp-Source: AGHT+IHisH8lFtSXqxitsVI8oE1Zn+Lbrl6gn+saOmhLPCojIr7sIXCJwyH321FPy/5mZWRxI8wmsfHN2Q==
X-Received: from wmbbe7.prod.google.com ([2002:a05:600c:1e87:b0:436:3ea:c491])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:adf:cf06:0:b0:385:fc8c:24b6
 with SMTP id ffacd0b85a97d-38bf566f406mr2762576f8f.27.1737131403298; Fri, 17
 Jan 2025 08:30:03 -0800 (PST)
Date: Fri, 17 Jan 2025 16:29:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250117163001.2326672-1-tabba@google.com>
Subject: [RFC PATCH v5 00/15] KVM: Restricted mapping of guest_memfd at the
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
6.13-rc7.  Please refer to v3 for the context [1].

Main changes since v4 [2]:
- Fixed handling of guest_memfd()-backed page faults in arm64
- Rebased on Linux 6.13-rc7

Not a change per se, but I am able to trigger/test the callback
on the final __folio_put() using vmsplice to grab a reference
without increasing the mapcount.

The state diagram that uses the new states in this patch series,
and how they would interact with sharing/unsharing in pKVM [3].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20241010085930.1546800-1-tabba@google.com/
[2] https://lore.kernel.org/all/20241213164811.2006197-1-tabba@google.com/
[3] https://lpc.events/event/18/contributions/1758/attachments/1457/3699/Guestmemfd%20folio%20state%20page_type.pdf

Ackerley Tng (2):
  KVM: guest_memfd: Make guest mem use guest mem inodes instead of
    anonymous inodes
  KVM: guest_memfd: Track mappability within a struct kvm_gmem_private

Fuad Tabba (13):
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
  KVM: arm64: Refactor user_mem_abort() calculation of force_pte
  KVM: arm64: Handle guest_memfd()-backed guest page faults
  KVM: arm64: Enable guest_memfd private memory when pKVM is enabled

 Documentation/virt/kvm/api.rst                |   4 +
 arch/arm64/include/asm/kvm_host.h             |   3 +
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          |  98 ++-
 include/linux/kvm_host.h                      |  80 +++
 include/linux/page-flags.h                    |  22 +
 include/uapi/linux/kvm.h                      |   2 +
 include/uapi/linux/magic.h                    |   1 +
 mm/debug.c                                    |   1 +
 mm/swap.c                                     |  28 +-
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  |  64 +-
 virt/kvm/Kconfig                              |   4 +
 virt/kvm/guest_memfd.c                        | 579 +++++++++++++++++-
 virt/kvm/kvm_main.c                           | 234 ++++++-
 15 files changed, 1034 insertions(+), 88 deletions(-)


base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
-- 
2.48.0.rc2.279.g1de40edade-goog


