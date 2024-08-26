Return-Path: <linux-arm-msm+bounces-29505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0540F95F479
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 16:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32E151C20CBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 14:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA66187FEA;
	Mon, 26 Aug 2024 14:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hce+FPtI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B8B187870
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 14:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684258; cv=none; b=BvhzjCLVbeDWJ2BSWrGPCV8qadIoOENMd9aqcT0GwHZLS4Bmx4ywIx8JXZWpoaVU1dhwRc5MIpJc9xxW4xaXjQI/cAhv1S0sjlCLtkPRZK4yRAvhVhG8Wxq+nGb+UweIXhy0Zc0dceEN560hywfbQejIoznYaAq+2c6SKamP5P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684258; c=relaxed/simple;
	bh=mxzbLBLfrCKHNcUODkdKoQOSZxSuYGygrrQtLf1yX7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V48/oQCGxxUAFSfXYlrz4dK7VZflyABkBJVBsjh4+Ok2LAVxE6uHuESdjs7qUdac7m2KwKldz2fHXOKbk7Yl+ZZNVV4AsuaBWQZjvO+XrQcAy1LBMvVUO2yn4iWDTm5LmvLP40405nWWX1gMdlyHsgElWhK1TB0afZreApk4dQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hce+FPtI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C58C4FDF9;
	Mon, 26 Aug 2024 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724684258;
	bh=mxzbLBLfrCKHNcUODkdKoQOSZxSuYGygrrQtLf1yX7g=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=hce+FPtI5D8F46KyKXYB69y4UHK6veMV4CdNyINiTZuBAAl9FU9l7+mOTkCmsJywD
	 ZVg/cCxZXnK7G1bmMPR7gLUTSxrcMwA7FxjcLIFZFquHxBRecK/Ql4Xpp2Is0vPby3
	 0fg0Db28Cb54U6Ksdbf6JzZ6JdqHN5U7jebaXz1CcrC69I84v5ivIGMtadqb+8oZJk
	 C+z7DrwZ1Du86oiLW+KbhH6XIuHq4slhPyBSm6Ib/ykph+6lP3FE7E6oiX6fRkSypG
	 f6B0v639TR2XxJ9BZDXf6k4WBtw+LJ77vwAUnRd8sDlOFv4W2WPv666CfRcG7sr2Xh
	 SbPUgN9c73wpg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 defconfig fix for 6.11
Date: Mon, 26 Aug 2024 09:57:35 -0500
Message-ID: <20240826145736.1646729-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-6.11

for you to fetch changes up to 10f98bb9d98137b544b00abb4f9df45e9be7878d:

  arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20 (2024-07-28 21:46:07 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig fix for 6.11

Enable the Samsung ATNA33XC20 display panel driver, as we switched from
the generic EDP panel for some of the X1E devices in v6.11.

----------------------------------------------------------------
Stephan Gerhold (1):
      arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

