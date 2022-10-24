Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A7A60B97C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 22:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbiJXUN2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 16:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbiJXUMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 16:12:53 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDBE1D5876
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 11:31:12 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b1so18099117lfs.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 11:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3be5trhw3wsDg3ozZhQ1oc92P/aiH8PmAIGusb2quw=;
        b=YSyy0MzpgrvBvNqYkcjjjMujeQNgz2w0aplR2UtgE45kTtD5Tpn5OHIRnV3nLiNAUc
         lvYZRcE54vsOSTS3gXSM4HFBQ3my8Guc1axsWht9KNuaKWxiCl0w7Mr9UezQr3CI/Ew4
         jOVO0asv1ZiPCgBR1lciM3e8wOAKipPUnpl/lcMmLzCnHJdfpdCk5gvpKC1jlH47f8HB
         q8QT3t3Mavn3gmwYJ9gzH+y1Pz6HjtyKcEnFvmMTPFpUizIBIJnHA8w/9+PTjrhI6Gik
         /k9NMsgvBFfFq+4AX1caF8UNru0qPubzJPzqIdV5Kk1mnBRAttYgpz8FmoLxUxFs8vjS
         g5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3be5trhw3wsDg3ozZhQ1oc92P/aiH8PmAIGusb2quw=;
        b=K1Yfg2JhEX5Zc52yelEXPhfz7hYSLpfo4uwLlgRjrThvZ0iaATmhKhTdufo919+Yzr
         mJXibgkZqxvREFp1WV8myNtqlXksBCNjmEirwb9NoKzDv5MbKVbyJL2vWoC2+OiPHoI1
         z+9V0x8Na1DP9+387dfprrGF7V349IkyQnr5CFNqKwORMV5m98kR/6NE08V7KX5nIhTx
         lNC3PhkuUt7UTFX/8N9vxF4GzWsJUIoDQ+jaho0aMsho5cdBlHQd1j+HbFTzLshIUdGh
         oGnK924n6dE1CcPIEKB7A7R0IXtGIMob4SPsB1kK75zzhHlMEgNsh9s/7fTl8aScrkMu
         WVQA==
X-Gm-Message-State: ACrzQf0XBxVVhVrZ6mW7EB2AsnmkNsaaAXWZerfoQvC4gQU8MiukYhn3
        s83pISAQ5gmeBMWFt/pG2NLhqZQn3coq7Vbb
X-Google-Smtp-Source: AMsMyM6oJ0SFF+Zwbo4Q7rqEzTwB8GtqAaRQSOc0HeMjfEBGYSBo6Ghd+iIxJhdZF4gHbWg69CLGnw==
X-Received: by 2002:a2e:9a81:0:b0:26c:5b63:7a83 with SMTP id p1-20020a2e9a81000000b0026c5b637a83mr13313560lji.291.1666625968692;
        Mon, 24 Oct 2022 08:39:28 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:39:28 -0700 (PDT)
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
Subject: [PATCH v2 1/7] drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
Date:   Mon, 24 Oct 2022 18:39:20 +0300
Message-Id: <20221024153926.3222225-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
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

