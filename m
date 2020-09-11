Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86051266490
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgIKQl3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbgIKPLc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:11:32 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11CDDC0617B9
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:11:27 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id 19so8111489qtp.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GBjsv3xCSYkRCQ+2tezVOSNTy9uWd+LLZWMg/UVRDak=;
        b=rQg0y29QtV3mSmib7w19eLw48nVkkAX9PLuOloEbZY7ZDaNagYLZA+vF2vvqaRk6ru
         likOP/r8d4V9YRT796rlxL5QKHAxpRngBZ5RWoCVzjAf68AE4QIweZL06JHsCj6BuGmj
         DYDcpG4aC1AStU2CeZUDOgjLz9SwAO2vj909DVcIy3LQ97/TYRHP8orLxmiHJZ5DRKBK
         tXbxlhMEFlECVWwKyo3LGK267lO1D8QQO8kFQg4FTTLs+kOhvjiaaz6n9h+3RiFPRH0D
         HCWIyC/gd5X6HUiZyLWPNGlcfXiiDWWO4kpUMFuqkhuORbCfv4ZNXVOiQYe+7iazze9b
         YZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GBjsv3xCSYkRCQ+2tezVOSNTy9uWd+LLZWMg/UVRDak=;
        b=jmSt3XtgPnuV+H+H5VDSCDIHrUh+gKzFp+axQwYfwiUmMv7S7Vb0sLk87G9g2062pF
         0LY8OmBUpBHqWWZeKzV4wyxN1oqbFYaWLRQp8cMCxMX0TjShKTz5sPOsOfzZ82r6PfgI
         LEEx3qYG4fpxAdWUm1SsMuHao7jaegzrsYpVfln48cwi9lBwFBHAujvZ4arzUqc24aZT
         LA16kVIyTctDT4sLWveBJXdJ4CHKTwrznYiLEkTMW//XskhlVhiL8sQpQvBuY+6id4TE
         QDoVyQCuv8mgfAjmonkLlfGig6d2UxeztQGQ7ZoPVFZdv2DWQM6W2dUvuovu8G1JNYiL
         Ukjw==
X-Gm-Message-State: AOAM5302vJ3bWIvcQ2mlOeidE6PjW8Dqi4GwzDD/vvAqoUb5widpkPsC
        f7jf6tXFPi+03yTpotetCwMaWkcCKeclJMcqNZ8=
X-Google-Smtp-Source: ABdhPJx5llxFEeEL0XCkUvdKq1BQKgIPUOoUMkmtSPcsqKUyP1ToDqwIXZ/ZYbtoA2Ey6/hK0GtYcQ==
X-Received: by 2002:ac8:4d05:: with SMTP id w5mr2275918qtv.339.1599837083503;
        Fri, 11 Sep 2020 08:11:23 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 201sm3216429qkf.103.2020.09.11.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 08:11:23 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konradybcio@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm/dsi: remove unused clk_pre/clk_post in msm_dsi_dphy_timing
Date:   Fri, 11 Sep 2020 11:09:37 -0400
Message-Id: <20200911151001.13156-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200911151001.13156-1-jonathan@marek.ca>
References: <20200911151001.13156-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The clk_pre/clk_post values in shared_timings are used instead, and these
are unused.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> (SM8250)
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index ef8672d7b123..886a9e3b44b5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -50,8 +50,6 @@ extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 
 struct msm_dsi_dphy_timing {
-	u32 clk_pre;
-	u32 clk_post;
 	u32 clk_zero;
 	u32 clk_trail;
 	u32 clk_prepare;
-- 
2.26.1

