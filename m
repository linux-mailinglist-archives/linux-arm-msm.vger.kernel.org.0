Return-Path: <linux-arm-msm+bounces-25742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B54D492C3F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 21:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C1F9B21502
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 19:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC40839E4;
	Tue,  9 Jul 2024 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7Qreu3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC61B86DE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720553926; cv=none; b=tYNF1KDNp1U31lxm7NZLQstBPdyxOYBpED+SkYy3qfqNKuWmS3E+aPmEF2H/H8d1+IMy81k13UpC8L6XojmQstMH9YFAjsxp2lUDE5j80zH0hJo4YanoB9mEOxqaHBkkVgcAFcbndGCEyTTk8ECrdDpVQleYjHbTfQY8rpt5Tn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720553926; c=relaxed/simple;
	bh=I89yLdaDuR7xDwlnar8naIjNdxnNqs0sCv2ibNzBMf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FBzsiLMs6MMlqQ0968WE8wJVBmdJu/CZQCzOaPyh62hkAOluuqJCp66bX3EsurinLcg9KzwWedVkn844HKo26jg53+7fI+OEJhlR+cx9RH+6mRATKXyL7vzhL5Lrxwl2b8ByM65mjH0QFwlnQiNOVbPtl24ZxAsYuy9/a3rnZJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7Qreu3l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1755AC3277B;
	Tue,  9 Jul 2024 19:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720553926;
	bh=I89yLdaDuR7xDwlnar8naIjNdxnNqs0sCv2ibNzBMf4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=U7Qreu3lLj6r3RLUWrRBktTAw23d9WFavv35stcvwuFDzcyPqOIqShKBfpjX8nFHa
	 MAnaYiWpMSdUDTQLBdvNLNyLeUtV/6pwatxOmdpw0wCYEM/tlzHJWhdo12+uJXlVH2
	 lXZsDu+7rGIE6+2nm7b2SRkpN5K2EODUsoKTQ08LlNoK3ppjfgqMiKoeXGoUW50Gis
	 IWoEd10D0OIiLGKhQ0nGppWbY4Lrzu5B2RjjQS9om3NHGTce/3xsSOeAFv5RaW2Xo4
	 RMFpTa4zWeet6KMJEjQnrE55PGTiDPJ49snu3coDv5HCmaQFeOPu42IOF/GkO11DsM
	 R+wGMJipEejbg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [GIT PULL] A few more Qualcomm clk updates for v6.11
Date: Tue,  9 Jul 2024 14:38:31 -0500
Message-ID: <20240709193832.4270-1-andersson@kernel.org>
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

