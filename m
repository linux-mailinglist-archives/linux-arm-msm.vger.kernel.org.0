Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0A7354278
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 15:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237219AbhDENrs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 09:47:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38174 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237467AbhDENrs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 09:47:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617630462; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=LkXe1ru5QkypL7XJEXPXj4uLzUbzidHGT/01ds7D8L0=; b=CTqOWsYl0rAzQ/iUgCo9aSRQ2+JF/E5r2xGVumMp0OQ/tUtcMcQgPvwLbPpQOcApVf3Hx1up
 5MKd7Vk9dr4T/okqR8ohBtQQ9jEH5ku5qd1FcdKgt2GMN0JOA63CRxIa1dezWtMNprwplxbp
 e4S/DYHxWKs2truvYpqM4aciR6Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 606b14ed8166b7eff7b1a7c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Apr 2021 13:47:25
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5DB73C43463; Mon,  5 Apr 2021 13:47:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E747AC433CA;
        Mon,  5 Apr 2021 13:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E747AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jordan@cosmicpenguin.net,
        eric@anholt.net, jonathan@marek.ca, robdclark@gmail.com,
        dianders@chromium.org
Subject: [PATCH 1/2] drm/msm/a6xx: Fix perfcounter oob timeout
Date:   Mon,  5 Apr 2021 19:17:12 +0530
Message-Id: <1617630433-36506-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We were not programing the correct bit while clearing the perfcounter oob.
So, clear it correctly using the new 'clear' bit. This fixes the below
error:

[drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set PERFCOUNTER: 0x80000000

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 863047b..6a86cd0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -246,7 +246,7 @@ static int a6xx_gmu_hfi_start(struct a6xx_gmu *gmu)
 }
 
 struct a6xx_gmu_oob_bits {
-	int set, ack, set_new, ack_new;
+	int set, ack, set_new, ack_new, clear, clear_new;
 	const char *name;
 };
 
@@ -260,6 +260,8 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
 		.ack = 24,
 		.set_new = 30,
 		.ack_new = 31,
+		.clear = 24,
+		.clear_new = 31,
 	},
 
 	[GMU_OOB_PERFCOUNTER_SET] = {
@@ -268,18 +270,22 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
 		.ack = 25,
 		.set_new = 28,
 		.ack_new = 30,
+		.clear = 25,
+		.clear_new = 29,
 	},
 
 	[GMU_OOB_BOOT_SLUMBER] = {
 		.name = "BOOT_SLUMBER",
 		.set = 22,
 		.ack = 30,
+		.clear = 30,
 	},
 
 	[GMU_OOB_DCVS_SET] = {
 		.name = "GPU_DCVS",
 		.set = 23,
 		.ack = 31,
+		.clear = 31,
 	},
 };
 
@@ -335,9 +341,9 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 		return;
 
 	if (gmu->legacy)
-		bit = a6xx_gmu_oob_bits[state].ack;
+		bit = a6xx_gmu_oob_bits[state].clear;
 	else
-		bit = a6xx_gmu_oob_bits[state].ack_new;
+		bit = a6xx_gmu_oob_bits[state].clear_new;
 
 	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << bit);
 }
-- 
2.7.4

