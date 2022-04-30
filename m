Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81BF651609E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 23:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245339AbiD3VVp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 17:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233148AbiD3VVo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 17:21:44 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E12D6FF5D
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 14:18:21 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b18so635488lfv.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 14:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1GLgMb5pUgkQDenkii55GFpNQ6moOJV41KFvWc1jGrg=;
        b=n5PPdfbh7IRWQjfA8DdR5nmISNaK5tpw8z2woZYOueJqkigSMCeK2a0HCxXlwpBFD3
         lC8OJHOF8ODj6qxnhEwm6mTvD0/0h18NPmR4IwXF3e9rXYKGZ+WuasqD2aY5vTmcZDOt
         G+mQZ6tjGkJR/YeVtQV/rKvYqWrZzaK6rj2UI1ns0l3sGAQkHrL1sanQXMQnN8dZDx/J
         b2HL9xvroYutv1/PAQ66e/uiMmMTWeqT2uecRI0c6c0DT+4tjA4oySV6Ca+l23wq+0DH
         DxMwbboS+MDdFOEwSvtNyLLosjEAmB5v2BCHMYlld0vX7zwsMLYYOtN0bJ3T1wIX3xoX
         Vz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1GLgMb5pUgkQDenkii55GFpNQ6moOJV41KFvWc1jGrg=;
        b=hTOE8uZG9BvXUJrqNnaAQSeFkpqQH3c9/2irwHK9NUkbj5nGI99lHSOOAQsBYr9mXY
         6bR+5uAHayiGkqp0XSSZhzr3wHbUZCnWI7waXqTXK596Cy3hMt7KYYNS1fmZK3rH8rxD
         RekA/GsfJSO8NxZDhZKVet1DZF2jhzcTdDmQ5FNBsh6diQ5djY8sp6fNlQosDrECgrQi
         qEkq2H4UGFF84Q6FhrHU3G7xaxjnKkW+4kk13GPTRNYowlM/CcSGWBzK5PWSZ9MiZJ2i
         sQ7GiK+6Mn6oshd/EyhdYvF0rWYDfjckBosltH7HCKpj1i3aD984SvX9J0GknlJdeIoa
         QnxA==
X-Gm-Message-State: AOAM533zh02Kl4SteqoQVxnrzBlVNyMm0m9EipBGcA4vPxJlkCAIrOZU
        j1eO2FKL/l8+Oy/8XY2jttxV/qxW81MJLw==
X-Google-Smtp-Source: ABdhPJxUj5NwK/7Ws3rPgvtK+QIzAlwWQL/4JbnMjguVjQKcOuOR9wgFXv8Xe7gsq7ihIIsfoukTjA==
X-Received: by 2002:a05:6512:228e:b0:472:4162:d9e7 with SMTP id f14-20020a056512228e00b004724162d9e7mr4038297lfu.513.1651353499862;
        Sat, 30 Apr 2022 14:18:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c19-20020ac244b3000000b0047255d211b5sm275926lfm.228.2022.04.30.14.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 14:18:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PULL] drm/msm: several fixes for the 5.19 branch
Date:   Sun,  1 May 2022 00:18:18 +0300
Message-Id: <20220430211818.3845259-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Please pull the following few patches into the msm-next(-staging).

They are mostly minor fixes for the issues reported by robot, a patch to
silence CRC warnings during modeswitch, a change to use initializers in the IRQ
regisers array and a change to MAINTAINERS file.

The following changes since commit d2dc68276133362f021bc8d429433b5818826c81:

  Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi', 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag (2022-04-27 13:44:44 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

for you to fetch changes up to d37d150e8b9773e2c83944ca276fd06b6d1d36d4:

  MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer (2022-05-01 00:09:53 +0300)

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: remove unused refcount for encoder_phys_wb

Dmitry Baryshkov (4):
      drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
      drm/msm: add missing include to msm_drv.c
      drm/msm: drop old eDP block support (again)
      MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer

Jessica Zhang (1):
      drm/msm/dpu: Clean up CRC debug logs

Marijn Suijten (1):
      drm/msm/dpu: Use indexed array initializer to prevent mismatches

Vinod Polimera (1):
      drm/msm/disp/dpu1: set mdp clk to the maximum frequency in opp table during probe

 MAINTAINERS                                        |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    8 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    5 +-
 drivers/gpu/drm/msm/edp/edp.h                      |   77 --
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 | 1373 --------------------
 drivers/gpu/drm/msm/msm_drv.c                      |    1 +
 10 files changed, 39 insertions(+), 1484 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
