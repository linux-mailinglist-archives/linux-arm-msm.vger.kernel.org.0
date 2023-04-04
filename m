Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203556D622A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234992AbjDDNJb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234964AbjDDNJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:09:30 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20DD359B
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:09:27 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o20so30834620ljp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9RjXB7jo5zEV1k6ONRMcFgRoz0BlCwoDv0zWbhtW18=;
        b=OQoqTxzjoywXHb6nzr8foBdOy1IwX8GB5+8NFdM2nL1sM9I0JURXwetR9U0s2NYP0f
         aZ49o6KkiIY2VanzVD9lb8wbLP8MbXDY99cDpvT0d+yKfkDEuHs4xm0VjS4j+BaJtmMw
         TEqHEUNI2ijs/07+Z+zmhTwpm7Ah4/nXDo5EBc8FOI79ufN+vqHIPzm40j8Wxhv6jNto
         iBxJ2NIpZBZ0L/KLDBxBtxDG2thbjCZKAoC/nxK8+GhDJJ360Q5UAa4QEisiIIL5B/Tm
         585r/u3IekT48xDT0WGt8XYkAL55HkAN7HOzniSJqRaSStjikT5mGD9oqbDwmF87Vyrm
         C3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9RjXB7jo5zEV1k6ONRMcFgRoz0BlCwoDv0zWbhtW18=;
        b=AXDTwjqMsaRPyrgSz4YFDm4Ro+d4rZRYT8MGlwfZ1eYqeZ6FTYCmvdv8gSyqy/qcla
         0c3anAvZ4j4Neto5B5O3og+PxZIAY/eRyaFMFTcSfM/XXPGDv6Jxvy0Xk8D89ynB/7FN
         80rRQxdqhsfzLIIW0FjV5seUTzaCgHgRLLOxzVpt/088ZdMZkIRLUz6KqmsBWCFmrWIf
         AndqmpsjxAngdE4VPk619CQimcKydma0qRtzcWR8HJldEJIo4AyDfOenNA6+/BwHnyeb
         /XrbAv1WG01LzbfV9O24DPb+weBwMUQiEW9OjK2UBu8ASP/fxGlMOCrgoTn0hMQFgicL
         77+w==
X-Gm-Message-State: AAQBX9cJJSr8eB+ZwbKOYhCDaG7aP8sBfo39A4LUw4O0kpawrO8KZsBD
        a/TZmcnpiGtScuIRWOHvsp9LAQ==
X-Google-Smtp-Source: AKy350ZIncBxIj5hG7Gg5xMST2w1dLeaULTn90xtMqhEnGIh7GvRQGX0l/NzmNxbnEjLeRH3VBXxBA==
X-Received: by 2002:a2e:998c:0:b0:2a6:146:b121 with SMTP id w12-20020a2e998c000000b002a60146b121mr897253lji.7.1680613767579;
        Tue, 04 Apr 2023 06:09:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:09:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 32/42] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Date:   Tue,  4 Apr 2023 16:06:12 +0300
Message-Id: <20230404130622.509628-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 6f573e28582e..cae08b5207ff 100644
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
2.39.2

