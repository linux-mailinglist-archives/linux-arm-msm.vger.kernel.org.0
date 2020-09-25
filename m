Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAEAE277EA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 05:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgIYDoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 23:44:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14280 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726738AbgIYDoY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 23:44:24 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 707EDE3898692EA7B039;
        Fri, 25 Sep 2020 11:44:18 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 25 Sep 2020 11:44:15 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <dhar@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
Subject: [PATCH] drm/msm: Add missing struct identifier
Date:   Fri, 25 Sep 2020 11:41:48 +0800
Message-ID: <1601005308-49706-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

fix warnings reported by make W=1
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:195: warning: cannot
understand function prototype: 'const struct dpu_intr_reg
dpu_intr_set[] = '
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:252: warning: cannot
understand function prototype: 'const struct dpu_irq_type
dpu_irq_map[] = '

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index d84a84f..38482b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -190,7 +190,7 @@ struct dpu_irq_type {
 };
 
 /**
- * List of DPU interrupt registers
+ * struct dpu_intr_reg -  List of DPU interrupt registers
  */
 static const struct dpu_intr_reg dpu_intr_set[] = {
 	{
@@ -246,8 +246,9 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 };
 
 /**
- * IRQ mapping table - use for lookup an irq_idx in this table that have
- *                     a matching interface type and instance index.
+ * struct dpu_irq_type - IRQ mapping table use for lookup an irq_idx in this
+ *			 table that have a matching interface type and
+ *			 instance index.
  */
 static const struct dpu_irq_type dpu_irq_map[] = {
 	/* BEGIN MAP_RANGE: 0-31, INTR */
-- 
2.7.4

