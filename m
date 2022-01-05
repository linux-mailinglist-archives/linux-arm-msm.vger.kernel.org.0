Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F29485C12
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 00:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbiAEXKi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 18:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245308AbiAEXKi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 18:10:38 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89946C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 15:10:37 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id o12so1259531lfk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 15:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2uWRi1Tnw19DQjCxNI71vGa0f/fnv4e8mcQMQAjEwh0=;
        b=pBkxwEEIb7kjBcYtaBtNrvxzgx8gTZANcdZiH48pWJLG1nEjEpXwJb4UQzk7HooewW
         AuKabkDRCjLZsnav+g+U703MjrYyol3FKpxey/EboUpzAVfG24iEgQzV+z4CHXDzigRx
         fHB5STWyo/u3MTCjmcpZ5iwVGsEwWQFvWB1JUmUCh1uLvUSPNXwQHprS3Oz4LNDpDSlO
         xwxGiiZONoWCQ1iG3O2TXI2wHiSPfLqkj1QdC6Hu4GQ1TyctcaaybxfzjoagELIDIEhy
         lHmplvN8IQCncmKDeCm/j9FSOoFTclGhk8EQNHVVpugLbysDmdjim07o+AoR2srdiRDO
         Z2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2uWRi1Tnw19DQjCxNI71vGa0f/fnv4e8mcQMQAjEwh0=;
        b=AvO0Hw3G257jHewAsB7tC6LoWfGAwDaMlnCf8+tusdJAULHQIvLX5It20d1CrW1kBK
         Q9uVprW5Ho9eH72/P3xwXG/3SmYOg3CXTRS1RjCpDbS4XLxd34dhjCGa/opsDV7Z0zFO
         06G1D99Zm9K/UKvgDX/6mBalIkpfV8D0u8/gYzxnybv1s1aRs1tcrkn5j0E34hSrS7h9
         /HqhLXeUNDYIbLXO5wJFjttdf198txl78yq934DgYpCHGmejWqq/pcsSG8+oW3EwJd9G
         i+Len+ex3a8ufJEifXiWRoQzBMzeDQrDByY/H6rb1ZLn91Wz35hz/9ihVnCQXF6AVms2
         /Ivw==
X-Gm-Message-State: AOAM533SkYRrPzL2cnPhIdcQIHVdFU6a98CtsZ5N767/LmBgusS69Ltm
        gNxNnLI0DkNWUUcR5WJX5yWFeQ==
X-Google-Smtp-Source: ABdhPJzUAouje0ZYdH8MMRI5RVJTtFdrsuKPKFELQlJz/gxYPZFAnVM27oQmGIgXasThy4AgVtx6Rg==
X-Received: by 2002:a05:6512:31d0:: with SMTP id j16mr43103115lfe.448.1641424234974;
        Wed, 05 Jan 2022 15:10:34 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a13sm27187lff.104.2022.01.05.15.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 15:10:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/5] drm/msm/dpu: simplify RM code
Date:   Thu,  6 Jan 2022 02:10:26 +0300
Message-Id: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

INTF blocks are not really handled by resource manager, they are
assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
Then this allocation is passed to RM and then returned to then
dpu_encoder. So allocate them outside of RM and use them directly.

While we are at it, drop the lm_max_width from the RM and simplify VBIF
handling (move creation/destruction to the RM too). Once this and SSPP
handling patches are merged, the RM would handle lifetime of all
dpu_hw_* objects.

Changes since v3:
 - Add missing DSPP blocks teardown
 - Remove dpu_hw_blk from dpu_hw_intf
 - move dpu_hw_vbif creation/destruction to the RM

Changes since v2:
 - Dropped DSPP, PP and MERGE_3D patches for now.

Changes since v1:
 - Split into separate patch series to ease review.

The following changes since commit 6ed95285382d6f90a3c3a11d5806a5eb7db715c3:

  drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540 (2021-12-17 15:09:46 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-rm-clean-4

for you to fetch changes up to 95f32a88ae0dd366700e2ebf98d793b41c53aeeb:

  drm/msm/dpu: move VBIF blocks handling to dpu_rm (2021-12-27 03:41:20 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (5):
      drm/msm/dpu: drop unused lm_max_width from RM
      drm/msm/dpu: add DSPP blocks teardown
      drm/msm/dpu: get INTF blocks directly rather than through RM
      drm/msm/dpu: stop embedding dpu_hw_blk into dpu_hw_intf
      drm/msm/dpu: move VBIF blocks handling to dpu_rm

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  36 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  16 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   8 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  11 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  28 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 116 ++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  31 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |  26 ++---
 12 files changed, 70 insertions(+), 218 deletions(-)


