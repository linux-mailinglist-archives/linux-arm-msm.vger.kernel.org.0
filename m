Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43A88465980
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353705AbhLAWzJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:55:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234878AbhLAWzI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:55:08 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0CCC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:51:47 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id e11so51090702ljo.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LinOAr9WnhpJ24BLrn3sZdZ+0aYn5ScowkAkafZkgzk=;
        b=ThKFwuZSVd3ToYrNMW2WOP+ciG9WzEESvCpyc24L6sS+rc1TU/cLSNuZa+svvHiMlc
         XC7clP0nC7+wcXrGsIOhbEUpWkUI3vSZMWiZZE6h4aBuIdIaDyh9kUMUNUVMJtmp/UIj
         l1LCaOXWiJMFsIcjtetgkk+Dihce/226IbNe+hu1XMYjrF86A1CFEQwhfODXItB2kXBl
         RnaYB8v82bEZbm2pO5YQlFViAx4gwnkId1+6l8wPzqL12ybrMheL7vIHVuEplo09vh6D
         bH390dbHkwmxKskn5rb6vzD1UMEH4UP/GYZScbdDBzWga+t7nPSuhhGwBZgMRxom4fzo
         P3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LinOAr9WnhpJ24BLrn3sZdZ+0aYn5ScowkAkafZkgzk=;
        b=fp9UJeNef7qM6Q3rWVL3XSCp0LbCinsHnTv8FavyUA3g8NNVR+RWJXalKFT4rRxCQj
         cWvBya0QWla14lX0WSFM/5Fx8EQ+s+utc9JznnSMSOO8kGXGwOzNpEqoIg4BwVyPbKdO
         7MBMlHflW7pbZwj0GpdqjzPBwng/2oOhpVAjmmAK1Ac6dPeugJbBmuAzNiU0tjBW13Sb
         Z1q7cZasDo5lPg/zPPNoEQ5Qk/ilSh1JRlelv/lJgb7DMSsqcVUKZBcaPEWchh+vDHxr
         sEmNvlNFECQwZfmlbR82w2uA3v9w1oxunef4qrHyFeMe2aBcu6jJA5iPTPwJoxoUbPW+
         tjxg==
X-Gm-Message-State: AOAM5313yQRTyw951/kFGWeRV+exxqIIcP7VdFc5XqLbvHGyICFQPsbh
        SAbPMpkkQiYPB2NPqQHlDmer5A==
X-Google-Smtp-Source: ABdhPJxpgF0FpbJkpPb4j/ZVzSbW14jI2tl4snOtyns43vmJ7g2gYFCde3sVss1YXsc716dBLc/x7w==
X-Received: by 2002:a2e:bf18:: with SMTP id c24mr8456764ljr.408.1638399105575;
        Wed, 01 Dec 2021 14:51:45 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm124819ljh.49.2021.12.01.14.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:51:45 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/msm/dpu: cleanup plane state
Date:   Thu,  2 Dec 2021 01:51:36 +0300
Message-Id: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a cleanup part of the DPU multirect patchset [1], split away to
ease review and merging per Abhinav's request.

Changes in v2:
- Drop patches that were accepted
- Removed pe argument from _dpu_hw_sspp_setup_scaler3
- Add CDP setup and DPU_SSPP features checks patches that were left from the previous series

[1] https://lore.kernel.org/linux-arm-msm/20210705012115.4179824-1-dmitry.baryshkov@linaro.org/

The following changes since commit fee32807633395e666f0951d6b7b6546e9b76c3d:

  mailmap: add and update email addresses (2021-11-29 16:19:58 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-cleanup-more

for you to fetch changes up to 5f4622c2324756e942e6e40227997713cdd0a03a:

  drm/msm/dpu: fix CDP setup to account for multirect index (2021-12-02 01:29:18 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm/dpu: drop scaler config from plane state
      drm/msm/dpu: drop pe argument from _dpu_hw_sspp_setup_scaler3
      drm/msm/dpu: simplify DPU_SSPP features checks
      drm/msm/dpu: fix CDP setup to account for multirect index

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 14 +++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 22 ++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 64 +++++++++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  6 ---
 4 files changed, 52 insertions(+), 54 deletions(-)


