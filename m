Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F25661C76
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 03:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjAICvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 21:51:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233771AbjAICvm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 21:51:42 -0500
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A4219FD09;
        Sun,  8 Jan 2023 18:51:40 -0800 (PST)
Received: from localhost.localdomain (unknown [124.16.138.125])
        by APP-05 (Coremail) with SMTP id zQCowAAXOM0HgbtjSqnGCw--.10661S2;
        Mon, 09 Jan 2023 10:50:50 +0800 (CST)
From:   Jiasheng Jiang <jiasheng@iscas.ac.cn>
To:     dmitry.baryshkov@linaro.org, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, marijn.suijten@somainline.org, vkoul@kernel.org,
        dianders@chromium.org, marex@denx.de, vladimir.lypak@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH v2] drm/msm/dsi: Add missing check for alloc_ordered_workqueue
Date:   Mon,  9 Jan 2023 10:50:44 +0800
Message-Id: <20230109025044.27766-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAXOM0HgbtjSqnGCw--.10661S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1xAw4xGrWDCw4rWryrCrg_yoW5AF18pr
        WaqF4Dtr40yws7ArZrAF17Aw1rGF4fGa48G34ruwnrAw1ayw4DXr4q9a1FgFyrtryUWw4U
        KFsayas8CF18tr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
        xVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
        6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
        xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
        fUoOJ5UUUUU
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add check for the return value of alloc_ordered_workqueue as it may return
NULL pointer and cause NULL pointer dereference.
Moreover, change the "goto fail" into "return ret" and drop the "fail"
label since they are the same.

Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
Changelog:

v1 -> v2:

1. Change the "goto fail" into "return ret" and drop the "fail" label.
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 89aadd3b3202..819f5be5fd77 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1884,7 +1884,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
 	if (!msm_host) {
 		ret = -ENOMEM;
-		goto fail;
+		return ret;
 	}
 
 	msm_host->pdev = pdev;
@@ -1893,14 +1893,14 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	ret = dsi_host_parse_dt(msm_host);
 	if (ret) {
 		pr_err("%s: failed to parse dt\n", __func__);
-		goto fail;
+		return ret;
 	}
 
 	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", &msm_host->ctrl_size);
 	if (IS_ERR(msm_host->ctrl_base)) {
 		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
 		ret = PTR_ERR(msm_host->ctrl_base);
-		goto fail;
+		return ret;
 	}
 
 	pm_runtime_enable(&pdev->dev);
@@ -1909,7 +1909,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	if (!msm_host->cfg_hnd) {
 		ret = -EINVAL;
 		pr_err("%s: get config failed\n", __func__);
-		goto fail;
+		return ret;
 	}
 	cfg = msm_host->cfg_hnd->cfg;
 
@@ -1917,7 +1917,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	if (msm_host->id < 0) {
 		ret = msm_host->id;
 		pr_err("%s: unable to identify DSI host index\n", __func__);
-		goto fail;
+		return ret;
 	}
 
 	/* fixup base address by io offset */
@@ -1927,19 +1927,19 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
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
 		ret = -ENOMEM;
 		pr_err("%s: alloc rx temp buf failed\n", __func__);
-		goto fail;
+		return ret;
 	}
 
 	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
@@ -1977,15 +1977,17 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	/* setup workqueue */
 	msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
+	if (!msm_host->workqueue) {
+		ret = -ENOMEM;
+		return ret;
+	}
+
 	INIT_WORK(&msm_host->err_work, dsi_err_worker);
 
 	msm_dsi->id = msm_host->id;
 
 	DBG("Dsi Host %d initialized", msm_host->id);
 	return 0;
-
-fail:
-	return ret;
 }
 
 void msm_dsi_host_destroy(struct mipi_dsi_host *host)
-- 
2.25.1

