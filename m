Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8FD7219B8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 22:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjFDUfm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 16:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbjFDUfl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 16:35:41 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE98E3
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 13:35:39 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f61b45ee0dso1448959e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 13:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685910937; x=1688502937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VOufof82LdFXq5Avw+IGoCuTtc/4cJuL5op7JwlHY8=;
        b=t8Dx2MZXa/kjTK+yqDR4tf1xmW0Qharjw0NxKnhxIrwXQA+bnilsKzreaHsQc2QTdR
         QljmL79jlfIbU6BxoE+u9npAWEFyD8KnQu/rXSvY960bw6fKAgR6B4y//lgMdoiLy/WQ
         pVBGL78T+zYCsph0ldJbRcr19G7PUi0RobfWfDHKLhIeAu572Bq56ncUS9RlBVmqyi+K
         rmQbK6+VJvT5E7Dhejm4ji9LK2NKmXQaGIzFlWOrPRN+YHNhL+8d1r5BXkfSlgmkMn96
         4uJv2YYxD5kbpb+7sKX8i+/L7liBVBA3hF+JaVEWFJQ71H63UfOoy+r8WhWsgLdgtbS+
         ZArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685910937; x=1688502937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VOufof82LdFXq5Avw+IGoCuTtc/4cJuL5op7JwlHY8=;
        b=UE6bJqRx4K6KaVgpcmRuf480G/YZEuzvIlZ9g7nfuuQB7CgsL1XR2QFF3i4Ilj+fw7
         oshUHxTFrXHCW7tOLfDEO5/z/ev/wBeIUYmYHyvX3uTMRxLyo4TcNOrryECuDGX7JPzj
         IRhMge1RGR9Eu5avGGmp6ZRr542mJURcZt1R3JTYgPRUKxDQuQmr0H1T32+IlFFlaD59
         HeRrRnNv9ydTdZAuTKR5D2N7wHO7ZEywUJyC4vZxpKSRE8v9dUgeJ+xh1GaSs3L9aSGs
         ga3Lo3KHrJZbLCEX/zegmtLpXqTnXdViyvN3MkLo5XYyIqhuPv8jve/pMPAUISlVmQbu
         9sig==
X-Gm-Message-State: AC+VfDw/7l8m5cXE5C+MjX64N0bMGOwoXampwnVXOofNVhvBFVHpVlh1
        3lTZsP1YlI4MFZcHo+0hUqH/Rg==
X-Google-Smtp-Source: ACHHUZ7i9Uj6sOeBI/gBAvlxi9Gin02DqWHZSVj1w7Sb4VXH8Fk/OdOxGDZdsXhrBuVX0jJggUBbbg==
X-Received: by 2002:a19:f005:0:b0:4f6:20b1:ef95 with SMTP id p5-20020a19f005000000b004f620b1ef95mr1331005lfc.37.1685910937475;
        Sun, 04 Jun 2023 13:35:37 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 13:35:36 -0700 (PDT)
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
Subject: [PATCH 03/22] drm/msm: enumerate DSI interfaces
Date:   Sun,  4 Jun 2023 23:35:13 +0300
Message-Id: <20230604203532.1094249-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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

