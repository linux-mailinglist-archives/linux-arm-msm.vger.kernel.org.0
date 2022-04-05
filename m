Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0694F561C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245083AbiDFFi6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1453914AbiDFCnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 22:43:04 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400F128CF62
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:45:57 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id b43so1038549ljr.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3hI4loPQKfesNHihNQukITqdxiwz9vk8ypDb2Yqay+s=;
        b=JFBR9cW1qO6/WeFEIv0ozzxLr288vzqyaaEq2Wtjt3+bH0OGiYsl8rfUvBJYF8mkcD
         /EqeFYvgtii+DQ+ZDoEmy8Y/kv2FV7nTT54PEDic5H3AIG5XzNylEt38/ks/+jpbbyUF
         pmLYnBOGMv+t/yzkjrr5oVgavXVK32Ysc0l2iMfOq0Nz6REgyKAc3CSGrQG5oPImekAF
         2HbvJBXr+EDpCv8sI1QsEfLQAWFkGHVh6Q1/MM1BHXfDw9h+wC2bXqB3/eplTQOwUr5O
         khU4G6iNjHc06Z5se+MX6Uo4bzkXuexzMKiEGc15pXfPPacXWXQN0wUgzqxg4WuJ7Tap
         Exjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3hI4loPQKfesNHihNQukITqdxiwz9vk8ypDb2Yqay+s=;
        b=R72GVMhdkCQ2Mxok7xtL0XxWJKxa6UpZUOwzLpsH3yfZ3+etsMN52nApGKXyQ7FIb5
         OD2lziAhPn1wSK65uI93z1No2iVih3p+L1/EFWbze82ySdo8D9BjZFwMYeIIdy6p5P+Z
         4na7C3qSepX9roqf1jrfFEOhHobr+SdcSumYq4vJuGNT292K430FYN5OOFuYEj09Nt4i
         Ik2MmbOM4luh9e6STuKf0QVaJCD/evd5JJNc3QQlF1woQ59+o78BahmEjQ75ePWoQ8gs
         kE0OGD9zvlE8u0E7/65x6IJhk8rY1pMeBTBlQdZXJH97t+8fxdLEW26ydeAgitnQUDo6
         locQ==
X-Gm-Message-State: AOAM53203EBKzm1krsB9Ze0hAq2R1da9H6QqVPdxRQPfE94lQA+0brSA
        5QdLOlpRYY/QQBC0R4gyj5IapA==
X-Google-Smtp-Source: ABdhPJzxlKTyT9cYYHxN2DLSvcm8mw6mjktnkfjs1jTREW+tywB+hcj2PYPVdouYdXCOPLfHJvr6YQ==
X-Received: by 2002:a2e:924d:0:b0:24b:238:3be8 with SMTP id v13-20020a2e924d000000b0024b02383be8mr3707357ljg.181.1649202355412;
        Tue, 05 Apr 2022 16:45:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g11-20020ac24d8b000000b0044a3454c858sm1651897lfe.81.2022.04.05.16.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:45:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 4/4] drm/msm: unregister all internal bridges
Date:   Wed,  6 Apr 2022 02:45:51 +0300
Message-Id: <20220405234551.359453-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
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

Unwind all drm_bridge_add() calls for internal bridges and remove all
bridges added by the msm driver itself by calling drm_bridge_remove().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index affa95eb05fc..71e1b7393f6f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -232,6 +232,9 @@ static int msm_drm_uninit(struct device *dev)
 
 	drm_mode_config_cleanup(ddev);
 
+	for (i = 0; i < priv->num_bridges; i++)
+		drm_bridge_remove(priv->bridges[i]);
+
 	pm_runtime_get_sync(dev);
 	msm_irq_uninstall(ddev);
 	pm_runtime_put_sync(dev);
-- 
2.35.1

