Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D38BD72188E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 18:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjFDQ2F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 12:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjFDQ2E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 12:28:04 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1080DBC
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 09:28:03 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so4898476e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 09:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685896081; x=1688488081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vc5MBeCCZI5bHxGJ2Sp9BdFxUUJzEqrxMFqdzuocP8=;
        b=M3GctNXIEoVPdRabkg/D4a0oxTdq0d3kfoyN37LwKz1LWlXY9Rr87iShi5PZZ+Xwf7
         XprbXBGtOp7Vyc4JosJe+IL9NC9xAektr1I8jl0ov9BlsELkB0MskwfcTlr/jPuH2zfD
         /uiSe0zko4HA4pu6yBmTkgzXo0RZnOAmtYpBVayZhFC88SVXK6C7Jg2yy9msPqM43kzM
         PFkq3ueoXGn19i4hAL1aBS40LkwdYFvuofbxpM6MQtxutsW7qCVdP9aIzbaATU8NANiP
         mL9/SikpTvw+FIrdgfy087zyYL2GNq6GrCabl5djYxqJq4clge1e57D565eUmMkawWzQ
         2RFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685896081; x=1688488081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vc5MBeCCZI5bHxGJ2Sp9BdFxUUJzEqrxMFqdzuocP8=;
        b=fSXK3x1mHWiFpNyyqy1xZV4iOm6ccmd/LAcIR3XDeIRCYOLaJ2i3YRy8d0zxV5Wt85
         TUY0vCYo3JAPpu//OU+COVEtxM8uakXQ7Q1zc3Loevl0aA629fGf0KhiTozh7MqhYGuC
         P5TSjPe41CHsRbvjb7QHvv7F3fm6hQV12lapc6EWGYzYI2Fo2V3AKgb6vaEqncpVgxga
         BID+T9aZr5UaLi/qkMAEFaR4ISUaBZwJzwRpeNVhMOqrbLx9jfxI7saQFO8Q+G3oV9qU
         AT8SCVHeB3fMLQWyWyFjc35C4iISk3uN2UWxLxaXoIgO23LIpKbQ4qn/q4LAXdlJJggR
         m6lw==
X-Gm-Message-State: AC+VfDyRcw1BZeZip39KbdUwOD8vn5n7mMvSU2+QhthwymnLRsHWvvdq
        eYqnEakM6fivFGrDKM3mqnUTkw==
X-Google-Smtp-Source: ACHHUZ5pREsN2MHzx8jSBJ2yDWA0drKmDfKerC6Hz/sXLS47q17yzFfm6KEqYLDxHTcny/r49UO15Q==
X-Received: by 2002:a19:f808:0:b0:4f3:b61a:a94b with SMTP id a8-20020a19f808000000b004f3b61aa94bmr4546784lff.53.1685896081315;
        Sun, 04 Jun 2023 09:28:01 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id g14-20020a19ee0e000000b004f61a57797esm537975lfb.69.2023.06.04.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 09:28:00 -0700 (PDT)
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
Subject: [PATCH 0/8] drm/msm/dpu: change interrupts code to make 0 be the no IRQ
Date:   Sun,  4 Jun 2023 19:27:52 +0300
Message-Id: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
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

As we are preparing towards expanding some of the macros, it would make
sense to change 'no interrupt' from -1 to 0. This would allow us to skip
the field assignment completely rather than having an explicit assignment
.intr_foo = -1.

Dmitry Baryshkov (8):
  drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
  drm/msm/dpu: use PP_BLK_DITHER for DPU 6.x
  drm/msm/dpu: don't pass intr_rdptr to PP_BLK_DITHER
  drm/msm/dpu: split PP_BLK_NO_TE from PP_BLK
  drm/msm/dpu: remove irq_idx argument from IRQ callbacks
  drm/msm/dpu: move several IRQ-related defines
  drm/msm/dpu: add helper to get IRQ-related data
  drm/msm/dpu: shift IRQ indices by 1

 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 30 +++---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 30 +++---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 30 +++---
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  5 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 18 ++--
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 12 ++-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 12 +--
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 24 ++---
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 24 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 16 +---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 17 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 14 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 92 +++++++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 18 ++--
 21 files changed, 186 insertions(+), 197 deletions(-)

-- 
2.39.2

