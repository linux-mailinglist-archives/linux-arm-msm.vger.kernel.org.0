Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C38EF4FFCAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 19:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235815AbiDMRam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 13:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235798AbiDMRam (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 13:30:42 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3F86C1EB
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 10:28:19 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t1so3640557wra.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 10:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=wmTTJc7cl6oOaGuqAfmrOjx/4kHHCDLsI0qGb1ByPRU=;
        b=Gv0EL/ZxgM6nD/QdcZ5kwRGNHJ/sBQhPXzudfQnBcFAvkiSRamLbDDwEAKzysR8fZi
         mphBn6flOXPHW3LAXs+Zd7s8O6qADVOFbZuBCNbn2gtGKkEymkN7XVYhG5DDDlAOWzOs
         utVWGr4rUfXkLa1DITlFJhpDRVozlE8qDeGyew1EEQNZA7eFCTEk6OI5rooUkOn6p++C
         APPgG08rQY1IRAV84oExr/vkG4PDnweWiJMBqkfM0CP9jT/jSpJtkEXo1thptFAYRnji
         oWb/VLM2mdQ30uAjW4CXZlO78guqimS2qA4OgPDAU8xJVc1JEWf1a/+qrr4bfQCW3i1a
         MPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=wmTTJc7cl6oOaGuqAfmrOjx/4kHHCDLsI0qGb1ByPRU=;
        b=fiaT4DOgYCLXJNBmmxK6vB9Wgtk1BFDhhtsUalF7/Wopl5WstVMCjHCi4cOZHu4c54
         /JD9pThq+/T67stp5+mTmhLQ3QNuLjsmpk4tGBhkRh5EfWj2ZuMdMa75bOoZVYwNuV8y
         OUkP7CPZN26L2LGn/SH60Xy+v2nNrVu78F7tJQWeqRuZ3pmHdu1rBrw6HkSxdtQ7BKT8
         OnMoezr5nYphG3CL+O55rPzM2xBCYXWblgyQNGnsbEIVrq9anNvn9FX+GyN1A0uxjlfU
         pyOoMSLWD/nCnhYoYd/uitml3jbe99NfjKLR29cX0gIv3jBk1Uc+MClpAKvvCBetV14S
         itfw==
X-Gm-Message-State: AOAM530jhzpYEq14gkVgpmpRVizZm85DFb3FUJM1/7yWcpkBRkRquoGn
        SDTKHPbuSbmbRWlGej+wcWA36JwDb5ktbnD/Buw=
X-Google-Smtp-Source: ABdhPJyZ1BaUvX4fdp9fHfEfMZEDBiKMqmJvGwIR/qqtcLJHzy6ocEtB/UGcnZkibsi6xA0n8HSz3NR+93CMmZd70x0=
X-Received: by 2002:adf:9111:0:b0:206:c9b:ce0d with SMTP id
 j17-20020adf9111000000b002060c9bce0dmr33934513wrj.418.1649870897772; Wed, 13
 Apr 2022 10:28:17 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 13 Apr 2022 10:29:20 -0700
Message-ID: <CAF6AEGvuTwx09MKwK68KWXqi4o7LxDGMUz1=Z7xOS+i=OV84Ug@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-04-13 for v5.18
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

A few fixes for v5.18.

The following changes since commit 05afd57f4d34602a652fdaf58e0a2756b3c20fd4:

  drm/msm/gpu: Fix crash on devices without devfreq support (v2)
(2022-03-08 13:55:23 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2022-04-13

for you to fetch changes up to 390d645877ffd6dcb55f162d618045b2779217b3:

  drm/msm/gpu: Avoid -Wunused-function with !CONFIG_PM_SLEEP
(2022-04-11 18:35:31 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      dt-bindings: display/msm: another fix for the dpu-qcm2290 example

Kuogee Hsieh (1):
      drm/msm/dp: add fail safe mode outside of event_mutex context

Marijn Suijten (1):
      drm/msm/dpu: Use indexed array initializer to prevent mismatches

Nathan Chancellor (1):
      drm/msm/gpu: Avoid -Wunused-function with !CONFIG_PM_SLEEP

Rob Clark (5):
      drm/msm/gpu: Rename runtime suspend/resume functions
      drm/msm/gpu: Park scheduler threads for system suspend
      drm/msm/gpu: Remove mutex from wait_event condition
      drm/msm: Add missing put_task_struct() in debugfs path
      drm/msm: Fix range size vs end confusion

Robin Murphy (1):
      drm/msm: Stop using iommu_present()

Stephen Boyd (1):
      drm/msm/dsi: Use connector directly in msm_dsi_manager_connector_init()

Xiaoke Wang (2):
      drm/msm/disp: check the return value of kzalloc()
      drm/msm/mdp5: check the return of kzalloc()

 .../bindings/display/msm/dpu-qcm2290.yaml          |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         | 80 +++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 34 ++++-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  3 +
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |  2 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  6 ++
 drivers/gpu/drm/msm/dp/dp_panel.c                  | 20 +++---
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  1 +
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  2 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  1 +
 12 files changed, 109 insertions(+), 48 deletions(-)
