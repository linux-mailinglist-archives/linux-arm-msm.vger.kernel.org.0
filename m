Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A0C2EFFF8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbhAINic (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:38:32 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:46079 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbhAINiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:38:22 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9C4703EEC2;
        Sat,  9 Jan 2021 14:37:39 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 4/9] drm/msm/dpu1: Allow specifying features and sblk in DSPP_BLK macro
Date:   Sat,  9 Jan 2021 14:37:31 +0100
Message-Id: <20210109133736.143469-5-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
References: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSPP_BLK macro was ad-hoc made for SC7180, but this is wrong
because not all of the DPU DSPP versions can use the same DSPP block
configuration, and not all of them have got the same features.

For this reason, add two more params to the DSPP_BLK macro, so that
it is possible to specify the feature mask and the sblk config for
each DSPP.

Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 253075091409..d1aebb5f48c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -454,16 +454,17 @@ static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
 		.len = 0x90, .version = 0x10000},
 };
 
-#define DSPP_BLK(_name, _id, _base) \
+#define DSPP_BLK(_name, _id, _base, _mask, _desc) \
 		{\
 		.name = _name, .id = _id, \
 		.base = _base, .len = 0x1800, \
-		.features = DSPP_SC7180_MASK, \
-		.sblk = &sc7180_dspp_sblk \
+		.features = _mask, \
+		.sblk = _desc \
 		}
 
 static const struct dpu_dspp_cfg sc7180_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000),
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sc7180_dspp_sblk),
 };
 
 /*************************************************************
-- 
2.29.2

