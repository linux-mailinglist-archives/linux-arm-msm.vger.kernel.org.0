Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37FA756FEF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 12:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbiGKKdO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 06:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiGKKc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 06:32:59 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A51FA6F27
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:43:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t25so7760811lfg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3w/z7/yo1sMupnazTL2mg22uvPZzsFuBbBmtMlymg9c=;
        b=Ng2f/hBKqNH4SZPKxtojLEnsrfKMfYZ2xQ3NAq2xCE5RUmz4fN6WOWrSfP3hu19RpA
         DmoEZN5+wQYgixvMub4pFkdDUEATuX4HXC6zondZxvvwu+YWNjTNI0BvMcoMCKfhnaHG
         u6UnQGlY3RG3lRfUWkKU+CZnznZ2BnaMFrDbvj4Buet9AOWyCSOu6ccbmMcMUHkqhvkA
         h4BAlz5lBogL71ZSfk/56DsDs6fg1J6+1J/tNdew4YMBnCzdFqjAZijH54bJH8S6YOSm
         jhv/KJ+XuQK0aJPeFz17XJs+NaZR8NnebH9wMn5iWPdQMCoJGLVZksOSi9F1yrDKsCgS
         0WJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3w/z7/yo1sMupnazTL2mg22uvPZzsFuBbBmtMlymg9c=;
        b=xiCcGE0pVSTjts4hIG0x+F8OcRrWcy03mV99BGTC7VJSts6kM9qGNrkho1fF65G5K5
         4lGL2k5dKe75CuA4woP3Hr3GhEwuab1y1gIF2qDxCeS+TDip2dbcYIQZYFWE91N7iFJD
         M+Ib9QQZcV8c7XeMX1GUVkBwBPwqHanlJ/yThtGyNuVJUNJ73RnbDwkF5MxZgNsU6NWx
         mM0wm8SanRluFk0xRhufZ700MfkTmbeBQtHCkJrv10jJODinCfjoo0u2M76q5Sy1lgeo
         F7MLPC1H5HtyXN5KHdsE6Z8tsPykLKwWQ6hqklPVGMY/9vF3bIXd4ftTLndCvtCfHD7v
         NBKw==
X-Gm-Message-State: AJIora9D4uBMsIh6EdVeEwAWkTb4vYXggzG7Kvk/TqZCanEfOQ6nLAxI
        iGkfZ08i5FrVKMvnMUwbmZ5Ktg==
X-Google-Smtp-Source: AGRyM1sPuurhLUwDbttEQfO8DD9DFTxC3crqNs+DZCIhaj9yoTBBJU59LHNoY1B+aj22dg50mS6fzA==
X-Received: by 2002:a19:500c:0:b0:489:e7fc:cdfc with SMTP id e12-20020a19500c000000b00489e7fccdfcmr147455lfb.455.1657532602428;
        Mon, 11 Jul 2022 02:43:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i27-20020a2ea37b000000b0025d4974a12asm1639490ljn.26.2022.07.11.02.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 02:43:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/mipi-dsi: pass DSC data through the struct mipi_dsi_device
Date:   Mon, 11 Jul 2022 12:43:17 +0300
Message-Id: <20220711094320.368062-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711094320.368062-1-dmitry.baryshkov@linaro.org>
References: <20220711094320.368062-1-dmitry.baryshkov@linaro.org>
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

The commit 0f40ba48de3b ("drm/msm/dsi: Pass DSC params to drm_panel")
added a pointer to the DSC data to the struct drm_panel. However DSC
support is not limited to the DSI panels. MIPI DSI bridges can also
consume DSC command streams. Thus add struct drm_dsc_config pointer to
the struct mipi_dsi_device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 91a164bdd8f3..bb20bc27ce87 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -179,6 +179,7 @@ struct mipi_dsi_device_info {
  * @lp_rate: maximum lane frequency for low power mode in hertz, this should
  * be set to the real limits of the hardware, zero is only accepted for
  * legacy drivers
+ * @dsc: panel/bridge DSC pps payload to be sent
  */
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
@@ -191,6 +192,7 @@ struct mipi_dsi_device {
 	unsigned long mode_flags;
 	unsigned long hs_rate;
 	unsigned long lp_rate;
+	struct drm_dsc_config *dsc;
 };
 
 #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
-- 
2.35.1

