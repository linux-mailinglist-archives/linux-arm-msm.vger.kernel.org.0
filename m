Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 181F06C2753
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 02:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjCUBUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 21:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbjCUBT7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 21:19:59 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5C913D68
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:19:30 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g17so17242761lfv.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679361502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2oSBrtXTlIavj0D+3ImHLkkGT3pMw5W/AEEoPft+s0=;
        b=bHGX8XhbTx1A4sp4Ch1TGkqQRQSBfNGa+qToVD0BDf86yYlQHsyQF+d2qpS9szjsDO
         U4yCsi0ntZisSZbngbWKVjShEMcF85Pvs9zzjexIKthkfZRztHxrVFB5t2n2ROnruZ1G
         4VQ/i4kPlAATdmya55bgkrThXNmrUE4n8clgPtG/D6tSxqXFIUXbCmZLVMKiQWULp01r
         DAxQnuk/esMmvTVQ4SVzOUsDxunGy/bNmYwmbWM8wEl5hxcQkZD++ZvL4SA5L1z4C1OP
         ec8H4du+mnbRHHGD7fLxS6f59H1OFqfcg3aFcIS1zfJen29ugOODd0aSe1HxZXP4tRBI
         dxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679361502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2oSBrtXTlIavj0D+3ImHLkkGT3pMw5W/AEEoPft+s0=;
        b=jDtGjZodGtO9IJyCRz0gGgcHgshRoZptfYfDiDVaET8B+LjGGkbQs2Y0934f5c2CMY
         wGeWEb5/Nh2vllH/lMN/58wKoUQ7uHJvykzh0KV0rxz34WJCFhkjoZ16NDxlg8JySYiq
         jQdAEKezIrY7VLS/EeNvU0z9ntuGcExMPdDhDxHdJRyhV3BfDWxUlM0Y/T18k4bX2UwS
         s25VZmZg4OUP1/Rc7W6elfs9E8e6hfLfF5zeFhHANdEckkDfF2X2379H4MBIYCUZXa28
         81l/dBeHvX+G2cySDRYTrwhrWfiRbZrnU9vocFB+i8XaP7AI6WHvoTjuxhM55moRtn7P
         PjOQ==
X-Gm-Message-State: AO0yUKWdWKeVvXzk7f4duWg7Lhj7DUyk1KmLtVb9q2Thcv+YzA1ccDdY
        m26u0deahDUr8N8ithmkVG+hmQ==
X-Google-Smtp-Source: AK7set8H/L9QCHzP+FOraHrifOmo4RTU50Io+FObShBKB4dSBGughgusTRUE1KIkQsHtECSTtiqkcw==
X-Received: by 2002:ac2:554d:0:b0:4e8:16e8:88b with SMTP id l13-20020ac2554d000000b004e816e8088bmr216430lfk.29.1679361502514;
        Mon, 20 Mar 2023 18:18:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 18:18:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 00/13] drm/msm/dpu: support virtual wide planes
Date:   Tue, 21 Mar 2023 04:18:08 +0300
Message-Id: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As promised in the basic wide planes support ([1]) here comes a series
supporting 2*max_linewidth for all the planes.

Note: this iteration features handling of rotation and reflection of the
wide plane. However rot90 is still not tested: it is enabled on sc7280
and it only supports UBWC (tiled) framebuffers, it was quite low on my
priority list.

Note#2: to simplify the dpu_plane_virtual_assign_resources(), which
already becomes big enough, I stripped support for sharing the SSPP
across two planes (doubling amount of planes available to some of
compositors/applications). I plan to get back to this topic once this
series lands.

Dependencies: msm-next + msm-fixes, [1], [2]

[1] https://patchwork.freedesktop.org/series/99909/

[2] https://patchwork.freedesktop.org/series/113423/

Changes since v1:
- Fixed build error due to me missing one of fixups, it was left
  uncommitted.
- Implementated proper handling of wide plane rotation & reflection.

Dmitry Baryshkov (13):
  drm/atomic-helper: split not-scaling part of
    drm_atomic_helper_check_plane_state
  drm/msm/dpu: take plane rotation into account for wide planes
  drm/msm/dpu: encoder: simplify debugfs handling
  drm/msm/dpu: remove unused fields from dpu_encoder_virt
  drm/msm/dpu: get rid of struct dpu_rm_requirements
  drm/msm/dpu: switch RM to use crtc_id rather than enc_id for
    allocation
  drm/msm/dpu: move resource allocation to CRTC
  drm/msm/dpu: fill CRTC resources in dpu_crtc.c
  drm/msm/dpu: move pstate->pipe initialization to
    dpu_plane_atomic_check
  drm/msm/dpu: add list of supported formats to the DPU caps
  drm/msm/dpu: add a field describing inline rotation to dpu_caps
  drm/msm/dpu: add support for virtual planes
  drm/msm/dpu: allow using two SSPP blocks for a single plane

 drivers/gpu/drm/drm_atomic_helper.c           |  85 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 162 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 150 +-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |   8 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   3 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  27 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 120 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 428 ++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 243 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  41 +-
 include/drm/drm_atomic_helper.h               |   4 +
 14 files changed, 959 insertions(+), 365 deletions(-)

-- 
2.30.2

