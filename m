Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A10D515408
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 20:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380084AbiD2Sz2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 14:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380057AbiD2Sz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 14:55:26 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B570FCFBB3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 11:52:06 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bu29so15669021lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hjSZhFhF/WBNlx59PX4NcX4slNS4MZfzeRNT5ytZejs=;
        b=k7YLfZxbvtM5355pTD0NC0W3r4ppNFyePl/eewijAPJmmPuRZOuf01TBxYpR4jnWx3
         o2I7fMHX55U5QFrUI5pAtWxayXrJwzIq0eM5rj8COJ3eN4ijcxrW90QD33kJpDS48V7a
         K2R7RBXdGjG281Y6ScUOryRfql9Z86/0OISsB8lxF44gU10f3CapzB+FRCIcODZE/tg0
         4uve+Q+kV5xReWjP+2miP9fTdYh0/Wwcf/or5NFbfZqo8OJumuXlYlXbCegGluZkwaAj
         +IchpppaHq9FhQ8LuTy6T80SMqJNME9hcJVTl6r9F4W72EuFdPPGCdPpXqHCR2/LOC26
         YY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hjSZhFhF/WBNlx59PX4NcX4slNS4MZfzeRNT5ytZejs=;
        b=pm3Cf7gV2kWsXJ/QvdhBfY92XkiSDZwhfvyMgoV8xG+KTxwtImIVNQ6dl7h7nYZYIt
         ow7VvVl/omtaZIvPCGLYniEX+AwteZeP7zkktNZiw6ShOdPhb+Q1CpTYdvwGKqdAVo+d
         LYcqQYpeQIX+tUZz/9q5S8DNnA6QyA6BNdYvgb+Clc3i6G9K1Wsw9kiy/PAz2IxcGRBy
         16yhimy/ZNuH3Dassc9dNfSfQ0egSunsmR4FiaR66W59vzyb+ZUbeHJrd7kUIttgUr7V
         940SekaxMzx0G/0Yrp1d4kwf3ZSsX2ImF4jbJaunjkUGJDSl5Hky9/yoNRpoWw/vUcIL
         10nw==
X-Gm-Message-State: AOAM5310k5ngV87n6aFuUvmKIGIOkSABZb7rFI4NE15JXUHHHwwz7fZp
        HC8bGXFHZ8SxKMiHMTKdRf49Ag==
X-Google-Smtp-Source: ABdhPJzzf2Gqpio3FiOmbjIAFCoKFglhxH/wJqpGfDRxpm4zP2G1J1gbWPGUhYrluI3eZC4OE/CZ4A==
X-Received: by 2002:a05:6512:3b2a:b0:472:2c74:2b48 with SMTP id f42-20020a0565123b2a00b004722c742b48mr420328lfv.277.1651258325147;
        Fri, 29 Apr 2022 11:52:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 11:52:04 -0700 (PDT)
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
Subject: [PATCH v1 5/7] drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
Date:   Fri, 29 Apr 2022 21:51:55 +0300
Message-Id: <20220429185157.3673633-6-dmitry.baryshkov@linaro.org>
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

The functionality of drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() is provided automatically by the
drm_kms_poll helpers. Stop calling these functions manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index cf24e68864ba..da889175dd86 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -317,8 +317,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	drm_bridge_connector_enable_hpd(hdmi->connector);
-
 	ret = msm_hdmi_hpd_enable(hdmi->bridge);
 	if (ret < 0) {
 		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-- 
2.35.1

