Return-Path: <linux-arm-msm+bounces-51774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87173A67905
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33823189CA7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD5720D4E3;
	Tue, 18 Mar 2025 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b749swtz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE82419B3CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314708; cv=none; b=FFvVWFqmXp6Gsa4InyKM8usZrF8wS8Ps67ud4d14RxlIKvsU5gEghEG/grcfv2hHokGmXp/kaQHKewh1kVwBJ7JuA4OcE8zU2xeBlF9TnmpuaFTi/gcZnvqoCyTV90T5lYzCt0qmG+z06er7j4EiIe7PM2YmazWcxpDpM/3QKZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314708; c=relaxed/simple;
	bh=HOxqbHwxclzv3jQ5CE6oueRhJ7GTvIyBTmbDuvf554k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OrgYx/YCp5tRCLPIFOh1pQgFXGHGTsRhV8YhTknI9aDLm1dvlEGM6zMW4EpB6r8mGXP4oxcuI3H6926WIjXOsdpHp0gvci+gcAIBAjdpI8nTEB/KHS1sSyfD25Vjxxt3w2F9XMaKB8bjiyO6ObqrMn9+RXZjG2nTS+3C63km/ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b749swtz; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3913aea90b4so2562869f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742314705; x=1742919505; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ir59kQogB5jFvbq+93QLyhoRValCx40G+m5aMnPBZOw=;
        b=b749swtz5+QwlO1q47FZ3Gn5cciusA/dvLJhodw5QFb7dQ/aQr71KJeNxnUkbaYcaM
         pksAOxw+/V2oZOefWVoMQzik6s7+G8cUPeEGnrmucn46ihDeXUvO8xkVACtZBFu7Vlcu
         Bx2LpDEaukzZuWQe8nA1PcJ44r4BB7H9ocxdkaVjD3QtA1RHhEFaJZsXIXEy4Vz8cakD
         Cj0MlWpz33cpg7yI43+Dnj8ZQF/OF/amMQGXwBk6D/rjCi6EDXW2buSSWvyoNiOsuvpG
         SLqDOZjCNFuhwMnNS1c+3zCDZFOmLMTZhD+jaTNYVdf0rP8tvncbR0KqC1ly1rfGNJ1g
         jZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314705; x=1742919505;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ir59kQogB5jFvbq+93QLyhoRValCx40G+m5aMnPBZOw=;
        b=jCBrIWPYASfSgJouGqO/UM2HdGRIIR/Z1xymSQvJ3HD30sI1sAlYFetTsJj8Rr4Ctz
         x+sZckQRbsLbsHjmyJxPa4MV6lY9t39RE9ier8d08oILiiAljTBswDKdN9STnMR6yqiN
         LNUZuasrnpcLAtDhbgXp3WzfzEJyT6GPTBkiiDQGkmc0vy6WIbBierCoT4X8difcxgg2
         LcMOLecwY4jHlaHGPhy2WfP25C+G+jtgMpXFI495ESVn0spDYSY975PYkCTkY56yCgrp
         3q+MZ5XwQc2G0mpEE/9aGtx/cxzPEtBa1HXCfDZytndT38JlK15Lw29vFso07pB4AUf1
         mH4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWulvoYVH2S9sxR45WrTo8QN5Ia74VMXj2jMn4nVAb4clsHV3PwjWTT8pPsiJ54krtDGb6I1fQ4t48BGJAs@vger.kernel.org
X-Gm-Message-State: AOJu0YwPztHhgtY3T988RtjHP3c067FHhYGj1yQAe7Mxbc0u+rFZskeH
	YKHlpavQ+0Qyg+PlFBPNNGd9MgmHDDX/mOHo4K06pdx+jqbU2m3FVsqN8YIMS84OX0br8P9L2w=
	=
X-Google-Smtp-Source: AGHT+IHb487+BvontEArNfyNxjH1CxF20OtRn/FgWb9LSiqLeRuLnLUB21OFCh3NW6hXbiFjnsY3KBFrYg==
X-Received: from wmbgx13.prod.google.com ([2002:a05:600c:858d:b0:43b:bd03:5d2])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:648c:0:b0:390:f6aa:4e80
 with SMTP id ffacd0b85a97d-3996b4a1e7fmr4379310f8f.53.1742314705084; Tue, 18
 Mar 2025 09:18:25 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:18:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318161823.4005529-1-tabba@google.com>
Subject: [PATCH v7 0/9] KVM: Mapping guest_memfd backed memory at the host for
 software protected VMs
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

Main changes since v6 [1]:
- Fix and simplify handling of final folio_put() callback in case
  underlying file is no longer associated with guestmem, e.g., KVM
  module unloaded (Ackerley, Vlastimil)
- Removed dependency on folio lock when not needed (Ackerley)
- Carried acks (DavidH, Vlastimil)
- Rebased on Linux 6.14-rc7

The purpose of this series is to serve as a base for _restricted_ mmap()
support for guest_memfd backed memory at the host [2]. It allows
experimentation with what that support would be like in the safe
environment of software and non-confidential VM types.

For more background and for how to test this series, please refer to v2
[3]. Note that an updated version of kvmtool that works with this series
is available here [4].

I'm done respinning the series that tracks folio sharing [5]. I'll post
that one right after this one.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250312175824.1809636-1-tabba@google.com/
[2] https://lore.kernel.org/all/20250117163001.2326672-1-tabba@google.com/
[3] https://lore.kernel.org/all/20250129172320.950523-1-tabba@google.com/
[4] https://android-kvm.googlesource.com/kvmtool/+/refs/heads/tabba/guestmem-6.14
[5] https://lore.kernel.org/all/20250117163001.2326672-1-tabba@google.com/

Fuad Tabba (9):
  mm: Consolidate freeing of typed folios on final folio_put()
  KVM: guest_memfd: Handle final folio_put() of guest_memfd pages
  KVM: guest_memfd: Allow host to map guest_memfd() pages
  KVM: guest_memfd: Handle in-place shared memory as guest_memfd backed
    memory
  KVM: x86: Mark KVM_X86_SW_PROTECTED_VM as supporting guest_memfd
    shared memory
  KVM: arm64: Refactor user_mem_abort() calculation of force_pte
  KVM: arm64: Handle guest_memfd()-backed guest page faults
  KVM: arm64: Enable mapping guest_memfd in arm64
  KVM: guest_memfd: selftests: guest_memfd mmap() test when mapping is
    allowed

 arch/arm64/include/asm/kvm_host.h             |  12 ++
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          |  76 +++++++-----
 arch/x86/include/asm/kvm_host.h               |   5 +
 arch/x86/kvm/Kconfig                          |   3 +-
 include/linux/kvm_host.h                      |  23 +++-
 include/linux/page-flags.h                    |  31 +++++
 include/uapi/linux/kvm.h                      |   1 +
 mm/debug.c                                    |   1 +
 mm/swap.c                                     |  52 ++++++++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  |  75 +++++++++++-
 virt/kvm/Kconfig                              |   4 +
 virt/kvm/guest_memfd.c                        | 109 ++++++++++++++++++
 virt/kvm/kvm_main.c                           |   9 +-
 15 files changed, 357 insertions(+), 46 deletions(-)


base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
-- 
2.49.0.rc1.451.g8f38331e32-goog


