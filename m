Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98DC451E6AE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 13:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445970AbiEGLoC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 May 2022 07:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiEGLoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 May 2022 07:44:01 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873E52FFD5
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 May 2022 04:40:13 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id t25so11963595ljd.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 May 2022 04:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ysL/MDDZX+Geot7Zeu3H5HxZht23rz3nv2oCFFwflE=;
        b=ovmshWwzkN58+3wOOViYPxyU0kTw3nFoH9MgkTZWjgXnTJIJLZWPP23Nr7YIjZGl2G
         7YQFWReKvx9HFyY6x3Rmsq7aLyLfjw4cypPzxar3okcZMp4jKlVRZaaD6pVIFWpviVzf
         NwV+07k5oDPUAguIH7OABpMx6sFGvAN3DPkM/HrszeGI5xv5FAHf2mhaArrcAJrS9toC
         6xSo8vM+IvlMevwbgFIIUjesxioYlfU6vOiEPJ4p5dMDqO1lqpJKl3hKkIXbZ+m18Dol
         iZz4uSum3CPZRbkRy2buLoQMhgnoG9tq+JtwRk8+K7TxatV2cvYNdN4bxD4rRN1s9VvT
         3nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ysL/MDDZX+Geot7Zeu3H5HxZht23rz3nv2oCFFwflE=;
        b=6g9iaxK1S/hutqHUvW3bt6ngjjmryy0L7Dh+hZHBd66HGRp1/igKZF8smHVdxxsn8w
         PAPG8pcBCsMLaCeTQswReJz7GlWzV354+TBy8ZGKgx1V7AerXQ1T5FTg0DzQmqGxCf+a
         kWKF3+2ilecPsptbI5HnXzMK4Dogq8AdQXUvOfP6T82WUwjhwprLWw9ZqwhtAX1t2gIo
         AF1ZPykaB2JRZV35V3UKpGvctWm+kKfQdGNNbadU8BUGWQ/uAH439igIy+xaNJHvcqUg
         eLiYFibYw1d/VrJaNZEc1U+JaR0AsBl0+GRWzt3XamXMu9d6myv/Gzt0Nss8O2zaA6jC
         wVzQ==
X-Gm-Message-State: AOAM532aH9ENhxlgJKtBL+ieKpAuLKjxRFE4xMqX2YJFMo3kJDqzm3eG
        GEbAd9NQQFMMa03EbNRN0WRLAf/9m9MC0A==
X-Google-Smtp-Source: ABdhPJykL7x0YQXiXu0uXG4acTOiNNgMT+vUsR0COda25KAqnxHNJVfhdW8GcPFarglKC6ddEf7apQ==
X-Received: by 2002:a2e:7007:0:b0:250:629f:7ca0 with SMTP id l7-20020a2e7007000000b00250629f7ca0mr4824093ljc.419.1651923611897;
        Sat, 07 May 2022 04:40:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.149])
        by smtp.gmail.com with ESMTPSA id o8-20020a2e9448000000b0024f4bb33c50sm953953ljh.100.2022.05.07.04.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 04:40:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/msm/dpu: remove NULL-ness check in dpu_hw_intr_destroy
Date:   Sat,  7 May 2022 14:40:09 +0300
Message-Id: <20220507114009.1696278-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

There is no need to check that kfree() argument is not NULL. Remove
extra check and call kfree() unconditionally.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index fa4f99034a08..915250b7f122 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -433,8 +433,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 {
-	if (intr)
-		kfree(intr);
+	kfree(intr);
 }
 
 int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
-- 
2.35.1

