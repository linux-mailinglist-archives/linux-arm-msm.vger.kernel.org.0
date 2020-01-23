Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8885C1460F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 04:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgAWDdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 22:33:36 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:47402 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727022AbgAWDdg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 22:33:36 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 25BDC87CB5B1722926E8;
        Thu, 23 Jan 2020 11:33:35 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 23 Jan 2020
 11:33:25 +0800
From:   Zheng Bin <zhengbin13@huawei.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 1/4] drm/msm/dpu: fix comparing pointer to 0 in dpu_encoder_phys_cmd.c
Date:   Thu, 23 Jan 2020 11:40:40 +0800
Message-ID: <1579750843-5315-2-git-send-email-zhengbin13@huawei.com>
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

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:414:52-53: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:443:56-57: WARNING comparing pointer to 0

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 39e1e28..8493d68 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -411,7 +411,7 @@ static void _dpu_encoder_phys_cmd_pingpong_config(
 		to_dpu_encoder_phys_cmd(phys_enc);

 	if (!phys_enc->hw_pp || !phys_enc->hw_ctl->ops.setup_intf_cfg) {
-		DPU_ERROR("invalid arg(s), enc %d\n", phys_enc != 0);
+		DPU_ERROR("invalid arg(s), enc %d\n", phys_enc != NULL);
 		return;
 	}

@@ -440,7 +440,7 @@ static void dpu_encoder_phys_cmd_enable_helper(
 	u32 flush_mask = 0;

 	if (!phys_enc->hw_pp) {
-		DPU_ERROR("invalid arg(s), encoder %d\n", phys_enc != 0);
+		DPU_ERROR("invalid arg(s), encoder %d\n", phys_enc != NULL);
 		return;
 	}

--
2.7.4

