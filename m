Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF26260B379
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 19:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234714AbiJXRHM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 13:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234785AbiJXRFn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 13:05:43 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC9C15A18
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:41:41 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id d3so6826685ljl.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCo7VVHuBZW+OG9SunJbQgq/wFHseiwuFZsFQO3WoK8=;
        b=jbTsuMpSTlZUL62/fo5JZqCwVPNkW3xLmgH/tZ/cNPg5xLCNHLHOpAw9HGT6ESP6s6
         b32vL0kKy1JoM4iPMcFn/MQT29nVDRBq787s6fVwBrKnou05GgLonXZ5lC0SUuDBZdSQ
         VtzoyZx9o5DpyTBUXP7B7OrwnDILVCBlzDoINX3HQ1MMTVVz5yGU4ZkNBode12YN68KL
         aKSTKB0Dj5rFzdXFUuHxAoy1s+T2YZqcgPVW3R9KiBoP32fV5mMGGHUr1BmTFw6J7/z/
         yUgCDhPequlUBxPuedgc7fLYz9ZnKhmjc0dyCPUtPdZFTjNjXsj5YgvSLw2k9sXlI2Yz
         w3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCo7VVHuBZW+OG9SunJbQgq/wFHseiwuFZsFQO3WoK8=;
        b=T4FDwUxJ56k+2XYcNyBiZ/wz4pQWLB1csjlkYbi0Op1wXcgR17n3dQGe7x6w96CecR
         jJWtjYzO017WfuFfMh1sWFoJb0MV3YysjVCGf3Lv23Nbz2ZOLXAg/6C9p4FtHFbu+Fa8
         S7DZ637IES+izWXaiVuuDBnrVpc3Au/qMWXjSvZLWiR3TLpB3o6q2B5JePdgzvXpDGlV
         wtXAjIPzlEtqIMJ+FYHpga9Wge1igeequ+M5MCmr6Nd82d/mQ4JQ6UQAKTa2mRTzhbMu
         ZA8W88vV/coZ7/w5BGgM1csVBG2cUoeY/l8xAErJ9fibeFM5mN5XpdpATIvOOGE8j11N
         h3WA==
X-Gm-Message-State: ACrzQf0giSRgXSa52Da/wjHBTS24Z8QEVAf7is90dM9+N99bnJqWIJi0
        Octkuz7ivtV2yNW8aNZDG16J2Q==
X-Google-Smtp-Source: AMsMyM5Z9UayHdOtWdD5WFtJKLY7zt7l5GAE6lRLszfxe+uzm9UMm/n1wBg1DFfcJEV5C7u0Arnj/g==
X-Received: by 2002:a2e:a1c9:0:b0:277:101f:e3b2 with SMTP id c9-20020a2ea1c9000000b00277101fe3b2mr1018524ljm.129.1666625969488;
        Mon, 24 Oct 2022 08:39:29 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:39:29 -0700 (PDT)
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
Subject: [PATCH v2 2/7] drm/probe-helper: enable and disable HPD on connectors
Date:   Mon, 24 Oct 2022 18:39:21 +0300
Message-Id: <20221024153926.3222225-3-dmitry.baryshkov@linaro.org>
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

Intruct two drm_connector_helper_funcs: enable_hpd() and disable_hpd().
They are called by drm_kms_helper_poll_enable() and
drm_kms_helper_poll_disable() (and thus drm_kms_helper_poll_init() and
drm_kms_helper_poll_fini()) respectively.

This allows drivers to rely on drm_kms_helper_poll for enabling and
disabling HPD detection rather than doing that manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_probe_helper.c       | 19 +++++++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 22 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index f97fda3b1d34..a7b4590d8ec1 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -251,6 +251,12 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
+		const struct drm_connector_helper_funcs *funcs =
+			connector->helper_private;
+
+		if (funcs && funcs->enable_hpd)
+			funcs->enable_hpd(connector);
+
 		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
 					 DRM_CONNECTOR_POLL_DISCONNECT))
 			poll = true;
@@ -805,12 +811,25 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
 
 static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
 {
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+
 	if (!dev->mode_config.poll_enabled)
 		return;
 
 	if (fini)
 		dev->mode_config.poll_enabled = false;
 
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		const struct drm_connector_helper_funcs *funcs =
+			connector->helper_private;
+
+		if (funcs && funcs->disable_hpd)
+			funcs->disable_hpd(connector);
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
 	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
 }
 
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index fafa70ac1337..7aa1f01223f9 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1143,6 +1143,28 @@ struct drm_connector_helper_funcs {
 	 */
 	void (*cleanup_writeback_job)(struct drm_writeback_connector *connector,
 				      struct drm_writeback_job *job);
+
+	/**
+	 * @enable_hpd:
+	 *
+	 * Enable hot-plug detection for the connector.
+	 *
+	 * This operation is optional.
+	 *
+	 * This callback is used by the drm_kms_helper_poll_enable() helpers.
+	 */
+	void (*enable_hpd)(struct drm_connector *connector);
+
+	/**
+	 * @disable_hpd:
+	 *
+	 * Disable hot-plug detection for the connector.
+	 *
+	 * This operation is optional.
+	 *
+	 * This callback is used by the drm_kms_helper_poll_disable() helpers.
+	 */
+	void (*disable_hpd)(struct drm_connector *connector);
 };
 
 /**
-- 
2.35.1

