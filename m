Return-Path: <linux-arm-msm+bounces-37458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060D69C3C05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 11:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D273B2228F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 10:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938E01581EE;
	Mon, 11 Nov 2024 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVmw5MMb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D00156676;
	Mon, 11 Nov 2024 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731321184; cv=none; b=OO1PXQgeKLiGdbmhHvocpzwpmPNQ71QAr4Dn+oqiR4UXX7amNYwA3/V+0MaK59QkvW5h98k2P07JpbcJdt/3MBIlQQ9TjWLq7qC/xaSyol/JukLmWSFMeOVnXF7y9/4tflXcfiqTgkXQCA7zLACQUy7fhVLjILIaolI8InvuovQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731321184; c=relaxed/simple;
	bh=NjPJn+zfrKu3tcRhst3xGKHkantZhJOFnxnhWOpcfh0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oMJIXxiHJMP/9+vJjSTg/qtptGboeez5aXpB6j43YDi/zierFqqUgug1DdDLqosgFL4KPGz7i34fLJj0bYPrjkg0ovbd1c/IF6+5QWN/+bYZzZ9KvjDiRYyH6KSV3kpWUj91jgiLQz8ept7Z50mVmbK9ubPWhO4Klxw5ZhDiQWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVmw5MMb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56530C4CECF;
	Mon, 11 Nov 2024 10:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731321183;
	bh=NjPJn+zfrKu3tcRhst3xGKHkantZhJOFnxnhWOpcfh0=;
	h=From:To:Cc:Subject:Date:From;
	b=tVmw5MMb3lf8EdeG/sOBDMHo/5P9xNH+eGqTG1Zia20nuVYLIP+kV/snNWmeA80nz
	 LbRkQmJe0BfUsXbIk9vxCyHuxwOtBhC10X1Y9ZWeZZJSKhlVdt6lRV20swIG3GJnCZ
	 4+D9CBMGyHc4iwOdLvNOX5NugJLal/ZER2HhJCLLv5JOHvlqVE/CAJwHxj7Y0iEWZJ
	 S0EWrMOzmB898vY0oVouYB8WwWDl5o09vzY+/4S+tR9Lu32ZmJgd0/oBZb0OyTmHBC
	 uuxxUA2iGi25V2RTXOm63AyIJqXPOvgEHAtsQFWhH6Rhu7dqRXVhbkjSsBkJx+cwBm
	 9ZFnkiGdGCXpg==
From: Arnd Bergmann <arnd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: remove unused data from gcc-ipq5424.c
Date: Mon, 11 Nov 2024 11:32:51 +0100
Message-Id: <20241111103258.3336183-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver causes a warnings when enabling -Wunused-const-variables:

drivers/clk/qcom/gcc-ipq5424.c:1064:30: error: 'ftbl_gcc_q6_axi_clk_src' defined but not used [-Werror=unused-const-variable=]
 1064 | static const struct freq_tbl ftbl_gcc_q6_axi_clk_src[] = {
      |                              ^~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/qcom/gcc-ipq5424.c:957:30: error: 'ftbl_gcc_qpic_clk_src' defined but not used [-Werror=unused-const-variable=]
  957 | static const struct freq_tbl ftbl_gcc_qpic_clk_src[] = {
      |                              ^~~~~~~~~~~~~~~~~~~~~
drivers/clk/qcom/gcc-ipq5424.c:497:30: error: 'ftbl_gcc_qupv3_2x_core_clk_src' defined but not used [-Werror=unused-const-variable=]
  497 | static const struct freq_tbl ftbl_gcc_qupv3_2x_core_clk_src[] = {
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In order to hopefully enable this warning by default in the future,
remove the data for now. If it gets used in the future, it can
trivially get added back.

Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/qcom/gcc-ipq5424.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 3458c1c98bb7..88a7d5b2e751 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -494,11 +494,6 @@ static struct clk_rcg2 gcc_pcie_aux_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_qupv3_2x_core_clk_src[] = {
-	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
-	{ }
-};
-
 static const struct freq_tbl ftbl_gcc_qupv3_i2c0_clk_src[] = {
 	F(4800000, P_XO, 5, 0, 0),
 	F(9600000, P_XO, 2.5, 0, 0),
@@ -954,13 +949,6 @@ static struct clk_rcg2 gcc_qpic_io_macro_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_qpic_clk_src[] = {
-	F(24000000, P_XO, 1, 0, 0),
-	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
-	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 gcc_qpic_clk_src = {
 	.cmd_rcgr = 0x32020,
 	.mnd_width = 0,
@@ -1061,12 +1049,6 @@ static struct clk_regmap_div gcc_qupv3_i2c1_div_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_q6_axi_clk_src[] = {
-	F(480000000, P_GPLL4_OUT_AUX, 2.5, 0, 0),
-	F(533333333, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
-	{ }
-};
-
 static struct clk_regmap_div gcc_usb0_mock_utmi_div_clk_src = {
 	.reg = 0x2c040,
 	.shift = 0,
-- 
2.39.5


