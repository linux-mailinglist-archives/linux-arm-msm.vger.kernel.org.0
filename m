Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3832D6B330B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjCJA53 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCJA50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:26 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2465DFAEE1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:16 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id i9so4609649lfc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTl3rGGyj4+0LMugsZTfV6hj8IYJr190rpFDv6Lf1bY=;
        b=dpa3CvQoMqLUpQvMg81TG8iu2AZqFnISSwPxmR7zePKmyiISiJPt7ZHAMQDeyp8f1n
         vbO9uPy6yVwPx91g//I3TR8ybsXAD8mOh49q9IXO8hnaYD19+o0GLdh+JqmFg0gm4MP7
         r9U0aWIaCUOsmWvuNjyndWq3iWLF1gkGl3G2qwjXZGTCL8eKpafl01CJXsRUDRCNAvy8
         sXFpC4Xi+O1ivoN9yPcJ1RoErDNSf3nLK9+z2nkiKDx+OOvkK9TsrttXbC4ju9q3aqNv
         Irx6xFB20B+O/DYGS3OllzZ6P0S7EuUbGJMVn0RIXWN+L/AWDSiC/1sau7ZJ+x56idOX
         zvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTl3rGGyj4+0LMugsZTfV6hj8IYJr190rpFDv6Lf1bY=;
        b=d1mY48EGASbUaVCxGAuNqYJGfnbdvP7TNjAqIRRwbv6Ne206Uwsmk2baoW8mzPjAS/
         cv2lt1TjiW/Akc3bOV1DivG0VUJFUxY4BzR6L4SxUDbVar6x/iIkLrgzqveGNVYI+0ta
         r6O2RpeZvNVbUmizJhwIco0RRF+bOsEEbK3qqXvXxWFpqOiPOB14QDFDPuzUt3MfH7FG
         vQ3bK+vM7aF3j1cEdiX6gVz6da9zh2xHkGbGSzzmpBZ/SkhS7qoELhU+Y5xPkV7yMGTn
         H2+CG7B/ShubZqnLtuND6dtJoX1b/jBQvhI6GK3ltKdoNTX401ps0wc/c1uuV/SSOwvG
         iHlw==
X-Gm-Message-State: AO0yUKW516ARC2UBz6PYsFxSPNUGNV/WiPmErw3Hf9HtbdfxkSkp+eh5
        56LFrldeyG21UYFd1Ax9SIUGcOD7FdeDF0FUDIY=
X-Google-Smtp-Source: AK7set+zkZumdquGYypZ9XBYeTK7CJFty5fR4mrgqCA2m5j2iWgzfAb7xZvNO2pcxG4mbgiu8DpE6Q==
X-Received: by 2002:ac2:4824:0:b0:4db:86f:86dd with SMTP id 4-20020ac24824000000b004db086f86ddmr6988089lft.31.1678409834486;
        Thu, 09 Mar 2023 16:57:14 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 10/32] drm/msm/dpu: clean up SRC addresses when setting up SSPP for solid fill
Date:   Fri, 10 Mar 2023 02:56:42 +0200
Message-Id: <20230310005704.1332368-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
not be sure that the previous address is still valid.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 3030cd3b253a..0a43c5682b2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_sspp_cfg cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
-- 
2.39.2

