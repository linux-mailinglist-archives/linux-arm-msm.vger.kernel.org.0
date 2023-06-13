Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3194272D556
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 02:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjFMAKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 20:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbjFMAKK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 20:10:10 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F5E171F
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:08 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f6370ddd27so5858909e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686615006; x=1689207006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqJ/EVFZ5KKxz5XV9rfFB9zBx0VgDhxsDFDprGH8B34=;
        b=T313xFDtr9A4w/ZXJ0L7Lef+Gimf4azO1x+1bMZoAbbxijVr3xGTrZOtijMmv47yHc
         1kflMY11mq8hXJb78dWSfKbS9HC6nqSZBnmFgU8ZHjOB2xvfFUWR2txL0BSMgRW+itdf
         H+hJSDVVYqsImJC3uhOnlYBk1HMpgkg0p+HVfRGSGiaBMovuq18mj5cAdibcRVNsHpwa
         anwpP8jAfHLpGIbjlYgMkGLxk6ZBNqJeqkqlbEmevEUJ2M/f8MnzvP/B9dR6vmEQUCIv
         ySdfjM79I/Y1TkMmWyhRI2wDal8YbaXho+EgeIiJi5SQC4sdnSfWaP1idAqi7VaugJjc
         MAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686615006; x=1689207006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqJ/EVFZ5KKxz5XV9rfFB9zBx0VgDhxsDFDprGH8B34=;
        b=A3kfaFw/4DJKvwtLsLvNVGMjk7sIRSZen2qctvKxeIbGYOkhUJOBpwyZ3sUXBtjgTI
         WGDmo6zBgbuCvRN8+vVUipG7zhJcyImyk7scDYOvmXsw3z6RUOb7r4stUWnzm+GCQlsO
         zUePeQj4W4lPTgqefGupbfxOlzwXSmP2EJDjFCyuhSeBdJWOeTKdCqIuz6Ay3O6h3iij
         IgVOzVHFerru3YAoDm+J8Xfm31TslWAzRVNi/ekIv3O/c5kZt44B79eCctn9X0ua3Yrv
         nSIwZerNsQAsJCxP7BwgE2bNAALLTbNAR1futTDi3wqA3Ml8Qgq9zgFsD7n6dHVEzCDA
         K9Eg==
X-Gm-Message-State: AC+VfDw/NHNkDePjYGOzjiXZ7wsqAvbdRuwM4jxShB6JNzT2W7kq9FJa
        aNnmsk/NgJEJQe41rDEO2QvJ+Mkppsyp4ZzNOmA=
X-Google-Smtp-Source: ACHHUZ5uJt45J8VEfYQKlWC06KABffhsfIFzjN0RoLZKFQwxZlr1aTdAte/qLLH498V2rLrOe6qGPA==
X-Received: by 2002:ac2:5b9c:0:b0:4f6:140e:c9bf with SMTP id o28-20020ac25b9c000000b004f6140ec9bfmr4835189lfn.22.1686615006607;
        Mon, 12 Jun 2023 17:10:06 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 17:10:06 -0700 (PDT)
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
Subject: [PATCH v2 01/22] drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
Date:   Tue, 13 Jun 2023 03:09:40 +0300
Message-Id: <20230613001004.3426676-2-dmitry.baryshkov@linaro.org>
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

During IRQ conversion we have lost the PP_DONE interrupts for sc7280
platform. This was left unnoticed, because this interrupt is only used
for CMD outputs and probably no sc7[12]80 systems use DSI CMD panels.

Fixes: 667e9985ee24 ("drm/msm/dpu: replace IRQ lookup with the data in hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 ++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 16 ++++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 0b05da2592c0..67566b07195a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -80,8 +80,12 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc7180_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk, -1, -1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk, -1, -1),
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			-1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			-1),
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 9c5a3fe9cfde..6ea1cb551348 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -88,10 +88,18 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
-	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			-1),
+	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			-1),
+	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+			-1),
+	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+			-1),
 };
 
 static const struct dpu_wb_cfg sc7280_wb[] = {
-- 
2.39.2

