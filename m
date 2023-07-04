Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 138547474CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbjGDPEJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjGDPEH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:07 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78BB10D3
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:04:06 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6adef5c22so88217591fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483045; x=1691075045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pieIq/XM9siLESliq0xx7Knpb1NBYGOxDjjAn9WsS/M=;
        b=CWlijt14kw2HIgnQK5fxNHhe+kXCKIcLqH+lH3+4nCKfIfyt8Q85XYKpvnrHYWsGQW
         0eeMiibs8whB3yOosB12jxDpa5fEDY7JX3wOm+xoPOmrD8FvQbjWgoK0OuE9ODoHhvEH
         5cg5adZyJUOzOBXMfRmvm7qZGE13T4HeF+mjhissQNfvIxkdIlyav/tDLbU+jMY+woMn
         wJnDi5e/nPb671x4tAtytsUTaMYRwxQIZjtwfUchi7QTL/Aj0huOmjgzogBLLGpN0rG1
         JtXm8rgkZsDrxzE+BDfIrQkHBjPrNNIsfsfAHiOE8mD6VwidFfAieBKVVXsxFUtX8b/Z
         ZHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483045; x=1691075045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pieIq/XM9siLESliq0xx7Knpb1NBYGOxDjjAn9WsS/M=;
        b=HDJvcYx7OuUpoECYjo3TyNlCfAVCVa9e71gL6kr1czAVcuD+ozu2jUzjNr8m3QknIJ
         xtV8SkGShVSLAcwBeTojByRSb21MIvLDBUqPxA/u04C2zkoMR0SvsJpgcAd8ITdWo3TK
         1N8avoEwGINY3bpsG0CkFdGX2AJA1j8DIwJ9g1DL9hGXobw/ptI88sU3ZuKJghIcPG3o
         VDpNr1yVWM+vuQ8bcDDE4dDdtH+9gACogJyO/jGtKPhxhEws2rXgu8AMLVeTHcLK7FKP
         +jSMk/fb31xGRTIGf3crGpySXpGPf84jc4AL2E+bfuToC4Su7kJjA4Q2tljnohoZzzQf
         przw==
X-Gm-Message-State: ABy/qLag8BOxvVm0ggXs0cXZf76RV6tSfDxEwTfutcqbP6TCxpcWYEnQ
        82d9e8Z7RISnNUYmC/2yX68oLw==
X-Google-Smtp-Source: APBJJlFpjYVEzi31is0y37Cyyn8jOydRM6m4hsZ/CgTlRBLNAm9swggAuLlZTFcFc8ekiEyNjB3zig==
X-Received: by 2002:a2e:8605:0:b0:2b6:df71:cff1 with SMTP id a5-20020a2e8605000000b002b6df71cff1mr7082394lji.52.1688483044987;
        Tue, 04 Jul 2023 08:04:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:04:04 -0700 (PDT)
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
Subject: [PATCH v2 12/14] drm/msm/dpu: core_perf: remove extra clk_round_rate() call
Date:   Tue,  4 Jul 2023 18:03:52 +0300
Message-Id: <20230704150354.159882-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
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

The dev_pm_opp_set_rate() already contains a call for clk_round_rate for
the passed value. Stop calling it manually from
_dpu_core_perf_get_core_clk_rate(). It is slightly incorrect to call it
this way, as we should round the final calculated clock rate rather than
rounding all the intermediate values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 906611f6b879..d533b63f90f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -274,8 +274,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
 			clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
 							clk_rate);
-			clk_rate = clk_round_rate(kms->perf.core_clk,
-					clk_rate);
 		}
 	}
 
-- 
2.39.2

