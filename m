Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB882EFFFD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbhAINig (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbhAINig (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:38:36 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1FEC0617A2
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Jan 2021 05:37:40 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B534D3EEBA;
        Sat,  9 Jan 2021 14:37:38 +0100 (CET)
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
Subject: [PATCH 1/9] drm/msm/dpu: Fix VBIF_XINL_QOS_LVL_REMAP_000 register offset
Date:   Sat,  9 Jan 2021 14:37:28 +0100
Message-Id: <20210109133736.143469-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
References: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On DPUs prior to version 4 the VBIF_XINL_QOS_LVL_REMAP_000 register
is at 0x570 offset from vbif base instead of 0x590, due to the
VBIF_XINL_QOS_RP_REMAP_000 having less instances (less possible XINs).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index cf867f3f7c36..b757054e1c23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -30,7 +30,7 @@
 #define VBIF_XIN_HALT_CTRL0		0x0200
 #define VBIF_XIN_HALT_CTRL1		0x0204
 #define VBIF_XINL_QOS_RP_REMAP_000	0x0550
-#define VBIF_XINL_QOS_LVL_REMAP_000	0x0590
+#define VBIF_XINL_QOS_LVL_REMAP_000(v)	(v < DPU_HW_VER_400 ? 0x570 : 0x0590)
 
 static void dpu_hw_clear_errors(struct dpu_hw_vbif *vbif,
 		u32 *pnd_errors, u32 *src_errors)
@@ -156,18 +156,19 @@ static void dpu_hw_set_qos_remap(struct dpu_hw_vbif *vbif,
 		u32 xin_id, u32 level, u32 remap_level)
 {
 	struct dpu_hw_blk_reg_map *c;
-	u32 reg_val, reg_val_lvl, mask, reg_high, reg_shift;
+	u32 reg_lvl, reg_val, reg_val_lvl, mask, reg_high, reg_shift;
 
 	if (!vbif)
 		return;
 
 	c = &vbif->hw;
 
+	reg_lvl = VBIF_XINL_QOS_LVL_REMAP_000(c->hwversion);
 	reg_high = ((xin_id & 0x8) >> 3) * 4 + (level * 8);
 	reg_shift = (xin_id & 0x7) * 4;
 
 	reg_val = DPU_REG_READ(c, VBIF_XINL_QOS_RP_REMAP_000 + reg_high);
-	reg_val_lvl = DPU_REG_READ(c, VBIF_XINL_QOS_LVL_REMAP_000 + reg_high);
+	reg_val_lvl = DPU_REG_READ(c, reg_lvl + reg_high);
 
 	mask = 0x7 << reg_shift;
 
@@ -178,7 +179,7 @@ static void dpu_hw_set_qos_remap(struct dpu_hw_vbif *vbif,
 	reg_val_lvl |= (remap_level << reg_shift) & mask;
 
 	DPU_REG_WRITE(c, VBIF_XINL_QOS_RP_REMAP_000 + reg_high, reg_val);
-	DPU_REG_WRITE(c, VBIF_XINL_QOS_LVL_REMAP_000 + reg_high, reg_val_lvl);
+	DPU_REG_WRITE(c, reg_lvl + reg_high, reg_val_lvl);
 }
 
 static void dpu_hw_set_write_gather_en(struct dpu_hw_vbif *vbif, u32 xin_id)
-- 
2.29.2

