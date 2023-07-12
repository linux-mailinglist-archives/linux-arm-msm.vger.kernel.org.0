Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A07275134F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbjGLWL4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbjGLWLz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:11:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999DF1FF5
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:49 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso111548e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199907; x=1689804707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyJ8LHBlB4JYqr4VmTzP1Gcl6WI23AmqWBSQtKIAL6Q=;
        b=csxw0/68ovU2HjpA7dabaOzCJdarHffyEVOfxtcCJhdBle2lLR56vYO1FPdiieTUid
         G3r4VZtcdot3JDRsVPBswSFTMpG8p952hOFybG+Xu09u25/Dq3myAweEI3R7puOekePg
         EYBbq5ZMaKZgmeUOMT1ynlTKRDafotup9k97bAn3di3iXW+mHQywpC/o1m/ecIowWf1c
         ynG7r5z/2T3yTrrbvQlV3eGYeBQM6/okas+gWyTyvTxLIJqXXJHjo77Q9nL7T1Fl325+
         wm1TLDPzwHiq5BRewnckkfM+6Ym8gYqiL1NEjQEK1ALv7ED7gZJHqVI7GDFwc4Fx6yy1
         Y/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199907; x=1689804707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyJ8LHBlB4JYqr4VmTzP1Gcl6WI23AmqWBSQtKIAL6Q=;
        b=EzC+vobbcbyh9HvZ3wahoDIM0TNO7NQC8Dcnvi3JQGkSh9XyyENVrm/mGANECaR3RK
         Nzxv+O2n/Q9k7azpyUMnMclCCWzSPTv5OZ1lLHRoA7HRyk0+pKaInjCZDoS/y/1nK8pT
         itMTza5fbJ2F9mvLJGNGpyhqHYgia01FUSv9uyc4KGzBFV/e1Um2iABgRAYfZwPl/IRm
         m+fwP+3yG4B3jMSA8vUG2pd52XoMS65OxdMWvabaj74DlokPrZA1c35fD3Qgbm3jlF01
         p/BnCealnnxVojQSMCiSpkWwkb5cbxl39Wrrp71ru2QDzUSQPcsCmb1xTu+EHwi9VPR4
         Rkew==
X-Gm-Message-State: ABy/qLZj+PNwGfC02vxgzM6c2QM7n8TVeM09ahL+J+kUsa8AuH5Fkk4l
        InzyPZCzvk0wlSzXFVyVzvbojw==
X-Google-Smtp-Source: APBJJlEwSUud4GbTUOnON+/BbQ5489WbbX8IXPFWNlylLCwZy3hnUzMjoQzgllSNanUeRq4pQwcXPQ==
X-Received: by 2002:a19:7702:0:b0:4fb:8bea:f5f6 with SMTP id s2-20020a197702000000b004fb8beaf5f6mr14327418lfc.34.1689199907594;
        Wed, 12 Jul 2023 15:11:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:11:47 -0700 (PDT)
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
Subject: [PATCH v4 09/11] drm/msm/dpu: remove extra clk_round_rate() call
Date:   Thu, 13 Jul 2023 01:11:37 +0300
Message-Id: <20230712221139.313729-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
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
index d8c88ce5190d..896e87b13dbe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -299,8 +299,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
 			clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
 							clk_rate);
-			clk_rate = clk_round_rate(kms->perf.core_clk,
-					clk_rate);
 		}
 	}
 
-- 
2.39.2

