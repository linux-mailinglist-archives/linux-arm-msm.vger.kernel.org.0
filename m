Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A97517B539
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2019 23:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387434AbfG3Vsv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jul 2019 17:48:51 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34511 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfG3Vsv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jul 2019 17:48:51 -0400
Received: by mail-pg1-f194.google.com with SMTP id n9so24514196pgc.1;
        Tue, 30 Jul 2019 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ElPlp+VRpfvHqwOymsphqHnB2ea8iEK4QxZsWnz9kGM=;
        b=ddkccz9dF/g2WpKWiXA9y5t9DwjI47nEvnGe+OmlHLimwzVNo/XEkXeZx+sXTwpZaS
         8OFDOvduTWzvh8VHtc3R/vJXwlJgxBYjEdsqVt6BT/pFnx8+4xwfTtrbSmfUZc3R6gC/
         iRIsmS61wBzt9diF8OtOKhW8QuZAKHPlGBiKqJV/f68YUzLTSX8ybXYWlG0legoWZdyR
         LHPeU+199A6j16MbSpEUCEPqazyTroRJn3+0xoRz6bX4Wi4dS+9dnlqFT2pW9u6IrOmn
         RyR8lKxIGYbmIwhMObn8wdYWVJ/DqFUj5KzhQhcMo+KvcZHEyeG7Qg4Q0izRewGv6yQo
         1p3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ElPlp+VRpfvHqwOymsphqHnB2ea8iEK4QxZsWnz9kGM=;
        b=Wom4FA1ZrHXV2oQxEpPkZQujk/VOF8V9CIYIg9o4IGqaPyQfqaudciq9UrCArHO+Tn
         pqfQRYpOe3baV53s4SpsLlgZlMTAQI4E4FeUmS4P50999eTUxNHPvReZY7o12991idNg
         BMVsYNu+8+L9bCvEPFcqeqV3IyhuQH4TklA5cW5Vvh46KgS4x3IE3wlTL0rdSFPLHCj7
         hI5ZAHATBSacpHOzz0j7ucExyfcBbyvY+pY1RIVFTbAaO8EsgP/CuI9ds5yj5zZTuJpT
         cnj81Yh0MNQjybfgNIilcwAt9Kd441aU5cqrbrYZE2YR1JZp7+EpKmop3yFPyvYCqpqk
         7XhA==
X-Gm-Message-State: APjAAAVS3Yt2XBZip/qfu90loMdhBW0ikRCwHDgfvN6Vjm3AGGgwkCHA
        h8WrJ6SL0p87rTPph7mT4pc=
X-Google-Smtp-Source: APXvYqx37O6WDVUjoOK86chq+3TypiJfoSPzXlU122ldm7wURtrmx4CX2Kp/O3dtRKVbPlRDSXEglA==
X-Received: by 2002:a63:904:: with SMTP id 4mr38008433pgj.19.1564523330494;
        Tue, 30 Jul 2019 14:48:50 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id l25sm81887158pff.143.2019.07.30.14.48.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 14:48:49 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: shake fist angrily at dma-mapping
Date:   Tue, 30 Jul 2019 14:46:28 -0700
Message-Id: <20190730214633.17820-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

So, using dma_sync_* for our cache needs works out w/ dma iommu ops, but
it falls appart with dma direct ops.  The problem is that, depending on
display generation, we can have either set of dma ops (mdp4 and dpu have
iommu wired to mdss node, which maps to toplevel drm device, but mdp5
has iommu wired up to the mdp sub-node within mdss).

Fixes this splat on mdp5 devices:

   Unable to handle kernel paging request at virtual address ffffffff80000000
   Mem abort info:
     ESR = 0x96000144
     Exception class = DABT (current EL), IL = 32 bits
     SET = 0, FnV = 0
     EA = 0, S1PTW = 0
   Data abort info:
     ISV = 0, ISS = 0x00000144
     CM = 1, WnR = 1
   swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000810e4000
   [ffffffff80000000] pgd=0000000000000000
   Internal error: Oops: 96000144 [#1] SMP
   Modules linked in: btqcomsmd btqca bluetooth cfg80211 ecdh_generic ecc rfkill libarc4 panel_simple msm wcnss_ctrl qrtr_smd drm_kms_helper venus_enc venus_dec videobuf2_dma_sg videobuf2_memops drm venus_core ipv6 qrtr qcom_wcnss_pil v4l2_mem2mem qcom_sysmon videobuf2_v4l2 qmi_helpers videobuf2_common crct10dif_ce mdt_loader qcom_common videodev qcom_glink_smem remoteproc bmc150_accel_i2c bmc150_magn_i2c bmc150_accel_core bmc150_magn snd_soc_lpass_apq8016 snd_soc_msm8916_analog mms114 mc nf_defrag_ipv6 snd_soc_lpass_cpu snd_soc_apq8016_sbc industrialio_triggered_buffer kfifo_buf snd_soc_lpass_platform snd_soc_msm8916_digital drm_panel_orientation_quirks
   CPU: 2 PID: 33 Comm: kworker/2:1 Not tainted 5.3.0-rc2 #1
   Hardware name: Samsung Galaxy A5U (EUR) (DT)
   Workqueue: events deferred_probe_work_func
   pstate: 80000005 (Nzcv daif -PAN -UAO)
   pc : __clean_dcache_area_poc+0x20/0x38
   lr : arch_sync_dma_for_device+0x28/0x30
   sp : ffff0000115736a0
   x29: ffff0000115736a0 x28: 0000000000000001
   x27: ffff800074830800 x26: ffff000011478000
   x25: 0000000000000000 x24: 0000000000000001
   x23: ffff000011478a98 x22: ffff800009fd1c10
   x21: 0000000000000001 x20: ffff800075ad0a00
   x19: 0000000000000000 x18: ffff0000112b2000
   x17: 0000000000000000 x16: 0000000000000000
   x15: 00000000fffffff0 x14: ffff000011455d70
   x13: 0000000000000000 x12: 0000000000000028
   x11: 0000000000000001 x10: ffff00001106c000
   x9 : ffff7e0001d6b380 x8 : 0000000000001000
   x7 : ffff7e0001d6b380 x6 : ffff7e0001d6b382
   x5 : 0000000000000000 x4 : 0000000000001000
   x3 : 000000000000003f x2 : 0000000000000040
   x1 : ffffffff80001000 x0 : ffffffff80000000
   Call trace:
    __clean_dcache_area_poc+0x20/0x38
    dma_direct_sync_sg_for_device+0xb8/0xe8
    get_pages+0x22c/0x250 [msm]
    msm_gem_get_and_pin_iova+0xdc/0x168 [msm]
    ...

Fixes the combination of two patches:

Fixes: 0036bc73ccbe ("drm/msm: stop abusing dma_map/unmap for cache")
Fixes: 449fa54d6815 ("dma-direct: correct the physical addr in dma_direct_sync_sg_for_cpu/device")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
I think it is time to revisit drm_cache support for arm64, but we need
something for v5.3 to keep things working.

armv7 support might be harder, but hopefully no one is changing dma-
mapping implementation much on armv7 and we can just limp along with
the current hack on 32b arm.

 drivers/gpu/drm/msm/msm_gem.c | 47 +++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c2114c748c2f..8cf6362e64bf 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -32,6 +32,46 @@ static bool use_pages(struct drm_gem_object *obj)
 	return !msm_obj->vram_node;
 }
 
+/*
+ * Cache sync.. this is a bit over-complicated, to fit dma-mapping
+ * API.  Really GPU cache is out of scope here (handled on cmdstream)
+ * and all we need to do is invalidate newly allocated pages before
+ * mapping to CPU as uncached/writecombine.
+ *
+ * On top of this, we have the added headache, that depending on
+ * display generation, the display's iommu may be wired up to either
+ * the toplevel drm device (mdss), or to the mdp sub-node, meaning
+ * that here we either have dma-direct or iommu ops.
+ *
+ * Let this be a cautionary tail of abstraction gone wrong.
+ */
+
+static void sync_for_device(struct msm_gem_object *msm_obj)
+{
+	struct device *dev = msm_obj->base.dev->dev;
+
+	if (get_dma_ops(dev)) {
+		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
+			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+	} else {
+		dma_map_sg(dev, msm_obj->sgt->sgl,
+			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+	}
+}
+
+static void sync_for_cpu(struct msm_gem_object *msm_obj)
+{
+	struct device *dev = msm_obj->base.dev->dev;
+
+	if (get_dma_ops(dev)) {
+		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
+			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+	} else {
+		dma_unmap_sg(dev, msm_obj->sgt->sgl,
+			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+	}
+}
+
 /* allocate pages from VRAM carveout, used when no IOMMU: */
 static struct page **get_pages_vram(struct drm_gem_object *obj, int npages)
 {
@@ -97,8 +137,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		 * because display controller, GPU, etc. are not coherent:
 		 */
 		if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
-			dma_sync_sg_for_device(dev->dev, msm_obj->sgt->sgl,
-					msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+			sync_for_device(msm_obj);
 	}
 
 	return msm_obj->pages;
@@ -127,9 +166,7 @@ static void put_pages(struct drm_gem_object *obj)
 			 * GPU, etc. are not coherent:
 			 */
 			if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
-				dma_sync_sg_for_cpu(obj->dev->dev, msm_obj->sgt->sgl,
-					     msm_obj->sgt->nents,
-					     DMA_BIDIRECTIONAL);
+				sync_for_cpu(msm_obj);
 
 			sg_free_table(msm_obj->sgt);
 			kfree(msm_obj->sgt);
-- 
2.21.0

