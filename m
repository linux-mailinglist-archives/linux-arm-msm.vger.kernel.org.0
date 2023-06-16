Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F527732CBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 12:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243843AbjFPKDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 06:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240978AbjFPKDa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 06:03:30 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840732D69
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:03:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f7b641f54cso618751e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686909806; x=1689501806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8c2ugs0+tTSeY05tRDRkOekeDAonDnp1hdoOBvofP0=;
        b=dXUH5WYGyHgQvSJthS3lIoOu4zQ1J7M689xrtOij2DWQ23sWDKbHO/HNN5bAjiI1fQ
         EPtIMRHQ0yWzOhF5M7DyFd0jSyoSkhevMQ5eS3eKrrW84m3shy0J0ARkd4ug2ubw3rUO
         vDsbeKVwflxCbq0pvKJvblpgIws+rTrW1OGO7f/kf5SI900yd5z4clQmyFe/UVw13OFp
         p74LLvcaKzJdHdat9tx73WXvtp2YNcayZVZa+567G5ZGYCn4Tc/XyTAh10/o+kgySxd1
         Qtxu8iwimWZUI4ivkPoWZCDNea/7Iy7ojEsbXVkLHzdTWNYXUg2Z8SoRQmi8sS/dbvRp
         oGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909806; x=1689501806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8c2ugs0+tTSeY05tRDRkOekeDAonDnp1hdoOBvofP0=;
        b=CjWU97Fx6whTM/i8SFI4cbFDEvC/WTpK/aKUaYf9eEabumcezkl6Fjri5K4coNjUwL
         RVWy44X5dBuyR5Ny1f8C8c+1KCiC0mKshLkg7trpC9aHzxSay7ONso0UoqUEK/GemRHq
         BjnERHY7cMwNi8jUAukR4koQxSwReVcRHF27Wh1l6I3qsjYQaYlwMIyZEq21SrFoa0sg
         XVYxZvGH3kpV5hewjlqCon10EFgnWJCf5/ykzOKvz8Hm1NU6MPCX+dkGxxqqF4vZfbQ6
         Q4FRarFcigcOfem+R55HMGVsh4lAgtF3ECw6nxz/Nka0fqNo8Zqe3bA6ME+o1aY4/Jbk
         AQYw==
X-Gm-Message-State: AC+VfDxtMNtmUa41pIAPIfY76/i/s60cn6K4EBNPBGlrzmgPCcLmhrn3
        GjfcoWcjGFeEpIFC0olDAIxfMw==
X-Google-Smtp-Source: ACHHUZ5xs/nHOjM1XITaKKC2kNxYFOArMgsrOqgjo+NAU3+EjA8UxqP5lWiQE5oS93Nxpvmiac5K4Q==
X-Received: by 2002:a19:ca01:0:b0:4f8:56cd:da8c with SMTP id a1-20020a19ca01000000b004f856cdda8cmr678386lfg.34.1686909805777;
        Fri, 16 Jun 2023 03:03:25 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
        by smtp.gmail.com with ESMTPSA id r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 03:03:25 -0700 (PDT)
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
Subject: [PATCH v3 01/19] drm/msm: enumerate DSI interfaces
Date:   Fri, 16 Jun 2023 13:02:59 +0300
Message-Id: <20230616100317.500687-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
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

