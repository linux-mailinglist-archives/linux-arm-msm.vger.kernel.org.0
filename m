Return-Path: <linux-arm-msm+bounces-24855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F246391ED69
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 05:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3137A1C2025F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 03:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0B414A90;
	Tue,  2 Jul 2024 03:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVk2veC5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A0914293;
	Tue,  2 Jul 2024 03:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719890350; cv=none; b=AIiueMQPvdkK0LcGs4rAgK+jzhLm3yv2vgzCirEokQSF4dByl+jAwh9b/p0xpwXgCCvzhUXR1jZnw6mHVlnU4IFABBmvQLgnh+Pj2aUmFUlvwdNRTPfZvaZ6ew77EegY8wFppWV9t8HL8Xd7rWQiS/jLquJX2X2ntxBRL5hzznU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719890350; c=relaxed/simple;
	bh=WpodWV6+pvEFIAIUsTJbwIsKB7qDeFJY3RdXcq4REQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cvQ4YTXpsdu3qLNv7m0Htp40xf7VMzxlXkzCNGuUJ+7MxmhIWFTuY1euq3VMOLA134U5GVdSMZ8AH2XevZqKN5oWHYwjYQK1lummQ5b9YO8fGDQusbIgEg75oId0Xnf4flYlUpd94cPevYEaBQVd7bmY6d52rxf/TpZRdJkvDPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVk2veC5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FADC116B1;
	Tue,  2 Jul 2024 03:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719890350;
	bh=WpodWV6+pvEFIAIUsTJbwIsKB7qDeFJY3RdXcq4REQI=;
	h=From:To:Cc:Subject:Date:From;
	b=jVk2veC5B+qbX+hPzPJ/m0EU0nUwDQy5htn0QMGdmD/TLDT8mHI7KppYKydKNfIB1
	 V99zXSRKW43QcJT9H1awUnzht2okB1blWZd+2ChMutvfzlAe52Urdu5+in1JMKHj04
	 uTSB7EJFJIhk4IDvFm6Dl1Oi1qpm7o3YJJPjYF4bfOUwYiInJyH5T3pPtu2pp9TXEe
	 b2/uder4x/XfxczecDaS3b99NDPzjP0Pm2raUZxpEvquKezE7ElDVUtItNvl/Hpf4N
	 +Xa2SWSDjeoxPPMEFid2FKtqd5re+KF7/zIqJgqp/He3xcL+goNw+VMNeqDAB4gw5+
	 TaOnzPHyShGBg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Gabor Juhos <j4g8y7@gmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>
Subject: [GIT PULL] Qualcomm clock fixes for v6.10
Date: Mon,  1 Jul 2024 22:19:08 -0500
Message-ID: <20240702031909.341332-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-6.10

for you to fetch changes up to 72ceafb587a56e26c905472418c7dc2033c294d3:

  clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag (2024-05-28 16:32:47 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v6.10

Correct the Stromer Plus PLL set_rate to explicitly set ALPHA_EN bit and
remove unnecessary upper parts of CONFIG_CTL values.

Mark the recently added IPQ9574 GCC crypto clocks BRANCH_HALT_VOTED, to
address stuck clock warnings.

Lastly fix the GPLL6 and GPLL7 parents on SM6350 to avoid issues with
these reportedly running at ~25GHz.

----------------------------------------------------------------
Gabor Juhos (2):
      clk: qcom: clk-alpha-pll: set ALPHA_EN bit for Stromer Plus PLLs
      clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from Stromer pll configs

Luca Weiss (1):
      clk: qcom: gcc-sm6350: Fix gpll6* & gpll7 parents

Md Sadre Alam (1):
      clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag

 drivers/clk/qcom/apss-ipq-pll.c  |  2 --
 drivers/clk/qcom/clk-alpha-pll.c |  3 +++
 drivers/clk/qcom/gcc-ipq9574.c   | 10 ++++++----
 drivers/clk/qcom/gcc-sm6350.c    | 10 +++++-----
 4 files changed, 14 insertions(+), 11 deletions(-)

