Return-Path: <linux-arm-msm+bounces-29504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0217495F46C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 16:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 740331F2234F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 14:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DC3189B9B;
	Mon, 26 Aug 2024 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bw2y0gQH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F51A189506
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683932; cv=none; b=bSYqmDcoQjAwHF9ohQo0wuO7s3/SVSmsG4r23QQszO5fcDC71vGTDaxFUxrE5Gzkby2490zKWmdqqcLa/j03QYZP4vf5QYzkbuzm9u0J5yQ7wJSvTW0Cx1VM5ZnMudFLazP1tTDdM41kPub6yF7gBZbTQFGyfjR3klt6hWsxYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683932; c=relaxed/simple;
	bh=3qDAuzVhQbt9+Jfd9ZZ7QkhWRIPzbTN/j1RwVsmTv5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iffrEwJy+Po9rBwVvXhC9L7jd0ORB0N9OSO89sPUeEDOd6C1fKhK2ZThZH9Z8itKI54oUdI7c3F85uCEMH7ac7yCr3PdORIh127vHOnGE8+DYqYGl86ULsviQQWjVMBnoxOj8aoTFWLdin93LxqL676jubqGJhd8O1HjxQP8epc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bw2y0gQH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A92C52FD6;
	Mon, 26 Aug 2024 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683931;
	bh=3qDAuzVhQbt9+Jfd9ZZ7QkhWRIPzbTN/j1RwVsmTv5A=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Bw2y0gQHTbM/OazPSRnoBxAjZCvKThAmieYxrSoEKKU47Vu0VVaLIQL7I7GKCrARY
	 7aeI44kMd5btWMF0CbYAC4CHAM2H8NBJQC2ozDGXAkYD9FiJTn215dAcNCdFDiLK8v
	 KSIOp3s3htHWJWSkOufXCYw6r7ZSdduCZ/lslrN8+W3T6ewiXCgcVyTr65uCU3AxDD
	 altJF0OfQyHxfNFFX0vE9hcJu6bPqlTlkEspn40aIikhK++q6o6Jb9IqO13BvYfHzA
	 xEtExyY0acYGQM5jxAOcwEB/AodAJTxALW4B7MzGdj7OkZq+AQzXBjYZfOWFrutGbl
	 saYKHCQeIYHEg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Murali Nalajala <quic_mnalajal@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [GIT PULL] Qualcomm driver fixes for v6.11
Date: Mon, 26 Aug 2024 09:52:08 -0500
Message-ID: <20240826145209.1646159-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.11

for you to fetch changes up to c158ceb826068a8bbe3c9e78df420f47ba53c8a8:

  soc: qcom: pd-mapper: Fix singleton refcount (2024-08-21 09:50:48 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v6.11

This corrects the tzmem virt-to-phys conversion, which caused issues for
the uefisecapp implementation of EFI variable access. SDM670 is excluded
from tzmem usage due to reported issues.

The SCM get wait queue context call is corrected to be marked ATOMIC and
some dead code in qseecom, following the tzmem conversion, is removed.

The memory backing command DB is remapped writecombined, to avoid XPU
violations when Linux runs without the Qualcomm hypervisor.

Two compile fixes are added for pd-mapper, and the broken reference
count is corrected, to make pd-mapper deal with remoteprocs going away.

In pmic_glink a race condition where the client callbacks might be
called before we returned the client handle is corrected. The broken conditions
for when to signal that the firmware is going down is also corrected.

In the pmic_glink UCSI driver, the ucsi_unregister() is moved out of the
pdr callback, as this is being invoked in atomic context.

Konrad's email address is updated in MAINTAINERS, and related mailmap
entries are added.

----------------------------------------------------------------
Andrew Halaney (1):
      soc: qcom: pd-mapper: Depend on ARCH_QCOM || COMPILE_TEST

Arnd Bergmann (1):
      soc: qcom: pd-mapper: mark qcom_pdm_domains as __maybe_unused

Bartosz Golaszewski (2):
      firmware: qcom: tzmem: fix virtual-to-physical address conversion
      firmware: qcom: qseecom: remove unused functions

Bjorn Andersson (4):
      soc: qcom: pmic_glink: Fix race during initialization
      usb: typec: ucsi: Move unregister out of atomic section
      soc: qcom: pmic_glink: Actually communicate when remote goes down
      soc: qcom: pd-mapper: Fix singleton refcount

Konrad Dybcio (2):
      mailmap: Add an entry for Konrad Dybcio
      MAINTAINERS: Update Konrad Dybcio's email address

Murali Nalajala (1):
      firmware: qcom: scm: Mark get_wq_ctx() as atomic call

Richard Acayan (1):
      firmware: qcom: tzmem: disable sdm670 platform

Volodymyr Babchuk (1):
      soc: qcom: cmd-db: Map shared memory as WC, not WB

 .mailmap                                   |  2 ++
 MAINTAINERS                                |  6 ++--
 drivers/firmware/qcom/qcom_scm-smc.c       |  2 +-
 drivers/firmware/qcom/qcom_tzmem.c         | 33 ++++++++++++++--------
 drivers/power/supply/qcom_battmgr.c        | 16 +++++++----
 drivers/soc/qcom/Kconfig                   |  2 +-
 drivers/soc/qcom/cmd-db.c                  |  2 +-
 drivers/soc/qcom/pmic_glink.c              | 40 ++++++++++++++++++--------
 drivers/soc/qcom/pmic_glink_altmode.c      | 17 +++++++----
 drivers/soc/qcom/qcom_pd_mapper.c          |  4 ++-
 drivers/usb/typec/ucsi/ucsi_glink.c        | 43 ++++++++++++++++++++--------
 include/linux/firmware/qcom/qcom_qseecom.h | 45 ------------------------------
 include/linux/soc/qcom/pmic_glink.h        | 11 ++++----
 13 files changed, 120 insertions(+), 103 deletions(-)

