Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A986292252
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 08:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgJSGDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 02:03:46 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:47814 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725306AbgJSGDp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 02:03:45 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 7427091F64E8CB318596;
        Mon, 19 Oct 2020 14:03:41 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 19 Oct 2020 14:03:37 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm: Remove redundant null check
Date:   Mon, 19 Oct 2020 14:04:22 +0800
Message-ID: <1603087462-37505-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

clk_prepare_enable() and clk_disable_unprepare() will check
NULL clock parameter, so It is not necessary to add additional checks.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 57ddc94..25bc654 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -175,15 +175,12 @@ static int disable_clk(struct msm_gpu *gpu)
 
 static int enable_axi(struct msm_gpu *gpu)
 {
-	if (gpu->ebi1_clk)
-		clk_prepare_enable(gpu->ebi1_clk);
-	return 0;
+	return clk_prepare_enable(gpu->ebi1_clk);
 }
 
 static int disable_axi(struct msm_gpu *gpu)
 {
-	if (gpu->ebi1_clk)
-		clk_disable_unprepare(gpu->ebi1_clk);
+	clk_disable_unprepare(gpu->ebi1_clk);
 	return 0;
 }
 
-- 
2.7.4

