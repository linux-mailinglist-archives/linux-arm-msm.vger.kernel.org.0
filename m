Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF682AEC0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 09:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgKKIc4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 03:32:56 -0500
Received: from m176115.mail.qiye.163.com ([59.111.176.115]:55774 "EHLO
        m176115.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgKKIc4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 03:32:56 -0500
Received: from ubuntu.localdomain (unknown [157.0.31.124])
        by m176115.mail.qiye.163.com (Hmail) with ESMTPA id EA409666B88;
        Wed, 11 Nov 2020 16:32:50 +0800 (CST)
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
Subject: [PATCH 5/5] adreno/adreno_gpu.c: add KERN_LEVEL to printk
Date:   Wed, 11 Nov 2020 00:31:22 -0800
Message-Id: <20201111083131.39817-6-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201111083131.39817-1-bernard@vivo.com>
References: <20201111083131.39817-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSEpIHk8YSR9MGBhPVkpNS05LQ0hOTEpIS0xVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDY6Hgw*CT8fERcISw84DwtI
        OUwKFD1VSlVKTUtOS0NITkxKTE5CVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
        S1VISlVKSU9ZV1kIAVlBT0pOQzcG
X-HM-Tid: 0a75b66fa42d9373kuwsea409666b88
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add KERN_LEVEL to printk.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 458b5b26d3c2..be752db5abed 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -725,7 +725,7 @@ void adreno_dump_info(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int i;
 
-	printk("revision: %d (%d.%d.%d.%d)\n",
+	printk(KERN_DEBUG "revision: %d (%d.%d.%d.%d)\n",
 			adreno_gpu->info->revn, adreno_gpu->rev.core,
 			adreno_gpu->rev.major, adreno_gpu->rev.minor,
 			adreno_gpu->rev.patchid);
@@ -733,12 +733,12 @@ void adreno_dump_info(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
 
-		printk("rb %d: fence:    %d/%d\n", i,
+		printk(KERN_DEBUG "rb %d: fence:    %d/%d\n", i,
 			ring->memptrs->fence,
 			ring->seqno);
 
-		printk("rptr:     %d\n", get_rptr(adreno_gpu, ring));
-		printk("rb wptr:  %d\n", get_wptr(ring));
+		printk(KERN_DEBUG "rptr:     %d\n", get_rptr(adreno_gpu, ring));
+		printk(KERN_DEBUG "rb wptr:  %d\n", get_wptr(ring));
 	}
 }
 
@@ -752,7 +752,7 @@ void adreno_dump(struct msm_gpu *gpu)
 		return;
 
 	/* dump these out in a form that can be parsed by demsm: */
-	printk("IO:region %s 00000000 00020000\n", gpu->name);
+	printk(KERN_DEBUG "IO:region %s 00000000 00020000\n", gpu->name);
 	for (i = 0; adreno_gpu->registers[i] != ~0; i += 2) {
 		uint32_t start = adreno_gpu->registers[i];
 		uint32_t end   = adreno_gpu->registers[i+1];
@@ -760,7 +760,7 @@ void adreno_dump(struct msm_gpu *gpu)
 
 		for (addr = start; addr <= end; addr++) {
 			uint32_t val = gpu_read(gpu, addr);
-			printk("IO:R %08x %08x\n", addr<<2, val);
+			printk(KERN_DEBUG "IO:R %7x %08x\n", addr<<2, val);
 		}
 	}
 }
-- 
2.29.0

