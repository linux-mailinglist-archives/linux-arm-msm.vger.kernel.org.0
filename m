Return-Path: <linux-arm-msm+bounces-12465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7878628EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 04:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C8ACB2102F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 03:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D4B4C96;
	Sun, 25 Feb 2024 03:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEK+FcHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E618A46A0
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 03:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708830376; cv=none; b=jKBLbZH80z0o4hwuTjU07xY3F6uzz6SttJHmhgqArxTgue0fKxHuE1WzcCGO5ikb5u0Nt2CPUX4FsTZXfBvh/Th3Jl29C9dHU0VKtUNj68lvMlBTLpImzW53XoCtxmA161r3cMm1+pJ5QL9HmxqMux9khvvs8n4v6Oh2PsHxER0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708830376; c=relaxed/simple;
	bh=gks5q5yYz504V+0T4za4NWMvSls3hriQwl/CMwCg+L8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FbYsGmrYytSejLHgeLCC6wiLh6JRt7I7EaFbrHmZjGj3cTHZbgi6bYJHRu2nhQvr1LK63CeVbP8YGXLVrqdWUTWaY/Ttugvt/esD80jLYy4Zx2KwSAzwidnIiPMbwQfsU6rxWQifhXTK6ER6nCI2PK0d03g+2Pn1wjq5/BlXhOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEK+FcHL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DEBC433C7;
	Sun, 25 Feb 2024 03:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708830375;
	bh=gks5q5yYz504V+0T4za4NWMvSls3hriQwl/CMwCg+L8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=rEK+FcHL9IIhi14+IHtCCvYXNZiuVd2XPClJTS3f2W1IinBAo0nGVlKrLopgTIJF5
	 h3gTPHGLyjgGLxyvP+uDOGBil2HcR8Ol/GviuSaixe25wRg3sUKHBR68fW94obbDDG
	 fhAuTKj3eAI6AzpdLuVVY1fOi+EL/+moPR6A4auHzJT+hLSVqok4oNbsMP9VWl4bju
	 gLeEAtF+2jOtdgXjkDrEX86tGx0ymEJGupBPZI4xd9+XBHJjfTGPne7t/+qswZzxI0
	 wlsJoMzHh0FqUJwNazmfmhnFs9G6a3wElwsYcReQqhSnuRnRGGijymtxDOx2W+Zm3Y
	 hlFo71LcnmE4w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Rob Herring <robh@kernel.org>,
	Tao Zhang <quic_taozhan@quicinc.com>,
	Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.9
Date: Sat, 24 Feb 2024 21:06:11 -0600
Message-ID: <20240225030612.480241-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.9

for you to fetch changes up to aa05f47474c02d38d88c32c633a551911c6fdc40:

  dt-bindings: soc: qcom: qcom,saw2: add msm8226 l2 compatible (2024-02-18 22:52:55 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v6.9

This introduces the Qualcomm Programmable Boot Sequencer (PBS) driver.

The Qualcomm SMEM no longer acquires the hwspinlock during the "get"
operation, to improve the system behavior during the recovery of a
remoteproc that crashed with the hwspinlock held.

The Qualcomm Always On Subsystem (AOSS) message protocol driver gains
tracepoints, printf annotation, and a debugfs interface is introduced
for tweaking system properties during development and debugging.

The Qualcomm socinfo driver gains data for SM8475, QCM8550 and
QCS8550 platforms, and the PM2250 is renamed to PM4125.

Support for controlling the voltage regulator in SPM/SAW2 is introduced.

The gfx.lvl power-domain is dropped for SA8540P, as this resource was
incorrectly inherited from SC8280XP.

Additionally some code cleanup improvements is introduced across APR,
LLCC, SMP2P and SPM.

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: soc: qcom: qcom,pmic-glink: document X1E80100 compatible

Anjelique Melendez (2):
      dt-bindings: soc: qcom: Add qcom,pbs bindings
      soc: qcom: add QCOM PBS driver

Bjorn Andersson (5):
      soc: qcom: aoss: Mark qmp_send() __printf()
      soc: qcom: aoss: Add debugfs interface for sending messages
      soc: qcom: aoss: Add tracepoints in qmp_send()
      pmdomain: qcom: rpmhpd: Drop SA8540P gfx.lvl
      Merge branch '20240201204421.16992-2-quic_amelende@quicinc.com' into drivers-for-6.9

Danila Tikhonov (2):
      dt-bindings: arm: qcom,ids: Add IDs for SM8475 family
      soc: qcom: socinfo: Add Soc IDs for SM8475 family

Dmitry Baryshkov (6):
      soc: qcom: socinfo: rename PM2250 to PM4125
      dt-bindings: soc: qcom: merge qcom,saw2.txt into qcom,spm.yaml
      dt-bindings: soc: qcom: qcom,saw2: add missing compatible strings
      dt-bindings: soc: qcom: qcom,saw2: define optional regulator node
      soc: qcom: spm: remove driver-internal structures from the driver API
      soc: qcom: spm: add support for voltage regulator

Luca Weiss (1):
      dt-bindings: soc: qcom: qcom,saw2: add msm8226 l2 compatible

Randy Dunlap (1):
      soc: qcom: smp2p: fix all kernel-doc warnings

Ricardo B. Marliere (1):
      soc: qcom: apr: make aprbus const

Rob Herring (1):
      dt-bindings: soc/qcom: Add size constraints on "qcom,rpm-msg-ram"

Tao Zhang (1):
      soc: qcom: smem: remove hwspinlock from item get routine

Tengfei Fan (2):
      dt-bindings: arm: qcom,ids: add SoC ID for QCM8550 and QCS8550
      soc: qcom: socinfo: add SoC Info support for QCM8550 and QCS8550 platform

Unnathi Chalicheemala (1):
      soc: qcom: llcc: Check return value on Broadcast_OR reg read

 .../devicetree/bindings/arm/msm/qcom,saw2.txt      |  58 -----
 .../devicetree/bindings/soc/qcom/qcom,pbs.yaml     |  46 ++++
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |   2 +
 .../bindings/soc/qcom/qcom,rpm-master-stats.yaml   |   2 +
 .../soc/qcom/{qcom,spm.yaml => qcom,saw2.yaml}     |  46 +++-
 drivers/pmdomain/qcom/rpmhpd.c                     |   1 -
 drivers/soc/qcom/Kconfig                           |   9 +
 drivers/soc/qcom/Makefile                          |   2 +
 drivers/soc/qcom/apr.c                             |   2 +-
 drivers/soc/qcom/llcc-qcom.c                       |   2 +
 drivers/soc/qcom/qcom-pbs.c                        | 236 +++++++++++++++++++
 drivers/soc/qcom/qcom_aoss.c                       | 103 ++++++++-
 drivers/soc/qcom/smem.c                            |  11 -
 drivers/soc/qcom/smp2p.c                           |   6 +-
 drivers/soc/qcom/socinfo.c                         |   7 +-
 drivers/soc/qcom/spm.c                             | 254 ++++++++++++++++++++-
 drivers/soc/qcom/trace-aoss.h                      |  48 ++++
 include/dt-bindings/arm/qcom,ids.h                 |   5 +
 include/linux/soc/qcom/apr.h                       |   2 +-
 include/linux/soc/qcom/qcom-pbs.h                  |  30 +++
 include/soc/qcom/qcom-spmi-pmic.h                  |   2 +-
 include/soc/qcom/spm.h                             |  23 +-
 22 files changed, 787 insertions(+), 110 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,pbs.yaml
 rename Documentation/devicetree/bindings/soc/qcom/{qcom,spm.yaml => qcom,saw2.yaml} (53%)
 create mode 100644 drivers/soc/qcom/qcom-pbs.c
 create mode 100644 drivers/soc/qcom/trace-aoss.h
 create mode 100644 include/linux/soc/qcom/qcom-pbs.h

