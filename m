Return-Path: <linux-arm-msm+bounces-27571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF74943561
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 435DA1C222A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BD71BF336;
	Wed, 31 Jul 2024 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="bL9G8lW/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="MJjdudVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback25.i.mail.ru (fallback25.i.mail.ru [79.137.243.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF231BE25E;
	Wed, 31 Jul 2024 18:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448811; cv=none; b=AUKftcUgfh3rnxxFk5fDNJ5NVa8zYKBUhiDdNBevQ40yKR8Uya1aK5kSU2OmQ/AHEQJ6671jwPGUX6q6hkqjbQlCs+uLXED8gaT8FON7/aGlpOlcHr/wZt1Mc/Jano7fw+I7VN2VJV+PZTrjZ8hJZWQGe18E+5jLn4x9UzO3OX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448811; c=relaxed/simple;
	bh=MqYnDcg68OMVyxG4Vewy4MCiLQCG6USIV51+bOdiy5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nv/AEH/qhb9H9CyVumFkFVXRM5zwHLDx2I/mpNxxf1hJrs5gBLKnbntsbj9LoqCiRH1h2r0RpYZN153zjojmvaK1gUarP3dx3A9nCi08Xbj0KTj7wjKgsWiUlcKzzS3uoVdPVAl7PsKZlkoe4WW+FBEAQ2Hm++fzq2cvP0Bjcqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=bL9G8lW/; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=MJjdudVE; arc=none smtp.client-ip=79.137.243.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=U3NoS7FPD22Ooolh9nIA4bbxpKQIdS35sANdBmC+rw0=;
	t=1722448808;x=1722538808; 
	b=bL9G8lW/PO3G54SAPUI0QK9YsZC/aNRRyOcGR78KyCQ3H+IuyanFwqW5l0vbFUvS1AJH4SYbSB0D79gAWHWKyNMHNFvaGqr73YS+sEE1sa/UKEpbsNI/cqf+JLPhliByHeGfq1jTbFHktlzORgeSX+u+Fyk495NjclHDhWkEuW8=;
Received: from [10.12.4.15] (port=43562 helo=smtp40.i.mail.ru)
	by fallback25.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZDcH-001BWg-6t; Wed, 31 Jul 2024 21:00:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=U3NoS7FPD22Ooolh9nIA4bbxpKQIdS35sANdBmC+rw0=; t=1722448801; x=1722538801; 
	b=MJjdudVERCPkrtGAzJlfs63D2F9hK7plmJjIQ00sP5z0oKKYhwA3x+mEZdzoydWzvRiQNx0FYFP
	jejn846+Mni8RuAz9Quimn5o75Eu/iGcObpen+dxqR9KIbO6+iOpJckTjDlaTzcfCnTRi1fIteA9r
	BGlsOLfgYqhq8XSeG1c=;
Received: by exim-smtp-5c6c85c787-mv4xc with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDc3-00000000IYY-1cMu; Wed, 31 Jul 2024 20:59:48 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	vkoul@kernel.org,
	vladimir.zapolskiy@linaro.org,
	quic_jkona@quicinc.com,
	dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org,
	quic_tdas@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 10/10] clk: qcom: camcc-sm8450: Add SM8475 support
Date: Wed, 31 Jul 2024 20:59:19 +0300
Message-ID: <20240731175919.20333-11-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731175919.20333-1-danila@jiaxyga.com>
References: <20240731175919.20333-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9D748797E4778289DF1EEB2AE45DEEA42182A05F53808504091404AB2FF0B53CD3DE06ABAFEAF67059B20A077E21CE35DF806485F292FBEEBC1B496903CC57CC2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7EED5D2FAB4CEB1EDEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637C8DFB935205A313D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89CF5FE640F57405D995830582C796B18C1F1DE060261E832CC7F00164DA146DAFE8445B8C89999728AA50765F7900637A359038F01FFAF82389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8C2B5EEE3591E0D35F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C6089696B24BB1D19BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B68BFD6B1B042489AC3AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC2EE5AD8F952D28FBE2021AF6380DFAD18AA50765F7900637B8FA30D9455089A722CA9DD8327EE4930A3850AC1BE2E735F3CCD8A865B74A75C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5FF26F3A4B57F82FA5002B1117B3ED696666B84C65C4C62A3C81EEE05487B0209823CB91A9FED034534781492E4B8EEAD577AE849BCD98940C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFAA21A0A2EF2E35251D9401D16A2CB4B31FC9AAD5CC50067167BF0C7A4DB2496A4D6C1B221ADCA6641D9D8FAF50ED830B6DB71DC97271B727C126D84212B092F6383893F97A2511FF983AD880C8D3B7BB02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3uGZjSO5I5RbQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981F091418BA14BADF057FFD5DAF71AD12CB9B3AF8CF4CE49CE9E368351EECC161E2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CDD20AB09974864291049FFFDB7839CE9E45E89A588AFC070551325792C209612A3014ADDCE96807A370E3BEDF0E22E033
X-7FA49CB5: 0D63561A33F958A516EB33383EDD5B989755A23C6F01BD97751EB1A5A3E80F088941B15DA834481FA18204E546F3947CAD0E433DBF1FBFA3F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006373E1F328EEA58DAAF389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C393E899A2A207F19735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3sWgHnhmgItcA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add support to the SM8475 camera clock controller by extending the
SM8450 camera clock controller, which is almost identical but has some
minor differences.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig        |   2 +-
 drivers/clk/qcom/camcc-sm8450.c | 231 ++++++++++++++++++++++++++++++--
 2 files changed, 222 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 60e70bf69cb9..7a5d47019a45 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -839,7 +839,7 @@ config SM_CAMCC_8450
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
 	help
-	  Support for the camera clock controller on SM8450 devices.
+	  Support for the camera clock controller on SM8450 or SM8475 devices.
 	  Say Y if you want to support camera devices and camera functionality.
 
 config SM_CAMCC_8550
diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 26b78eed15ef..75af91fc160f 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -54,9 +54,13 @@ static const struct pll_vco rivian_evo_vco[] = {
 	{ 864000000, 1056000000, 0 },
 };
 
+static const struct pll_vco rivian_ole_vco[] = {
+	{ 864000000, 1075000000, 0 },
+};
+
 static const struct clk_parent_data pll_parent_data_tcxo = { .index = DT_BI_TCXO };
 
-static const struct alpha_pll_config cam_cc_pll0_config = {
+static struct alpha_pll_config cam_cc_pll0_config = {
 	.l = 0x3e,
 	.alpha = 0x8000,
 	.config_ctl_val = 0x20485699,
@@ -86,6 +90,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll0_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data cam_cc_pll0_out_even_sm8475_init = {
+	.name = "cam_cc_pll0_out_even",
+	.parent_hws = (const struct clk_hw*[]) {
+		&cam_cc_pll0.clkr.hw,
+	},
+	.num_parents = 1,
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
 	.offset = 0x0,
 	.post_div_shift = 10,
@@ -109,6 +123,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll0_out_odd[] = {
 	{ }
 };
 
+static struct clk_init_data cam_cc_pll0_out_odd_sm8475_init = {
+	.name = "cam_cc_pll0_out_odd",
+	.parent_hws = (const struct clk_hw*[]) {
+		&cam_cc_pll0.clkr.hw,
+	},
+	.num_parents = 1,
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll_postdiv cam_cc_pll0_out_odd = {
 	.offset = 0x0,
 	.post_div_shift = 14,
@@ -127,7 +151,7 @@ static struct clk_alpha_pll_postdiv cam_cc_pll0_out_odd = {
 	},
 };
 
-static const struct alpha_pll_config cam_cc_pll1_config = {
+static struct alpha_pll_config cam_cc_pll1_config = {
 	.l = 0x25,
 	.alpha = 0xeaaa,
 	.config_ctl_val = 0x20485699,
@@ -157,6 +181,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll1_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data cam_cc_pll1_out_even_sm8475_init = {
+	.name = "cam_cc_pll1_out_even",
+	.parent_hws = (const struct clk_hw*[]) {
+		&cam_cc_pll1.clkr.hw,
+	},
+	.num_parents = 1,
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
 	.offset = 0x1000,
 	.post_div_shift = 10,
@@ -175,7 +209,7 @@ static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
 	},
 };
 
-static const struct alpha_pll_config cam_cc_pll2_config = {
+static struct alpha_pll_config cam_cc_pll2_config = {
 	.l = 0x32,
 	.alpha = 0x0,
 	.config_ctl_val = 0x90008820,
@@ -198,7 +232,7 @@ static struct clk_alpha_pll cam_cc_pll2 = {
 	},
 };
 
-static const struct alpha_pll_config cam_cc_pll3_config = {
+static struct alpha_pll_config cam_cc_pll3_config = {
 	.l = 0x2d,
 	.alpha = 0x0,
 	.config_ctl_val = 0x20485699,
@@ -228,6 +262,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll3_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data cam_cc_pll3_out_even_sm8475_init = {
+	.name = "cam_cc_pll3_out_even",
+	.parent_hws = (const struct clk_hw*[]) {
+		&cam_cc_pll3.clkr.hw,
+	},
+	.num_parents = 1,
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
 	.offset = 0x3000,
 	.post_div_shift = 10,
@@ -246,7 +290,7 @@ static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
 	},
 };
 
-static const struct alpha_pll_config cam_cc_pll4_config = {
+static struct alpha_pll_config cam_cc_pll4_config = {
 	.l = 0x2d,
 	.alpha = 0x0,
 	.config_ctl_val = 0x20485699,
@@ -276,6 +320,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll4_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data cam_cc_pll4_out_even_sm8475_init = {
+	.name = "cam_cc_pll4_out_even",
+	.parent_hws = (const struct clk_hw*[]) {
+		&cam_cc_pll4.clkr.hw,
+	},
+	.num_parents = 1,
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll_postdiv cam_cc_pll4_out_even = {
 	.offset = 0x4000,
 	.post_div_shift = 10,
@@ -294,7 +348,7 @@ static struct clk_alpha_pll_postdiv cam_cc_pll4_out_even = {
 	},
 };
 
-static const struct alpha_pll_config cam_cc_pll5_config = {
+static struct alpha_pll_config cam_cc_pll5_config = {
 	.l = 0x2d,
 	.alpha = 0x0,
 	.config_ctl_val = 0x20485699,
@@ -324,6 +378,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll5_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data cam_cc_pll5_out_even_sm8475_init = {
+	.name = "cam_cc_pll5_out_even",
+	.parent_hws = (const struct clk_hw*[]) {
+		&cam_cc_pll5.clkr.hw,
+	},
+	.num_parents = 1,
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll_postdiv cam_cc_pll5_out_even = {
 	.offset = 0x5000,
 	.post_div_shift = 10,
@@ -342,7 +406,7 @@ static struct clk_alpha_pll_postdiv cam_cc_pll5_out_even = {
 	},
 };
 
-static const struct alpha_pll_config cam_cc_pll6_config = {
+static struct alpha_pll_config cam_cc_pll6_config = {
 	.l = 0x2d,
 	.alpha = 0x0,
 	.config_ctl_val = 0x20485699,
@@ -372,6 +436,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll6_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data cam_cc_pll6_out_even_sm8475_init = {
+	.name = "cam_cc_pll6_out_even",
+	.parent_hws = (const struct clk_hw*[]) {
+		&cam_cc_pll6.clkr.hw,
+	},
+	.num_parents = 1,
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll_postdiv cam_cc_pll6_out_even = {
 	.offset = 0x6000,
 	.post_div_shift = 10,
@@ -390,7 +464,7 @@ static struct clk_alpha_pll_postdiv cam_cc_pll6_out_even = {
 	},
 };
 
-static const struct alpha_pll_config cam_cc_pll7_config = {
+static struct alpha_pll_config cam_cc_pll7_config = {
 	.l = 0x2d,
 	.alpha = 0x0,
 	.config_ctl_val = 0x20485699,
@@ -420,6 +494,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll7_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data cam_cc_pll7_out_even_sm8475_init = {
+	.name = "cam_cc_pll7_out_even",
+	.parent_hws = (const struct clk_hw*[]) {
+		&cam_cc_pll7.clkr.hw,
+	},
+	.num_parents = 1,
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll_postdiv cam_cc_pll7_out_even = {
 	.offset = 0x7000,
 	.post_div_shift = 10,
@@ -438,7 +522,7 @@ static struct clk_alpha_pll_postdiv cam_cc_pll7_out_even = {
 	},
 };
 
-static const struct alpha_pll_config cam_cc_pll8_config = {
+static struct alpha_pll_config cam_cc_pll8_config = {
 	.l = 0x32,
 	.alpha = 0x0,
 	.config_ctl_val = 0x20485699,
@@ -468,6 +552,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll8_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data cam_cc_pll8_out_even_sm8475_init = {
+	.name = "cam_cc_pll8_out_even",
+	.parent_hws = (const struct clk_hw*[]) {
+		&cam_cc_pll8.clkr.hw,
+	},
+	.num_parents = 1,
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
+};
+
 static struct clk_alpha_pll_postdiv cam_cc_pll8_out_even = {
 	.offset = 0x8000,
 	.post_div_shift = 10,
@@ -2817,6 +2911,7 @@ static const struct qcom_cc_desc cam_cc_sm8450_desc = {
 
 static const struct of_device_id cam_cc_sm8450_match_table[] = {
 	{ .compatible = "qcom,sm8450-camcc" },
+	{ .compatible = "qcom,sm8475-camcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cam_cc_sm8450_match_table);
@@ -2829,6 +2924,122 @@ static int cam_cc_sm8450_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-camcc")) {
+		/* Update CAMCC PLL0 Config */
+		cam_cc_pll0_config.config_ctl_hi1_val = 0x82aa299c;
+		cam_cc_pll0_config.test_ctl_val = 0x00000000;
+		cam_cc_pll0_config.test_ctl_hi_val = 0x00000003;
+		cam_cc_pll0_config.test_ctl_hi1_val = 0x00009000;
+		cam_cc_pll0_config.test_ctl_hi2_val = 0x00000034;
+		cam_cc_pll0_config.user_ctl_hi_val = 0x00000005;
+
+		cam_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		cam_cc_pll0_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll0_out_even.clkr.hw.init = &cam_cc_pll0_out_even_sm8475_init;
+		cam_cc_pll0_out_odd.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll0_out_odd.clkr.hw.init = &cam_cc_pll0_out_odd_sm8475_init;
+
+		/* Update CAMCC PLL1 Config */
+		cam_cc_pll1_config.config_ctl_hi1_val = 0x82aa299c;
+		cam_cc_pll1_config.test_ctl_val = 0x00000000;
+		cam_cc_pll1_config.test_ctl_hi_val = 0x00000003;
+		cam_cc_pll1_config.test_ctl_hi1_val = 0x00009000;
+		cam_cc_pll1_config.test_ctl_hi2_val = 0x00000034;
+		cam_cc_pll1_config.user_ctl_hi_val = 0x00000005;
+
+		cam_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		cam_cc_pll1_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll1_out_even.clkr.hw.init = &cam_cc_pll1_out_even_sm8475_init;
+
+		/* Update CAMCC PLL2 Config */
+		cam_cc_pll2_config.config_ctl_val = 0x10000030;
+		cam_cc_pll2_config.config_ctl_hi_val = 0x80890263;
+		cam_cc_pll2_config.user_ctl_val = 0x00000001;
+		cam_cc_pll2_config.user_ctl_hi_val = 0x00000000;
+
+		cam_cc_pll2.vco_table = rivian_ole_vco;
+
+		/* Update CAMCC PLL3 Config */
+		cam_cc_pll3_config.config_ctl_hi1_val = 0x82aa299c;
+		cam_cc_pll3_config.test_ctl_val = 0x00000000;
+		cam_cc_pll3_config.test_ctl_hi_val = 0x00000003;
+		cam_cc_pll3_config.test_ctl_hi1_val = 0x00009000;
+		cam_cc_pll3_config.test_ctl_hi2_val = 0x00000034;
+		cam_cc_pll3_config.user_ctl_hi_val = 0x00000005;
+
+		cam_cc_pll3.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		cam_cc_pll3_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll3_out_even.clkr.hw.init = &cam_cc_pll3_out_even_sm8475_init;
+
+		/* Update CAMCC PLL4 Config */
+		cam_cc_pll4_config.config_ctl_hi1_val = 0x82aa299c;
+		cam_cc_pll4_config.test_ctl_val = 0x00000000;
+		cam_cc_pll4_config.test_ctl_hi_val = 0x00000003;
+		cam_cc_pll4_config.test_ctl_hi1_val = 0x00009000;
+		cam_cc_pll4_config.test_ctl_hi2_val = 0x00000034;
+		cam_cc_pll4_config.user_ctl_hi_val = 0x00000005;
+
+		cam_cc_pll4.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		cam_cc_pll4_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll4_out_even.clkr.hw.init = &cam_cc_pll4_out_even_sm8475_init;
+
+		/* Update CAMCC PLL5 Config */
+		cam_cc_pll5_config.config_ctl_hi1_val = 0x82aa299c;
+		cam_cc_pll5_config.test_ctl_val = 0x00000000;
+		cam_cc_pll5_config.test_ctl_hi_val = 0x00000003;
+		cam_cc_pll5_config.test_ctl_hi1_val = 0x00009000;
+		cam_cc_pll5_config.test_ctl_hi2_val = 0x00000034;
+		cam_cc_pll5_config.user_ctl_hi_val = 0x00000005;
+
+		cam_cc_pll5.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		cam_cc_pll5_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll5_out_even.clkr.hw.init = &cam_cc_pll5_out_even_sm8475_init;
+
+		/* Update CAMCC PLL6 Config */
+		cam_cc_pll6_config.config_ctl_hi1_val = 0x82aa299c;
+		cam_cc_pll6_config.test_ctl_val = 0x00000000;
+		cam_cc_pll6_config.test_ctl_hi_val = 0x00000003;
+		cam_cc_pll6_config.test_ctl_hi1_val = 0x00009000;
+		cam_cc_pll6_config.test_ctl_hi2_val = 0x00000034;
+		cam_cc_pll6_config.user_ctl_hi_val = 0x00000005;
+
+		cam_cc_pll6.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		cam_cc_pll6_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll6_out_even.clkr.hw.init = &cam_cc_pll6_out_even_sm8475_init;
+
+		/* Update CAMCC PLL7 Config */
+		cam_cc_pll7_config.config_ctl_hi1_val = 0x82aa299c;
+		cam_cc_pll7_config.test_ctl_val = 0x00000000;
+		cam_cc_pll7_config.test_ctl_hi_val = 0x00000003;
+		cam_cc_pll7_config.test_ctl_hi1_val = 0x00009000;
+		cam_cc_pll7_config.test_ctl_hi2_val = 0x00000034;
+		cam_cc_pll7_config.user_ctl_hi_val = 0x00000005;
+
+		cam_cc_pll7.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		cam_cc_pll7_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll7_out_even.clkr.hw.init = &cam_cc_pll7_out_even_sm8475_init;
+
+		/* Update CAMCC PLL8 Config */
+		cam_cc_pll8_config.config_ctl_hi1_val = 0x82aa299c;
+		cam_cc_pll8_config.test_ctl_val = 0x00000000;
+		cam_cc_pll8_config.test_ctl_hi_val = 0x00000003;
+		cam_cc_pll8_config.test_ctl_hi1_val = 0x00009000;
+		cam_cc_pll8_config.test_ctl_hi2_val = 0x00000034;
+		cam_cc_pll8_config.user_ctl_hi_val = 0x00000005;
+
+		cam_cc_pll8.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+
+		cam_cc_pll8_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll8_out_even.clkr.hw.init = &cam_cc_pll8_out_even_sm8475_init;
+	}
+
 	clk_lucid_evo_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
 	clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
@@ -2852,5 +3063,5 @@ static struct platform_driver cam_cc_sm8450_driver = {
 
 module_platform_driver(cam_cc_sm8450_driver);
 
-MODULE_DESCRIPTION("QCOM CAMCC SM8450 Driver");
+MODULE_DESCRIPTION("QCOM CAMCC SM8450 / SM8475 Driver");
 MODULE_LICENSE("GPL");
-- 
2.45.2


