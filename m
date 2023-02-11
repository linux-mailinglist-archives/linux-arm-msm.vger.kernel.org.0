Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26D5B6934A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjBKXNI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjBKXNI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:08 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACBA12842
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:07 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id gr7so23951597ejb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpRHeykuYnGtrJrQTjeyDukXXpYgYvcamyG7oYZbhNc=;
        b=mzLtcLtqPWVRH1+dG2SBh5AQuzDqXtfKVj95OSok/4qEFGsnNrrB0U5s3BIgTsBDqc
         I7Q2xs5zbW5RCPIB0x4qzDNGYSZ6VhNuEDjPN/Q6t7FwZKMRra9rA67fLX24mBPEgpOi
         RJMkTXkyKqeAFwxkQoJIYDZuUXO6fGPcSe6lZvaszv0yuaHPdYOq4dFhCPutZXurYhZD
         P4+mj/vUM2hgK7Tb9aiUB050dQCon2XEhfJ/1itD/NbV9nMSBE3ycJXCz3E5DPZoYlob
         AKof5hXEnsic8WwvFEzNF9oMqN19mRmSPnVGLLv26UVNlyJLdxAcrWiUd7DiQw9Ud/dN
         S1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpRHeykuYnGtrJrQTjeyDukXXpYgYvcamyG7oYZbhNc=;
        b=xwCJGQjLaC6bRjIb0ByZAbVXv2w3rI9w8zmmvEug5hlfJW4g6/P4AzjDpRfo7wYQ9y
         GnVtEVp/5xLYuRriCUdOLv4JCrrmIEdcL9WsfbtMsNk/MTfkzZpKIvyHKH24Pw6PJcBL
         yZrBVQhpQBfYPEIGy6lv3Nn3u4fxpjjINzf9dmaUhOa5zd22TE+NwC/I0DU4soRougBb
         eT0/M2Vwvz8G3Js5Zo9dWE/UF0QznP9T2kz/xkxLtGfg/fr+P5OHvd35Y3jwBxzega6U
         ILMgArAaYwHUCpmL7dxL6sj+09hxH7sCJwoJSdKbkglnoKntIEUgFb0ruqXCBxNmvq+x
         +6qA==
X-Gm-Message-State: AO0yUKV2HAKJJ7qE6MClBq/3q7Ti82mF7cltz6+fscu2R8iW9M7Jm1ub
        owAsIEkZQrYcxrsMp5xx7HFjQA==
X-Google-Smtp-Source: AK7set8kNrKur4FNkMftn3tZK5DxOpYVgBQMHUSuhq88BZQ5h65lNJhmhq7RcP4W72AZl0L2E3M9VA==
X-Received: by 2002:a17:906:fb98:b0:870:3c70:8c8d with SMTP id lr24-20020a170906fb9800b008703c708c8dmr18590015ejb.17.1676157185648;
        Sat, 11 Feb 2023 15:13:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 03/50] drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
Date:   Sun, 12 Feb 2023 01:12:12 +0200
Message-Id: <20230211231259.1308718-4-dmitry.baryshkov@linaro.org>
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

Fix typo if the name of the sblk structure for the sm8550's dma_sblk_5.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index eea026cf3ac2..e8b12788dc94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1309,7 +1309,7 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
 				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
-static const struct dpu_sspp_sub_blks sd8550_dma_sblk_5 = _DMA_SBLK("13", 6);
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
 static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
@@ -1331,7 +1331,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
 		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
 	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
-		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
-- 
2.39.1

