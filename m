Return-Path: <linux-arm-msm+bounces-57772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 439C7AB5EBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 23:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86425865F85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 21:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76621F76CA;
	Tue, 13 May 2025 21:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKgFkHRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C8E20EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 21:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173421; cv=none; b=d4ln2lr8qKkrwhjIXHT5PqBLrPYPJ9I2UfSwe6gxn1/JxzmDue1/lIWY9aRDlDxv3c7v1/PyUsa8PMLSDt5RUyiUIENh2R8TwXsRZ668TR6qE/MZaIMKJeqBfyMuztAB00MufEzEKoL6bRBXyO37LXnwWzrJW8OUCYWqKD8T5qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173421; c=relaxed/simple;
	bh=ifsMEznsU97LMq4Eq2UBEmojQKdA/27+wMDcWhlnn6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oXH/ZJZzo63lIz5PXeamtMASqKRBTa5FQtw253ShwxxWpfdlSanuD6fztsEx4jX94sAdL/BqkH2RUdl5L1oWvmOZtQg9aH58OuZAFYMxGwG/PD75B2G+WpTtcdQQlyWuzrR7ubclrwkIuL82ply+vU/8a7+Vwm2Arrt65FmcVds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKgFkHRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEC0C4CEE4;
	Tue, 13 May 2025 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747173421;
	bh=ifsMEznsU97LMq4Eq2UBEmojQKdA/27+wMDcWhlnn6Q=;
	h=From:To:Cc:Subject:Date:From;
	b=gKgFkHRqYouv8V6DFWoEDD6fimfsv3H77RNMCkPMV5ZxYIG0qIpLl0kjIHeXJ4kGU
	 kgPj5SuBd+HAMgRzALqbOv/hpekNrk1iBJeja0ZNJBX6HucE1g8sFXUAgG70HoFS8O
	 A4I/V573s7zayAwHPnM46I0xgryGG0e26Dcehcu6NMqKw8VVlOWE2wmK0Z/yIObOZE
	 /57Y5GD4E7/83yOhTLQe9/9PMAngQ7cClHpHVfGEPIOyHoSgk7IZ/6tnxn9LWIXRf+
	 D0Wty/VU1Ob9411cidso2MBaDHjKYnY7AkhUAEuCKKhK90dNDwrj3+yRA2e59hOTAY
	 px/sQBfn85Qgg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Jens Reidel <adrian@mainlining.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.16
Date: Tue, 13 May 2025 22:56:53 +0100
Message-ID: <20250513215656.44448-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.16

for you to fetch changes up to 2c04e58e30ce858cc2be531298312c67c7d55fc3:

  soc: qcom: llcc-qcom: Add support for SM8750 (2025-05-12 22:26:21 +0100)

----------------------------------------------------------------
Qualcomm driver updates for v6.16

Allow list QSEECOM for EFI variable services on on the Asus Zenbook A14,
and block list TZMEM on the SM7150 platform to avoid issues with rmtfs.

Extend the last-level cache (llcc) driver to support version 6 of the
hardware and enable SM8750 support.
Also add socinfo for the SM8750 platform.

Re-enable UCSI support on SC8280XP, now that the reported crash has been
dealt with, and filter the altmode notifications to avoid spurious
hotplug events being propagated to user space.

Add SM7150 support to pd-mapper.

----------------------------------------------------------------
Aleksandrs Vinarskis (1):
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14

Barnabás Czémán (1):
      soc: qcom: smp2p: Fix fallback to qcom,ipc parse

Danila Tikhonov (1):
      firmware: qcom: tzmem: disable sm7150 platform

Dmitry Baryshkov (2):
      dt-bindings: soc: qcom,rpm: add missing clock-controller node
      dt-bindings: soc: qcom: qcom,rpm: add missing clock/-names properties

Jens Reidel (1):
      soc: qcom: pd-mapper: Add support for SM7150

Johan Hovold (2):
      soc: qcom: pmic_glink: enable UCSI on sc8280xp
      soc: qcom: pmic_glink_altmode: fix spurious DP hotplug events

Konrad Dybcio (1):
      dt-bindings: soc: qcom,rpmh-rsc: Limit power-domains requirement

Melody Olvera (3):
      dt-bindings: cache: qcom,llcc: Document SM8750 LLCC block
      soc: qcom: llcc-qcom: Add support for LLCC V6
      soc: qcom: llcc-qcom: Add support for SM8750

Mukesh Ojha (2):
      dt-bindings: arm: qcom,ids: add SoC ID for SM8750
      soc: qcom: socinfo: add SM8750 SoC ID

Unnathi Chalicheemala (1):
      soc: qcom: smem: Update max processor count

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     |  15 +
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           |  24 +-
 drivers/firmware/qcom/qcom_scm.c                   |   2 +
 drivers/firmware/qcom/qcom_tzmem.c                 |   1 +
 drivers/soc/qcom/llcc-qcom.c                       | 497 ++++++++++++++++++++-
 drivers/soc/qcom/pmic_glink.c                      |   4 -
 drivers/soc/qcom/pmic_glink_altmode.c              |  30 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |  11 +
 drivers/soc/qcom/smem.c                            |   2 +-
 drivers/soc/qcom/smp2p.c                           |   2 +-
 drivers/soc/qcom/socinfo.c                         |   1 +
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 include/linux/soc/qcom/llcc-qcom.h                 |   8 +
 14 files changed, 577 insertions(+), 23 deletions(-)

