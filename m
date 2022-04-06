Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E35334F5FDE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 15:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbiDFNVc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 09:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232730AbiDFNVY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 09:21:24 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C36B12987A
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 03:06:00 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id bx37so2509782ljb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCWdbxiqhWgKkOF44rX/3oEnHasSzOiNrgOg0mVvfWM=;
        b=PErHMAJDRW5HOTkUwC6NoEhEvAPvYrAD/LaDrxIyWhah+z9mq5MK+fuAFD2lMhLrfF
         tDMQt9g2z8EmrIzdo/qeETvptgCaWLkdu5b3apyDNgZi69oQYqpPq1HuBvwacPCjfKWJ
         ESO4rQCVg918mWxT56GrSel1r1PFm7MsGnWgl9f2jBQGJbUdSqwQUcwfAK74qA2YZWQe
         POXvSGQtsGJ7twkWvr+SDZpGWgxOh7blKHXXDN8O4/54gNuFYPSjA4adwOIUyBlzxC9C
         RlWt9CI7d0hDyp5/+TwtJpaozT6BfTFL0RQy2fmwqGi7kineBZ5UVhUulMDCSJf44ED0
         5I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCWdbxiqhWgKkOF44rX/3oEnHasSzOiNrgOg0mVvfWM=;
        b=lM00yEnrH1LhhhdUQC8zgZKqfhvzyVnRQkF7mJTNCeEfRKiv7rsVeXuh31MaZbizrs
         yXfSuhKGVTpD85GYUY/69jIISOLyNw9c5LO4icbj+9F7moWqGoP1FVfvFz25XDHH3t8G
         w+3HCdz9L77nog94rbCVDak5Fp7LPdIzEtxDgAxkozoIRmtqBdi/ZioASoQzFhtX7tVT
         ksU0GELmoQkPHr3oEJYbEr15gnQS+zB9keIlobvgFdyu7tKJ/JIxCrvLfJcApKFuZ/JN
         ZPVwNmx6v2Vs/KW7yYswzv6VM+7M21pDNdSU+3fckHYRlTCnn9KYWsLHQWsjzlzu8edl
         QZ+g==
X-Gm-Message-State: AOAM531L9T2pltmvhyjfbEyaIoVUOL5wMDDBJZ0eg8VgDUJHF+xxWGex
        x1uaNnsUby+0DDRrZ7Zuvx9s0Ze1pPHwtg==
X-Google-Smtp-Source: ABdhPJzOjExWlVixKSZzVytPS7T3PEAEBrY0I2KinkWqM7gyqg5XvIgjZWTSDopUr9ujNzagA8HVyg==
X-Received: by 2002:a2e:96d1:0:b0:24a:c2b6:734 with SMTP id d17-20020a2e96d1000000b0024ac2b60734mr4781083ljj.144.1649239557469;
        Wed, 06 Apr 2022 03:05:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d17-20020a194f11000000b0044a30825a6fsm1788375lfb.42.2022.04.06.03.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 03:05:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm: remove unused plane_property field from msm_drm_private
Date:   Wed,  6 Apr 2022 13:05:56 +0300
Message-Id: <20220406100556.479706-1-dmitry.baryshkov@linaro.org>
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

Remove unused field plane_property from struct msm_drm_private. Also
drop the enum msm_mdp_plane_property which also becomes unused.

Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1: also drop enum msm_mdp_plane_property

---
 drivers/gpu/drm/msm/msm_drv.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ee3093890d97..a34e44968558 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -53,13 +53,6 @@ struct msm_disp_state;
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 
-enum msm_mdp_plane_property {
-	PLANE_PROP_ZPOS,
-	PLANE_PROP_ALPHA,
-	PLANE_PROP_PREMULTIPLIED,
-	PLANE_PROP_MAX_NUM
-};
-
 enum msm_dp_controller {
 	MSM_DP_CONTROLLER_0,
 	MSM_DP_CONTROLLER_1,
@@ -192,9 +185,6 @@ struct msm_drm_private {
 	unsigned int num_bridges;
 	struct drm_bridge *bridges[MAX_BRIDGES];
 
-	/* Properties */
-	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.35.1

