Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68D472D559
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 02:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbjFMAKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 20:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233894AbjFMAKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 20:10:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852E6171C
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:11 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f63ab1ac4aso5912277e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686615010; x=1689207010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VOufof82LdFXq5Avw+IGoCuTtc/4cJuL5op7JwlHY8=;
        b=RMVZESEktU9x/dwTev7Vnf18otE1Pw+LM+9HjPAkDQ/xcPB59RDhPsA46Gazxih5dr
         FachsxGtxUvxIn9w8HN/ZFRclsKkX1IwSrdVzs2DqrApiAZvHBUgHizKKSVhlLD9pqJJ
         KAbQSoiiNdz63+qwAWOff/0vOJ4iL7GShTphjjiihbKe08HvQl294PSVAXCkbk8EGt/j
         hfD4Ka+JIF4funfOCraP73PzkE8q8FgAlHrcEvBvFFOEo41cMe9/YtmBuFq7e1yBexhO
         d1EHnF5BChN3KeXEWkW2MJKV56Yx7/dP0PfIMnhGcueqOZBKRgdwvk+r0W8nvnlO+0tj
         jLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686615010; x=1689207010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VOufof82LdFXq5Avw+IGoCuTtc/4cJuL5op7JwlHY8=;
        b=EGW9/A7J7hYlOe/+tiHc7RJdGC5UygfnXhE07GLrENfK2kApCcepmjES7FELVm1MCa
         pvsypBFYHtiFbem4tlQbzcX5f7L6OSkQpQFMMvqHmDOsIP0w5q9I7vDdXy5ap+lNT2SR
         T8Kkh3BRgVnLtUMfgAnSGFpjp3a9gFcZZducC18VYavaPpjzlUHBkXV3A8WJD2a/6QNK
         anuMVvzKkT0TbPjvI8sKdA1zfVFy3GZPQiFyPqcHGb9Kof1esGx5HuInDPvkHQsBKNKw
         t+xd06PM7uaARbcFZ3TRwPMiTnhnp0q4nl4P3XyG03xduP7u93aLvqPKLkhTLv1mgccD
         8VDg==
X-Gm-Message-State: AC+VfDxvicTlITrPZ5G1oZ7jv/b3S3zwn4cYS+xPwukXDEMNuj8U8+VG
        /oIL9loPTYX/I0+S1k1Qx8niFQ==
X-Google-Smtp-Source: ACHHUZ6qNMlmsZQl5mhOYHN407i3q5TDwQmWKGOaWWDRMj8n5sGEIBJreQbMAOvMFV30lg/aU11IcQ==
X-Received: by 2002:ac2:5b11:0:b0:4f1:dcd2:ab6d with SMTP id v17-20020ac25b11000000b004f1dcd2ab6dmr5715036lfn.28.1686615009944;
        Mon, 12 Jun 2023 17:10:09 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 17:10:09 -0700 (PDT)
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
Subject: [PATCH v2 04/22] drm/msm: enumerate DSI interfaces
Date:   Tue, 13 Jun 2023 03:09:43 +0300
Message-Id: <20230613001004.3426676-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
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

