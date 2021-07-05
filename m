Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D693BB4A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 03:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhGEB1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 21:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhGEB1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 21:27:45 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B169FC061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 18:25:07 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id r16so22345804ljk.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 18:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TH133PMJno+mPjAjsURMXhfTH79oMxdrJi/r1nPUC3I=;
        b=h0vNqOSX+W3ea91NP+5pqalVizigpm7ZITcTtKJYcY2Op/RLlYhTysynRdRmcFoGQA
         5ta8t2CNsr9oL3R214bewYqQlF6AfGSuIbw4plBNxlg+oDb9SLXUeWDXGskf2hF/H+ON
         HjPCpF5Q3aD1bc1DmaIFPXou3zmuTKkKBEEALWi4xkgmCNpoxBeOUOFtIim3kflVbdkJ
         lZKPBV6qU2ZNZodrv/xVYxJlOkLESIEOuqc1eqFGND5TvcGMbOKR6TGFBszxuMKMAiuC
         kfiyfNJ2itjCrYoFMuIwCfPa1RYOWcAhSbNz0fSq2R1oef8zT9biILk63XOUN9/yzZVy
         hjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TH133PMJno+mPjAjsURMXhfTH79oMxdrJi/r1nPUC3I=;
        b=jwB0Z+AqIAUH/7NHmwatZpdotiEjB9Pcc3Q8lPuDxq79PkITlSI7rzPXKvl1jNSUHZ
         1lPQFkQdDAoEvCc1hsnBujFi8IJuanV/BLIMELyjBulsvEK7lzMsjxfkZk9623Uw2HVj
         YWp1ruzNihS+eQmmMk48bczPiOjfwq7LgxQVVnj/qH0cA2torT6FtZne7WoQyBINYL+g
         PTxU/mp17Y/4p4Urkfte5KetgvS+HaxIst0VQHuV7SVT629/gXUjGk8eKFmWzo0XzHPn
         r6gNTEz4MZMd837pPfsoEa+BWiB93nLDgFXhJRlOvEVTc1zSRAwUvKpyUylPXeMPIDBb
         TtGQ==
X-Gm-Message-State: AOAM5307jgak3TV4LZSrS+xMo8Gf4rAUPijFL65jUdC9eay3o0HIsCL3
        +5gbHq0I2LgRWoX4IzVHM+TcUw==
X-Google-Smtp-Source: ABdhPJx0/6YFp0gUmuuPrTY1JfZGGPq9twLx323+auB6hkCdcIIEtNmP/YkEf8tGLZAgGTGD/F4AHQ==
X-Received: by 2002:a2e:b81b:: with SMTP id u27mr311724ljo.345.1625448305975;
        Sun, 04 Jul 2021 18:25:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 18:25:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 00/22] drm/msm/dpu: switch dpu_plane to be virtual
Date:   Mon,  5 Jul 2021 04:20:53 +0300
Message-Id: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As discussed on IRC, change dpu_plane implementation to be virtual:
register unified planes and select backing SSPP block at runtime.

Use msm.dpu_use_virtual_planes=1 to enable usage of virtual planes
rather than statically allocated SSPPs at the plane registration.

Patches 1-9 move state variables from struct dpu_plane onto the stack
allocation. State should not be a part of struct dpu_plane anyway.

Patches 10-18 make additional changes to plane code, reworking check,
debugfs, dropping old multirec support, which results in patch 19 adding
support for virtual planes per se.

Patches 20-22 demonstrate my main goal behind reworking dpu_plane
support. They change dpu_plane to automatically use one of SSPP block
features - multirec, an ability to display two unscaled RGB rectangles
using single SSPP block. This allows us to double the amount of created
planes. If the user tries to enable more planes than actually supported
by the underlying SSPP blocks, atomic_check code would return an error.

As you can see, this patchset is not atomic, so different patches can go
separately.

Changes since v1:
 - Add multirec implementation
 - Added msm.dpu_use_virtual_planes kernel parameter instead of using
   compile time switch
 - Changed code to always reallocate SSPPs in the CRTC atomic check to
   let the kernel pick up the best multirec config. This can be
   optimized later.
 - Rework RM SSPP API to always receive plane id
 - Removed scaler_cfg, pixel_ext and cdp_cfg from struct dpu_plane_state
 - Made _dpu_scaler_setup() call sspp's setup_scaler and setup_pe
 - Removed dpu_csc_cfg from dpu_plane

The following changes since commit e88bbc91849b2bf57683119c339e52916d34433f:

  Revert "drm/msm/mdp5: provide dynamic bandwidth management" (2021-06-23 14:06:20 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-multirec-2

for you to fetch changes up to 19f6afd40097d4c826e56b8f4a8cbd807f7b61f6:

  drm/msm/dpu: add multirect support (2021-07-05 04:04:50 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (22):
      drm/msm/dpu: move LUT levels out of QOS config
      drm/msm/dpu: remove pipe_qos_cfg from struct dpu_plane
      drm/msm/dpu: drop pipe_name from struct dpu_plane
      drm/msm/dpu: remove stage_cfg from struct dpu_crtc
      drm/msm/dpu: rip out master planes support
      drm/msm/dpu: move dpu_hw_pipe_cfg out of struct dpu_plane
      drm/msm/dpu: drop scaler config from plane state
      drm/msm/dpu: drop dpu_csc_cfg from dpu_plane
      drm/msm/dpu: remove dpu_hw_pipe_cdp_cfg from dpu_plane
      drm/msm/dpu: don't cache pipe->cap->features in dpu_plane
      drm/msm/dpu: don't cache pipe->cap->sblk in dpu_plane
      drm/msm/dpu: rip out debugfs support from dpu_plane
      drm/msm/dpu: drop src_split and multirect check from dpu_crtc_atomic_check
      drm/msm/dpu: add list of supported formats to the DPU caps
      drm/msm/dpu: simplify DPU_SSPP features checks
      drm/msm/dpu: do not limit the zpos property
      drm/msm/dpu: add support for SSPP allocation to RM
      drm/msm/dpu: move pipe_hw to dpu_plane_state
      drm/msm/dpu: add support for virtualized planes
      drm/msm/dpu: fix smart dma support
      drm/msm/dpu: fix CDP setup to account for multirect index
      drm/msm/dpu: add multirect support

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 261 +++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h       |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  41 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |  52 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 234 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |  70 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 851 +++++++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  75 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  81 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h         |   6 +
 14 files changed, 793 insertions(+), 924 deletions(-)

