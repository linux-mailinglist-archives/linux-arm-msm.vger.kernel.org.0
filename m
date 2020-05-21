Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC6521DC69B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 07:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgEUF1s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 01:27:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:38874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726790AbgEUF1r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 01:27:47 -0400
Received: from localhost.localdomain (unknown [106.200.226.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 761CE204EC;
        Thu, 21 May 2020 05:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590038867;
        bh=lt0gpxVtnKWojiQaQODpIem/TXcGV3ie7U1cocBy44k=;
        h=From:To:Cc:Subject:Date:From;
        b=PD9bs30kqSo+GyXazKTr+hSlcs2oL24652D2CTC83HmCbeuHjvhEApe/ILYDCjgDh
         uw/qt0QdEFuv7gq/2RWMGuM/d7l2gRUQTQs8Et/Z30wPGDpa14rbbtfULVePyObNlM
         4ZAaW5MUwCybHO5IOoMnfSpsdSTcXOrFGmXkvKK8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc: Fix parent for gpll0_out_even
Date:   Thu, 21 May 2020 10:57:28 +0530
Message-Id: <20200521052728.2141377-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Documentation says that gpll0 is parent of gpll0_out_even, somehow
driver coded that as bi_tcxo, so fix it

Fixes: 2a1d7eb854bb ("clk: qcom: gcc: Add global clock controller driver for SM8150")
Reported-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/gcc-sm8150.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 2bc08e7125bf..72524cf11048 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -76,8 +76,7 @@ static struct clk_alpha_pll_postdiv gpll0_out_even = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_even",
 		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "bi_tcxo",
-			.name = "bi_tcxo",
+			.hw = &gpll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_trion_pll_postdiv_ops,
-- 
2.25.4

