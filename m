Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EE53DA772
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 17:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237851AbhG2PWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 11:22:15 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32037 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhG2PV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 11:21:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627572070; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=tT0Rmr8bIVXL7IImapnpIIgCnu8mOznrYiudXhbVNIs=; b=RHPrOVuDZU6bxCOApetiObvXuBa0gtWDZ3ZDbgRfHCcHRdVXGBhGtoxks4Tz2O/inzibwF68
 5bwaho0A6RKlXsFhPA/0eOZY6jEcqXiD5rKrKcimYPGs/iV9SlxM+QDJfBDK7lywClljHTc6
 f3A8tB1xNyjXLHzRvVXx71tNqC8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6102c75d96a66e66b2c8d267 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 15:21:01
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4C822C43143; Thu, 29 Jul 2021 15:21:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EFB82C43143;
        Thu, 29 Jul 2021 15:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EFB82C43143
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/msm/a6xx: Use rev to identify SKU
Date:   Thu, 29 Jul 2021 20:50:35 +0530
Message-Id: <20210729204922.v3.2.I286ef007fcadd9e6ee3b2c0ad948f990735f9610@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627572036-28289-1-git-send-email-akhilpo@codeaurora.org>
References: <1627572036-28289-1-git-send-email-akhilpo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use rev instead of revn to identify the SKU. This is in
preparation to the introduction of 7c3 gpu which won't have a
revn.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

(no changes since v1)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 183b9f9..0da1a66 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1675,11 +1675,11 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
-static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
+static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 {
 	u32 val = UINT_MAX;
 
-	if (revn == 618)
+	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {
@@ -1692,8 +1692,7 @@ static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
 	return (1 << val);
 }
 
-static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
-		u32 revn)
+static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 {
 	u32 supp_hw = UINT_MAX;
 	u16 speedbin;
@@ -1714,7 +1713,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 	}
 	speedbin = le16_to_cpu(speedbin);
 
-	supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
+	supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
 
 done:
 	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
@@ -1785,7 +1784,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info->revn);
+	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

