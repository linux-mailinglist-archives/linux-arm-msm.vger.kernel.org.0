Return-Path: <linux-arm-msm+bounces-26095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E0E930A00
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jul 2024 15:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B053F1F21922
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jul 2024 13:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB9873469;
	Sun, 14 Jul 2024 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LFEBr4FN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3220EB;
	Sun, 14 Jul 2024 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720962138; cv=none; b=cMBVHEaKlhhFS5cmQuFiB5QMfPZdlH/meH5kdSe652ormJkfFIkYOFEI2gb4jEX9GM7LtlmJwiX33N6EFCu6iNLH1iH/QytdsW7St6fA/5E/GB6VFZ3e8tDhN2rujL4TR3X6h/bxQEKPYcN3ehRQ0kM++GqlmV4hpFjds6YBAUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720962138; c=relaxed/simple;
	bh=2dqy13c61ovXzkOuYZdd17Nxu+Okd9i5g6iHiGR7U3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q5DLdcdJVKd2A7JF9WRkjtZM2cxQyB9YUAGraibeWAJCR2yPwtxfBRbeXL6XaYGaSpcV0mXnJSvzExrV4oYJcwKqkXAsfy37OY7Vb/EPbjn4TcXlr77rHG42tzwdePFBf2TbYNXj0r2x05xtYuG1SmDvo8W6ZVC+owzoKsOE4JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=LFEBr4FN; arc=none smtp.client-ip=80.12.242.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id SyrjslnbZVHKTSyrjs0Tjy; Sun, 14 Jul 2024 15:02:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720962132;
	bh=AKUsZgH2omtFsPwLt2zptb0F2srBzOiGeAC69ZWs5jE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=LFEBr4FNMaXDNn8mAq05tkd5jwYZegDCFGYKktl1cxLg2Wg9P/SSPMPbp/YTye2+v
	 hhSk7b+g7yDs67J5mJz4dbWMkghmtAIK+LxXbNWYX4+ghNYprrmlzhIkMqQ6k19hyl
	 zA1Hw2ymBHBUvm4IlS9DQIvtrtNbsXVOcIXMqqZ3zqUh51XS2mrZkeWEdDeusalF2V
	 WraIaEBmW+ilfDTQngsyC/hQGihvHU7P6eavxe5YbgZoliTnKTfgwXwNxk9gYkhjuK
	 /crG3E97aCLghBuDPPRAn8NawCDV21OMjLC4KVLy7O5T8/DqCY7nQlavjgIuAz5JSJ
	 MgihY2HM+tf/w==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Jul 2024 15:02:12 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: Constify struct freq_tbl
Date: Sun, 14 Jul 2024 15:01:58 +0200
Message-ID: <e8aee66fa83a4e65f7e855eb8bdbc91275d6994b.1720962107.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct freq_tbl' are not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   7595	  43696	      0	  51291	   c85b	drivers/clk/qcom/mmcc-apq8084.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   9867	  41424	      0	  51291	   c85b	drivers/clk/qcom/mmcc-apq8084.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.

I hope that it can be applied with this single patch because all files are
in drivers/clk/qcom/.
---
 drivers/clk/qcom/gcc-ipq6018.c  |  2 +-
 drivers/clk/qcom/gcc-ipq806x.c  |  4 +--
 drivers/clk/qcom/gcc-ipq8074.c  |  4 +--
 drivers/clk/qcom/gcc-mdm9615.c  |  4 +--
 drivers/clk/qcom/gcc-msm8660.c  |  4 +--
 drivers/clk/qcom/gcc-msm8960.c  |  6 ++--
 drivers/clk/qcom/gcc-msm8994.c  | 54 ++++++++++++++++-----------------
 drivers/clk/qcom/gcc-msm8996.c  |  2 +-
 drivers/clk/qcom/gcc-msm8998.c  |  2 +-
 drivers/clk/qcom/lcc-ipq806x.c  |  8 ++---
 drivers/clk/qcom/lcc-msm8960.c  |  8 ++---
 drivers/clk/qcom/mmcc-apq8084.c | 50 +++++++++++++++---------------
 drivers/clk/qcom/mmcc-msm8960.c | 30 +++++++++---------
 drivers/clk/qcom/mmcc-msm8974.c | 52 +++++++++++++++----------------
 drivers/clk/qcom/mmcc-msm8994.c |  8 ++---
 drivers/clk/qcom/mmcc-msm8996.c |  8 ++---
 16 files changed, 123 insertions(+), 123 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index 2e411d874662..ab0f7fc665a9 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -2684,7 +2684,7 @@ static struct clk_rcg2 lpass_q6_axim_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_rbcpr_wcss_clk_src[] = {
+static const struct freq_tbl ftbl_rbcpr_wcss_clk_src[] = {
 	F(24000000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 16, 0, 0),
 	{ }
diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index 974d01fd4381..9260e2fdb839 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -390,7 +390,7 @@ static const struct clk_parent_data gcc_pxo_pll3_pll0_pll14_pll18_pll11[] = {
 
 };
 
-static struct freq_tbl clk_tbl_gsbi_uart[] = {
+static const struct freq_tbl clk_tbl_gsbi_uart[] = {
 	{  1843200, P_PLL8, 2,  6, 625 },
 	{  3686400, P_PLL8, 2, 12, 625 },
 	{  7372800, P_PLL8, 2, 24, 625 },
@@ -714,7 +714,7 @@ static struct clk_branch gsbi7_uart_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_gsbi_qup[] = {
+static const struct freq_tbl clk_tbl_gsbi_qup[] = {
 	{  1100000, P_PXO,  1, 2, 49 },
 	{  5400000, P_PXO,  1, 1,  5 },
 	{ 10800000, P_PXO,  1, 2,  5 },
diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 32fd01ef469a..7258ba5c0900 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -1947,7 +1947,7 @@ static struct clk_regmap_div nss_port6_tx_div_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_crypto_clk_src[] = {
+static const struct freq_tbl ftbl_crypto_clk_src[] = {
 	F(40000000, P_GPLL0_DIV2, 10, 0, 0),
 	F(80000000, P_GPLL0, 10, 0, 0),
 	F(100000000, P_GPLL0, 8, 0, 0),
@@ -1968,7 +1968,7 @@ static struct clk_rcg2 crypto_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_gp_clk_src[] = {
+static const struct freq_tbl ftbl_gp_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
index 33987b957737..37fc5607b2d3 100644
--- a/drivers/clk/qcom/gcc-mdm9615.c
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -164,7 +164,7 @@ static const struct clk_parent_data gcc_cxo_pll14[] = {
 	{ .hw = &pll14_vote.hw },
 };
 
-static struct freq_tbl clk_tbl_gsbi_uart[] = {
+static const struct freq_tbl clk_tbl_gsbi_uart[] = {
 	{  1843200, P_PLL8, 2,  6, 625 },
 	{  3686400, P_PLL8, 2, 12, 625 },
 	{  7372800, P_PLL8, 2, 24, 625 },
@@ -437,7 +437,7 @@ static struct clk_branch gsbi5_uart_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_gsbi_qup[] = {
+static const struct freq_tbl clk_tbl_gsbi_qup[] = {
 	{   960000, P_CXO,  4, 1,  5 },
 	{  4800000, P_CXO,  4, 0,  1 },
 	{  9600000, P_CXO,  2, 0,  1 },
diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index 67870c899ab9..a6a4477ccdef 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -82,7 +82,7 @@ static const struct clk_parent_data gcc_pxo_pll8_cxo[] = {
 	{ .fw_name = "cxo", .name = "cxo_board" },
 };
 
-static struct freq_tbl clk_tbl_gsbi_uart[] = {
+static const struct freq_tbl clk_tbl_gsbi_uart[] = {
 	{  1843200, P_PLL8, 2,  6, 625 },
 	{  3686400, P_PLL8, 2, 12, 625 },
 	{  7372800, P_PLL8, 2, 24, 625 },
@@ -712,7 +712,7 @@ static struct clk_branch gsbi12_uart_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_gsbi_qup[] = {
+static const struct freq_tbl clk_tbl_gsbi_qup[] = {
 	{  1100000, P_PXO,  1, 2, 49 },
 	{  5400000, P_PXO,  1, 1,  5 },
 	{ 10800000, P_PXO,  1, 2,  5 },
diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 6236a458e4eb..a82a8212e322 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -328,7 +328,7 @@ static const struct clk_parent_data gcc_pxo_pll8_pll3[] = {
 	{ .hw = &pll3.clkr.hw },
 };
 
-static struct freq_tbl clk_tbl_gsbi_uart[] = {
+static const struct freq_tbl clk_tbl_gsbi_uart[] = {
 	{  1843200, P_PLL8, 2,  6, 625 },
 	{  3686400, P_PLL8, 2, 12, 625 },
 	{  7372800, P_PLL8, 2, 24, 625 },
@@ -958,7 +958,7 @@ static struct clk_branch gsbi12_uart_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_gsbi_qup[] = {
+static const struct freq_tbl clk_tbl_gsbi_qup[] = {
 	{  1100000, P_PXO,  1, 2, 49 },
 	{  5400000, P_PXO,  1, 1,  5 },
 	{ 10800000, P_PXO,  1, 2,  5 },
@@ -2940,7 +2940,7 @@ static struct clk_branch adm0_pbus_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_ce3[] = {
+static const struct freq_tbl clk_tbl_ce3[] = {
 	{ 48000000, P_PLL8, 8 },
 	{ 100000000, P_PLL3, 12 },
 	{ 120000000, P_PLL3, 10 },
diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 80170a805c3b..6a6b7da2b151 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -112,7 +112,7 @@ static const struct clk_parent_data gcc_xo_gpll0_gpll4[] = {
 	{ .hw = &gpll4.clkr.hw },
 };
 
-static struct freq_tbl ftbl_ufs_axi_clk_src[] = {
+static const struct freq_tbl ftbl_ufs_axi_clk_src[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(150000000, P_GPLL0, 4, 0, 0),
@@ -136,7 +136,7 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_usb30_master_clk_src[] = {
+static const struct freq_tbl ftbl_usb30_master_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(125000000, P_GPLL0, 1, 5, 24),
 	{ }
@@ -156,7 +156,7 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blsp_i2c_apps_clk_src[] = {
+static const struct freq_tbl ftbl_blsp_i2c_apps_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 12, 0, 0),
 	{ }
@@ -175,7 +175,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blsp1_qup1_spi_apps_clk_src[] = {
+static const struct freq_tbl ftbl_blsp1_qup1_spi_apps_clk_src[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
@@ -188,7 +188,7 @@ static struct freq_tbl ftbl_blsp1_qup1_spi_apps_clk_src[] = {
 	{ }
 };
 
-static struct freq_tbl ftbl_blsp1_qup_spi_apps_clk_src_8992[] = {
+static const struct freq_tbl ftbl_blsp1_qup_spi_apps_clk_src_8992[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
@@ -226,7 +226,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blsp1_qup2_spi_apps_clk_src[] = {
+static const struct freq_tbl ftbl_blsp1_qup2_spi_apps_clk_src[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
@@ -266,7 +266,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blsp1_qup3_4_spi_apps_clk_src[] = {
+static const struct freq_tbl ftbl_blsp1_qup3_4_spi_apps_clk_src[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
@@ -333,7 +333,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blsp1_qup5_spi_apps_clk_src[] = {
+static const struct freq_tbl ftbl_blsp1_qup5_spi_apps_clk_src[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
@@ -373,7 +373,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blsp1_qup6_spi_apps_clk_src[] = {
+static const struct freq_tbl ftbl_blsp1_qup6_spi_apps_clk_src[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
@@ -400,7 +400,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blsp_uart_apps_clk_src[] = {
+static const struct freq_tbl ftbl_blsp_uart_apps_clk_src[] = {
 	F(3686400, P_GPLL0, 1, 96, 15625),
 	F(7372800, P_GPLL0, 1, 192, 15625),
 	F(14745600, P_GPLL0, 1, 384, 15625),
@@ -516,7 +516,7 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blsp2_qup1_2_spi_apps_clk_src[] = {
+static const struct freq_tbl ftbl_blsp2_qup1_2_spi_apps_clk_src[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
@@ -570,7 +570,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blsp2_qup3_4_spi_apps_clk_src[] = {
+static const struct freq_tbl ftbl_blsp2_qup3_4_spi_apps_clk_src[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
@@ -678,7 +678,7 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blsp2_qup6_spi_apps_clk_src[] = {
+static const struct freq_tbl ftbl_blsp2_qup6_spi_apps_clk_src[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
@@ -789,7 +789,7 @@ static struct clk_rcg2 blsp2_uart6_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_gp1_clk_src[] = {
+static const struct freq_tbl ftbl_gp1_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(200000000, P_GPLL0, 3, 0, 0),
@@ -810,7 +810,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_gp2_clk_src[] = {
+static const struct freq_tbl ftbl_gp2_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(200000000, P_GPLL0, 3, 0, 0),
@@ -831,7 +831,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_gp3_clk_src[] = {
+static const struct freq_tbl ftbl_gp3_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(200000000, P_GPLL0, 3, 0, 0),
@@ -852,7 +852,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_pcie_0_aux_clk_src[] = {
+static const struct freq_tbl ftbl_pcie_0_aux_clk_src[] = {
 	F(1011000, P_XO, 1, 1, 19),
 	{ }
 };
@@ -872,7 +872,7 @@ static struct clk_rcg2 pcie_0_aux_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_pcie_pipe_clk_src[] = {
+static const struct freq_tbl ftbl_pcie_pipe_clk_src[] = {
 	F(125000000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -891,7 +891,7 @@ static struct clk_rcg2 pcie_0_pipe_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_pcie_1_aux_clk_src[] = {
+static const struct freq_tbl ftbl_pcie_1_aux_clk_src[] = {
 	F(1011000, P_XO, 1, 1, 19),
 	{ }
 };
@@ -925,7 +925,7 @@ static struct clk_rcg2 pcie_1_pipe_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_pdm2_clk_src[] = {
+static const struct freq_tbl ftbl_pdm2_clk_src[] = {
 	F(60000000, P_GPLL0, 10, 0, 0),
 	{ }
 };
@@ -943,7 +943,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_sdcc1_apps_clk_src[] = {
+static const struct freq_tbl ftbl_sdcc1_apps_clk_src[] = {
 	F(144000, P_XO, 16, 3, 25),
 	F(400000, P_XO, 12, 1, 4),
 	F(20000000, P_GPLL0, 15, 1, 2),
@@ -955,7 +955,7 @@ static struct freq_tbl ftbl_sdcc1_apps_clk_src[] = {
 	{ }
 };
 
-static struct freq_tbl ftbl_sdcc1_apps_clk_src_8992[] = {
+static const struct freq_tbl ftbl_sdcc1_apps_clk_src_8992[] = {
 	F(144000, P_XO, 16, 3, 25),
 	F(400000, P_XO, 12, 1, 4),
 	F(20000000, P_GPLL0, 15, 1, 2),
@@ -981,7 +981,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_sdcc2_4_apps_clk_src[] = {
+static const struct freq_tbl ftbl_sdcc2_4_apps_clk_src[] = {
 	F(144000, P_XO, 16, 3, 25),
 	F(400000, P_XO, 12, 1, 4),
 	F(20000000, P_GPLL0, 15, 1, 2),
@@ -1034,7 +1034,7 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_tsif_ref_clk_src[] = {
+static const struct freq_tbl ftbl_tsif_ref_clk_src[] = {
 	F(105500, P_XO, 1, 1, 182),
 	{ }
 };
@@ -1054,7 +1054,7 @@ static struct clk_rcg2 tsif_ref_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_usb30_mock_utmi_clk_src[] = {
+static const struct freq_tbl ftbl_usb30_mock_utmi_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(60000000, P_GPLL0, 10, 0, 0),
 	{ }
@@ -1073,7 +1073,7 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_usb3_phy_aux_clk_src[] = {
+static const struct freq_tbl ftbl_usb3_phy_aux_clk_src[] = {
 	F(1200000, P_XO, 16, 0, 0),
 	{ }
 };
@@ -1092,7 +1092,7 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_usb_hs_system_clk_src[] = {
+static const struct freq_tbl ftbl_usb_hs_system_clk_src[] = {
 	F(75000000, P_GPLL0, 8, 0, 0),
 	{ }
 };
diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 4fc667b94cf2..aa3bd2777868 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -359,7 +359,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_sdcc1_ice_core_clk_src[] = {
+static const struct freq_tbl ftbl_sdcc1_ice_core_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(150000000, P_GPLL0, 4, 0, 0),
 	F(300000000, P_GPLL0, 2, 0, 0),
diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 90b66caba2cd..0d0cebaf47ce 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2242,7 +2242,7 @@ static struct clk_branch gcc_hmss_trig_clk = {
 	},
 };
 
-static struct freq_tbl ftbl_hmss_gpll0_clk_src[] = {
+static const struct freq_tbl ftbl_hmss_gpll0_clk_src[] = {
 	F( 300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
 	F( 600000000, P_GPLL0_OUT_MAIN, 1, 0, 0),
 	{ }
diff --git a/drivers/clk/qcom/lcc-ipq806x.c b/drivers/clk/qcom/lcc-ipq806x.c
index bf5320a43e8c..bbacd7fedb2f 100644
--- a/drivers/clk/qcom/lcc-ipq806x.c
+++ b/drivers/clk/qcom/lcc-ipq806x.c
@@ -70,7 +70,7 @@ static const struct clk_parent_data lcc_pxo_pll4[] = {
 	{ .fw_name = "pll4_vote", .name = "pll4_vote" },
 };
 
-static struct freq_tbl clk_tbl_aif_mi2s[] = {
+static const struct freq_tbl clk_tbl_aif_mi2s[] = {
 	{  1024000, P_PLL4, 4,  1,  96 },
 	{  1411200, P_PLL4, 4,  2, 139 },
 	{  1536000, P_PLL4, 4,  1,  64 },
@@ -214,7 +214,7 @@ static struct clk_regmap_mux mi2s_bit_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_pcm[] = {
+static const struct freq_tbl clk_tbl_pcm[] = {
 	{   64000, P_PLL4, 4, 1, 1536 },
 	{  128000, P_PLL4, 4, 1,  768 },
 	{  256000, P_PLL4, 4, 1,  384 },
@@ -296,7 +296,7 @@ static struct clk_regmap_mux pcm_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_aif_osr[] = {
+static const struct freq_tbl clk_tbl_aif_osr[] = {
 	{  2822400, P_PLL4, 1, 147, 20480 },
 	{  4096000, P_PLL4, 1,   1,    96 },
 	{  5644800, P_PLL4, 1, 147, 10240 },
@@ -360,7 +360,7 @@ static struct clk_branch spdif_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_ahbix[] = {
+static const struct freq_tbl clk_tbl_ahbix[] = {
 	{ 131072000, P_PLL4, 1, 1, 3 },
 	{ },
 };
diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index d53bf315e9c3..7cba2ce3e408 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -57,7 +57,7 @@ static struct clk_parent_data lcc_pxo_pll4[] = {
 	{ .fw_name = "pll4_vote", .name = "pll4_vote" },
 };
 
-static struct freq_tbl clk_tbl_aif_osr_492[] = {
+static const struct freq_tbl clk_tbl_aif_osr_492[] = {
 	{   512000, P_PLL4, 4, 1, 240 },
 	{   768000, P_PLL4, 4, 1, 160 },
 	{  1024000, P_PLL4, 4, 1, 120 },
@@ -73,7 +73,7 @@ static struct freq_tbl clk_tbl_aif_osr_492[] = {
 	{ }
 };
 
-static struct freq_tbl clk_tbl_aif_osr_393[] = {
+static const struct freq_tbl clk_tbl_aif_osr_393[] = {
 	{   512000, P_PLL4, 4, 1, 192 },
 	{   768000, P_PLL4, 4, 1, 128 },
 	{  1024000, P_PLL4, 4, 1,  96 },
@@ -218,7 +218,7 @@ CLK_AIF_OSR_DIV(spare_i2s_mic, 0x78, 0x7c, 0x80);
 CLK_AIF_OSR_DIV(codec_i2s_spkr, 0x6c, 0x70, 0x74);
 CLK_AIF_OSR_DIV(spare_i2s_spkr, 0x84, 0x88, 0x8c);
 
-static struct freq_tbl clk_tbl_pcm_492[] = {
+static const struct freq_tbl clk_tbl_pcm_492[] = {
 	{   256000, P_PLL4, 4, 1, 480 },
 	{   512000, P_PLL4, 4, 1, 240 },
 	{   768000, P_PLL4, 4, 1, 160 },
@@ -235,7 +235,7 @@ static struct freq_tbl clk_tbl_pcm_492[] = {
 	{ }
 };
 
-static struct freq_tbl clk_tbl_pcm_393[] = {
+static const struct freq_tbl clk_tbl_pcm_393[] = {
 	{   256000, P_PLL4, 4, 1, 384 },
 	{   512000, P_PLL4, 4, 1, 192 },
 	{   768000, P_PLL4, 4, 1, 128 },
diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index c89700ab93f9..cc03722596a4 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -338,7 +338,7 @@ static struct clk_rcg2 mmss_ahb_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mmss_axi_clk[] = {
+static const struct freq_tbl ftbl_mmss_axi_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(37500000, P_GPLL0, 16, 0, 0),
 	F(50000000, P_GPLL0, 12, 0, 0),
@@ -364,7 +364,7 @@ static struct clk_rcg2 mmss_axi_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_ocmemnoc_clk[] = {
+static const struct freq_tbl ftbl_ocmemnoc_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(37500000, P_GPLL0, 16, 0, 0),
 	F(50000000, P_GPLL0, 12, 0, 0),
@@ -389,7 +389,7 @@ static struct clk_rcg2 ocmemnoc_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_csi0_3_clk[] = {
+static const struct freq_tbl ftbl_camss_csi0_3_clk[] = {
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(200000000, P_MMPLL0, 4, 0, 0),
 	{ }
@@ -447,7 +447,7 @@ static struct clk_rcg2 csi3_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_vfe_vfe0_1_clk[] = {
+static const struct freq_tbl ftbl_camss_vfe_vfe0_1_clk[] = {
 	F(37500000, P_GPLL0, 16, 0, 0),
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(60000000, P_GPLL0, 10, 0, 0),
@@ -490,7 +490,7 @@ static struct clk_rcg2 vfe1_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_mdp_clk[] = {
+static const struct freq_tbl ftbl_mdss_mdp_clk[] = {
 	F(37500000, P_GPLL0, 16, 0, 0),
 	F(60000000, P_GPLL0, 10, 0, 0),
 	F(75000000, P_GPLL0, 8, 0, 0),
@@ -530,7 +530,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_jpeg_jpeg0_2_clk[] = {
+static const struct freq_tbl ftbl_camss_jpeg_jpeg0_2_clk[] = {
 	F(75000000, P_GPLL0, 8, 0, 0),
 	F(133330000, P_GPLL0, 4.5, 0, 0),
 	F(200000000, P_GPLL0, 3, 0, 0),
@@ -607,7 +607,7 @@ static struct clk_rcg2 pclk1_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_venus0_vcodec0_clk[] = {
+static const struct freq_tbl ftbl_venus0_vcodec0_clk[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(133330000, P_GPLL0, 4.5, 0, 0),
@@ -631,7 +631,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_avsync_vp_clk[] = {
+static const struct freq_tbl ftbl_avsync_vp_clk[] = {
 	F(150000000, P_GPLL0, 4, 0, 0),
 	F(320000000, P_MMPLL0, 2.5, 0, 0),
 	{ }
@@ -650,7 +650,7 @@ static struct clk_rcg2 vp_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_cci_cci_clk[] = {
+static const struct freq_tbl ftbl_camss_cci_cci_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -669,7 +669,7 @@ static struct clk_rcg2 cci_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_gp0_1_clk[] = {
+static const struct freq_tbl ftbl_camss_gp0_1_clk[] = {
 	F(10000, P_XO, 16, 1, 120),
 	F(24000, P_XO, 16, 1, 50),
 	F(6000000, P_GPLL0, 10, 1, 10),
@@ -707,7 +707,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_mclk0_3_clk[] = {
+static const struct freq_tbl ftbl_camss_mclk0_3_clk[] = {
 	F(4800000, P_XO, 4, 0, 0),
 	F(6000000, P_GPLL0, 10, 1, 10),
 	F(8000000, P_GPLL0, 15, 1, 5),
@@ -777,7 +777,7 @@ static struct clk_rcg2 mclk3_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_phy0_2_csi0_2phytimer_clk[] = {
+static const struct freq_tbl ftbl_camss_phy0_2_csi0_2phytimer_clk[] = {
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(200000000, P_MMPLL0, 4, 0, 0),
 	{ }
@@ -822,7 +822,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_vfe_cpp_clk[] = {
+static const struct freq_tbl ftbl_camss_vfe_cpp_clk[] = {
 	F(133330000, P_GPLL0, 4.5, 0, 0),
 	F(266670000, P_MMPLL0, 3, 0, 0),
 	F(320000000, P_MMPLL0, 2.5, 0, 0),
@@ -871,7 +871,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_edpaux_clk[] = {
+static const struct freq_tbl ftbl_mdss_edpaux_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -889,7 +889,7 @@ static struct clk_rcg2 edpaux_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_edplink_clk[] = {
+static const struct freq_tbl ftbl_mdss_edplink_clk[] = {
 	F(135000000, P_EDPLINK, 2, 0, 0),
 	F(270000000, P_EDPLINK, 11, 0, 0),
 	{ }
@@ -909,7 +909,7 @@ static struct clk_rcg2 edplink_clk_src = {
 	},
 };
 
-static struct freq_tbl edp_pixel_freq_tbl[] = {
+static const struct freq_tbl edp_pixel_freq_tbl[] = {
 	{ .src = P_EDPVCO },
 	{ }
 };
@@ -928,7 +928,7 @@ static struct clk_rcg2 edppixel_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_esc0_1_clk[] = {
+static const struct freq_tbl ftbl_mdss_esc0_1_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -959,7 +959,7 @@ static struct clk_rcg2 esc1_clk_src = {
 	},
 };
 
-static struct freq_tbl extpclk_freq_tbl[] = {
+static const struct freq_tbl extpclk_freq_tbl[] = {
 	{ .src = P_HDMIPLL },
 	{ }
 };
@@ -978,7 +978,7 @@ static struct clk_rcg2 extpclk_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_hdmi_clk[] = {
+static const struct freq_tbl ftbl_mdss_hdmi_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -996,7 +996,7 @@ static struct clk_rcg2 hdmi_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_vsync_clk[] = {
+static const struct freq_tbl ftbl_mdss_vsync_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -1014,7 +1014,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mmss_rbcpr_clk[] = {
+static const struct freq_tbl ftbl_mmss_rbcpr_clk[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	{ }
 };
@@ -1032,7 +1032,7 @@ static struct clk_rcg2 rbcpr_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_oxili_rbbmtimer_clk[] = {
+static const struct freq_tbl ftbl_oxili_rbbmtimer_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -1050,7 +1050,7 @@ static struct clk_rcg2 rbbmtimer_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_vpu_maple_clk[] = {
+static const struct freq_tbl ftbl_vpu_maple_clk[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(133330000, P_GPLL0, 4.5, 0, 0),
@@ -1073,7 +1073,7 @@ static struct clk_rcg2 maple_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_vpu_vdp_clk[] = {
+static const struct freq_tbl ftbl_vpu_vdp_clk[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(200000000, P_MMPLL0, 4, 0, 0),
@@ -1095,7 +1095,7 @@ static struct clk_rcg2 vdp_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_vpu_bus_clk[] = {
+static const struct freq_tbl ftbl_vpu_bus_clk[] = {
 	F(40000000, P_GPLL0, 15, 0, 0),
 	F(80000000, P_MMPLL0, 10, 0, 0),
 	{ }
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index 1061322534c4..3f41249c5ae4 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -155,7 +155,7 @@ static const struct clk_parent_data mmcc_pxo_dsi1_dsi2_byte[] = {
 	{ .fw_name = "dsi2pllbyte", .name = "dsi2pllbyte" },
 };
 
-static struct freq_tbl clk_tbl_cam[] = {
+static const struct freq_tbl clk_tbl_cam[] = {
 	{   6000000, P_PLL8, 4, 1, 16 },
 	{   8000000, P_PLL8, 4, 1, 12 },
 	{  12000000, P_PLL8, 4, 1,  8 },
@@ -323,7 +323,7 @@ static struct clk_branch camclk2_clk = {
 
 };
 
-static struct freq_tbl clk_tbl_csi[] = {
+static const struct freq_tbl clk_tbl_csi[] = {
 	{  27000000, P_PXO,  1, 0, 0 },
 	{  85330000, P_PLL8, 1, 2, 9 },
 	{ 177780000, P_PLL2, 1, 2, 9 },
@@ -715,7 +715,7 @@ static struct clk_pix_rdi csi_rdi2_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_csiphytimer[] = {
+static const struct freq_tbl clk_tbl_csiphytimer[] = {
 	{  85330000, P_PLL8, 1, 2, 9 },
 	{ 177780000, P_PLL2, 1, 2, 9 },
 	{ }
@@ -808,7 +808,7 @@ static struct clk_branch csiphy2_timer_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_gfx2d[] = {
+static const struct freq_tbl clk_tbl_gfx2d[] = {
 	F_MN( 27000000, P_PXO,  1,  0),
 	F_MN( 48000000, P_PLL8, 1,  8),
 	F_MN( 54857000, P_PLL8, 1,  7),
@@ -948,7 +948,7 @@ static struct clk_branch gfx2d1_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_gfx3d[] = {
+static const struct freq_tbl clk_tbl_gfx3d[] = {
 	F_MN( 27000000, P_PXO,  1,  0),
 	F_MN( 48000000, P_PLL8, 1,  8),
 	F_MN( 54857000, P_PLL8, 1,  7),
@@ -968,7 +968,7 @@ static struct freq_tbl clk_tbl_gfx3d[] = {
 	{ }
 };
 
-static struct freq_tbl clk_tbl_gfx3d_8064[] = {
+static const struct freq_tbl clk_tbl_gfx3d_8064[] = {
 	F_MN( 27000000, P_PXO,   0,  0),
 	F_MN( 48000000, P_PLL8,  1,  8),
 	F_MN( 54857000, P_PLL8,  1,  7),
@@ -1058,7 +1058,7 @@ static struct clk_branch gfx3d_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_vcap[] = {
+static const struct freq_tbl clk_tbl_vcap[] = {
 	F_MN( 27000000, P_PXO,  0,  0),
 	F_MN( 54860000, P_PLL8, 1,  7),
 	F_MN( 64000000, P_PLL8, 1,  6),
@@ -1149,7 +1149,7 @@ static struct clk_branch vcap_npl_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_ijpeg[] = {
+static const struct freq_tbl clk_tbl_ijpeg[] = {
 	{  27000000, P_PXO,  1, 0,  0 },
 	{  36570000, P_PLL8, 1, 2, 21 },
 	{  54860000, P_PLL8, 7, 0,  0 },
@@ -1214,7 +1214,7 @@ static struct clk_branch ijpeg_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_jpegd[] = {
+static const struct freq_tbl clk_tbl_jpegd[] = {
 	{  64000000, P_PLL8, 6 },
 	{  76800000, P_PLL8, 5 },
 	{  96000000, P_PLL8, 4 },
@@ -1264,7 +1264,7 @@ static struct clk_branch jpegd_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_mdp[] = {
+static const struct freq_tbl clk_tbl_mdp[] = {
 	{   9600000, P_PLL8, 1, 1, 40 },
 	{  13710000, P_PLL8, 1, 1, 28 },
 	{  27000000, P_PXO,  1, 0,  0 },
@@ -1381,7 +1381,7 @@ static struct clk_branch mdp_vsync_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_rot[] = {
+static const struct freq_tbl clk_tbl_rot[] = {
 	{  27000000, P_PXO,   1 },
 	{  29540000, P_PLL8, 13 },
 	{  32000000, P_PLL8, 12 },
@@ -1461,7 +1461,7 @@ static const struct clk_parent_data mmcc_pxo_hdmi[] = {
 	{ .fw_name = "hdmipll", .name = "hdmi_pll" },
 };
 
-static struct freq_tbl clk_tbl_tv[] = {
+static const struct freq_tbl clk_tbl_tv[] = {
 	{  .src = P_HDMI_PLL, .pre_div = 1 },
 	{ }
 };
@@ -1624,7 +1624,7 @@ static struct clk_branch hdmi_app_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_vcodec[] = {
+static const struct freq_tbl clk_tbl_vcodec[] = {
 	F_MN( 27000000, P_PXO,  1,  0),
 	F_MN( 32000000, P_PLL8, 1, 12),
 	F_MN( 48000000, P_PLL8, 1,  8),
@@ -1699,7 +1699,7 @@ static struct clk_branch vcodec_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_vpe[] = {
+static const struct freq_tbl clk_tbl_vpe[] = {
 	{  27000000, P_PXO,   1 },
 	{  34909000, P_PLL8, 11 },
 	{  38400000, P_PLL8, 10 },
@@ -1752,7 +1752,7 @@ static struct clk_branch vpe_clk = {
 	},
 };
 
-static struct freq_tbl clk_tbl_vfe[] = {
+static const struct freq_tbl clk_tbl_vfe[] = {
 	{  13960000, P_PLL8,  1, 2, 55 },
 	{  27000000, P_PXO,   1, 0,  0 },
 	{  36570000, P_PLL8,  1, 2, 21 },
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index d5bcb09ebd0c..169e85f60550 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -268,7 +268,7 @@ static struct clk_rcg2 mmss_ahb_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mmss_axi_clk_msm8226[] = {
+static const struct freq_tbl ftbl_mmss_axi_clk_msm8226[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(37500000, P_GPLL0, 16, 0, 0),
 	F(50000000, P_GPLL0, 12, 0, 0),
@@ -280,7 +280,7 @@ static struct freq_tbl ftbl_mmss_axi_clk_msm8226[] = {
 	{ }
 };
 
-static struct freq_tbl ftbl_mmss_axi_clk[] = {
+static const struct freq_tbl ftbl_mmss_axi_clk[] = {
 	F( 19200000, P_XO, 1, 0, 0),
 	F( 37500000, P_GPLL0, 16, 0, 0),
 	F( 50000000, P_GPLL0, 12, 0, 0),
@@ -306,7 +306,7 @@ static struct clk_rcg2 mmss_axi_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_ocmemnoc_clk[] = {
+static const struct freq_tbl ftbl_ocmemnoc_clk[] = {
 	F( 19200000, P_XO, 1, 0, 0),
 	F( 37500000, P_GPLL0, 16, 0, 0),
 	F( 50000000, P_GPLL0, 12, 0, 0),
@@ -331,7 +331,7 @@ static struct clk_rcg2 ocmemnoc_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_csi0_3_clk[] = {
+static const struct freq_tbl ftbl_camss_csi0_3_clk[] = {
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(200000000, P_MMPLL0, 4, 0, 0),
 	{ }
@@ -389,7 +389,7 @@ static struct clk_rcg2 csi3_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_vfe_vfe0_clk_msm8226[] = {
+static const struct freq_tbl ftbl_camss_vfe_vfe0_clk_msm8226[] = {
 	F(37500000, P_GPLL0, 16, 0, 0),
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(60000000, P_GPLL0, 10, 0, 0),
@@ -406,7 +406,7 @@ static struct freq_tbl ftbl_camss_vfe_vfe0_clk_msm8226[] = {
 	{ }
 };
 
-static struct freq_tbl ftbl_camss_vfe_vfe0_1_clk[] = {
+static const struct freq_tbl ftbl_camss_vfe_vfe0_1_clk[] = {
 	F(37500000, P_GPLL0, 16, 0, 0),
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(60000000, P_GPLL0, 10, 0, 0),
@@ -449,7 +449,7 @@ static struct clk_rcg2 vfe1_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_mdp_clk_msm8226[] = {
+static const struct freq_tbl ftbl_mdss_mdp_clk_msm8226[] = {
 	F(37500000, P_GPLL0, 16, 0, 0),
 	F(60000000, P_GPLL0, 10, 0, 0),
 	F(75000000, P_GPLL0, 8, 0, 0),
@@ -461,7 +461,7 @@ static struct freq_tbl ftbl_mdss_mdp_clk_msm8226[] = {
 	{ }
 };
 
-static struct freq_tbl ftbl_mdss_mdp_clk[] = {
+static const struct freq_tbl ftbl_mdss_mdp_clk[] = {
 	F(37500000, P_GPLL0, 16, 0, 0),
 	F(60000000, P_GPLL0, 10, 0, 0),
 	F(75000000, P_GPLL0, 8, 0, 0),
@@ -490,7 +490,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_jpeg_jpeg0_2_clk[] = {
+static const struct freq_tbl ftbl_camss_jpeg_jpeg0_2_clk[] = {
 	F(75000000, P_GPLL0, 8, 0, 0),
 	F(133330000, P_GPLL0, 4.5, 0, 0),
 	F(200000000, P_GPLL0, 3, 0, 0),
@@ -567,7 +567,7 @@ static struct clk_rcg2 pclk1_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_venus0_vcodec0_clk_msm8226[] = {
+static const struct freq_tbl ftbl_venus0_vcodec0_clk_msm8226[] = {
 	F(66700000, P_GPLL0, 9, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(133330000, P_MMPLL0, 6, 0, 0),
@@ -575,7 +575,7 @@ static struct freq_tbl ftbl_venus0_vcodec0_clk_msm8226[] = {
 	{ }
 };
 
-static struct freq_tbl ftbl_venus0_vcodec0_clk[] = {
+static const struct freq_tbl ftbl_venus0_vcodec0_clk[] = {
 	F(50000000, P_GPLL0, 12, 0, 0),
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(133330000, P_MMPLL0, 6, 0, 0),
@@ -599,7 +599,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_cci_cci_clk[] = {
+static const struct freq_tbl ftbl_camss_cci_cci_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -617,7 +617,7 @@ static struct clk_rcg2 cci_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_gp0_1_clk[] = {
+static const struct freq_tbl ftbl_camss_gp0_1_clk[] = {
 	F(10000, P_XO, 16, 1, 120),
 	F(24000, P_XO, 16, 1, 50),
 	F(6000000, P_GPLL0, 10, 1, 10),
@@ -655,14 +655,14 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_mclk0_3_clk_msm8226[] = {
+static const struct freq_tbl ftbl_camss_mclk0_3_clk_msm8226[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(24000000, P_GPLL0, 5, 1, 5),
 	F(66670000, P_GPLL0, 9, 0, 0),
 	{ }
 };
 
-static struct freq_tbl ftbl_camss_mclk0_3_clk[] = {
+static const struct freq_tbl ftbl_camss_mclk0_3_clk[] = {
 	F(4800000, P_XO, 4, 0, 0),
 	F(6000000, P_GPLL0, 10, 1, 10),
 	F(8000000, P_GPLL0, 15, 1, 5),
@@ -729,7 +729,7 @@ static struct clk_rcg2 mclk3_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_phy0_2_csi0_2phytimer_clk[] = {
+static const struct freq_tbl ftbl_camss_phy0_2_csi0_2phytimer_clk[] = {
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(200000000, P_MMPLL0, 4, 0, 0),
 	{ }
@@ -774,7 +774,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_camss_vfe_cpp_clk_msm8226[] = {
+static const struct freq_tbl ftbl_camss_vfe_cpp_clk_msm8226[] = {
 	F(133330000, P_GPLL0, 4.5, 0, 0),
 	F(150000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_MMPLL0, 3, 0, 0),
@@ -783,7 +783,7 @@ static struct freq_tbl ftbl_camss_vfe_cpp_clk_msm8226[] = {
 	{ }
 };
 
-static struct freq_tbl ftbl_camss_vfe_cpp_clk[] = {
+static const struct freq_tbl ftbl_camss_vfe_cpp_clk[] = {
 	F(133330000, P_GPLL0, 4.5, 0, 0),
 	F(266670000, P_MMPLL0, 3, 0, 0),
 	F(320000000, P_MMPLL0, 2.5, 0, 0),
@@ -805,7 +805,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	},
 };
 
-static struct freq_tbl byte_freq_tbl[] = {
+static const struct freq_tbl byte_freq_tbl[] = {
 	{ .src = P_DSI0PLL_BYTE },
 	{ }
 };
@@ -838,7 +838,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_edpaux_clk[] = {
+static const struct freq_tbl ftbl_mdss_edpaux_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -856,7 +856,7 @@ static struct clk_rcg2 edpaux_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_edplink_clk[] = {
+static const struct freq_tbl ftbl_mdss_edplink_clk[] = {
 	F(135000000, P_EDPLINK, 2, 0, 0),
 	F(270000000, P_EDPLINK, 11, 0, 0),
 	{ }
@@ -876,7 +876,7 @@ static struct clk_rcg2 edplink_clk_src = {
 	},
 };
 
-static struct freq_tbl edp_pixel_freq_tbl[] = {
+static const struct freq_tbl edp_pixel_freq_tbl[] = {
 	{ .src = P_EDPVCO },
 	{ }
 };
@@ -895,7 +895,7 @@ static struct clk_rcg2 edppixel_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_esc0_1_clk[] = {
+static const struct freq_tbl ftbl_mdss_esc0_1_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -926,7 +926,7 @@ static struct clk_rcg2 esc1_clk_src = {
 	},
 };
 
-static struct freq_tbl extpclk_freq_tbl[] = {
+static const struct freq_tbl extpclk_freq_tbl[] = {
 	{ .src = P_HDMIPLL },
 	{ }
 };
@@ -945,7 +945,7 @@ static struct clk_rcg2 extpclk_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_hdmi_clk[] = {
+static const struct freq_tbl ftbl_mdss_hdmi_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -963,7 +963,7 @@ static struct clk_rcg2 hdmi_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_vsync_clk[] = {
+static const struct freq_tbl ftbl_mdss_vsync_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
diff --git a/drivers/clk/qcom/mmcc-msm8994.c b/drivers/clk/qcom/mmcc-msm8994.c
index 78e5083eaf0f..f70d080bf51c 100644
--- a/drivers/clk/qcom/mmcc-msm8994.c
+++ b/drivers/clk/qcom/mmcc-msm8994.c
@@ -974,7 +974,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_esc0_1_clk[] = {
+static const struct freq_tbl ftbl_mdss_esc0_1_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -1005,7 +1005,7 @@ static struct clk_rcg2 esc1_clk_src = {
 	},
 };
 
-static struct freq_tbl extpclk_freq_tbl[] = {
+static const struct freq_tbl extpclk_freq_tbl[] = {
 	{ .src = P_HDMIPLL },
 	{ }
 };
@@ -1024,7 +1024,7 @@ static struct clk_rcg2 extpclk_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_hdmi_clk_src[] = {
+static const struct freq_tbl ftbl_hdmi_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -1042,7 +1042,7 @@ static struct clk_rcg2 hdmi_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_vsync_clk[] = {
+static const struct freq_tbl ftbl_mdss_vsync_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 1a32c6eb8217..a742f848e4ee 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -734,7 +734,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	},
 };
 
-static struct freq_tbl extpclk_freq_tbl[] = {
+static const struct freq_tbl extpclk_freq_tbl[] = {
 	{ .src = P_HDMIPLL },
 	{ }
 };
@@ -753,7 +753,7 @@ static struct clk_rcg2 extpclk_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_vsync_clk[] = {
+static const struct freq_tbl ftbl_mdss_vsync_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -771,7 +771,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_hdmi_clk[] = {
+static const struct freq_tbl ftbl_mdss_hdmi_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -815,7 +815,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_mdss_esc0_1_clk[] = {
+static const struct freq_tbl ftbl_mdss_esc0_1_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	{ }
 };
-- 
2.45.2


