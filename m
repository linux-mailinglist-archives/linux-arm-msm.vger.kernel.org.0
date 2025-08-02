Return-Path: <linux-arm-msm+bounces-67505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C1AB18E3D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 13:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4978AA3FAE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 11:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A552F221555;
	Sat,  2 Aug 2025 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyGR9ZQe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1FF256D;
	Sat,  2 Aug 2025 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754135092; cv=none; b=e0oBNEG2/8pOd2iAnqP2CJ46ybjY5n04wFSlwvGf4/tANTRyiixUHmT06DwhkvlbQe/JRW1WPwuF90LMNgV46zegArBSCs6X5hE/Ha8Bpbg0bQFvWrb1VXjvZKcvNMJuGnNzCWYASZh3FRNTLZZJ06Ej+tMNGp4AAqrwUB0YfHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754135092; c=relaxed/simple;
	bh=XOKcrEu4OfAVcHRgTZHChdZFSVDpLasDM85Bx+xaXq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KRHnF8rEpuLNlQN9NqqmvFUy5p223GI2A8oOAqtqIIYyquFemkQ05b0LNpDp7Ahuat3V6zrll1ZRtwkfa2IITXQGhcwi5N6zJmpi2foucWvRj9fnBKG7b9JcxQnkcLP96StApE4zZvf7UfNfaNbrAVcli1XuaDNMxLYlijltGEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyGR9ZQe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1ADC4CEEF;
	Sat,  2 Aug 2025 11:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754135092;
	bh=XOKcrEu4OfAVcHRgTZHChdZFSVDpLasDM85Bx+xaXq8=;
	h=From:Date:Subject:To:Cc:From;
	b=uyGR9ZQe3yLOLSKHRgNO96lev+Emzn7uzqzCcwPYdZ1SWJKn4nbEDdm1URcgUXcOF
	 XS5suTogxL6RLMOOpufkgahIJdBfapNel1pLv1UWJTngwGRdZjGvTFXOF24Av2JkLC
	 833RZRQzRRg3vSp4P+toaRvceHSJIoaDOnrEsvC/goEielZdyavc1fifbOpLv11IJV
	 Mv49KMNc6FhIjOElSBwr6ucENGJXm4onqOG5pFvEx+y1aPXttqLYKCdMdlqengJs9v
	 1ZZpfi4LuDMYaDMYp6RgfLJfkMpD0QLIILE6i659I0dM65bf7aqSoZ+tzPqRbfVd65
	 /fpayPW14piGg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 02 Aug 2025 13:44:44 +0200
Subject: [PATCH] clk: qcom: Remove double-space after assignment operator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-topic-clk_qc_doublespace-v1-1-2cae59ba7d59@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACv6jWgC/x3M0QpAMBSA4VfRubaaoeRVJM3ZGSey2ZCSd7dcf
 hf//0CkwBShzR4IdHFktyUUeQY4620iwSYZlFS1bKQSh/OMAtdl2HEw7hxXil4jCa2qQtq6NJZ
 GSLkPZPn+113/vh9HUswIagAAAA==
X-Change-ID: 20250802-topic-clk_qc_doublespace-a2410f53dfeb
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754135087; l=18960;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XQd1kCgHNqQSO54u2eQxwlF0bpqItFXkJIUhsAHL5BE=;
 b=8NOZoluNETmqL4iKdm4Zf0QUGXGtRdgHgCGtdrhT7tPQ7QTiXxYP3o1cPSnQJIOOClRxQ8Yew
 +aMmGcuzrn6AyKW5yngwi2Tpcg2MO4l8qJnILsCkAbynQL1wwJFQ4AC
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This is an oddly common hiccup across clk/qcom.. Remove it in hopes to
reduce spread through copy-paste.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/a7-pll.c              |  2 +-
 drivers/clk/qcom/clk-alpha-pll.c       | 26 +++++++++++++-------------
 drivers/clk/qcom/clk-rcg.c             |  2 +-
 drivers/clk/qcom/clk-rcg2.c            |  8 ++++----
 drivers/clk/qcom/clk-rpmh.c            |  6 +++---
 drivers/clk/qcom/clk-smd-rpm.c         |  8 ++++----
 drivers/clk/qcom/gcc-qcs404.c          |  2 +-
 drivers/clk/qcom/gpucc-sa8775p.c       |  6 +++---
 drivers/clk/qcom/gpucc-sc7180.c        |  2 +-
 drivers/clk/qcom/gpucc-sm6350.c        |  4 ++--
 drivers/clk/qcom/gpucc-sm8150.c        |  2 +-
 drivers/clk/qcom/gpucc-sm8250.c        |  2 +-
 drivers/clk/qcom/lpassaudiocc-sc7280.c |  4 ++--
 drivers/clk/qcom/lpasscc-sc8280xp.c    |  4 ++--
 drivers/clk/qcom/lpasscc-sm6115.c      |  2 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c  |  2 +-
 drivers/clk/qcom/mmcc-sdm660.c         |  2 +-
 drivers/clk/qcom/nsscc-ipq9574.c       |  2 +-
 18 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/qcom/a7-pll.c b/drivers/clk/qcom/a7-pll.c
index c4a53e5db229f24c8d6c75d398d595bb148af64b..bf7159f5b456a9d7e8ceef0fd89cd9e64b613a6c 100644
--- a/drivers/clk/qcom/a7-pll.c
+++ b/drivers/clk/qcom/a7-pll.c
@@ -27,7 +27,7 @@ static struct clk_alpha_pll a7pll = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "a7pll",
-			.parent_data =  &(const struct clk_parent_data){
+			.parent_data = &(const struct clk_parent_data){
 				.fw_name = "bi_tcxo",
 			},
 			.num_parents = 1,
diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index fec6eb376e2707deda11609fe5d0d45082048a0b..81a1ce42285f7eb19dba92cb7415c7e694a829dd 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -66,7 +66,7 @@
 #define GET_PLL_TYPE(pll)	(((pll)->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)
 
 const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
-	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
+	[CLK_ALPHA_PLL_TYPE_DEFAULT] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
 		[PLL_OFF_ALPHA_VAL_U] = 0x0c,
@@ -77,7 +77,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U] = 0x20,
 		[PLL_OFF_STATUS] = 0x24,
 	},
-	[CLK_ALPHA_PLL_TYPE_HUAYRA] =  {
+	[CLK_ALPHA_PLL_TYPE_HUAYRA] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
 		[PLL_OFF_USER_CTL] = 0x10,
@@ -87,7 +87,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U] = 0x20,
 		[PLL_OFF_STATUS] = 0x24,
 	},
-	[CLK_ALPHA_PLL_TYPE_HUAYRA_APSS] =  {
+	[CLK_ALPHA_PLL_TYPE_HUAYRA_APSS] = {
 		[PLL_OFF_L_VAL] = 0x08,
 		[PLL_OFF_ALPHA_VAL] = 0x10,
 		[PLL_OFF_USER_CTL] = 0x18,
@@ -97,7 +97,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL] = 0x30,
 		[PLL_OFF_TEST_CTL_U] = 0x34,
 	},
-	[CLK_ALPHA_PLL_TYPE_HUAYRA_2290] =  {
+	[CLK_ALPHA_PLL_TYPE_HUAYRA_2290] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
 		[PLL_OFF_USER_CTL] = 0x0c,
@@ -110,7 +110,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_OPMODE] = 0x28,
 		[PLL_OFF_STATUS] = 0x38,
 	},
-	[CLK_ALPHA_PLL_TYPE_BRAMMO] =  {
+	[CLK_ALPHA_PLL_TYPE_BRAMMO] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
 		[PLL_OFF_ALPHA_VAL_U] = 0x0c,
@@ -119,7 +119,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL] = 0x1c,
 		[PLL_OFF_STATUS] = 0x24,
 	},
-	[CLK_ALPHA_PLL_TYPE_FABIA] =  {
+	[CLK_ALPHA_PLL_TYPE_FABIA] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_USER_CTL] = 0x0c,
 		[PLL_OFF_USER_CTL_U] = 0x10,
@@ -147,7 +147,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_OPMODE] = 0x38,
 		[PLL_OFF_ALPHA_VAL] = 0x40,
 	},
-	[CLK_ALPHA_PLL_TYPE_AGERA] =  {
+	[CLK_ALPHA_PLL_TYPE_AGERA] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
 		[PLL_OFF_USER_CTL] = 0x0c,
@@ -157,7 +157,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U] = 0x1c,
 		[PLL_OFF_STATUS] = 0x2c,
 	},
-	[CLK_ALPHA_PLL_TYPE_ZONDA] =  {
+	[CLK_ALPHA_PLL_TYPE_ZONDA] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
 		[PLL_OFF_USER_CTL] = 0x0c,
@@ -243,7 +243,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL] = 0x28,
 		[PLL_OFF_TEST_CTL_U] = 0x2c,
 	},
-	[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO] =  {
+	[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
 		[PLL_OFF_ALPHA_VAL_U] = 0x0c,
@@ -254,7 +254,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_CONFIG_CTL] = 0x20,
 		[PLL_OFF_STATUS] = 0x24,
 	},
-	[CLK_ALPHA_PLL_TYPE_BRAMMO_EVO] =  {
+	[CLK_ALPHA_PLL_TYPE_BRAMMO_EVO] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
 		[PLL_OFF_ALPHA_VAL_U] = 0x0c,
@@ -275,7 +275,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL] = 0x30,
 		[PLL_OFF_TEST_CTL_U] = 0x34,
 	},
-	[CLK_ALPHA_PLL_TYPE_STROMER_PLUS] =  {
+	[CLK_ALPHA_PLL_TYPE_STROMER_PLUS] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_USER_CTL] = 0x08,
 		[PLL_OFF_USER_CTL_U] = 0x0c,
@@ -286,7 +286,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_ALPHA_VAL] = 0x24,
 		[PLL_OFF_ALPHA_VAL_U] = 0x28,
 	},
-	[CLK_ALPHA_PLL_TYPE_ZONDA_OLE] =  {
+	[CLK_ALPHA_PLL_TYPE_ZONDA_OLE] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
 		[PLL_OFF_USER_CTL] = 0x0c,
@@ -301,7 +301,7 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_OPMODE] = 0x30,
 		[PLL_OFF_STATUS] = 0x3c,
 	},
-	[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA] =  {
+	[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
 		[PLL_OFF_TEST_CTL] = 0x0c,
diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
index 987141c91fe0bc323d84529afbf6c96d247a55a3..31f0650b48bac3ad0f56b719c9979cac5b2f1e4b 100644
--- a/drivers/clk/qcom/clk-rcg.c
+++ b/drivers/clk/qcom/clk-rcg.c
@@ -423,7 +423,7 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
 			rate = tmp;
 		}
 	} else {
-		rate =  clk_hw_get_rate(p);
+		rate = clk_hw_get_rate(p);
 	}
 	req->best_parent_hw = p;
 	req->best_parent_rate = rate;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 8001fd9faf9d1e642fae056b6e8cc9b24db9604b..e18cb8807d73534c6437c08aeb524353a2eab06f 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -201,7 +201,7 @@ __clk_rcg2_recalc_rate(struct clk_hw *hw, unsigned long parent_rate, u32 cfg)
 		regmap_read(rcg->clkr.regmap, RCG_M_OFFSET(rcg), &m);
 		m &= mask;
 		regmap_read(rcg->clkr.regmap, RCG_N_OFFSET(rcg), &n);
-		n =  ~n;
+		n = ~n;
 		n &= mask;
 		n += m;
 		mode = cfg & CFG_MODE_MASK;
@@ -274,7 +274,7 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
 			rate = tmp;
 		}
 	} else {
-		rate =  clk_hw_get_rate(p);
+		rate = clk_hw_get_rate(p);
 	}
 	req->best_parent_hw = p;
 	req->best_parent_rate = rate;
@@ -311,7 +311,7 @@ __clk_rcg2_select_conf(struct clk_hw *hw, const struct freq_multi_tbl *f,
 		if (!p)
 			continue;
 
-		parent_rate =  clk_hw_get_rate(p);
+		parent_rate = clk_hw_get_rate(p);
 		rate = calc_rate(parent_rate, conf->n, conf->m, conf->n, conf->pre_div);
 
 		if (rate == req_rate) {
@@ -382,7 +382,7 @@ static int _freq_tbl_fm_determine_rate(struct clk_hw *hw, const struct freq_mult
 			rate = tmp;
 		}
 	} else {
-		rate =  clk_hw_get_rate(p);
+		rate = clk_hw_get_rate(p);
 	}
 
 	req->best_parent_hw = p;
diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 1496fb3de4be8db0cae13e6358745660f286267a..5103a464d86d3cb4c0ce3ff68956178dd58b1864 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -87,7 +87,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 		.hw.init = &(struct clk_init_data){			\
 			.ops = &clk_rpmh_ops,				\
 			.name = #_name,					\
-			.parent_data =  &(const struct clk_parent_data){ \
+			.parent_data = &(const struct clk_parent_data){ \
 					.fw_name = "xo",		\
 					.name = "xo_board",		\
 			},						\
@@ -105,7 +105,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 		.hw.init = &(struct clk_init_data){			\
 			.ops = &clk_rpmh_ops,				\
 			.name = #_name "_ao",				\
-			.parent_data =  &(const struct clk_parent_data){ \
+			.parent_data = &(const struct clk_parent_data){ \
 					.fw_name = "xo",		\
 					.name = "xo_board",		\
 			},						\
@@ -182,7 +182,7 @@ static int clk_rpmh_send_aggregate_command(struct clk_rpmh *c)
 	}
 
 	c->last_sent_aggr_state = c->aggr_state;
-	c->peer->last_sent_aggr_state =  c->last_sent_aggr_state;
+	c->peer->last_sent_aggr_state = c->last_sent_aggr_state;
 
 	return 0;
 }
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 3bf6df3884a542e7be572f2319990c2bfa7bc642..103db984a40b950bd33fba668a292be46af6326e 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -30,7 +30,7 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_ops,			      \
 			.name = #_name,					      \
-			.parent_data =  &(const struct clk_parent_data){      \
+			.parent_data = &(const struct clk_parent_data){       \
 					.fw_name = "xo",		      \
 					.name = "xo_board",		      \
 			},						      \
@@ -47,7 +47,7 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_ops,			      \
 			.name = #_active,				      \
-			.parent_data =  &(const struct clk_parent_data){      \
+			.parent_data = &(const struct clk_parent_data){       \
 					.fw_name = "xo",		      \
 					.name = "xo_board",		      \
 			},						      \
@@ -74,7 +74,7 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
 			.name = #_name,					      \
-			.parent_data =  &(const struct clk_parent_data){      \
+			.parent_data = &(const struct clk_parent_data){       \
 					.fw_name = "xo",		      \
 					.name = "xo_board",		      \
 			},						      \
@@ -92,7 +92,7 @@
 		.hw.init = &(struct clk_init_data){			      \
 			.ops = &clk_smd_rpm_branch_ops,			      \
 			.name = #_active,				      \
-			.parent_data =  &(const struct clk_parent_data){      \
+			.parent_data = &(const struct clk_parent_data){       \
 					.fw_name = "xo",		      \
 					.name = "xo_board",		      \
 			},						      \
diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 5ca003c9bfba89bee2e626b3c35936452cc02765..efc75a3814ab690bc19251f49fcc598dc4033b17 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -2754,7 +2754,7 @@ static struct clk_regmap *gcc_qcs404_clocks[] = {
 	[GCC_DCC_CLK] = &gcc_dcc_clk.clkr,
 	[GCC_DCC_XO_CLK] = &gcc_dcc_xo_clk.clkr,
 	[GCC_WCSS_Q6_AHB_CLK] = &gcc_wdsp_q6ss_ahbs_clk.clkr,
-	[GCC_WCSS_Q6_AXIM_CLK] =  &gcc_wdsp_q6ss_axim_clk.clkr,
+	[GCC_WCSS_Q6_AXIM_CLK] = &gcc_wdsp_q6ss_axim_clk.clkr,
 
 };
 
diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
index 78cad622cb5a08bbde890dc6a33c2a24538901d9..25dcc5912f99530f72de98c4e5a9beb948628f6a 100644
--- a/drivers/clk/qcom/gpucc-sa8775p.c
+++ b/drivers/clk/qcom/gpucc-sa8775p.c
@@ -365,7 +365,7 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 				&gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags =  CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_aon_ops,
 		},
 	},
@@ -414,7 +414,7 @@ static struct clk_branch gpu_cc_cxo_clk = {
 				&gpu_cc_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags =  CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -499,7 +499,7 @@ static struct clk_branch gpu_cc_hub_cx_int_clk = {
 				&gpu_cc_hub_cx_int_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags =  CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_aon_ops,
 		},
 	},
diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index a7bf44544b956db3dd476869177ba9858401e7ac..97287488e05a03d4342d2fa0699c57d4534c92ea 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -42,7 +42,7 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_pll1",
-			.parent_data =  &(const struct clk_parent_data){
+			.parent_data = &(const struct clk_parent_data){
 				.fw_name = "bi_tcxo",
 			},
 			.num_parents = 1,
diff --git a/drivers/clk/qcom/gpucc-sm6350.c b/drivers/clk/qcom/gpucc-sm6350.c
index ee89c42413f885f21f1470b1f7887d052e52a75e..efbee1518dd333b08a7a71aa65d50181d9cbfaf2 100644
--- a/drivers/clk/qcom/gpucc-sm6350.c
+++ b/drivers/clk/qcom/gpucc-sm6350.c
@@ -67,7 +67,7 @@ static struct clk_alpha_pll gpu_cc_pll0 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_pll0",
-			.parent_data =  &(const struct clk_parent_data){
+			.parent_data = &(const struct clk_parent_data){
 				.index = DT_BI_TCXO,
 				.fw_name = "bi_tcxo",
 			},
@@ -111,7 +111,7 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_pll1",
-			.parent_data =  &(const struct clk_parent_data){
+			.parent_data = &(const struct clk_parent_data){
 				.index = DT_BI_TCXO,
 				.fw_name = "bi_tcxo",
 			},
diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index 7ce91208c0bc0fb0009e0974d7d45378d8df8427..5701031c17f39ce214bd5755190c4e671318da80 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -53,7 +53,7 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_pll1",
-			.parent_data =  &(const struct clk_parent_data){
+			.parent_data = &(const struct clk_parent_data){
 				.fw_name = "bi_tcxo",
 			},
 			.num_parents = 1,
diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index ca0a1681d352c41bf2dc4ef7746ad7e5ec1626e2..eee3208640cdc6c53114dad262d68454ce44685c 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -56,7 +56,7 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_pll1",
-			.parent_data =  &(const struct clk_parent_data){
+			.parent_data = &(const struct clk_parent_data){
 				.fw_name = "bi_tcxo",
 			},
 			.num_parents = 1,
diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index 3ff123bffa114de447c96a250862a533e82d6e64..7e217296928930c482184c712dcf5db6c0d45ea8 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -709,8 +709,8 @@ static const struct qcom_cc_desc lpass_audio_cc_sc7280_desc = {
 };
 
 static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
-	[LPASS_AUDIO_SWR_RX_CGCR] =  { 0xa0, 1 },
-	[LPASS_AUDIO_SWR_TX_CGCR] =  { 0xa8, 1 },
+	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xa0, 1 },
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa8, 1 },
 	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
 };
 
diff --git a/drivers/clk/qcom/lpasscc-sc8280xp.c b/drivers/clk/qcom/lpasscc-sc8280xp.c
index 9fd9498d7dc8ac96c97ebe7b97d1c269090212a8..ff839788c40e4da9df934ba86740fa3b4851a2da 100644
--- a/drivers/clk/qcom/lpasscc-sc8280xp.c
+++ b/drivers/clk/qcom/lpasscc-sc8280xp.c
@@ -18,9 +18,9 @@
 #include "reset.h"
 
 static const struct qcom_reset_map lpass_audiocc_sc8280xp_resets[] = {
-	[LPASS_AUDIO_SWR_RX_CGCR] =  { 0xa0, 1 },
+	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xa0, 1 },
 	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
-	[LPASS_AUDIO_SWR_WSA2_CGCR] =  { 0xd8, 1 },
+	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xd8, 1 },
 };
 
 static const struct regmap_config lpass_audiocc_sc8280xp_regmap_config = {
diff --git a/drivers/clk/qcom/lpasscc-sm6115.c b/drivers/clk/qcom/lpasscc-sm6115.c
index 8ffdab71b94836f1a5e0aa5792baf4b41216a281..ac6d219233b4c3a39d882ac4826bf88307533b81 100644
--- a/drivers/clk/qcom/lpasscc-sm6115.c
+++ b/drivers/clk/qcom/lpasscc-sm6115.c
@@ -17,7 +17,7 @@
 #include "reset.h"
 
 static const struct qcom_reset_map lpass_audiocc_sm6115_resets[] = {
-	[LPASS_AUDIO_SWR_RX_CGCR] =  { .reg = 0x98, .bit = 1, .udelay = 500 },
+	[LPASS_AUDIO_SWR_RX_CGCR] = { .reg = 0x98, .bit = 1, .udelay = 500 },
 };
 
 static struct regmap_config lpass_audiocc_sm6115_regmap_config = {
diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 5937b071533b68b7f5b4c9d5b8c23e3292ed212c..5174bd3dcdc571505b6a0c8f67d14cf9e5e22135 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -42,7 +42,7 @@ static const struct alpha_pll_config lpass_lpaaudio_dig_pll_config = {
 };
 
 static const u8 clk_alpha_pll_regs_offset[][PLL_OFF_MAX_REGS] = {
-	[CLK_ALPHA_PLL_TYPE_FABIA] =  {
+	[CLK_ALPHA_PLL_TYPE_FABIA] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_CAL_L_VAL] = 0x8,
 		[PLL_OFF_USER_CTL] = 0x0c,
diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index e69fc65b13da2b519af413137353693473ee258a..b723c536dfb6ce4ad0b9fc70345303ac2f691819 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -74,7 +74,7 @@ static struct clk_alpha_pll mmpll0 = {
 	},
 };
 
-static struct clk_alpha_pll mmpll6 =  {
+static struct clk_alpha_pll mmpll6 = {
 	.offset = 0xf0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
diff --git a/drivers/clk/qcom/nsscc-ipq9574.c b/drivers/clk/qcom/nsscc-ipq9574.c
index 64c6b05ff066b4f148c0911318cb316fd96de907..c8b11b04a7c225c5a80a07ba21ba575d3e45015f 100644
--- a/drivers/clk/qcom/nsscc-ipq9574.c
+++ b/drivers/clk/qcom/nsscc-ipq9574.c
@@ -3016,7 +3016,7 @@ static const struct qcom_reset_map nss_cc_ipq9574_resets[] = {
 	[NSSPORT4_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(5, 4) },
 	[NSSPORT5_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(3, 2) },
 	[NSSPORT6_RESET] = { .reg = 0x28a24, .bitmask = GENMASK(1, 0) },
-	[EDMA_HW_RESET] =  { .reg = 0x28a08, .bitmask = GENMASK(16, 15) },
+	[EDMA_HW_RESET] = { .reg = 0x28a08, .bitmask = GENMASK(16, 15) },
 };
 
 static const struct regmap_config nss_cc_ipq9574_regmap_config = {

---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20250802-topic-clk_qc_doublespace-a2410f53dfeb

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


