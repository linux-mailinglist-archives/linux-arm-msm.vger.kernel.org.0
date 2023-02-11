Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B80D693504
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjBKXNt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjBKXNs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:48 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383A0193CA
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:47 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id c26so19167814ejz.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCNhmTyhkeISKvFLOykUTjbjiGKCdGxhslVjfkllADs=;
        b=LVSwbNnqyV02HYGaGq+oxqylXUd/CZJuOWa2qU+TRpuB6bUiSXXGrcNGSzCalZeQIZ
         uMayYktXwl1QD85g3Qwpsg7q+eOT+1Mu1SV1078ruR7kpozAU+Pq25NrDRrARKQPDK/1
         cMv6iapvSfaqQ84WcPDeMUDevicarJ4abN3TLjigorKF8z4iRTc5Xjyf9/1CeY1hbIDE
         Qo9LoshyfWvG8eH6n1y+iFJfc6vzy6Q8fBKxs6z0rENddatmqqhPIaNlsD5J14/WA+Ko
         fBLnzYVhqNovTZarsllmSSw1eV6ZuGQsCe6T9BFc+ORiq6P/FPzhE01dC/1iw1JkllqJ
         QhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCNhmTyhkeISKvFLOykUTjbjiGKCdGxhslVjfkllADs=;
        b=wDZSorEg5XnHWh4lYmLtyqlFcbms7c6o2ZDwvrFp+sWJQwhHxmGh+yfIyRqBC87AH3
         l0jLuNT8jlYSiAm1RqUrcYQFzFMT25qHHcLK/SWcSf3gcVOD9mqrhw752jSijjtmG+4Q
         hsm9w1kEcOlEEgVeCuLj2oFivxGLfVaalYp6g8vQxNd9j7jhPbIJPfF99xDxQIeovlch
         n7kZG31jKSxksAcTa8tGm3tP0UJvB6f94kl/m3HBL2v88LcVY3f+GX5QPLiSEYvppcCC
         sJCEUR/Da/5IPgnukagMzDT38GcSdSCgTh71TCR6hDAWOgAUp4MM8L0lEYbIjNITf2gi
         WxBw==
X-Gm-Message-State: AO0yUKWUtX/hGDXnkOuI+tZ/4X+wRGMQeIqx7nyrgJyjlZ14craQwhFJ
        AUkSGJ+8S0jR7RJz+L8tDS9VPQPtySxt7BMi
X-Google-Smtp-Source: AK7set/LgXO/XBlBP8R9jAk8yD6BU7XE0F0Lk/CDyQ7HVMSGfsYGJabdBCvZF+XLJVuh7Pq/iZwsng==
X-Received: by 2002:a17:907:1c22:b0:8aa:bf48:aae1 with SMTP id nc34-20020a1709071c2200b008aabf48aae1mr25112450ejc.6.1676157225787;
        Sat, 11 Feb 2023 15:13:45 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:45 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 38/50] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Date:   Sun, 12 Feb 2023 01:12:47 +0200
Message-Id: <20230211231259.1308718-39-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index a3faaab2226c..3d95f2472e7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -107,9 +107,9 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
 	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-- 
2.39.1

