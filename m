Return-Path: <linux-arm-msm+bounces-51784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB81A67935
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11EEE188A7F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3542116F7;
	Tue, 18 Mar 2025 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H0xKJEp7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04A72116E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314851; cv=none; b=BWgSoNXh5onBJ3j2nbk4k2/9HojfLpmKCQkb/ZgBvTaDPeFPeqaZBTp5ssr++CFmKvNRFuSXUiRcSlGn3p2xIPDGmqQF7MfeS92zZoLOEIHJCVFrhAPvYDf6XzfPdJn95VHN2qpbvAYOjq5fOCi4GFTqE6FzzTrMKJjxtnIVf7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314851; c=relaxed/simple;
	bh=b7HRB86K5OwZ5zAqlgBkvwTyAmTPYizXlYCkXIEFrC0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pzlmJVFGhGeuBzryN3FHQf+OYVL29Z1nOyWC9it50kjlcJip7FfqHcXO5QXe26bWC3Nv+GK3fToUAMMtI3bG0yO3QEhxvXNR420E54YUIN21sTVdMFdtV6UQrvfKIv7H+ODLJgdbyD+TV0WaiVzB39xoiN7FZaUhICLxKw+6pX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0xKJEp7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so30357595e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742314848; x=1742919648; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/4rrKqju3eVmPetDGm0h77EFquJ+/Ft9DdfJCYAypfM=;
        b=H0xKJEp7yheM0TEd56HL+igEJqVtyzHd/9FMTPuZ7fD73j8WtqA0OZGoIPkkLa5X1B
         tkok9u0himZc2mbb4amr6ClsqS97muguPtqJNk52VdkdK79IN97bQ4HlKtWb3VkVd2kL
         lmitNrvdpHLt+6WeYKBI02JQtoNTBUEbV9dnYHTmLVBjFxtGgqCPSLZtcnyLii4FY1mH
         C7amWVe6pqHl/kg83AWXUSAx9GRozsu6pu9dg3kNQpkOxfzUcomnANP/2m5N9AiMgpXq
         VoJBJoLrI7XqBWnlcqkRFpQCaFsYdUpA8fqEIkP8++KgVUKAOupAQIUVuX80mC2nwf22
         jwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314848; x=1742919648;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/4rrKqju3eVmPetDGm0h77EFquJ+/Ft9DdfJCYAypfM=;
        b=g507ugvEJmbaPKitOvILctO/C6W2luLxjNqWcXJx5HLBMBiQc7pJSx6FDuZ3LmfXer
         KKMjMQgzmUX5yUUtlOevmig6bIfGa0T+dh7azw1YbvTzQoeaQ3ps9TYh0YzLquY2ltFw
         XO5Hg5Dvo+mS4PowldK+mherbNcPgZF942irmh7yg5cTZmhHuZwFppcautvrEWWMc0vC
         0B96Jw7IINsI1KmJx5qPReu7c9N9SZ1wbBq0TMdT1uHFz8+2JZOWuvPI+MHJHBhKUTKU
         08KDRTV1xg8P7NemZP6ZOY5/5ozJCatSwPM37prG6knDxJlucxrieNh4bPMQI0CUmfDL
         ghqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXprE9Q3x0W0js+2NitCnYovJx0q+CeeDiAuM4Nsi/RuHXzBMsZLJ8Lym4hzjvzHAnjo5TuWEM17/guHN38@vger.kernel.org
X-Gm-Message-State: AOJu0YwV132J43Z5qRkKZoCsZp4oTUsNm5cUpN9raSQxU2yGPPR5WvmN
	8gCgOhOMrCq2uEN1PqQr4lBPhSj7ExEz4eU2G1GkdwqR+zClV2qbt6qKMHoZX/lz4hWTuqd3Lg=
	=
X-Google-Smtp-Source: AGHT+IG04C2ZXEkmNbHi/o+vaOI41oJW9kJtC264bgpL9XnkcleEAVsJcA9GCi6qC0eTEqYntjtppzIhjQ==
X-Received: from wmqe11.prod.google.com ([2002:a05:600c:4e4b:b0:43d:4038:9229])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a7b:c00f:0:b0:43c:fe85:e4ba
 with SMTP id 5b1f17b1804b1-43d3c953a27mr27893465e9.15.1742314848297; Tue, 18
 Mar 2025 09:20:48 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:20:39 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318162046.4016367-1-tabba@google.com>
Subject: [PATCH v6 0/7] KVM: Restricted mapping of guest_memfd at the host and
 arm64 support
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
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
	jthoughton@google.com, peterx@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

This series adds restricted mmap() support to guest_memfd, as well as
support for guest_memfd on arm64. Please see v3 for the context [1].

Main changes since v5 [2]:
- Freeze folio refcounts when checking them to avoid races (Kirill,
  Vlastimili, Ackerley)
- Handle invalidation (e.g., on truncation) of potentially shared memory
  (Ackerley)
- Rebased on the `KVM: Mapping guest_memfd backed memory at the host for
  software protected VMs` series [3], which entails renaming of MAPPABLE
  to SHAREABLE and a rebase on Linux 6.14-rc7.

The state diagram that uses the new states in this patch series,
and how they would interact with sharing/unsharing in pKVM [4].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20241010085930.1546800-1-tabba@google.com/
[2] https://lore.kernel.org/all/20250117163001.2326672-1-tabba@google.com/
[3] https://lore.kernel.org/all/20250318161823.4005529-1-tabba@google.com/
[4] https://lpc.events/event/18/contributions/1758/attachments/1457/3699/Guestmemfd%20folio%20state%20page_type.pdf

Ackerley Tng (2):
  KVM: guest_memfd: Make guest mem use guest mem inodes instead of
    anonymous inodes
  KVM: guest_memfd: Track folio sharing within a struct kvm_gmem_private

Fuad Tabba (5):
  KVM: guest_memfd: Introduce kvm_gmem_get_pfn_locked(), which retains
    the folio lock
  KVM: guest_memfd: Folio sharing states and functions that manage their
    transition
  KVM: guest_memfd: Restore folio state after final folio_put()
  KVM: guest_memfd: Handle invalidation of shared memory
  KVM: guest_memfd: Add a guest_memfd() flag to initialize it as shared

 Documentation/virt/kvm/api.rst                |   4 +
 include/linux/kvm_host.h                      |  56 +-
 include/uapi/linux/kvm.h                      |   1 +
 include/uapi/linux/magic.h                    |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  |   7 +-
 virt/kvm/guest_memfd.c                        | 589 ++++++++++++++++--
 virt/kvm/kvm_main.c                           |  62 ++
 7 files changed, 682 insertions(+), 38 deletions(-)


base-commit: 1ea0414b447c8c96e6a6f6f953323c3df71b85a6
-- 
2.49.0.rc1.451.g8f38331e32-goog


