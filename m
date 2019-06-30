Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E19D05AFCE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 14:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfF3Mrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 08:47:46 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34047 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfF3Mrq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 08:47:46 -0400
Received: by mail-qk1-f196.google.com with SMTP id t8so8899619qkt.1;
        Sun, 30 Jun 2019 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t3NBRelcVNRRw+RFPngDYC9BWfE+P0zgYLat4rYCV1Q=;
        b=p+x7qPUHCxUv2jRoxomZbQsK2Iigsp9wix/13yErFTnhyS6qq5QjWt+mOLP2OfEpXq
         w302DafhUYJ4TYKN9yctny6hYLZgUjbdBC5IrdfE2jrP5bnP7oDuoOynwoCplHkWGNDr
         kY9eiSxtMyGO/INb/4uddNWepnoRhVOpb85nHVid/fPe8QfQBz9wVYldoExXDTAWjum+
         xbJbqAeoOFRyw1e37Aw4PJ7OgJy2TlSHNnIeglb3RwLZvU/SeSUliDsMHM78zzShC94J
         7UbZBWxunzSpK3RtSy0ei5INFdm5MSyRzch3h8k+86nK9C46IUhn15pWhISA2g4GxX7t
         NRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t3NBRelcVNRRw+RFPngDYC9BWfE+P0zgYLat4rYCV1Q=;
        b=rO0ZzSkkVK9mkLVcKfZNaA+W6JZK+EZDzhjYRPectfzKn9XcrIP8ApM8Mxh5T2TEjo
         cyFg1gRao4XUQuW78TYSTj1TCVMMoH41o48o4UoQp4iAJ8R04BO+bpd5hsz9z7hn0Lfm
         7qrvlgRuVKsuYxm9JZdj8/1o8s+yrybR1t0JjGGwQbqffCMBCskHwiYDNq8pR5juRBSo
         YzIei/8cyickYVFzm2E4jvxCAie1HozdyE9klLAoAcHBch2V5fNOe5rqWi8KOPRn8ykJ
         9wCkKh04FooGKFx5HVXbR01SWTfdaixBFwcAmwGfTtOYaD8cRwabWFw45plrSqeCKkn3
         q1qg==
X-Gm-Message-State: APjAAAVaW4sWUsxfBFE5D5M8qaJQ4DDlTP8zGP4goKtZ+Jfrln16wkIV
        20u40Z3i5lVzz6wBWhV19Us=
X-Google-Smtp-Source: APXvYqyIyUYukkDxRx7t79cs57tG26rWbuzJPdYsR1pGolt/m1xirpeDO6OapATzvjaB5ZgubI9puw==
X-Received: by 2002:a37:a247:: with SMTP id l68mr15234079qke.89.1561898865197;
        Sun, 30 Jun 2019 05:47:45 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id d17sm3388167qtp.84.2019.06.30.05.47.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 05:47:44 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: stop abusing dma_map/unmap for cache
Date:   Sun, 30 Jun 2019 05:47:22 -0700
Message-Id: <20190630124735.27786-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Recently splats like this started showing up:

   WARNING: CPU: 4 PID: 251 at drivers/iommu/dma-iommu.c:451 __iommu_dma_unmap+0xb8/0xc0
   Modules linked in: ath10k_snoc ath10k_core fuse msm ath mac80211 uvcvideo cfg80211 videobuf2_vmalloc videobuf2_memops vide
   CPU: 4 PID: 251 Comm: kworker/u16:4 Tainted: G        W         5.2.0-rc5-next-20190619+ #2317
   Hardware name: LENOVO 81JL/LNVNB161216, BIOS 9UCN23WW(V1.06) 10/25/2018
   Workqueue: msm msm_gem_free_work [msm]
   pstate: 80c00005 (Nzcv daif +PAN +UAO)
   pc : __iommu_dma_unmap+0xb8/0xc0
   lr : __iommu_dma_unmap+0x54/0xc0
   sp : ffff0000119abce0
   x29: ffff0000119abce0 x28: 0000000000000000
   x27: ffff8001f9946648 x26: ffff8001ec271068
   x25: 0000000000000000 x24: ffff8001ea3580a8
   x23: ffff8001f95ba010 x22: ffff80018e83ba88
   x21: ffff8001e548f000 x20: fffffffffffff000
   x19: 0000000000001000 x18: 00000000c00001fe
   x17: 0000000000000000 x16: 0000000000000000
   x15: ffff000015b70068 x14: 0000000000000005
   x13: 0003142cc1be1768 x12: 0000000000000001
   x11: ffff8001f6de9100 x10: 0000000000000009
   x9 : ffff000015b78000 x8 : 0000000000000000
   x7 : 0000000000000001 x6 : fffffffffffff000
   x5 : 0000000000000fff x4 : ffff00001065dbc8
   x3 : 000000000000000d x2 : 0000000000001000
   x1 : fffffffffffff000 x0 : 0000000000000000
   Call trace:
    __iommu_dma_unmap+0xb8/0xc0
    iommu_dma_unmap_sg+0x98/0xb8
    put_pages+0x5c/0xf0 [msm]
    msm_gem_free_work+0x10c/0x150 [msm]
    process_one_work+0x1e0/0x330
    worker_thread+0x40/0x438
    kthread+0x12c/0x130
    ret_from_fork+0x10/0x18
   ---[ end trace afc0dc5ab81a06bf ]---

Not quite sure what triggered that, but we really shouldn't be abusing
dma_{map,unmap}_sg() for cache maint.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d31d9f927887..3b84cbdcafa3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -108,7 +108,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		 * because display controller, GPU, etc. are not coherent:
 		 */
 		if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
-			dma_map_sg(dev->dev, msm_obj->sgt->sgl,
+			dma_sync_sg_for_device(dev->dev, msm_obj->sgt->sgl,
 					msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
 	}
 
@@ -138,7 +138,7 @@ static void put_pages(struct drm_gem_object *obj)
 			 * GPU, etc. are not coherent:
 			 */
 			if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
-				dma_unmap_sg(obj->dev->dev, msm_obj->sgt->sgl,
+				dma_sync_sg_for_cpu(obj->dev->dev, msm_obj->sgt->sgl,
 					     msm_obj->sgt->nents,
 					     DMA_BIDIRECTIONAL);
 
-- 
2.20.1

