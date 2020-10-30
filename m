Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B283C2A0325
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 11:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgJ3Kr0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 06:47:26 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:32910 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbgJ3KrZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 06:47:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604054844; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=cNgbt2uezd4SdMm7yeyDQY39P2qdfAFjmfhtva22ot0=; b=AAZ7GInpOkRaGYy/iLqViQBbottoTXEEopFbe621ZbjywmyNU8qs3qCmiWaLx2ghCZkqGl6N
 bdlR3iapWlPkDL0PpVCozcYHUpVTrgV4/nSh3ZUDtY5wmQfUJckcGBcNEODdLhCerARZf7fV
 vWESU8ABsUtSKa7Hsbif3wNDQNs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f9bef3cbe6c9f1ca24ed557 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 10:47:24
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C3FBC433C9; Fri, 30 Oct 2020 10:47:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B7C1C433C9;
        Fri, 30 Oct 2020 10:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B7C1C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     robh@kernel.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jcrouse@codeaurora.org, mka@chromium.org, robdclark@gmail.com,
        dianders@chromium.org
Subject: [PATCH v5 1/3] drm/msm: Add support for GPU cooling
Date:   Fri, 30 Oct 2020 16:17:10 +0530
Message-Id: <1604054832-3114-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register GPU as a devfreq cooling device so that it can be passively
cooled by the thermal framework.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v5:
	1. Update Reviewed-by/Tested-by tags
Changes in v4:
	1. Fix gpu cooling map.
	2. Add mka's Reviewed-by tag.
Changes in v3:
	1. Minor fix in binding documentation (RobH)
Changes in v2:
	1. Update the dt bindings documentation

 drivers/gpu/drm/msm/msm_gpu.c | 12 ++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 55d1648..9f9db46 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -14,6 +14,7 @@
 #include <generated/utsrelease.h>
 #include <linux/string_helpers.h>
 #include <linux/devfreq.h>
+#include <linux/devfreq_cooling.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
 
@@ -107,9 +108,18 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
 	if (IS_ERR(gpu->devfreq.devfreq)) {
 		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
 		gpu->devfreq.devfreq = NULL;
+		return;
 	}
 
 	devfreq_suspend_device(gpu->devfreq.devfreq);
+
+	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
+			gpu->devfreq.devfreq);
+	if (IS_ERR(gpu->cooling)) {
+		DRM_DEV_ERROR(&gpu->pdev->dev,
+				"Couldn't register GPU cooling device\n");
+		gpu->cooling = NULL;
+	}
 }
 
 static int enable_pwrrail(struct msm_gpu *gpu)
@@ -1005,4 +1015,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
 		msm_gem_address_space_put(gpu->aspace);
 	}
+
+	devfreq_cooling_unregister(gpu->cooling);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 6c9e1fd..9a8f20d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -147,6 +147,8 @@ struct msm_gpu {
 	struct msm_gpu_state *crashstate;
 	/* True if the hardware supports expanded apriv (a650 and newer) */
 	bool hw_apriv;
+
+	struct thermal_cooling_device *cooling;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
-- 
2.7.4

