Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BE627DE9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 04:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729555AbgI3CyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 22:54:03 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14732 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729446AbgI3CyC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 22:54:02 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A392B49A23CF5EED838F;
        Wed, 30 Sep 2020 10:54:00 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 30 Sep 2020 10:53:51 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <jeffrey.l.hugo@gmail.com>, <sam@ravnborg.org>,
        <rnayak@codeaurora.org>, <zhengbin13@huawei.com>,
        <harigovi@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
Subject: [PATCH] drm/msm/dsi: Replace spin_lock_irqsave by spin_lock in hard IRQ
Date:   Wed, 30 Sep 2020 10:51:20 +0800
Message-ID: <1601434280-22229-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is redundant to do irqsave and irqrestore in hardIRQ context.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b17ac6c..b2fb5c3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1555,15 +1555,14 @@ static irqreturn_t dsi_host_irq(int irq, void *ptr)
 {
 	struct msm_dsi_host *msm_host = ptr;
 	u32 isr;
-	unsigned long flags;
 
 	if (!msm_host->ctrl_base)
 		return IRQ_HANDLED;
 
-	spin_lock_irqsave(&msm_host->intr_lock, flags);
+	spin_lock(&msm_host->intr_lock);
 	isr = dsi_read(msm_host, REG_DSI_INTR_CTRL);
 	dsi_write(msm_host, REG_DSI_INTR_CTRL, isr);
-	spin_unlock_irqrestore(&msm_host->intr_lock, flags);
+	spin_unlock(&msm_host->intr_lock);
 
 	DBG("isr=0x%x, id=%d", isr, msm_host->id);
 
-- 
2.7.4

