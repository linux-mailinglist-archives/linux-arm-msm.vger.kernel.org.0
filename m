Return-Path: <linux-arm-msm+bounces-58588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36234ABCD72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C33E38A2B87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFAC2571BD;
	Tue, 20 May 2025 02:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+93xLYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076FC256C9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 02:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747709358; cv=none; b=uoYnc8BdDYTHMUvdZDI6w/hIQ0E+WGAsNbG4z3qyGsJKhrv2eZ3khY6FPHY5Z4apV64GKDAostknO9NgGCEy2lTGKartPQcLtBCqdYoeBoCfl84c00aHOFlfvYHpA9AJABk+K3k/b2sjMZ+DAgTb4Ns0kcFDbfDgPGNAOImIMOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747709358; c=relaxed/simple;
	bh=p8OR9g5qeP2t+5pRzCPVweDnZtwMfDrbmmjdw6Slo84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXvK129VEYl2Pz76gmomR6PhXd+MVmRlToMQacZ9udIk5kslPPQu5KjzRpAYHfmYPob4GI/j5V8JxgesO59i/KH3h0ZqcoeSDQTyMZpGR+XR2PX9llFlwnxfK48xIoak4dF2kkO8/QHXu5zUvyaBQFsSs205uyIdMSmel1QXmkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+93xLYu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02ACC4CEE4;
	Tue, 20 May 2025 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747709357;
	bh=p8OR9g5qeP2t+5pRzCPVweDnZtwMfDrbmmjdw6Slo84=;
	h=From:To:Cc:Subject:Date:From;
	b=K+93xLYukR5nWKNpQcztUB2skjomCUd0PJbYfAVnPHPoOMkonYuOX464Y4VlJNHkD
	 HMnehk0lgNvWxNI6B2CdYTBBVSkSC4kih+1M4007f/5uz0Ufa/9nCqktkwqJFHldgB
	 3seaGrfCJ0oXOMVIuySyulEEdIYqW0LEG4R3gs3bIR37F2sF+4mFMleFgu7ZfWlRyl
	 8eY9axbdpPWpuec9/mrfO/p6crKep99KW2zkZLDbO02cwhpO8dh49FQvRRZ/Jt4NYR
	 a+80D7PXOhjoUX5QFCDKn7C0vQEE0fSApH5bmTND7fANXWW8XGr0j9YP1FpC0qL3F/
	 W1S20nosIPLeA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	George Moussalem <george.moussalem@outlook.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm driver updates for v6.16
Date: Mon, 19 May 2025 21:49:15 -0500
Message-ID: <20250520024916.39712-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2c04e58e30ce858cc2be531298312c67c7d55fc3:

  soc: qcom: llcc-qcom: Add support for SM8750 (2025-05-12 22:26:21 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.16-2

for you to fetch changes up to 936badf282388be78094e55bd5e2c96f86635e48:

  docs: firmware: qcom_scm: Fix kernel-doc warning (2025-05-19 18:04:28 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for v6.16

Allow HP EliteBook Ultra G1q to use QSSECOM for UEFI variable acecss.
Add missing compatible for IPQ5018 TCSR block. Fix a kernel-doc warning
in SCM driver.

----------------------------------------------------------------
George Moussalem (1):
      dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018

Juerg Haefliger (1):
      firmware: qcom: scm: Allow QSEECOM for HP EliteBook Ultra G1q

Unnathi Chalicheemala (1):
      docs: firmware: qcom_scm: Fix kernel-doc warning

 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 drivers/firmware/qcom/qcom_scm.c                     | 1 +
 drivers/firmware/qcom/qcom_scm.h                     | 3 +++
 3 files changed, 5 insertions(+)

