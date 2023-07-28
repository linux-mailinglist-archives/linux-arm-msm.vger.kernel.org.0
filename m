Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2A5B767902
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 01:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbjG1XcI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 19:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbjG1XcI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 19:32:08 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D1B3AB7
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:32:03 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9ba3d6157so39537791fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690587121; x=1691191921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9CT7/d8hNuwfOKkfzLeLsqBpMbScuX2Y6f1uvXet40=;
        b=U8LVGNMXkDnUfj8pHwjBcZk65oESytAL6ZKnfOHsTHwy+Uw5Q4A1qHtnw1r8oP8RXL
         X1LHmgFJ+9dWFZPawl3NY8mjcUxVGemFK6p7k7vcrf+jUYh2MH5KM5GJ8oUwoIcVvxsu
         WEBrG8S5RtZsjBsCuEtdxn0jjRgeEOkCOPXdK9X3d3lg5nSggO+hhppcRpx33vwkAU6b
         W0gbBq4K60HfB9Q1A1A978um+Y2QvznlJJdfWaap43ImJE6F+dxVeyV1TS9Pwi582a+j
         t+aqqXvg8hyMQ43mrHCMcabS0WC9pb+3FG0Jn/pwE4i5EEZ14f7RqWohJjPY2FrF9YLt
         l93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690587121; x=1691191921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9CT7/d8hNuwfOKkfzLeLsqBpMbScuX2Y6f1uvXet40=;
        b=Y4N+Tzlfag9I0rHYbCuSwTEJkc++Qn3qvBQrLiftfYVQ1RhmYCp2dEgOeiNEi3w0ig
         mxSwLIrXSCbSF3PwCr3FuBXconwiCexUPBa9U3YWSKe7eQ9FRYmVfS0Xir7iHup/rodu
         CklhpnFATmAUDWlRslQXSV50AY6jnodbAzOcIe5yZ5VwmOahD+o3O3Lc5+6A5eDNSpoA
         bFqg1xaH3PbvfFnCEwcjoxx0zT4VswDaqlKf2fDcr0OGbB/NHRftZsMtguZW1wFkQSE0
         ADUil2r7CcvB9RPGjE8t1ayLXwMSZ86OcU9WL3L9CPSR2sP0H0MquGg/1pBbYFhuC6QI
         T9SA==
X-Gm-Message-State: ABy/qLaDIHixF/m9jELOsWQ2AwYh213ftlrjILJi1oUmjoQ4ytxMAPnv
        Xo6iqKJvCL+fKmLTWRo5pTvROg==
X-Google-Smtp-Source: APBJJlHtx/x/anMH5H0H0nolkgHJsA/Ynlf6FdIwhn6RRXr1bYtAbAfOBWLA4ErGnuvkgajpN2YWtg==
X-Received: by 2002:a2e:8e81:0:b0:2b6:e78e:1e58 with SMTP id z1-20020a2e8e81000000b002b6e78e1e58mr2936611ljk.5.1690587121493;
        Fri, 28 Jul 2023 16:32:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x11-20020a2e9dcb000000b002b6c8cf48bfsm1148289ljj.104.2023.07.28.16.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 16:32:01 -0700 (PDT)
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
Subject: [PATCH v3 0/6] drm/msm/dpu: change interrupts code to make 0 be the no IRQ
Date:   Sat, 29 Jul 2023 02:31:54 +0300
Message-Id: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Having an explicit init of interrupt fields to -1 for not existing IRQs
makes it easier to forget and/or miss such initialisation, resulting in
a wrong interrupt definition.

Instead shift all IRQ indices to turn '0' to be the non-existing IRQ.

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/118088/

Changes since v2:
 - Added the dpu_core_irq_is_valid() helper
 - Replaced irq_idx with reg/big pairs in kernel output
 - Readded -1 when accessing the IRQ structure.

Changes since v1:
 - Rebased on top of msm-next-lumag and updated IRQ rework series.

Dmitry Baryshkov (6):
  drm/msm/dpu: remove irq_idx argument from IRQ callbacks
  drm/msm/dpu: extract dpu_core_irq_is_valid() helper
  drm/msm/dpu: add helper to get IRQ-related data
  drm/msm/dpu: make the irq table size static
  drm/msm/dpu: stop using raw IRQ indices in the kernel output
  drm/msm/dpu: shift IRQ indices by 1

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |   4 -
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |   4 -
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   8 -
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  10 --
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   3 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |   8 -
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   3 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   1 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   3 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   1 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   1 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |   8 -
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  13 --
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  12 --
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  12 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   9 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   8 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  16 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 155 +++++++++++-------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  18 +-
 25 files changed, 131 insertions(+), 202 deletions(-)

-- 
2.39.2

