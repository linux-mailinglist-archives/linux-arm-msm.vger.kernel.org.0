Return-Path: <linux-arm-msm+bounces-5322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B72818068
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 05:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 163E31F24122
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 04:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEF6BE56;
	Tue, 19 Dec 2023 04:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUUoYeoA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732B9BE55
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 04:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58BCBC433C7;
	Tue, 19 Dec 2023 04:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702959274;
	bh=41+kIbGClEKEnIllVZStWXkP10z5VyX81cj9gkNXkIw=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=OUUoYeoANSzubj2uUP5vvWbCi/lT4oRVPjs7VE7aYkNJA/jy55Sf6Rf3zJ3a+oCCE
	 rogHeuknYDK7mxOAqr0lkOK+y5xHn2NcQhpoGmposVNOnlSPUETJIBdvH8tm2sv5ir
	 pouV5SwXFVOkiB/2WmlIe1eHR9Tm8dCrQRFqVX5d+unx2F8zMnHDzPB7VGB7HmMpps
	 5Z5T06xvSRMHtEGVgWZdmQoP5RJ3rvtkX+ZYWs6Xx920IuaIyLHM0w662Yh/RVe4hP
	 eylET/jewcNuW9xPZAMnEGLzqzmyEZR1HrZQwR5/0XJCYGPIsiZYfzLPbXpXewfN8D
	 vooggo8aZ28tw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Atul Dhudase <quic_adhudase@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dang Huynh <danct12@riseup.net>,
	Ghanshyam Agrawal <ghanshyam1898@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Naman Jain <quic_namajain@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.8
Date: Mon, 18 Dec 2023 20:18:54 -0800
Message-ID: <20231219041855.732578-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.8

for you to fetch changes up to 110cb8d861cc1a040cdab495b22ac436c49d1454:

  soc: qcom: llcc: Fix LLCC_TRP_ATTR2_CFGn offset (2023-12-18 21:29:23 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v6.8

Support for SM8650 and X1E is added to the LLCC driver, the
LLCC_TRP_ATTR2_CFGn register stride is corrected, and a bug where for
each iteration looping over slices previous settings for dis_cap_alloc
and retain_on_pc are overwritten.

A quirk is introduced in UCSI, for implementations that does not handle
UCSI_GET_PDOS for non-PD partners. With this, USCI support is enabled by
default in pmic_glink. It is later reverted for SC8280XP due reported
errors.

A few memory leaks in error paths of qseecom are taken care of.

A small driver to expose the ADSP PDCharger ULOG debug log is
introduced, to aid debugging issues with pmic_glink.

The identiy of SM8650, PM8937 and a few DSPs are added to the Qualcomm
socinfo driver.

The Qualcomm sleep stats driver is extended to allow getting detailed
statistics about usage of various DDR states. Unfortunately this ABI
does not seem to be stable across platforms, so this addition is dropped
again while the reported problems are investigated further.

Andy is moved from MAINTAINERS to CREDITS. Thank you, Andy.

----------------------------------------------------------------
Abel Vesa (3):
      soc: qcom: llcc: Add missing description for members in slice config
      dt-bindings: soc: qcom,aoss-qmp: document the X1E80100 Always-On Subsystem side channel
      soc: qcom: llcc: Fix LLCC_TRP_ATTR2_CFGn offset

Andrew Halaney (3):
      soc: qcom: pmic_pdcharger_ulog: Search current directory for headers
      soc: qcom: pmic_pdcharger_ulog: Move TRACE_SYSTEM out of #if protection
      soc: qcom: pmic_pdcharger_ulog: Fix hypothetical ulog request message endianess

Arnd Bergmann (1):
      soc: qcom: stats: fix 64-bit division

Atul Dhudase (1):
      soc: qcom: llcc: Fix dis_cap_alloc and retain_on_pc configuration

Bartosz Golaszewski (1):
      firmware: qcom: qseecom: fix memory leaks in error paths

Bjorn Andersson (1):
      soc: qcom: stats: Express AOSS QMP module dependency

Dang Huynh (1):
      soc: qcom: socinfo: Add PM8937 Power IC

Dmitry Baryshkov (2):
      usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
      soc: qcom: pmic_glink: enable UCSI by default

Ghanshyam Agrawal (1):
      soc: qcom: llcc: Fix typo in kernel-doc

Johan Hovold (3):
      soc: qcom: pmic_glink_altmode: fix port sanity check
      soc: qcom: pmic_glink: disable UCSI on sc8280xp
      soc: qcom: pmic_glink: drop stray semicolons

Konrad Dybcio (4):
      dt-bindings: soc: qcom: stats: Add QMP handle
      soc: qcom: stats: Add DDR sleep stats
      dt-bindings: firmware: qcom,scm: Allow interconnect for everyone
      Revert "soc: qcom: stats: Add DDR sleep stats"

Krzysztof Kozlowski (1):
      MAINTAINERS: qcom: move Andy Gross to credits

Naman Jain (1):
      soc: qcom: socinfo: Add few DSPs to get their image details

Neil Armstrong (8):
      soc: qcom: add ADSP PDCharger ULOG driver
      dt-bindings: soc: qcom,aoss-qmp: document the SM8560 Always-On Subsystem side channel
      dt-bindings: soc: qcom: pmic-glink: document SM8650 compatible
      dt-bindings: firmware: qcom,scm: document SM8650 SCM Firmware Interface
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8650
      soc: qcom: socinfo: Add SM8650 SoC ID table entry
      dt-bindings: cache: qcom,llcc: Document the SM8650 Last Level Cache Controller
      soc: qcom: llcc: Add configuration data for SM8650

Rajendra Nayak (2):
      dt-bindings: cache: qcom,llcc: Add X1E80100 compatible
      soc: qcom: llcc: Add configuration data for X1E80100

Sibi Sankar (1):
      dt-bindings: firmware: qcom,scm: document SCM on X1E80100 SoCs

 CREDITS                                            |   4 +
 .../devicetree/bindings/cache/qcom,llcc.yaml       |   3 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |  18 +--
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   2 +
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  22 ++-
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |  14 ++
 MAINTAINERS                                        |   1 -
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c    |  20 ++-
 drivers/soc/qcom/Kconfig                           |  13 ++
 drivers/soc/qcom/Makefile                          |   2 +
 drivers/soc/qcom/llcc-qcom.c                       | 107 ++++++++++++-
 drivers/soc/qcom/pmic_glink.c                      |  24 +--
 drivers/soc/qcom/pmic_glink_altmode.c              |   6 +-
 drivers/soc/qcom/pmic_pdcharger_ulog.c             | 166 +++++++++++++++++++++
 drivers/soc/qcom/pmic_pdcharger_ulog.h             |  36 +++++
 drivers/soc/qcom/socinfo.c                         |  13 +-
 drivers/usb/typec/ucsi/ucsi.c                      |   3 +
 drivers/usb/typec/ucsi/ucsi.h                      |   3 +
 drivers/usb/typec/ucsi/ucsi_glink.c                |  13 ++
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 20 files changed, 418 insertions(+), 53 deletions(-)
 create mode 100644 drivers/soc/qcom/pmic_pdcharger_ulog.c
 create mode 100644 drivers/soc/qcom/pmic_pdcharger_ulog.h

