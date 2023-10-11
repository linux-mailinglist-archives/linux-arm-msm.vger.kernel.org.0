Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF1027C612F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 01:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbjJKXjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 19:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbjJKXjY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 19:39:24 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587ABA9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 16:39:23 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50325ce89e9so568899e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 16:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697067561; x=1697672361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/MpJ17XmYHnlx8i/0n3G5y7B3wsnf8U/DZ/uSJ5ETk=;
        b=MasJLUb8CEhO1jOx99VtLVAN2ZtZSi+204SkdBzbP3C8sHnK+qyK1QinyENPq7fHNL
         J1t/Er90EnbhSd88pBrIrmxm1ajCviwn4xPiufYQx592Z2DaApHH6GKhC3K2tZt+7q07
         QchDmB54+vFdnb5yp52tFIzSyxLKC5psWt9+4c2/Y8rgAy0yWv9z6EeMWtjIVoIEngmb
         h11vzKw5be8ju4NxtM5fKr/+ZbcaSmoIGcKh9+MWnk0V9Sm5dyZ3XVAWHN0jfdnxj8im
         Bcci3OgdKmd+rXAQsglWq5djsriSiYEG9Tqxg206ZUIb1Et3PNj+OphT7UErBDHcuw0q
         61NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697067561; x=1697672361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/MpJ17XmYHnlx8i/0n3G5y7B3wsnf8U/DZ/uSJ5ETk=;
        b=TNDS/G3qZbpswk5uBIrMOJe36CPpq3stxm3FQ85NjaDqNa4MiUGURAvoLd8sMBdonf
         HayvCi4Hl+kRnZApsz78MrfZnALO9mWQaQc5Sm+r6ogOIhv83ng4M8szJoa5JoctL/Kc
         V7NWlNQs8cOJcIC+9PHlWfy38DvoOv2vhf4dy41c/84hAb1kHC7N87WjeYpUnTERVOnp
         1jewzV6ALXotSAZYnC1m6iDKFjplRMyppxgg4+ibFU3pTLMWBFXt37lYr7NovqGlO5oo
         5vYDeJrAuCTM5IyWdk23ngmTcyt82SuuhbnzzAMLJIgYc/N5wy3vCPvmZK+0oiEdyx6e
         PeeQ==
X-Gm-Message-State: AOJu0YzInVLoQqC9V4bplDz0laX3Fit3WhnpjNGM2vl6iifR3Xakk+lX
        NVnoBiGeoi5iNRjHnDo4ZskXpA==
X-Google-Smtp-Source: AGHT+IFPDBRKTi3sZ7Nh+NrhcnYVb7RrWD6Ck7WGy2HQmEZMO6aLZb+HV8bDateZ3MxSKlrUyUdPLg==
X-Received: by 2002:a19:5044:0:b0:503:26bc:9ed2 with SMTP id z4-20020a195044000000b0050326bc9ed2mr16779185lfj.39.1697067561566;
        Wed, 11 Oct 2023 16:39:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m27-20020a056512015b00b0050567cdb8f6sm2466032lfo.239.2023.10.11.16.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 16:39:20 -0700 (PDT)
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
Subject: [PATCH 1/2] drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
Date:   Thu, 12 Oct 2023 02:39:18 +0300
Message-Id: <20231011233919.410099-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011233919.410099-1-dmitry.baryshkov@linaro.org>
References: <20231011233919.410099-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use exiting function to free the allocated GEM object instead of
open-coding it. This has a bonus of internally calling
msm_gem_put_vaddr() to compensate for msm_gem_get_vaddr() in
msm_get_kernel_new().

Fixes: 1e29dff00400 ("drm/msm: Add a common function to free kernel buffer objects")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index fd2201cb62db..19019c764f11 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1180,8 +1180,7 @@ static void dsi_tx_buf_free(struct msm_dsi_host *msm_host)
 
 	priv = dev->dev_private;
 	if (msm_host->tx_gem_obj) {
-		msm_gem_unpin_iova(msm_host->tx_gem_obj, priv->kms->aspace);
-		drm_gem_object_put(msm_host->tx_gem_obj);
+		msm_gem_kernel_put(msm_host->tx_gem_obj, priv->kms->aspace);
 		msm_host->tx_gem_obj = NULL;
 	}
 
-- 
2.39.2

