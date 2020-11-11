Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD692AEBF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 09:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbgKKIcF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 03:32:05 -0500
Received: from m176115.mail.qiye.163.com ([59.111.176.115]:48884 "EHLO
        m176115.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgKKIcF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 03:32:05 -0500
Received: from ubuntu.localdomain (unknown [157.0.31.124])
        by m176115.mail.qiye.163.com (Hmail) with ESMTPA id 9D687667349;
        Wed, 11 Nov 2020 16:32:01 +0800 (CST)
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
Subject: [PATCH 1/5] adreno/a2xx_gpu.c: add KERN_LEVEL to printk
Date:   Wed, 11 Nov 2020 00:31:18 -0800
Message-Id: <20201111083131.39817-2-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201111083131.39817-1-bernard@vivo.com>
References: <20201111083131.39817-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQ0JLHktPHktDSk9LVkpNS05LQ0hOSUpCQk9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRg6ITo4Tz8uDRcDFggeCQMW
        DjwKCRNVSlVKTUtOS0NITklJT09CVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
        S1VISlVKSU9ZV1kIAVlBSEpOQjcG
X-HM-Tid: 0a75b66ee38f9373kuws9d687667349
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add KERN_LEVEL to printk.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 7e82c41a85f1..33b45d237e56 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -252,7 +252,7 @@ static void a2xx_recover(struct msm_gpu *gpu)
 	adreno_dump_info(gpu);
 
 	for (i = 0; i < 8; i++) {
-		printk("CP_SCRATCH_REG%d: %u\n", i,
+		printk(KERN_DEBUG "CP_SCRATCH_REG%d: %u\n", i,
 			gpu_read(gpu, REG_AXXX_CP_SCRATCH_REG0 + i));
 	}
 
@@ -429,7 +429,7 @@ static const unsigned int a225_registers[] = {
 /* would be nice to not have to duplicate the _show() stuff with printk(): */
 static void a2xx_dump(struct msm_gpu *gpu)
 {
-	printk("status:   %08x\n",
+	printk(KERN_DEBUG "status:   %08x\n",
 			gpu_read(gpu, REG_A2XX_RBBM_STATUS));
 	adreno_dump(gpu);
 }
-- 
2.29.0

