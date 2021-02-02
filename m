Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFBA130BDFB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 13:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhBBMQY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 07:16:24 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:12383 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhBBMP2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 07:15:28 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DVNxz6TbXz7YvC;
        Tue,  2 Feb 2021 20:13:27 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Feb 2021 20:14:39 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/msm/adreno: fix debugfs_simple_attr.cocci warnings
Date:   Tue, 2 Feb 2021 20:14:19 +0800
Message-ID: <1612268059-10507-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

fixed the below warning:
./drivers/gpu/drm/msm/adreno/a5xx_debugfs.c:141:0-23: WARNING: reset_fops
should be defined with DEFINE_DEBUGFS_ATTRIBUTE.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index fc2c905..8db3e9d 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -138,7 +138,7 @@ reset_set(void *data, u64 val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
 
 
 void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
-- 
2.7.4

