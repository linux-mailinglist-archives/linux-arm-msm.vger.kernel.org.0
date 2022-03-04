Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C39384CCC28
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 04:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237805AbiCDDV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 22:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbiCDDV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 22:21:58 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8635617ED99
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 19:21:10 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 29so9277587ljv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 19:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VOWV7C6h8OK7d5WgsEprucgKoMSzgsCgN5s8IESXVy0=;
        b=dUBwxc7/qrZsXjGcIjSV4S49rKng1t/itdAaLrWnEkANrcLTCzTXry71ldoWGlkT+t
         sjn3aJmtZHKhXiErzYtK5zE7UsS/GrTdW4FwO+lnp2/6twzyCNQWdfb0jPEjoLPa+Uwy
         pAundMC9RJ9vW5LUbKBlLiXSaoe7Q2cNEz8HJv4aLPuWes517V9YsbvqpIRTyd+xBx5/
         jehupD8RwYHrXuCb4dBov+8oW6lL7I3EbyyqWkOVZFbh4zZILkvhFy/wIrMkTzUuKaDQ
         oK8W98B3Hj3SyxJWOzbiL/LS1z5xjTXM5YY3cCb9mWM6xKPPkH/Lswpje+xBQe5esYHH
         jZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VOWV7C6h8OK7d5WgsEprucgKoMSzgsCgN5s8IESXVy0=;
        b=ZQrpUdz2ED7laPCY5MU1ckFJswzQsPzPHIQUFzHfoQVVHW/EAH7c7JrAMqeXNVrb/3
         EAh9GyIC9LQGZZXeDWugrlTny1xIQ/o2fmfS36UmGPahgP0Jr30+pSOv6N4ZPsvdGanL
         /C0GikZTnR556MGOxVAvqQ1qsOl7bIgsNpkVs//cJ5W6J6iYshvZlaVkpNZnL6X+dcQF
         I/CVZNvq9nocLuorz0FfjVge/DTgqTeQAD4aAU+jTdG48rVpLsFuat8sb+BRjh9Vfk2o
         DgTZ7obUF6azGFTIIv4nZ5hMfl4cqNKTbEQaZ+A9qqCVzRRUMMzaet1b9MnTxhgR/mDK
         rorg==
X-Gm-Message-State: AOAM531C2KSp7R6w4QuIHOQrmzCFMfevIgDqySRU3+3Gkfd+3wkFweom
        RMm3AH1KPAIcVh/sVi0H6CjbEtSnneF558aUgig=
X-Google-Smtp-Source: ABdhPJxDzpboT908tsOfBQcz56xSS2l1xy1LG3Y8QEagg0n5ntQ8oQXnUUxZh3kLkXu1iqQqKtsjXA==
X-Received: by 2002:a2e:9c82:0:b0:23a:eea8:cd0f with SMTP id x2-20020a2e9c82000000b0023aeea8cd0fmr25580665lji.218.1646364068868;
        Thu, 03 Mar 2022 19:21:08 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id w24-20020ac254b8000000b00445b7d115efsm772079lfk.301.2022.03.03.19.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 19:21:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/5] drm/msm: rework MDSS drivers
Date:   Fri,  4 Mar 2022 06:21:01 +0300
Message-Id: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Dmitry Baryshkov (5):
  drm/msm: unify MDSS drivers
  drm/msm: remove extra indirection for msm_mdss
  drm/msm: split the main platform driver
  drm/msm: stop using device's match data pointer
  drm/msm: allow runtime selection of driver components

 drivers/gpu/drm/msm/Kconfig               |  50 ++-
 drivers/gpu/drm/msm/Makefile              |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c  | 260 -------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  68 +++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  11 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 252 -------------
 drivers/gpu/drm/msm/msm_drv.c             | 263 +++----------
 drivers/gpu/drm/msm/msm_drv.h             |  57 ++-
 drivers/gpu/drm/msm/msm_kms.h             |  18 -
 drivers/gpu/drm/msm/msm_mdss.c            | 429 ++++++++++++++++++++++
 11 files changed, 667 insertions(+), 770 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c


base-commit: 8ddb80c5fcf455fe38156636126a83eadacfb743
-- 
2.34.1

