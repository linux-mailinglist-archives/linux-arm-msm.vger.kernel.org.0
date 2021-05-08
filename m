Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7628376EA0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 May 2021 04:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhEHC34 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 May 2021 22:29:56 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:17595 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhEHC3z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 22:29:55 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FcWQd11MGz16LLD;
        Sat,  8 May 2021 10:26:17 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 10:28:43 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] drm/msm: Fix error return code in msm_drm_init()
Date:   Sat, 8 May 2021 10:28:36 +0800
Message-ID: <20210508022836.1777-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix to return a negative error code from the error handling case instead
of 0, as done elsewhere in this function.

Fixes: 7f9743abaa79 ("drm/msm: validate display and event threads")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e1104d2454e2..ebd856dde1f1 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -523,6 +523,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		priv->event_thread[i].worker = kthread_create_worker(0,
 			"crtc_event:%d", priv->event_thread[i].crtc_id);
 		if (IS_ERR(priv->event_thread[i].worker)) {
+			ret = PTR_ERR(priv->event_thread[i].worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
 			goto err_msm_uninit;
 		}
-- 
2.25.1


