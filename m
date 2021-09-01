Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9C43FE151
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 19:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346649AbhIARot (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 13:44:49 -0400
Received: from relay03.th.seeweb.it ([5.144.164.164]:60345 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346451AbhIARot (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 13:44:49 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6F52420115;
        Wed,  1 Sep 2021 19:43:50 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, abhinavk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 2/2] drm/msm/dpu: Fix timeout issues on command mode panels
Date:   Wed,  1 Sep 2021 19:43:47 +0200
Message-Id: <20210901174347.1012129-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901174347.1012129-1-angelogioacchino.delregno@somainline.org>
References: <20210901174347.1012129-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In function dpu_encoder_phys_cmd_wait_for_commit_done we are always
checking if the relative CTL is started by waiting for an interrupt
to fire: it is fine to do that, but then sometimes we call this
function while the CTL is up and has never been put down, but that
interrupt gets raised only when the CTL gets a state change from
0 to 1 (disabled to enabled), so we're going to wait for something
that will never happen on its own.

Solving this while avoiding to restart the CTL is actually possible
and can be done by just checking if it is already up and running
when the wait_for_commit_done function is called: in this case, so,
if the CTL was already running, we can say that the commit is done
if the command transmission is complete (in other terms, if the
interface has been flushed).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index aa01698d6b25..b5b1b555ac4e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -682,6 +682,9 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
 
+	if (phys_enc->hw_ctl->ops.is_started)
+		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
+
 	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
 }
 
-- 
2.32.0

