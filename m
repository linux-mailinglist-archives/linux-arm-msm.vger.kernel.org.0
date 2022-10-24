Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB95360B36B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 19:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234019AbiJXRFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 13:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235822AbiJXRFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 13:05:10 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D219B1C77E8
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:41:06 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a15so8614369ljb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jshUQGH4UtEAs7tQmmFEpIMJkGozvqVnz1M3FYmS5xY=;
        b=tpjysAKOJ5VaFAPzmTJB/VM/VOuNF+MS6KNYzrqn6q9OuyQoxkmq9iayhnfoqRdYRP
         W3+YJycr9GYEwQZHeI4+a3MZ30C7NI1iETRhOHMVdXV1qUOzx8962R2dwNfRMSVAK0PP
         uuq2AHiqP+R5Yzq71Huizl57+nOYDicAur6FtnR1DERXhusyU1y1KXB1ubKrYVCk5luf
         ykWHt5FglTIRCvKdm9ydlpRZ3guNoa+wlj3wsLtQ3+b6c10PsdRRGBczM4eeMMOEHBRZ
         WXKEL1vrBZkh9nYm8AuR+TkwoYnpIDGIsrtXD6It2CSJ/18Ce8K4PqvwdCfIbBgpE+bH
         p+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jshUQGH4UtEAs7tQmmFEpIMJkGozvqVnz1M3FYmS5xY=;
        b=CLVujACB8uq+RyJA+BMACg8ocGhL1VXZtGr8p+b4o/huhkWwKQEI4O4+j3DIk1co5p
         oBHu4qevyyf3jBvcluxygZYIewILxz+zU50F7yO25kCkxWXxKMuo47bGN+v4HPW1q0uk
         V/eY3B51jWgcRtyU9aQiqoGQm8mxm0iwVRWf5cbo73IL6diVvHRecOYjMTXl/kHr/nn5
         HQQ9YguElsv/8bweNQiPSQnNSUPROQnlshwwCJH0CDCeqwjrbMXuYKNLp6vSUzgRq0CU
         lz65RbATmbhVOM6lAQTcDNVSbECvBU8+WTdlWk+o1k0FIzeBShCW4s1Xh2p78ea/H0IR
         lW5w==
X-Gm-Message-State: ACrzQf3PKEzk7TQxm6S8u27kJi93BQMEGApq05D30l/BpE6OGgjHmUoP
        63yjwMPVNcZAde/AiXALcF+cew==
X-Google-Smtp-Source: AMsMyM79q8/bozlYbdMbYTfc4ZQ/uK1sOv8g0duf81dQ5KIoiK1riaEhzTxB4eepVuG/nr/YlUA6uw==
X-Received: by 2002:a05:651c:12c6:b0:26f:c55a:a59b with SMTP id 6-20020a05651c12c600b0026fc55aa59bmr12126668lje.281.1666625971780;
        Mon, 24 Oct 2022 08:39:31 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:39:31 -0700 (PDT)
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
Subject: [PATCH v2 5/7] drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
Date:   Mon, 24 Oct 2022 18:39:24 +0300
Message-Id: <20221024153926.3222225-6-dmitry.baryshkov@linaro.org>
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

The functionality of drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() is provided automatically by the
drm_kms_poll helpers. Stop calling these functions manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 93fe61b86967..a540c45d4fd3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -348,8 +348,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	drm_bridge_connector_enable_hpd(hdmi->connector);
-
 	ret = msm_hdmi_hpd_enable(hdmi->bridge);
 	if (ret < 0) {
 		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-- 
2.35.1

