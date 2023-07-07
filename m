Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927F174B768
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 21:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbjGGTmh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 15:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbjGGTlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 15:41:23 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769B32139
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 12:39:51 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b6ff1ad155so42615311fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688758790; x=1691350790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DEnZwVUAJML8EpbXmdP0CSsN5z4sVoNZMc92oALgwU=;
        b=coO9/JvOLjw/Or1JsuBG+fEdkn9aCi6zCbFLKSdxqwFW8w22qa4BN1DmNIsdXoLmzf
         wWtCBaeJE/GWYx4E5alOCnzLWmf6sbqiImLeoQmseEYZctfln29GQ0H5jaI2Dx8GTmLa
         tSFX4ArxacWPxo36X6GmWy+DnOQy+GABw3F4lL81w2NyfobcroSj1Y6gMkSmrfOwlI5K
         SDlwV+0koPe5RgtTw6dgpPWLsipxzoBGmHRjvrkDpGrOS5Jnj7VJL/zRDJGbYFlblOSK
         cjsBWbjbgMkVIm/dJCTkAJa+4FZlgnOS4K5ksTc+3/ih2nhIXZvjAG13HzLlzQGip9v3
         CgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688758790; x=1691350790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DEnZwVUAJML8EpbXmdP0CSsN5z4sVoNZMc92oALgwU=;
        b=KQJi/ws1PFPfKjvojLmsMEGE+YR1481A4HEXucjs9MAbc0vq6ACS+jLdET1TCc4cbs
         wZaELDHJgoDBfd181MuqmJi0YT9e1rTxrl9ti+1X/9n5BGHYIyTeWMHjszkyA6OYNhhx
         gqjan1xmlbgTIuMIsDz7Olp+kz069v/VEcsWz5WckTchALo+K0mZVPrc8zltSLmG+LkI
         T0qVt9i9bZ7Ae+CUJ+IJFB3poXJ1dDolB1YyAF7+l/srxCKeR2SnTeaXFnjcvDYHTIiT
         xUaLOHl4+FLb+RdDIEEEq1Hnd6efu3yCwYZuDVwgH3QclARLa+gVeKgcrHBVUuISPV/v
         pdQA==
X-Gm-Message-State: ABy/qLYzZ3XkePtYqj4aRuri6ldEa2j87zYgFu+OddMgYjO8Tvr8jUab
        o9QSsk/xf1a0vS/yKrU7poa2kCWxWPpEuIajPCI=
X-Google-Smtp-Source: APBJJlGC/eiqlgA5hEg30i5pWnlS9zOvhENdz44F1AQhiHKOpFn5oHBr7SM5ijdh37rPLJ/JZF27Sg==
X-Received: by 2002:ac2:4bd5:0:b0:4f9:dac6:2f3d with SMTP id o21-20020ac24bd5000000b004f9dac62f3dmr2425167lfq.13.1688758789763;
        Fri, 07 Jul 2023 12:39:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 12:39:49 -0700 (PDT)
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
Subject: [PATCH v3 09/11] drm/msm/dpu: core_perf: remove extra clk_round_rate() call
Date:   Fri,  7 Jul 2023 22:39:40 +0300
Message-Id: <20230707193942.3806526-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
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
index afd75750380c..a570810c9254 100644
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

