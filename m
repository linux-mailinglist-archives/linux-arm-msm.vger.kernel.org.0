Return-Path: <linux-arm-msm+bounces-64899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A693B04DBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 04:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC48B7A3F11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 02:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1454B2C3278;
	Tue, 15 Jul 2025 02:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oso/sqhm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39FF2C3277
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752545697; cv=none; b=lqlsAv6Xy9ri+cI+9kUNKV3HtkSSbUgzHVfDzOygnygNW0t/1CdK8DTKHq9dUh99t+MxFXEdcfZ+CiKkIWZrmBFewy2aoTffHnqGsECckn2pjEcBpLvvwK+zI4zfM4k5OsNbfx8z0oUBvBQYkF424kHX5kHobw+kvsDQ/UCvtUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752545697; c=relaxed/simple;
	bh=iqGlb4swUIpn7QE7sxqTWrlmDq6f3DwCkbVbQG6xmis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P58M91gT1TdylJ4C5HpubhIspCY1NMb9rNckjkg6scpTXcqMi33jkF5W/uzwT0D5L2voTEisrS+vgz/mFU/0BxB5svYrjnhIirLXjn0WBwwT0lcQ99+hVVRoB8i14z6IJtinFJiiUQ9WW/pyiFijBu8ucEG+owdkCnIFgSMm4u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oso/sqhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4FCC4CEF0;
	Tue, 15 Jul 2025 02:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752545696;
	bh=iqGlb4swUIpn7QE7sxqTWrlmDq6f3DwCkbVbQG6xmis=;
	h=From:To:Cc:Subject:Date:From;
	b=oso/sqhmkEoTMBGJdMePDLaU4yc4Bmtz82ySRaVip0xr0eSrwFDAhotmvprLgDWFO
	 nQ9xyxEAi2CHjAGrrcJY/VT9JmGNeethYRdTbAVo5toraCr3lM8fNsT9nu11OVtW8y
	 mcEBuK6njP/O+uqvUwqexr78g5VZpmW/dGIeRJL52IeiAF+n9aIuR/zMjU20bo5WEw
	 Mw/TUPa3xcYGp7nE8MiOokALh85ZeLwH60MNaTakViSk/U8B5jJhIslBlRCF3mzrGY
	 LmJ0RcLoysiBNeLin198/HVFfce16R4S0DHR3hqBUF98GYBb61Tr/8Rd9sXhsDxwr4
	 aDQ3aVAsNxnqA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Wronek <david@mainlining.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Lijuan Gao <quic_lijuang@quicinc.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.17
Date: Mon, 14 Jul 2025 21:14:53 -0500
Message-ID: <20250715021454.14516-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.17

for you to fetch changes up to 9f35ab0e53ccbea57bb9cbad8065e0406d516195:

  soc: qcom: mdt_loader: Fix error return values in mdt_header_valid() (2025-06-25 14:31:31 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v6.17

Perform input validation in the MDT loader, as this was not properly
done in the non-remoteproc cases.

Fix endian issues in the QMI encoder/decoder.

Support reading DDR statistic using the Qualcomm stats driver.

Add support for reading TME firmware details to the socinfo driver.

Document the Kryo 470 CPU, and add SM7150 to the DCC to DeviceTree
bindings.

----------------------------------------------------------------
Alexander Wilhelm (2):
      soc: qcom: QMI encoding/decoding for big endian
      soc: qcom: fix endianness for QMI header

Bjorn Andersson (3):
      soc: qcom: mdt_loader: Ensure we don't read past the ELF header
      soc: qcom: mdt_loader: Rename mdt_phdr_valid()
      soc: qcom: mdt_loader: Actually use the e_phoff

Dan Carpenter (1):
      soc: qcom: mdt_loader: Fix error return values in mdt_header_valid()

Danila Tikhonov (3):
      dt-bindings: soc: qcom,dcc: Add the SM7150 compatible
      dt-bindings: sram: qcom,imem: Add the SM7150 compatible
      dt-bindings: arm: cpus: Add Kryo 470 CPUs

David Wronek (1):
      dt-bindings: soc: qcom: aoss-qmp: Add the SM7150 compatible

Kathiravan Thirumoorthy (1):
      soc: qcom: socinfo: Add support to retrieve TME build details

Konrad Dybcio (1):
      dt-bindings: sram: qcom,imem: Add a number of missing compatibles

Lijuan Gao (1):
      dt-bindings: soc: qcom: add qcom,qcs615-imem compatible

Maulik Shah (2):
      soc: qcom: qcom_stats: Add support to read DDR statistic
      soc: qcom: qcom_stats: Add QMP support for syncing ddr stats

 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../devicetree/bindings/soc/qcom/qcom,dcc.yaml     |   1 +
 .../devicetree/bindings/sram/qcom,imem.yaml        |  15 +++
 drivers/soc/qcom/mdt_loader.c                      |  63 ++++++++--
 drivers/soc/qcom/qcom_stats.c                      | 133 +++++++++++++++++++++
 drivers/soc/qcom/qmi_encdec.c                      |  52 ++++++--
 drivers/soc/qcom/qmi_interface.c                   |   6 +-
 drivers/soc/qcom/socinfo.c                         |   2 +
 include/linux/soc/qcom/qmi.h                       |   6 +-
 10 files changed, 253 insertions(+), 27 deletions(-)

