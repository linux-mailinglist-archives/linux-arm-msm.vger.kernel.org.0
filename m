Return-Path: <linux-arm-msm+bounces-55405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93643A9B04F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C01EF4A3CB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2EA11A83E2;
	Thu, 24 Apr 2025 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L30fUIYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799219DF53
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504029; cv=none; b=AWbjNyEj/pCZ4mP/SRs+juVts045j6pWw93mXmON9KXqJeSZa0dpju+l58HlTjQAlI+QdZmAt5Q44vgaLEuaHIbot87QJf/RusWCNOkWEDazXgJYffS2BgQiTTNtIQch0oD2Oul//GuS2JzxxQboBqzyvYGLYb2R422el0NLNPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504029; c=relaxed/simple;
	bh=gE5B+DRuvYdm1Xx80LASYKx8JQnPdEVc7dWEXx/LEcw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=GjWqdF1+Wxywf3J2xq5WWrUVcVTYLaqeZ2hNGjiszq0ShFq021Gj3khxZC6QzuO/NCUTlejd89N0ptBxkpr6yG64jw09KepQ0odtZQzzW+n8/rV8YzrTzdo0HT0ThZepuaDDTQs/+NnpNREGfNDhdp1zXuT+V3AZh+enS729YUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L30fUIYb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso912027f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504025; x=1746108825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Gp3+Ahd9oztFC0Ee90Z+LBETEK7lh7obhrs3g0E+vA=;
        b=L30fUIYb5JBN77jCSMwgyW5pKUwPqUM4yzfK8KF1xgSViaHtNmTFByb/Xrw22XVTol
         OhNIBDAjhDqFQoFFbUOo/9MV2kx0iC5Zwb/kYO4CWG2YFyTspcbJ3zq+D8s393xt8TNP
         lOb8BXDv8XiK9aHG1j6brRnyMulh9TmXmQt5Ggx+NM3QDsW1u9UnMDQgMS0dVywh6uQL
         I7Nslb69i/TLlBemvu/3YYL2vI3yXR8t4N9r+IrVMGbRFLqXrvqZF11pk0TkqUade2T7
         sDJ+Y3K2v6GPCwyCntKP0LorzPsJWQDtLEFX3vfOjNaZxB0nSUnzflSyzyTHihzkv6wX
         JjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504025; x=1746108825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Gp3+Ahd9oztFC0Ee90Z+LBETEK7lh7obhrs3g0E+vA=;
        b=IwYfA/wtTwMLWKTKYIQM7Kwbc/tYY/CpB9nxg6rkgASMzGirhAWrwL5yLbij0uBz7J
         nH5H7xFTWd50hLI7zZw5Uq/FtHOmd6gJXAlLuSGmLX9dzJfG0BiTDLZJeJVevMOgYsGP
         YLuV9EW8MBCGR0IipnR4xmsOSNrWy6cqSlmapuGUQRa9Mmk9WIYvtfH8HYp0rMT30eC9
         qPxpG+11+OWxiDGEiIBQlGSuFfe6E1bH6HSE1l34CP5H6w3w3aJYXpV9Jsd/t+KqykfT
         Cm9t0vXG6wEPU5s/MUWw762A7tcZWhf4GZdyrAv1GOssnpLXjw11rN7Ie1BVByPI81PJ
         WrRg==
X-Forwarded-Encrypted: i=1; AJvYcCVy9R/Ev5uotmUwjGXNNzNaqqSk4H0/BHMW8+LFIsZ3Os9WMvsmT87MvFtbm26+xK07u0ESiDpa/ubJujxp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzznlpk8AOiDZqUFFcToKEIuBh1o58c9BcO8kJUvet1Uqq4L3IX
	e43FRpdv+h+VAtniqaYnW8MLCUWAENARTpjS/39MlTJfW8mEnYZfCXONPZP1gM4=
X-Gm-Gg: ASbGncsSpt1JGn5VLrsk1Lqtv6gTxidfADSaVpYNfw8EGCnhoLwZhy0ZZWpuVRQAP0g
	JRUyZL3Q5a+oDfT2FqhoBvYyy6H6TdBqDSsQznsmY7qzWp/JdVtb4pgHvlV+QNTsZJ3JPb0uMNC
	avvaJDACTXC0OZrNsEOwhoTkrlRJT7TNZKTfmb3oU1ZdCFelz3KmNeAR3AM+YM4Q7Xp68ftWjb9
	5NY0qpcBqtrMbC+Ld8mE0q8immlH2UesQo4CrcJiy1gRhG1ZpwBmgfTQQLzAY0VHlaTJbQPYAap
	Iv6QuWVCasMwMTVwNk1Yk9vLJUkn/MngQ8qzq4JrqNxfq4LGAcu6PjCIvWwxEUWoBR6+qJKZrhY
	REejipF+ZyAlX0Jbs
X-Google-Smtp-Source: AGHT+IG84/KbH73HJzgia5gWQQPbSCf6KDXX629rg6dbolYAjXdYgdIHXLTmBvWlH/T2NybxvuuICA==
X-Received: by 2002:a05:6000:4304:b0:39c:1257:cd40 with SMTP id ffacd0b85a97d-3a06cfb31damr2275855f8f.58.1745504025160;
        Thu, 24 Apr 2025 07:13:45 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:44 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 00/34] Running Qualcomm's Gunyah Guests via KVM in EL1
Date: Thu, 24 Apr 2025 15:13:07 +0100
Message-Id: <20250424141341.841734-1-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series introduces the capability of running Gunyah guests via KVM on
Qualcomm SoCs shipped with Gunyah hypervisor [1] (e.g. RB3 Gen2).

The goal of this work is to port the existing Gunyah hypervisor support from a
standalone driver interface [2] to KVM, with the aim of leveraging as much of the
existing KVM infrastructure as possible to reduce duplication of effort around
memory management (e.g. guest_memfd), irqfd, and other core components.

In short, Gunyah is a Type-1 hypervisor, meaning that it runs independently of any
high-level OS kernel such as Linux and runs in a higher CPU privilege level than VMs.
Gunyah is shipped as firmware and guests typically talk with Gunyah via hypercalls.
KVM is designed to run as Type-2 hypervisor. This port allows KVM to run in EL1 and
serve as the interface for VM lifecycle management,while offloading virtualization
to Gunyah.

This series is heavily based on previous work from Elliot Berman and others,
available at:
https://lore.kernel.org/lkml/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/

Many commits in this series are identical to or derived from previous work. To
preserve authorship and attribution, original `Author:` and `Signed-off-by:` tags
have been retained where appropriate, and occasionally `Reviewed-by:` lines were
kept as well.

While this series builds on much of the original Gunyah implementation, it drops
certain parts in favor of existing upstream features:
  - `gunyah_memfd` is dropped (currently using pinned anonymous pages — see below).
  - `gunyah_irqfd` is dropped in favor of KVM's irqfd.
  - Resource management, vCPU creation, and VM lifecycle are integrated directly
    into KVM’s architecture hooks.

At this stage, the port is functional but still **work in progress**. Notably:
  - Memory for guests is currently backed by **pinned anonymous pages**. This is a
    temporary solution: we intend to migrate to `guest_memfd`.
  - Memory compaction or swap must be avoided for now, as pages donated to Gunyah
    are no longer accessible from the host once mapped into the guest.
  - SMP boot is not available at the moment because Gunyah does not yet
    forward PSCI hypercalls to the host.
  - Virtio is not supported yet.

There is a lot of room for performance improvment. For example, ATM.
there is a lot of privilege level switching between EL1, EL2 (and
possible EL3). As well as context swicthing between guest kernel space
and guest userspace. For those interested, I have a compiled some slides
here to summarise the issues:
https://docs.google.com/presentation/d/1fL1TM1oxBrWFSL8KKw4jQtMDh7NOvyqbWWVu8iQxvoI/edit?usp=sharing

To test the port, a modified version of Qemu is needed. A version can be
found here:
https://github.com/karim-manaouil/qemu-for-gunyah

The series is based on linux-next as of today. A git tree is also
available here (gunyah-kvm branch):
https://github.com/karim-manaouil/linux-next

To test the guest, run (with the modified qemu):
./qemu-system-aarch64 \
	-enable-kvm \
	-machine virt,highmem=off \
	-cpu host \
	-smp 1 \
	-m 1G \
	-nographic \
	-kernel Image \
	-initrd initrd.img \
	-append "console=ttyAMA0 earlycon rdinit=/bin/sh"

Feedback Welcome!

[1] https://www.qualcomm.com/developer/blog/2024/08/learn-about-gunyah--qualcomm-s-open-source--lightweight-hypervis
[2] https://lore.kernel.org/lkml/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/

Elliot Berman (20):
  docs: gunyah: Introduce Gunyah Hypervisor
  dt-bindings: Add binding for gunyah hypervisor
  gunyah: Common types and error codes for Gunyah hypercalls
  gunyah: Add hypercalls to identify Gunyah
  gunyah: Add hypervisor driver
  gunyah: Add hypercalls to send and receive messages
  gunyah: Add resource manager RPC core
  gunyah: Add VM lifecycle RPC
  gunyah: Translate gh_rm_hyp_resource into gunyah_resource
  gunyah: Add resource tickets
  gunyah: Add hypercalls for running a vCPU
  gunyah: Add hypercalls for demand paging
  gunyah: Add memory parcel RPC
  gunyah: Add interfaces to map memory into guest address space
  gunyah: Add platform ops on mem_lend/mem_reclaim
  gunyah: Add Qualcomm Gunyah platform ops
  gunyah: Share guest VM dtb configuration to Gunyah
  gunyah: Add RPC to enable demand paging
  gunyah: Add RPC to set VM boot context
  gunyah: Add hypercalls for sending doorbell

Karim Manaouil (14):
  KVM: Allow arch-specific vCPU allocation and freeing
  KVM: irqfd: Add architecture hooks for irqfd allocation and
    initialization
  KVM: irqfd: Allow KVM backends to override IRQ injection via set_irq
    callback
  KVM: Add weak stubs for irqchip-related functions for Gunyah builds
  KVM: Add KVM_SET_DTB_ADDRESS ioctl to pass guest DTB address from
    userspace
  KVM: gunyah: Add initial Gunyah backend support
  KVM: gunyah: Pin guest memory
  gunyah: Add basic VM lifecycle management
  gunyah: add proxy-scheduled vCPUs
  gunyah: Share memory parcels
  gunyah: Enable demand paging
  gunyah: allow userspace to set boot cpu context
  KVM: gunyah: Implement irqfd interface
  KVM: gunyah: enable KVM for Gunyah

 .../bindings/firmware/gunyah-hypervisor.yaml  |   82 +
 Documentation/virt/gunyah/index.rst           |  135 ++
 Documentation/virt/gunyah/message-queue.rst   |   68 +
 Documentation/virt/index.rst                  |    1 +
 arch/arm64/Kbuild                             |    1 +
 arch/arm64/gunyah/Makefile                    |    3 +
 arch/arm64/gunyah/gunyah_hypercall.c          |  279 +++
 arch/arm64/include/asm/gunyah.h               |   57 +
 arch/arm64/include/asm/kvm_host.h             |   10 +-
 arch/arm64/include/asm/virt.h                 |    7 +
 arch/arm64/kernel/cpufeature.c                |    4 +
 arch/arm64/kernel/image-vars.h                |    2 +-
 arch/arm64/kvm/Kconfig                        |   22 +-
 arch/arm64/kvm/Makefile                       |   14 +-
 arch/arm64/kvm/gunyah.c                       | 2085 +++++++++++++++++
 drivers/virt/Kconfig                          |    2 +
 drivers/virt/Makefile                         |    1 +
 drivers/virt/gunyah/Kconfig                   |   29 +
 drivers/virt/gunyah/Makefile                  |    7 +
 drivers/virt/gunyah/gunyah.c                  |   55 +
 drivers/virt/gunyah/gunyah_platform_hooks.c   |  117 +
 drivers/virt/gunyah/gunyah_qcom.c             |  220 ++
 drivers/virt/gunyah/rsc_mgr.c                 |  792 +++++++
 drivers/virt/gunyah/rsc_mgr_rpc.c             |  572 +++++
 include/kvm/arm_pmu.h                         |    2 +-
 include/linux/gunyah.h                        |  425 ++++
 include/linux/gunyah_rsc_mgr.h                |  182 ++
 include/linux/irqchip/arm-vgic-info.h         |    2 +-
 include/linux/kvm_host.h                      |    3 +
 include/linux/kvm_irqfd.h                     |    5 +
 include/linux/perf/arm_pmu.h                  |    2 +-
 include/uapi/linux/kvm.h                      |   14 +-
 virt/kvm/eventfd.c                            |   56 +-
 virt/kvm/kvm_main.c                           |   24 +-
 34 files changed, 5258 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
 create mode 100644 Documentation/virt/gunyah/index.rst
 create mode 100644 Documentation/virt/gunyah/message-queue.rst
 create mode 100644 arch/arm64/gunyah/Makefile
 create mode 100644 arch/arm64/gunyah/gunyah_hypercall.c
 create mode 100644 arch/arm64/include/asm/gunyah.h
 create mode 100644 arch/arm64/kvm/gunyah.c
 create mode 100644 drivers/virt/gunyah/Kconfig
 create mode 100644 drivers/virt/gunyah/Makefile
 create mode 100644 drivers/virt/gunyah/gunyah.c
 create mode 100644 drivers/virt/gunyah/gunyah_platform_hooks.c
 create mode 100644 drivers/virt/gunyah/gunyah_qcom.c
 create mode 100644 drivers/virt/gunyah/rsc_mgr.c
 create mode 100644 drivers/virt/gunyah/rsc_mgr_rpc.c
 create mode 100644 include/linux/gunyah.h
 create mode 100644 include/linux/gunyah_rsc_mgr.h

-- 
2.39.5


