Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083C42102A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 06:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725271AbgGAELn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 00:11:43 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:37092 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725263AbgGAELn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 00:11:43 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0U1ElaLe_1593576699;
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0U1ElaLe_1593576699)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 01 Jul 2020 12:11:40 +0800
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, ddavenport@chromium.org, zhengbin13@huawei.com,
        sam@ravnborg.org, kalyan_t@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tianjia.zhang@linux.alibaba.com
Subject: [PATCH] drm/msm/dpu: fix wrong return value in dpu_encoder_init()
Date:   Wed,  1 Jul 2020 12:11:39 +0800
Message-Id: <20200701041139.92191-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A positive value ENOMEM is returned here. I thinr this is a typo error.
It is necessary to return a negative error value.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 63976dcd2ac8..119c89659e71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2183,7 +2183,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 
 	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
 	if (!dpu_enc)
-		return ERR_PTR(ENOMEM);
+		return ERR_PTR(-ENOMEM);
 
 	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
 			drm_enc_mode, NULL);
-- 
2.17.1

