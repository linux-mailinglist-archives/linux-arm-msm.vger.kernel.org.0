Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCB92E7F19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 10:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgLaJuy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 04:50:54 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:48530 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726139AbgLaJuy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 04:50:54 -0500
Received: from localhost.localdomain (unknown [124.16.141.241])
        by APP-01 (Coremail) with SMTP id qwCowACnTX3mnO1fYrVgAA--.57650S2;
        Thu, 31 Dec 2020 17:41:58 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, jcrouse@codeaurora.org, tzimmermann@suse.de,
        sam@ravnborg.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/mdp4: Remove redundant null check before clk_prepare_enable/clk_disable_unprepare
Date:   Thu, 31 Dec 2020 09:41:55 +0000
Message-Id: <20201231094155.25481-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowACnTX3mnO1fYrVgAA--.57650S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4ruw15WFW8uw4kAr4Dtwb_yoW8WryDpr
        97Kr4Svrs7ur9Y93WDtrs8tw1Fyw4jyFyrWr15Ga45Wr1fCr98ZFWxA3WkuFs8Ar1kCr13
        Zw4UGr95u3W8KFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8Jr0_Cr
        1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kI
        c2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjxU266wDUUUU
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCwoHA1z4jszeQgAAs-
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Because clk_prepare_enable() and clk_disable_unprepare() already checked
NULL clock parameter, so the additional checks are unnecessary, just
remove them.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 3d729270bde1..696a22d571ad 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -207,12 +207,9 @@ int mdp4_disable(struct mdp4_kms *mdp4_kms)
 	DBG("");
 
 	clk_disable_unprepare(mdp4_kms->clk);
-	if (mdp4_kms->pclk)
-		clk_disable_unprepare(mdp4_kms->pclk);
-	if (mdp4_kms->lut_clk)
-		clk_disable_unprepare(mdp4_kms->lut_clk);
-	if (mdp4_kms->axi_clk)
-		clk_disable_unprepare(mdp4_kms->axi_clk);
+	clk_disable_unprepare(mdp4_kms->pclk);
+	clk_disable_unprepare(mdp4_kms->lut_clk);
+	clk_disable_unprepare(mdp4_kms->axi_clk);
 
 	return 0;
 }
@@ -222,12 +219,9 @@ int mdp4_enable(struct mdp4_kms *mdp4_kms)
 	DBG("");
 
 	clk_prepare_enable(mdp4_kms->clk);
-	if (mdp4_kms->pclk)
-		clk_prepare_enable(mdp4_kms->pclk);
-	if (mdp4_kms->lut_clk)
-		clk_prepare_enable(mdp4_kms->lut_clk);
-	if (mdp4_kms->axi_clk)
-		clk_prepare_enable(mdp4_kms->axi_clk);
+	clk_prepare_enable(mdp4_kms->pclk);
+	clk_prepare_enable(mdp4_kms->lut_clk);
+	clk_prepare_enable(mdp4_kms->axi_clk);
 
 	return 0;
 }
-- 
2.17.1

