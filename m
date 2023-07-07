Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4376E74B7EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 22:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjGGUh2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 16:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjGGUh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 16:37:28 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CB61986
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 13:37:26 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b6a084a34cso35775311fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 13:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688762245; x=1691354245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8qhnZKqQ6do3LcTcDToOBVUXXaj8gtF73nVysM5ZYM=;
        b=K55vl62KIo97j4ODPUvirSc4gssIAME5zKn5/nNaHwK4S5sRTDTTVN13ci2IkXYyMV
         NqB+NZKGhfBxSliF1Mj+gLAbM3tE99RvpYPvyUvLnCnQIW4JRxvbM88FI+Uwjwm/3OQ6
         8v6bTFFfjdGXSxS9ievI2JEZkTYJ27xOyIzV3TfYVLMaWYFoC/sRpfYf6AKroogGV2sf
         8P9FDTdIZ0lbC1+n5B70LbcrzmWyXUNs2T8poJCQ3ZkRU5o7XvO6HxOf4kK/ojW2CxR4
         jZ5aNrpv6S1o9Y5MXeJRQpo5dqa08b/JeaYTB75ZAtA5o0lH7lq/WHuPbhLarW5rzDtH
         2/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688762245; x=1691354245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8qhnZKqQ6do3LcTcDToOBVUXXaj8gtF73nVysM5ZYM=;
        b=JJfkuU6SKrjIJ4/5eTpdQxN/tLSrSCo+yj5d+xecawlMqZmw1L4MuWYaUP6ZfLP551
         03JOU6StUuTK4zZE1gPZhQ2tiz+warKwDOoJXLk1Tg2lpePqRVEks2T+McOZ9yiEGGwo
         yz4QQofYcA8vYfG6v7teaA23AoOulMdf5T2DQgPOmeeWULQ46OEQOajz1mYZTLnEQHIl
         XETlR0iL/RB18m3xfJjnAOU8xwfCXXZCYaTk3La8H99kZQ2YxBE6y9mD2/RDPeVy5NFp
         gIAr2t7AluCXN4kDub7JoP/SXwwCqs1TrsyTHrrU5fVS9u4YrBvJ2x6BoaTwB1UKYlAC
         DEew==
X-Gm-Message-State: ABy/qLayUwbXyrb6YdvxdPYxULQ+SAR+QZ32oYw9rsfO5WGggjB77oMM
        S08zfZYLZKSiwYNaWYBOboWB4A==
X-Google-Smtp-Source: APBJJlGINdp7FwAACK4MNOP6ZsigyR1EN6T+xkvMHjF2Eh6cfgXBI7foVeZAukleVXK5bfI7KIJHPA==
X-Received: by 2002:ac2:4f0d:0:b0:4fa:21d5:8ed8 with SMTP id k13-20020ac24f0d000000b004fa21d58ed8mr5294616lfr.4.1688762245047;
        Fri, 07 Jul 2023 13:37:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 13:37:24 -0700 (PDT)
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
Subject: [PATCH 00/13] drm/msm/dpu: use managed memory allocations
Date:   Fri,  7 Jul 2023 23:37:11 +0300
Message-Id: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In a lots of places in DPU driver memory is allocated by using the
kzalloc and then manually freed using kfree. However thes memory chunks
have a well-defined life cycle. They are either a part of the driver's
runtime and can be devm_kzalloc'ed or are exposed to userspace via the
DRM objects and thus can be drmm_alloc'ed. Implement corresponding
runtime resource manangement for the DPU driver.

Dependencies: [1].

[1] https://patchwork.freedesktop.org/series/118839/

Dmitry Baryshkov (13):
  drm/msm/dpu: cleanup dpu_kms_hw_init error path
  drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error
    handling
  drm/msm/dpu: use devres-managed allocation for interrupts data
  drm/msm/dpu: use devres-managed allocation for VBIF data
  drm/msm/dpu: use devres-managed allocation for MDP TOP
  drm/msm/dpu: use devres-managed allocation for HW blocks
  drm/msm/dpu: drop unused dpu_plane::lock
  drm/msm/dpu: remove QoS teardown on plane destruction
  drm/msm/dpu: use drmm-managed allocation for dpu_plane
  drm/msm/dpu: use drmm-managed allocation for dpu_crtc
  drm/msm/dpu: use drmm-managed allocation for dpu_encoder_phys
  drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
  drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 21 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 71 +++------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 10 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 15 +---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 13 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 21 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    | 19 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 12 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    | 10 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c    |  7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   | 12 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 11 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 15 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 12 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     | 12 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 13 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 15 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 17 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h   |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 12 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 51 ++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 57 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 90 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        | 11 +--
 36 files changed, 210 insertions(+), 470 deletions(-)

-- 
2.39.2

