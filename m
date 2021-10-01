Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC32241F350
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhJARoD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 13:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353548AbhJARoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 13:44:01 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C91C0613E2
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 10:42:16 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso12451376ota.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 10:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=59j+ppAnA3GClcXblCq4bc27uTFd0Elka2ulfgZ16K8=;
        b=u5XSprnyphaZ98shNU0AoIBqdCI1ygik1nxlbMerLiJIsEVY11mKu96UI+E1IOBzR7
         j+UJ8Z9zJ3xW4GJ65NOAKnPIgoqTfkBC5hjEshfh7HRybbwkasu+Cy0KmQ/TfUtqiz5w
         U6D+z/5AOFRPkg5zZvlFV9rJ8JCNio+Lv6odBMisd3hbzMf5icTI4dc+OXTRTl50LMm4
         C+7v2NBNanKQS4tqi+vZbZnHs3tNQGYmmKjbcrcIecn/aNTB07lvs80vBtBNBPBQ/UlF
         yjKJN7/6ga40co2OOOpIbJxrkO2dnhdvcy6aCAh+fv3T4z0/38RtmMneHMjnxr7LV16u
         Z3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=59j+ppAnA3GClcXblCq4bc27uTFd0Elka2ulfgZ16K8=;
        b=RGu76bIp0i8/Q0DR97+4ZiWOSpI4UmE31H0X7sh6DFq0MmPRvUv9wTWCAIfBabHh2O
         wfqAdsVVPq0pAU/BCV29GN57ZSA0qMbrzOSZtVzU3onsI4I2HCu4wFXGSsvUDpA5bhQ0
         1uZjySuXvvg2abxbrxZpA1/SRAuK63aC9DUqMqpFVSFCChQ2OINytsg9dEMTQxnpWRPi
         pJdcRzHAtqmvTQsMWhCQ501Tk3Okv6kPE07BsnC/QeNLvv0lGumFZhDMtExhorweUXMw
         O8VrGolmqi2sTRfZVYy2wAchNAkUa0dK4rcr+R2i5/pPsWvfonCz5Suu1CE9FrYZKVuu
         TtaA==
X-Gm-Message-State: AOAM533Qzg5fBuQYi7iUBODPcmQtToffsvfxMh398eHf9pi7+BCfatUN
        +Va44QU1QiyhOWQ+sjboJJirvg==
X-Google-Smtp-Source: ABdhPJyuD9dTkDpl1caAxTajSERBBi4xtihxbClz3LCfV4+vrp8RPWUmh7M1riNl7I06YKIlHrESTA==
X-Received: by 2002:a9d:411e:: with SMTP id o30mr11481720ote.97.1633110136352;
        Fri, 01 Oct 2021 10:42:16 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id u15sm1369264oon.35.2021.10.01.10.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:42:16 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] drm/msm/dp: Use devres for ioremap()
Date:   Fri,  1 Oct 2021 10:43:57 -0700
Message-Id: <20211001174400.981707-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001174400.981707-1-bjorn.andersson@linaro.org>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The non-devres version of ioremap is used, which requires manual
cleanup. But the code paths leading here is mixed with other devres
users, so rely on this for ioremap as well to simplify the code.

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/gpu/drm/msm/dp/dp_parser.c | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 0519dd3ac3c3..c064ced78278 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -32,7 +32,7 @@ static int msm_dss_ioremap(struct platform_device *pdev,
 	}
 
 	io_data->len = (u32)resource_size(res);
-	io_data->base = ioremap(res->start, io_data->len);
+	io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
 	if (!io_data->base) {
 		DRM_ERROR("%pS->%s: ioremap failed\n",
 			__builtin_return_address(0), __func__);
@@ -42,22 +42,6 @@ static int msm_dss_ioremap(struct platform_device *pdev,
 	return 0;
 }
 
-static void msm_dss_iounmap(struct dss_io_data *io_data)
-{
-	if (io_data->base) {
-		iounmap(io_data->base);
-		io_data->base = NULL;
-	}
-	io_data->len = 0;
-}
-
-static void dp_parser_unmap_io_resources(struct dp_parser *parser)
-{
-	struct dp_io *io = &parser->io;
-
-	msm_dss_iounmap(&io->dp_controller);
-}
-
 static int dp_parser_ctrl_res(struct dp_parser *parser)
 {
 	int rc = 0;
@@ -67,19 +51,14 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	rc = msm_dss_ioremap(pdev, &io->dp_controller);
 	if (rc) {
 		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
-		goto err;
+		return rc;
 	}
 
 	io->phy = devm_phy_get(&pdev->dev, "dp");
-	if (IS_ERR(io->phy)) {
-		rc = PTR_ERR(io->phy);
-		goto err;
-	}
+	if (IS_ERR(io->phy))
+		return PTR_ERR(io->phy);
 
 	return 0;
-err:
-	dp_parser_unmap_io_resources(parser);
-	return rc;
 }
 
 static int dp_parser_misc(struct dp_parser *parser)
-- 
2.29.2

