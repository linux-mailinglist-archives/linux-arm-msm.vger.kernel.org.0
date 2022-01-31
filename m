Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEAD4A50B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 22:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbiAaVFS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 16:05:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbiAaVFR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 16:05:17 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51ABCC061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 13:05:17 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b9so29493054lfq.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 13:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vThlvEmvp/6FBsR0reDfoEC2yRp4jMGo+thDfo0ZGZ8=;
        b=wEm14HJQFhoMXlPM74AVZSRNXm4lL1H4VaVe/aGOQKqmaDrT7c50hAMsniEWf0IEpT
         8pUKh4uIMtf9e9VTiNClQ/rU81KZvmbZYNEI2JnVY79k39uyolei7JuXYehDta/Jg8Rt
         SQTnvJLYT58wOgGtggNV1mePq9AVbYyRGWUnMKkgf0QAitc0BY89TA7ZVroPF5Qb1lnU
         C5LA4a32rJVBNN9XcQFmOSc05hbaNVzSoy7P3JPsQZ6nGTgy2DZdKooEM6DViCROr9WJ
         Svh1o/cYSB543IYdqiUOuPeY7WP3mCdVzzx6ZguNwrpaf0Ng+l6bqYrtM+IKufFZNnx5
         Yarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vThlvEmvp/6FBsR0reDfoEC2yRp4jMGo+thDfo0ZGZ8=;
        b=ryZsHbO4q5j10JATFfqpdH5ZtKtL1htlwSFh5OIDquYxDIxNQjaAiaGFq3GVqspgy4
         ClJHI5LSHYWc62RCjk542NDJAOHUH092qq+kFDcvj9XmXjWB/pHeh3fnO6rEBxS5w2sQ
         b+AE1Z6kxjeR20DCRqkVSUjdV++c3g0HxTvax1WyhVk96lINDRswQe7AS7oKZEuw1TCr
         7RjzBNVJYf3rN6ouswsm1OFksoRYQxj2x2qJto5FNerJ9WnhhcqYQNit32nXpASTtZnc
         vxr4Z3tGqNCjA2yqSjanYmT1cn8nbD+Y2ZuXdj6b7Cn341HIkVlB+twc98msKuUSm5DI
         qiSw==
X-Gm-Message-State: AOAM532ewAgNHAn8RKqHjJm02fz723VpRBkf9l0rKv8Juw0z/f1tB5dL
        7CbPN2umThjYeRC5jzbcSgakCA==
X-Google-Smtp-Source: ABdhPJz/4U5stnoc0BfXhZs50Xa6qriT84hflYtyMKASEeBwIFKW7MOD7rD3QgTmpERFwr2RngtkcQ==
X-Received: by 2002:a05:6512:3341:: with SMTP id y1mr16505203lfd.58.1643663115603;
        Mon, 31 Jan 2022 13:05:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y13sm2575910lfl.263.2022.01.31.13.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 13:05:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/2] drm/msm: rework clock handling
Date:   Tue,  1 Feb 2022 00:05:11 +0300
Message-Id: <20220131210513.2177652-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm_dss_clk_*() functions significantly duplicate clk_bulk_* family of
functions. Drop custom code and use bulk clocks directly. This also
removes dependency of DP driver on the DPU driver internals.

Changes since v3:
 - Switched to devm_clk_bulk_get_all() per Stephen's suggestion.
 - Removed a call to of_clk_set_defaults() (per Stephen's suggestion
   again). It duplicates a call in platform_probe().
 - Split the first patch (moving helpers to msm_io_utils.c), it's unused
   now.

Changes since v2:
 - Retain conditional code/prints in DP code to ease debugging
 - Rebase on top of msm-next and [1]
 - Split helper functions to msm_io_utils.c as suggested by Jessica

Changes since v1:
 - Rebase on top of current tree to fix conflicts

Dmitry Baryshkov (2):
  drm/msm/dpu: simplify clocks handling
  drm/msm/dp: rewrite dss_module_power to use bulk clock functions

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c   | 187 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h   |  40 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  46 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  26 +--
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  19 +-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  21 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |  17 +-
 drivers/gpu/drm/msm/dp/dp_power.c             |  91 +++++----
 12 files changed, 131 insertions(+), 351 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h

-- 
2.34.1

