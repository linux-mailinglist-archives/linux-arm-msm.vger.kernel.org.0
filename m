Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A827644B259
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 19:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241720AbhKISJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 13:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241676AbhKISJB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 13:09:01 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1049CC061764;
        Tue,  9 Nov 2021 10:06:15 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id x64so78843pfd.6;
        Tue, 09 Nov 2021 10:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ubdL9EpbHiKFQ/ensyE1OL+6p1VDVmYl0vsSWhTLLJk=;
        b=p0ckCqL5xUa6CraKVoJJL+4JKcqnSmBpaWTXjRixdPhVKx6qzuiACq/eCbiDn3lsr3
         26gEdWkJSy5ZqrXASLm1kLFml3T+JPOHpwKB8R0RfLop8VB8maMH6CEL4s8r65MPhuN0
         G1g7Er+zfMvrqQf+A5TwR2ZtIXXJkbftDCIj0KzDrCi/rFWfg8M0jCrnMjbJEywFWMs2
         UjeTzC0wXz/Fj25sCD8etz2PE9CZTv98c62p4C1+g6GIJbZtaZ8pw5QxjRhB0yYIZVZ1
         /dMFwnmKBbSVXPbcyFiCLYlRYiwXJr+IzfdrtayotabGJE/oRJlF2ST2tYg19v4lQjc4
         Umyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ubdL9EpbHiKFQ/ensyE1OL+6p1VDVmYl0vsSWhTLLJk=;
        b=4QatbIrwORIVN0jOORtLdbZsOxK9BsI2zSVVdP9aCJ69CXjRVYO1UCYffwWUEnCrNI
         J3Ledn98jVZ958cFONlnj7mtMBvpgN6nGbbpzlRTwFik8DGRJD+Ao3j7Zm5Ij5LbI2xQ
         jcPEDiTBc6GWp8xIsILb5MzMPBZl1R4ge5drdA8hzsiQwX80HnnjJNdj9VFo3pOCs7AV
         OzLCd6sencWFon0XqXbLx08u716zrqCD6uLyOrKgEzyU4qd2SlUdmV2QVhdt8J30D4BZ
         Sa+Nyvxx/Cum9YzY6+0ABSAqSkfg6lhC/hIsz41cbLtS0N8JMA4QKObPFnGh8WuyDpp2
         EnEQ==
X-Gm-Message-State: AOAM530+Su9flTRPeK10wimbxgGEiXBTevF/2Q03vMtM7U1r/kfWh/iX
        IanctDI6u3sHIG74XlQNUjY=
X-Google-Smtp-Source: ABdhPJwLLPUvZmt5B7b+jswBMoOvniAjaKjIuCbEPUB+zZaNWf1gYTzeEKAmYtyUolGk6qUxom2XIA==
X-Received: by 2002:a05:6a00:887:b0:474:1f41:2293 with SMTP id q7-20020a056a00088700b004741f412293mr9936007pfj.44.1636481174453;
        Tue, 09 Nov 2021 10:06:14 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c25sm19259837pfn.159.2021.11.09.10.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 10:06:13 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Anholt <eric@anholt.net>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 0/5] drm/msm: Cleanup and drm/sched tdr prep
Date:   Tue,  9 Nov 2021 10:11:00 -0800
Message-Id: <20211109181117.591148-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This started out as conversion to using drm/sched to handle job timeout,
recovery, and retire (and delete a bunch of code), but the latter part
is on hold until drm/sched is fixed to properly handle job retire/
cleanup before deciding which job triggered the fault/timeout[1].  But
the rest is worthwhile cleanup, and the last patch is needed for an igt
test that I'm working on to exercise timeout/fault recovery[2].

[1] https://lore.kernel.org/all/1630457207-13107-2-git-send-email-Monk.Liu@amd.com/
[2] https://patchwork.freedesktop.org/series/96722/

Rob Clark (5):
  drm/msm: Remove unnecessary struct_mutex
  drm/msm: Drop priv->lastctx
  drm/msm: Remove struct_mutex usage
  drm/msm: Handle fence rollover
  drm/msm: Add debugfs to disable hw err handling

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  3 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  3 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  3 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c  |  4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 14 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 13 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      | 10 -----
 drivers/gpu/drm/msm/adreno/adreno_device.c |  4 +-
 drivers/gpu/drm/msm/msm_debugfs.c          | 52 +++++++++-------------
 drivers/gpu/drm/msm/msm_drv.c              |  6 ---
 drivers/gpu/drm/msm/msm_drv.h              | 11 ++++-
 drivers/gpu/drm/msm/msm_fbdev.c            | 13 ++----
 drivers/gpu/drm/msm/msm_fence.h            | 12 +++++
 drivers/gpu/drm/msm/msm_gpu.c              | 22 ++++-----
 drivers/gpu/drm/msm/msm_gpu.h              | 33 +++++++++++---
 drivers/gpu/drm/msm/msm_perf.c             |  9 ++--
 drivers/gpu/drm/msm/msm_rd.c               | 16 ++++---
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  4 +-
 18 files changed, 125 insertions(+), 107 deletions(-)

-- 
2.31.1

