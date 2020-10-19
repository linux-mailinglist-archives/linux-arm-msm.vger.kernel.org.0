Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53EBA293036
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 23:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732533AbgJSVJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 17:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731179AbgJSVJd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 17:09:33 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1966FC0613CE;
        Mon, 19 Oct 2020 14:09:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b6so456465pju.1;
        Mon, 19 Oct 2020 14:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YrNKJ5OY6r1EDWREJJiTgfyOgLrR9oDoJHGUldK/KM=;
        b=sk1vZAZt6nDJGI3DN3CsUkDQqQewUoz6UX8weV2SBLNaljJS6JGOjgrTRmCB9+pRc1
         tAfxb4KVqB6XKsnRAtJ2pJMdfwYe7SDlrGabiMyLVme7rNNsBXgHkxYtTvoa6pFhx7+T
         YaqYgvnatV1kLkpCMXyy/KwWCJ0mKhTsy1zFHWXkoXcOJvUorwVCYjNoKc0v/u/9+f/D
         gLM4xrEV9TQCpD+YJ/1Yiw68F2P50wvRAXeh+IIvqLlJ8pPjmDqWE7Co5T+bojzrUT3A
         pZN6upIMy1lmoMjm7FFJ2CO02CHQkXQG/bhLk6kfOmoUCsDLju9fkc0rXYYVz+nhB/fz
         ecqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YrNKJ5OY6r1EDWREJJiTgfyOgLrR9oDoJHGUldK/KM=;
        b=qphWzBxGfTIPtqcJpAK+lluizIETPduFcIsAOfvCVnKEA/KH10lJdVxkJIgf0rgypz
         Wpk4ZaX+ThiHQPxyFKrxxm0Q3z6UMj6Pn1Zpnrax9OgCjdDskAapoThG/R+2lskgZlWO
         WknjDl+ufvEMUQaMS0V5FSf+Y1FhGaV5p2t2rklbKaKpPPr6gPKM9mTpPIkOoVmb+WT3
         nuKr/p38yJuh0+WOBNif7WIdjInxkJje9bbf5BFJr+mC8+2UsKWq4jiUoMy/QD+QLjaD
         wHraZy6hg+SPliGmuhtsJEALHl4ichpstXSXn1B0hYUnzrz45peXrkGrRnllJmvG9BJD
         75CQ==
X-Gm-Message-State: AOAM530vHergJKKRfiNQTW0lpGo00wj0IhVwdNM52++4ZZs+A+CC87oe
        amJpB1snZjt9Ypp+6sesuzI=
X-Google-Smtp-Source: ABdhPJw6ZFvgJemAeXDfkdT7lTJg210w4NPRNngz9bDCEpAh6Hlfhey2JHH001X+x6eJZMUkM0IyPQ==
X-Received: by 2002:a17:902:c313:b029:d4:b6ac:7b5d with SMTP id k19-20020a170902c313b02900d4b6ac7b5dmr1778668plx.63.1603141771529;
        Mon, 19 Oct 2020 14:09:31 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id i1sm330102pjh.52.2020.10.19.14.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 14:09:30 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Drew Davenport <ddavenport@chromium.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list),
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Roy Spliet <nouveau@spliet.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        tongtiangen <tongtiangen@huawei.com>,
        Wambui Karuga <wambui.karugax@gmail.com>
Subject: [PATCH 0/3] drm/msm: kthread_worker conversion
Date:   Mon, 19 Oct 2020 14:10:50 -0700
Message-Id: <20201019211101.143327-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In particular, converting the async atomic commit (for cursor updates,
etc) to SCHED_FIFO kthread_worker helps with some cases where we
wouldn't manage to flush the updates within the 1ms-before-vblank
deadline resulting in fps drops when there is cursor movement.

Rob Clark (3):
  drm/msm/gpu: Convert retire/recover work to kthread_worker
  drm/msm/kms: Update msm_kms_init/destroy
  drm/msm/atomic: Convert to per-CRTC kthread_work

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +--
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  6 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  4 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  8 +++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  8 +++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 11 ++++++---
 drivers/gpu/drm/msm/disp/mdp_kms.h        |  9 +++++--
 drivers/gpu/drm/msm/msm_atomic.c          | 25 +++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.h             |  3 ++-
 drivers/gpu/drm/msm/msm_gpu.c             | 30 +++++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu.h             | 13 +++++++---
 drivers/gpu/drm/msm/msm_kms.h             | 23 ++++++++++++++---
 13 files changed, 104 insertions(+), 43 deletions(-)

-- 
2.26.2

