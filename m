Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03BFA51ADD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 21:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357006AbiEDTgz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 15:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352087AbiEDTgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 15:36:54 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE724C42D
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 12:33:17 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h29so4075465lfj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 12:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YHYwQFAJmnErQZCKQJLUVtyEs4pscZoMMUhpkcqKYYM=;
        b=ruHB31Y5G/kQ2KevdpivuWXbJaJwj7plgUBubNjE2VewX9g1xk6hQh78xwHb7tlLM8
         j45bYpAaDPoI31/fFnmgQ0zbBL/GfKz61r4L+7mywO3UK/dG/+ZytdMpeJeC3f2UnlPv
         PbYm1ltZWYimGB53KF9AiyIhrjMIsmxu6AcWmHyEj+S226NA1TkcNTA141zdhVMrFFem
         f2GzbnsjDjYKjFQo98qG6qVlIEosWYVvxjdyBoMGtWyM+wei3NxMgIcvmY5fqUqtE91Y
         bBJur4JPuZw/U5Y4z+PtaLZJFdAEiMxrytdm3OJKElgKnwH976dnI5kIksXldvtx+HV1
         1Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YHYwQFAJmnErQZCKQJLUVtyEs4pscZoMMUhpkcqKYYM=;
        b=xLDK0cBAXiwS3I9M26/e7SCpjDzAz9wFXLI3wHFBfvCLtGYu1dl0eU4NdjRyyD9cL2
         ZcHBHNUAdnENGKmLduSvgy3KWHhZv4f63QspF7I3ZTW/1va0uEJ3Fv9W5aeKGJm8YIAc
         rwblm/E6WnV6scHnzoYksoDXsV0+MYKi1PBAdBR4krRmQj1FTLP43Ojb14ZGsGzA4eAq
         pBCEKP0P2ADchpKvnoxI2d5P+EHPZRRBKwUqm+r6YSV/6spk7hdUCdrpOV9YPHck3bgs
         0JdMyCLrdLYhLJMlMqoJ5gxwOclgXncMJ1Z9MsuqAK6fStD4H4ceYuO33G6yr7nq2j3J
         RO8Q==
X-Gm-Message-State: AOAM5301MDKo8gDDY08gTrNQwOvaJdChj9vMfZX/eNJZPpdhw2eVl9Vw
        2Gs2+dD/lQLe3+Wk2PrDX5/JmA==
X-Google-Smtp-Source: ABdhPJwDQJGAoar+6xZb17zLviI1ctKFIgCOtDGssMUG/VfV7UGq2Htvy4sqs5yKuxLjdJyGWXsi4g==
X-Received: by 2002:a19:a405:0:b0:473:cb3d:6cb0 with SMTP id q5-20020a19a405000000b00473cb3d6cb0mr746951lfc.208.1651692795615;
        Wed, 04 May 2022 12:33:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o8-20020ac24348000000b0047255d2110csm1283388lfl.59.2022.05.04.12.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 12:33:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PULL] drm/msm: several fixes for 5.19
Date:   Wed,  4 May 2022 22:33:14 +0300
Message-Id: <20220504193314.1185639-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This pull request contains few tiny fixes targeting 5.19. The biggest one is
the fix for the dp event thread wait condition.

The following changes since commit 36a1d1bda77e1851bddfa9cf4e8ada94476dbaff:

  drm/msm: Fix null pointer dereferences without iommu (2022-05-02 10:11:44 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

for you to fetch changes up to e402369f0b16d1518a9c7c7ffaaee9a90b2de6a5:

  drm/msm/dp: fix event thread stuck in wait_event after kthread_stop() (2022-05-04 21:46:40 +0300)

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: add missing break statement for update_pending_flush_wb()

Dmitry Baryshkov (2):
      drm/msm/dpu: don't access mode pointer before it is set
      drm/msm/dsi: fix address for second DSI PHY on SDM660

Konrad Dybcio (1):
      drm/msm/disp: dpu1: Properly sort qcm2290_dpu_caps

Kuogee Hsieh (1):
      drm/msm/dp: fix event thread stuck in wait_event after kthread_stop()

Vinod Polimera (1):
      drm/msm/disp/dpu1: avoid clearing hw interrupts if hw_intr is null during drm uninit

 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 22 +++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  3 +++
 drivers/gpu/drm/msm/dp/dp_display.c                | 13 +++++++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  2 +-
 6 files changed, 26 insertions(+), 18 deletions(-)
