Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700F574BAB1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbjGHBER (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbjGHBEQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:16 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52998211F
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:15 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6fbf0c0e2so38655751fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778253; x=1691370253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dDa09IPPKyYg+3VZJKhZ3MpuhgcB8Qzz0Yy6G9C0Hg=;
        b=sCHFkAXRMGNLN34irJotyEcd+hn9zqPWNSmMxcrmEowScO05PBx1OEgjsErNy7P1PG
         QXZdrUHEYIPrR+ymYAiUKG58rbU8zL1fG4r51xsbnVKXXBObMbA1X1mCUKC1bVHTQFRS
         8WIXJ3jMAwr09u8l6CzvDOdFFtbhf//Rub3ZZFqo3T1Qig5jq8ir73cySv3WgSduhQ6p
         I/25LuuGClWJQrPqfM2rLJPbXDCzGsk+Tgp2/PULNlqG1po4hP2+imGEcEfAidMJoRlQ
         IcXEeo2rIeVJgfXRzhPgADpTSQ7W/SkLfcN0e2gan23B9L/QREZIqiOTvbrasPG0ICh7
         faOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778253; x=1691370253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dDa09IPPKyYg+3VZJKhZ3MpuhgcB8Qzz0Yy6G9C0Hg=;
        b=gEwuztEv0Ohrc2pND/ye51vztJQMotErIB+dhTSV/OOUNJHZOKzdCcznEf22Hr+9Pl
         ENqcFixIDNlFfvM6tqNnua8Oy4oqMkL+/nHuisOXPlp4MMc5+39RysrkbFKGfw82UnhO
         xAY3e40CragpfH0uvtBTETj/gpCLesTGrHchOtB5iAGAtqEUtCDfHgR8I0Q7kzTuvcRR
         dFFoWsxZ/CHIJ9BS0eBWr9XA1ONgZpzrfxzp/fnclOyn5vKyFDLPWX/3LKUREK36MAmk
         gHRrGjT7FmXihrVq07NcKgVqVupBNIPmdNqjY/TwGMv74f4ZHBWoJiltmziTI/3LABKQ
         /1ag==
X-Gm-Message-State: ABy/qLYqFXFICsR5WnFwiT4yMSKlzwyMGCKQFlZRX790Jq/lwnTXT/4L
        sTQAC5hY1XVV3R/PUUJe/hDVx932J14WCDGfh6A=
X-Google-Smtp-Source: APBJJlFZI7DJACf80E6XDfRqLGI8AxOmzj91GP7D4NEzNyhKdUniENni2CFKzVBC/CXpA+9+td2koQ==
X-Received: by 2002:a2e:9c8f:0:b0:2b4:6f0c:4760 with SMTP id x15-20020a2e9c8f000000b002b46f0c4760mr4282505lji.11.1688778253718;
        Fri, 07 Jul 2023 18:04:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:04:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 07/17] drm/msm/mdp5: use devres-managed allocation for INTF data
Date:   Sat,  8 Jul 2023 04:03:57 +0300
Message-Id: <20230708010407.3871346-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_kzalloc to create INTF data structure. This allows us
to remove corresponding kfree() call.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 0a85777625d3..fb2b3bf081ee 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -616,11 +616,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	int i;
-
-	for (i = 0; i < mdp5_kms->num_intfs; i++)
-		kfree(mdp5_kms->intfs[i]);
-
 	if (mdp5_kms->rpm_enabled)
 		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
@@ -741,7 +736,7 @@ static int interface_init(struct mdp5_kms *mdp5_kms)
 		if (intf_types[i] == INTF_DISABLED)
 			continue;
 
-		intf = kzalloc(sizeof(*intf), GFP_KERNEL);
+		intf = devm_kzalloc(dev->dev, sizeof(*intf), GFP_KERNEL);
 		if (!intf) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct INTF%d\n", i);
 			return -ENOMEM;
-- 
2.39.2

