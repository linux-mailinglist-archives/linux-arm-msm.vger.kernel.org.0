Return-Path: <linux-arm-msm+bounces-68388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F76CB20CB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7050E161373
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3093E2C325B;
	Mon, 11 Aug 2025 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qsD1kEXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9341DF27F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924175; cv=none; b=dt/FXC4d5mGNd3jy3BLeH0IQz2nPvEyYrwzWaws650fWvBpo4VebgtSbTeWiOVgjIerkV1t124vvWesPg8+x9DuGF8z53SOtN0ldnLLs5qg5ALR6pycFrAOI7GnMFvhifg5WAXrjcpFLI5oedfG5E0vC4NOzVU2ux2fZ6SzBS1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924175; c=relaxed/simple;
	bh=wkEAOGCSP4PWIJbYeRH2+mullwzKF3uE+Wbcm87RmJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=puIR6itJoPBaR/O83dV0NbWonQT+R/qpJCqFprr8uI4f4+e9e2j7hXMQFLXSBvJcBTYFuhVkO4yOfr0g09C/vPuT0iqujeFhLVoaDn5vMg0I5FmhhsmZrz/mbCIXfbGl2s94cE+DHmqV8oJQMrwVc0CwR3PbJ8C+3egB+GSBS8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qsD1kEXk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C800C4CEED;
	Mon, 11 Aug 2025 14:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754924174;
	bh=wkEAOGCSP4PWIJbYeRH2+mullwzKF3uE+Wbcm87RmJQ=;
	h=From:To:Cc:Subject:Date:From;
	b=qsD1kEXkxMVWg9t19w5x/Lp+MWWWYsqYFGhYKYmgR2CU2kq+Zsj3efka7ieMwcOhs
	 xcdfGJeYCzun7brXrFMXJ10Jo5pX7SMLPZEm15PMacwZcZ+/Ttpb/FO0vtUpsxZ29c
	 QOJlV5OMz4TVYOvhXOgjRC0NdcJexUxlnVrp9VqlUhQdCdXbZpNKtfqHEoH/RzDJwI
	 2vsIobSJRB3AFzNBd0/AZBSvjRmDMfFNZX4S1q7MB6R8clrkB20f4Ntl2GEji+qAGB
	 HbaXnl9eXiS+axvbQg5EW55GGhkxqBPJySHeAIn5YtWvWBFa6SG/9Ajou5C/hHsm6T
	 Diq0SUslu2kPA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v6.17-rc1
Date: Mon, 11 Aug 2025 09:56:11 -0500
Message-ID: <20250811145613.120917-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.17

for you to fetch changes up to 25daf9af0ac1bf12490b723b5efaf8dcc85980bc:

  soc: qcom: mdt_loader: Deal with zero e_shentsize (2025-08-10 21:02:14 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v6.17-rc1

The recently extended sanity checks for the Qualcomm firmware files
turned out to be too restrictive, preventing a variety of firmware
images from being loaded. Adjust the checks to allow section header
sizes of 0 when sections aren't used.

----------------------------------------------------------------
Bjorn Andersson (1):
      soc: qcom: mdt_loader: Deal with zero e_shentsize

 drivers/soc/qcom/mdt_loader.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

