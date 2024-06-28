Return-Path: <linux-arm-msm+bounces-24583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBD491B976
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 905EF1F21E8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06972145B09;
	Fri, 28 Jun 2024 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bmPOOXus"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF951420D5
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719562092; cv=none; b=l2t5fZkCypjqfamumReEUaHHx5iqgHRTBZ6pONJNkQgAFl+WVgvhAToQJhLE+aeZlqwpyi45Dtr7UFPyCIB0ZAyspMQTeAXuCihFEVwEqqOJK8umVbBfycTFY8Z5zzfwQVHrPhf/qpOQOJIU61gPBezO5/VewFcSWD+dJ1PDsr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719562092; c=relaxed/simple;
	bh=41oNDz5c7oUAokOmMhFzKnI6wjskS3LVFUFAxJD2zSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iHgULEF1yZOUuQoh8YFeraG8ysXwcpYO9FmYFWeR+UCmKPOsxSTxhDWNSi/epe8AM4/wpfonkd8szLAkNw1tolA6wJLy9c75uSpFX45CvysIdoYJ8Z0YjaTVXvzSWRlaMdHkh0YFc0IQGq6DsyC1vPPJNerWR1aF47tL0Zoo5Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bmPOOXus; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42565697036so8684325e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719562088; x=1720166888; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=06TDJZgyAHNoK7t/slRh8KPNLeMLNVUhost2fyavEJg=;
        b=bmPOOXusJE+eU0MfzucwbY6aCDlYkjP2Qvu8dw+Zap/A3Zgs87ZW6XRTLcWTvL8sgU
         0gfxSdZb4ceG+mn6qMeAzZrHYSaFQMALab+khCYNuhMv2CnkRJC4JSAKcD4/afaJQ5Eq
         nH5/gskVQhoENBl0/letkrG/8/v4ucx3AVEzrc5SyzPtNFg+0GLJ9ukONAQvqfxrp5rV
         kWHjOPAb5dMRAk2QnK0W4L3nFG2mE0bjIx1KTXloqhAQ6illDNUHOsqG2gUTUXkH+nkP
         dulfWvqHN4WNaStbOeqqD18HiS7Uvvmlh0W+YX22GV2/n1aHJwzOWyMcI3kBHSPKheqJ
         rHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719562088; x=1720166888;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06TDJZgyAHNoK7t/slRh8KPNLeMLNVUhost2fyavEJg=;
        b=n3iHsRq7etNk/gbtZfARhXz5GeD9H6jxjduR6KsT9YteG9FS8aVswXW83iRs1/YIDv
         vhHGaL822gZG3zrB6rqyGr+p877KSSI8AUQ0acXjXpAe6Aiqw9CvEHg1icnfio0ooxT1
         f4S3CBujwM8nVlpzjBYi0dO4SohMOPTsLm2yyNycafrO2oQegzSFvd/cGfIRYYraEK8q
         onUrqjifFWuGiF+YAcRM11MYM4PW1sbAf+7QTbpHw9sO8RBz0Ojqv4oss/6kIs7tWFQ+
         D8xg+y1IytS8GSpX1sOm6FqY7ViL6OUeHspBr6g3GdNb2O0ND3T1x0rXp8NEteOOrcZ+
         lzng==
X-Forwarded-Encrypted: i=1; AJvYcCXqbfyrzlyC2/TmFkKROPfKQJFAk0O4KPOvDs5+PXy9s1N+L+rAi8lQqnN5Yya1hkY6zMTJ6XwLUVv/JwNgyv60Zujjwi1ctwSakitNBA==
X-Gm-Message-State: AOJu0YzotVedOCXlAk2+0Wyqxbdb65punY4Qbn01Uw5odCgoytkRHvap
	+UQScAuPnUG8EoZi/N8KURnrW6vPkEQtuB/AAgj5O2xCIhoRrhWvayUhCvmLZh9Ei51gq42S7+c
	A
X-Google-Smtp-Source: AGHT+IEIq35I7WeKeHK0Wc3gJvM94orx6EJ4F9tXOSc1HodODK7qNv0a6SRLI0lKd1nzuFPTLdWpkg==
X-Received: by 2002:a5d:468a:0:b0:35f:fd7:6102 with SMTP id ffacd0b85a97d-36760a975d9mr728000f8f.35.1719562088034;
        Fri, 28 Jun 2024 01:08:08 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103f0bsm1447899f8f.110.2024.06.28.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:08:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 28 Jun 2024 11:08:00 +0300
Subject: [PATCH v2] clk: qcom: gcc-x1e80100: Fix halt_check for all pipe
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-v2-1-db3be54b1143@linaro.org>
X-B4-Tracking: v=1; b=H4sIAF9vfmYC/6WOQQqEMAxFryJdT4ZWrcis5h6DCxtTGxQrrSOKe
 PepXmHI6oX/83KISIEpild2iEArR/ZTgvyRCXTt1BNwl1jkMi+lLiRsimqppAQcB+gRwfIGrh0
 XQEc4gPUBvtHA7HaYeaYrF4FsjVYbXRXKiHR7DpR6t/fTJHYcFx/2+41VXdt/jauCNBVWtuwQT
 affI09t8E8fetGc5/kDixX33fsAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8179; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=41oNDz5c7oUAokOmMhFzKnI6wjskS3LVFUFAxJD2zSo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmfm9iRYHd+6ihAwGxJxdAYY5fH15cJ0bJgWh5k
 dMnF9nlHPWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZn5vYgAKCRAbX0TJAJUV
 VoeWEAC8JBNMHMFMaqXaXmLlWmtrGtgQsO42AAOrzNHgkTr1CLDDrHgkcbfDSXkxiHzhbUZujyJ
 QMFvewNA9zIvVAnVj0NakfJ4LKXDYYGMMDV28ejfEcwbAHWvbRO965v3XwoMeDomZMjD8FzTg5y
 LljZ9UpDNrD8a07lOindseFdq6Kg7grzezHQqcZ/ezOD3RWsGW+iLLxMfoe/8ieZLNVRz7yrePq
 40b6kpwx+VhwGlLyXAyQM510Y4RXgkrgweBXETOrWQynPEaxBiEiEBYaEFJU+R2ILmmZ5O5AJzd
 0ZUbRjDUXRMZ242BwPDAeDIohrP+Q2Vrgd8f6Z9zEaK1o8Romc0WYER8KyCIHhRwzZYcuAwJwgQ
 C0VdvcE4hyWIdPEAObTC8V51VVU9CAIWfg6olFFQXyDBVqPMTtmakjecmKHcIY5CMRSoYAplj5w
 VUgLLSFvR6GFOfCsxpUddN0aL85RfzNw2vERNMzBJBTVveDNAQybWPKAol260OnkpePefg5PQXN
 qQsk6D9OsCpBDXgAc4qW/7mSChHj+KAgVLhyIEPcMH2S3PxHtpJnEKXeKTcrur0bHPPOYUiA/JF
 Sd1mS1cgJosR6y2yKvHtqRKGKVjkc0bKMCaDZFs9cR/Wg9+a3oRvC5qd/MGlbmmrUG8z27yDiLd
 k9qbCNigPsMFY3w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

In case of all pipe clocks, there is a QMP PHY clock that is feeding them.
If, for whatever reason, the clock from the PHY is not enabled, halt bit
will not get set, and the clock controller driver will assume the clock
is stuck in a specific state. The way this is supposed to be properly
fixed is to defer the checking of the halt bit until after the PHY clock
has been initialized, but doing so complicates the clock controller
driver. In fact, since these pipe clocks are consumed by the PHY, while
the PHY is also the one providing the source, if clock gets stuck, the PHY
driver would be to blame. So instead of checking the halt bit in here,
just skip it and assume the PHY driver is handling the source clock
correctly.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Re-worded the commit message from scratch.
- Changed all pipe clocks halt_check to skip.
- Link to v1: https://lore.kernel.org/r/20240530-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-v1-1-16c6f4dccbd5@linaro.org
---
 drivers/clk/qcom/gcc-x1e80100.c | 44 ++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index eb7e36ebd7ae..fc80011342da 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -2812,7 +2812,7 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
 
 static struct clk_branch gcc_pcie_0_pipe_clk = {
 	.halt_reg = 0xa0044,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52010,
 		.enable_mask = BIT(25),
@@ -2901,7 +2901,7 @@ static struct clk_branch gcc_pcie_1_mstr_axi_clk = {
 
 static struct clk_branch gcc_pcie_1_pipe_clk = {
 	.halt_reg = 0x2c044,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52020,
 		.enable_mask = BIT(30),
@@ -2990,7 +2990,7 @@ static struct clk_branch gcc_pcie_2_mstr_axi_clk = {
 
 static struct clk_branch gcc_pcie_2_pipe_clk = {
 	.halt_reg = 0x13044,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52020,
 		.enable_mask = BIT(23),
@@ -3110,7 +3110,7 @@ static struct clk_branch gcc_pcie_3_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_3_pipe_clk = {
 	.halt_reg = 0x58050,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52020,
 		.enable_mask = BIT(3),
@@ -3235,7 +3235,7 @@ static struct clk_branch gcc_pcie_4_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_4_pipe_clk = {
 	.halt_reg = 0x6b044,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52008,
 		.enable_mask = BIT(4),
@@ -3360,7 +3360,7 @@ static struct clk_branch gcc_pcie_5_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_5_pipe_clk = {
 	.halt_reg = 0x2f044,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52018,
 		.enable_mask = BIT(17),
@@ -3498,7 +3498,7 @@ static struct clk_branch gcc_pcie_6a_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_6a_pipe_clk = {
 	.halt_reg = 0x31050,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52018,
 		.enable_mask = BIT(26),
@@ -3636,7 +3636,7 @@ static struct clk_branch gcc_pcie_6b_phy_rchng_clk = {
 
 static struct clk_branch gcc_pcie_6b_pipe_clk = {
 	.halt_reg = 0x8d050,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52000,
 		.enable_mask = BIT(30),
@@ -5109,7 +5109,7 @@ static struct clk_branch gcc_usb3_mp_phy_com_aux_clk = {
 
 static struct clk_branch gcc_usb3_mp_phy_pipe_0_clk = {
 	.halt_reg = 0x17290,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x17290,
 		.enable_mask = BIT(0),
@@ -5122,7 +5122,7 @@ static struct clk_branch gcc_usb3_mp_phy_pipe_0_clk = {
 
 static struct clk_branch gcc_usb3_mp_phy_pipe_1_clk = {
 	.halt_reg = 0x17298,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x17298,
 		.enable_mask = BIT(0),
@@ -5186,7 +5186,7 @@ static struct clk_regmap_mux gcc_usb3_prim_phy_pipe_clk_src = {
 
 static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
 	.halt_reg = 0x39068,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x39068,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -5257,7 +5257,7 @@ static struct clk_regmap_mux gcc_usb3_sec_phy_pipe_clk_src = {
 
 static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
 	.halt_reg = 0xa1068,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0xa1068,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -5327,7 +5327,7 @@ static struct clk_regmap_mux gcc_usb3_tert_phy_pipe_clk_src = {
 
 static struct clk_branch gcc_usb3_tert_phy_pipe_clk = {
 	.halt_reg = 0xa2068,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0xa2068,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -5405,7 +5405,7 @@ static struct clk_branch gcc_usb4_0_master_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_p2rr2p_pipe_clk = {
 	.halt_reg = 0x9f0d8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9f0d8,
 		.enable_mask = BIT(0),
@@ -5418,7 +5418,7 @@ static struct clk_branch gcc_usb4_0_phy_p2rr2p_pipe_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_pcie_pipe_clk = {
 	.halt_reg = 0x9f048,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52010,
 		.enable_mask = BIT(19),
@@ -5457,7 +5457,7 @@ static struct clk_branch gcc_usb4_0_phy_rx1_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_usb_pipe_clk = {
 	.halt_reg = 0x9f0a4,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x9f0a4,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -5582,7 +5582,7 @@ static struct clk_branch gcc_usb4_1_master_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_p2rr2p_pipe_clk = {
 	.halt_reg = 0x2b0d8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0d8,
 		.enable_mask = BIT(0),
@@ -5595,7 +5595,7 @@ static struct clk_branch gcc_usb4_1_phy_p2rr2p_pipe_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_pcie_pipe_clk = {
 	.halt_reg = 0x2b048,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52028,
 		.enable_mask = BIT(0),
@@ -5634,7 +5634,7 @@ static struct clk_branch gcc_usb4_1_phy_rx1_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_usb_pipe_clk = {
 	.halt_reg = 0x2b0a4,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x2b0a4,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -5759,7 +5759,7 @@ static struct clk_branch gcc_usb4_2_master_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_p2rr2p_pipe_clk = {
 	.halt_reg = 0x110d8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x110d8,
 		.enable_mask = BIT(0),
@@ -5772,7 +5772,7 @@ static struct clk_branch gcc_usb4_2_phy_p2rr2p_pipe_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_pcie_pipe_clk = {
 	.halt_reg = 0x11048,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52028,
 		.enable_mask = BIT(1),
@@ -5811,7 +5811,7 @@ static struct clk_branch gcc_usb4_2_phy_rx1_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_usb_pipe_clk = {
 	.halt_reg = 0x110a4,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_SKIP,
 	.hwcg_reg = 0x110a4,
 	.hwcg_bit = 1,
 	.clkr = {

---
base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
change-id: 20240530-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-ef8cf5b5631b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


