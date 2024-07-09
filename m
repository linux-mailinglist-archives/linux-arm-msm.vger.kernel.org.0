Return-Path: <linux-arm-msm+bounces-25744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52F292C3FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 21:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB2061C22445
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 19:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4BD18003A;
	Tue,  9 Jul 2024 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0Q0VAAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83690839E4;
	Tue,  9 Jul 2024 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720553979; cv=none; b=YsQwkrKgkXOe5W7472Yq63NU75v94kpp5aAXVEAw6PYU1rg0udZGZOmghriNQcHkhBqnEOVhz2K2Q1JBT1armtHCgbbvM8H6z/SolTAYpzAtwALXIQ+MiO0WIPPGhlyH/mVzF4zETj2clcYr1ArQpltQ/s2GJ6l22/ScshOwCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720553979; c=relaxed/simple;
	bh=I89yLdaDuR7xDwlnar8naIjNdxnNqs0sCv2ibNzBMf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9qmw4Fi6QlStFvcTnmLCwaN4l9YnyFz/HdOU6NWMFMjA4cuBJO9e4aUhNYNKfQIss0SP80FtqsNwy6E4kCosc5D7y3wsLLft1YzI7XIno6G1JJkKSwJUR/Xok/C+1uJzwNjchJ52JB4lqvXoeKItja1k9QzwCCE+bZdS6RwBRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0Q0VAAt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20EFC3277B;
	Tue,  9 Jul 2024 19:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720553979;
	bh=I89yLdaDuR7xDwlnar8naIjNdxnNqs0sCv2ibNzBMf4=;
	h=From:To:Cc:Subject:Date:From;
	b=q0Q0VAAtDbxC4ZkNK5MS8jtMvc2DVgqJq1EHOeJQDQz5aUx2nMPHx7yma5NuUK1rq
	 yP64ecPOEICPec7JBv26EGhZmvbuC5Ywp4Mv7C4hKyINHCseKvlmwg/C3P9qQ7C4Ge
	 35Fv0p8bUkNEiCJRYAaOXHf/nNthw2VCgPT5h/NO1PhpyqpzDeclyhWuImwexayIqY
	 qDUQVMn/n+JliOyGiRcBnWw1kET3MOo8Wotn2R0cltoSEPJqzLuCsBaYoVkOH0sFhN
	 UoLRDwkMviNcdhBAGiLDrPdvz3f5kIfRKK+C0pDzhRReHbM0HJxSz9oLoQE6dkVLko
	 T4qBDwVPB2IYA==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [GIT PULL] A few more Qualcomm clk updates for v6.11
Date: Tue,  9 Jul 2024 14:39:27 -0500
Message-ID: <20240709193927.4424-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit f27e42c7d3ff8ddfc57273efd1e8642ea89bad90:

  clk: qcom: gcc-x1e80100: Fix halt_check for all pipe clocks (2024-07-01 22:28:05 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.11-2

for you to fetch changes up to 23711cabe122ef55bcb2e5c3e3835b5a2a688fc0:

  clk: qcom: ipq9574: Use icc-clk for enabling NoC related clocks (2024-07-08 11:40:57 -0500)

----------------------------------------------------------------
A few more Qualcomm clk updates for v6.11

This introduces helper logic to expose clock controllers as simple
interconnect providers, and used this on ipq9574 to add the the system's
interconnect providers.

CLK_SET_RATE_PARENT is added to the remaining USB pipe clocks on
X1Elite.

Error handling is improved in kpss-xcc, and lastly the SC8280XP LPASS
clock controller regmap_config is declared const.

----------------------------------------------------------------
Abel Vesa (1):
      clk: qcom: gcc-x1e80100: Set parent rate for USB3 sec and tert PHY pipe clks

Bjorn Andersson (1):
      Merge branch '20240430064214.2030013-3-quic_varada@quicinc.com' into clk-for-6.11

Chen Ni (1):
      clk: qcom: kpss-xcc: Return of_clk_add_hw_provider to transfer the error

Javier Carrasco (1):
      clk: qcom: lpasscc-sc8280xp: Constify struct regmap_config

Satya Priya Kakitapalli (1):
      dt-bindings: clock: qcom: Add AHB clock for SM8150

Varadarajan Narayanan (5):
      dt-bindings: interconnect: Add Qualcomm IPQ9574 support
      interconnect: icc-clk: Specify master/slave ids
      interconnect: icc-clk: Add devm_icc_clk_register
      clk: qcom: common: Add interconnect clocks support
      clk: qcom: ipq9574: Use icc-clk for enabling NoC related clocks

 .../bindings/clock/qcom,ipq9574-gcc.yaml           |  3 ++
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 17 ++++++-
 drivers/clk/qcom/Kconfig                           |  2 +
 drivers/clk/qcom/clk-cbf-8996.c                    |  7 ++-
 drivers/clk/qcom/common.c                          | 35 ++++++++++++-
 drivers/clk/qcom/common.h                          |  9 ++++
 drivers/clk/qcom/gcc-ipq9574.c                     | 33 ++++++++++++
 drivers/clk/qcom/gcc-x1e80100.c                    |  2 +
 drivers/clk/qcom/kpss-xcc.c                        |  4 +-
 drivers/clk/qcom/lpasscc-sc8280xp.c                |  4 +-
 drivers/interconnect/icc-clk.c                     | 24 +++++++--
 include/dt-bindings/interconnect/qcom,ipq9574.h    | 59 ++++++++++++++++++++++
 include/linux/interconnect-clk.h                   |  4 ++
 13 files changed, 192 insertions(+), 11 deletions(-)
 create mode 100644 include/dt-bindings/interconnect/qcom,ipq9574.h

