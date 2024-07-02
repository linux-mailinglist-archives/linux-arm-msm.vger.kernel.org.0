Return-Path: <linux-arm-msm+bounces-24852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D69791ED29
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 04:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEDF71C210D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 02:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE25D15E85;
	Tue,  2 Jul 2024 02:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGYeXzhQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB71A23
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 02:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719889062; cv=none; b=lyvjJ8kTrJh9MckAr0aQrffKMxN3Jxdvrdisu8YcRIrIudsM3gDFiEXDymMGhfcBsVcMjqJLHMC97oODgAtU2s8Z2KQD4809dUrwlTjkr2R7IvvYCovU0xUOI+NUr/rFkLwdzo8smJUekkVMW93wMzoh5drOim3Xbrl7CltFaCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719889062; c=relaxed/simple;
	bh=HCxIw9OXm35Bf75qPtn5PW32ZmbNwAR7PxqU7OPmEsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VpPWUsIjcOAwbxCTRZJazTxTX4/yafhm6Z1jFVRf25DBkQnon2ioq5o3xKYSS4X2nlZtBV1Oy6B4gdPWk2fA99bmdIq4ojAoEltW7uPDXYXvI22BClbykSoTtY1q9rMa3bvs505B92ArKfzMzBZoTU+k6nUdrhOIZ6tNFucTRaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGYeXzhQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E1EC116B1;
	Tue,  2 Jul 2024 02:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719889062;
	bh=HCxIw9OXm35Bf75qPtn5PW32ZmbNwAR7PxqU7OPmEsg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=kGYeXzhQUgKbDT/5t8I2l2Gj2CK5y2f8iJdtKcZ+L+g/C1+VCbg2vXWHJW0HmnefW
	 7Y7kt/tcWjZSgz05EvxPip4gdAbDckQp4pNIKT+IPCkq43JKIkBU/rRsssSf1AdAoO
	 pLrhakxNx2g9OmwP5tKZ1lMUFYCzRmCODzWrHglDeX3TN75yi0hdn5jiZ25+dTK2NC
	 imIU8S8KS3Y+CscO2QdKShl+fokJB4SxTJc15YT53+UW01wMbX8fSusXzNpwAEhA8X
	 s0UKzKvbFMUaDuFvlcvP4/MmkFEDP8pVHjbIaiuYtbMCdru2vV00YTnB4N2t6G7cLm
	 +t2X9gFCzuYAA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [GIT PULL] Qualcomm Arm64 defconfig fixes for v6.10
Date: Mon,  1 Jul 2024 21:57:39 -0500
Message-ID: <20240702025740.339563-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-6.10

for you to fetch changes up to e706474d8428f420bba11f2c49c3083fd1b31d88:

  arm64: defconfig: enable Elan i2c-hid driver (2024-06-07 13:01:32 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig fixes for v6.10

Enable the Elan I2C HID driver, to enable the touchscreen on devices
such as the Lenovo Thinkpad X13s.

----------------------------------------------------------------
Johan Hovold (1):
      arm64: defconfig: enable Elan i2c-hid driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

