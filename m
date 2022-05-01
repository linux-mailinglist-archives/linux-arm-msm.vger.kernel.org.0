Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7DF15164E7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 17:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348024AbiEAPPv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 11:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbiEAPPu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 11:15:50 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C2C9632E
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 08:12:23 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id q14so15814315ljc.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bcp90gaPZLzvVD4QztWlFtHIaIGASrYLr4Z5ANOtEbg=;
        b=lKnZjMgrJdGl9HP0JnYC9LYTnOiNOrDjnSOhuibPINeJ8AumJGsZKdLIzQ/Km3d+VO
         p9cDZGdyiINY7KsZzFUAASrG4xP2YxRMAxEmcakBd5DTmOOZdPH9AX8NJraF508LB1tT
         hrkl6vV9nUNlNfsuyZ29rgBk8C5KeJDTFswg56dOq0vuidD9Sabbm3grEe7GWdin8lYx
         xcEbtizWOqcnotUEk3mqaizkOD4jL4YspRz/YO+xwtG8G7PARMH1lHNg/+/s7fxmU8mb
         0KFC6x+btQw0jpjfLMC3tS9dpMnUV0hRo1NMcrLRbJSJP600cQGOXoTac6OfYSyj5ooj
         jA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bcp90gaPZLzvVD4QztWlFtHIaIGASrYLr4Z5ANOtEbg=;
        b=QysS/SSLwp4vOFX2CLJ1pGX7zQ0AGgYq8SnQuGmf0Gd3a3u7bSH/ANAt/3L3nOsr5i
         3nzVa5iSJsE5Ra1vvc0DWqb2n/M17j6/C+QMhAblvMntxaVf+VffDZIK9A7LzwnCLunU
         csDk3Q8FX9Y/e8C4ZwmVs5BMDJENkpNY2mQaiz8pI6xIhlBuWt0GDMltd2GpPcuBR0qn
         LBj38Ogeb5eMjb1toGCXFxFJkBh4NmwhOLAsPElbNqsgW3Eib6SjDfjK789llkpvXg5W
         QLu+sKNb9cv0b+sucZ2bc2ChY8Bz/mNeiHgJ6Cy9ce7WyVXLuMLdupoVGNORPUR+WwEE
         Q57w==
X-Gm-Message-State: AOAM531QjR6yXA9HDum+50OO8Ty8cnYcw0uzJnJwK6HbL0UsFGDPSDkj
        LRhVKfcjVw+yROzjtVE1FO0c0A==
X-Google-Smtp-Source: ABdhPJwy3LKBmD0zbYUKLq70u5uq7jRovsAeKwEnH4chta+EQoxhvuNX/52f0cVP3W3Wp+06QV2Qhw==
X-Received: by 2002:a2e:b557:0:b0:247:e509:4a50 with SMTP id a23-20020a2eb557000000b00247e5094a50mr5770859ljn.72.1651417941572;
        Sun, 01 May 2022 08:12:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l16-20020ac25550000000b0047255d210dbsm461975lfk.10.2022.05.01.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 08:12:21 -0700 (PDT)
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
Subject: [PATCH 0/3] drm: move dsc data pointer from drm_panel to mipi_dsi_device
Date:   Sun,  1 May 2022 18:12:17 +0300
Message-Id: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

To properly support DSC the sink driver (panel) has to pass DSC pps data
to the source (DSI host). The commit 0f40ba48de3b ("drm/msm/dsi: Pass
DSC params to drm_panel") added a pointer to the DSC data to the struct
drm_panel. However this is not the ideal solution.

First, this leaves DSC-supporting DSI sink bridges (like ANX7625 which
support DSC decoding on the MIPI DSI inputs).

Second, this does not play well with the panel_bridge. Drivers depending
solely on the bridge chains will still have to lookup panel and fetch
data from it.

Last, but not least, the DSC data is not relevant for the wide variety
of panels including DPI and LVDS panels.

To solve all these problems, move struct drm_dsc_config pointer from
struct drm_panel to struct mipi_host_device. This way MIPI DSI host
driver receives DSC data during attach callback without additional
lookups.

Dependencies: this depends on the MSM DRM DSC patchset [1] being pulled
in through the MSM DRM tree.

[1] https://patchwork.freedesktop.org/series/102262/

Dmitry Baryshkov (3):
  drm/mipi-dsi: pass DSC data through the struct mipi_dsi_device
  drm/msm/dsi: fetch DSC pps payload from struct mipi_dsi_device
  drm/panel: drop DSC pps pointer

 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 +++++++++++--------------
 include/drm/drm_mipi_dsi.h         |  2 ++
 include/drm/drm_panel.h            |  7 -------
 3 files changed, 13 insertions(+), 21 deletions(-)

-- 
2.35.1

