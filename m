Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB497478136
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Dec 2021 01:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhLQAZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 19:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbhLQAZa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 19:25:30 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA74C06173E
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 16:25:30 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id r26so1291222oiw.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 16:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L42E328JA86n5jcTl+bCP40afiqbeg4RjbZPTUGNIHY=;
        b=dUmlG5lJicYneJ1f4yEHYdYyKPoKaHdY1pi0pCz2Fuu3ZzXkmt21TGoGjJOFA0g6k6
         lmzW0AMB/4b7UjmKfoMqXmq8Qw54qFp2RWwmyRoa7rGZDvnksapDIniclJKk+WZn8rpT
         Pn4QxdZ5bhAKvNK6xwd9gTD5OtBYSm1FT4xCyRYx+g0vLz+YoM2cC5lcM6M9DoYr3adc
         AEpUneOwgwgWTVbE1OT5DBXCmiXiRfq7wQONzdBlY6+bnCseNsdO6jWSewHZrjKNua4p
         vpk22V+D4AyRadLBwVvtsnaBkX4pJfp+pWX6gJzY1Xx5wkOksiJUrOfFVSKbIz1fHY4b
         K6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L42E328JA86n5jcTl+bCP40afiqbeg4RjbZPTUGNIHY=;
        b=hTbNBVGZyltBesXUt90WhqqQKvB6nFsMelUAxrpB+gdr66pZXPaAAX22oMl1ENIXNn
         7ajXBzr69Rysj5kEqQNzGSnWAwHlvqSRDCpCIaDEi3lqR5luLe2tHd/HMDx1DoSXTFRQ
         B1EX3JCdBFdu7oBuadw33WT/xey5f0ObxI5fGrSmZHtwi+1z07+j5pHXBk2FID6k0L4s
         Gh8zQMBlnPOurprnYHR4eHkquS0unApBhh+th6hz7Myf1Pz9+PGFRsLBvqGd3NZpy9vp
         u+4TeRCfhplgCBvhrs2XhIF7SqQcxd30yzokVKoyXSLf0DFydmP1Aoy5oqMi6dvSU9GB
         bUvg==
X-Gm-Message-State: AOAM531NQEiIMp2kVqoWSuKswYwnVca3Kpy68f6MYBG8oQ02cek7FE0r
        W1YFu0d1H+7gefciWRJu5Y/KsA==
X-Google-Smtp-Source: ABdhPJyPGUEwkpTisIyEtIxA7AqL5O/rQdW/wl3Fvbfc3dyzLdRWLQEMcLTMMH1LVTJWQU+PHMDjWg==
X-Received: by 2002:aca:c45:: with SMTP id i5mr6384532oiy.176.1639700729402;
        Thu, 16 Dec 2021 16:25:29 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t3sm1303905otk.44.2021.12.16.16.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 16:25:29 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6] drm/msm/dp: Add sc8180x DP controllers
Date:   Thu, 16 Dec 2021 16:26:43 -0800
Message-Id: <20211217002643.2305526-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
DP driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v5:
- Dropped DPU hw catalog change from the patch
- Rebased the patch

 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8d9c19dbf33e..a9f5368559b4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -143,10 +143,21 @@ static const struct msm_dp_config sc7280_dp_cfg = {
 	.num_descs = 2,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.descs = (const struct msm_dp_desc[]) {
+		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
+	},
+	.num_descs = 3,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
 	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
 	{}
 };
 
-- 
2.33.1

