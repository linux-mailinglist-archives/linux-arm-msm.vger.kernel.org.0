Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC49515401
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 20:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356733AbiD2SzW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 14:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378934AbiD2SzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 14:55:21 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75790CC50F
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 11:52:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id k12so15573116lfr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 11:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=egoM2XNXIqCFT4+22sOj5Td+05iys3AKcQL89KtNa7Y=;
        b=skwtRUUkWT/EYLdN443is8LXG02fqfEXAigHCT4YqvC/QvQc0HjYZKLkJHNxf1V9QV
         jP6pCTYXh9TTvGYLBRzsUanMufNk1twjqWHMNyKtXDiKWKGkY3jDz6+OZDGypy/TJTqa
         +fDQN6wPUEU4PAxtUbg4jb0C1ylEo6KsPEOoKOSOX3paEMpfsT9/guSG9JBnDhYxwHOg
         ITKXhlGnYZvGD3GdaZM8SB6YHUj+Jka06c4nrqf1R7siWQq1v3NSWNQzHfesx9+JM5P4
         6b/48SP2xRRbHdZQNdhRZStKmFm2v/lCdUnFSehFsx11G2lAbChaAo5GrJj78ulN/Lxu
         eQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=egoM2XNXIqCFT4+22sOj5Td+05iys3AKcQL89KtNa7Y=;
        b=BlmHttdGHaxPMmWwis02XPMVmOd1RczsFBuU6GcsMoS1y2vlZPI78fUJ7Iym+lgtBz
         2WhAbDTx/fMI98yAnC2f5XPIABsMp4AtdG9mu0fB9OECBFP30EfWRX3wo4qyrWLm3EzF
         iVO1Y3sDy5g8Jal/FKRDrBXwkmUa208Rdnf0xYKy2wZ9as+k6mVjNlRJ8MNmEasMpf4k
         QSvNbaVaghd/gAyLWKEx39gckFU6UDkkXNCmSow+7aUkrm9LEs5izPc435QGb7w28nac
         I+DVRAkFHkkZ6qohIJwVhzhbS4pWAZ8t9fqnjTwFqQxpDyZlBe4WRsPAZM2gLuVJDuLU
         jZXQ==
X-Gm-Message-State: AOAM531C16O5ILTb16zM6K6f0jtoLgY48PmhPkoYTcj6MyBDGzX7xDp9
        U4aMpEEYXf1Q84Ihoij1jdQ4kQ==
X-Google-Smtp-Source: ABdhPJyjCsbQEtPyBhi3kbQoUQtQQ4PYG8E9Jw9FZt0MDn+fGgl5lwgg1u2usJx/LpkmGJqDdvO7ag==
X-Received: by 2002:a05:6512:3290:b0:472:b9c:751 with SMTP id p16-20020a056512329000b004720b9c0751mr394067lfe.591.1651258320849;
        Fri, 29 Apr 2022 11:52:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 11:52:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 1/7] drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
Date:   Fri, 29 Apr 2022 21:51:51 +0300
Message-Id: <20220429185157.3673633-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
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

Merge drm_kms_helper_poll_disable() and drm_kms_helper_poll_fini() code
into a common helper function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_probe_helper.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 682359512996..204f6999113f 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -754,6 +754,17 @@ bool drm_kms_helper_is_poll_worker(void)
 }
 EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
 
+static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
+{
+	if (!dev->mode_config.poll_enabled)
+		return;
+
+	if (fini)
+		dev->mode_config.poll_enabled = false;
+
+	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+}
+
 /**
  * drm_kms_helper_poll_disable - disable output polling
  * @dev: drm_device
@@ -770,9 +781,7 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
  */
 void drm_kms_helper_poll_disable(struct drm_device *dev)
 {
-	if (!dev->mode_config.poll_enabled)
-		return;
-	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+	drm_kms_helper_poll_disable_fini(dev, false);
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_disable);
 
@@ -810,11 +819,7 @@ EXPORT_SYMBOL(drm_kms_helper_poll_init);
  */
 void drm_kms_helper_poll_fini(struct drm_device *dev)
 {
-	if (!dev->mode_config.poll_enabled)
-		return;
-
-	dev->mode_config.poll_enabled = false;
-	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+	drm_kms_helper_poll_disable_fini(dev, true);
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_fini);
 
-- 
2.35.1

