Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7213BBD94
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 15:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhGENmz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 09:42:55 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:6058 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbhGENmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 09:42:55 -0400
Received: from dggeme754-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GJRWF0ZFNzXpVT;
        Mon,  5 Jul 2021 21:34:49 +0800 (CST)
Received: from localhost.localdomain (10.175.103.91) by
 dggeme754-chm.china.huawei.com (10.3.19.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 5 Jul 2021 21:40:14 +0800
From:   Wei Li <liwei391@huawei.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Archit Taneja <architt@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <guohanjun@huawei.com>
Subject: [PATCH RESEND] drm/msm: Fix error return code in msm_drm_init()
Date:   Mon, 5 Jul 2021 21:43:02 +0800
Message-ID: <20210705134302.315813-1-liwei391@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggeme754-chm.china.huawei.com (10.3.19.100)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When it fail to create crtc_event kthread, it just jump to err_msm_uninit,
while the 'ret' is not updated. So assign the return code before that.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Li <liwei391@huawei.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index fe7d17cd35ec..787522f92e63 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -524,6 +524,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 			"crtc_event:%d", priv->event_thread[i].crtc_id);
 		if (IS_ERR(priv->event_thread[i].worker)) {
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
+			ret = PTR_ERR(priv->event_thread[i].worker);
 			goto err_msm_uninit;
 		}
 
-- 
2.25.1

