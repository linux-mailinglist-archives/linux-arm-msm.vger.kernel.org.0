Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8029715F571
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 19:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389238AbgBNShD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 13:37:03 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:40165 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388730AbgBNShD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 13:37:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581705422; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Lve/8NkQ1+pW/USqTTKmFAidSUSOjj1HUCuP/rW4dNg=; b=lTR3ggZi6xgmsF799KuhAS23244e7VGtiqAAJk8ghfAy0555i/+mznNO3TWL6iJdvD4vuNg3
 yqeC+txohSiUMMggroDdy0IsKzHjtWob6Wol3FtgCkDx/OGlcxLkc/7LWYDXqbH1JjXiPF5I
 3WHv7ZT+T3CsgJUvuZ6fFkMu3co=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e46e8c6.7faad7e4a490-smtp-out-n01;
 Fri, 14 Feb 2020 18:36:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00FA9C4479F; Fri, 14 Feb 2020 18:36:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D597FC4479C;
        Fri, 14 Feb 2020 18:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D597FC4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
        Sean Paul <sean@poorly.run>, Wen Yang <wen.yang99@zte.com.cn>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        freedreno@lists.freedesktop.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm/a5xx: Always set an OPP supported hardware value
Date:   Fri, 14 Feb 2020 11:36:44 -0700
Message-Id: <1581705404-5124-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the opp table specifies opp-supported-hw as a property but the driver
has not set a supported hardware value the OPP subsystem will reject
all the table entries.

Set a "default" value that will match the default table entries but not
conflict with any possible real bin values. Also fix a small memory leak
and free the buffer allocated by nvmem_cell_read().

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 7d9e63e..724024a 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1446,18 +1446,31 @@ static const struct adreno_gpu_funcs funcs = {
 static void check_speed_bin(struct device *dev)
 {
 	struct nvmem_cell *cell;
-	u32 bin, val;
+	u32 val;
+
+	/*
+	 * If the OPP table specifies a opp-supported-hw property then we have
+	 * to set something with dev_pm_opp_set_supported_hw() or the table
+	 * doesn't get populated so pick an arbitrary value that should
+	 * ensure the default frequencies are selected but not conflict with any
+	 * actual bins
+	 */
+	val = 0x80;
 
 	cell = nvmem_cell_get(dev, "speed_bin");
 
-	/* If a nvmem cell isn't defined, nothing to do */
-	if (IS_ERR(cell))
-		return;
+	if (!IS_ERR(cell)) {
+		void *buf = nvmem_cell_read(cell, NULL);
+
+		if (!IS_ERR(buf)) {
+			u8 bin = *((u8 *) buf);
 
-	bin = *((u32 *) nvmem_cell_read(cell, NULL));
-	nvmem_cell_put(cell);
+			val = (1 << bin);
+			kfree(buf);
+		}
 
-	val = (1 << bin);
+		nvmem_cell_put(cell);
+	}
 
 	dev_pm_opp_set_supported_hw(dev, &val, 1);
 }
-- 
2.7.4
