Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB9876566A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 16:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjG0Oth (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 10:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234046AbjG0OtW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 10:49:22 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D72530FC
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 07:49:09 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe11652b64so1877727e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 07:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690469347; x=1691074147;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xHyCXN5dCS9uiL6OSLtxb2pFZ7IiVBAlq0dF7GmTCCs=;
        b=T3VEn+O2ac1TK9dZd9ZNMqbc1ksQ8rw48j7ldx7XcwXEDYDVCVXV0UYoZK7xJCpC2I
         GDeEE16YvFq+l+wA4N5PhdjvnVgTQ+T3f71BYJi2e6jBcfOCyTNSyDsXp7Irap2owfvn
         +LYBURrX2eOEO9ZDVFWtpnTLKtWU9OgSu5/h1Dw333vw3zaasIz56gbhL+hMDlztcM/p
         NOr7rIEEQZoVmrkE/646nGs3CvZ17tiy2a8TOLHJug35TvFZT32jqMPW9f1nFJtkwoVq
         +YZ3C9aS+qlh3ICWYbQCf7SZjVYgrs/o0zgBIU1KwPTwgTVx0E0e64y5avOcduvHb3OS
         xp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690469347; x=1691074147;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHyCXN5dCS9uiL6OSLtxb2pFZ7IiVBAlq0dF7GmTCCs=;
        b=X2xGkmMdKZiiLcPBDQxfGzTBQN4Puef3Aa2o3WGtE+RWfZdjV0XhHPAqnBOV7GnT5c
         lKRICR8yRILTVmbbq5Cu3qLS831Yx4eKVPfWuJlf6GMGsaqRpwvQ38pwvb/Nyp8bAm9x
         x+6jDKLFEfce5jyVCGlsAWrEhW/LgyiJWfvc1Z4sjRWgPxGoO/SMchwEWdiAAHoMduoz
         uvfUG588gvP73n8rT010qm+HJwWgJdLUYTUi5egzHuYHqwtTp7tpR+TZ1zzx6CjRCq8Q
         a13lpRs1JZWsRstS59aJVyGntZj082wrmDZlcnx6caOtx2ACMEUWKamhYRcBv0hbBEfn
         IIQA==
X-Gm-Message-State: ABy/qLZFCm3EMLNgAwlUqbkLc8Fig6u6PxVXNZ0BAqSfkVnvlRtTegCs
        Q7Fv0f4ujnJMKy4ttOHbsqeeLywA4qNcs7EsJNg=
X-Google-Smtp-Source: APBJJlGNZUApsSG28hLuM3AnA2b2od7aR+h8M12NVIfGICgoYNvzQK1uAAOo/8W3U59nkz2g9vWX5hm6aTftVAZpZ7w=
X-Received: by 2002:a05:6512:108a:b0:4fe:819:b0ed with SMTP id
 j10-20020a056512108a00b004fe0819b0edmr2131701lfg.46.1690469346942; Thu, 27
 Jul 2023 07:49:06 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 27 Jul 2023 07:48:54 -0700
Message-ID: <CAF6AEGs9MwCSfiyv8i7yWAsJKYEzCDyzaTx=ujX80Y23rZd9RA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-07-27 for v6.5-rc4
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
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

The following changes since commit cd036d542afb82adfbbd43c5dbeb7010e8e91ee7:

  drm/msm/a6xx: Add A610 speedbin support (2023-06-18 11:35:27 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-07-27

for you to fetch changes up to 1b5d0ddcb34a605835051ae2950d5cfed0373dd8:

  drm/msm: Disallow submit with fence id 0 (2023-07-26 10:50:04 -0700)

----------------------------------------------------------------
Fixes for v6.5-rc4

Display:
+ Fix to correct the UBWC programming for decoder version 4.3 seen
  on SM8550
+ Add the missing flush and fetch bits for DMA4 and DMA5 SSPPs.
+ Fix to drop the unused dpu_core_perf_data_bus_id enum from the code
+ Drop the unused dsi_phy_14nm_17mA_regulators from QCM 2290 DSI cfg.

GPU:
+ Fix warn splat for newer devices without revn
+ Remove name/revn for a690.. we shouldn't be populating these for
  newer devices, for consistency, but it slipped through review
+ Fix a6xx gpu snapshot BINDLESS_DATA size (was listed in bytes
  instead of dwords, causing AHB faults on a6xx gen4/a660-family)
+ Disallow submit with fence id 0

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm/mdss: correct UBWC programming for SM8550
      drm/msm/dpu: drop enum dpu_core_perf_data_bus_id

Gaosheng Cui (1):
      drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in a5xx_submit_in_rb()

Jonathan Marek (1):
      drm/msm/dpu: add missing flush and fetch bits for DMA4/DMA5 planes

Marijn Suijten (1):
      drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config

Rob Clark (5):
      drm/msm/adreno: Fix warn splat for devices without revn
      drm/msm/a690: Remove revn and name
      drm/msm/adreno: Fix snapshot BINDLESS_DATA size
      drm/msm: Fix hw_fence error path cleanup
      drm/msm: Disallow submit with fence id 0

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       | 12 ++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 13 -------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  8 +++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  2 --
 drivers/gpu/drm/msm/msm_fence.c               |  6 ++++++
 drivers/gpu/drm/msm/msm_gem_submit.c          | 16 ++++++++++++++--
 drivers/gpu/drm/msm/msm_mdss.c                | 19 +++++++++++++++++--
 10 files changed, 54 insertions(+), 28 deletions(-)
