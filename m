Return-Path: <linux-arm-msm+bounces-29506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B7C95F4BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 17:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 263DAB21A7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 15:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52846192B95;
	Mon, 26 Aug 2024 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baO+0YTe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A803194A5B;
	Mon, 26 Aug 2024 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684938; cv=none; b=RnXd/VMtSSc223PFYIETlp8twLf0IyY7xYRoBl4enU9JnjAy7QBFedBALpqqOesg/AXyaAdlV606yt5c1bO1Mq4ExScSjuxT56gJbuKl+WBqNp9frzSO62DW8rMQ+poHMtSZEaKy3iCnTXxTHrQFNt3DUQkV4ZaLHuA4+HsE7ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684938; c=relaxed/simple;
	bh=5blJDuMEX3E4geAq1lFwpcNVREtjQI6qqEGDWBsSQ08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WBSvTbU0hdaHZdBSLTYN7OhSy4TxXq53bHWjMxHRcBkAVgf4mcHQ9vIRA23T6GM/SyhHu3ZITS9N+t0mUN5t+Pmu7Z6VdUX6Fm2LUkZzv7lZc6zV42zGkMJ8kwpPOsoi9VMAfSEyUBVUCiDJ10hcOomgiHt7SgKJqLQBuPdInC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baO+0YTe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C19C4FF64;
	Mon, 26 Aug 2024 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724684937;
	bh=5blJDuMEX3E4geAq1lFwpcNVREtjQI6qqEGDWBsSQ08=;
	h=From:To:Cc:Subject:Date:From;
	b=baO+0YTeRUvghxCvZL+FIFHwtWzQt9Se0F2uKUKkMUn990Ny+icb606IHNELPasTm
	 2xZOOl4/P0ztJKizt18imdIYVoPpKZ9M1jS4jPVD7hoG7BxAJSVVLnaFcyyVIEFWGt
	 Ihr+ve+y01hTx0uBuiWXwJ7kHwKSyWKJJVWCirTQZ0SNZMEeiRPlAqoRO1lnSF6L34
	 gJLGyy0CQan+WiC/LRD1Nbl9Czq1AFRsbKVtjITvsk5Rz91JjX9UN7mLVj+nZKCU2z
	 nxV+lAtIA3x9Ae6ojDTz9ONFTub8GmWJCio0wuT3otRqZbhY/DWNpbPum77BgAXLbf
	 zZwmAiiThgKEg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	devi priya <quic_devipriy@quicinc.com>
Subject: [GIT PULL] Qualcomm clock fixes for v6.11
Date: Mon, 26 Aug 2024 10:08:55 -0500
Message-ID: <20240826150856.1647492-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-6.11

for you to fetch changes up to 6357efe3abead68048729adf11a9363881657939:

  clk: qcom: ipq9574: Update the alpha PLL type for GPLLs (2024-08-14 21:56:45 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v6.11

This corrects several issues with the Alpha PLL clock driver.

It updates IPQ9574 GCC driver to correctly use the EVO PLL registers for
GPLL clocks. X1E USB GDSC flags are corrected to leave these in
retention as the controllers are suspended.

----------------------------------------------------------------
Abel Vesa (1):
      clk: qcom: gcc-x1e80100: Fix USB 0 and 1 PHY GDSC pwrsts flags

Satya Priya Kakitapalli (4):
      clk: qcom: clk-alpha-pll: Fix the pll post div mask
      clk: qcom: clk-alpha-pll: Fix the trion pll postdiv set rate API
      clk: qcom: clk-alpha-pll: Fix zonda set_rate failure when PLL is disabled
      clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL

devi priya (1):
      clk: qcom: ipq9574: Update the alpha PLL type for GPLLs

 drivers/clk/qcom/clk-alpha-pll.c | 25 ++++++++++++++++++++++---
 drivers/clk/qcom/gcc-ipq9574.c   | 12 ++++++------
 drivers/clk/qcom/gcc-x1e80100.c  |  4 ++--
 3 files changed, 30 insertions(+), 11 deletions(-)

