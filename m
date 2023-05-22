Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA3470CCC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 23:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbjEVVpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 17:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233408AbjEVVpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 17:45:32 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A84A7
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 14:45:30 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso7278855e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684791928; x=1687383928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6gn7Y4qoY3ku7wbFuicMLgC2spCVikeHkn0CM0cq+U=;
        b=TRrV+NSmwH0JScLFBWL1YvLsnvWyGmhV732WFztodQD6F/T+kOgYt3A3pZWyVNT9+i
         2YYeRZntBy0nhvzlYJB9YDLkaILZ3xKklZmBq+y/8MZZXjJS4kZ/dbn5atnD3fImLPwX
         BQ8hDRY5/KEmVir/eab856pq0xPu94/SFsogYvsvTwFa/fWW3nEl7nnoGXssJKOOabLa
         aKWLV9Q6m9a6vZaXkMhIvnKdMmj8IIHZr6AVgMKaSTKHykkjVCNWXrf0wQvc6hn5HtP/
         fTjkdbK0sgnwHWeopBFrRXJuzy9eNj3kKrRQ5r8TRlHfza73io76uDdw1oBu+QEWltld
         cVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684791928; x=1687383928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6gn7Y4qoY3ku7wbFuicMLgC2spCVikeHkn0CM0cq+U=;
        b=XCLwnSvVAAq+mYcMiOVQnNmf0jlvj4f54uNvFkMwRqa/YaimGCJhBukLhVXxVAOCnw
         ryQannNxkI1gM5hM8ETSKXv4vMTSf4HcF/r50vg5NGqlfO/w0P71uhs4ZtVSoT9+ut8w
         xKHqcTe9em+TKN3c6YJFDwv1AVai8diOAaVU8317p5aJlFVo27vVmWBhHYysY1R6bN8r
         ubho/NPOR5OuSs4tzkdSR+KUJf7xPBoVQQC6i8Y0aZOf7k/s5Cd2XXzCexthDaViH6yF
         7xL3oM1KLdb1gde7WXim9RuIY7MkeqP3Co3f7RyOeWyc10GSe68k64CMj64+g+bkPwf2
         dluw==
X-Gm-Message-State: AC+VfDxaQcqSdSkQr9MbGwRYe9fujUJKU19UwpF+DBYvdfad5AYzF2B+
        xn4dbaQwz7pprTV1M7TT0TAhSA==
X-Google-Smtp-Source: ACHHUZ6TaZjp2uCnvt0sLePWE7ya6+815pDv0RMQQ2jfUWQNEJpxo0lOlEKl3dQqPUVkcSLKV1a0jg==
X-Received: by 2002:a05:6512:21c:b0:4f0:5b4:4863 with SMTP id a28-20020a056512021c00b004f005b44863mr2944951lfo.0.1684791928542;
        Mon, 22 May 2023 14:45:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020ac25507000000b004f2543be9dbsm1106918lfk.5.2023.05.22.14.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 14:45:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/msm/dpu: rework interrupt handling
Date:   Tue, 23 May 2023 00:45:21 +0300
Message-Id: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this static configuration with the irq mask
calculated from the HW catalog data.

Changes since v1:
 - Enable dpu_caps::has_7xxx_intr for DPU >= 7.0 (Neil)

Dmitry Baryshkov (6):
  drm/msm/dpu: don't set DPU_INTF_TE globally
  drm/msm/dpu: inline __intr_offset
  drm/msm/dpu: split interrupt address arrays
  drm/msm/dpu: autodetect supported interrupts
  drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
  drm/msm/dpu: drop compatibility INTR defines

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |   8 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |   9 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  11 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  13 ---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  10 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   5 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   5 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  14 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  10 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  19 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  14 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  14 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 110 ++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  21 ++--
 17 files changed, 102 insertions(+), 175 deletions(-)

-- 
2.39.2

