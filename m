Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE84223E25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 16:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgGQOhD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 10:37:03 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11394 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726198AbgGQOhC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 10:37:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594996621; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TyKyzR05tZRTaaXsH6YWC6xsJl+USZ1JBrWVHA4S8uY=; b=WyxScw+rVxFLhLZ/MVYcfxuh+SctO4bWFcgTzEcGPIrYEnQlYwY2buHtXqBR/KaRZYd5F3j9
 fbaYOdpTr05y0rPh+cJi6OaeX9GV0tgdAGIVclDoG/a4vjOLSr3mNEX3KLjfwxMRe6VfCYQx
 NYXH1NqbAScRHVqkzdNQ6Czt0YY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-west-2.postgun.com with SMTP id
 5f11b777512812c070429a53 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Jul 2020 14:36:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 42F4EC43391; Fri, 17 Jul 2020 14:36:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57AD6C433C6;
        Fri, 17 Jul 2020 14:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57AD6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, robdclark@gmail.com, dianders@chromium.org
Subject: [PATCH v2] drm: msm: a6xx: fix gpu failure after system resume
Date:   Fri, 17 Jul 2020 20:04:18 +0530
Message-Id: <1594996458-15529-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On targets where GMU is available, GMU takes over the ownership of GX GDSC
during its initialization. So, move the refcount-get on GX PD before we
initialize the GMU. This ensures that nobody can collapse the GX GDSC
once GMU owns the GX GDSC. This patch fixes some GMU OOB errors seen
during GPU wake up during a system resume.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
Reported-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes from v1:
- Reworded the commit text
- Added Reported-by & Tested-by tags

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 21e77d6..1d33020 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -854,10 +854,19 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Turn on the resources */
 	pm_runtime_get_sync(gmu->dev);
 
+	/*
+	 * "enable" the GX power domain which won't actually do anything but it
+	 * will make sure that the refcounting is correct in case we need to
+	 * bring down the GX after a GMU failure
+	 */
+	if (!IS_ERR_OR_NULL(gmu->gxpd))
+		pm_runtime_get_sync(gmu->gxpd);
+
 	/* Use a known rate to bring up the GMU */
 	clk_set_rate(gmu->core_clk, 200000000);
 	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
 	if (ret) {
+		pm_runtime_put(gmu->gxpd);
 		pm_runtime_put(gmu->dev);
 		return ret;
 	}
@@ -903,19 +912,12 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	else
 		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
 
-	/*
-	 * "enable" the GX power domain which won't actually do anything but it
-	 * will make sure that the refcounting is correct in case we need to
-	 * bring down the GX after a GMU failure
-	 */
-	if (!IS_ERR_OR_NULL(gmu->gxpd))
-		pm_runtime_get(gmu->gxpd);
-
 out:
 	/* On failure, shut down the GMU to leave it in a good state */
 	if (ret) {
 		disable_irq(gmu->gmu_irq);
 		a6xx_rpmh_stop(gmu);
+		pm_runtime_put(gmu->gxpd);
 		pm_runtime_put(gmu->dev);
 	}
 
-- 
2.7.4

