Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35DAD2AEC03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 09:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgKKIca (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 03:32:30 -0500
Received: from m176115.mail.qiye.163.com ([59.111.176.115]:52408 "EHLO
        m176115.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKKIca (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 03:32:30 -0500
Received: from ubuntu.localdomain (unknown [157.0.31.124])
        by m176115.mail.qiye.163.com (Hmail) with ESMTPA id E00F76672D5;
        Wed, 11 Nov 2020 16:32:26 +0800 (CST)
From:   Bernard Zhao <bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bernard Zhao <bernard@vivo.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@redhat.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] adreno/a4xx_gpu.c: add KERN_LEVEL to printk
Date:   Wed, 11 Nov 2020 00:31:20 -0800
Message-Id: <20201111083131.39817-4-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201111083131.39817-1-bernard@vivo.com>
References: <20201111083131.39817-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZTRlPTB8ZHh1IT0seVkpNS05LQ0hOT0xITkJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mgg6EBw4TT8vThcXSwg9CANJ
        Sk0KC0lVSlVKTUtOS0NITk9MQ0hDVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
        S1VISlVKSU9ZV1kIAVlBSE9DQzcG
X-HM-Tid: 0a75b66f46949373kuwse00f76672d5
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add KERN_LEVEL to printk.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 2b93b33b05e4..2206b3b4b191 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -355,7 +355,7 @@ static void a4xx_recover(struct msm_gpu *gpu)
 	adreno_dump_info(gpu);
 
 	for (i = 0; i < 8; i++) {
-		printk("CP_SCRATCH_REG%d: %u\n", i,
+		printk(KERN_DEBUG "CP_SCRATCH_REG%d: %u\n", i,
 			gpu_read(gpu, REG_AXXX_CP_SCRATCH_REG0 + i));
 	}
 
@@ -409,7 +409,7 @@ static irqreturn_t a4xx_irq(struct msm_gpu *gpu)
 
 	if (status & A4XX_INT0_CP_REG_PROTECT_FAULT) {
 		uint32_t reg = gpu_read(gpu, REG_A4XX_CP_PROTECT_STATUS);
-		printk("CP | Protected mode error| %s | addr=%x\n",
+		printk(KERN_DEBUG "CP | Protected mode error| %s | addr=%x\n",
 			reg & (1 << 24) ? "WRITE" : "READ",
 			(reg & 0xFFFFF) >> 2);
 	}
@@ -565,7 +565,7 @@ static struct msm_gpu_state *a4xx_gpu_state_get(struct msm_gpu *gpu)
 
 static void a4xx_dump(struct msm_gpu *gpu)
 {
-	printk("status:   %08x\n",
+	printk(KERN_DEBUG "status:   %08x\n",
 			gpu_read(gpu, REG_A4XX_RBBM_STATUS));
 	adreno_dump(gpu);
 }
-- 
2.29.0

