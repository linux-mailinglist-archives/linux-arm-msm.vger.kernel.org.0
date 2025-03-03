Return-Path: <linux-arm-msm+bounces-50033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9906A4C95F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 18:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB2F8189EB32
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 17:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3120E215174;
	Mon,  3 Mar 2025 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N6wzzMSB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549D022CBC1
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741021820; cv=none; b=AmqviT9TsY7NSLv1fVRFQDIvGYxiMH9Mwm3b4M/LC4Hm56Sa5inhU9pw6lCs65Hgw6Lov29lxQQ0jNlEdgqueba4dJrw6MvhuRSOSpYZJI/wjBxUxIdpRGQsQt5qAupjYeNrcthZqEFdNy+iAtCQdMSAYNMeJDJrzufP7zwtJfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741021820; c=relaxed/simple;
	bh=1IoTnb/EA0BuX5qBEHCFmbuYRYlRErB/BLVTaNIcYjA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QEC9cd1AoY1wwQgKes88i2UaSh2mPvF7m0ugAftKK0xyCB3sT4W8cQyH1e6MlqdmyENfX8sNgm32N3VcnVadWyIP+WRVBS2MeL+X4A3FlmJQbwrJ0mEAcXWdcdUM0zITVkXVLujWnpc2eHYVLeRuK+ZQHRehcqYZNO0/f0THwLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N6wzzMSB; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-390de58dc09so3137463f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741021815; x=1741626615; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DOkmxQVDZmf5yeUI4pgYD3v63NeFP1axKGGtiw1qeSI=;
        b=N6wzzMSBx53zjCT0xPtcitKsTXPi/EHOZAuVUVQG7+lFSeM3c7QFAWLBgzIAr9UNEm
         cWkEZVJNHIt2Ux89oFoF0MGGcQ0qG7m2ENXVlIprwiTuW8SZNIlLv8IZVzyspAPgTIpF
         BROxfBplPKnWBVqjRRFK6C+WdS1OhC6OVizytbTIshF5KGmocAA3hJ+Sn2r+vVJbbKra
         wtLb2MzzfwrSern0T3tRj8GC/4zQeLumPa/49dFcX4me7Mdej00OBgUSnsJbkPfz8eJc
         XUpSI9ZcK71+dv4xnUkjnpdIkyegePY4BOdoaYkNMF4PloQOhX0lUGbLQee8Znf50OC9
         M1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741021815; x=1741626615;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOkmxQVDZmf5yeUI4pgYD3v63NeFP1axKGGtiw1qeSI=;
        b=gNpQmUul3fjIOXo5RO39QqpEQSlnH+uk77scsEJFA4XO0XbuhUxMU9nYOIFVlc2ZXR
         Ro7f175sHJpQjvs8U9D6ePqse2Y1pngFDdPOBqGLjNKEgdLHArY6oE0PwC4YUq8ZdDd4
         tnzwUa9VwjgTw+qDM+CH+vRyPepCbQP2J8lUXfbrkW/iKekr5q+YymOL24aKF0LGYhtG
         JEKymGObzhstMtR5ZeBKwS7BJBHARMh6uvR3yN8JcHAMwQyVawc5jTjFZKfqBNo9OcWV
         IYTDCR7orVQnf6vSRkiGvGNoL61D06vQJL9ZJ3Kl6sqyOe/rduQFOGltFmq8XS3H/fx0
         X7Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUFb4w8XRLY1WEVi71i2Ma6HE0yrBzeqounpWhI2rzTkZBMPP/2ZdYKRxa9Xrhzw/kFTkbfEcotuvvPr0Xj@vger.kernel.org
X-Gm-Message-State: AOJu0YzGUYjIZ2zvFevnRYh2n0cKQXPUc9rpejXPTKfvrYxyOWLMzG7t
	31EhVnx1ivIOpCZCIJGt1cMW/J9g4/SvMD9aglBXmKsASCja0fJObVe5WulRcI0xr9sKyjlKJg=
	=
X-Google-Smtp-Source: AGHT+IHlZbmRfE9yAqMi2uyKLmIqF5PJRQLGxvjj7yWMHBHhuKMjhOU/JFXUOXTZEuWFst+HfN614kZRvg==
X-Received: from wmbbh25.prod.google.com ([2002:a05:600c:3d19:b0:439:8e81:fd03])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2a2:b0:390:f9a5:bd79
 with SMTP id ffacd0b85a97d-390f9a5bf4amr8750587f8f.26.1741021815641; Mon, 03
 Mar 2025 09:10:15 -0800 (PST)
Date: Mon,  3 Mar 2025 17:10:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250303171013.3548775-1-tabba@google.com>
Subject: [PATCH v5 0/9] KVM: Mapping guest_memfd backed memory at the host for
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

Changes since v4 [1]:
- Refactoring and fixes from comments on v4.
- Rebased on Linux 6.14-rc5.

The purpose of this series is to serve as a base for _restricted_
mmap() support for guest_memfd backed memory at the host [2]. It
allows experimentation with what that support would be like in
the safe environment of software and non-confidential VM types.

For more background and for how to test this series, please refer
to v2 [3]. Note that an updated version of kvmtool that works
with this series is available here [4].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250218172500.807733-1-tabba@google.com/
[2] https://lore.kernel.org/all/20250117163001.2326672-1-tabba@google.com/
[3] https://lore.kernel.org/all/20250129172320.950523-1-tabba@google.com/
[4] https://android-kvm.googlesource.com/kvmtool/+/refs/heads/tabba/guestmem-6.14

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

 arch/arm64/include/asm/kvm_host.h             |  10 ++
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/mmu.c                          |  76 ++++++++-----
 arch/x86/include/asm/kvm_host.h               |   5 +
 arch/x86/kvm/Kconfig                          |   3 +-
 include/linux/kvm_host.h                      |  26 ++++-
 include/linux/page-flags.h                    |  31 ++++++
 include/uapi/linux/kvm.h                      |   1 +
 mm/debug.c                                    |   1 +
 mm/swap.c                                     |  32 +++++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  |  75 ++++++++++++-
 virt/kvm/Kconfig                              |   5 +
 virt/kvm/guest_memfd.c                        | 105 ++++++++++++++++++
 virt/kvm/kvm_main.c                           |   9 +-
 15 files changed, 335 insertions(+), 46 deletions(-)


base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
-- 
2.48.1.711.g2feabab25a-goog


