Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9512834CF9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 14:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbhC2MBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 08:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbhC2MBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 08:01:02 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57829C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 05:01:02 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id n138so18033971lfa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 05:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P9Nv+6xnEu0zvg+j8CWyLr5RnYQX009vcZ1IcsZuglc=;
        b=dCytlg3NJtzf0BpAz8mXT7plQHDmHXz1C4hl6Y9i80ei+NgRYcYg/f90iCRvocOt90
         URY/Gh6xzPVyPKLt5MtLKD+GW7kdG8L/gHbj11PSOd/+t46LYRn7rSyDunXVkVBhAo4x
         UdcdGJ3MJAxSPb3uhpn2m99OmglOQ0seBL2B8dHvKWQ7hJHkSs8PzWgMC245xOEBB+Ij
         66J+ILAqnnW660AjnKTLgti1Zm18RaeRrtQ/NUvF209pPf0KQdAwFEq30Dj71jFVgdGX
         1+Ih90QSivp1dEnvC0jhXtr9/NXpBHyNImI+ufcE6ej8wWtRkYlM6tey8IhQj9mxj1Er
         IBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P9Nv+6xnEu0zvg+j8CWyLr5RnYQX009vcZ1IcsZuglc=;
        b=kl2QWKo8TOMmd6f0L25o+/zuTbLPf3Q/UyIsbRRk1hB1XjBHrkTKrXHZ5e1JyNqBZe
         XIh9PAXHOKD/zOg41/+PWO5etqfNKUQG0brtsBgFxnOAcsZ9yM8/4DmIKyR9EXJSdSmH
         YF2d4YAdU/8Ik5kFp5v9x8dvJsumh8uwuaRkyK8IAKNaCiN38QnW5IPs4YAp61ogEIaH
         b+HwVo06OwiNFRvkVwZEodRsOtntyvAx9uNtVt71BQqxVu6SOFfsETGWXgiQGW+Rw1xd
         OiagvheBLGV4otBvNwhwPxaHrg1znHYu8tj6B3Su0EYysJ/538AH5E342O7Uulpewmeg
         xPhg==
X-Gm-Message-State: AOAM5337t8vLzllpCSb8O//CmrTE189UJjqz/StVodrZpAdxTx3LwX1g
        YCP6eNJcU1cSIICTlav2LFiaww==
X-Google-Smtp-Source: ABdhPJxDLhW+4HyPAHsCfvVj9qn2mczR+WcByy1R74ybzUcyU+zlg8SYPcMP7mVdKzXHX4iIoAJIBA==
X-Received: by 2002:a19:c14a:: with SMTP id r71mr15979614lff.358.1617019260867;
        Mon, 29 Mar 2021 05:01:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d8sm2415240ljc.129.2021.03.29.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 05:01:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 3/4] drm/msm: add compatibles for sm8150/sm8250 display
Date:   Mon, 29 Mar 2021 15:00:50 +0300
Message-Id: <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

The driver already has support for sm8150/sm8250, but the compatibles were
never added.

Also inverse the non-mdp4 condition in add_display_components() to avoid
having to check every new compatible in the condition.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
 drivers/gpu/drm/msm/msm_drv.c           | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

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
2.30.2

