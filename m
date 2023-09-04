Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF01B790FCC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 04:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350360AbjIDCFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 22:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350357AbjIDCFH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 22:05:07 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E765D100
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 19:05:01 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so13861961fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 19:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693793100; x=1694397900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LctnTM5rXutjH2qlEAQeifma8NswX6DnB9xbh8Rm9eY=;
        b=ED+n0MD8TRL81VDu/VkIAmuzqBjwe3OXYdywjtLRwxTL2q9j1jY5feYr7gWvE8rlHg
         nVCjHHAT2++MMgrSiCgcCcYR+UfruO0CfvF5uFIOFV+/F2KKBaF3svNE15MpD0b9bFFd
         RM9qknTdNkSTOU6bX8R9qBvsHzPYcAfW+kal3vvsFaAwR6OQm3p1aUAxRGRy5tcZa/b9
         2yVJP89IfE07RcklymSQIJjR8QQMYSnaA7SndT1cOexGRmnjnFye8B5+sbgCQnUFSGLz
         v1TtfpLrRXwLZc1CNK5Y/xsT/2qgaQXirjmlUICEPC9tZhdQC6QX+6/8oEnETH1DqypC
         zoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693793100; x=1694397900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LctnTM5rXutjH2qlEAQeifma8NswX6DnB9xbh8Rm9eY=;
        b=UbppB+8hDhFB5AAyin8Vf8ddyWHZC4Idc8BMZEuvzvggzCqScDTm9voUc45lTvGWoK
         DuLqOTAELqq9ydG1hiZhn8GifEYW4gIo6t6J4W8DEl894FctV7AfOIB0Y8BZ7OuTHUE0
         i09BtCAydL42+pkdEmTrDC1C22c7Nfng6lzRpTrFbUXA+sGPYjdNJwNWtiuf1Mq2m5Oe
         uYT0oYug6HtwlwgDDX0sozmWz3nROAUJb5KtDbIHXO1DXyBrZGKQiZkCchLVUYOLjbKB
         HWgifzeoKiuIR2wqZ45sAIq69261ufhxi1m2O1agszMgjxpFaDWGBbc3QNQaTuMb6M8W
         /pcg==
X-Gm-Message-State: AOJu0YwDwy++8GWIPshXhgepgh7oaKIUbuFjKRTUEElW3Ckdpum7ujUY
        g6NcejAmqLJyLLDZfjO6oTXd1Q==
X-Google-Smtp-Source: AGHT+IErnrm0+qqKHmwbz21Eyaqf6ZQ4HGuLHJcLnOTwGxcmFR3xhvBdJIfEOcc0tD654qjyPABRDQ==
X-Received: by 2002:a05:651c:145:b0:2bb:a123:2db7 with SMTP id c5-20020a05651c014500b002bba1232db7mr5205131ljd.51.1693793100378;
        Sun, 03 Sep 2023 19:05:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 19:04:59 -0700 (PDT)
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
Subject: [PATCH v3 7/8] drm/msm/dpu: drop useless check from dpu_encoder_phys_cmd_te_rd_ptr_irq()
Date:   Mon,  4 Sep 2023 05:04:53 +0300
Message-Id: <20230904020454.2945667-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dpu_encoder_phys_cmd_te_rd_ptr_irq() function uses neither hw_intf
nor hw_pp data, so we can drop the corresponding check.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index e03b2075639d..d18236bd98e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -108,14 +108,6 @@ static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_cmd *cmd_enc;
 
-	if (phys_enc->has_intf_te) {
-		if (!phys_enc->hw_intf)
-			return;
-	} else {
-		if (!phys_enc->hw_pp)
-			return;
-	}
-
 	DPU_ATRACE_BEGIN("rd_ptr_irq");
 	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
 
-- 
2.39.2

