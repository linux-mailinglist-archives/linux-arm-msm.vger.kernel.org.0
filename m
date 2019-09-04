Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5594A8D98
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731478AbfIDRTs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 13:19:48 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40786 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731466AbfIDRTs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 13:19:48 -0400
Received: by mail-pf1-f194.google.com with SMTP id x127so967771pfb.7;
        Wed, 04 Sep 2019 10:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=09xouYfGtM7P/+Szurweb+Wo4prOf3fUjEfXXhSPvME=;
        b=bxDni1+RWIcCrmcmzKZQBT7cquE1szM+Rm10Syh+xw44EBp11UXsk0Zc5eo59dnbyr
         Ox9VL0O3wgC9uBUAlNkC9RBa/Sjk753Igi3sCtiB4BKPQv8Mg1v0IZktFKSbMVg1scyA
         FAZUOYfe11oasXe+cMmbFHMxcerzZvp0R65AVCvE8DtaZitzI+9Zpoi2hJSFsjP3+JhO
         BXV9F+Qwa0ha9xmxnIPvSBF9Dxovp7Jrrc7V7JRWUe9xIY8+I5j9VnQw8EYBJLpVlWxn
         hU83BGp2e75k5uOvyQ1/nbcDPdpqx5tGktn9Usl7STni53tGJYSGs3knulQDQ+l57PPo
         zofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=09xouYfGtM7P/+Szurweb+Wo4prOf3fUjEfXXhSPvME=;
        b=QbFEJMiH74czil1seJ5411+jyKScOCwV+kdrfZl4G/CNkslwrXxDg1Hkkc7hLsjChP
         H9UOzjmZX+Xs2XqwL/QDghazm13TE1sqjc1To4npDxvSzJIRaSQ97PgWM3rrex8OFv7E
         ypj/ndfMm97adf3MEJ0snKX67gJGC+LS3wJ2aXTWLAaIBW+S2Jc8LZqRjZqgPSeij7uN
         z1tW7RnI2midcydySO4H0v9QotF8wh2qhvTIiJLdj2gDAZ9aSpLno8DqsdnWuGmyEKGO
         PoS49dMu9iXce2Sx9ukSz4Lr/ipfh0BEco62l29SBH99+YtwvD9qC7xUcrfWLT5v9lfk
         A+Rw==
X-Gm-Message-State: APjAAAWHeFQRPA5mjiSTGUK2fSro2q5qlxvDM3je3Vn52vAHFSne5Ugt
        QpFhWn2tIhPpvcxTC3nHJI4=
X-Google-Smtp-Source: APXvYqzYc/xI1nMtMO8Q1TmWhNupziMCqcsew+YiGdEK3/Q/34lirq+6VDV81HR7x7yQFYWo9F0bUw==
X-Received: by 2002:aa7:96c1:: with SMTP id h1mr9951490pfq.111.1567617587533;
        Wed, 04 Sep 2019 10:19:47 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id z23sm1407891pfn.45.2019.09.04.10.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 10:19:46 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Use the correct dma_sync calls harder
Date:   Wed,  4 Sep 2019 10:17:23 -0700
Message-Id: <20190904171723.2956-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Looks like the dma_sync calls don't do what we want on armv7 either.
Fixes:

  Unable to handle kernel paging request at virtual address 50001000
  pgd = (ptrval)
  [50001000] *pgd=00000000
  Internal error: Oops: 805 [#1] SMP ARM
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.3.0-rc6-00271-g9f159ae07f07 #4
  Hardware name: Freescale i.MX53 (Device Tree Support)
  PC is at v7_dma_clean_range+0x20/0x38
  LR is at __dma_page_cpu_to_dev+0x28/0x90
  pc : [<c011c76c>]    lr : [<c01181c4>]    psr: 20000013
  sp : d80b5a88  ip : de96c000  fp : d840ce6c
  r10: 00000000  r9 : 00000001  r8 : d843e010
  r7 : 00000000  r6 : 00008000  r5 : ddb6c000  r4 : 00000000
  r3 : 0000003f  r2 : 00000040  r1 : 50008000  r0 : 50001000
  Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
  Control: 10c5387d  Table: 70004019  DAC: 00000051
  Process swapper/0 (pid: 1, stack limit = 0x(ptrval))

Signed-off-by: Rob Clark <robdclark@chromium.org>
Fixes: 3de433c5b38a ("drm/msm: Use the correct dma_sync calls in msm_gem")
Tested-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 7263f4373f07..5a6a79fbc9d6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -52,7 +52,7 @@ static void sync_for_device(struct msm_gem_object *msm_obj)
 {
 	struct device *dev = msm_obj->base.dev->dev;
 
-	if (get_dma_ops(dev)) {
+	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
 		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
 			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
 	} else {
@@ -65,7 +65,7 @@ static void sync_for_cpu(struct msm_gem_object *msm_obj)
 {
 	struct device *dev = msm_obj->base.dev->dev;
 
-	if (get_dma_ops(dev)) {
+	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
 		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
 			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
 	} else {
-- 
2.21.0

