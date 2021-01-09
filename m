Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7657C2EFFF3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbhAINiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:38:22 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:41829 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbhAINiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:38:22 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 369E23EF16;
        Sat,  9 Jan 2021 14:37:40 +0100 (CET)
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
Subject: [PATCH 6/9] drm/msm/dpu: Correctly configure vsync tearcheck for command mode
Date:   Sat,  9 Jan 2021 14:37:33 +0100
Message-Id: <20210109133736.143469-7-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
References: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When configuring the tearcheck, the parameters for the engine were
being set mostly as they should've been, but then it wasn't getting
configured to get the vsync indication from the TE GPIO input
because it was assumed that autorefresh could be enabled:
since a previous commit makes sure to disable the autorefresh bit
when committing to the cmd engine, it is now safe to just enable
the vsync pin input at tearcheck setup time (instead of erroneously
never enabling it).

Also, set the right sync_cfg_height to enable the DPU auto-generated
TE signal in order to avoid stalls in the event that we miss one
external TE signal: this will still trigger recovery mechanisms in
case the display is really unreachable.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index a367b093c888..c5cf59b5bd41 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -372,15 +372,12 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	tc_cfg.vsync_count = vsync_hz /
 				(mode->vtotal * drm_mode_vrefresh(mode));
 
-	/* enable external TE after kickoff to avoid premature autorefresh */
-	tc_cfg.hw_vsync_mode = 0;
-
 	/*
-	 * By setting sync_cfg_height to near max register value, we essentially
-	 * disable dpu hw generated TE signal, since hw TE will arrive first.
-	 * Only caveat is if due to error, we hit wrap-around.
+	 * Set the sync_cfg_height to twice vtotal so that if we lose a
+	 * TE event coming from the display TE pin we won't stall immediately
 	 */
-	tc_cfg.sync_cfg_height = 0xFFF0;
+	tc_cfg.hw_vsync_mode = 1;
+	tc_cfg.sync_cfg_height = mode->vtotal * 2;
 	tc_cfg.vsync_init_val = mode->vdisplay;
 	tc_cfg.sync_threshold_start = DEFAULT_TEARCHECK_SYNC_THRESH_START;
 	tc_cfg.sync_threshold_continue = DEFAULT_TEARCHECK_SYNC_THRESH_CONTINUE;
-- 
2.29.2

