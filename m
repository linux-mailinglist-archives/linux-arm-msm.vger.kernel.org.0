Return-Path: <linux-arm-msm+bounces-89712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6A4D3B06C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3BE6305865B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8ED2C1594;
	Mon, 19 Jan 2026 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXXra+oV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A86821019C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839724; cv=none; b=TliBvayhf5GDKMqG4mGILp/ymptWaLiD5wJdp5LsXFfEw+rWdSxcQBwROqT27YJrU9v+N7uFXSeKRkwcjknqUlPbK0NUvSQ0fzQYO4k1DhgaHvIU4uRECBQasV19TK+dkZCCN/fN5yx0HxJtySgqdSNSBcSB1MOyrVRptQwCVIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839724; c=relaxed/simple;
	bh=oqgy3+J9tqflgUKoulRfWzxdEN5sKgu3jxasIQ1uMTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=suzP1F2ad9cQv/EJJdmkdVDVetsRwnpPtSy3h99faBtwcCmkX72hDx7fljLF2WzC5whEHAOqMV6m5HQBSjqZy4GdxR5I5GanwQo/GuqssAlSiQJk3vCc/8eF5xFCa8rV+aedefX2N4D4nw1czJUQv1uMDPNComUBDQ6vclLbUfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXXra+oV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467B7C116C6;
	Mon, 19 Jan 2026 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839723;
	bh=oqgy3+J9tqflgUKoulRfWzxdEN5sKgu3jxasIQ1uMTU=;
	h=From:To:Cc:Subject:Date:From;
	b=tXXra+oV6S+83cQFE+YBJ8R1aqUp49/qTLrGwAP819CsyArz9vQhe8Sw/GzcfoXgW
	 GglV/JlA44Pc/Xk+53NICwN15sNdddZfGyQJg3ANOLjpZgF3WaKvaEXBcv1Eekr13j
	 YzDUjn+FnKU8SpXG7UhzyoVo6Hgik06vlFJJvTRNKRo2hnrfVGriokk34fo1u1QdUy
	 1VHdJ2vVM2AC38/QyLOiAH6AUPKwHFzvJgT5JZwqLAY4eRoVnWwNqaxMJoUkvnZNMS
	 PxyILa0EZfqICKuEXJqoYRtz5E7Q8ObvFa9E8j0PdUhfwo5D22OsL7BN8ubN1HwZyK
	 5O6or2HMo6cKg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Dale Whinham <daleyo@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.20
Date: Mon, 19 Jan 2026 10:22:01 -0600
Message-ID: <20260119162201.842771-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.20

for you to fetch changes up to fe099c387e06b566840449ac21008db1b25ad1f4:

  soc: qcom: preserve CPU endianness for QMI_DATA_LEN (2026-01-16 08:19:46 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v6.20

Support multiple wait queues in the SCM firmware interface and provide
discovery of the wait queue interrupt to deal with the cases where
bootloader didn't patch the DeviceTree with the IRQ information.

Refactor the MDT loader and the SCM driver's peripheral authentication
service interface and introduce support for passing a remoteproc
resource table to the firmware. The remoteproc patches that uses this
and uses this to configure the IOMMU are included here due to
bidirectional dependencies. The end result is remoteproc support on the
Glymur platform.

Enable QSEECOM and thereby UEFI variable access, on the Surface Pro 11.

Make the QMI interface endianness aware, to support ath1Xk on big endian
machines.

Add the Glymur support in LLCC driver.

----------------------------------------------------------------
Alexander Wilhelm (3):
      soc: qcom: check QMI basic element error codes
      soc: qcom: fix QMI encoding/decoding for basic elements
      soc: qcom: preserve CPU endianness for QMI_DATA_LEN

Bjorn Andersson (1):
      Merge branch '20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com' into drivers-for-6.20

Dale Whinham (1):
      firmware: qcom: scm: allow QSEECOM on Surface Pro 11

Dmitry Baryshkov (1):
      soc: qcom: ubwc: add missing include

Haotian Zhang (2):
      clk: qcom: Return correct error code in qcom_cc_probe_by_index()
      soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe

Jingyi Wang (2):
      dt-bindings: interrupt-controller: qcom,pdc: Document Kaanapali Power Domain Controller
      dt-bindings: sram: Document qcom,kaanapali-imem and its child node

Jorge Ramirez-Ortiz (1):
      soc: qcom: smem: handle ENOMEM error during probe

Konrad Dybcio (1):
      soc: qcom: pmic_glink_altmode: Consume TBT3/USB4 mode notifications

Krzysztof Kozlowski (1):
      bus: qcom-ebi2: Simplify with scoped for each OF child loop

Luca Weiss (2):
      dt-bindings: crypto: qcom,prng: document Milos
      dt-bindings: qcom,pdc: document the Milos Power Domain Controller

Mukesh Ojha (13):
      dt-bindings: remoteproc: qcom,pas: Add iommus property
      firmware: qcom_scm: Remove redundant piece of code
      firmware: qcom_scm: Rename peripheral as pas_id
      firmware: qcom_scm: Introduce PAS context allocator helper function
      remoteproc: pas: Replace metadata context with PAS context structure
      soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
      soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported symbols
      firmware: qcom_scm: Add a prep version of auth_and_reset function
      firmware: qcom_scm: Refactor qcom_scm_pas_init_image()
      firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
      firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
      remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
      remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux

Pankaj Patil (3):
      dt-bindings: cache: qcom,llcc: Document Glymur LLCC block
      soc: qcom: llcc-qcom: Add support for Glymur
      dt-bindings: cache: qcom,llcc: Remove duplicate llcc7_base for Glymur

Unnathi Chalicheemala (3):
      firmware: qcom_scm: Add API to get waitqueue IRQ info
      firmware: qcom_scm: Support multiple waitq contexts
      firmware: qcom_scm: Use TASK_IDLE state in wait_for_wq_completion()

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  46 +-
 .../devicetree/bindings/crypto/qcom,prng.yaml      |   1 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   2 +
 .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
 Documentation/devicetree/bindings/sram/sram.yaml   |   2 +
 drivers/bus/qcom-ebi2.c                            |   7 +-
 drivers/clk/qcom/common.c                          |   2 +-
 drivers/firmware/qcom/qcom_scm.c                   | 507 ++++++++++++++++++---
 drivers/firmware/qcom/qcom_scm.h                   |   2 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 165 +++++--
 drivers/soc/qcom/cmd-db.c                          |   7 +-
 drivers/soc/qcom/llcc-qcom.c                       | 207 +++++++++
 drivers/soc/qcom/mdt_loader.c                      |  51 ++-
 drivers/soc/qcom/pmic_glink_altmode.c              | 188 +++++++-
 drivers/soc/qcom/qmi_encdec.c                      | 137 +++++-
 drivers/soc/qcom/smem.c                            |   4 +-
 include/linux/firmware/qcom/qcom_scm.h             |  30 +-
 include/linux/soc/qcom/llcc-qcom.h                 |   4 +
 include/linux/soc/qcom/mdt_loader.h                |  22 +-
 include/linux/soc/qcom/ubwc.h                      |   1 +
 20 files changed, 1199 insertions(+), 189 deletions(-)

