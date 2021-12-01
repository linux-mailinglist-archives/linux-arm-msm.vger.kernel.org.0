Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F2B465929
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353656AbhLAWaJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353603AbhLAWaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:30:00 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8F7C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:26:38 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id u22so51106857lju.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ip6tH66sFwIRDGZQfJf5IUaV/Ay1mM2dMBRUgzosl4s=;
        b=m7/LQOEZ4csiLqP0tqpbP513BSPbaS/eh60yVhmxkLrs5czkcff8uLUhOACWasMHWm
         MXV0rwCwzVrXLL/OhYAPiXvZ4IVm6sm8HE6iaXGCVakhKjL5NBVBWDGGQv0gpZCtz0Yx
         bJ8wie8hPqPuEsNVoWoRAkR1V0asKkKKO4apVdpnbWCPk2PBnJ8YnHcDYorTS88zzTEk
         8j9bkouamGROaQ9rwsfGsUEc9nL30tK4OyIoohEE3OqFVQ57xbDMKLuPewkufPuwzB+D
         mJUIY40nRr9dWMwcjouSPF8pI20AnMxUaLTOxCvCt7O9cbzgiWmsUG8rGKkU9+c+LHqh
         NQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ip6tH66sFwIRDGZQfJf5IUaV/Ay1mM2dMBRUgzosl4s=;
        b=LpJd9uswxOdPUUhMzFE4gq5IwSvcpEamwmojaDPwNcPXIrV8uWp3t+4Kbvbpr2u6az
         e2zLOBfPWG9xNicFZp76mWZN4SIrcgQ/XwvEvA22fQ5VCcebuB8ZtbFY05hw/d/2N1vq
         32bk75U4qUUVDM4BzEmStWH6XCNR2ryknDLqd+9M32SJMjudZANMOONjaQBuPRcQUteS
         bfoRunw5Z35RpoKk0O8IG/cR3RYeaAhOSqJJ8k4Ytu9nQ//xdTWcIOi9Z3vh3jNQw5ID
         GZ9+TURDBUDHHT+evXnjm7+bnZmBVLXcTDRtob9p0fAE1FHFKxwRKB7lNOzs4j2TnYNY
         nLeQ==
X-Gm-Message-State: AOAM531ZLrBDhY4OyYW7itfD13ahapgV7Qt8bJ5lFG5JqbAGY2usxe8W
        H1kUcqAiGLpr+IzvnadWw2K2aQ==
X-Google-Smtp-Source: ABdhPJyB/JcM5PIieYhXG5Bk5ecm0Xiqx+28uaEqhgVdULrxrin2+DrjYzG+mZPUySXvml0nHL2ruA==
X-Received: by 2002:a05:651c:323:: with SMTP id b3mr8209730ljp.316.1638397596773;
        Wed, 01 Dec 2021 14:26:36 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:26:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 0/8] drm/msm/dpu: cleanup debugfs code
Date:   Thu,  2 Dec 2021 01:26:25 +0300
Message-Id: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset provides a partial rework/cleanup/fixup of debugfs code in
DPU driver. It started as a single patch removing (and then just moving)
SSPP debugfs code from the plane (as planes are going to be less
connected with SSPP blocks soon). However the more I touched this code,
the more patches were generated as more and more issues arrive on the
surface.

The following changes since commit fee32807633395e666f0951d6b7b6546e9b76c3d:

  mailmap: add and update email addresses (2021-11-29 16:19:58 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-cleanup-debugfs

for you to fetch changes up to 7f3598ee9ea525920cd6fa65b498604a9ff8b36a:

  drm/msm/dpu: move SSPP debugfs support from plane to SSPP code (2021-12-02 01:03:49 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (8):
      drm/msm/dpu: move disable_danger out of plane subdir
      drm/msm/dpu: fix safe status debugfs file
      drm/msm/dpu: make danger_status/safe_status readable
      drm/msm/dpu: drop plane's default_scaling debugfs file
      drm/msm/dpu: stop manually removing debugfs files for the DPU plane
      drm/msm/dpu: stop manually removing debugfs files for the DPU CRTC
      drm/msm/dpu: simplify DPU's regset32 code
      drm/msm/dpu: move SSPP debugfs support from plane to SSPP code

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  15 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   3 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  67 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 109 +++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  38 +-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 172 ++--------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |   6 +
 8 files changed, 189 insertions(+), 225 deletions(-)


