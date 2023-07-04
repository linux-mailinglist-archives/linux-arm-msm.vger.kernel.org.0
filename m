Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 883F57474BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbjGDPEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbjGDPEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:00 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A2310D3
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:03:59 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b69ea3b29fso91951271fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483038; x=1691075038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
        b=eRPnUEHtJHryVOVqJkVGBYwQ5UYzMkQXRYAtS45KefIqb3KipgCoIaBlKL7bRSXHdm
         nlE8Oj/LwmEJN7iE4bOOMVagZffzebpZrnP33/W7ISTIktbe5Z/4cB4eZZfJYA2RwtgL
         pgDSH6GTSf9kFMA30f+mQK6nP1oAG6e8l/0eiMVf9cPGsRag8F2eGDba7o0Ff7w+qNmT
         TXJMZp4iZ3LT3+n/jjJbdlYcET+54RhKDFjNognSLbCP1EXgPhSnhJKAGhcVdFtBa2uG
         Om4rOzTBtPZT5uV0wBRpKgm8iTLl2ejQ3ftxCkgAl7udHQ4AOIgFVSKavYj13aT41kr7
         PmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483038; x=1691075038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
        b=TA8xyt9x8JRk1qTpCrFlxbTpHaf+22IhMW8BYAcMiJZpOQndidWe3tCY2QTzysZKCA
         70d3UibwsliKdTWMgeG46qqB/+0K+qUai4nAzprZSXG0fQfeyXmqTCQ0Fuanbtc3IDyX
         0NqJ59zJIYICKhldb3V1r2AAJHXtZtb5jLeZDKfSgifddhkZ7fn5t9AAhA/Uc5qaac0s
         4yLetQ+dDqvPZNDLdXgOoPjBPI7mCTstU5BkgqpxOfGwtKj6i4Ut+Yil8iewG3HmFnl0
         96WNR/PPsQA1QIMMObNv889atHzuoDwbpD13KzzU9FjW9+MrN7JAeyFKnYsZlIismNzL
         UMrQ==
X-Gm-Message-State: ABy/qLYdbyouB10lO7hrxDZzfYV9uCAlO2YCc3fuImR/GNE3MPdSsCNy
        gr8ZVQB49T0MuTg+xOP/yvijfw==
X-Google-Smtp-Source: APBJJlFyv1W/R/7VTQdE5dFiynY7eN0awEen8if6H2sa7Oz0cOji+wA2SPd82jd9tMhVfbJkx4Xe/g==
X-Received: by 2002:a2e:96cc:0:b0:2b6:cc12:4cf3 with SMTP id d12-20020a2e96cc000000b002b6cc124cf3mr9703950ljj.48.1688483037903;
        Tue, 04 Jul 2023 08:03:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:03:57 -0700 (PDT)
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
Subject: [PATCH v2 03/14] drm/msm/dpu: core_perf: bail earlier if there are no ICC paths
Date:   Tue,  4 Jul 2023 18:03:43 +0300
Message-Id: <20230704150354.159882-4-dmitry.baryshkov@linaro.org>
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

Skip bandwidth aggregation and return early if there are no interconnect
paths defined for the DPU device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 333dcfe57800..05d340aa18c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -237,11 +237,11 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
-
 	if (!kms->num_paths)
 		return 0;
 
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
-- 
2.39.2

