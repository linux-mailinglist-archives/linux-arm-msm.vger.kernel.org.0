Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC1A4B70A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 17:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239370AbiBOOyK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 09:54:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239506AbiBOOyA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 09:54:00 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DDB111DDB
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:53:10 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b11so12653437lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zCLnsVTMtDHaflKFgpnSqZKust3IH7T2akrv1b5RakE=;
        b=SiLa0SXnDqJU4mzuOMaYe8l7tE//bxQIJvXKoa2FHfpF9ssesCZ6aoK8GIhWBtaZLP
         /Fv6Kkpjyi/4O/1gfV27g3we8oHaf6AV7PQV7AaoDluExl6Nzzdpd93fhtRI1SH5cYDh
         2vb8DwxEF9swvfPy227E0fYg3WOUdJfzbmWO8+N3nkUho/LL4XzZ8+67ip6Gfp0spsQ3
         kNdSc10k5lIldy09hVn0NkpBPWFp8Wfy5+DArDSOqhVohBywAjI63gRa+GAR9zi7NmvH
         LXgcQ+minUjFOM60ajWvZmVbQIJw6dQZCepkvNnS8O80aK4pDZIe1ciUQ5UbFtG7WwAm
         9pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zCLnsVTMtDHaflKFgpnSqZKust3IH7T2akrv1b5RakE=;
        b=FsM/OdYkjPzOoIa3hDMU5weMhmcOkN8tP8nMqTfLAJqU1Z65ITEN7/Wi3bynnDHfFY
         GzO7SOB1kvQg6plapnuugd3uGGNyrP6pEderJ7Dqe7Vh+aJM7jltublFnMDxOA+kRKCa
         LWrZawrknvkYBdrRG3wgm2hzOlooektlmp9LDaMcLjbnbSMh7pbxl+UnSz1wAESrNQpJ
         UtwqtMhgrPlbtLz02+RKnDS1X06MUJE9xqr2WY1fwEDAnDzhSmTvJpeqjVQucL0HY8gE
         GTEU3p0boHUbS2KiaO6PxrTfuxAnrF2k6CrdIB8zTi/G9ivmfYQbefMnwTIGXcwcFVZo
         yFjQ==
X-Gm-Message-State: AOAM533t1aXD6u92SeWhlM2u8tCZH4j+uXt1JfKgMhyy9LTu5Ia+OzAq
        cCdL39+LOTwooMUqUo+sDQMqUQ==
X-Google-Smtp-Source: ABdhPJw/PzUTNP/HXoGUBcKO6idIoKUQ07uo23PGIt1CsX5Zs/D52QXUhnI2EJrnNPO159PfLwUQTQ==
X-Received: by 2002:a05:6512:c09:: with SMTP id z9mr3397519lfu.303.1644936788846;
        Tue, 15 Feb 2022 06:53:08 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f27sm273182lfk.239.2022.02.15.06.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:53:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: drop unused access macros
Date:   Tue, 15 Feb 2022 17:53:06 +0300
Message-Id: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The access macros BLK_foo are not used by the code, drop them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index cac0298aeb52..975ff3a4ae3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -778,22 +778,6 @@ struct dpu_mdss_cfg {
 	unsigned long mdss_irqs;
 };
 
-/*
- * Access Macros
- */
-#define BLK_MDP(s) ((s)->mdp)
-#define BLK_CTL(s) ((s)->ctl)
-#define BLK_VIG(s) ((s)->vig)
-#define BLK_RGB(s) ((s)->rgb)
-#define BLK_DMA(s) ((s)->dma)
-#define BLK_CURSOR(s) ((s)->cursor)
-#define BLK_MIXER(s) ((s)->mixer)
-#define BLK_PINGPONG(s) ((s)->pingpong)
-#define BLK_INTF(s) ((s)->intf)
-#define BLK_AD(s) ((s)->ad)
-#define BLK_DSPP(s) ((s)->dspp)
-#define BLK_MERGE3d(s) ((s)->merge_3d)
-
 /**
  * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
  * hardcoded target specific catalog information in config structure
-- 
2.34.1

