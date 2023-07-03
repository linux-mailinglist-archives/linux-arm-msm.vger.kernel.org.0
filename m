Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5502F74533B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 02:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjGCAh4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 20:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjGCAh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 20:37:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1674B1BF
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 17:37:55 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb5bcb9a28so5875106e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 17:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688344673; x=1690936673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTB2UHvzkUCn5HR1GgoJDqVIQMk8vQmx+jHt1n0pheQ=;
        b=GNUJ5dx3XGOSECmjT1DMYoW8QGVRluZHuI+0QWBakn+TWkbdgOu+rpcAfxF8NdhplA
         DTBuOcGYSNhynFV+Tt6n6jW1lqrHvrLCK9AwzacU9fjSgfHRLT2XfRaFd2WeMyVnq9TQ
         4a+JAqrHd4xFLhqQ1OazJ1tx/JlyaOuMaHjZ3eJfBWVzx+sLgXpdVvm+hczRgcQQDsBN
         q3Z2u9vjdv2wPsP8WyNWIx4SNwniXKQnfh+1pIN3bwCNJb8slf7d+o3zdZduCI5TMApy
         DlMOLAruegYEbhu5LRY9Js4rRXuj979oQ1juzuiySOF9x9n3L95LqKa9aUBJPEc/xeoz
         GWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688344673; x=1690936673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTB2UHvzkUCn5HR1GgoJDqVIQMk8vQmx+jHt1n0pheQ=;
        b=ekT8hnJcpi6JbGOIcCFwhon/q5KhWGR++73rf1YBvfjfuS2FMKx5lt0zBnJfhGGPJm
         Po1b6vpuBoD3fSxYctWmowwGewq7DvO4HvrKLJqz5JgjSE21cgBWSJL6qE2XgYFkOHFA
         3l58BSH7FqKo5JLIobLPUAJT3Co87CZWtQlnkO28HMirl+5DX5/X96JHI3SFNTkf6lBQ
         CbMZ+sn4v38fiSI2G2jWt4VzPIV31aHDFqtdsYO050Q7P2Y/23ysmNXfn+s04dF47PMZ
         ycOJc9rlxMx4MT/Lm1f3UXwu7l7iTzd6O/lg2lfFEbxtmzUH9Atzxp82OpEPGONCwwh3
         dFww==
X-Gm-Message-State: ABy/qLYFENDUL8wAVAPXDYczbfRKv1sz9lqvow65KlRZ7OhU6yFP1jQN
        vX02OGn0DVdYGz/ALYEFexDVEw==
X-Google-Smtp-Source: APBJJlFvEw8xaJIG4fjGk0k2vy5tuEF7kntjvRGGs5H0vS/etieC0ZXXWlXFPd2CefZs9E4mdiYfSg==
X-Received: by 2002:a2e:9844:0:b0:2b5:86e4:558e with SMTP id e4-20020a2e9844000000b002b586e4558emr5513769ljj.38.1688344673460;
        Sun, 02 Jul 2023 17:37:53 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 17:37:52 -0700 (PDT)
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
Subject: [PATCH 08/13] drm/msm: remove shutdown callback from msm_platform_driver
Date:   Mon,  3 Jul 2023 03:37:40 +0300
Message-Id: <20230703003745.34239-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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

The msm_drv_shutdown only makes sense for the KMS-enabled devices, while
msm_platform_driver is only used in the headless case. Remove the
shutdown callback from the driver structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ee27837516fc..971c008e82cb 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1300,7 +1300,6 @@ void msm_drv_shutdown(struct platform_device *pdev)
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove     = msm_pdev_remove,
-	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
 	},
-- 
2.39.2

