Return-Path: <linux-arm-msm+bounces-28905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3118955F0F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 22:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED1491C210B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7449158DAC;
	Sun, 18 Aug 2024 20:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="KbRr0cPw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp31.i.mail.ru (smtp31.i.mail.ru [95.163.41.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530CC1586F2;
	Sun, 18 Aug 2024 20:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724013857; cv=none; b=E5Z+NO3PTgO1oxh9vRSXJPYZKzJOWh41zQcU0qy71Tm4XNNhrs24WOHCPOxhKDjR16JVbJDHLbCyf56XZa8+rtV3gwHs8xjF+XFOcOhjMmauKbqbDMZaxCLw+fBPcAQg0odQDIKIZiwS3Zod5x9P+JM/od8Oi+MHwPseWaNUyVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724013857; c=relaxed/simple;
	bh=Dv9/6owoz37vO8WpwWEWsVsAeEbs8/hT5tI0MLbGETU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ml3CZzCowwaBcKR8Ha5KhrswwNniLumrhBtb7YS/TLZkJa5yfwIXHQKIlakj5dkff8I5YZMlJ1MJvQuqcNa0F1km4a0iicAvOry0TO1yG6WlYU5D2b7PGlb8WjQvz8NYxucrU3EH4hUFuJIHmKZMqQwXS/GazfVklNml4CPBZ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=KbRr0cPw; arc=none smtp.client-ip=95.163.41.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=Y5JqH04ZPwDa/cFdSpguxEd6kcPPUbZ7ViniyytI9Mc=; t=1724013855; x=1724103855; 
	b=KbRr0cPw9s3sIICvjDrt2JXgMozUIZttwMCZeW847irsDSTXM+SS/LpnPvWckQJfLS8Cd1OamBA
	y36tbFOhUY/kgwApudcjG6e1UCPeHt4t5PCYbIRSeAOcPhFj5bnACLDgvog13sJaA6vnUV/uICaf7
	6r6ZFzOz0OFrJnVsPjg=;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sfml2-0000000Cqfx-1Ryy; Sun, 18 Aug 2024 23:44:12 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
Subject: [PATCH v2 10/10] clk: qcom: camcc-sm8450: Add SM8475 support
Date: Sun, 18 Aug 2024 23:43:48 +0300
Message-ID: <20240818204348.197788-11-danila@jiaxyga.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818204348.197788-1-danila@jiaxyga.com>
References: <20240818204348.197788-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp31.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9F97E3C14763C38E2B49BF32E3CF5E697820AD0F0F569587B182A05F5380850407156CE4F1F6BACC40578E6996F383413637DF00A937E45D1323C04D0FE7BBCAFC4426626564D10EB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE742D9BD90C58D50E0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637A69A378178A91E348638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D2AD787A30994D3ACD7AC5B2B1C5E9D2E88553359FE2822BCC7F00164DA146DAFE8445B8C89999728AA50765F7900637E603D20A273AEC4F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8989FD0BDF65E50FBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C86A7C529F68B8E5C03F1AB874ED890284AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C33439DF9FD084CBEFBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B6957A4DEDD2346B4275ECD9A6C639B01B78DA827A17800CE7AD892BA7D319F029731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5E6BD5913A25ECC785002B1117B3ED696D486D217EE1BC25E715D9AB585B0EB04823CB91A9FED034534781492E4B8EEAD303003AC7AA20DD0C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF725674604D6A4EAA3BD3C57B9E5585B6C735C9601ABCB9C60514E9B80A23C0A2543A65BC901B9540ABF86C07854D947339FB72F3F096EF5FF37AA835A6091A5EA2FCA1DF084E2959F59F2EA2782EDE9C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmYLFw5mrUnbzw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981BDE09DECC0D6FF18459FBC39F2FFFE83805FE462AE81B6769C0A400F3CD7098F2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

Add support to the SM8475 camera clock controller by extending the
SM8450 camera clock controller, which is almost identical but has some
minor differences.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig        |   2 +-
 drivers/clk/qcom/camcc-sm8450.c | 294 ++++++++++++++++++++++++++++++--
 2 files changed, 285 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 8d878bc5f9b8..30eb8236c9d8 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -857,7 +857,7 @@ config SM_CAMCC_8450
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
 	help
-	  Support for the camera clock controller on SM8450 devices.
+	  Support for the camera clock controller on SM8450 or SM8475 devices.
 	  Say Y if you want to support camera devices and camera functionality.
 
 config SM_CAMCC_8550
diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 26b78eed15ef..08982737e490 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -54,6 +54,10 @@ static const struct pll_vco rivian_evo_vco[] = {
 	{ 864000000, 1056000000, 0 },
 };
 
+static const struct pll_vco rivian_ole_vco[] = {
+	{ 864000000, 1075000000, 0 },
+};
+
 static const struct clk_parent_data pll_parent_data_tcxo = { .index = DT_BI_TCXO };
 
 static const struct alpha_pll_config cam_cc_pll0_config = {
@@ -66,6 +70,20 @@ static const struct alpha_pll_config cam_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_cam_cc_pll0_config = {
+	.l = 0x3e,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_evo_vco,
@@ -86,6 +104,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll0_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data sm8475_cam_cc_pll0_out_even_init = {
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
@@ -109,6 +137,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll0_out_odd[] = {
 	{ }
 };
 
+static struct clk_init_data sm8475_cam_cc_pll0_out_odd_init = {
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
@@ -137,6 +175,20 @@ static const struct alpha_pll_config cam_cc_pll1_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_cam_cc_pll1_config = {
+	.l = 0x25,
+	.alpha = 0xeaaa,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
 static struct clk_alpha_pll cam_cc_pll1 = {
 	.offset = 0x1000,
 	.vco_table = lucid_evo_vco,
@@ -157,6 +209,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll1_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data sm8475_cam_cc_pll1_out_even_init = {
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
@@ -183,6 +245,16 @@ static const struct alpha_pll_config cam_cc_pll2_config = {
 	.config_ctl_hi1_val = 0x00000217,
 };
 
+static const struct alpha_pll_config sm8475_cam_cc_pll2_config = {
+	.l = 0x32,
+	.alpha = 0x0,
+	.config_ctl_val = 0x10000030,
+	.config_ctl_hi_val = 0x80890263,
+	.config_ctl_hi1_val = 0x00000217,
+	.user_ctl_val = 0x00000001,
+	.user_ctl_hi_val = 0x00000000,
+};
+
 static struct clk_alpha_pll cam_cc_pll2 = {
 	.offset = 0x2000,
 	.vco_table = rivian_evo_vco,
@@ -208,6 +280,20 @@ static const struct alpha_pll_config cam_cc_pll3_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_cam_cc_pll3_config = {
+	.l = 0x2d,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
 static struct clk_alpha_pll cam_cc_pll3 = {
 	.offset = 0x3000,
 	.vco_table = lucid_evo_vco,
@@ -228,6 +314,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll3_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data sm8475_cam_cc_pll3_out_even_init = {
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
@@ -256,6 +352,20 @@ static const struct alpha_pll_config cam_cc_pll4_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_cam_cc_pll4_config = {
+	.l = 0x2d,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
 static struct clk_alpha_pll cam_cc_pll4 = {
 	.offset = 0x4000,
 	.vco_table = lucid_evo_vco,
@@ -276,6 +386,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll4_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data sm8475_cam_cc_pll4_out_even_init = {
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
@@ -304,6 +424,20 @@ static const struct alpha_pll_config cam_cc_pll5_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_cam_cc_pll5_config = {
+	.l = 0x2d,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
 static struct clk_alpha_pll cam_cc_pll5 = {
 	.offset = 0x5000,
 	.vco_table = lucid_evo_vco,
@@ -324,6 +458,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll5_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data sm8475_cam_cc_pll5_out_even_init = {
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
@@ -352,6 +496,20 @@ static const struct alpha_pll_config cam_cc_pll6_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_cam_cc_pll6_config = {
+	.l = 0x2d,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
 static struct clk_alpha_pll cam_cc_pll6 = {
 	.offset = 0x6000,
 	.vco_table = lucid_evo_vco,
@@ -372,6 +530,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll6_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data sm8475_cam_cc_pll6_out_even_init = {
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
@@ -400,6 +568,20 @@ static const struct alpha_pll_config cam_cc_pll7_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_cam_cc_pll7_config = {
+	.l = 0x2d,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
 static struct clk_alpha_pll cam_cc_pll7 = {
 	.offset = 0x7000,
 	.vco_table = lucid_evo_vco,
@@ -420,6 +602,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll7_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data sm8475_cam_cc_pll7_out_even_init = {
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
@@ -448,6 +640,20 @@ static const struct alpha_pll_config cam_cc_pll8_config = {
 	.user_ctl_hi_val = 0x00000805,
 };
 
+static const struct alpha_pll_config sm8475_cam_cc_pll8_config = {
+	.l = 0x32,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000005,
+};
+
 static struct clk_alpha_pll cam_cc_pll8 = {
 	.offset = 0x8000,
 	.vco_table = lucid_evo_vco,
@@ -468,6 +674,16 @@ static const struct clk_div_table post_div_table_cam_cc_pll8_out_even[] = {
 	{ }
 };
 
+static struct clk_init_data sm8475_cam_cc_pll8_out_even_init = {
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
@@ -2817,6 +3033,7 @@ static const struct qcom_cc_desc cam_cc_sm8450_desc = {
 
 static const struct of_device_id cam_cc_sm8450_match_table[] = {
 	{ .compatible = "qcom,sm8450-camcc" },
+	{ .compatible = "qcom,sm8475-camcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cam_cc_sm8450_match_table);
@@ -2829,15 +3046,72 @@ static int cam_cc_sm8450_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	clk_lucid_evo_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
-	clk_lucid_evo_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
-	clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
-	clk_lucid_evo_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
-	clk_lucid_evo_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
-	clk_lucid_evo_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
-	clk_lucid_evo_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
-	clk_lucid_evo_pll_configure(&cam_cc_pll7, regmap, &cam_cc_pll7_config);
-	clk_lucid_evo_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-camcc")) {
+		/* Update CAMCC PLL0 */
+		cam_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll0_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll0_out_even.clkr.hw.init = &sm8475_cam_cc_pll0_out_even_init;
+		cam_cc_pll0_out_odd.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll0_out_odd.clkr.hw.init = &sm8475_cam_cc_pll0_out_odd_init;
+
+		/* Update CAMCC PLL1 */
+		cam_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll1_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll1_out_even.clkr.hw.init = &sm8475_cam_cc_pll1_out_even_init;
+
+		/* Update CAMCC PLL2 */
+		cam_cc_pll2.vco_table = rivian_ole_vco;
+
+		/* Update CAMCC PLL3 */
+		cam_cc_pll3.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll3_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll3_out_even.clkr.hw.init = &sm8475_cam_cc_pll3_out_even_init;
+
+		/* Update CAMCC PLL4 */
+		cam_cc_pll4.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll4_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll4_out_even.clkr.hw.init = &sm8475_cam_cc_pll4_out_even_init;
+
+		/* Update CAMCC PLL5 */
+		cam_cc_pll5.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll5_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll5_out_even.clkr.hw.init = &sm8475_cam_cc_pll5_out_even_init;
+
+		/* Update CAMCC PLL6 */
+		cam_cc_pll6.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll6_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll6_out_even.clkr.hw.init = &sm8475_cam_cc_pll6_out_even_init;
+
+		/* Update CAMCC PLL7 */
+		cam_cc_pll7.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll7_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll7_out_even.clkr.hw.init = &sm8475_cam_cc_pll7_out_even_init;
+
+		/* Update CAMCC PLL8 */
+		cam_cc_pll8.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll8_out_even.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
+		cam_cc_pll8_out_even.clkr.hw.init = &sm8475_cam_cc_pll8_out_even_init;
+
+		clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &sm8475_cam_cc_pll0_config);
+		clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &sm8475_cam_cc_pll1_config);
+		clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &sm8475_cam_cc_pll2_config);
+		clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &sm8475_cam_cc_pll3_config);
+		clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &sm8475_cam_cc_pll4_config);
+		clk_lucid_ole_pll_configure(&cam_cc_pll5, regmap, &sm8475_cam_cc_pll5_config);
+		clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &sm8475_cam_cc_pll6_config);
+		clk_lucid_ole_pll_configure(&cam_cc_pll7, regmap, &sm8475_cam_cc_pll7_config);
+		clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &sm8475_cam_cc_pll8_config);
+	} else {
+		clk_lucid_evo_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
+		clk_lucid_evo_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
+		clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
+		clk_lucid_evo_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
+		clk_lucid_evo_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
+		clk_lucid_evo_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
+		clk_lucid_evo_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
+		clk_lucid_evo_pll_configure(&cam_cc_pll7, regmap, &cam_cc_pll7_config);
+		clk_lucid_evo_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
+	}
 
 	return qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8450_desc, regmap);
 }
@@ -2852,5 +3126,5 @@ static struct platform_driver cam_cc_sm8450_driver = {
 
 module_platform_driver(cam_cc_sm8450_driver);
 
-MODULE_DESCRIPTION("QCOM CAMCC SM8450 Driver");
+MODULE_DESCRIPTION("QCOM CAMCC SM8450 / SM8475 Driver");
 MODULE_LICENSE("GPL");
-- 
2.46.0


