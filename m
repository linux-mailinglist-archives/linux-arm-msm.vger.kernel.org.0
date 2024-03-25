Return-Path: <linux-arm-msm+bounces-14979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8941488A3EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC8391C3A821
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 14:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E05F18146D;
	Mon, 25 Mar 2024 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JpVBnGXX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D826181812
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711361048; cv=none; b=cyS0iwERqp/RY97Z+yRvsNMGxvCpBbdulna33znaZagdKKzHfhlKY7Y1V09PFwkBQpRM4akL0OVbvp3st74c8bb6Okf+D11+3RR3ZtT1yllDZDy/FcUwpqmjjeUrah7mE+O+bunPXuHJpeCxHPP5hpbc1J8bwJ4FjJNKfQ7FSvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711361048; c=relaxed/simple;
	bh=MfTLVwBpHmT3NhU5IyU2HA2DGd9BDnhPRzctKeGkWdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tgskOR0ayV+S1xhT8o6rL/NkWmZRawPYSiLToYR2B3EQr1pAj9a/vc0na7NqCF4nLFiIvfWPJYHItOxhk9dYZRvbVlwQ5hwmOrYCUNRbFbr4CXVPVa3jAc0vJSHSq6t2B2p1CDVvGKfIdCNTpIGdO7pDRSWRBYnyJXyzoz6w9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JpVBnGXX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-341c7c8adf3so969625f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711361044; x=1711965844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sodtg05G0+kvZkJVm8IsH+PblHBiK83uT7JTQwgljWI=;
        b=JpVBnGXX8Kns4ZaR5LwA5sLy4ES4iGLJHt+AhnGL2s4tJt/VGOkAW/5JGiKqfO/65g
         +8IT0ujtMFbS3TWEY0fiTi6qFh0fA70eAppEn/g1znNUFYq5aIfGSHC5elFV3j2u0t3s
         N8E8dcFMXp9yuWBhrI1paXCGOD2R5Y1wykSsSBaj8Q0lp5g/hR5DZ2sPuT4hLTa/t793
         NkmEv1LGbSBueawBRzNyqNdrcmUEI4eFz6P6eIezMb1iHsRNB3n1eE2q6DrEKVIdZtz8
         d4JNoZh57rlNSp6uWbnz/JLIIdA/vArRc9bEYCGP7vB7p/EpeQaF8ALQ6MqtrjTy7ijX
         8m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361044; x=1711965844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sodtg05G0+kvZkJVm8IsH+PblHBiK83uT7JTQwgljWI=;
        b=XGejmgsMawxIBwsK9J07/SNIy4+16IGwSLOnyZ/ntUPrfa+w49Cx4L8/lVyisQaXRl
         Uwc/KwGewlhA6wZ+FEJqY1wmDlm/sKyrDe1SYvbU1sW0D7H5VIrlQuyVnqsmkaDtYNzu
         QauBuOBgDJ1GpJpHsLTtR6almnzV8XhaspEerGkELu3Ji2QcVmLJhZDWaGhbPQ9rQqE6
         De2gwXQdkkYoCpPhrJAupZCCNKoaPwJpoEnq6u7zVOFK/8+4ClJrxCTfm6UOPPf7dRdf
         DBgsaq4f/YtRjWCKVUKrP093VjyBguwqqaopwMtXEqffZB7sgYKh/+DzHPt4TRXFpTdS
         icdA==
X-Gm-Message-State: AOJu0YzySiU/WYmp+AVkjpcdMMj9oyCHEA+mJrQzIaGwlcVlC1w9TOtv
	6DhmZZfbtK5KgzwRtOTQ7NF7PC5wFEtkGyGYFELxyFzxYcTn4AWwFGdj3Zv1wP0=
X-Google-Smtp-Source: AGHT+IH9hNJMfuKzvyPHJBrng5Xrl9wYKvbD96GFL2/KXJNt3vhICaZtozKnmZTUp0Yy1nmHR4e1Sg==
X-Received: by 2002:a5d:4612:0:b0:33e:7f51:c2f7 with SMTP id t18-20020a5d4612000000b0033e7f51c2f7mr3962132wrq.52.1711361044516;
        Mon, 25 Mar 2024 03:04:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id dv13-20020a0560000d8d00b0033e25c39ac3sm9086874wrb.80.2024.03.25.03.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:04:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v9 00/13] firmware: qcom: qseecom: convert to using the TZ allocator
Date: Mon, 25 Mar 2024 11:03:46 +0100
Message-Id: <20240325100359.17001-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

SCM calls that take memory buffers as arguments require that they be
page-aligned, physically continuous and non-cachable. The same
requirements apply to the buffer used to pass additional arguments to SCM
calls that take more than 4.

To that end drivers typically use dma_alloc_coherent() to allocate memory
of suitable format which is slow and inefficient space-wise.

SHM Bridge is a safety mechanism that - once enabled - will only allow
passing buffers to the TrustZone that have been explicitly marked as
shared. It improves the overall system safety with SCM calls and is
required by the upcoming scminvoke functionality.

The end goal of this series is to enable SHM bridge support for those
architectures that support it but to that end we first need to unify the
way memory for SCM calls is allocated. This in itself is beneficial as
the current approach of using dma_alloc_coherent() in most places is quite
slow.

First let's add a new TZ Memory allocator that allows users to create
dynamic memory pools of format suitable for sharing with the TrustZone.
Make it ready for implementing multiple build-time modes.

Convert all relevant drivers to using it. Add separate pools for SCM core
and for qseecom.

Finally add support for SHM bridge and make it the default mode of
operation with the generic allocator as fallback for the platforms that
don't support SHM bridge.

Tested on db410c, RB5, sm8550-qrd. Previous iteration tested also on
sa8775p-ride and lenovo X13s (please do retest on those platforms if you
can).

v8 -> v9:
- split the qseecom driver rework into two parts: first convert it to using
  the __free() helper and then make it switch to tzmem
- use QCOM_SCM_PERM_RW instead of (QCOM_SCM_PERM_WRITE | QCOM_SCM_PERM_READ)
- add the TZMEM MAINTAINERS entry in correct alphabetical order
- add a missing break; in a switch case in the tzmem module

v7 -> v8:
- make the pool size dynamic and add different policies for pool growth
- improve commit messages and the cover letter: describe what the SHM
  bridge is and why do we need it and the new allocator, explain why it's
  useful to merge these changes already, independently from scminvoke
- improve kerneldoc format
- improve the comment on the PIL SCM calls
- fix license tags, drop "or-later" for GPL v2
- add lockdep and sleeping asserts
- minor tweaks and improvements

v6 -> v7:
- fix a Kconfig issue: TZMEM must select GENERIC_ALLOCATOR

v5 -> v6:
Fixed two issues reported by autobuilders:
- add a fix for memory leaks in the qseecom driver as the first patch for
  easier backporting to the v6.6.y branch
- explicitly cast the bus address stored in a variable of type dma_addr_t
  to phys_addr_t expected by the genpool API

v4 -> v5:
- fix the return value from qcom_tzmem_init() if SHM Bridge is not supported
- remove a comment that's no longer useful
- collect tags

v3 -> v4:
- include linux/sizes.h for SZ_X macros
- use dedicated RCU APIs to dereference radix tree slots
- fix kerneldocs
- fix the comment in patch 14/15: it's the hypervisor, not the TrustZone
  that creates the SHM bridge

v2 -> v3:
- restore pool management and use separate pools for different users
- don't use the new allocator in qcom_scm_pas_init_image() as the
  TrustZone will create an SHM bridge for us here
- rewrite the entire series again for most part

v1 -> v2:
- too many changes to list, it's a complete rewrite as explained above

Bartosz Golaszewski (13):
  firmware: qcom: add a dedicated TrustZone buffer allocator
  firmware: qcom: scm: enable the TZ mem allocator
  firmware: qcom: scm: smc: switch to using the SCM allocator
  firmware: qcom: scm: make qcom_scm_assign_mem() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ
    allocator
  firmware: qcom: qseecom: convert to using the cleanup helpers
  firmware: qcom: qseecom: convert to using the TZ allocator
  firmware: qcom: scm: add support for SHM bridge operations
  firmware: qcom: tzmem: enable SHM Bridge support
  firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
  arm64: defconfig: enable SHM Bridge support for the TZ memory
    allocator

 MAINTAINERS                                   |   8 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/firmware/qcom/Kconfig                 |  31 ++
 drivers/firmware/qcom/Makefile                |   1 +
 .../firmware/qcom/qcom_qseecom_uefisecapp.c   | 285 ++++-------
 drivers/firmware/qcom/qcom_scm-smc.c          |  30 +-
 drivers/firmware/qcom/qcom_scm.c              | 182 ++++---
 drivers/firmware/qcom/qcom_scm.h              |   6 +
 drivers/firmware/qcom/qcom_tzmem.c            | 455 ++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.h            |  13 +
 include/linux/firmware/qcom/qcom_qseecom.h    |   4 +-
 include/linux/firmware/qcom/qcom_scm.h        |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h      |  56 +++
 13 files changed, 813 insertions(+), 265 deletions(-)
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.c
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.h
 create mode 100644 include/linux/firmware/qcom/qcom_tzmem.h

-- 
2.40.1


