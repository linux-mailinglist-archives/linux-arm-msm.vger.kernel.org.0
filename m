Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFC27BE8EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377497AbjJISKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377493AbjJISKw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:52 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EBC94
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:51 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50585357903so6358574e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875049; x=1697479849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fO+sWOeSmRkDmpBJ32tICKPjdJ7k9e53PrGRnC7dXE=;
        b=ZTXbSFKAPiPDg1q39Qc2tMtrWC+AkLb+DPNnmsDEFkTEW0m0L4wiubqmrbRUu2MfXh
         70Ee9BPNSqgO11OEbG6Rgum9jj1CmKKOJ5G52z16zfElLbxGk8aW4DAPjX7/aPqzOYPy
         s3VRV/VkdSJPFW3esZHPzbBtxlBLrD/Cp6c5EUNR3HHg5SU/K9L/7N3Bfh4/Zm5iXfom
         HiPBUcAQuJ2cpV2I9U+qR0zCpmvS0RguZvLBlduxqZjlHkEfUIue2x992zipjh4vwmTl
         kmu23gP2xUtzc1/I7Wk17n0vVhDOPoutKMCBK/GPlw95lBSYcak9ZnEngy3TbK9raU3U
         9MNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875049; x=1697479849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fO+sWOeSmRkDmpBJ32tICKPjdJ7k9e53PrGRnC7dXE=;
        b=pxsSQ36eZwBimrd5U585ToZy/NlIR1VCujcj63UQhKIyrn0f7w+QBPILBaZySHpF3v
         TwYAx6zPWUgXInwAawhDUc4mnLdR1urAPHjVwfFJuxardfF/TvncnnKL5ys2V6AbAgO9
         Rr/DLFP8shleN+lrdzoJBAQQzqxcFvTqhD4/sThngkLumEPuqoj3wS5FnJo8ix7XJaWL
         NcKC2yqm0Ycey43fyqlnq6IQ+pPBOqknpZjEFbo6o5+IbHflokKGsk2uKeALzpjoSQP8
         kD62Wir3Suln8AMe4g5oHuYeKa8/HKOtNozvqc6xRSplxqc1wHcD6hPUK794trnO0ZLu
         oYfA==
X-Gm-Message-State: AOJu0Yw9UyE2wtQr5SIX+Rl/f7C/Z/GVdjDHDvHNa7YKLOUYCG7D2Nvw
        MD9SupP21DaIWOi30gXVxZ2OwQ==
X-Google-Smtp-Source: AGHT+IHZ7AEHPT/cxBG7NCCQF47wnsevopIIA1mMp9bQWYMK3R/xYI3NkYAYd2aSmC4Qtnh1rgTQiQ==
X-Received: by 2002:a05:6512:230d:b0:500:b7ed:105a with SMTP id o13-20020a056512230d00b00500b7ed105amr17536069lfu.29.1696875049664;
        Mon, 09 Oct 2023 11:10:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:49 -0700 (PDT)
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
Subject: [PATCH v2 10/13] drm/msm: switch to drmm_mode_config_init()
Date:   Mon,  9 Oct 2023 21:10:37 +0300
Message-Id: <20231009181040.2743847-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

Switch to drmm_mode_config_init() instead of drm_mode_config_init().
Drop drm_mode_config_cleanup() calls.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 8079f408c9ed..00ed71c3d503 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -238,8 +238,6 @@ static int msm_drm_uninit(struct device *dev)
 	if (kms)
 		msm_disp_snapshot_destroy(ddev);
 
-	drm_mode_config_cleanup(ddev);
-
 	if (kms) {
 		pm_runtime_get_sync(dev);
 		msm_irq_uninstall(ddev);
@@ -440,11 +438,13 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	might_lock(&priv->lru.lock);
 	fs_reclaim_release(GFP_KERNEL);
 
-	drm_mode_config_init(ddev);
+	ret = drmm_mode_config_init(ddev);
+	if (ret)
+		goto err_destroy_wq;
 
 	ret = msm_init_vram(ddev);
 	if (ret)
-		goto err_cleanup_mode_config;
+		goto err_destroy_wq;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
@@ -555,8 +555,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 err_deinit_vram:
 	msm_deinit_vram(ddev);
-err_cleanup_mode_config:
-	drm_mode_config_cleanup(ddev);
+err_destroy_wq:
 	destroy_workqueue(priv->wq);
 err_put_dev:
 	drm_dev_put(ddev);
-- 
2.39.2

