Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE2304D2662
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 05:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbiCIBx4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 20:53:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbiCIBxy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 20:53:54 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6E213EB8
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 17:52:57 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id i8so776768wrr.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 17:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=DRolm/pjPpwXjBsNzyPivKT1VP/HfTnUyLPT4KbhwIA=;
        b=AYWf/940N7BjBvgT3kZA/MQ/JRplQXi8rJ5TX3RSp+GTFeiW+IgoduTSwyftX2fwUT
         KBMPlBWm9bwuQTOPfheaFvUtQ1fg20q6hg+r2O8MdvNLC9UgNU+Jet2NZsMCpy2NmFp/
         bSi8b7DA1SBi7DhKOIgGirEFAIKwTKiQCVs6vkTVXXP5PH5kxqcn0jSvsOeaQAlFm4aJ
         a0M3KXSyD6CjOUxV7T53RqUlASLXM4e3WCgHZ4zQ1VpKBLjf4BnzpKY1SAVTKUzt9AHS
         MTfCyqustZ00b03/sQlBAcmWPHQRCBOnqFmMRnAjYoPtuzhZmAWBEWWF5/8TQ0Ys7mOj
         pqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=DRolm/pjPpwXjBsNzyPivKT1VP/HfTnUyLPT4KbhwIA=;
        b=ier8Cre8MTE8npiH6w1K1QaIGhbVHp80X4MIDEWQySTeNSQi0hM8+eZSvhOQMst9sS
         k7xNLhNGRD2aEy2FevmA3Iuhh/2Fa9jwPE8V1qYFQN7BedEjsY77sYUBupv2Mx6zz8VS
         uiYYdlgDK2mI61muGUd8yr4cUvCG69QjHEf8hWA4x7+Luy3gTqABtN/J5Gt+/uNz7rBK
         2zVy9rIYRyYouSN/sZztLNL1ByFmOnB5kanz5nPoeXtlbpjLzmYRh0IQ41YPtHWro24+
         XYCX+bR9jEOU20ZIIPQ05a6vWgPNjqgH8MTG6/7Jj6SXh6ugvJTzw+zJmY99lDxXz9mp
         tRNA==
X-Gm-Message-State: AOAM530VA3Rs5Q9cJBXJ9aCEFOsYTNokrG/BV7DSrRV/pZ7qi3s0QCBY
        ahq+4CfZvuVjTgVWbpr9QbPHHKFKCUQcjMKuuP1M2J8/2c8=
X-Google-Smtp-Source: ABdhPJzCacRqXQsnY1FN9kqvExgwrcL2s/HF6jgcv+Uy5ST4+qG2xTodxDyNGg0883e3N8tHEcX3Jj3T/MVm3t3fmXY=
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr14384019wrj.297.1646790775618; Tue, 08
 Mar 2022 17:52:55 -0800 (PST)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 8 Mar 2022 17:53:25 -0800
Message-ID: <CAF6AEGvwHFHEd+9df-0aBOCfmw+ULvTS3f18sJuq_cvGKLDSjw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2022-03-08 for 5.18
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
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

Follow-up pull req for v5.18 to pull in some important fixes.

The following changes since commit afab9d91d872819f98a792c32c302d9e3261f1a1:

  drm/msm/adreno: Expose speedbin to userspace (2022-02-25 13:29:57 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2022-03-08

for you to fetch changes up to 05afd57f4d34602a652fdaf58e0a2756b3c20fd4:

  drm/msm/gpu: Fix crash on devices without devfreq support (v2)
(2022-03-08 13:55:23 -0800)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/msm/adreno: fix cast in adreno_get_param()

Dmitry Baryshkov (1):
      dt-bindings: display/msm: add missing brace in dpu-qcm2290.yaml

Rob Clark (8):
      drm/msm: Update generated headers
      drm/msm: Add SET_PARAM ioctl
      drm/msm: Add SYSPROF param (v2)
      drm/msm/a6xx: Zap counters across context switch
      drm/msm: Add MSM_SUBMIT_FENCE_SN_IN
      drm/msm/a6xx: Fix missing ARRAY_SIZE() check
      drm/msm: Fix dirtyfb refcounting
      drm/msm/gpu: Fix crash on devices without devfreq support (v2)

Rob Herring (1):
      dt-bindings: display/msm: Drop bogus interrupt flags cell on MDSS nodes

 .../bindings/display/msm/dpu-msm8998.yaml          |   4 +-
 .../bindings/display/msm/dpu-qcm2290.yaml          |   5 +-
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  26 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   1 +
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  30 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   1 +
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              | 112 +++-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   1 +
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  63 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 674 +++++++++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |  26 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  42 +-
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |  31 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  22 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   2 +
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  46 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  37 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  37 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |  37 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h          | 480 ---------------
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |  43 +-
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |  37 +-
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |  37 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  37 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |  37 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  31 +-
 drivers/gpu/drm/msm/msm_fb.c                       |   4 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  42 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +
 drivers/gpu/drm/msm/msm_gpu.h                      |  29 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |  30 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |  39 ++
 include/uapi/drm/msm_drm.h                         |  32 +-
 40 files changed, 1144 insertions(+), 1156 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h
