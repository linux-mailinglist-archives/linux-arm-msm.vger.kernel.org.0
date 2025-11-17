Return-Path: <linux-arm-msm+bounces-82161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E6EC66094
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 20:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F0B7E346D2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 19:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78988316909;
	Mon, 17 Nov 2025 19:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbIqvnS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536F8313E1E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 19:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763409338; cv=none; b=lJ05bhjqR+mKziax7FKFXzPSxX1LfmEkn0xvXHan46BSCepn/8CQ50vsEF4S7oZDJESIo8TTUACoZILCXTONf9E1IcwFjaGZL7BhpILV6ugFEut7IQiQqNpfblQ3sL6tWCbbL4TpzDfCcsY+ggPy5sWGI0ks8q1O+Q66RNx84Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763409338; c=relaxed/simple;
	bh=5NYv7IhXQWWcpLL+EOWuBkb9pQPJESIJu5lfgINYai8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sFI4lqsZbOVc40swKDUD8uCuJjmlb5Ece8W+xmjA2czxz23Qet26Evr03Xi6/SqWIyLsi/XSbA8dVSs4a1+9/Ea8YAOwUDVaMSVRNuVIByh5GMSSezy3g56RDS6Lu/mp9qgfRa+Co4W+49GQ+MTHttkh201CnnBqxs4cRXyI4K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbIqvnS4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B096C2BC86;
	Mon, 17 Nov 2025 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763409337;
	bh=5NYv7IhXQWWcpLL+EOWuBkb9pQPJESIJu5lfgINYai8=;
	h=From:To:Cc:Subject:Date:From;
	b=SbIqvnS4+ghe1JRWib/V+hwCkB40FtAWp7of4kJ2Yi56O/km3W6+p215vYD7+e4lN
	 BYGurIMvo1CnhkHjy/YvnmcqenT9kd8IMfcoJ78RIBh+ycW5WonNf/XSanW9+4IbjL
	 MZX+obPMMudSNeyRNWTt/0g1vUahVyg4ZeF+UiE/cZcxn1iec+pgl+WadS2R4lpv/n
	 At/Tf4Xvm8Lsd/lbMfGgsUyRAVM1ejZKVBppG4Z2muxVVEH9/rPIpy1nSJSnvh5UXC
	 hZ4p+QfIim3LBPLr5skvWxt8yG+J/Nq87IFCrCPbE6cO5vY0XOyvM9pN/7sWXYlKVw
	 +nnuxkQNejkRg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.19
Date: Mon, 17 Nov 2025 13:59:54 -0600
Message-ID: <20251117200001.3169354-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.19

for you to fetch changes up to 186b8f8fcc86949eaf0c3bd11a47048ec4c78b5b:

  soc: qcom: mdt_loader: rename 'firmware' parameter of qcom_mdt_load() (2025-11-11 09:48:57 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v6.19

Support for hardware-keymanager v1 support for wrapped keys is introduce
in the ICE driver.

Support for the new Kaanapali mobile platform is added to last-level
cache controller, pd-mapper, and UBWC drivers.

UBWC driver gains support for the Monaco and Glymur platforms.

The PMIC GLINK driver is extended to handle the differences found in
targets where the related firmware runs on the SoCCP.

Support for running on targets without initialized SMEM is provided, by
reworking the SMEM driver to differentiate between "not yet probed" and
"probed but there was no SMEM". An unwanted WARN_ON() that triggered if
clients asked for a SMEM item beyond the currently running system's
limit, was removed, to allow new use cases to gracefully fail on old
targets.

The Qualcomm socinfo driver is extended with support for version 20
through 23 and support for providing version information about more than
32 remote processors. Identifiers for QCS6490 and SM8850 are also added.

Additionally, a number of smaller bug fixes and cleanups in PBS, OCMEM,
GSBI, TZMEM, and MDT-loader are included.

----------------------------------------------------------------
Abel Vesa (1):
      soc: qcom: ubwc: Add configuration Glymur platform

Akhil P Oommen (1):
      soc: qcom: ubwc: Add config for Kaanapali

Anjelique Melendez (1):
      soc: qcom: pmic_glink: Add support for SOCCP remoteproc channels

Christian Marangi (2):
      err.h: add INIT_ERR_PTR() macro
      soc: qcom: smem: better track SMEM uninitialized state

Gabor Juhos (2):
      soc: qcom: mdt_loader: merge __qcom_mdt_load() and qcom_mdt_load_no_init()
      soc: qcom: mdt_loader: rename 'firmware' parameter of qcom_mdt_load()

Haotian Zhang (2):
      soc: qcom: gsbi: fix double disable caused by devm
      soc: qcom: smem: fix hwspinlock resource leak in probe error paths

Jingyi Wang (6):
      dt-bindings: cache: qcom,llcc: Document the Kaanapali LLCC
      soc: qcom: llcc-qcom: Add support for Kaanapali
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8850
      soc: qcom: socinfo: Add SM8850 SoC ID
      dt-bindings: soc: qcom,aoss-qmp: Document the Kaanapali AOSS channel
      dt-bindings: firmware: qcom,scm: Document SCM on Kaanapali SOC

Johan Hovold (2):
      soc: qcom: ocmem: fix device leak on lookup
      soc: qcom: pbs: fix device leak on lookup

Kathiravan Thirumoorthy (4):
      soc: qcom: socinfo: arrange the socinfo_image_names array in alphabetical order
      soc: qcom: socinfo: add the missing entries to the smem image table
      soc: qcom: smem: drop the WARN_ON() on SMEM item validation
      soc: qcom: socinfo: add support to extract more than 32 image versions

Komal Bajaj (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for QCS6490
      soc: qcom: socinfo: Add SoC ID for QCS6490

Mukesh Ojha (2):
      soc: qcom: socinfo: Add support for new fields in revision 20
      soc: qcom: socinfo: Add reserve field to support future extension

Neeraj Soni (1):
      soc: qcom: ice: Add HWKM v1 support for wrapped keys

Pankaj Patil (1):
      dt-bindings: firmware: qcom,scm: Document Glymur scm

Prasad Kumpatla (1):
      soc: qcom: pd-mapper: Add Kaanapali compatible

Randy Dunlap (1):
      firmware: qcom: tzmem: fix qcom_tzmem_policy kernel-doc

Sibi Sankar (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the Glymur AOSS side channel

Yongxing Mou (1):
      soc: qcom: ubwc: Add QCS8300 UBWC cfg

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |   3 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   2 +
 drivers/soc/qcom/ice.c                             |  81 +++--
 drivers/soc/qcom/llcc-qcom.c                       | 373 +++++++++++++++++++++
 drivers/soc/qcom/mdt_loader.c                      |  52 ++-
 drivers/soc/qcom/ocmem.c                           |   2 +-
 drivers/soc/qcom/pmic_glink.c                      |   9 +-
 drivers/soc/qcom/qcom-pbs.c                        |   2 +
 drivers/soc/qcom/qcom_gsbi.c                       |   8 -
 drivers/soc/qcom/qcom_pd_mapper.c                  |  10 +
 drivers/soc/qcom/smem.c                            |  33 +-
 drivers/soc/qcom/socinfo.c                         | 102 +++++-
 drivers/soc/qcom/ubwc_config.c                     |  24 ++
 include/dt-bindings/arm/qcom,ids.h                 |   2 +
 include/linux/err.h                                |   8 +
 include/linux/firmware/qcom/qcom_tzmem.h           |  15 +-
 include/linux/soc/qcom/llcc-qcom.h                 |   7 +
 include/linux/soc/qcom/socinfo.h                   |   4 +
 include/linux/soc/qcom/ubwc.h                      |   1 +
 20 files changed, 645 insertions(+), 95 deletions(-)

