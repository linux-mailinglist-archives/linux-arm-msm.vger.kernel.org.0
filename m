Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8B070B281
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 02:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjEVAmc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 20:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjEVAmb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 20:42:31 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E853C5
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 17:42:30 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2af225e5b4bso35710231fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 17:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684716148; x=1687308148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bKu4gKGvs+WAdhSbwvOc7isenmKfDUb8D+/Pt5dQNBE=;
        b=AaFhJOwM2DAChTMb5HTqwJ6XmdF15LKyGRQayJzv/2m21AYVdV9j58DfUjL1TF18W3
         W3KmPB2q02aLuUhNwl7HLh+mf5H0zmPmigSiWU/SJf7eTLtFzaIQgoRRbQ6TT3qJVlmX
         dPGyCCTMCq8W2Zx8+7zD4qlVZEP48eJGfc0C4BjBZTSAeAphIjWprksOEKFWsTaQbY/Z
         hzOSl02rKu0Xp4OFqCCEqBT/h9Ga+l22mfycqDwO4PQpQhbCbIhZvn8LiyFwBkvXwalZ
         PT047KghElWPWcYQ5G3Iuzo5ZLtL7N95gRpwyKVxdaOAXakoUMn2M85ieZ8k9PPznpxa
         aQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684716148; x=1687308148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKu4gKGvs+WAdhSbwvOc7isenmKfDUb8D+/Pt5dQNBE=;
        b=k48x7LU1dazHMh9cB4264j7F7VoTZQE8vKaun3mM6CwCbm3hVXU8SL5fPmm2VR7+q9
         VicNMadUD+uSmnEoq4PjD0JvJBHPpLkXvMYnIvl/VDpmF1+GJf4wLqKxdZkl/sAQ7cL6
         8gqsw4LH46RVW5vsd328eEzsqwTWQrI+NDGgsbqbX4/Y8Nlc13S2KicgGq7T+mWPUG5B
         u9O3MKQRc7PifpDpKmmEd7K1IMkhdg6HcCHRTvUBArF1dr8J1QeDXJ7qGd5Vn3TUR0Qd
         fB/pkeCROgbGh48TmDGfyjZEMKODCRsQ7nvF1FJSSTloWelhNSPRXHEoYtc8Azj8jTyd
         eGVQ==
X-Gm-Message-State: AC+VfDxOm6ycU+Fu2szslDy0WqcAocf4hskC1+zA79GAYpmYL4ySLKMm
        vTQYGD/25pO+U/PfT4cOT/ucpyLXCFjQFDhTYaU=
X-Google-Smtp-Source: ACHHUZ6dCYV+20WpcnsMIqMQQkkVm1RftMryyED3QDdJcrj+koY7XSJwaQZR8xc10jieIuEaQzvKow==
X-Received: by 2002:a05:651c:22e:b0:2a7:8b35:8270 with SMTP id z14-20020a05651c022e00b002a78b358270mr3432378ljn.35.1684716148455;
        Sun, 21 May 2023 17:42:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b15-20020ac25e8f000000b004f139712835sm768159lfq.293.2023.05.21.17.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 17:42:27 -0700 (PDT)
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
Subject: [PATCH 0/6] drm/msm/dpu: rework interrupt handling
Date:   Mon, 22 May 2023 03:42:21 +0300
Message-Id: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  18 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  13 +--
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 110 ++++++++++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  21 ++--
 17 files changed, 97 insertions(+), 175 deletions(-)

-- 
2.39.2

