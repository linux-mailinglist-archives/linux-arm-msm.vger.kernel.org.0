Return-Path: <linux-arm-msm+bounces-33813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A01998155
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D20F285052
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F2C1C32E7;
	Thu, 10 Oct 2024 08:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ez8f6z1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A7E1C2DA5
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550775; cv=none; b=aoedKb/qn4URJDn/kXsKd/1/kThqbHfxYCByavyL3pD3kpr7sY2PAGR83U72wIVCkRfBNTgBft3sK8+tvJvdsMNolF+oSKvB30i0QCMalRPtr1x2rOm3lknIGftAYTtOqFZISFRAqN62kco0qfx4jkbJkO9RRQA8an2BIn5H3aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550775; c=relaxed/simple;
	bh=re/D/+YA56tDapuXK2wkAttwNTUfFjzM1HwHleL/Zuk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Y3vP2vVQOODCVQ4iRZ7j0IElIfDbLhQPejVeMdyB9Bi0N44iOInDCw3QvamizpJ+K7pkM1b5eN/SkrSiEvN6npS57+Gb3OYBL6CqwTdn+HyOlF/jcEauky/xq9zup1/C7NTuj++Ir/OZOaGkUJ1OpE1czqEAcSIvXMrV4ByMjNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ez8f6z1M; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e28d223794so13500577b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 01:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728550772; x=1729155572; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=44RrF/B9Ex8nQJPJovZzgohUiCEdgUa9GoiqQfAe37s=;
        b=ez8f6z1M7i6Z9oWEVmnlWxrFSx/z4d0mmLvbQ4KlHSbAU5CZghWrnJAPG77my9f6YN
         PKJlAnMmXnMPiP1heGwwpGV+5QggP/nVVpgcfhgSMT9b3AOTDZTTH6FjWgGzrluzqIAd
         ugEnlObFDD1DK4cyFLWjzbyPMFXsE3x0NfJUys3aqHoJoM4u9GxlDUms3UQDNpXu4RjJ
         x4LfcLHFw1AjV9PjwNyDCKbH2s+YJKDh9903mjW1agBC6BGng8wl0A96t+pl8v+XIloC
         Ub4UdEfCYOInT9ysyq+8zb3UsaHFEbHB/LliVRSthS7zfwy7hzOmY2NZ9560bXoLVIuR
         0q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550772; x=1729155572;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44RrF/B9Ex8nQJPJovZzgohUiCEdgUa9GoiqQfAe37s=;
        b=eA35QyBqF600f6oa1Qf0IKa1zUhyD8qe1OUftWpn+tz8FGWgk4ANiUZ3TSc3kxS+X8
         ijJpLLic4oZXZn7vZVc85gDF9LciVxkSb52mkTLgn/PX9Qd8QRaNtbevdGMYgv6iyeAy
         QJPpKzeMlOyg9lUtAtaFfYLIMNzjh1UbiiWQxpumgi7m7Yuj5gBw8IR9e+10lPRwT6i2
         BZjQeB9vQtEAsBy13AtrQowgUNrzTGaFdA5tYBmGRi7UmH7HweXlfpo82xdD8B6FOAUB
         OoZQohqIXjqRxjsRAv74X9Tz9SVSdIrNDnHiJBKwQYa0IWtXKTIRNmUQAIHWrzki38Ov
         i21A==
X-Forwarded-Encrypted: i=1; AJvYcCVh+STCDaF1OzYwRJ7SQmiHxRGEMOAUcTu4JbA+iS5rjEgqNNKtCix5DJZMSs2gmneWhQ4jQU4coMOkSAB9@vger.kernel.org
X-Gm-Message-State: AOJu0YywTAPfiHJy68OxBHLZvSHsdUjE6IHqQqZ5Dl8FLqHXgwaSh7QC
	VSXTPrB/yTCbX0RX7YRRNvJdBGW6LI7eSG+lc3McrEpPlQCjWNtle2V1IIMYCEj+YDPW1bG3MA=
	=
X-Google-Smtp-Source: AGHT+IE48pBjjjaVu8xZXl4soeW7srzTlab264gBCoBpdD51ajco5eIPVFv17ipdIxXgjEAxnQnx2cZ6PA==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a25:ab51:0:b0:e28:fb8b:9155 with SMTP id
 3f1490d57ef6-e28fe41c747mr48174276.9.1728550772449; Thu, 10 Oct 2024 01:59:32
 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:59:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241010085930.1546800-1-tabba@google.com>
Subject: [PATCH v3 00/11] KVM: Restricted mapping of guest_memfd at the host
 and arm64 support
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
6.12-rc2.

Changes since V2 [1]:
- Use refcount to determine whether a page/folio is mapped by the
host rather than folio_mapcount()+folio_maybe_dma_pinned()
(DavidH)
- Track of mappability of guest memory at the host in the
guest_memfd inode (Ackerly)
- Refactoring and tidying up (Sean, Ackerly)

By design, guest_memfd cannot be mapped, read, or written by the
host. In pKVM, memory shared between a protected guest and the
host is shared in-place, unlike other confidential computing
solutions that guest_memfd was originally envisaged for (e.g,
TDX). When initializing a guest, as well as when accessing memory
shared by a protected guest with the host, it would be useful to
support mapping guest memory at the host to avoid copying its
contents.

One of the benefits of guest_memfd is that it prevents a
misbehaving host from crashing the system when attempting to
access private guest memory (deliberately or accidentally), since
this memory isn't mapped to begin with. Without guest_memfd, the
hypervisor would still prevent such accesses, but in certain
cases the host kernel wouldn't be able to recover, causing the
system to crash.

Support for mmap() in this patch series maintains the invariant
that only memory shared with the host, either explicitly by the
guest or implicitly before the guest has started running (in
order to populate its memory) is allowed to have a valid mapping
at the host. At no point should _private_ guest memory have any
mappings at the host.

This patch series is divided into two parts:

The first part is to the KVM core code. It adds opt-in support
for mapping guest memory only as long as it is shared, or
optionally when it is first created. For that, the host needs to
know the mappability status of guest memory. Therefore, the
series adds a structure to track whether memory is mappable. This
new structure is associated with each guest_memfd inode object.

The second part of the series adds guest_memfd support for arm64.

The patch series enforces the invariant that only memory shared
with the host can be mapped by the host userspace in
vm_operations_struct:fault(), instead of file_operations:mmap().
On a fault, we check whether the page is allowed to be mapped. If
not, we deliver a SIGBUS to the current task, as discussed in the
Linux MM Alignment Session and LPC 2024 on this topic [2,3 ].

Currently, there's no support for huge pages, which is something
we hope to support in the near future [4].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20240801090117.3841080-1-tabba@google.com/

[2] https://lore.kernel.org/all/20240712232937.2861788-1-ackerleytng@google.com/

[3] https://lpc.events/event/18/sessions/183/#20240919

[4] https://lore.kernel.org/all/cover.1726009989.git.ackerleytng@google.com/

Ackerley Tng (2):
  KVM: guest_memfd: Make guest mem use guest mem inodes instead of
    anonymous inodes
  KVM: guest_memfd: Track mappability within a struct kvm_gmem_private

Fuad Tabba (9):
  KVM: guest_memfd: Introduce kvm_gmem_get_pfn_locked(), which retains
    the folio lock
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
 arch/arm64/kvm/mmu.c                          | 120 +++++-
 include/linux/kvm_host.h                      |  63 +++
 include/uapi/linux/kvm.h                      |   2 +
 include/uapi/linux/magic.h                    |   1 +
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  |  57 ++-
 virt/kvm/Kconfig                              |   4 +
 virt/kvm/guest_memfd.c                        | 397 ++++++++++++++++--
 virt/kvm/kvm_main.c                           | 279 +++++++++++-
 12 files changed, 877 insertions(+), 55 deletions(-)


base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
-- 
2.47.0.rc0.187.ge670bccf7e-goog


