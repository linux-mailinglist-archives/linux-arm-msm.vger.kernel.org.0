Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E230F663782
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 03:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjAJCu6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 21:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjAJCu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 21:50:57 -0500
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B1C94C7A;
        Mon,  9 Jan 2023 18:50:53 -0800 (PST)
Received: from localhost.localdomain (unknown [124.16.138.125])
        by APP-03 (Coremail) with SMTP id rQCowAA3PZVf0rxjxpJNCw--.52104S2;
        Tue, 10 Jan 2023 10:50:08 +0800 (CST)
From:   Jiasheng Jiang <jiasheng@iscas.ac.cn>
To:     dmitry.baryshkov@linaro.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, marijn.suijten@somainline.org,
        vkoul@kernel.org, dianders@chromium.org, marex@denx.de,
        vladimir.lypak@gmail.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH] drm/msm/dsi: Drop the redundant fail label
Date:   Tue, 10 Jan 2023 10:50:06 +0800
Message-Id: <20230110025006.10409-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAA3PZVf0rxjxpJNCw--.52104S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1UXFW8GFWkGFWruFWxWFg_yoW5WrW3pF
        yaqFsrtr40yws2krW7AF17A3WrCF4fCa48G348Gwn7Aw1ayw4UXFs8ua1IgFyrt3ykuw4U
        Kanayas8WF1jqr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
        xVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
        6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
        xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
        fU5sjjDUUUU
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop the redundant fail label and change the "goto fail" into "return ret"
since they are the same.

Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 89aadd3b3202..d2a4fefa7b76 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1883,8 +1883,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
 	if (!msm_host) {
-		ret = -ENOMEM;
-		goto fail;
+		return -ENOMEM;
 	}
 
 	msm_host->pdev = pdev;
@@ -1893,31 +1892,28 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	ret = dsi_host_parse_dt(msm_host);
 	if (ret) {
 		pr_err("%s: failed to parse dt\n", __func__);
-		goto fail;
+		return ret;
 	}
 
 	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", &msm_host->ctrl_size);
 	if (IS_ERR(msm_host->ctrl_base)) {
 		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
-		ret = PTR_ERR(msm_host->ctrl_base);
-		goto fail;
+		return PTR_ERR(msm_host->ctrl_base);
 	}
 
 	pm_runtime_enable(&pdev->dev);
 
 	msm_host->cfg_hnd = dsi_get_config(msm_host);
 	if (!msm_host->cfg_hnd) {
-		ret = -EINVAL;
 		pr_err("%s: get config failed\n", __func__);
-		goto fail;
+		return -EINVAL;
 	}
 	cfg = msm_host->cfg_hnd->cfg;
 
 	msm_host->id = dsi_host_get_id(msm_host);
 	if (msm_host->id < 0) {
-		ret = msm_host->id;
 		pr_err("%s: unable to identify DSI host index\n", __func__);
-		goto fail;
+		return msm_host->id;
 	}
 
 	/* fixup base address by io offset */
@@ -1927,19 +1923,18 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 					    cfg->regulator_data,
 					    &msm_host->supplies);
 	if (ret)
-		goto fail;
+		return ret;
 
 	ret = dsi_clk_init(msm_host);
 	if (ret) {
 		pr_err("%s: unable to initialize dsi clks\n", __func__);
-		goto fail;
+		return ret;
 	}
 
 	msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
 	if (!msm_host->rx_buf) {
-		ret = -ENOMEM;
 		pr_err("%s: alloc rx temp buf failed\n", __func__);
-		goto fail;
+		return -ENOMEM;
 	}
 
 	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
@@ -1954,9 +1949,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
 	if (msm_host->irq < 0) {
-		ret = msm_host->irq;
 		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
-		return ret;
+		return msm_host->irq;
 	}
 
 	/* do not autoenable, will be enabled later */
@@ -1983,9 +1977,6 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	DBG("Dsi Host %d initialized", msm_host->id);
 	return 0;
-
-fail:
-	return ret;
 }
 
 void msm_dsi_host_destroy(struct mipi_dsi_host *host)
-- 
2.25.1

