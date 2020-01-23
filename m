Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7B481460F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 04:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgAWDdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 22:33:36 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:51780 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726061AbgAWDdg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 22:33:36 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E731D1098EFDB35A05AB;
        Thu, 23 Jan 2020 11:33:34 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 23 Jan 2020
 11:33:25 +0800
From:   Zheng Bin <zhengbin13@huawei.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 2/4] drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder_phys_vid.c
Date:   Thu, 23 Jan 2020 11:40:41 +0800
Message-ID: <1579750843-5315-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579750843-5315-1-git-send-email-zhengbin13@huawei.com>
References: <1579750843-5315-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes coccicheck warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c:242:48-49: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c:562:25-26: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c:562:48-49: WARNING comparing pointer to 0

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index c71c18d..b5a4905 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -239,7 +239,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	struct dpu_hw_intf_cfg intf_cfg = { 0 };

 	if (!phys_enc->hw_ctl->ops.setup_intf_cfg) {
-		DPU_ERROR("invalid encoder %d\n", phys_enc != 0);
+		DPU_ERROR("invalid encoder %d\n", phys_enc != NULL);
 		return;
 	}

@@ -559,7 +559,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)

 	if (!phys_enc->hw_intf) {
 		DPU_ERROR("invalid hw_intf %d hw_ctl %d\n",
-				phys_enc->hw_intf != 0, phys_enc->hw_ctl != 0);
+				phys_enc->hw_intf != NULL, phys_enc->hw_ctl != NULL);
 		return;
 	}

--
2.7.4

