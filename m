Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6629B3B31E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbhFXPAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 11:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhFXO77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 10:59:59 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A1AC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:39 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r5so10825243lfr.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ia9jH+C7md2MacvtUXiDMLbc784RQr0SQ8WvwoL6eCw=;
        b=W9jyfgYCw/a2GAnolWq8YqIz6ASKOYbmlJcHMBWQQxDOFPROyy6LgTDSKkYbPCUH61
         y/PQE7gx0S7DTAfeuslnsveKq0lXTaElVuxJi09XOuV1biGOngmRbMnN3MMHK3MvyQnm
         3J5E4Zze9JkZHBR31YnYJSQvBSil+Aj4vlNewOfgAYSxZtvEDAcqEbP5d45fK+4rKsVi
         HQpo4cXdkJirZIlrPde7vrPPyXn+CCt++FupdGkNBSNU2gXN8Xe2bTXYteYlzLkcLp5o
         FC6MzDctap4/kG1GtkJ54CJB2cIb+85Y3L9lUruCvuDC2Uc/MyiLrpQokTusV+9WoCtf
         7hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ia9jH+C7md2MacvtUXiDMLbc784RQr0SQ8WvwoL6eCw=;
        b=NvNYbH8GGzj9jFIVgZRsPUVnNtO8mL0BT0ihtfJvGaaNAp7LkBcsHnO6cUTpng89gO
         oJwoF0O/fBoMD/oTEmBbDVXSUMNyTncdmbYcgr7/opZJAi1YpyE+RNYDOQLQ4VRykjtH
         bI34U90ORHHpg7xlRBbyhZ1af73eEETguzOUUI04EdmjJHj0w9dtjqYNEgYmKXNogjk6
         GScoahh1MGB0qxvGxDoH4l9cw8qhZ7PiqzhG6L5vl4oVhwiRRB+tpwqpqwSbm+eSewsA
         cv2YivoWmEozvSFY4zJpR4iSg6rOdRxJ/djj4qATwJdvCMVj2iEmqKZqfBws9u0FfRhk
         UrPQ==
X-Gm-Message-State: AOAM530zJVmfkcGHB1sWfbxwndguAw7ihRuk4EOmBUFOjtpo0EsE4QYN
        syKvJH9NBa7kPlEfxp+k+bht9Q==
X-Google-Smtp-Source: ABdhPJy9pvB8R4NLyfB0BMG79NbtPH7wQCg6nzDbsIR5DeQsPRjGffDtH2N8SuGtJa1gyTE9YJ/4lA==
X-Received: by 2002:a05:6512:33c8:: with SMTP id d8mr4034338lfg.21.1624546658106;
        Thu, 24 Jun 2021 07:57:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 07:57:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 00/17] drm/msm/dpu: switch dpu_plane to be virtual
Date:   Thu, 24 Jun 2021 17:57:16 +0300
Message-Id: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As discussed on IRC, change dpu_plane implementation to be virtual:
register unified planes and select backing SSPP block at runtime. In
future this would allow implementing multirect (or wide planes) in a
proper way, without requiring zpos hacks or additional userspace
handling.

The last patch adds a compile time #if to select between virtual planes
or traditional planes. It is implemented this way to ease testing of
this patchset. In the next versions it is going to be morphed into
the proper module parameter.

The following changes since commit e88bbc91849b2bf57683119c339e52916d34433f:

  Revert "drm/msm/mdp5: provide dynamic bandwidth management" (2021-06-23 14:06:20 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-virtual-planes

for you to fetch changes up to c0b20040e9b265e77cbf02c5b5312090b3677f81:

  drm/msm/dpu: switch into using virtual planes (2021-06-24 17:50:54 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (17):
      drm/msm/dpu: move LUT levels out of QOS config
      drm/msm/dpu: remove pipe_qos_cfg from struct dpu_plane
      drm/msm/dpu: drop pipe_name from struct dpu_plane
      drm/msm/dpu: remove stage_cfg from struct dpu_crtc
      drm/msm/dpu: rip out master planes support
      drm/msm/dpu: move dpu_hw_pipe_cfg out of struct dpu_plane
      drm/msm/dpu: don't cache pipe->cap->features in dpu_plane
      drm/msm/dpu: don't cache pipe->cap->sblk in dpu_plane
      drm/msm/dpu: rip out debugfs support from dpu_plane
      drm/msm/dpu: simplify colorspace conversion setup
      drm/msm/dpu: drop src_split and multirect check from dpu_crtc_atomic_check
      drm/msm/dpu: add list of supported formats to the DPU caps
      drm/msm/dpu: simplify DPU_SSPP features checks
      drm/msm/dpu: do not limit the zpos property
      drm/msm/dpu: add support for SSPP allocation to RM
      drm/msm/dpu: add support for virtualized planes
      drm/msm/dpu: switch into using virtual planes

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 215 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h       |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |  44 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 139 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |  70 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 709 ++++++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  81 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h         |   6 +
 14 files changed, 560 insertions(+), 783 deletions(-)


