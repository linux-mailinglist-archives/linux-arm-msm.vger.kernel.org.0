Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1699B42097
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 11:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436774AbfFLJUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 05:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:38650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436698AbfFLJUq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 05:20:46 -0400
Received: from localhost.localdomain (unknown [106.200.205.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DFC0208C2;
        Wed, 12 Jun 2019 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560331245;
        bh=TqalOT6RU4JOZfiDL0C0YDqOJnKe84kysLBlQSgfPkk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zoewmHeGO9DB/fz1vs803+8fAvzoU8zc7sIgynnTGpzwYQk3Jaww4vopBQH1yVEVW
         S9VhrszpMLQ0LqQqkL+iARmMAhpCsvXquEi2t0YsqHk44BczOnItK76CtGsHnpegip
         x4i4WxAIQXCqkwrDQGvdIZxdPfg7vW4YSqo9AlyM=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 3/5] clk: qcom: gcc-qcs404: Add MODULE_ALIAS
Date:   Wed, 12 Jun 2019 14:47:20 +0530
Message-Id: <20190612091722.9377-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612091722.9377-1-vkoul@kernel.org>
References: <20190612091722.9377-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MODULE_ALIAS was missing for this driver which can be built as a
module, so add the MODULE_ALIAS.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index a54807eb3b28..eb3ac7a26fb8 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -2828,3 +2828,4 @@ module_exit(gcc_qcs404_exit);
 
 MODULE_DESCRIPTION("Qualcomm GCC QCS404 Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:gcc-qcs404");
-- 
2.20.1

