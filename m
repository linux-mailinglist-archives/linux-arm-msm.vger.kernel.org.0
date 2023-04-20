Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4686E6E9EBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 00:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjDTW0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 18:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjDTW0D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 18:26:03 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4F72D6B
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:26:01 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4ec816d64afso4440376e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682029560; x=1684621560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmeEqXDJ0HCLnbeMBAf8mJfMQ+R0J7QCar9Y3vGXcnk=;
        b=XzKAbThSax/1PS/5f+XCUduDq+SZlj7j0nwjJVaClas4tdIlGGMCS6rKWxski7mPVh
         u0kYwIp4lxyEi0IbXigirSR6wOF+Rc0Ce0Owu5yCfHnSi7gOyzDQC/xz/V/PBd3WblAz
         VzYN4CfUKEW1MxQIq4jPZ17MnA9qPpLGHCMEZXusHXQDmWAXGNzDaNO9TVN0s95y0ZGU
         p1PPFLMzz0fliUdHjs1bzohs3ia9TGuMuswCsLO9pm/aP4J5zShntAN+cApF/5qo1Rdp
         0uDSkLAu1hUF1oW7OnzAnF4PEU1uxc3Ng/7rI5eycDAQXtYWGHJnCznqbzbvlAowzzbP
         DfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682029560; x=1684621560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmeEqXDJ0HCLnbeMBAf8mJfMQ+R0J7QCar9Y3vGXcnk=;
        b=kMzE/kBxQYIi0bTn4is451wKo8nwQTWciFvin14uOMqliKxKulhn4vZ8vScpke4r1R
         hPOAQNZR2MEd6KhisGsY3FF8K56QhIjCspgdCJdR+dcq7P4vxkee1zVjkkxOp0FGz/Ly
         laOPKO8nhuxO9iIQDw+qSejol3gWl8pVfG16DMxoX30G4eEjfZDcMX2XzYRvZtM/U4l5
         U9+GtBHecVrjzy8tJ/KNx7iwyDgs3dRlAVHyPOBQP6XNQbVE/jmplfsHQvYlREYpCSDW
         nlGPr8erEil4QF2cGhHLKjqH7mtjGZQ4h2/djy9SGz4g/bAXja2aUlfYgNcG/QaappmN
         7d6g==
X-Gm-Message-State: AAQBX9fXtMmONbDXWc1UBiUtVYiAEgYXF9zFk/+XmvtTOJvKJh0RKxoG
        hhREsvkhJhrZfAssNBp0X5dIRA==
X-Google-Smtp-Source: AKy350YUpZeoldKMvU7Qw62wA/HsDl19x+J8g4WzW7LgRiLzP1Dm5vy0sXMWMqa4txjCnZ71BlwOHA==
X-Received: by 2002:a05:6512:1319:b0:4dd:9eb6:5b4c with SMTP id x25-20020a056512131900b004dd9eb65b4cmr1951449lfu.0.1682029560095;
        Thu, 20 Apr 2023 15:26:00 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f21-20020ac251b5000000b004cb45148027sm347567lfk.203.2023.04.20.15.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 15:25:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm/dpu: stop mapping the regdma region
Date:   Fri, 21 Apr 2023 01:25:58 +0300
Message-Id: <20230420222558.1208887-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
References: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stop mapping the regdma region. The driver does not support regdma.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..28d74d4d2c1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1033,12 +1033,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		DPU_DEBUG("VBIF NRT is not defined");
 	}
 
-	dpu_kms->reg_dma = msm_ioremap_quiet(dpu_kms->pdev, "regdma");
-	if (IS_ERR(dpu_kms->reg_dma)) {
-		dpu_kms->reg_dma = NULL;
-		DPU_DEBUG("REG_DMA is not defined");
-	}
-
 	dpu_kms_parse_data_bus_icc_path(dpu_kms);
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index aca39a4689f4..15111e433f21 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -71,7 +71,7 @@ struct dpu_kms {
 	const struct dpu_mdss_cfg *catalog;
 
 	/* io/register spaces: */
-	void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
+	void __iomem *mmio, *vbif[VBIF_MAX];
 
 	struct regulator *vdd;
 	struct regulator *mmagic;
-- 
2.39.2

