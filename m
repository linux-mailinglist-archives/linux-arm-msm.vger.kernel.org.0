Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5887A1D2DAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 12:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgENKzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 06:55:06 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:13093 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727095AbgENKzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 06:55:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589453705; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=d4ugb4sKSL4MeHpuYPeW464zWBGM2ZpCya12KKSdyDk=; b=NMzw63fPrVIUEJWMqsLDYbgUtqaeOEAxXRgNonW7plzM1NXd47PzBuL9rRz3H5/PnECw7xTe
 mJD19YTdMbBxbmHukto9tmHTOOIR41SyrVLlXfRIjMmVFXyaJ3B08cxen/UnkJljrBVJu2Fu
 iUuTTgergd0vrZVc9FLfEG19HFM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd2379.7f0067ede148-smtp-out-n02;
 Thu, 14 May 2020 10:54:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2D485C4478C; Thu, 14 May 2020 10:54:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B08EC4478C;
        Thu, 14 May 2020 10:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B08EC4478C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org, mka@chromium.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw to set DDR bandwidth
Date:   Thu, 14 May 2020 16:24:18 +0530
Message-Id: <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patches replaces the previously used static DDR vote and uses
dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
GPU frequency.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 2d8124b..79433d3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)

 	gmu->freq = gmu->gpu_freqs[perf_index];

-	/*
-	 * Eventually we will want to scale the path vote with the frequency but
-	 * for now leave it at max so that the performance is nominal.
-	 */
-	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+	dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
 }

 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
--
2.7.4
