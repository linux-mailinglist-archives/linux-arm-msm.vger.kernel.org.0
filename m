Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED376D1144
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbjC3VyP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbjC3VyN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:13 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F781042E
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:12 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c29so26407061lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSGYAnjYlWMIirvaH1Sanwl/quotXgBp0oRpKcZmP1Y=;
        b=R1r49UmelUt43sBTL/xXyOthIADQIuMLn41NxVrVtrOAqI2zbXASxIDBtBBG07h7m/
         1jfWInHJQUp2q4G8hn2NZvKyc8z6e4r9OR1xY5igagjLKo9htwNWy/208P1s1MU0/AwM
         ZTNrX+psUIXKMD4qrzrLAkBt7h0NvDfsWwl/p4CMEA14xDAc3nru5MjnGI44hhWvbAS9
         cfEdh3G1oxIrQKHRnOt7H6j7hgUCKeyb/cfu4C+d/omN6SdFC5QeUFU5FJ9lElVQNjgF
         ZoNnxvQF2RYCTPM7WFid7CReiBtl1CJKyT8J9XSbf4XGSyl9l6nCdaz2bCUTZUbpqzQi
         lCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSGYAnjYlWMIirvaH1Sanwl/quotXgBp0oRpKcZmP1Y=;
        b=fPmnDtwbWyVZBwuW7aqbcWT2iMv0E5vaRibVWBQXMVFFLv3F5bHFial2DEv7X7VabF
         7NmNFzXUALLBLl76UAfOpw+50Dwy6f/ZcFKikEQZz1+a4b7eqri8QF9w5SgelZgvpWbo
         Tp3ZgrmQGkASK0BS8bm7wslSmb0pL9lLpEHF5/bGb4LfENJLMQULI+7RTEZXpVsEZa0I
         UyKYvmh7S6vNaIpaGRopp6f5YFAVzDMSmO8VvGOdAAD6Kf17aRPGsuOGynRV+VdXiGcN
         8dKiixAakcA7EmDkXh0hKa+Pq6Y/FV/SB25Hkwq0Izbcvwp3Nj18G+1+9jbeHn1BIu9t
         VnNA==
X-Gm-Message-State: AAQBX9csW2Y4o06lasrQ8vzNkGu5Dnii9K/VS/mBFYNytQxhCUcjIcup
        deq+AWbsfnm9ZeTv7osTMMFa3A==
X-Google-Smtp-Source: AKy350Zlrj4KjyreGsSvQAjUQzx1ZJbpefQgsfWZVG+JPhk/i8xBxqA8v649HN9R0v+8oTMnPl4mWQ==
X-Received: by 2002:ac2:46e4:0:b0:4eb:10b:a8df with SMTP id q4-20020ac246e4000000b004eb010ba8dfmr7323615lfo.26.1680213251640;
        Thu, 30 Mar 2023 14:54:11 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 21/38] drm/msm/dpu: duplicate sm8250 catalog entries
Date:   Fri, 31 Mar 2023 00:53:07 +0300
Message-Id: <20230330215324.1853304-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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

Duplicate some of sm8250 catalog entries to remove dependencies between
DPU major generations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index b1c0cf882314..9afcb6cc50a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -80,6 +80,25 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	},
 };
 
+static const struct dpu_sspp_cfg sm8350_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+};
+
 static const struct dpu_lm_cfg sm8350_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
@@ -177,8 +196,8 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.mdp = sm8350_mdp,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
 	.ctl = sm8350_ctl,
-	.sspp_count = ARRAY_SIZE(sm8250_sspp),
-	.sspp = sm8250_sspp,
+	.sspp_count = ARRAY_SIZE(sm8350_sspp),
+	.sspp = sm8350_sspp,
 	.mixer_count = ARRAY_SIZE(sm8350_lm),
 	.mixer = sm8350_lm,
 	.dspp_count = ARRAY_SIZE(sm8350_dspp),
-- 
2.39.2

