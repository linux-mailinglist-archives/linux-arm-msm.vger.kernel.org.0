Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8BE148517
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 13:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730676AbgAXMVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 07:21:46 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:62171 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729631AbgAXMVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 07:21:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579868505; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=F1LWU1oX1nibhhy7cGSDGcWE9ft9GXYa7Jl4DQRxQjA=; b=Xp2iQJPwjA+HVrkkRxJSAlWw0fAX7EEDo73h1qXuH/nKtJBu00T8mDCraB/9ZC8iZvcFr/RQ
 Ia5zuSeXbZopEtS1khJOFO0f5IIN6hk6g0CD22W2vnCqtd2grl2v/sGwNWzsYVpmbM0+Olnl
 5Yq8SXjwovQID1TaMYrY7GmAlyM=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2ae159.7fdff4753df8-smtp-out-n03;
 Fri, 24 Jan 2020 12:21:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 18286C4479F; Fri, 24 Jan 2020 12:21:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DF1CC433CB;
        Fri, 24 Jan 2020 12:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6DF1CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        smasetty@codeaurora.org
Subject: [PATCH] drm/msm/a6xx: Correct the highestbank configuration
Date:   Fri, 24 Jan 2020 17:50:11 +0530
Message-Id: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Highest bank bit configuration is different for a618 gpu. Update
it with the correct configuration which is the reset value incidentally.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index daf0780..536d196 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -470,10 +470,12 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	/* Select CP0 to always count cycles */
 	gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL_0, PERF_CP_ALWAYS_COUNT);
 
-	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
-	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
-	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
-	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
+	if (adreno_is_a630(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
+		gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
+		gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
+		gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
+	}
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL,
-- 
2.7.4
