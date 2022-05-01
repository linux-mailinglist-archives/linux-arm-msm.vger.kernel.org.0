Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3716F5164E5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 17:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345226AbiEAPPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 11:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235718AbiEAPPu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 11:15:50 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0527D6337
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 08:12:24 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id w19so21595262lfu.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XGarRpvctMdxGlcndXm8WtgN3hVc/0JI0oFVA6fZ9m8=;
        b=RsHhj3VoDc3LIISFBmPUISWBPnxfnKqaLqDLkptb7/ia7ul5svNa1NVf/cMmGbW3td
         LuSTh8xLcmxUgPLq8MMwnlav0I2d8Wv+h1gc13z7PMZWuBpAxykTdrhDig8y0vqfitPv
         uMzGSaBsG6SkL2QHNwM09XPg/1lYIhX+w3Esssch+velHOTjAeI8+J/ACVXrGmMERmec
         5JlM/U0lMk1LevuwIdqGIMHXA3F7E9FvlUvD/xY8fcE/cLbmvrVjB8KwKT6woBAXRSOr
         bhhwJIjR/08U3OcJI6Rm7vLzrd6LJRBt4hx8jPgK6FM/IMCNpsxVeSZUwDuq9xBLUrBA
         wBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XGarRpvctMdxGlcndXm8WtgN3hVc/0JI0oFVA6fZ9m8=;
        b=vtwthqEx+Xwh2eb1+INFEHvgbJWv8PFGs0YKBEHh3raiylqoAqR0uMTX5GNKiTOZ6c
         dH/vZExsW4plPymsz7ApinMjNJPrzzRKsk0xgGGE/hI3GYWu+8wYBl371pm8oopbOc71
         Eo/cjyt9Hel8AtzZjltgR+12o9qjT5MVyszeQ16A/ySpq98Pvs4ri1MQGDD2qqSbhWmK
         fPtXUlibzwt6D8KUPtXAn3RfpTf1TlXZVVfpxzISFVv6VdUXT/Mt+YI08qPabf7xTJcS
         Ugkyb/Q8wasac2dcv3gn8RlOcx/y0SO5koO5FCvNBQiemd7hKPSjV1fWHo0PlkKRAkNz
         1qpg==
X-Gm-Message-State: AOAM532wLXqb3z1guYmOWl5vWGvcQUWPxJm4fCzDcK6uPVtfLrnqhc+T
        gNP/6YCU90lR/zle3BrNddmCmQ==
X-Google-Smtp-Source: ABdhPJzF3yd5sTdv0tEELeBUYEWDcbSrKXbhUZWTy0NT5w5e1JZRH9LQky4B6RnAS+09nIdjm7e/IQ==
X-Received: by 2002:a05:6512:a83:b0:472:1817:145b with SMTP id m3-20020a0565120a8300b004721817145bmr6554902lfu.437.1651417942371;
        Sun, 01 May 2022 08:12:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l16-20020ac25550000000b0047255d210dbsm461975lfk.10.2022.05.01.08.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 08:12:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/3] drm/mipi-dsi: pass DSC data through the struct mipi_dsi_device
Date:   Sun,  1 May 2022 18:12:18 +0300
Message-Id: <20220501151220.3999164-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
References: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
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
index 147e51b6d241..8b1c9be9b2a7 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -177,6 +177,7 @@ struct mipi_dsi_device_info {
  * @lp_rate: maximum lane frequency for low power mode in hertz, this should
  * be set to the real limits of the hardware, zero is only accepted for
  * legacy drivers
+ * @dsc: panel/bridge DSC pps payload to be sent
  */
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
@@ -189,6 +190,7 @@ struct mipi_dsi_device {
 	unsigned long mode_flags;
 	unsigned long hs_rate;
 	unsigned long lp_rate;
+	struct drm_dsc_config *dsc;
 };
 
 #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
-- 
2.35.1

