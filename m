Return-Path: <linux-arm-msm+bounces-51965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80EA691EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDDE117ACBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1761D63F9;
	Wed, 19 Mar 2025 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjRNSZZp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F0C1C3306
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395436; cv=none; b=eYnSiwO7IqpMSlF0W/xzoQB6jgpiDA3GA6JoL4rfteYDzjYyqdP2dm9y1KUWQ2G1Ak2ToPu4ozRJNaKeDHATip0TS6By6HanQ0QwLzgjbhUhUhepW+nTq6P9coiXvrLTIQgIT1PYkKmzazcO6VbdoZVPijoFt9kriZXKD3H2x7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395436; c=relaxed/simple;
	bh=BYSDp7h8CX/m3JoYwNQT07/clY6Sux/zZEdFLmBfykk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dGzlkhU72THtEr3orndZKyzD3/5PLg+YpZ3aN2A5OdSYNQyMu3JgQIZ52XBdfD7BT58ui1MX8UaLizlzGcSYncRq7aCNLTPjH4JqzxL+PrJ6tS2h4W+bQJE1cPaXYPrjtG+Oo35bREbMya4hcpnwCtCxZQ0VHiiwjS4WwX3uwp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjRNSZZp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1936AC4CEE4;
	Wed, 19 Mar 2025 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742395435;
	bh=BYSDp7h8CX/m3JoYwNQT07/clY6Sux/zZEdFLmBfykk=;
	h=From:To:Cc:Subject:Date:From;
	b=MjRNSZZpTUgfeC6T5gO+3cjql67nqnrBgZ/nsBB+BeaAsvniCEW2iycQwZRjMR1Z3
	 HDG1oV2SyIohFFRFfgKgTa8yT/DnokXIqf17/UXhzu1P9vQCs57E5RryPgv1U2f0YM
	 W6/LkcqNc/zbAu4/tYowp8mBW7fHxXkQSzT6ZD7cpkkIAuw813cZTKSOp2TS4VibGU
	 fiBV8uGMMdMrYV+CdSDVFMckdJnYyhIV5uKRT3fzP8MnVJYIj8MUkygKvGx9ge4n86
	 J/WoDSW/wGi0wcLjygKrRXyiZFr5umbKIwaXTKdkuogDlzFtZqL1sYO1lI9uMYVgOP
	 20eZFgiSL/Uyw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.15
Date: Wed, 19 Mar 2025 09:43:53 -0500
Message-ID: <20250319144354.2281720-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.15

for you to fetch changes up to dd20903cc09ac40e71096370a9564e6523e87c22:

  arm64: defconfig: Enable USB retimer and redriver (2025-03-19 08:46:36 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.15

Explicitly enable the DRM_DISPLAY_CONNECTOR module, as this is used by a
variety of boards.

Enable retimer and redriver drivers used in the USB configuration of a
variety of Qualcomm X Elite-based devices. Enable the NSS clock
controller driver for IPQ9574, the new Iris video encoder/decoder driver
and it's clock controller, as well as the QCM2290 GPU clocck ontroller.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable USB retimer and redriver

Devi Priya (1):
      arm64: defconfig: Build NSS Clock Controller driver for IPQ9574

Dmitry Baryshkov (2):
      arm64: defconfig: Enable Qualcomm QCM2290 GPU clock controller
      arm64: defconfig: enable DRM_DISPLAY_CONNECTOR as a module

Neil Armstrong (1):
      arm64: defconfig: enable Qualcomm IRIS & VIDEOCC_8550 as module

 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

