Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163B57656C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 17:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbjG0PFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 11:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbjG0PFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 11:05:10 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B3C6A0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 08:04:59 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-98de21518fbso142762066b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690470297; x=1691075097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwHOgFrq4/BhE3FhnBJjD27ZTh7D72yQxXf5H5vBWvw=;
        b=YyErZV5gOb/2JmBJfdzn/w5mH8QPep+4zdzQnLZTub1pUqNlA5Ol1VEVGkzfT4w9tH
         wVdzJcNfBrCnsTHL8hRQzDAoS4B8sawi9RaGRI+cRneDWVeHimF1jsU52d5Lf91IdESj
         yU32WPnsrxofrlILD5PzpMxJPL/D2MoAT2yvh/gub81OFvhykyVOI3KpI/wIA4SzbFXT
         g0JC3nqBc13pnE5hha3BAcBfcp96zlHVT/Yhxa1J56mtpNd6237KhtGjot9/XsIa5EBh
         zLncMLXbMNceRRCd0NX0eWRibNcz4thdRTfdzgh+6ytdVSI/0wdvsmigauJxonaXDOG4
         jmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690470297; x=1691075097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwHOgFrq4/BhE3FhnBJjD27ZTh7D72yQxXf5H5vBWvw=;
        b=Tg67hcDRz5ukITDuMOPhqi+XnGVqONc+icxkWBMZA3PoCvK+LzewHRgyJj6IATbhIL
         wFKE1oRNmg66eIQK83rq7xwW09Z5YqposRf6m9zPdUXEyGuQzrtJPN+vgss80v/15IMR
         1MFxVv1TFXda0ZWKA4hmoALFOv7o7NSjgqULA8647QnEnydOVGBXHKI4Fzmg9guRf/lD
         cH/KJdTYiRLvXLItU6ppMz2YXM9O5rY1FWSwCTrxG3jUKNpHFfruxy0P8xDZqmUEl7pt
         dZIwy1lWhMn1fZ8wDpgNT/Dc+uklwGkK8SMa2yYD9pgs99JJUimmrvOLk0VLUEjXMJZj
         nNkw==
X-Gm-Message-State: ABy/qLavPjqElQDBUJtHEKsWANKEo8vCWq3Bow3YyfpwIxFTmIlrRsmP
        GorQIO6rUZI4NjJSNwcaxmBRRg==
X-Google-Smtp-Source: APBJJlHjj5zESFdiS3a1fGwYRHuinc3/xPR6hP19ChaulLFr4stgnxTMHMnnM0a0xFf0YnLO7sfIlQ==
X-Received: by 2002:a17:906:31d3:b0:993:f2c2:7512 with SMTP id f19-20020a17090631d300b00993f2c27512mr2170774ejf.33.1690470297393;
        Thu, 27 Jul 2023 08:04:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id jp21-20020a170906f75500b00992e94bcfabsm857195ejb.167.2023.07.27.08.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 08:04:56 -0700 (PDT)
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
Subject: [PATCH v2 0/4] drm/msm/dpu: change interrupts code to make 0 be the no IRQ
Date:   Thu, 27 Jul 2023 18:04:51 +0300
Message-Id: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
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

Having an explicit init of interrupt fields to -1 for not existing IRQs
makes it easier to forget and/or miss such initialisation, resulting in
a wrong interrupt definition.

Instead shift all IRQ indices to turn '0' to be the non-existing IRQ.

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/118088/

Changes since v1:
 - Rebased on top of msm-next-lumag and updated IRQ rework series.

Dmitry Baryshkov (4):
  drm/msm/dpu: remove irq_idx argument from IRQ callbacks
  drm/msm/dpu: move several IRQ-related defines
  drm/msm/dpu: add helper to get IRQ-related data
  drm/msm/dpu: shift IRQ indices by 1

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  4 -
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  4 -
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  8 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 10 --
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  3 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  8 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  3 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  3 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  1 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 --
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 13 ---
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 12 ---
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 12 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 16 +---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 14 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 94 +++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 16 ++--
 25 files changed, 93 insertions(+), 174 deletions(-)


base-commit: be4dacf4eee1c4e2e91586e75e95b2852274dc58
prerequisite-patch-id: be3f3e5df89f9f2cc6b6289a83422d65e29d4900
prerequisite-patch-id: 59cd61ccd3cde7218fe3db6a8c672faafb7167f5
prerequisite-patch-id: d493b9bd85d518c15ca94f22174cb5ab2e2443d9
prerequisite-patch-id: 6a5bf3083c3da70ca110c17d54027e96c0335636
prerequisite-patch-id: 670883101f3b5dca122501f2828d8e45a6843b38
-- 
2.39.2

