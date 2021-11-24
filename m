Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2165E45CF1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 22:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344088AbhKXVkL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 16:40:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhKXVkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 16:40:11 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E065C061574;
        Wed, 24 Nov 2021 13:37:01 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id o14so2944379plg.5;
        Wed, 24 Nov 2021 13:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qRF5/BPRjl5xERSBa/eHuny9wgPdbY3r/MnMZJGIw7o=;
        b=EHmaQZkVMD66f2U2Qqy4MaqvTVwTmwgelAFIUevB40nJrwEn6hyUUMWbOoshgJ9crs
         4yjyIVj+/rLtviQ58+SWifmvhwBMebRtapn14tCucvjTpHwgqGNLAP73zarMfzSM0sli
         /iZt6Eml2ZvGZkk6TcFlj5e8OwUM9NP1OkKv93+bZqUcWW3vaVo8Wwfc7huhX+ZsEqz/
         8QHoypZxATegM6zjUTYY37UdByet2Nj+JuwwdFTbkYF5WAczl79gB7Z+SEXfVY8Udt32
         tAW6RCC6jLjtD2HKWJNgRUYsELTvwewOMYlmN/UhJpB96fsQC4rKq7b7zGzczak676FI
         ElDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qRF5/BPRjl5xERSBa/eHuny9wgPdbY3r/MnMZJGIw7o=;
        b=gYtvHBLRwD7dae3EDxmnQ0OkU2oAiJkghc7SHvr3Y3x/Wscv4QDNNrqO0YgaG7lBO6
         sz7f9jm8Vz2tMgS8eYn4Uspu6BJsNYj39gYtuW+Fe2OrRDMffoayVpklXeFNDy12FU2t
         c+pLVSUCbqSfTAWENjTsD0o0WBqEpRpD50D1wHQoug26JSrZu/YWw81d6MWuTWpcXsFo
         aTE8JPz54GiKEC5rxe0a+xRLlfaKL93dWbYf5IjbkgLtt/AZwUIah0DWOpxN2wNqIZ6L
         WIicNRNK0GIahWC8bkBbd+XXn6jWe0DQwNblTwe1VBcM2laS0jDepnW58bfB3XHOEd+F
         mnAw==
X-Gm-Message-State: AOAM532PPl5bU/Ugwf5aKBj37HQSk4LNH8qzDyYhSVBHel22F+15eqOQ
        pEDVozfXkFpy7SMWs5Jqy78=
X-Google-Smtp-Source: ABdhPJzNY9alqqLMH5XF+boo4aSfrFYcpd0d0oay1oiaKp8gXNWA3mqfUqnALD0Yyl0mbzY64/q2Hg==
X-Received: by 2002:a17:902:ec8f:b0:142:11aa:3974 with SMTP id x15-20020a170902ec8f00b0014211aa3974mr23244200plg.30.1637789820845;
        Wed, 24 Nov 2021 13:37:00 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id b18sm527998pjo.31.2021.11.24.13.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:36:59 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org (open list),
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 0/7] drm/msm: Improve GMU debugging
Date:   Wed, 24 Nov 2021 13:41:25 -0800
Message-Id: <20211124214151.1427022-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This adds additional snapshotting for interesting GMU buffers to the
devcore dumps, adds a couple WARN_ON()s, etc.  (Plus a bonus comment)

Akhil P Oommen (1):
  drm/msm/a6xx: Capture gmu log in devcoredump

Rob Clark (6):
  drm/msm/gpu: Name GMU bos
  drm/msm/gpu: Add some WARN_ON()s
  drm/msm/gpu: Make a6xx_get_gmu_log() more generic
  drm/msm/gpu: Also snapshot GMU HFI buffer
  drm/msm/gpu: Snapshot GMU debug buffer
  drm/msm/gpu: Add a comment in a6xx_gmu_init()

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 25 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 95 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c       | 10 +++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h       | 11 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 +
 6 files changed, 138 insertions(+), 10 deletions(-)

-- 
2.33.1

