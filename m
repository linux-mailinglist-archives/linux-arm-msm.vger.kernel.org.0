Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2644E72D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 13:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354814AbiCYMTP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 08:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345858AbiCYMTP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 08:19:15 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F275D554D
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 05:17:40 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id h11so10056819ljb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJpZ4NYnVX6K1Z2aT+F++WJPO52SFbhSGOdmMUxAXQw=;
        b=fWJFTvMmTwptlT5sDzclx+zIACzB+S15RspnPUeX2wsZttZ0tFAC/xFR5zwRpsFZTw
         fQXET3Pi3BlKfBCoKJllvaV7QPY5QoNH/6OLW/7EXXqG4QEJLgt2Cv2g1dmw+fGJs4Yv
         B5rp0MRbgM8hYs0ekApb/GTBHq4LgQsa4J61wTpHWxLk2w2BGMA0nTBphHl7vqUvLx/U
         H3GlHq2WmE8kbEiecnz5no0lyVgPBxapfR+PfEYe36BXB+xpPTPSoGJpMDGiagdY2nYE
         y2ab96PktSEWiqp24uJhjlFWckPAxVuCPfluIaIM8zQt9gdaGr2QPk60Vfg6BsW0Of4x
         5wpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJpZ4NYnVX6K1Z2aT+F++WJPO52SFbhSGOdmMUxAXQw=;
        b=VxcaS8tvGw9DvqdlDWem5v3hHvXANH2dIIP5l6bpKMY+uPV/dazmhZYP6O6J7trITN
         2RnRBazxvSrHiJk2V29zHKPyZ0MbQJG70t8sPedF+lFBIw43kN4VWgC4RKj6mqASGsLO
         F8McUh7CQD9Bg0rLdtrPArvjtWTlbFTHgpbv+5X9OxCsspAdC/d+Udh2ACTHcdrXjvJF
         ETllCn2ckLjjpABRxIJ2RWM5dc85UAm61OkFXk1gta1KMtmELlGdABHFSWoaMNDKSgL+
         xAj8tYB3Hgkxsy6Xk0Uk8SD8WTBlfWynWaWdr+Csi9YlvPqpLe8Y108dwPzbmvA92x98
         vkVA==
X-Gm-Message-State: AOAM53285zai8fDmgRI/qmDEkMPagOJxg8eqlCqqpGorka8mAMlaHhI7
        zI/EdlGOUsh71tYCIjBQ4yST4Q==
X-Google-Smtp-Source: ABdhPJyPaIqbaJBFLJjxsGZtVPxZaVcjcn/xnr1YqspmRUY89/OQUB6SByvKvruU+1V1dHJ7dQ9F6Q==
X-Received: by 2002:a2e:9c99:0:b0:249:146e:57a9 with SMTP id x25-20020a2e9c99000000b00249146e57a9mr7762474lji.319.1648210658931;
        Fri, 25 Mar 2022 05:17:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.164])
        by smtp.gmail.com with ESMTPSA id k9-20020a05651210c900b00448956cb40csm688489lfg.109.2022.03.25.05.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 05:17:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/6] drm/msm: rework MDSS drivers
Date:   Fri, 25 Mar 2022 15:17:30 +0300
Message-Id: <20220325121736.2162912-1-dmitry.baryshkov@linaro.org>
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

These patches coninue work started by AngeloGioacchino Del Regno in the
previous cycle by further decoupling and dissecting MDSS and MDP drivers
probe/binding paths.

This removes code duplication between MDP5 and DPU1 MDSS drivers, by
merging them and moving to the top level.

Changes since v4:
 - Fixed the issue with MODULE_DEVICE_TABLE reported by robot
 - Fixed the comments accoring to suggestions of Stephen
 - Removed extra goto (Stephen's suggestion)
 - Break long kms->dev->dev->parent chains into cleaner dpu_dev/mdp_dev
   and mdss_dev to document device tree bindings. Add related comments.
   (Stephen's suggestion)

Changes since v3:
 - Rebased on top of current msm/msm-next
 - Fixed issue with enabling/disabling MDP4/MDP5 vs DSI driver (per
   Stephen's suggestion)
 - Reworked mdss_probe to remove extra platform_set_drvdata calls (per
   Stephen's suggestion)
 - Fixed a typo in the Kconfig (noted by Rob)
 - Added a patch to move component mastership from mdss to mdp5/dpu1
   devices

Changes since v2:
 - Rebased on top of current msm/msm-next(-staging)
 - Allow disabling MDP4/MDP5/DPU/HDMI components (like we do for DP and
   DSI)
 - Made mdp5_mdss_parse_clock() static
 - Changed mdp5 to is_mdp5 argument in several functions
 - Dropped boolean device data from the mdss driver
 - Reworked error handling in msm_pdev_probe()
 - Removed unused header inclusion
 - Dropped __init/__exit from function prototypes

Changes since v1:
 - Rebased on top of [2] and [1]

[1] https://patchwork.freedesktop.org/series/99066/
[2] https://patchwork.freedesktop.org/series/98521/


Dmitry Baryshkov (6):
  drm/msm: unify MDSS drivers
  drm/msm: remove extra indirection for msm_mdss
  drm/msm: split the main platform driver
  drm/msm: stop using device's match data pointer
  drm/msm: allow compile time selection of driver components
  drm/msm: make mdp5/dpu devices master components

 drivers/gpu/drm/msm/Kconfig                   |  50 ++-
 drivers/gpu/drm/msm/Makefile                  |  25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  86 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      | 260 ------------
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |   3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  54 ++-
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |   3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  57 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c     | 252 ------------
 drivers/gpu/drm/msm/msm_drv.c                 | 261 +++---------
 drivers/gpu/drm/msm/msm_drv.h                 |  61 ++-
 drivers/gpu/drm/msm/msm_kms.h                 |  21 -
 drivers/gpu/drm/msm/msm_mdss.c                | 375 ++++++++++++++++++
 13 files changed, 652 insertions(+), 856 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c

-- 
2.35.1

