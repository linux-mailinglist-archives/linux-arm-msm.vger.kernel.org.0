Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3981708DE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 04:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjESCjG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 22:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjESCjE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 22:39:04 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FABFE61
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:39:03 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ac78bb48eeso29489151fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684463941; x=1687055941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MawV/aylOA8R8XcD5L27Eb1AoElurGv+lqie52FpoZQ=;
        b=XoC/J+kF76dsQ9eomhbLCXsMVvobpp66Rtzi4uJHvt4B7kxUnFgr19RqJZT/GR17rN
         I2Wzy9NyYtIuIxfoYOTG3hQnTx0U5b/UBuN6aDJEI8cPrHYhhQazU8siy+3SPRnELDyA
         R1t416veztkvO0aV/ezwrZE6YyGe3VkWd42billPaIWcGwOqE5GwYvjIKr93eIrE18mK
         tMlUG8iDwbHcKOwV6PF3eUgnRICzwX9Yp4uNPjX6Q0G5iWC+QnMy0paSIo/yph4YNsV7
         ghmtx3EY5iBt+vyJ3MYH3yXjO8ClmJtNPD+hVR26ka6dgNQM3Kq5bhQFKlMx4+CHUMNF
         CKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684463941; x=1687055941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MawV/aylOA8R8XcD5L27Eb1AoElurGv+lqie52FpoZQ=;
        b=GQASDRognPvmcWDS9depT8lU5Npdj2dCOXOaVjCsTB3ZAHE6MnmFY3aIPQtN5wwhbP
         GZeuOspPNYhSNk2Mbf1v5ZA31S4mYYluhoAXegpLajVZ/A3nD7a89w0FUhBr3OUW5wkG
         vIi/d/myxX+JjdLkHHrjP0wvlS946N/vaOT0UmhmUntYv8zqVm750qkvCyC5qKyfPDJX
         lKZqo20UsOFcIH9C/3VpThFNWTA8jwCubWyteu4oOjDKf6HRJiG4sLqCdghFq8NT0bvV
         YM6B8OUT9+s76AWXIZk8ZWvyTAFvJZxg35u2oTuPUWW68Jyx7rIpSA2AKR6kLfeEZmq6
         ngyw==
X-Gm-Message-State: AC+VfDy66SniOEfZCvRsS8VS6gv/nWLcw/4J/3mkp60tvHVgzGll5h80
        QSxBlW3rQ2e98ek18nTPFA2JSg==
X-Google-Smtp-Source: ACHHUZ4xWQ57d2FDVq/qwKgaZ3g8Q+d+InbTKrtFotgKXJPjTVGgQnA4T679EwiJZf/UTAAYjnFxWw==
X-Received: by 2002:a2e:9c06:0:b0:2ad:ae71:4f21 with SMTP id s6-20020a2e9c06000000b002adae714f21mr97912lji.48.1684463941500;
        Thu, 18 May 2023 19:39:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 19:39:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
Date:   Fri, 19 May 2023 05:38:54 +0300
Message-Id: <20230519023855.3840907-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
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

There is no need to assign a result to temp varable just to return it
two lines below. Drop the temporary variable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index bedc8d0316c6..d4685e0a3f8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -759,15 +759,13 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
-	int ret = 0;
 
 	DPU_DEBUG("intf\n");
 
 	cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);
 	if (!cmd_enc) {
-		ret = -ENOMEM;
 		DPU_ERROR("failed to allocate\n");
-		return ERR_PTR(ret);
+		return ERR_PTR(-ENOMEM);
 	}
 	phys_enc = &cmd_enc->base;
 
-- 
2.39.2

