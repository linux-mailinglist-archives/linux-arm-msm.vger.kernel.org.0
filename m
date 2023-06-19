Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42A5F735EFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 23:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjFSVZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 17:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjFSVZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 17:25:24 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE2BE55
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:23 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f8689fbf59so2533346e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687209921; x=1689801921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gFB/5Z8bifSrL3SocS7kcyTOqWiXcJYOMvj9APdBaU=;
        b=O8AmWHxclCA83Dsrbof9IrerkLZvfILqxSQ1U24buq8/UJ05ZURnn/HbeNCAi8wGoc
         fJ/yicWWIO8At9zxoPxNvxs4+djx6wyG3/0zE8Z04keTA1mQqtm3NtjbmEOQlHx364XF
         /Ip6Eo+wI/ICUTESE/J9ti199B+JF+9qWtJBAWVjun8xmvjnP2F6NPVNFxyEVnJBFZKM
         LxPaPtFUnXX3qHSovtvH+nQMkqG5i0eMe3CMPriIUnsLG4I6kH+Ohe+yWO60GjDNxA1v
         wzGnT1hIgR8q1nUsL4m4Z9oy08HbsCLDIvYDrPiivySncagGHCuxz3XtUekhGVpSEuru
         4L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687209921; x=1689801921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gFB/5Z8bifSrL3SocS7kcyTOqWiXcJYOMvj9APdBaU=;
        b=R7RBTBWS5wUIVCflMwi8yDuH5haDy8d97CLg8aXsGuFkW+MRS0WEMkF3wP8v9KFxkV
         Dh68E5jdcmBY65iHlkPvlVEqrHbGKiZEAJloQp8gGBdEU8ofbZjU7zj8LaRW4vD/D4lj
         GJft7mNpSt9MJW2he9k3CIW1EERiNK3oPdsdnpliB0zmWra1WOaoCGmvsfIM+3V4oy12
         mK8CWofpOsWCTdDSP2eIIYmgwso8ZCaL6h8TU3/RMFE48p04AN5iDfQXsiK5yc/9N78z
         TBKzIuDR7QznTCp5Z09RPWX/8sNaZ7ouRSbHyLI9n4zAVA3STE2rdH88vUvZLULcDtU6
         hhDg==
X-Gm-Message-State: AC+VfDxzcecuh5Ofb7X33hYKoUSKoB/ir7E9XJSa0wPMETeF7nIaXr3t
        XesX9g4lC4GHF/xTqH7qbMzHIw==
X-Google-Smtp-Source: ACHHUZ4YrFvEFfsKLUQzLpd/qHCvn2opTHnZRLvA60ASIzHkU97jEvEecp9yG6DSfL5BBLRnhDCQdg==
X-Received: by 2002:ac2:5b1d:0:b0:4f8:6ff9:ec55 with SMTP id v29-20020ac25b1d000000b004f86ff9ec55mr1492415lfn.20.1687209921587;
        Mon, 19 Jun 2023 14:25:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j12-20020ac253ac000000b004f611dd9935sm84864lfh.152.2023.06.19.14.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 14:25:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 01/19] drm/msm: enumerate DSI interfaces
Date:   Tue, 20 Jun 2023 00:25:01 +0300
Message-Id: <20230619212519.875673-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
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

