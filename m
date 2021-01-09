Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BC92F0027
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbhAINrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbhAINro (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:47:44 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A08C0617B1;
        Sat,  9 Jan 2021 05:46:25 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7C2723EF1F;
        Sat,  9 Jan 2021 14:46:22 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 8/9] clk: qcom: gpucc-msm8998: Add resets, cxc, fix flags on gpu_gx_gdsc
Date:   Sat,  9 Jan 2021 14:46:16 +0100
Message-Id: <20210109134617.146275-9-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
References: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPU GX GDSC has GPU_GX_BCR reset and gfx3d_clk CXC, as stated
on downstream kernels (and as verified upstream, because otherwise
random lockups happen).
Also, add PWRSTS_RET and NO_RET_PERIPH: also as found downstream,
and also as verified here, to avoid GPU related lockups it is
necessary to force retain mem, but *not* peripheral when enabling
this GDSC (and, of course, the inverse on disablement).

With this change, the GPU finally works flawlessly on my four
different MSM8998 devices from two different manufacturers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/clk/qcom/gpucc-msm8998.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index 9b3923af02a1..1a518c4915b4 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -253,12 +253,16 @@ static struct gdsc gpu_cx_gdsc = {
 static struct gdsc gpu_gx_gdsc = {
 	.gdscr = 0x1094,
 	.clamp_io_ctrl = 0x130,
+	.resets = (unsigned int []){ GPU_GX_BCR },
+	.reset_count = 1,
+	.cxcs = (unsigned int []){ 0x1098 },
+	.cxc_count = 1,
 	.pd = {
 		.name = "gpu_gx",
 	},
 	.parent = &gpu_cx_gdsc.pd,
-	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET,
+	.pwrsts = PWRSTS_OFF_ON | PWRSTS_RET,
+	.flags = CLAMP_IO | SW_RESET | AON_RESET | NO_RET_PERIPH,
 };
 
 static struct clk_regmap *gpucc_msm8998_clocks[] = {
-- 
2.29.2

