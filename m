Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6949874B9D0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 01:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjGGXM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 19:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGGXMz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 19:12:55 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A281FF9
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 16:12:54 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so3994608e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 16:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688771573; x=1691363573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2n/H2No59Vs8LK9WsAaarYGCaij4epyQSN1PdTEfblI=;
        b=Dla03EkKNz919pj9om1kw3yNUe83gMpfMMk7prnS2fq6OxdIOi0pnAfT8Tw/SoS0vc
         mHOagzXXHLE6k6Z2hFCGwmhbOGPnSuZf/82RkP3L1qe9h7VqhbDAVbRypCk4YU4vAXlI
         B7nMDeQ+xjdnZ1oUeR/hUG7NKr3aR8yt3GSo//FKcVdF8L5vJA1JuU8C4gFt4vS8xfmt
         6v36kZSoZw/PNEPIE+9sLH9ZS8d/aN1gwyrkVW0H59xIQeEL7dO9VRsOObleauXa3rYa
         ymRioYk5GIyRVwcSPelmy9+upuwVZRNwsvf7E/OdMj3a5Lg8yZkKHFKF5pMb+2aWRKYG
         afVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688771573; x=1691363573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2n/H2No59Vs8LK9WsAaarYGCaij4epyQSN1PdTEfblI=;
        b=Zd6/bKQVRTLstT57kwSO0Vn3ziTfeYRex1Rzo6i5DLigRw1oT7LWEhYD8kohiJeYFy
         B8NK9V+r8ZXpA/z1qcYODngQPekCxj+mkS3J4Wl8JMpKxJD5YUscbQLIfLcEDv+tMIBd
         QMVVUXePZ2hJDWmMiEu/ttf2+w/MYCz9R0i6Hcc1NLL5UfEVrpuY66+a1IwiR+JdUVd/
         oznEVe4Dxw8Si02eQzBrL4mxezyYXa2d6OvRwTslS2m4MqOsci+z03h2qQPsbZI20+WA
         awhrAep6PivP9Ao0ubW4Ulxj5MY3mkPpfRvCh4EX7ZE6KGG9j3I3yj976aW9K5vmSB9P
         agkg==
X-Gm-Message-State: ABy/qLblsJmEILwAZO9tZy+mo6eAdZZFqHfjBNHAM2+gGri9AWHBNq7u
        40Jq5n+bRSZLmeXbjxS7kOyr8w==
X-Google-Smtp-Source: APBJJlHaSNkPJSckPK3AAkcQy9zW4vvooecLgJWL8z8f9yFYqF9oVcu6N208L/2isuZAq1kMddZLaQ==
X-Received: by 2002:ac2:5b9b:0:b0:4fb:79b5:5512 with SMTP id o27-20020ac25b9b000000b004fb79b55512mr4309889lfn.66.1688771572596;
        Fri, 07 Jul 2023 16:12:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 16:12:52 -0700 (PDT)
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
Subject: [PATCH v2 00/13] drm/msm/dpu: use managed memory allocations
Date:   Sat,  8 Jul 2023 02:12:38 +0300
Message-Id: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
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

Please excuse me for sending v2 on the same day, it fixes erorr paths
for drmm allocation code.

In a lots of places in DPU driver memory is allocated by using the
kzalloc and then manually freed using kfree. However thes memory chunks
have a well-defined life cycle. They are either a part of the driver's
runtime and can be devm_kzalloc'ed or are exposed to userspace via the
DRM objects and thus can be drmm_alloc'ed. Implement corresponding
runtime resource manangement for the DPU driver.

Dependencies: [1].

[1] https://patchwork.freedesktop.org/series/118839/

Changes since v1:
- Fix error handling for some of drmm_foo_alloc() functions, which
  return error pointer in case of an error rather than typical NULL.

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

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 25 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 77 ++++------------
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 59 +++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 90 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        | 11 +--
 36 files changed, 216 insertions(+), 476 deletions(-)

-- 
2.39.2

