Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B96F1381AB3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 May 2021 21:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234652AbhEOTKc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 15:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234609AbhEOTK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 15:10:27 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C7EC061573
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 12:09:13 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id c15so2381299ljr.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 12:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rgptk4zfD1UjWZRJ8uUQEHx7TiTyQTE7H5OVd2DkG60=;
        b=DZXPnV+7cp07USVBDxPNsQSDAQcbXeBtFnPiPmtUs1FVNFiHZnmE5BeJ56MzPKKnEP
         huncXXEHdg8do/0+MFTrbjriceN7dGGRsz5RxFIXRhR/EEWBQ3vZD7WWTFePnlfYoAye
         BEENqjHKMN9OFrPfiElWHJg/OyH4o6JVyaz8y5s6FLwbBD8bALvqNCVmN/3al0iMEPEy
         6zsERYljx+CzrXhof3tHymxtgtkHHGijnfhnfnGJURTD7xM0AXzJL2+95fFdLzZAMseH
         6cH3E2S9Ly/Rz5KXipy4LHBjmZ8rXZJbZBI9vf98xgG1RfAg1xWhZdxcVi4o/LRDT5Qi
         vqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rgptk4zfD1UjWZRJ8uUQEHx7TiTyQTE7H5OVd2DkG60=;
        b=Fob+Kxpbt5ePwtLKhaV/DCMUNokFu4Hn8donrWx8E1slBMHIpNQen80X26JUWbv5+j
         KaZlitPYVvKvRe9VM/VdGlNEnStRsW9Kdpu3S/vPX/qYj15Pu92ejPQoZQW+BjlpVsP3
         RKeT9p1CGhIkMcKh+AH4rOdwvrlcQXcZH/WYfCsZhWi2yWhS5o9fx8A7TTDRff3GA5+t
         CZ6dKoiJnRlWWTP0A5TMS6b5/RfgElnMXRL2WPf7+2elYywiAw2TfOhQ5Afj53k2LD6k
         DLtxcXHXixQ7TzR0EqqPVvUGppLHi4wVk6l+7bRLYad6tIdAYRlGat005wmKmzA7hHXj
         koMw==
X-Gm-Message-State: AOAM530CeTfOMG2U28GNeZKvHKQHX4IPvzgHAGZGTKb4T4BUOGClKKAb
        QpbFb6Vb+qg7B4ArmvR2dRGd+w==
X-Google-Smtp-Source: ABdhPJybhGBkhSOoLMmdl7jWqtaX8sVUhBq8jWadgwVD3YoqKGaWEzdFMqUSyALcHXXzI2e/3vBThQ==
X-Received: by 2002:a2e:8041:: with SMTP id p1mr19801831ljg.213.1621105751654;
        Sat, 15 May 2021 12:09:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t15sm2184107ljk.99.2021.05.15.12.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 12:09:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/msm/dpu: simplify dpu_hw_blk handling
Date:   Sat, 15 May 2021 22:09:05 +0300
Message-Id: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop most of "extra" features of dpu_hw_blk.

Changes since v2:
 - Include a patch to fix compilation issue with merge3d id handling

Changes since v1:
 - Make dpu_hw_blk an empty structure
 - Split this into separate patchset

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm/dpu: remove unused dpu_hw_blk features
      drm/msm/dpu: drop dpu_hw_blk_destroy function
      drm/msm/dpu: use struct dpu_hw_merge_3d in dpu_hw_pingpong
      drm/msm/dpu: hw_blk: make dpu_hw_blk empty opaque structure

 drivers/gpu/drm/msm/Makefile                       |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c         | 139 ---------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h         |  22 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   7 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   4 +-
 14 files changed, 10 insertions(+), 220 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c


