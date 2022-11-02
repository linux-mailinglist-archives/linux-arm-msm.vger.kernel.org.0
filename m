Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85694616B92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbiKBSHK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbiKBSHJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:07:09 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FBD72EF2E
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:07:08 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g12so29557284lfh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3be5trhw3wsDg3ozZhQ1oc92P/aiH8PmAIGusb2quw=;
        b=U1V1Ie1snUM8Z8kW5FbPB+Uxui9aHzWBAvoKIzPL5WQtt7r1fbJDtKZfYL0BvXjZAX
         pJXlM3cUhAHFVupb1uRPIy1ukhaIzZwAyJB4gdhhGcw8JI31vp2Na7Z3w8CO8QhTzR9R
         KvUPtk1lO6e50dKm5UdWhcexeNthTu3tdl2sTg0S9cJJb0qQ29mQaq7fEiKOijMTBq78
         AJjAm41uNWULtKqI30GYst1N49ngizQQX8dCwb9yXGsU8VHccitTrRtFDC0ASm442BuI
         o39Z887V1sbVS7fCnHaPRg7YhrxZEF1JL7e/zjTrWzvEQM+tv70DuSnESXnFQKx4s7ga
         TX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3be5trhw3wsDg3ozZhQ1oc92P/aiH8PmAIGusb2quw=;
        b=b/d5iqBe7rawq4o3vocFBtRgHYTgkyFKh/q5k5eCzBs9L0Hh0zqMrEhirSGyQYvOh2
         cehyI5Cn+Fjk2G7mO5z2Y5nlWve4YxIDXOIAnHWc+cydJKtOWUCpxthrcxZD3uHwskKz
         iHHvQUXqWk8eOu/+BtfYHZq2WkgkngpLDohDZmMcJeuz8XtJ3qRnKYiQF2qH/bfXFVP3
         AZhpQoyB9d3TlbjlH4j9mvisKKXmMDTPe46ISCtXqpOKHKBRue/TPPuan+aj43OZRQ8b
         pb1nud6np+eHZljFeiRCq7D8IdcMUL6RUdU3HeLOMsGs6hrOlANQOQ2hC0mwh0bJAdrN
         mUNg==
X-Gm-Message-State: ACrzQf0hbqWBPLYOVkShXNrUNd1gtA2bjsHtu1UlKfdZ0h0MBEi/j/4S
        gjzaFIOwGl2Yf+dRjWSsKPjcHA==
X-Google-Smtp-Source: AMsMyM73Sw3dwb1cK+9rqJCeye4EQEf8Qh00yXAocdLw3KYHslx7r/wcJUC94neRnIpmMp6sND42Rg==
X-Received: by 2002:a05:6512:3085:b0:4a2:7d80:d4b4 with SMTP id z5-20020a056512308500b004a27d80d4b4mr10523057lfd.534.1667412426862;
        Wed, 02 Nov 2022 11:07:06 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:07:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
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
Subject: [PATCH v3 1/7] drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
Date:   Wed,  2 Nov 2022 21:06:59 +0300
Message-Id: <20221102180705.459294-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
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
index 69b0b2b9cc1c..f97fda3b1d34 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -803,6 +803,17 @@ bool drm_kms_helper_is_poll_worker(void)
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
@@ -819,9 +830,7 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
  */
 void drm_kms_helper_poll_disable(struct drm_device *dev)
 {
-	if (!dev->mode_config.poll_enabled)
-		return;
-	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+	drm_kms_helper_poll_disable_fini(dev, false);
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_disable);
 
@@ -859,11 +868,7 @@ EXPORT_SYMBOL(drm_kms_helper_poll_init);
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

