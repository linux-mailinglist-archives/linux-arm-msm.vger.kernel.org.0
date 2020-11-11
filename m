Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC9EF2AEAA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 08:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgKKH5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 02:57:34 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8062 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgKKH5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 02:57:33 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWHBj69K7zLxGD;
        Wed, 11 Nov 2020 15:57:17 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Wed, 11 Nov 2020 15:57:25 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>
CC:     <khsieh@codeaurora.org>, <tanmay@codeaurora.org>,
        <abhinavk@codeaurora.org>, <chandanu@codeaurora.org>,
        <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/dp: remove duplicate include statement
Date:   Wed, 11 Nov 2020 15:57:56 +0800
Message-ID: <1605081476-27098-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

linux/rational.h is included more than once, Remove the one that isn't
necessary.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b15b4ce..105fa65 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -5,7 +5,6 @@
 
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
 
-#include <linux/rational.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/phy/phy.h>
-- 
2.7.4

