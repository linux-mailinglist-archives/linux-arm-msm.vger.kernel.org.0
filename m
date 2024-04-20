Return-Path: <linux-arm-msm+bounces-18055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B536A8ABC72
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 18:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E68461C206A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 16:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9D3205E16;
	Sat, 20 Apr 2024 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNMB5ygz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF6A1851
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713631098; cv=none; b=lflGwI/R2N6jobw8A5WI7LJZbswT96tSai5rioEFFgQwqV3IVDoh8Ctbyr8jWK/iPPjgoTxUbegWS8kwYBFWtst9eFDrJWf8+l33oC0Y3dC0M1sCcQjmIDGDKHWeoDHw6SO0Jb1SSpjGUPOtW37NBxt1CXzSWdEbhOzT1tNHxIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713631098; c=relaxed/simple;
	bh=x5g+GsMpkCGqTq+NoDix0056YOAskfAgPwwslUb6gSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cM1THm1JanSHqSZCDjwyW5Qrav4YFL/oW7MDgfb6Yu8xSGIle5dp+xgog5RPVsSqw1yZ4wblgGbfF3U4ytraxgg7Bk7wMqXaXOPNS5mXn6KPu3R1DPE5+SeZZEPlUB4N7It5CTq8zZ7C3OUjB5mK59BPF8HH2b6TtaLuN6y8DFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNMB5ygz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03355C072AA;
	Sat, 20 Apr 2024 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713631097;
	bh=x5g+GsMpkCGqTq+NoDix0056YOAskfAgPwwslUb6gSY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=hNMB5ygz9LXk8GtvMA32tH2+EImeolH/9BM8tXTq1MYsr90GwHGDsvRgy55fn9fBU
	 B8oWCsKbauaWO2oEVQw4fMoiMVCShsAHaVEY10M0hNA3WxnjWYTbQX4wfSDTvqQr+P
	 H4Y9srWX6G3VpBuqiqMO9n7M3iYu5Vd8lQSrW8yIE/Kix6kuDqmJ29EA2B3/KMdL0u
	 okLfXTKgxu4z2pT66X5ESgb+3FD6yIgzlBMR3FYouDPuIdBWhIR2iWmVF0w65j1e/g
	 XMKzDGmPI0qxIB63KQE1e/xJW0iJWe2UXVksNFcHSXfpye71RxkTi6LYx/QZanHsym
	 6E3iBdrTncsUA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: [GIT PULL] Qualcomm driver fix for v6.9
Date: Sat, 20 Apr 2024 11:38:15 -0500
Message-ID: <20240420163816.1133528-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.9

for you to fetch changes up to ed09f81eeaa8f9265e1787282cb283f10285c259:

  firmware: qcom: uefisecapp: Fix memory related IO errors and crashes (2024-04-09 10:05:03 -0500)

----------------------------------------------------------------
Qualcomm driver fix for v6.9

This reworks the memory layout of the argument buffers passed to trusted
applications in QSEECOM, to avoid failures and system crashes.

----------------------------------------------------------------
Maximilian Luz (1):
      firmware: qcom: uefisecapp: Fix memory related IO errors and crashes

 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 137 ++++++++++++++++--------
 drivers/firmware/qcom/qcom_scm.c                |  37 ++-----
 include/linux/firmware/qcom/qcom_qseecom.h      |  55 +++++++++-
 include/linux/firmware/qcom/qcom_scm.h          |  10 +-
 4 files changed, 153 insertions(+), 86 deletions(-)

