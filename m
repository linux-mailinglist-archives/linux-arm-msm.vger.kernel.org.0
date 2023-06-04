Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2047B7219B7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 22:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjFDUfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 16:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbjFDUfj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 16:35:39 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21AEDDA
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 13:35:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f5021faa16so5075106e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685910936; x=1688502936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrSOemd05FoINZSG/bKVXkgtRW9ZPoVMcZ1xEFU5Tgo=;
        b=lhF+d6BUhx73tz72Tq4RhmNmP07HV54XfdOhfkXTyDlQ1zgFKrrTgWulFXAH/IwhCK
         kqnNtl0CzsOySVzeR8Ut3BGkS5Vf+n6ZRL9sHylQJ7fxnQj9bDVjk4ZOwx4R1BQyEFee
         WqMdhPa6w5CTjpY+oFV9J9yynLp8xl/3aytqKosbcTSk/aOvOfYnrzeSKJ33oo0yspBv
         cXpwpHpPE8gFtl964kJkk7BG/jhnb5vhxSVH/4Gq+JfOvyr3uiaLVLKGyxBIEpVwj2Ld
         /ChH58Etspnc8T72pDOwEZ3rURNYNsCQU3Yhqlyz/XzYFZUG47SXNwgUfV/6H8Dv6yTn
         rhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685910936; x=1688502936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrSOemd05FoINZSG/bKVXkgtRW9ZPoVMcZ1xEFU5Tgo=;
        b=g+wWjEIBike9sTRblGO09MjLUjbptlf/BNo887q8DSQpAQ6tINi0oDL3Nqd5ZrTsX2
         1JKKEvsnxuxGbw4eGWWSCENQLO4tbngLYHyzMdai8dkCVyyy75g7KpONRQONRVRmh3rT
         aR6M1yfzueRW7bxI/kIm9aZvY3D/Hj2gMCQ45UadSCOzEY2ALGgVuepE1ngX3oLMwHOT
         tM5/aYcgYBB48k0a4Qy7oZYbCGQTYSsK5l+gxIAb1NRBrkcHRTDMypHUSl2CZb/FZrHi
         WnQW3OWzQsY7muP9ESxsEvPhBKJiH21Le/ofFoY4R9Zp+BxAUBd30hQ42xZwMscDdQ94
         FrFQ==
X-Gm-Message-State: AC+VfDyQFXNN8Sbp43NU0MsgcMxgggqjSKKk/nvwsMRCoqYoR+gMu4KA
        gAtD1n4rLAKdM1AF2U41OMI/cQ==
X-Google-Smtp-Source: ACHHUZ48uDmDSEcJbp+P7kju0MdcIk71jozZ9uskbWX9pOjjmQzk0+B6+9OzTQWxI1d7kyMUk6TiPg==
X-Received: by 2002:a05:6512:376f:b0:4f1:3eea:eaf9 with SMTP id z15-20020a056512376f00b004f13eeaeaf9mr3862098lft.24.1685910936496;
        Sun, 04 Jun 2023 13:35:36 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 13:35:35 -0700 (PDT)
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
Subject: [PATCH 02/22] drm/msm/dpu: remove unused INTF_NONE interfaces
Date:   Sun,  4 Jun 2023 23:35:12 +0300
Message-Id: <20230604203532.1094249-3-dmitry.baryshkov@linaro.org>
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

sm6115 and qcm2290 do not have INTF_0. Drop corresponding interface
definitions.

Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Fixes: 5ce224840b9e ("drm/msm/dpu: expand sm6115 catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 99dfc6d4522d..ba115770d3b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -65,7 +65,6 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 };
 
 static const struct dpu_intf_cfg sm6115_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index aa0489898552..8363df17509e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -62,7 +62,6 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 };
 
 static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-- 
2.39.2

