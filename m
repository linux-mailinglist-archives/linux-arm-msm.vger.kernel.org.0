Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F33A7BE8E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376898AbjJISKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377454AbjJISKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:48 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829AB9D
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:47 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50437c618b4so6012183e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875046; x=1697479846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDffGe9s39I6J3ue64oALa7ElHnsr/uXc2xUK2PVAIo=;
        b=jo1Op/TkgJ4i6JTZljwbeCufS3aAK1ulikfayUF4O+pB7MtyOJhglx8SFRFs/wlLgi
         zxUJfvVkv0u2e91zKnpgss0fF12/LGPWAkvlAnj0Ut2/oYsC/wCqOn+jJOVRUy401TGQ
         QFETQdMGVMJAChczBkhKVUNzCxiOdLMMxLInqy6+RVFMVIrodWXi5VvsU7WIhngdz1mk
         C/61OEbiJp79krZo8Qr6n3/ztproJfnsryDg0LG48Kfc5D8EefG9/0v1ezSQxQdFo3UI
         WIbVMe+0Nb0XX29NBU6WEquC6evnnEtqUZS4FQigYgKH5KBTSrgqMw1lRmzm3o5PR5Jd
         clCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875046; x=1697479846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDffGe9s39I6J3ue64oALa7ElHnsr/uXc2xUK2PVAIo=;
        b=Niqw7r/lpaSAC8vyt8CTaZ/tJX9iTfGmnuljTX7A2SUbH3BYLILV9d+rIgrN1FCwtG
         fR/u9nLUy5MAuahZ680Y0QAjeUVVT5QSCZAFX/SqDPiGcpTcsE+7uFThB3zWb8Se8rti
         WEcDantiXn/7YkoaW4jqQNIAIFPR94tF2iYeOkdoex0PMcAwyC2IKaRmM8hRfIWcmJR7
         hlFAeWZRfWzuoZWTmi5/EqqxeLMo5pmN8G+fyqaf55ozz7Qjuk2HvnQLNtcG7t7878hg
         V7q1en8O2QNr80Flpc6WhTDqJ+9TTs2xaqvnW46VogTUBHWYG6QohmrXfGkH7HNCCA7h
         SMGg==
X-Gm-Message-State: AOJu0Yzz239D2z3mMvDQlhyMekS3SP0BEKLpRRsmVTZGEpMX1Shvk4lM
        RjvAJmfGJc2bezIZOsZFbh3y1w==
X-Google-Smtp-Source: AGHT+IEoGY8TGh+MeEfY49+EpGtxtl6bqUGlHjpkO9fRAkDexHyvI42sNQOanvPNMbrl/GeB9/SU9g==
X-Received: by 2002:a05:6512:159d:b0:503:1722:9c5a with SMTP id bp29-20020a056512159d00b0050317229c5amr19024534lfb.3.1696875045806;
        Mon, 09 Oct 2023 11:10:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:45 -0700 (PDT)
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
Subject: [PATCH v2 05/13] drm/msm: remove msm_drm_private::bridges field
Date:   Mon,  9 Oct 2023 21:10:32 +0300
Message-Id: <20231009181040.2743847-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As all output devices have switched to devm_drm_bridge_add(), we can
drop the bridges array from struct msm_drm_private.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ----
 drivers/gpu/drm/msm/msm_drv.h | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5b937c3879af..7617c456475a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -240,10 +240,6 @@ static int msm_drm_uninit(struct device *dev)
 
 	drm_mode_config_cleanup(ddev);
 
-	for (i = 0; i < priv->num_bridges; i++)
-		drm_bridge_remove(priv->bridges[i]);
-	priv->num_bridges = 0;
-
 	if (kms) {
 		pm_runtime_get_sync(dev);
 		msm_irq_uninstall(ddev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 80085d644c1e..a6a29093bbe5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -206,9 +206,6 @@ struct msm_drm_private {
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
-	unsigned int num_bridges;
-	struct drm_bridge *bridges[MAX_BRIDGES];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.39.2

