Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD05746746
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 04:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjGDCVm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 22:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjGDCVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 22:21:41 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC12CE62
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 19:21:39 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f86e6e4038so6363121e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 19:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688437298; x=1691029298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gFB/5Z8bifSrL3SocS7kcyTOqWiXcJYOMvj9APdBaU=;
        b=WndeBosu/+j4iRv6gWblAif+qA5oA5faM5RMCyuz3YsRJDw61znpwGtfYAk2sIq9Wf
         Wa+ZezIdvsDvJSeRPRaL9MwJj/xUANQqxINLU6z7xNosOoHp7GV7Tt6ANphTLA4JMK62
         nUBlBEe/WFIcP7HYjpw+dXVtRugDNgjVM3lJ3xunud42m/d8OycRayrxl8Z2jJgzJqct
         MJRnaPXTNAiZNs/YxSn7a82fhtmTp1JonoM0YHyzjfy49RRjCky49FlIYlFT7VmLP2gO
         mkXxvkhgbgkaoTas4SOk/Ts+ek5e4rfG3OpGapa43QaVTub0h+C6XX/jE0myZafNrPWr
         8v2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688437298; x=1691029298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gFB/5Z8bifSrL3SocS7kcyTOqWiXcJYOMvj9APdBaU=;
        b=j2GfP9oJX4Z4iklHf+5an8OlCQbnLM2fSSCMs8l2gUcCOZ2L/H1/zzyQdLl27cJ9Fy
         cxqWHX96rBsxdRfCuDy9Dk+oHsjLCd85ZgDegyki2yQwrXNJwRCTta/FuRoknJJrUDix
         DfX7XoifnxwY4GIrMpktF29dvhLffQfUmlM5NKOhPqConj4wqFdm3I+h3o5JQBGQHW5H
         FqTI5W2IVNf9Ca0y2o56yfK+IW7WS9HvdmzQXlsMot/miSPiwGYdlNAmPpn8bK6MS2F/
         194gcu8pHTErjH96ca0dUajO6Zc5Atpmk3lEWmoSP9WMs1809NXm+cnh0S8ITMFR1boV
         N/RQ==
X-Gm-Message-State: AC+VfDwGjgwuxZFZ0BhTGeMipLEPg9rP7TyfSmxjhGqliYqwTSnKBTsd
        febyuJ0YH0pyDjI2xzW5j1RfDQ==
X-Google-Smtp-Source: APBJJlFbDoel2givIZ2zNFIQ6UbatiXt1Zfrr2x3cqqr5/7lN9HSxsRl5ibltNV83k+fHJnM+245MA==
X-Received: by 2002:a05:6512:23a0:b0:4fb:95b0:1423 with SMTP id c32-20020a05651223a000b004fb95b01423mr6308638lfv.4.1688437297993;
        Mon, 03 Jul 2023 19:21:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y16-20020a05651c021000b002b6e863108esm1137830ljn.9.2023.07.03.19.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 19:21:37 -0700 (PDT)
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
Subject: [PATCH v5 01/19] drm/msm: enumerate DSI interfaces
Date:   Tue,  4 Jul 2023 05:21:18 +0300
Message-Id: <20230704022136.130522-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
References: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
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

Follow the DP example and define MSM_DSI_CONTROLLER_n enumeration.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c9..ad4fad2bcdc8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -65,6 +65,12 @@ enum msm_dp_controller {
 	MSM_DP_CONTROLLER_COUNT,
 };
 
+enum msm_dsi_controller {
+	MSM_DSI_CONTROLLER_0,
+	MSM_DSI_CONTROLLER_1,
+	MSM_DSI_CONTROLLER_COUNT,
+};
+
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
@@ -117,7 +123,7 @@ struct msm_drm_private {
 	struct hdmi *hdmi;
 
 	/* DSI is shared by mdp4 and mdp5 */
-	struct msm_dsi *dsi[2];
+	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
 
 	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
 
-- 
2.39.2

