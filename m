Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726D579F9DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 07:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234443AbjINFHe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 01:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234197AbjINFHe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 01:07:34 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB8F98
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:29 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-500913779f5so838114e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694668048; x=1695272848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FDKM0kqt8x0UbxVfV3bjcjIyAdF1y2yMeGqfjlTgnI=;
        b=CCaUESfYYy2YmkyX9bfkTDLG3YyiXnkgTK+iwaOdGlRv852tFHmiKbwwZSRG7VstLm
         GQcI3OfEInoccVwV+Q9rfATUA6VMEfDeZoZ90XkDSrzUYAZEUtV/boBlvYaaUCNqWqW+
         KbeGXX5xsTuRVuseQMEDDt1cDjbdbBXRH+OZYyRDERzLcoqkYk/ocSIpUPCDZT+PiID+
         MHmOwyNLc7Fyj/cGFrC1lMkOnGm9maOVhS/diO3bxqMC/f2sxl0cikRw5WFqCCTC9IGW
         nkkqug5muWbEqwx6fOdRlpmbXF6DOEl6EMzxPZhTGhNUt37YH4nO0IoLoNoPLUh7fFPy
         0TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694668048; x=1695272848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FDKM0kqt8x0UbxVfV3bjcjIyAdF1y2yMeGqfjlTgnI=;
        b=SaYYKRBPf64YAhvZ9J8txUuuPIbKYpCJhVYX9dSSD29/Nsbck5fqrvkNk88UjGs6zJ
         HuZ39DnCxVp4kWdO8JygQ32hUGSGk4OvtALRoLeHJQ0W5eGUCXe5yHe4Vl15xSw6xyXK
         mAJhHhGRXRqotnw4mReqPW3kiO96DO0IwKZdZYlzhabsO3Bl1s91FLE6plW0OgGJMcq/
         0TkcVuEQLUzHLVzk8ZsN5K0qrxdGcJGwoNZ67hA5/l2L6RBNC5xnFkSekjtIGZ8gucS0
         6ITVqpHjCRUaZLylTz6FXmnRSFJZpyOqAlXlEeTCojio9NsVxxj8+CLszTe9xGtQglhI
         PKcA==
X-Gm-Message-State: AOJu0YyJwHVlJ6tzLN8/mQVe26eOU2oj4pdQVdgDUtYVWdg244KOSFDp
        zEYsa/JQ9ZqoocNYMGrH3kAE0ZiLu0LIPnb9UGQ=
X-Google-Smtp-Source: AGHT+IHtMHUUYGm+veS7ba1V0nWBgHsVD++J4m55U2tdtgdIV/FDoAJGB8Y/p4NrroeH4BC5sdNsBw==
X-Received: by 2002:a2e:9791:0:b0:2bc:c557:848a with SMTP id y17-20020a2e9791000000b002bcc557848amr3834635lji.50.1694668027841;
        Wed, 13 Sep 2023 22:07:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 22:07:07 -0700 (PDT)
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
Subject: [PATCH v3 00/12] drm/msm/dpu: support virtual wide planes
Date:   Thu, 14 Sep 2023 08:06:54 +0300
Message-Id: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As promised in the basic wide planes support ([1]) here comes a series
supporting 2*max_linewidth for all the planes.

Note: Unlike v1 and v2 this series finally includes support for
additional planes - having more planes than the number of SSPP blocks.

Note: this iteration features handling of rotation and reflection of the
wide plane. However rot90 is still not tested: it is enabled on sc7280
and it only supports UBWC (tiled) framebuffers, it was quite low on my
priority list.

[1] https://patchwork.freedesktop.org/series/99909/

Changes since v2:
- Dropped the encoder-related parts, leave all resource allocation as is
  (Abhinav)
- Significantly reworked the SSPP allocation code
- Added debugging code to dump RM state in dri/N/state

Changes since v1:
- Fixed build error due to me missing one of fixups, it was left
  uncommitted.
- Implementated proper handling of wide plane rotation & reflection.

Dmitry Baryshkov (12):
  drm/atomic-helper: split not-scaling part of
    drm_atomic_helper_check_plane_state
  drm/msm/dpu: add current resource allocation to dumped state
  drm/msm/dpu: take plane rotation into account for wide planes
  drm/msm/dpu: move pstate->pipe initialization to
    dpu_plane_atomic_check
  drm/msm/dpu: split dpu_plane_atomic_check()
  drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_pipe()
  drm/msm/dpu: add support for virtual planes
  drm/msm/dpu: allow using two SSPP blocks for a single plane
  drm/msm/dpu: allow sharing SSPP between planes
  drm/msm/dpu: create additional virtual planes
  drm/msm/dpu: allow sharing of blending stages
  drm/msm/dpu: include SSPP allocation state into the dumped state

 drivers/gpu/drm/drm_atomic_helper.c         | 110 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  59 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  26 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 671 ++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 130 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  36 ++
 include/drm/drm_atomic_helper.h             |   7 +
 10 files changed, 924 insertions(+), 152 deletions(-)

-- 
2.39.2

