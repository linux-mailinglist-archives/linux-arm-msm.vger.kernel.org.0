Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10562F5276
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 19:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbhAMSjj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 13:39:39 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:33689 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728490AbhAMSjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 13:39:17 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CBF1F1FAC6;
        Wed, 13 Jan 2021 19:38:19 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 2/9] clk: qcom: gcc-sdm660: Mark GPU CFG AHB clock as critical
Date:   Wed, 13 Jan 2021 19:38:10 +0100
Message-Id: <20210113183817.447866-3-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This clock is critical for any access to the GPU: gating it will
crash the system when the GPU has been initialized (so, you cannot
gate it unless you deinit the Adreno completely).

So, to achieve a working state with GPU on, set the CLK_IS_CRITICAL
flag to this clock.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/clk/qcom/gcc-sdm660.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 3b7181d0ff71..6394257ca8c0 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -1571,6 +1571,7 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_cfg_ahb_clk",
 			.ops = &clk_branch2_ops,
+			.flags = CLK_IS_CRITICAL,
 		},
 	},
 };
-- 
2.29.2

