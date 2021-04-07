Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F3A3566B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 10:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349681AbhDGIYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 04:24:25 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16809 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235611AbhDGIYC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 04:24:02 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FFcn01nJPz7tPj;
        Wed,  7 Apr 2021 16:21:40 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 16:23:42 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] drm/msm/dp: remove unused local variable 'hpd'
Date:   Wed, 7 Apr 2021 16:23:15 +0800
Message-ID: <20210407082315.2703-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning:

drivers/gpu/drm/msm/dp/dp_display.c: In function ‘dp_display_usbpd_attention_cb’:
drivers/gpu/drm/msm/dp/dp_display.c:496:19: warning: variable ‘hpd’ set but not used [-Wunused-but-set-variable]

Fixes: c58eb1b54fee ("drm/msm/dp: fix connect/disconnect handled at irq_hpd")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5a39da6e1eaf277..31bf2a40a9eb2c9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -493,7 +493,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 	int rc = 0;
 	u32 sink_request;
 	struct dp_display_private *dp;
-	struct dp_usbpd *hpd;
 
 	if (!dev) {
 		DRM_ERROR("invalid dev\n");
@@ -507,8 +506,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		return -ENODEV;
 	}
 
-	hpd = dp->usbpd;
-
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
 	if (!rc) {
-- 
1.8.3


