Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABA72E7F25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 10:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgLaJ5Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 04:57:16 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:52098 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726290AbgLaJ5Q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 04:57:16 -0500
Received: from localhost.localdomain (unknown [124.16.141.241])
        by APP-01 (Coremail) with SMTP id qwCowAA3PhZDoO1fqPRgAA--.43731S2;
        Thu, 31 Dec 2020 17:56:19 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, tzimmermann@suse.de, mka@chromium.org,
        harigovi@codeaurora.org, emil.velikov@collabora.com,
        rikard.falkeborn@gmail.com, viresh.kumar@linaro.org,
        rnayak@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: dsi: Remove redundant null check before clk_prepare_enable/clk_disable_unprepare
Date:   Thu, 31 Dec 2020 09:56:16 +0000
Message-Id: <20201231095616.25973-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowAA3PhZDoO1fqPRgAA--.43731S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4ruw15WFWxKr4kZF17GFg_yoW8XF1Upr
        W3trWkKr4xArZ29FsIqF4Ykw1rtF4DGayxGasxG3W7WwnxAryDXFZ8C3Zaga4UtFykCw43
        u3Zxtr9xWF10yFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr
        1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kI
        c2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjxUc6RRDUUUU
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCgcHA1z4jQ6uygAAsK
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Because clk_prepare_enable() and clk_disable_unprepare() already checked
NULL clock parameter, so the additional checks are unnecessary, just
remove them.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ab281cba0f08..e7af90f045bf 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -565,13 +565,11 @@ int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
 		goto pixel_clk_err;
 	}
 
-	if (msm_host->byte_intf_clk) {
-		ret = clk_prepare_enable(msm_host->byte_intf_clk);
-		if (ret) {
-			pr_err("%s: Failed to enable byte intf clk\n",
-			       __func__);
-			goto byte_intf_clk_err;
-		}
+	ret = clk_prepare_enable(msm_host->byte_intf_clk);
+	if (ret) {
+		pr_err("%s: Failed to enable byte intf clk\n",
+			   __func__);
+		goto byte_intf_clk_err;
 	}
 
 	return 0;
@@ -667,8 +665,7 @@ void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host)
 	dev_pm_opp_set_rate(&msm_host->pdev->dev, 0);
 	clk_disable_unprepare(msm_host->esc_clk);
 	clk_disable_unprepare(msm_host->pixel_clk);
-	if (msm_host->byte_intf_clk)
-		clk_disable_unprepare(msm_host->byte_intf_clk);
+	clk_disable_unprepare(msm_host->byte_intf_clk);
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
-- 
2.17.1

