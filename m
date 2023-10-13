Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0027C801E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 10:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjJMIZX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 04:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjJMIZW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 04:25:22 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38433B8
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 01:25:20 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso18860145e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697185518; x=1697790318; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M+uauCSgQKcWUCd6FsYiqka8NNHbjlLVkJ7rYh7s+Tg=;
        b=YRxxc1Qw02CIizIz0lAMetrEjcfh3grdv8x56ilWPCq5FAHPBRqS4IAi4WXlaPyZ12
         fwlRnSRyySJZwlS2/gOAG0faI09Thr0v4tzl5JjAR0K5ePzimgGhndUBR59wE3jiUzSc
         wAwfxbcX9sI7YeHgp8XMS19jP8OT7S953w0+0rnqfNoSTdxx8pbL3xOurqIJ+sn1Dzx8
         i1C64qSH9P5BPhUTEY7n7WcIeyhO37jqthQwc9nUtb2n5X6E6Dp4cQBhlwIzo/9wkgeP
         RtbZkzOl7nxgOQz5xf1jFloG3btcx32rZ3D2Nuo+gOiMnSZnw3xRrkQhBYyuB5mJGEFl
         84+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697185518; x=1697790318;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M+uauCSgQKcWUCd6FsYiqka8NNHbjlLVkJ7rYh7s+Tg=;
        b=j95qgBorSYWK4v0xrJ5QpiN5SJ9+UaQZgILYutfHxVvrLdjERoN/OjMSgzEu0vKxnA
         fL6O3uwaRWbwg/VU95rHOosQNS9nWVZ++iZiREVuDQmeve4TX/kjbCqM6p8V4cGk3EZM
         HmrC8pIDSbRQmFkAYntI+mvVhGHF9UlndctUla7T+k/tP2cOD7gZolrebyiuX8tQS92p
         2HWs2o7IB+r10AIo8rjINdJrxWVISYsGom6sHdOHCkBeU7+62Wa/oRWdaKiS8ZOHs/y8
         pvyX3N07RzFLe5/ktWX82nztzURzvMesf1lOoQVO/nHD8tQs0f+9wmyMeIOUm3tZvv0/
         uxrQ==
X-Gm-Message-State: AOJu0Yz7ogaw91GgwDlu9QS9NGQrUh2kQYKzmrzlgZ5iQSQvUXW1Uf9t
        KgNz9fETct71S62Or+FXlnwH/A==
X-Google-Smtp-Source: AGHT+IEjRa/nZrp2h3uISb8MvRVIEmCnprt03btuSLuHCUEtgB3tAH3dRRIg0+64ePhtBFCv/YHqZg==
X-Received: by 2002:a05:600c:282:b0:406:44e7:ef93 with SMTP id 2-20020a05600c028200b0040644e7ef93mr24194490wmk.1.1697185518504;
        Fri, 13 Oct 2023 01:25:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600001c900b0032179c4a46dsm20236629wrx.100.2023.10.13.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 01:25:17 -0700 (PDT)
Date:   Fri, 13 Oct 2023 11:25:15 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Su Hui <suhui@nfschina.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/msm: remove unnecessary NULL check
Message-ID: <ZSj+6/J6YsoSpLak@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This NULL check was required when it was added, but we shuffled the code
around and now it's not.  The inconsistent NULL checking triggers a
Smatch warning:

    drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
    variable dereferenced before check 'mdp5_kms' (see line 782)

Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function"
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Added a Fixes tag.  It's not really a bug fix and so adding the
fixes tag is slightly unfair but it should prevent this patch from
accidentally getting backported before the refactoring and causing an
issue.

Btw, fixes tags are often unfair like this.  People look at fixes tags
and think, "the fix introduced a bug" but actually it's really common
that the fix was just not complete.  But from a backporting perspective
it makes sense to tie them together.

Plus everyone introduces bugs.  If you're not introducing bugs, then
you're probably not writing a lot of code.

 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 11d9fc2c6bf5..ec933d597e20 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -844,8 +844,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 
 	return 0;
 fail:
-	if (mdp5_kms)
-		mdp5_destroy(mdp5_kms);
+	mdp5_destroy(mdp5_kms);
 	return ret;
 }
 
-- 
2.39.2
