Return-Path: <linux-arm-msm+bounces-59271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD993AC2D13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 04:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B7387A41D0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 02:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05C7151991;
	Sat, 24 May 2025 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FU8fKMVo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF8239FCE;
	Sat, 24 May 2025 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748052972; cv=none; b=khrC0H9eCk4B1lBW7JfT7CVmOWECPlCBMWFQH3pWbwn2tlb+r9cfyXi0B/CQyX5oWo3t2GCq3IkZOztOE6Qs/sJpwIdc+Am01Dr/V3A4qt/kcJ8J41DX+ALTpSlsjqRthQY704Y7Irme2aRVz3Kb3srcbusxOT/Wu00kDfusFo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748052972; c=relaxed/simple;
	bh=/sJKcJB9D2opaHxxN17lki+er3heUMPimrFbx5WTMCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qug/P4cR4/q/8z43yG8k5bPx2JqrGDxIFG9LelpVzDFPMkxE8udtzoYYOs72LdM7iIawmITx4yhvzJYAkpmYwA5xutRcgdHYFlwdQmm+6KtahXVTuvrgRNE2DlQ/5O2H8POt57wcfDdmoF8H2OvKb/hxCZAJx1TVgbQb81no3E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FU8fKMVo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B21C4CEE9;
	Sat, 24 May 2025 02:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748052972;
	bh=/sJKcJB9D2opaHxxN17lki+er3heUMPimrFbx5WTMCk=;
	h=From:To:Cc:Subject:Date:From;
	b=FU8fKMVoRwRryhvNxeKp24m9VO5TYN2pBzyNS/sAZ9QVtr0uvYQ80CGB4ERjbHqWe
	 vhpdVLhfdA4Mo0OLUJ5F2rcpWIM76XJGM7mFVjoXWIqe0OU5ucg4B/PjofakxF3kif
	 oa74QyHqvUL7NsWuPHmIW/4dAmLHWbSamJeoJGzl2bFCeb1Tdoz+bKQ1BjpR/bCaqy
	 kh9KI9An+jLszGHvOJQ1GtGiBAlCBnYlvg+tvioDPsD02uZ5SolWd7KPM4006zrxZ2
	 RPSPTHvrui6EFqBMCh2JeZSN08Dgxf+NtBpHPBlW+K1dvViDnZWiJZ21RbUXMQ8tOC
	 ZwuL0GsDLvXVQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Luca Weiss <luca.weiss@fairphone.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [GIT PULL] Qualcomm clock updates for v6.16
Date: Fri, 23 May 2025 21:16:09 -0500
Message-ID: <20250524021610.18621-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.16

for you to fetch changes up to 201bf08ba9e26eeb0a96ba3fd5c026f531b31aed:

  clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS clocks (2025-05-17 19:28:40 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v6.16

Introduce support for the camera clock controller on QCS8300.

Correct wait_val values for a variety of GDSCs, fix X Elite UFS clock
settings, and allow clkaN to be optional in the rpmh clock controller
driver if command db doesn't define it.

----------------------------------------------------------------
Bjorn Andersson (1):
      Merge branch '20250324-sm6350-videocc-v2-2-cc22386433f4@fairphone.com' into clk-for-6.16

Imran Shaik (1):
      clk: qcom: Add support for Camera Clock Controller on QCS8300

Konrad Dybcio (1):
      dt-bindings: clock: add SM6350 QCOM video clock bindings

Luca Weiss (4):
      clk: qcom: camcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: dispcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: gcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: gpucc-sm6350: Add *_wait_val values for GDSCs

Pengyu Luo (1):
      clk: qcom: rpmh: make clkaN optional

Taniya Das (2):
      clk: qcom: gcc: Set FORCE_MEM_CORE_ON for gcc_ufs_axi_clk for 8650/8750
      clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS clocks

Vincent Knecht (1):
      clk: qcom: gcc-msm8939: Fix mclk0 & mclk1 for 24 MHz

Wentao Liang (1):
      clk: qcom: Fix missing error check for dev_pm_domain_attach()

 .../devicetree/bindings/clock/qcom,videocc.yaml    |  20 ++++
 drivers/clk/qcom/apcs-sdx55.c                      |   6 +-
 drivers/clk/qcom/camcc-sa8775p.c                   | 103 ++++++++++++++++++++-
 drivers/clk/qcom/camcc-sm6350.c                    |  18 ++++
 drivers/clk/qcom/clk-rpmh.c                        |  11 +++
 drivers/clk/qcom/dispcc-sm6350.c                   |   3 +
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +-
 drivers/clk/qcom/gcc-sm6350.c                      |   6 ++
 drivers/clk/qcom/gcc-sm8650.c                      |   2 +
 drivers/clk/qcom/gcc-sm8750.c                      |   3 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   4 +
 drivers/clk/qcom/gpucc-sm6350.c                    |   6 ++
 include/dt-bindings/clock/qcom,sm6350-videocc.h    |  27 ++++++
 13 files changed, 204 insertions(+), 9 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,sm6350-videocc.h

