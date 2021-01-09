Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322152F000D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbhAINls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:41:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbhAINlo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:41:44 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D7CC061786
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Jan 2021 05:40:49 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 74CEC3F0A3;
        Sat,  9 Jan 2021 14:40:47 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run, jcrouse@codeaurora.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH] drm/msm/a5xx: Allow all patchid for A540 chip
Date:   Sat,  9 Jan 2021 14:40:44 +0100
Message-Id: <20210109134044.144458-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On at least MSM8998 it's possible to find Adreno 540.0 and 540.1
but I have never found any 540.2. In any case, the patchids 0-1
for A540 are completely supported by this driver and there is no
reason to disallow probing them (as they also share the same
firmware names).

Besides that, the patchid number is also used in the a5xx_power.c
function a540_lm_setup to disable the battery current limiter,
which makes faking the Adreno patchid to .2 (which would anyway
be sad) useless and even producing breakages.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 76a89a8175f8..133e3c15a1b7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -216,7 +216,7 @@ static const struct adreno_info gpulist[] = {
 		.init = a5xx_gpu_init,
 		.zapfw = "a530_zap.mdt",
 	}, {
-		.rev = ADRENO_REV(5, 4, 0, 2),
+		.rev = ADRENO_REV(5, 4, 0, ANY_ID),
 		.revn = 540,
 		.name = "A540",
 		.fw = {
-- 
2.29.2

