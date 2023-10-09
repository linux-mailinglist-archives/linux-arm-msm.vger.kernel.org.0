Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325537BE89D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377069AbjJIRss (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377064AbjJIRss (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:48:48 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F6A9E
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:48:45 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50567477b29so6189928e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696873724; x=1697478524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT+hrXCtnAKI6JPhd1O0NhhA7HtFpVwBshqYDoamy+w=;
        b=O93T0TPhsubMNtO84dgTGr72Evq5cipA2mKHDsEsCkC4UOy3hqII//fRTMGeZNVNeG
         Cl1o3nkHbD/bzGXcZzc1ZfW79IJ0DXD2qFKFph5ARESIjH5qeL/N6EnwbvyG5kDf9dAa
         JZRAActAW1c2i758fISiiicX6dm19QwWxBjb+GG2kuWBl0492wYm4U5dfeNWQd0p9Fa3
         DOqSy7uh+5uzor9PkQH2Kcg/6fmziOnRUdKjKATET5NQ8LWwAT8faGhVGGl8oRSu5+0O
         LEoZcw1jTnh2c5bBeb1YR8LKKaTxC4V47Kpuyn0Ada8OvVerfVSZeDq/0IGmYAxWAL1b
         lGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696873724; x=1697478524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VT+hrXCtnAKI6JPhd1O0NhhA7HtFpVwBshqYDoamy+w=;
        b=YXMzjfEdxhOpmVHgC5fX8Qdz6m01dvFjYaeE6Js6MiTHiq3hSXI4phgQXfCxCtAqUc
         WmMotd1N+G8bDGCMmgCQ7nKPeTODPbzgsl3etcQ9sMVHfiArJJSLNfyhKTjzaXWlrejd
         rhRDuWvhO6EXIJ2cF4K6UAmXcetmKw1O/ySj8MtD1gVXjG0DsmBC5t7NNorfCtum/Z3D
         V3SDk1zzDpy9PUDJwo2B24vigqI1aGz1MSodrXzY0n2IOuwkbaXPr5WH4Cw/0RQ4eCVV
         WYYOeI4SDsZpdB55ozaLKmshthweV6NUmSA/1cWctIMgXRkTzmm6hDL2H/oPyFoDirFH
         Ki1Q==
X-Gm-Message-State: AOJu0YxxNR0e1p4XeHQOtfV64ewhNX59cg6eIinZNAL7hV+0adKy8MOM
        /onFOXiF2iyXiG8XxdPXzi2KhA==
X-Google-Smtp-Source: AGHT+IFs0Oon9IOA/nIlx84ys34oyq+msVafstILaUniBZ9LuQElf3rVQ0WFFwWi1cd7DZnceGSqBw==
X-Received: by 2002:a19:5050:0:b0:503:31dc:7d64 with SMTP id z16-20020a195050000000b0050331dc7d64mr14510721lfj.21.1696873724120;
        Mon, 09 Oct 2023 10:48:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24257000000b0050420eff124sm1495927lfl.152.2023.10.09.10.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:48:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 4/4] drm/msm/mdp5: move resource allocation to the _probe function
Date:   Mon,  9 Oct 2023 20:48:40 +0300
Message-Id: <20231009174840.2726861-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009174840.2726861-1-dmitry.baryshkov@linaro.org>
References: <20231009174840.2726861-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++++-------------
 1 file changed, 44 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 436e76e2fc04..68fcfd85d250 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -554,20 +554,16 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct platform_device *pdev;
 	struct mdp5_kms *mdp5_kms;
 	struct mdp5_cfg *config;
-	struct msm_kms *kms;
+	struct msm_kms *kms = priv->kms;
 	struct msm_gem_address_space *aspace;
-	int irq, i, ret;
+	int i, ret;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
 
-	/* priv->kms would have been populated by the MDP5 driver */
-	kms = priv->kms;
-	if (!kms)
-		return -ENOMEM;
-
 	mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+
 	pdev = mdp5_kms->pdev;
 
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
@@ -576,15 +572,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (!irq) {
-		ret = -EINVAL;
-		DRM_DEV_ERROR(&pdev->dev, "failed to get irq\n");
-		goto fail;
-	}
-
-	kms->irq = irq;
-
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
 
 	/* make sure things are off before attaching iommu (bootloader could
@@ -787,60 +774,23 @@ static int interface_init(struct mdp5_kms *mdp5_kms)
 static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct mdp5_kms *mdp5_kms;
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct mdp5_cfg *config;
 	u32 major, minor;
 	int ret;
 
-	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
-	if (!mdp5_kms) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	spin_lock_init(&mdp5_kms->resource_lock);
-
 	mdp5_kms->dev = dev;
-	mdp5_kms->pdev = pdev;
 
 	ret = mdp5_global_obj_init(mdp5_kms);
 	if (ret)
 		goto fail;
 
-	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys");
-	if (IS_ERR(mdp5_kms->mmio)) {
-		ret = PTR_ERR(mdp5_kms->mmio);
-		goto fail;
-	}
-
-	/* mandatory clocks: */
-	ret = get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->core_clk, "core", true);
-	if (ret)
-		goto fail;
-	ret = get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
-	if (ret)
-		goto fail;
-
-	/* optional clocks: */
-	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
-	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
-	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
-
 	/* we need to set a default rate before enabling.  Set a safe
 	 * rate first, then figure out hw revision, and then set a
 	 * more optimal rate:
 	 */
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
-	/* set uninit-ed kms */
-	priv->kms = &mdp5_kms->base.base;
-
 	pm_runtime_enable(&pdev->dev);
 	mdp5_kms->rpm_enabled = true;
 
@@ -931,15 +881,53 @@ static int mdp5_setup_interconnect(struct platform_device *pdev)
 
 static int mdp5_dev_probe(struct platform_device *pdev)
 {
-	int ret;
+	struct mdp5_kms *mdp5_kms;
+	int ret, irq;
 
 	DBG("");
 
+	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
+	if (!mdp5_kms)
+		return -ENOMEM;
+
 	ret = mdp5_setup_interconnect(pdev);
 	if (ret)
 		return ret;
 
-	return msm_drv_probe(&pdev->dev, mdp5_kms_init, NULL);
+	mdp5_kms->pdev = pdev;
+
+	spin_lock_init(&mdp5_kms->resource_lock);
+
+	mdp5_kms->mmio = msm_ioremap(pdev, "mdp_phys");
+	if (IS_ERR(mdp5_kms->mmio))
+		return PTR_ERR(mdp5_kms->mmio);
+
+	/* mandatory clocks: */
+	ret = get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->ahb_clk, "iface", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->core_clk, "core", true);
+	if (ret)
+		return ret;
+	ret = get_clk(pdev, &mdp5_kms->vsync_clk, "vsync", true);
+	if (ret)
+		return ret;
+
+	/* optional clocks: */
+	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
+	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
+	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq, "failed to get irq\n");
+
+	mdp5_kms->base.base.irq = irq;
+
+	return msm_drv_probe(&pdev->dev, mdp5_kms_init, &mdp5_kms->base.base);
 }
 
 static void mdp5_dev_remove(struct platform_device *pdev)
-- 
2.39.2

