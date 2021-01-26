Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA03830347F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732628AbhAZFYj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:24:39 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:11589 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbhAZDr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 22:47:26 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DPt0m22fRzMMvX;
        Tue, 26 Jan 2021 11:45:12 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Tue, 26 Jan 2021 11:46:41 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/msm: fix NULL check before some freeing functions is not needed
Date:   Tue, 26 Jan 2021 11:46:25 +0800
Message-ID: <1611632785-9462-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

fixed the below warning:
./drivers/gpu/drm/msm/msm_gem.c:991:3-9: WARNING: NULL check before some
freeing functions is not needed.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 45e2312..8eb2c66 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -985,8 +985,7 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 		/* Don't drop the pages for imported dmabuf, as they are not
 		 * ours, just free the array we allocated:
 		 */
-		if (msm_obj->pages)
-			kvfree(msm_obj->pages);
+		kvfree(msm_obj->pages);
 
 		/* dma_buf_detach() grabs resv lock, so we need to unlock
 		 * prior to drm_prime_gem_destroy
-- 
2.7.4

