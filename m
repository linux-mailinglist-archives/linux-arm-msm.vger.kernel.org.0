Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1DA25A21D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 09:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245010AbiHZH2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 03:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245172AbiHZH22 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 03:28:28 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A8B81B2E
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 00:28:28 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id jm11so869740plb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=jTAWiNo/omAtLMeXfYZgyB0/HAK6wszJreXqF/7S7wI=;
        b=Mw00zfqC4T6VEtu20Rp2a+r5W186flt11PrO5MBPkuC9AKIvsEodr58v8llZfl2bcB
         Ez9huPudWeNGj1CXK90QSezqvUwejBlxia2MO7ZEg5tFc+yPyKNrrXnPZZ372asAA06o
         qfcOuFH2a7wCvxa5H78Y829Xlz7lftna7JXGqQR1Y/r94x3tJGTa+FODRpHCXoTl4Ek/
         K/V3SgnxNr/TvRxmw5h/oddjS6JWNn5H27l78eLbhfs2O29FwgFMHQHHXc/yFamb+qrf
         lT9q249MRU9opuU9/j5QUiUUIlInjxdJWSibgsrbYstcKCAeQX98M6a25iRJV999JWGq
         0l4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=jTAWiNo/omAtLMeXfYZgyB0/HAK6wszJreXqF/7S7wI=;
        b=2HrByKKtqCO6zEXO7GnpTwRwGSX7cer2JZVGWjL07NATYbPJQrpQBiWFIdtmi5diUM
         Qf1bB36zAPfZy9ja+DX/Te4Yp8Hm2Z1lmaeOHVy9zWU5JPZftpOqF3haieQLk9jpLGmO
         TxLHeMopLX1lhPkF3vSRAcEooGlzo3Z0lGg+txdiartzlDcCMF5FApzV3XBlkGNMayQ5
         jPyojrgZqPX8lkJM6/tAe9pzd4vxtOLBT/S5v38OhIvVgJ3VrFZb8vQtxwmRMCh7AQqY
         bKY8KRIDslwoax7Qv4PDlJ1hEWCFHqOeF8mloRSMuSx6HssIe44CvVnExTzUi6MO9hpt
         jHMQ==
X-Gm-Message-State: ACgBeo3ckNRD1Hk0rGOGlYkcGQD+Ka+QdVlMkZMo+1nzYNjshieKam+j
        BtGlxjNN5Sevm2Pqq6nngaw=
X-Google-Smtp-Source: AA6agR4deiMjaahtMRHx2xJWavsJbeXhXn9hPdI2v0yMOGZpprcfeXeHoJiPulIpm1tqBOm1x4+G7A==
X-Received: by 2002:a17:902:db05:b0:172:f759:f989 with SMTP id m5-20020a170902db0500b00172f759f989mr2660471plx.58.1661498907566;
        Fri, 26 Aug 2022 00:28:27 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id d6-20020a17090a3b0600b001fae01779c8sm941014pjc.7.2022.08.26.00.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 00:28:27 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To:     robdclark@gmail.com
Cc:     quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        swboyd@chromium.org, laurent.pinchart@ideasonboard.com,
        vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drm/msm/dsi: Remove the unneeded result variable
Date:   Fri, 26 Aug 2022 07:28:21 +0000
Message-Id: <20220826072821.253150-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value msm_dsi_phy_enable() directly instead of storing it in
another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cb84d185d73a..0b516a04945f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -141,14 +141,11 @@ static int enable_phy(struct msm_dsi *msm_dsi,
 		      struct msm_dsi_phy_shared_timings *shared_timings)
 {
 	struct msm_dsi_phy_clk_request clk_req;
-	int ret;
 	bool is_bonded_dsi = IS_BONDED_DSI();
 
 	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &clk_req, is_bonded_dsi);
 
-	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req, shared_timings);
-
-	return ret;
+	return msm_dsi_phy_enable(msm_dsi->phy, &clk_req, shared_timings);
 }
 
 static int
-- 
2.25.1
