Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCE09768302
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjG3BBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjG3BBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:01:12 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580AF1BDC
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:11 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9cbaee7a9so35121901fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690678869; x=1691283669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DuTgbIVG01rucluqHZXMfn6fgJVuPWJQYKqeE48JKY=;
        b=ZR0F/XS+oewEfkAI4LqftoLhW++P/PgzoXtpm6aGosSuji1UEASpBXuQBvGUmoynKP
         05fG7BAsc8aubjjQEIzC/9PUK+bscvjlWJf77fcZVDVI5KdqJGT897InCtrV4EKVB0IB
         zuLs7sWlyqXI7/8kZakBGkMfCVHdhP/SXWWJG6iA3GnAYet66jFj9gBn1pEugFysjc+M
         Y9M74W1JbpC+A39P8X3+p5iqABZRXy3vZWXQiOfVZ4a/zg+ux6g8+KPeubrLFKVJUfL7
         y2EQUStj9EBccD27l9YWUqM4gx8gEel6IQV8COwmsHNClKMhgpYGpGl1n6IBGPveOmVl
         rnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690678869; x=1691283669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DuTgbIVG01rucluqHZXMfn6fgJVuPWJQYKqeE48JKY=;
        b=f43TXZg7k6c0F29IcvLIzczak/QN+9sfx2g+mwqelV3VkD44qnx4CIz89jSWJ8PIWw
         DSKz4zT5gXC1SRZaltdGzOIN8R3cNpkalIq0v115ERrto5bj6zZrcwEYL/rd0saaYsFb
         AivH4rRJwmTrvejUj9k7PKkbTlftyDfWCX8Ki0oN3qyZauibwJWjfPDZLZqG3is9IVGi
         43e/X5HPDUrkiPq1GZv5WfjLNtM7xbFAloUbxTfwr6D0fkJ5i2TQNQlRRyqbHQo36Djb
         vl2YrEnBtixCWWqaQ3gzeSdtyHIskGLfl9sdvBJuo1iilnpCqt8rc64GLvc2Dzy2PtxA
         qoiQ==
X-Gm-Message-State: ABy/qLaPu4twlymzplSDExNFOpdYeK4hMWVBZrd+oCFjKAI63vMJUOcl
        EqHa+aaGaL8NJVAeqCF3WcxkbA==
X-Google-Smtp-Source: APBJJlGapWuQ8lAK9Ja32K/3KnziQMJWOT3VV9UhtWijMGLRaEjETlLaL9qrJfW0M/PDWKkekK+Pxw==
X-Received: by 2002:a2e:8003:0:b0:2b6:c236:b040 with SMTP id j3-20020a2e8003000000b002b6c236b040mr4820159ljg.12.1690678869779;
        Sat, 29 Jul 2023 18:01:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:01:09 -0700 (PDT)
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
Subject: [PATCH v5 08/10] drm/msm/dpu: remove extra clk_round_rate() call
Date:   Sun, 30 Jul 2023 04:01:00 +0300
Message-Id: <20230730010102.350713-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 3dddec868bf5..6a0f0ede4781 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -294,8 +294,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
 			clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
 							clk_rate);
-			clk_rate = clk_round_rate(kms->perf.core_clk,
-					clk_rate);
 		}
 	}
 
-- 
2.39.2

