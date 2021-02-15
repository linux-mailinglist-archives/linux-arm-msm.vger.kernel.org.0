Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C8931BF4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 17:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhBOQ3t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 11:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbhBOQ1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 11:27:44 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75459C06178B
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:27:03 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id b24so5133675qtp.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VFjJmq0Au97vKEfgrOVE/VaVkFx8gpBh2nvbd9qF3qo=;
        b=qiSD18VKERrmmBABpN44wUGZD3scAkdlr5F60WO99K9GvLpZzgvB4mNfnyUa2KNswe
         rmsF0lOeuii7HJ1k0wHKVeJlMxZDTAYToVUtRjdDOtV24oifgt1M9VOvOIZRRje85n9g
         oArUw5DiM7GkEREGHM/RxR6ji+qvf41nAvptuvtNDaHuITM3INC67wejqETMZd7jMsyU
         eJD1atVd3uPikyja3DzDta2ii2taiALAKl3ogHTmP+VjJMlYK80JiZuhTRBb/d9Xbw6t
         k2XtfRWMabh2C7jmM2hzIgHBVluHaJ+roCPrUDDszzVzwZbRadvEi51fnO4eTP5FZ8sT
         G5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VFjJmq0Au97vKEfgrOVE/VaVkFx8gpBh2nvbd9qF3qo=;
        b=LNu4/WBANzSAiTycpPdk5YwW+xXo2n96XI1R98Dn8qEmbS7DSeu/h4K6PhaaJELw1O
         M91pqtfcVK7ov+S4ryJdnVsIy6s/jXZLhZQYSTqFF70v0Z2lMpSYfHbpdfMwuWoxH5Qw
         S4SsS9cDUgwO4ouuMaQWzdkMO0ini4gaPs1dtAhy08eZyKuAAaslXk5/BUjFtB5U0Y5L
         YiXf4/C9XfkUGsNzI1YX0kZ7+0LNRRarRiGpl4pGGOM2oayXipYidfDLXJot1XgRbcfr
         +JsoQwXCziqtyEvMnn9fDV6CtrsQWtnzMmmAaD6Zo2JG13bgS00+EWSZholSOY/LpQOT
         Y77Q==
X-Gm-Message-State: AOAM531YLgvTt4CcnUGRmyyFxNMwIJ7VDZFjQnu97c70ms39d73tMM1X
        sGOYafqE+PvP83SixIdHs5ifod3KbPEx5wbJoA8=
X-Google-Smtp-Source: ABdhPJzDOH0zYNMm8WDGCjFO1D7hzekHfT8jDXdSfA1Oi/IG6oKe2Kr3XOWDcr806SG1uoDK4xv++g==
X-Received: by 2002:ac8:7485:: with SMTP id v5mr15100763qtq.174.1613406422432;
        Mon, 15 Feb 2021 08:27:02 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id u7sm10928811qta.75.2021.02.15.08.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:27:02 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        tongtiangen <tongtiangen@huawei.com>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/2] drm/msm: add compatibles for sm8150/sm8250 display
Date:   Mon, 15 Feb 2021 11:26:04 -0500
Message-Id: <20210215162607.21360-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210215162607.21360-1-jonathan@marek.ca>
References: <20210215162607.21360-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver already has support for sm8150/sm8250, but the compatibles were
never added.

Also inverse the non-mdp4 condition in add_display_components() to avoid
having to check every new compatible in the condition.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               | 2 ++
 drivers/gpu/drm/msm/msm_drv.c                         | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..5763f43200a0 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
 
 MDSS:
 Required properties:
-- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
+- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
 - reg: physical base address and length of contoller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
@@ -41,7 +41,7 @@ Optional properties:
 
 MDP:
 Required properties:
-- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
+- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
 - reg: physical base address and length of controller's registers.
 - reg-names : register region names. The following region is required:
   * "mdp"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5a8e3e1fc48c..fff12a4c8bfc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
 static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sdm845-dpu", },
 	{ .compatible = "qcom,sc7180-dpu", },
+	{ .compatible = "qcom,sm8150-dpu", },
+	{ .compatible = "qcom,sm8250-dpu", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 94525ac76d4e..928f13d4bfbc 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
 	 * Populate the children devices, find the MDP5/DPU node, and then add
 	 * the interfaces to our components list.
 	 */
-	if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
-	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
-	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
+	if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {
 		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
@@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
 	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
 	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.26.1

