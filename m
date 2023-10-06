Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112F47BB92F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 15:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbjJFNh1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 09:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbjJFNh1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 09:37:27 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E557F95
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 06:37:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50435ad51bbso2690479e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599442; x=1697204242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TqEnu0vxAXChvGfZXmodGrnb+oByazcmJyvsPVCLkw=;
        b=aTEPRJV4qg9bH4oAR6v7Hxfmmh1W6tMUWmn7qOtYHE/HNmrhdMoG9rn66758ZSkYK5
         4mPi8AD7pRzvUXpsJxnVjc5iTok3M0df/xKTxIPZZ9sYLg6NQh4cWqGWd5REP291umNn
         RTxIBgyoIom4LiDL79B2WMFuDZY174AXoCVzFAMhf5juFui2gjtQYSz+o3Mjcam0DlVm
         at9kb4oty/OZ9kNJHOrcewYB7q8BN6tnt44099dql5zzYFiuhuCXTNgj1VKSj1nCnWpa
         hVqIle8SWLeLn4x+LPKy3QPQy1YVyeX1775A9VMC7O0mF/Bbc4MiErVKsTh/fQ6q4CGU
         Hm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599442; x=1697204242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TqEnu0vxAXChvGfZXmodGrnb+oByazcmJyvsPVCLkw=;
        b=uMa8jDo5n47JN6aW2FfiqDcwvdb1d5/tUgCpaV8Ztp/Fs5WaVxUM88V0Xmja9H5kyB
         34Ln8IlweYNRJyf4oT1MucmIUdJ68GUpThEGWScn/WDW1WFKo2l/D/354mMrwUg+q/EA
         rdeFE1pCV4eQimeSaPu84gTjYIwgKayTmB3eXnoedR9jXv25dpZRD36+A8kOg2nUndB/
         sHpTl2cjtzTPjAYA1yuvTSHG6TyehDlxjlbRgShkJEeURX9YuTjvyFFEB7ldU1Gln20i
         rzGvV6fGbR5uIpkNGbHnHds5x6dbsduVGV4iDm3eJ3VhjaKy47DXLLjCx44TmIi4blm1
         ipUQ==
X-Gm-Message-State: AOJu0YwZExy+TGuyo/l+WGSK+HuMYU3myN+Lqxvf9d6d6YDzdVhBqo2p
        OQ9NGJOrVmhcL29dHLDfQ/xkKw==
X-Google-Smtp-Source: AGHT+IGN4dVBXUHRecRdV2lExMJrHcYNdIKApFuYMLIuWGq18+mYm3pg4DfiVHMIDzW6PwfUb1IYeg==
X-Received: by 2002:a05:6512:753:b0:503:19d8:8dc3 with SMTP id c19-20020a056512075300b0050319d88dc3mr6866312lfs.31.1696599442101;
        Fri, 06 Oct 2023 06:37:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m27-20020a056512015b00b0050567cdb8f6sm303534lfo.239.2023.10.06.06.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:37:21 -0700 (PDT)
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
Subject: [PATCH v2 0/5] drm/msm: provide migration path from MDP5 to DPU driver
Date:   Fri,  6 Oct 2023 16:37:15 +0300
Message-Id: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Over the last several years the DPU driver has been actively developed,
while the MDP5 is mostly in the maintenance mode. This results in some
features being available only in the DPU driver. For example, bandwidth
scaling, writeback support, properly supported bonded DSI aka dual DSI
support.

All the pre-SDM845 platforms were originally supported by the MDP5
driver only. However it is possible and easy to support some of the
older SoCs in the DPU driver. For example in the v5.18 it got
support for MSM8998.  This can not be considered as a proper migration,
since there msm8998.dtsi didn't describe the display hardware
beforehand. Instead new bindings were added, making MSM8998 just another
display hardware to be supported by the DPU driver.

This series provides a way to gradually migrate support for several
existing and well-supported SoCs from the MDP5 to the DPU driver without
changing the DT. From the user experience point of view this is
facilitated by the `msm.prefer_mdp5' kernel param. If the parameter is
set to `true' (current default), all `shared' platforms will be handled
by the MDP5 driver. If the switch is flipped to `false' (or if the MDP5
driver is disabled), these platforms will be handled by the DPU driver.
Handling this by the modparam (rather than solely by kernel config)
allows one to easly switch between the drivers, simplifying testing.

This series implements support for two DPU 3.n platforms, SDM660 and
SDM630, and a classical MDP5 1.7 (MSM8996) SoC. It should be easy to
implement similar support for MSM8937 aka SDM430, MSM8917 aka SDM425,
MSM8953 aka SDM625 / SDM632 / SDM450 and QCS405. They were left out
beacuse of the lack of the hardware on my side. Then it should be
relatively easy to also add support for MSM8992, MSM8994, MSM8956 and
MSM8976. The major missing piece is the SharedMemoryPool, SMP.

In theory after additional testing we can drop most of migration code
and some parts of MDP5 driver. The proposed boundary is to move all
platforms supporting cursor planes to the DPU driver, while limiting
MDP5 to support only the older platforms which implement cursor as a
part of the LM hardware block (MSM8974, APQ8084, MSM8x26, MSM8x16 and
MSM8x39).

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/119804/

Changes since v1:
- Dropped accepted patches
- Rebased on top of updated [1]
- Added defines for MDSS hw revisions (Stephen)
- Changed msm_mdss_generate_mdp5_mdss_data() to return const struct
  pointer (Stephen)
- Fixed error handling in msm_ioremap_mdss() (Stephen)

Dmitry Baryshkov (4):
  drm/msm/mdss: generate MDSS data for MDP5 platforms
  drm/msm/dpu: support binding to the mdp5 devices
  drm/msm: add a kernel param to select between MDP5 and DPU drivers
  drm/msm/dpu: add support for SDM660 and SDM630 platforms

Konrad Dybcio (1):
  drm/msm/dpu: Add MSM8996 support

 .../msm/disp/dpu1/catalog/dpu_1_7_msm8996.h   | 353 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_3_2_sdm660.h    | 291 +++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_3_3_sdm630.h    | 225 +++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  97 +++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  94 ++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   3 +
 drivers/gpu/drm/msm/msm_drv.c                 |  34 ++
 drivers/gpu/drm/msm/msm_drv.h                 |   4 +
 drivers/gpu/drm/msm/msm_io_utils.c            |  13 +
 drivers/gpu/drm/msm/msm_mdss.c                |  51 +++
 11 files changed, 1150 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h

-- 
2.39.2

