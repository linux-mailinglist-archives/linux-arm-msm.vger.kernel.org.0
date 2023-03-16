Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8E946BD65A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjCPQzr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjCPQzr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:55:47 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF001A48B
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:55:45 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id t14so2378697ljd.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678985744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ddCuXBQgnXQh+/CwTja1CP3GIxaM+lqK2/Q3SFDKyrM=;
        b=yRzfuiAwV5saRxCLWZKFDDN4GuouYN4WkqeoSNB9dIbpAEBWA1cvf0mjBeDO4FbTJD
         RdMS5cqXPfFhjnO/5VUBGHNHTMEyKmZHnWFZdIvDLo4X1a/Q/O918NJmzK57LxpvuTrF
         1wJjcKUYsyaC9rSN47AG7vXUK1VaDv5yGPN0Khs7kR4TQUG7tWK9F9f5U9TpWSCxPp/Z
         8Hiz+SrNReFTkhs/jaNENxUwlg11u9gin/LsonHS/LkwHVc7UvYtvzJKC1iY7rTqD6+7
         4z4DMvZN2zM4vyyPmUZNzGU7LYS1WdIv5oVktXsNF417Hrj6MGd9Y/pVAumr5vDhgg1v
         NVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678985744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddCuXBQgnXQh+/CwTja1CP3GIxaM+lqK2/Q3SFDKyrM=;
        b=O2PIyG9GpdULvTm0mOtL4xc1n/hj34qTgvRnieShwjRG4jHFNCs+d/NvJ0eJT8z4Ue
         R64xP8yUzD+orEi8UavBHv8a8G2kt07B/AADAPEkusKGUDahEq+8g9V2IUWLlEpCinAM
         /lDLNJqx+dwGabIxBaJxbEkmPe6/Amr6cIdis89Bfqpj/Cw8elSeYezM9qZJTolh9i27
         INrIDAO7sn0YVndfu+apRN8H8duBenb436i0RNo1eJIPBwk/PYpko0j+XwP1mP8Y8NVg
         JLArsBjfcYyVozFKQActTGporbmaeAOTy7/DVhLipg/7f9aug4KJkC4/t0Jjuq4/VYE/
         kWrg==
X-Gm-Message-State: AO0yUKVmHyZhqzJOK1hWvoVhFQRjknqJ301VAiIC7GFSksgEx5IoYen1
        NzJiyQ2+M34tErlU2/XisoLvPt/pwUtgwyoumtA=
X-Google-Smtp-Source: AK7set81w+9x/crPh4QUOdMXw89IwpB46ddLI6CCN308X57c23h7e1oWoIPnSY7hZ1AY0o3UFGhQWQ==
X-Received: by 2002:a2e:351a:0:b0:299:ac62:1460 with SMTP id z26-20020a2e351a000000b00299ac621460mr705588ljz.53.1678985743895;
        Thu, 16 Mar 2023 09:55:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t18-20020a2e9c52000000b002934b5d6a61sm2661ljj.121.2023.03.16.09.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:55:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v1 00/12] drm/msm/dpu: support virtual wide planes
Date:   Thu, 16 Mar 2023 19:55:30 +0300
Message-Id: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As promised in the basic wide planes support ([1]) here comes a series
supporting 2*max_linewidth for all the planes.

Note: Proper support for rot90 is pending. Granted that it is only
enabled on sc7280 and it only supports UBWC (tiled) framebuffers, it was
quite low on my priority list. I plan to get it done for v2.

Note#2 to simplify the dpu_plane_virtual_assign_resources(), which
already becomes big enough, I stripped support for sharing the SSPP
across two planes (doubling amount of planes available to some of
compositors/applications). I plan to get back to this topic once this
series lands.

Dependencies: msm-next + msm-fixes, [1], [2]

[1] https://patchwork.freedesktop.org/series/99909/

[2] https://patchwork.freedesktop.org/series/113423/

Dmitry Baryshkov (12):
  drm/atomic-helper: split not-scaling part of
    drm_atomic_helper_check_plane_state
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 150 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |   8 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   3 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  27 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 120 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 398 ++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 240 ++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  40 +-
 include/drm/drm_atomic_helper.h               |   4 +
 14 files changed, 933 insertions(+), 357 deletions(-)

-- 
2.30.2

