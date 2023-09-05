Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B4F792D29
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 20:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234089AbjIESM1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 14:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238792AbjIESMO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 14:12:14 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F1C23038
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 10:44:53 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bcb54226e7so978171fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 10:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693935834; x=1694540634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2OkBEAPevcriKHohaNDw8qazVjEEi9PkNyUZ5jiXpJY=;
        b=Uf3aoOOUhoxQzW6y5MIF1LIvOUEIJkYWFacJ9Rc8Rzvj56bokzxF3zmy/tN3XK593+
         uZhhMbuWqldkKEx9nAu7jGNKJuZu5btox8lEa1JDLz0zVcpoBJyYWazoO9ZTXo9eDUHB
         eaEAv4y30Ab3qCQswPzllfnzUZ+tdG+fCLjzak4+nBG1/8AeP0dN3hJL1pr/FSAOZdt1
         QeyuzihIHdSCAwOMlMkx6+50monZNXtLSZXo5nrHyLjiXOGcqNgep7BzC6F0AsEF5fex
         7qHKC0TnzqMiagf12kXXDPtenoP3f2nIP3K8hDBe96ohxDuXngMSXAMS3bH6+3YkabQC
         v52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693935834; x=1694540634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OkBEAPevcriKHohaNDw8qazVjEEi9PkNyUZ5jiXpJY=;
        b=JaITpOh6Bs+Irb6eZn/IrxeW7Ncf6Ktix/kFe8Itdx7cyUGwmtia+0wApzX7Dvl3SZ
         htCoISZl4Q2j7Qkl/ris2dPi8WiRgWPs7EA62mx5XPhw+Iuqtur79loSadkghXQRZ947
         2vJNCU6qmctV8xevgxfHtiuBpbhfTKdiSAzQ3TQMfZFv0Nn1Qdoi4cA6gdFI66isYBPH
         Dn7vWlo6gVfHC/+yboev5ZUMik8ZMXtuLNcIC9iK3cBUynDjZ7fgp+ny37l8HdfIg9GD
         itMNXIQPZQvCRwUoWrLKn2N2X3/q5hfTFV0NTAhtTNlhdJqDd9IrE4o27w8LsMl8jpTn
         aChQ==
X-Gm-Message-State: AOJu0Yx4mKfKHx6W6ZkAQ900b6fFhnv5Na4t+LB7o2/QCg2kTV2wzesW
        VV4eeHAgWp6q64Oz3NV7gaSyrg==
X-Google-Smtp-Source: AGHT+IGOcmIUS8yzOr2fJPFQEQ+/KEPQd8cKVszbnsNYXjvmDrQlbZpUn/HJlSNBPH6Suw9MJo0JKQ==
X-Received: by 2002:a2e:805a:0:b0:2bc:bc6f:e296 with SMTP id p26-20020a2e805a000000b002bcbc6fe296mr206904ljg.13.1693935833953;
        Tue, 05 Sep 2023 10:43:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 10:43:53 -0700 (PDT)
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
Subject: [PATCH 0/6] drm/msm: provide migration path from MDP5 to DPU driver
Date:   Tue,  5 Sep 2023 20:43:47 +0300
Message-Id: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov (5):
  drm/msm/mdss: fix highest-bank-bit for msm8998
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
 drivers/gpu/drm/msm/msm_io_utils.c            |  18 +
 drivers/gpu/drm/msm/msm_mdss.c                |  39 +-
 11 files changed, 1142 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h

-- 
2.39.2

