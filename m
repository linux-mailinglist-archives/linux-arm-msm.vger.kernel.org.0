Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C812956FEF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 12:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbiGKKdQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 06:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbiGKKdB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 06:33:01 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C37A6F34
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:43:25 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t1so4219055lft.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9+bbIScSwkF39w8SjB66Rxemw/+fmYIPubKn0cG6DqE=;
        b=JP2CQ4kiLEjfYNLDnxzWUxSOAuwxzy77NI3Y+HKD43X5nExwOM8zydY3s4RzJoNIq7
         UhLpz9Mh6+ugTzYfH8iY537k6CgYfUT1XTDETin1ZPrAZJkBUiWP/Wz3CJebi8viwvD+
         LjPiXNEorR0jmGriscdyorfw+us1PDrOJJDNx1wMr6XQfC3UV2dk3YbZ0IgCxSY7BYl1
         xZvH/Cjem21N/xI/WFQo1pEpJUlbPOFOabaqlhs4tJSofdeUpQUHCPeL6jNFJmQka0AN
         Af3aRQpib+AGRDOUckimOc40yJTR7ImELEYSeNvCAOWR2UOk7VzZ6pC4SSGDhO3+P68Y
         IFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+bbIScSwkF39w8SjB66Rxemw/+fmYIPubKn0cG6DqE=;
        b=oQ5q2jJ3p3h6NgYoU3q2Kocv20XaKRkN8y5LIHmUQE4Yb6DJX1TmOvBDGiO8pPf1Id
         WVsdBeDrA7wD/TpPNe8l6kidkrQPAksxVfajAz91jsEMoqDBXOhgboaFNEbDvJ0UdbLb
         O5LpEYNZPIvfxfm9YCo/ye9zGGS/ocw6Sn9NKF1XvLEZppGb92jxLgb3YoKjE4U+l//K
         J8omv6QxeOYNYzFq9y5ha+homB9zFNMbqIGUm6tkES7CC5w/nqubvadUj3190SWHRr5P
         8fRrFNWAF5z038kwuj/NlBQF9njGUWr3hLP87omM1I19HWNwWN9ekCakQuLw9AP6y1v8
         xCSA==
X-Gm-Message-State: AJIora/7QBZQ4ETQ0E3ngDh8yKdCvNHW6Qy+Otkm17skU2uwlopBAjnx
        sR4aWRFShd2jozqc3Nq2NaVm+g==
X-Google-Smtp-Source: AGRyM1vXAJvUBpeIJcEyKqCyrmrSYJmCKbDvTwh4T6xxymuMObae44zRqBKfocePy2IzUO32kt0m9g==
X-Received: by 2002:a05:6512:b8e:b0:489:dbf4:e6f5 with SMTP id b14-20020a0565120b8e00b00489dbf4e6f5mr3688613lfv.612.1657532604217;
        Mon, 11 Jul 2022 02:43:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i27-20020a2ea37b000000b0025d4974a12asm1639490ljn.26.2022.07.11.02.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 02:43:23 -0700 (PDT)
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
Subject: [PATCH v2 3/4] drm/panel: drop DSC pps pointer
Date:   Mon, 11 Jul 2022 12:43:19 +0300
Message-Id: <20220711094320.368062-4-dmitry.baryshkov@linaro.org>
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

Complete the move of DSC data pointer from struct drm_panel to struct
mipi_dsi_device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_panel.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 3a271128c078..994bfcdd84c5 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -188,13 +188,6 @@ struct drm_panel {
 	 * Panel entry in registry.
 	 */
 	struct list_head list;
-
-	/**
-	 * @dsc:
-	 *
-	 * Panel DSC pps payload to be sent
-	 */
-	struct drm_dsc_config *dsc;
 };
 
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
-- 
2.35.1

