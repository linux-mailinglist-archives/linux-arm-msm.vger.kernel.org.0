Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9106745AE50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 22:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240449AbhKWVY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 16:24:56 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:16397 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240451AbhKWVYz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 16:24:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637702506; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=VzLxxhSoWfu+48UE3pLdFqa9O1mF2VyRwcX15F0zU9Q=; b=P1HdAdkLtjpokLaxcYRYmmFYS/ux6AzvC0GsfvDyGUo5uNYBQs8jdyJegAwgaK4epPHRC1pE
 DkLyNdxTJ9TpLURyVGoojwkK8eMQEMj1ShcID8yX105/ult/zu9YvcxIRg8yNtHQ/Cso+Sh/
 uhMAoO1+k+xwpsXMAnKDYQDXuek=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 619d5b60db3ac5552a0aa44e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 21:21:36
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 78609C43635; Tue, 23 Nov 2021 21:21:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1A7E6C43637;
        Tue, 23 Nov 2021 21:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1A7E6C43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] drm/msm/a6xx: Fix smatch warning for gpu_scid
Date:   Wed, 24 Nov 2021 02:47:52 +0530
Message-Id: <20211124024436.v2.3.Ie4ac321feb10168af569d9c2b4cf6828bed8122c@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20211124024436.v2.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
References: <20211124024436.v2.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the below smatch warning:
	drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1480 a6xx_llc_activate()
	error: uninitialized symbol 'gpu_scid'.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

(no changes since v1)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b7f11cd..6c2edce 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1411,17 +1411,24 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
-	u32 gpu_scid, cntl1_regval = 0;
+	u32 cntl1_regval = 0;
 
 	if (IS_ERR(a6xx_gpu->llc_mmio))
 		return;
 
 	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
-		gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
+		u32 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
 
 		gpu_scid &= 0x1f;
 		cntl1_regval = (gpu_scid << 0) | (gpu_scid << 5) | (gpu_scid << 10) |
 			       (gpu_scid << 15) | (gpu_scid << 20);
+
+		/* On A660, the SCID programming for UCHE traffic is done in
+		 * A6XX_GBIF_SCACHE_CNTL0[14:10]
+		 */
+		if (adreno_is_a660_family(adreno_gpu))
+			gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
+				(1 << 8), (gpu_scid << 10) | (1 << 8));
 	}
 
 	/*
@@ -1458,13 +1465,6 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
 	}
 
 	gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL1, GENMASK(24, 0), cntl1_regval);
-
-	/* On A660, the SCID programming for UCHE traffic is done in
-	 * A6XX_GBIF_SCACHE_CNTL0[14:10]
-	 */
-	if (adreno_is_a660_family(adreno_gpu))
-		gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
-			(1 << 8), (gpu_scid << 10) | (1 << 8));
 }
 
 static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

