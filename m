Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C38174E4F40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 10:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236314AbiCWJ1L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 05:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiCWJ1L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 05:27:11 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A550B1B7B4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 02:25:41 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u3so1039824ljd.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 02:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fvjRDTA2PHAlGFO2FpdE45QYwvQjOSHNe4XoKh928v0=;
        b=odabUKNblygvx+Syti9Owoko3d6g7SLDWjHmrot5+hraYUPnROcP6gnYa81bym3pCD
         oeArRwxeKX5KKkE7bjuaIcr3IzojRwIUDOvOT2pDlzQe855uqmU9jMBVXDhxwSEm+6le
         b0wptKL7ElZtCWGEvgk6DEA8uMXZ6ekiXx4EKRwwCbPFtxSbgzDnKuXc23zS5klEFCUU
         A6o6dTk/363HzaVDNNyo//te08wQGKMqJcMFZka0EXnA4jjpPFAxAjVng1licqbvbHsE
         QzbWHjc2kc+kuQzrdGu02DNIAJcGDjGwicWkUmRc7vJUF2QSCwnvsd1Nvvnv7ssAzxWV
         rymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fvjRDTA2PHAlGFO2FpdE45QYwvQjOSHNe4XoKh928v0=;
        b=cKWjgWvtT7GtqfcTxP4Jofe9fiE+ENa2LgGL12+j1E8DcCNgRwAQxe86rRAQXsVsRe
         v4xdHgOD3SdSN5Oa9tDsyI5JQTtiVd6y/j/kyrYm4Op3NRRnKJD3hzJWRC/nsDQPNvHC
         r5n7dPYHeKGFgy+DXEgnOkptyXGZi4clxpBlVMxXw//ohtkShCA/NiQV44R/fWkcs5V4
         v2Iy2Obh0FO0cK9hmYVu9lmxu8fNaamxlVw7B+tMkpPgEra/8Up+oeDDTVIP4R1h+jJE
         QAnnvi2KGMWfE/6/ZJfNdxw1sgmdkog5gPzNMlUG8FLJYk8oKQIhT+25TJbnyLqcGtWA
         Yi1Q==
X-Gm-Message-State: AOAM531mU8rHXseIl5YepdFut5E+F7VM2WReNNSKCsggBHFKhKWdzVRn
        myc6J9/Fk97hVwZVk4RzsiXVDA==
X-Google-Smtp-Source: ABdhPJyCYvUuHklHkrRy2ybKyWKzmlY1S9EFMDIqtaglPZxKvLIyr8wx5fsy2eluw7K8dawNj3ZM4w==
X-Received: by 2002:a2e:bf01:0:b0:247:dfe7:62dc with SMTP id c1-20020a2ebf01000000b00247dfe762dcmr22281064ljr.365.1648027540016;
        Wed, 23 Mar 2022 02:25:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id br12-20020a056512400c00b0044a2c454ebcsm986026lfb.27.2022.03.23.02.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 02:25:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/6] drm/msm: rework MDSS drivers
Date:   Wed, 23 Mar 2022 12:25:32 +0300
Message-Id: <20220323092538.1757880-1-dmitry.baryshkov@linaro.org>
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

This patchset depends on the patches 1 and 2 from [1]

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  78 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      | 260 ------------
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |   3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  54 ++-
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |   3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  54 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c     | 252 ------------
 drivers/gpu/drm/msm/msm_drv.c                 | 261 +++---------
 drivers/gpu/drm/msm/msm_drv.h                 |  61 ++-
 drivers/gpu/drm/msm/msm_kms.h                 |  21 -
 drivers/gpu/drm/msm/msm_mdss.c                | 379 ++++++++++++++++++
 13 files changed, 645 insertions(+), 856 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c

-- 
2.35.1

