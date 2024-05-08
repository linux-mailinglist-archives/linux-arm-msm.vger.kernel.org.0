Return-Path: <linux-arm-msm+bounces-19457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6D48BF49B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 04:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0DE91C233A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 02:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D5A1118E;
	Wed,  8 May 2024 02:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppM0+glt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790DB8F4E;
	Wed,  8 May 2024 02:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715135811; cv=none; b=sBi6QwkUU2a6hX3qao9IkEDNYr/RwLBjwNk4bxrmqz0Jnkw8ryBRR93aOxGJ3Lz9J7zfAk5qsJ6fE628RKe3N73ks0S5+e3wv4vH+X+MdS11eo68iXrI+BcVObPFLpje57GiU50KOVbAQvwBXhCMjUFZvfuFsU+tINvQTWae/mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715135811; c=relaxed/simple;
	bh=2PPynveNL12tkUUj04gVs+3qBmnAvwSTucwddk4/zUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2uhfJ/4IFTKiSxC72dync0RmAF8AhB8FY4zhwyXz/4Ozt3loThloYJScl3RNCcsSMKhj/jmzDrcHvH5BFTJVc7wjtbxtvPvtYS5BXm78YYZSYwsSMVL4wpJ4a3Qwv+/NY+UWSzoX3CiiT9nvNGVDTaxvOiArw02Z4QHWRipAhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppM0+glt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49E1C2BBFC;
	Wed,  8 May 2024 02:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715135811;
	bh=2PPynveNL12tkUUj04gVs+3qBmnAvwSTucwddk4/zUw=;
	h=From:To:Cc:Subject:Date:From;
	b=ppM0+gltI/PmVr5TPjW+TlrwU5/HCkW7a+ycT9emGK5tH7zScrzfnipLXtl8DsgnY
	 9g51Ki2Xo/CgZh9JQ6YekvgYpWndIA+te0ETkCWROIR45sJ/73RJE9EG2blV3CVMdM
	 cIu2MThfYI35evKHuCr9CV0+CM4OLY3nJtpVI0QE0squZlTI/Lr0uN6VnJOH4J5Br8
	 atO5NFcIfWWiqRG/F0+vR6Ob10p6i/Hv5UBr05uKKrStyxqDuqa5vJgl+/BPvrYeIt
	 3SGZyxDBGlA8CI2ku0zXzW5/+4kWFFiwCtDqV7ywvfHiR/4lsEXZlmu6rxyVTcRQTR
	 vyc8zgGD6fY0g==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Gabor Juhos <j4g8y7@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Nathan Chancellor <nathan@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [GIT PULL] Qualcomm clock updates for v6.10
Date: Tue,  7 May 2024 21:36:48 -0500
Message-ID: <20240508023648.207465-1-andersson@kernel.org>
X-Mailer: git-send-email 2.44.0
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.10

for you to fetch changes up to 3c5b3e17b8fd1f1add5a9477306c355fab126977:

  clk: qcom: clk-alpha-pll: fix rate setting for Stromer PLLs (2024-05-07 21:10:18 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v6.10

Support in RCG and RCG2 are added for supporting setups where the same
frequency can be reached through multiple configurations. This is then
used to rework the IPQ8074 NSS port 5 and 6 clocks to resolve issues
with certain frequencies.

The APSS IPQ5018 PLL type is corrected, to resolve an issue with some
boards failing to boot. The configuration is further corrected, to
reduce the max CPU frequency to its expected value. This comes with a
few more cleanups and corrections for Stromer PLLs.

Kconfig dependencies are corrected for SM8650 GPU and SC8280XP camera
clock controllers.

The MSM8998 Venus clocks are corrected, to make Venus functional.

Downstream remnants related to DisplayPort are cleaned up across SM8450,
SM6350, SM8550, and SM8650.

The MSM8996 CBF PLL is cleaned up by reusing the Huayra APSS register
map.

The seemingly generic configuration of HFPLL is replaced by adding a
QCS404-specific compatible.

On SM8150 the CPUSS AHB clock source clock is removed, as this is not
controlled by Linux.

An unused field is removed in the RPM clock controller context. Missing
MODULE_DEVICE_TABLE is added to MSM8917 and MSM8953 global clock
controller drivers.

----------------------------------------------------------------
Abel Vesa (1):
      clk: qcom: clk-alpha-pll: Skip reconfiguring the running Lucid Evo

Bjorn Andersson (1):
      Merge branch '20240315-apss-ipq-pll-ipq5018-hang-v2-1-6fe30ada2009@gmail.com' into clk-for-6.10

Christian Marangi (3):
      clk: qcom: clk-rcg: introduce support for multiple conf for same freq
      clk: qcom: clk-rcg2: add support for rcg2 freq multi ops
      clk: qcom: gcc-ipq8074: rework nss_port5/6 clock to multiple conf

Christophe JAILLET (1):
      clk: qcom: rpm: Remove an unused field in struct rpm_cc

Dmitry Baryshkov (4):
      clk: qcom: dispcc-sm8450: fix DisplayPort clocks
      clk: qcom: dispcc-sm6350: fix DisplayPort clocks
      clk: qcom: dispcc-sm8550: fix DisplayPort clocks
      clk: qcom: dispcc-sm8650: fix DisplayPort clocks

Gabor Juhos (11):
      clk: qcom: clk-alpha-pll: remove invalid Stromer register offset
      clk: qcom: clk-alpha-pll: reorder Stromer register offsets
      clk: qcom: clk-alpha-pll: fix kerneldoc of struct clk_alpha_pll
      clk: qcom: apss-ipq-pll: use stromer ops for IPQ5018 to fix boot failure
      clk: qcom: apss-ipq-pll: reuse Stromer reg offsets from 'clk_alpha_pll_regs'
      clk: qcom: apss-ipq-pll: move Huayra register map to 'clk_alpha_pll_regs'
      clk: qcom: apss-ipq-pll: constify match data structures
      clk: qcom: apss-ipq-pll: constify clk_init_data structures
      clk: qcom: clk-cbf-8996: use HUAYRA_APSS register map for cbf_pll
      clk: qcom: apss-ipq-pll: fix PLL rate for IPQ5018
      clk: qcom: clk-alpha-pll: fix rate setting for Stromer PLLs

Krzysztof Kozlowski (1):
      clk: qcom: fix module autoloading

Luca Weiss (2):
      dt-bindings: clock: qcom,hfpll: Convert to YAML
      clk: qcom: hfpll: Add QCS404-specific compatible

Marc Gonzalez (1):
      clk: qcom: mmcc-msm8998: fix venus clock issue

Nathan Chancellor (2):
      clk: qcom: Fix SC_CAMCC_8280XP dependencies
      clk: qcom: Fix SM_GPUCC_8650 dependencies

Satya Priya Kakitapalli (1):
      clk: qcom: gcc-sm8150: De-register gcc_cpuss_ahb_clk_src

 .../devicetree/bindings/clock/qcom,hfpll.txt       |  63 --------
 .../devicetree/bindings/clock/qcom,hfpll.yaml      |  69 +++++++++
 drivers/clk/qcom/Kconfig                           |   2 +
 drivers/clk/qcom/apss-ipq-pll.c                    |  75 +++++-----
 drivers/clk/qcom/clk-alpha-pll.c                   |  24 ++-
 drivers/clk/qcom/clk-alpha-pll.h                   |   5 +-
 drivers/clk/qcom/clk-cbf-8996.c                    |  13 +-
 drivers/clk/qcom/clk-rcg.h                         |  24 ++-
 drivers/clk/qcom/clk-rcg2.c                        | 166 +++++++++++++++++++++
 drivers/clk/qcom/clk-rpm.c                         |   1 -
 drivers/clk/qcom/common.c                          |  18 +++
 drivers/clk/qcom/common.h                          |   2 +
 drivers/clk/qcom/dispcc-sm6350.c                   |  11 +-
 drivers/clk/qcom/dispcc-sm8450.c                   |  20 +--
 drivers/clk/qcom/dispcc-sm8550.c                   |  20 +--
 drivers/clk/qcom/dispcc-sm8650.c                   |  20 +--
 drivers/clk/qcom/gcc-ipq8074.c                     | 120 +++++++++------
 drivers/clk/qcom/gcc-msm8917.c                     |   1 +
 drivers/clk/qcom/gcc-msm8953.c                     |   1 +
 drivers/clk/qcom/gcc-sm8150.c                      |  61 --------
 drivers/clk/qcom/hfpll.c                           |   6 +-
 drivers/clk/qcom/mmcc-msm8998.c                    |   8 +
 22 files changed, 445 insertions(+), 285 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,hfpll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,hfpll.yaml

