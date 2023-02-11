Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C96692CC6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjBKCLA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjBKCK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:10:59 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B149D7499F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:10:58 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id sa10so20153377ejc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yshUYPatWwyLRv6Ypl6xWjr9pik+/Tjx9/mnhNZ9UhQ=;
        b=lmTxjkX+fXOSQlmuNE8y6JE3FW+lr8tI9vXv48RcHjLSiBWeyu0sUc9I9+Rx93BFGb
         l2bcrkgX1zhdBaquz2cYL9rVoJDTg7TPGmvVGlMQ/ylUvYGotvcPGtgCqFCYTQYLa1D1
         uhJT2yHIXZiHMIaDFKutoDjR0UbI3uc9jP5w5f6GUHSdMW9tjokWpfQKSXZy2LH072GN
         zcpKoG1LR5yPbvHXYSpBvcxduXc4VORg326aN9aFAhgAxkLQsc3MuS1O2XI4nvjdexkz
         eVXL/+Sx8oUiy+HrIrTAbbfT/KX9wBC3YGXTbsWowiTino/R+slZTpvOeCMdS3YsMdg7
         ipPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yshUYPatWwyLRv6Ypl6xWjr9pik+/Tjx9/mnhNZ9UhQ=;
        b=dHcM2tT88ZNHOCqbv5r/2lH9/vyRoSlVK/fz9wKQUCbK9+3CybR9069oz8CfrajnC7
         DzaH1z6X/HrmTFrZohu8nfieSu9pXePAuijdco8WNzeaLgLgG2osqhgl2ZHwPUB2TbgA
         767trsFSsu3ImnRzR0rBLG6cypVWhkSi8qQ+MxHHd/qToTPQprZY0bayiy+cLL+v6wvO
         UN4BrEAWxbOtFbca1muHjxqjzxIqR9laNDiQW3w48JGOUqDuMs4BNLTtwp+PyboQvbI2
         hgnposxKs+LBLbrr2I/y3iCDpejYxUFZUQWC9mPRk1qxhKX0A+D0+uW7FIrAxXaHIyrm
         DjSA==
X-Gm-Message-State: AO0yUKUZPxayBOVD361HHvWL1mOvlg589KspwIEm80SlytEmQZqLqdto
        bLkxdExR0FlS0hAotR6xdSoeWA==
X-Google-Smtp-Source: AK7set+8MnqxLz2kT+PdecZKpqRDXT9Yf3O8lKo/FoMTihB4zlc5w9wOVRVCamQL0cjpLwT4vQ15JQ==
X-Received: by 2002:a17:907:3e27:b0:86c:a3ed:1442 with SMTP id hp39-20020a1709073e2700b0086ca3ed1442mr22150842ejc.4.1676081457330;
        Fri, 10 Feb 2023 18:10:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:10:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 02/43] drm/msm/dpu: mark remaining pp data as const
Date:   Sat, 11 Feb 2023 04:10:12 +0200
Message-Id: <20230211021053.1078648-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix several leftover _pp strutures and mark them as const, making all hw
catalog fit into the rodata section.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5c393a822ff1..ed6076dc2b43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1654,12 +1654,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
 };
 
-static struct dpu_pingpong_cfg sc7180_pp[] = {
+static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
 };
 
-static struct dpu_pingpong_cfg sc8280xp_pp[] = {
+static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
@@ -1723,7 +1723,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
 };
 
-static struct dpu_pingpong_cfg qcm2290_pp[] = {
+static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-- 
2.39.1

