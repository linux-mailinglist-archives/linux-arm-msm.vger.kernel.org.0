Return-Path: <linux-arm-msm+bounces-36840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ECC9BA2D4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 23:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96CC71C2181C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 22:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CD71ABEB7;
	Sat,  2 Nov 2024 22:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGb1ElCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4C11AB6DD;
	Sat,  2 Nov 2024 22:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730587199; cv=none; b=NiEjVxpXDE59rmQ6QFFwyZUt6nCJq5ICRacSgSieqRxALrC4JRo1LHLMt+RiBNadct0OsKlepjbaH4BT03QIjYi+VxCtt6b50sWUG4pImpKe7yt/0Sna0tBAwA49HMoOQj7MO1c36uLagcDT4sH0d7odztNy3ZvKS8Cu/53vKwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730587199; c=relaxed/simple;
	bh=aL8vPt43xOAa05XThvzCfmCy6Q4q+AcnEyVn/oe/3t4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZxBQm3FVw29d28cclI8OBEKCPhJYWioUXvdTBzSe0PRaDx0TccUh0dyYHi5n9nEf+nUqAuBaqODr/Q2jHEgU5BpMLTjtFZ0WvGCZGmbnn87bo66FdmavRhK26Wv/QUcX+Olv9tc2mfYbk1AxTQBSIFUL6bq/TCvXJfMcXL5kpAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGb1ElCR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA96C4CEC3;
	Sat,  2 Nov 2024 22:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730587198;
	bh=aL8vPt43xOAa05XThvzCfmCy6Q4q+AcnEyVn/oe/3t4=;
	h=From:To:Cc:Subject:Date:From;
	b=bGb1ElCR/c+MYDKNQVBAAScpxc1MPAPifV494KIS/oagZee4soo36OQXiu/B6PwVq
	 CoyZhMeTVS/YKTaNX/7Ik4n3wG0q3Ue5J9DKaMnX8RPnEnhVVvUewQ0tEHu/tX3VSI
	 m9Ey8Cf92FQYA2nxKhA/hFL8Cst95YZBptnni1ms4hv9bTYGP5CJg1e7msWjaDY9D3
	 GC5vv4d6GtQdz0JMB2htF7rGexhRjj+nyjd54NtOTXoRkiLD0PTLW/OdBVWC5sEV+F
	 XexxKY5diKhrEHe17Za3qOZ+OtoDTdu3J52WM7Mu8GgHZYuo21CYH2p48v3UdX+vXS
	 /m6EzIKZiZlAg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abel.vesa@linaro.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Qiang Yu <quic_qianyu@quicinc.com>
Subject: [GIT PULL] Qualcomm clock fixes for v6.12
Date: Sat,  2 Nov 2024 17:39:54 -0500
Message-ID: <20241102223956.868257-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-6.12

for you to fetch changes up to e7f37a7d16310d3c9474825de26a67f00983ebea:

  clk: qcom: gcc-x1e80100: Fix USB MP SS1 PHY GDSC pwrsts flags (2024-10-22 15:35:15 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v6.12

Correct flags for X Elite USB MP GDSC and pcie pipediv2 clocks. Fix
alpha PLL post_div mask for the cases where width is not specified.
Enable the use of the recently introduced HW_CTRL trigger feature for
SM8350 video clocks, to avoid hangs in the venus driver.

----------------------------------------------------------------
Abel Vesa (1):
      clk: qcom: gcc-x1e80100: Fix USB MP SS1 PHY GDSC pwrsts flags

Barnabás Czémán (1):
      clk: qcom: clk-alpha-pll: Fix pll post div mask when width is not set

Johan Hovold (1):
      clk: qcom: videocc-sm8350: use HW_CTRL_TRIGGER for vcodec GDSCs

Qiang Yu (1):
      clk: qcom: gcc-x1e80100: Fix halt_check for pipediv2 clocks

 drivers/clk/qcom/clk-alpha-pll.c  |  2 +-
 drivers/clk/qcom/gcc-x1e80100.c   | 12 ++++++------
 drivers/clk/qcom/videocc-sm8350.c |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

