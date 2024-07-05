Return-Path: <linux-arm-msm+bounces-25318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BAF928101
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 05:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C4CD282C06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 03:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A021F175BE;
	Fri,  5 Jul 2024 03:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKuRjaV7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFE0101F2
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 03:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720151053; cv=none; b=bDfdCG2LikUT13QkRT3hjOu1ShNvy0zvVAGQfru7tcVTciFY/371bAiD1SCA5KYdRWo+A1dTiyZnz7t/M0IB4E7+r0FB2orcz0WO4n5nJ2zkDVkp8d9USmrDqTUJmysJWbRc7ZafyYveqgwzRNxDRuW6KU9lPGnGvUOq5KMGZFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720151053; c=relaxed/simple;
	bh=KFHYjq5IV9E5+ewoxycafpWUC2+leBNfaqEcTS6nnOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wa42KNgf3J4soM3xHEm88DU19IFnHLXBhw2xU5c2aTFWeR5tVIDinkn6YW4AqUWtBcC9CItSLTWmXvAwu2QAM1eqO8V4svkgGrNx3oc1MSMSPRZNU3cWxAJ5zntoApcj/qZKNQymKKuLuwxnEwlLXce6mOEAn8BgbmAPNwf4K+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKuRjaV7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207AAC116B1;
	Fri,  5 Jul 2024 03:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720151053;
	bh=KFHYjq5IV9E5+ewoxycafpWUC2+leBNfaqEcTS6nnOg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=MKuRjaV779ysM+zTbWZ2hulUKqdyoV2067YC9XoXvY+2IfjvIkMq1B3+VYYJcQBsO
	 Cv2Q00DTAAYVXtqStGo80zKIizwgj//CoMe9dpl67fP7d4UJFIWYUI2KlfIkGknHZH
	 /Cdxjp9nGfHaxXoTWslI4HrZeUbIZSfaKJaccb5+NLswpTfsGcosjzZ+0GZSiruZ0c
	 5w9AHL++Axv6zWPjXqNPlYqJT5bwekSGxGH61MB734soLNVbn5DB8El9vqvcyJmbiO
	 Xi2k92uVQaq6l78jLO0kAuglTJ9Ap8sG9ZsMD8NnMkLz4An3X75mqUF8zGapX3MFXu
	 pgwN20B7F/wXg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Chris Lew <quic_clew@quicinc.com>,
	Connor Abbott <cwabbott0@gmail.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>
Subject: [GIT PULL] Qualcomm driver updates for v6.11
Date: Thu,  4 Jul 2024 22:44:09 -0500
Message-ID: <20240705034410.13968-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.11

for you to fetch changes up to e49380c155940cb47e291a4b3fcb7fdffee6aa4d:

  soc: qcom: smp2p: Use devname for interrupt descriptions (2024-07-01 22:31:14 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v6.11

Support for Shared Memory (shm) Bridge is added, which provides a
stricter interface for handling of buffers passed to TrustZone.

The X1Elite platform is added to uefisecapp allow list, to instantiate
the efivars implementation.

A new in-kernel implementation of the pd-mapper (or servreg) service is
introduced, to replace the userspace dependency for USB Type-C and
battery management.

Support for sharing interrupts across multiple bwmon instances is added,
and a refcount imbalance issue is corrected.

The LLCC support for recent platforms is corrected, and SA8775P support
is added.

A new interface is added to SMEM, to expose "feature codes". One example
of the usecase for this is to indicate to the GPU driver which
frequencies are available on the given device.

The interrupt consumer and provider side of SMP2P is updated to provide
more useful names in interrupt stats.

Support for using the mailbox binding and driver for outgoing IPC
interrupt in the SMSM driver is introduced.

socinfo driver learns about SDM670 and IPQ5321, as well as get some
updates to the X1E PMICs.

pmic_glink is bumped to now support managing 3 USB Type-C ports.

----------------------------------------------------------------
Abel Vesa (1):
      soc: qcom: pmic_glink: Increase max ports to 3

Bartosz Golaszewski (14):
      dt-bindings: firmware: qcom,scm: add memory-region for sa8775p
      firmware: qcom: add a dedicated TrustZone buffer allocator
      firmware: qcom: scm: enable the TZ mem allocator
      firmware: qcom: scm: smc: switch to using the SCM allocator
      firmware: qcom: scm: make qcom_scm_assign_mem() use the TZ allocator
      firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
      firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the TZ allocator
      firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ allocator
      firmware: qcom: qseecom: convert to using the TZ allocator
      firmware: qcom: scm: add support for SHM bridge operations
      firmware: qcom: tzmem: enable SHM Bridge support
      firmware: qcom: scm: add support for SHM bridge memory carveout
      firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
      firmware: qcom: tzmem: export devm_qcom_tzmem_pool_new()

Bjorn Andersson (3):
      firmware: qcom: uefisecapp: Allow on X1E devices
      Merge branch '20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com' into drivers-for-6.11
      Merge branch '20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org' into drivers-for-6.11

Chen Ni (1):
      soc: qcom: pmic_glink: Handle the return value of pmic_glink_init

Chris Lew (1):
      soc: qcom: smp2p: Use devname for interrupt descriptions

Connor Abbott (1):
      firmware: qcom: scm: Add gpu_init_regs call

Dmitry Baryshkov (5):
      soc: qcom: pdr: protect locator_addr with the main mutex
      soc: qcom: pdr: fix parsing of domains lists
      soc: qcom: pdr: extract PDR message marshalling data
      soc: qcom: add pd-mapper implementation
      soc: qcom: add missing pd-mapper dependencies

Jeff Johnson (1):
      soc: qcom: spm: add missing MODULE_DESCRIPTION()

Kathiravan Thirumoorthy (3):
      dt-bindings: arm: qcom,ids: Add SoC ID for IPQ5321
      soc: qcom: socinfo: Add SoC ID for IPQ5321
      cpufreq: qcom-nvmem: add support for IPQ5321

Konrad Dybcio (3):
      soc: qcom: socinfo: Update X1E PMICs
      soc: qcom: Move some socinfo defines to the header
      soc: qcom: smem: Add a feature code getter

Luca Weiss (4):
      dt-bindings: soc: qcom,smp2p: Mark qcom,ipc as deprecated
      dt-bindings: soc: qcom,smsm: Allow specifying mboxes instead of qcom,ipc
      soc: qcom: smsm: Support using mailbox interface
      soc: qcom: smsm: Add missing mailbox dependency to Kconfig

Richard Acayan (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SDM670
      soc: qcom: socinfo: Add SDM670 SoC ID table entry

Rohit Agarwal (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the SDX75 AOSS channel

Sibi Sankar (4):
      soc: qcom: icc-bwmon: Fix refcount imbalance seen during bwmon_remove
      dt-bindings: interconnect: qcom,msm8998-bwmon: Remove opp-table from the required list
      dt-bindings: interconnect: qcom,msm8998-bwmon: Add X1E80100 BWMON instances
      soc: qcom: icc-bwmon: Allow for interrupts to be shared across instances

Stephen Boyd (1):
      soc: qcom: rpmh-rsc: Ensure irqs aren't disabled by rpmh_rsc_send_data() callers

Tengfei Fan (2):
      dt-bindings: cache: qcom,llcc: Add SA8775p description
      soc: qcom: llcc: Add llcc configuration support for the SA8775p platform

Unnathi Chalicheemala (3):
      firmware: qcom-scm: Remove QCOM_SMC_WAITQ_FLAG_WAKE_ALL
      dt-bindings: arm: msm: Add llcc Broadcast_AND register
      soc: qcom: llcc: Add regmap for Broadcast_AND region

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  55 +-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |  15 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   3 +-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../devicetree/bindings/soc/qcom/qcom,smp2p.yaml   |   3 +-
 .../devicetree/bindings/soc/qcom/qcom,smsm.yaml    |  30 +-
 MAINTAINERS                                        |   8 +
 drivers/cpufreq/qcom-cpufreq-nvmem.c               |   1 +
 drivers/firmware/qcom/Kconfig                      |  31 +
 drivers/firmware/qcom/Makefile                     |   1 +
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c    | 256 +++-----
 drivers/firmware/qcom/qcom_scm-smc.c               |  30 +-
 drivers/firmware/qcom/qcom_scm.c                   | 197 ++++--
 drivers/firmware/qcom/qcom_scm.h                   |   9 +
 drivers/firmware/qcom/qcom_tzmem.c                 | 467 ++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.h                 |  13 +
 drivers/soc/qcom/Kconfig                           |  18 +
 drivers/soc/qcom/Makefile                          |   2 +
 drivers/soc/qcom/icc-bwmon.c                       |  16 +-
 drivers/soc/qcom/llcc-qcom.c                       |  51 +-
 drivers/soc/qcom/pdr_interface.c                   |   8 +-
 drivers/soc/qcom/pdr_internal.h                    | 318 +---------
 drivers/soc/qcom/pmic_glink.c                      |  13 +-
 drivers/soc/qcom/pmic_glink_altmode.c              |   2 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  | 677 +++++++++++++++++++++
 drivers/soc/qcom/qcom_pdr_msg.c                    | 353 +++++++++++
 drivers/soc/qcom/rpmh-rsc.c                        |   7 +-
 drivers/soc/qcom/rpmh.c                            |   1 -
 drivers/soc/qcom/smem.c                            |  33 +
 drivers/soc/qcom/smp2p.c                           |  11 +-
 drivers/soc/qcom/smsm.c                            |  51 +-
 drivers/soc/qcom/socinfo.c                         |  13 +-
 drivers/soc/qcom/spm.c                             |   1 +
 include/dt-bindings/arm/qcom,ids.h                 |   2 +
 include/linux/firmware/qcom/qcom_qseecom.h         |   8 +-
 include/linux/firmware/qcom/qcom_scm.h             |  37 +-
 include/linux/firmware/qcom/qcom_tzmem.h           |  56 ++
 include/linux/soc/qcom/llcc-qcom.h                 |   4 +-
 include/linux/soc/qcom/smem.h                      |   1 +
 include/linux/soc/qcom/socinfo.h                   |  34 ++
 40 files changed, 2266 insertions(+), 571 deletions(-)
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.c
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.h
 create mode 100644 drivers/soc/qcom/qcom_pd_mapper.c
 create mode 100644 drivers/soc/qcom/qcom_pdr_msg.c
 create mode 100644 include/linux/firmware/qcom/qcom_tzmem.h

