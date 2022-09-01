Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED245A92E5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 11:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbiIAJPm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 05:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233778AbiIAJPe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 05:15:34 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6516D56E
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 02:15:32 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z6so23492184lfu.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0PopVUeDqVd8id5zcihhw1xot4mofrXOyc1GZjax4ec=;
        b=IvP5i70p6ppN98XYu7InwUNO/+mqptBcaId0KlOwGkf8kyje4IQAH2CDYHJMDp/ZkV
         ghEi4pY9LVoo25cOb3Hn6nvWNCrDZKlvqmXrmQy/2QZBmTJI4DlLM2sG00w3mIYIj2X1
         2tZsUDbm0nz3vikoSorTOUEXrx7rY+G/beM993ie//kW8O4VYZFpH8OZwv6tcD0bfeBS
         Zox9T3tugtECHNPlCggRMug5xoVMHWC6mRXfC3J2F53BXuVVr1lqRrYu30dpb8wOl7iF
         Yy/a7pLx90ybXbpD4qmPqCn5+xj5wmjKBY9H/FXKsaDUmnGyJ/+9O9MciMzRpAz2QB+H
         qipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0PopVUeDqVd8id5zcihhw1xot4mofrXOyc1GZjax4ec=;
        b=Rx/shNfJw22TmtE3nOGn3hGVMGRjoxPzMD//8MqDCK6hgMoZDKkJsk0ZQsWkZyG7C0
         1R/hpS68lN/F1FGb8GX7iuh1OPMmpXLCImLMtv6A9dcl3ZbPVRxYHbiZUgNl2q1H1wDR
         RiOzZT337oO00Ti4rC/qJeVcbVVGGgeu1Hj8bVxJ2/kcZEi9KsnDUCKHvHVkJmtVm5Ri
         TmH2j6Yf5hrDSbxzueMhZYyWPGqta0XVMwO+yEZVMiJ3x2UqC1RClXKR4j7QvdDtP18H
         A/OHeAFIFL0f9smRwwsBzwnn4NDMlzoc/SK9edPl509a+1vDf/S5Ux3hIpRxnnFLEZZF
         +fVQ==
X-Gm-Message-State: ACgBeo0CCtlVNjFwslHclgYopeq2evT/vEIPVKJ6lQT4hBtLBWqUd+0g
        GFGJevlbEUHzNO9K9GtVor7hNQ==
X-Google-Smtp-Source: AA6agR5gcvtrIHFZtE7o0eCPzN0rFEUKDxuoa820dKQCQFP47AtJxDVJ+nfan1kBmHAfIo9uLh6Mtw==
X-Received: by 2002:a05:6512:3fa2:b0:48a:16df:266f with SMTP id x34-20020a0565123fa200b0048a16df266fmr10153605lfa.414.1662023730688;
        Thu, 01 Sep 2022 02:15:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t17-20020a2e2d11000000b00261b4df9ec4sm2422349ljt.138.2022.09.01.02.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 02:15:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 2/3] drm/msm/dp: switch to using platform_get_irq()
Date:   Thu,  1 Sep 2022 12:15:26 +0300
Message-Id: <20220901091527.1992208-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
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

There is little point in using irq_of_parse_and_map(). Switch to plain
and usual platform_get_irq() for parsing the DP IRQ line.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3173e6962a78..40c7f91abec9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1243,8 +1243,8 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
-	if (!dp->irq) {
+	dp->irq = platform_get_irq(dp->pdev, 0);
+	if (dp->irq < 0) {
 		DRM_ERROR("failed to get irq\n");
 		return -EINVAL;
 	}
-- 
2.35.1

