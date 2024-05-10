Return-Path: <linux-arm-msm+bounces-19711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BB88C2901
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 19:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 769991C225AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 17:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C511C6B8;
	Fri, 10 May 2024 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="AT1qsOc1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD63D182BD;
	Fri, 10 May 2024 16:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715360396; cv=none; b=Kf9KC5J3OXczK1Z6JPqTvvM1rJwcF3qqS15Aa6aYgbfnJ+RrBQsw3VR2xyA+wV7RF0kJO96jIRbSJnFT+E3JNmAD9bNsf/pxBbohHM6SvyhN64FWS1U/W20l5F6MXGuB1+rnySCoKCXvESrDXhl7hQUPKViNhQIbknt8EVFqgbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715360396; c=relaxed/simple;
	bh=KRK71eh2UAdNxszgYH3Pjb6tK5qvW2r2fePyYlxqntU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvANHQxF8x7f3LftWotSW4KCgQAcEersIfqRpMbmmFbeUTJmgb6OvIYfu+s4l9MFABDVregy1eBOAzHbLNqFGkOwrgIUeAJda5Aw4ne5fPypmQ3/dWpvwwWtirCOsFdY8VOzeEhJaCxmNtDbQZ9XQr2UzUADE2aNZsr4qeu+8Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=AT1qsOc1; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 5TRsss8SODfl65TRtszFVB; Fri, 10 May 2024 18:50:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715359822;
	bh=b9Lp33WR9QxnnUWJ49kfLd3rLCP3DGsE00ZFeRMS6ww=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AT1qsOc1iZEmWn1y0f5B0yiqo6iMVLNDUNxP4DY9W6nc/oijHTC9EtYMS9/5GgJXs
	 X8mCbPJC42T+HmifEQ76SvrF48QHnT+uxSjAuIge8RDFQ9aExet7SmTt7CzIOrxCG1
	 JViX6p7EqCoWnu0HlCNOpcWhXmC6mDTmry+6L+6PCq5NS5PQIDFOuCWt59ygOlu7cD
	 lfCdn6+58grrFvjkJdbS33C8zgp102+pAA2f+FMvRd+HCmaZ88ZQfow/nh/6IzLZE+
	 vJBrHIRGpelYF2nlKMij4wtaEpg1qDJxedqEi7Oc6BWu4As1mVo89Quq+CPVnWxAlI
	 xJT3k7EN1j98A==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 10 May 2024 18:50:22 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: Constify struct pll_vco
Date: Fri, 10 May 2024 18:50:00 +0200
Message-ID: <c3c9a75ed77a5ef2e9b72081e88225d84bba91cd.1715359776.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pll_vco structure are never modified. They are used as .vco_table in
"struct clk_alpha_pll".

And in this structure, we have:
	const struct pll_vco *vco_table;

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
   text	   data	    bss	    dec	    hex	filename
   9905	  47576	      0	  57481	   e089	drivers/clk/qcom/mmcc-msm8994.o

After:
   text	   data	    bss	    dec	    hex	filename
  10033	  47440	      0	  57473	   e081	drivers/clk/qcom/mmcc-msm8994.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

I hope that it can be applied with this single patch because all files are
in drivers/clk/qcom/.
---
 drivers/clk/qcom/camcc-sc8280xp.c     | 4 ++--
 drivers/clk/qcom/camcc-sm6350.c       | 2 +-
 drivers/clk/qcom/camcc-sm8250.c       | 4 ++--
 drivers/clk/qcom/dispcc-sm6125.c      | 2 +-
 drivers/clk/qcom/dispcc-sm6350.c      | 2 +-
 drivers/clk/qcom/dispcc-sm6375.c      | 2 +-
 drivers/clk/qcom/dispcc-sm8450.c      | 2 +-
 drivers/clk/qcom/dispcc-sm8550.c      | 2 +-
 drivers/clk/qcom/dispcc-sm8650.c      | 2 +-
 drivers/clk/qcom/gcc-msm8998.c        | 2 +-
 drivers/clk/qcom/gcc-sc8180x.c        | 2 +-
 drivers/clk/qcom/gcc-sm6115.c         | 6 +++---
 drivers/clk/qcom/gcc-sm6375.c         | 4 ++--
 drivers/clk/qcom/gpucc-msm8998.c      | 2 +-
 drivers/clk/qcom/gpucc-sdm660.c       | 2 +-
 drivers/clk/qcom/gpucc-sm6115.c       | 4 ++--
 drivers/clk/qcom/gpucc-sm6125.c       | 2 +-
 drivers/clk/qcom/gpucc-sm6375.c       | 2 +-
 drivers/clk/qcom/gpucc-sm8250.c       | 2 +-
 drivers/clk/qcom/gpucc-sm8350.c       | 2 +-
 drivers/clk/qcom/gpucc-sm8450.c       | 2 +-
 drivers/clk/qcom/gpucc-sm8650.c       | 2 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c | 2 +-
 drivers/clk/qcom/mmcc-msm8994.c       | 4 ++--
 drivers/clk/qcom/mmcc-msm8996.c       | 6 +++---
 drivers/clk/qcom/mmcc-sdm660.c        | 4 ++--
 drivers/clk/qcom/videocc-sm8150.c     | 2 +-
 drivers/clk/qcom/videocc-sm8250.c     | 2 +-
 28 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 8e26ec2def73..d8de924a878a 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -45,11 +45,11 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static struct pll_vco lucid_vco[] = {
+static const struct pll_vco lucid_vco[] = {
 	{ 249600000, 1800000000, 0 },
 };
 
-static struct pll_vco zonda_vco[] = {
+static const struct pll_vco zonda_vco[] = {
 	{ 595200000, 3600000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index e4e7b308ecf1..c6fe684aa780 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -32,7 +32,7 @@ enum {
 	P_CAMCC_PLL3_OUT_MAIN,
 };
 
-static struct pll_vco fabia_vco[] = {
+static const struct pll_vco fabia_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 9b32c56a5bc5..96103eeda586 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -32,11 +32,11 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static struct pll_vco lucid_vco[] = {
+static const struct pll_vco lucid_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
-static struct pll_vco zonda_vco[] = {
+static const struct pll_vco zonda_vco[] = {
 	{ 595200000UL, 3600000000UL, 0 },
 };
 
diff --git a/drivers/clk/qcom/dispcc-sm6125.c b/drivers/clk/qcom/dispcc-sm6125.c
index 1cc5f220a3c4..85e07731cce2 100644
--- a/drivers/clk/qcom/dispcc-sm6125.c
+++ b/drivers/clk/qcom/dispcc-sm6125.c
@@ -28,7 +28,7 @@ enum {
 	P_GPLL0_OUT_MAIN,
 };
 
-static struct pll_vco disp_cc_pll_vco[] = {
+static const struct pll_vco disp_cc_pll_vco[] = {
 	{ 500000000, 1000000000, 2 },
 };
 
diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index e4b7464c4d0e..f712cbef9456 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -31,7 +31,7 @@ enum {
 	P_GCC_DISP_GPLL0_CLK,
 };
 
-static struct pll_vco fabia_vco[] = {
+static const struct pll_vco fabia_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/dispcc-sm6375.c b/drivers/clk/qcom/dispcc-sm6375.c
index d81d4e3c0b0d..2d42f85f184b 100644
--- a/drivers/clk/qcom/dispcc-sm6375.c
+++ b/drivers/clk/qcom/dispcc-sm6375.c
@@ -35,7 +35,7 @@ enum {
 	P_GCC_DISP_GPLL0_CLK,
 };
 
-static struct pll_vco lucid_vco[] = {
+static const struct pll_vco lucid_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 49bb4f58c391..5d028871624e 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -71,7 +71,7 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static struct pll_vco lucid_evo_vco[] = {
+static const struct pll_vco lucid_evo_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 38ecea805503..88f9347ab77c 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -71,7 +71,7 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static struct pll_vco lucid_ole_vco[] = {
+static const struct pll_vco lucid_ole_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index 3eb64bcad487..c0e1ea63166b 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -69,7 +69,7 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static struct pll_vco lucid_ole_vco[] = {
+static const struct pll_vco lucid_ole_vco[] = {
 	{ 249600000, 2100000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index cad7f1c7789c..5f8c87c1793f 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -27,7 +27,7 @@
 #define GCC_MMSS_MISC	0x0902C
 #define GCC_GPU_MISC	0x71028
 
-static struct pll_vco fabia_vco[] = {
+static const struct pll_vco fabia_vco[] = {
 	{ 250000000, 2000000000, 0 },
 	{ 125000000, 1000000000, 1 },
 };
diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 5261bfc92b3d..ad905affd376 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -39,7 +39,7 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static struct pll_vco trion_vco[] = {
+static const struct pll_vco trion_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index 13e521cd4259..167e344ad399 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -42,15 +42,15 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static struct pll_vco default_vco[] = {
+static const struct pll_vco default_vco[] = {
 	{ 500000000, 1000000000, 2 },
 };
 
-static struct pll_vco gpll9_vco[] = {
+static const struct pll_vco gpll9_vco[] = {
 	{ 500000000, 1250000000, 0 },
 };
 
-static struct pll_vco gpll10_vco[] = {
+static const struct pll_vco gpll10_vco[] = {
 	{ 750000000, 1500000000, 1 },
 };
 
diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index 84639d5b89bf..ac1ed2d728f9 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -50,11 +50,11 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static struct pll_vco lucid_vco[] = {
+static const struct pll_vco lucid_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
-static struct pll_vco zonda_vco[] = {
+static const struct pll_vco zonda_vco[] = {
 	{ 595200000, 3600000000UL, 0 },
 };
 
diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index 9a4fdff719ec..7b1cb44e31b2 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -48,7 +48,7 @@ static struct clk_branch gpucc_cxo_clk = {
 	},
 };
 
-static struct pll_vco fabia_vco[] = {
+static const struct pll_vco fabia_vco[] = {
 	{ 249600000, 2000000000, 0 },
 	{ 125000000, 1000000000, 1 },
 };
diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 459f123a6720..a52d98b7cf4c 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -51,7 +51,7 @@ static struct clk_branch gpucc_cxo_clk = {
 	},
 };
 
-static struct pll_vco gpu_vco[] = {
+static const struct pll_vco gpu_vco[] = {
 	{ 1000000000, 2000000000, 0 },
 	{ 500000000,  1000000000, 2 },
 	{ 250000000,   500000000, 3 },
diff --git a/drivers/clk/qcom/gpucc-sm6115.c b/drivers/clk/qcom/gpucc-sm6115.c
index fb71c21c9a89..9793dd9a2596 100644
--- a/drivers/clk/qcom/gpucc-sm6115.c
+++ b/drivers/clk/qcom/gpucc-sm6115.c
@@ -38,11 +38,11 @@ enum {
 	P_GPU_CC_PLL1_OUT_MAIN,
 };
 
-static struct pll_vco default_vco[] = {
+static const struct pll_vco default_vco[] = {
 	{ 1000000000, 2000000000, 0 },
 };
 
-static struct pll_vco pll1_vco[] = {
+static const struct pll_vco pll1_vco[] = {
 	{ 500000000, 1000000000, 2 },
 };
 
diff --git a/drivers/clk/qcom/gpucc-sm6125.c b/drivers/clk/qcom/gpucc-sm6125.c
index 61959ba02f9a..b719a48fe706 100644
--- a/drivers/clk/qcom/gpucc-sm6125.c
+++ b/drivers/clk/qcom/gpucc-sm6125.c
@@ -36,7 +36,7 @@ enum {
 	P_GPU_CC_PLL1_OUT_AUX2,
 };
 
-static struct pll_vco gpu_cc_pll_vco[] = {
+static const struct pll_vco gpu_cc_pll_vco[] = {
 	{ 1000000000, 2000000000, 0 },
 	{ 500000000,  1000000000, 2 },
 };
diff --git a/drivers/clk/qcom/gpucc-sm6375.c b/drivers/clk/qcom/gpucc-sm6375.c
index da24276a018e..4e9a30a080d3 100644
--- a/drivers/clk/qcom/gpucc-sm6375.c
+++ b/drivers/clk/qcom/gpucc-sm6375.c
@@ -42,7 +42,7 @@ enum {
 	P_GPU_CC_PLL1_OUT_ODD,
 };
 
-static struct pll_vco lucid_vco[] = {
+static const struct pll_vco lucid_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 84f7f65c8d42..012bd1380f55 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -32,7 +32,7 @@ enum {
 	P_GPU_CC_PLL1_OUT_MAIN,
 };
 
-static struct pll_vco lucid_vco[] = {
+static const struct pll_vco lucid_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index 38505d1388b6..9437d316d145 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -33,7 +33,7 @@ enum {
 	P_GPU_CC_PLL1_OUT_MAIN,
 };
 
-static struct pll_vco lucid_5lpe_vco[] = {
+static const struct pll_vco lucid_5lpe_vco[] = {
 	{ 249600000, 1750000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/gpucc-sm8450.c b/drivers/clk/qcom/gpucc-sm8450.c
index 1c4769b646b0..7b329a803289 100644
--- a/drivers/clk/qcom/gpucc-sm8450.c
+++ b/drivers/clk/qcom/gpucc-sm8450.c
@@ -36,7 +36,7 @@ enum {
 	P_GPU_CC_PLL1_OUT_MAIN,
 };
 
-static struct pll_vco lucid_evo_vco[] = {
+static const struct pll_vco lucid_evo_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/gpucc-sm8650.c b/drivers/clk/qcom/gpucc-sm8650.c
index 03307e482aca..c53306d3093f 100644
--- a/drivers/clk/qcom/gpucc-sm8650.c
+++ b/drivers/clk/qcom/gpucc-sm8650.c
@@ -37,7 +37,7 @@ enum {
 	P_GPU_CC_PLL1_OUT_MAIN,
 };
 
-static struct pll_vco lucid_ole_vco[] = {
+static const struct pll_vco lucid_ole_vco[] = {
 	{ 249600000, 2100000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index fd9cd2e3f956..8ac72d26087e 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -27,7 +27,7 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static struct pll_vco fabia_vco[] = {
+static const struct pll_vco fabia_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/mmcc-msm8994.c b/drivers/clk/qcom/mmcc-msm8994.c
index 3229ff77372f..f19080cf715b 100644
--- a/drivers/clk/qcom/mmcc-msm8994.c
+++ b/drivers/clk/qcom/mmcc-msm8994.c
@@ -84,14 +84,14 @@ static const struct clk_parent_data mmcc_xo_dsibyte[] = {
 	{ .fw_name = "dsi1pllbyte" },
 };
 
-static struct pll_vco mmpll_p_vco[] = {
+static const struct pll_vco mmpll_p_vco[] = {
 	{ 250000000, 500000000, 3 },
 	{ 500000000, 1000000000, 2 },
 	{ 1000000000, 1500000000, 1 },
 	{ 1500000000, 2000000000, 0 },
 };
 
-static struct pll_vco mmpll_t_vco[] = {
+static const struct pll_vco mmpll_t_vco[] = {
 	{ 500000000, 1500000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index d3f2dc798567..92287d40c3a5 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -57,20 +57,20 @@ static struct clk_fixed_factor gpll0_div = {
 	},
 };
 
-static struct pll_vco mmpll_p_vco[] = {
+static const struct pll_vco mmpll_p_vco[] = {
 	{ 250000000, 500000000, 3 },
 	{ 500000000, 1000000000, 2 },
 	{ 1000000000, 1500000000, 1 },
 	{ 1500000000, 2000000000, 0 },
 };
 
-static struct pll_vco mmpll_gfx_vco[] = {
+static const struct pll_vco mmpll_gfx_vco[] = {
 	{ 400000000, 1000000000, 2 },
 	{ 1000000000, 1500000000, 1 },
 	{ 1500000000, 2000000000, 0 },
 };
 
-static struct pll_vco mmpll_t_vco[] = {
+static const struct pll_vco mmpll_t_vco[] = {
 	{ 500000000, 1500000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 996bd01fb9ac..4b8380c2d648 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -96,14 +96,14 @@ static struct clk_alpha_pll mmpll6 =  {
 };
 
 /* APSS controlled PLLs */
-static struct pll_vco vco[] = {
+static const struct pll_vco vco[] = {
 	{ 1000000000, 2000000000, 0 },
 	{ 750000000, 1500000000, 1 },
 	{ 500000000, 1000000000, 2 },
 	{ 250000000, 500000000, 3 },
 };
 
-static struct pll_vco mmpll3_vco[] = {
+static const struct pll_vco mmpll3_vco[] = {
 	{ 750000000, 1500000000, 1 },
 };
 
diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index a0329260157a..554631aa279b 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -24,7 +24,7 @@ enum {
 	P_VIDEO_PLL0_OUT_MAIN,
 };
 
-static struct pll_vco trion_vco[] = {
+static const struct pll_vco trion_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 016b596e03b3..914eddd0ae15 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -26,7 +26,7 @@ enum {
 	P_VIDEO_PLL1_OUT_MAIN,
 };
 
-static struct pll_vco lucid_vco[] = {
+static const struct pll_vco lucid_vco[] = {
 	{ 249600000, 2000000000, 0 },
 };
 
-- 
2.45.0


