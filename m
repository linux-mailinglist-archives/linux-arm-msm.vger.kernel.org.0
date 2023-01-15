Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5E166B10E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jan 2023 13:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbjAOMl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Jan 2023 07:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjAOMl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Jan 2023 07:41:58 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077FE213B
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 04:41:57 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id y25so39243986lfa.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 04:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNWyPfscA/NuHJHmZQjpSPIoHVjgZDvP+Ju7BCFKeR8=;
        b=qGqRA39zMsMKs+oKHldZM+tNFHve7z9THNoEMPfbVglKoJRGSmw2TACARP9WH+jyTw
         2FHh7foZg8ZW1tPcu22k3q7E32YdIvefChs7w15XrFewT6N7av+WOhrcLwHmjrDtwOgH
         94ZJkq1FT1y6wBhkonkRvh3m9h9mdmm51v70DcgjfyMhFqaTfnB45pxbeb8/QICk048d
         lPXAF+iw6AaPzZf2GjCo48kJ2JMfM5hUSguxYlE4W1dov5opc0F9n9h7PiYAE0M/WwmD
         JSQP7UXidwKNfFaEHRlqIJZbnirvo2/4JQeVSPcMtRdu6u1pmUiLSO//SwH187lW+FMU
         wyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNWyPfscA/NuHJHmZQjpSPIoHVjgZDvP+Ju7BCFKeR8=;
        b=Hso5idRVN+lb2Mmh9WPuTwr5JZEXQ/1uFK4xXhlKlGxXko5BG6aJeQTAn7BU7prwYo
         feXKL4qAgPfNHp2DDDVWg5kGAcgrHzDC3Sf9rSKStlgKIabdXBO+SJAPPpU4ToP5y1bk
         CkKqIk8GAg3fJuBrC/b+lCQOfEnRczZWGCdvg+8KY9kAkkmtsKkyYgiagevy2sJtkNmH
         xkTBAqM7nLKmsLx/24MvYi6umiI99QScFQSNqDvv9sCD1E8MdFsdUDA0qa/HMuu9AaLT
         +c5APlKs+mk3TXGfE8/pJbbu7RZl0zeOPYFffx5N9QIdraPldf4WDtRo9b0fJH7PSiqa
         daTA==
X-Gm-Message-State: AFqh2kpciBiWWqRMpIMedOLVIMVD1Y6SRWkrdbTNBgklZSlVTkPMKEt+
        khKYLtPnjINYA8dErxx9Lfxe9Q==
X-Google-Smtp-Source: AMrXdXuEtzFGi7S9tuf/so/YhH2yU0wR4wrvqBijQ5q47uzb8qSH1+w0unQvNQD7JbJUofp40jVhsQ==
X-Received: by 2002:a05:6512:3769:b0:4a4:68b7:f86d with SMTP id z9-20020a056512376900b004a468b7f86dmr29814695lft.17.1673786515322;
        Sun, 15 Jan 2023 04:41:55 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.85.102])
        by smtp.gmail.com with ESMTPSA id 22-20020a2e1456000000b0028559373a31sm2688243lju.112.2023.01.15.04.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 04:41:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>
Subject: [PATCH 1/2] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
Date:   Sun, 15 Jan 2023 14:41:42 +0200
Message-Id: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
planes). Correct corresponding SSPP declarations.

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: Jami Kettunen <jami.kettunen@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0f3da480b066..ad0c55464154 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1180,9 +1180,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
 	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
-		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
 static const struct dpu_sspp_cfg sdm845_sspp[] = {
-- 
2.39.0

