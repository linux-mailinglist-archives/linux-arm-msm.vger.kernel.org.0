Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7658C36A843
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Apr 2021 18:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhDYQIz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Apr 2021 12:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhDYQIx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Apr 2021 12:08:53 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F565C061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Apr 2021 09:08:06 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id r128so57606870lff.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Apr 2021 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BaHT8V/mcxLWOXEuXr0m/0nbRyxmU4/sY+FrvJfYAIc=;
        b=FQ8XwRGmGyroxh5yhIJSc/8pdrugxlFlizTLOSB/tV0/lKxsSpBqvapIvMV6ZvFgWo
         Pq5P4KxsNrfPOSTm7I5M44YCPkl9fcYOhN6zyEsLZ4gK1WQLpsBcnmPkzxiRuUs6QRm4
         KOJgvVmwabWR45Ys47h7Z7hLKLJrqCBPoq/NwCUFc5m+e7eTAQn6ftpi2MzsPP8kjQYe
         zfGBC/jjDq5zIzeNpAG26+Y+EL3CDf+DvLPuXLYk5AgRUdNCMzQeZ3NQzPea+9rv/bbU
         7L5bEbVO7mHjnlm8eaL43V3VWWaHc7SxWy3ZLsahnoc05HhChVceGHAZvQFBOOLOXYsQ
         DyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BaHT8V/mcxLWOXEuXr0m/0nbRyxmU4/sY+FrvJfYAIc=;
        b=mm77agvTqZ6CZHbKwVOv3lX89k0fEv+SuDkRPQqsQGsu8TFOU5i/wUIQESXYhenT4C
         VeNtmdXUtzOxIB4Wr/J1g5jqVvvwnkzI3FB+DgkiCQfLUXdYX8MF1sAXrqmoqrKxbFVz
         zNZVjLnzBjKXJYpD9uOTsl1iukiML+2o+ZrOVXlHn7TCX8/yfC3FfzZcgKH4WkfYOj/d
         xDJQFIv11Pn832OjYpfCh6QRjrlwiNiLHuCV0kP4VWQMAbDrkIDEnh1/9ZK8kXesPCgd
         nvf6ffcUcDiu9zsIa09Oq0yQXyCwPGEHv9c4cTK/avsNTATUQG/iqa5lpDWmr4tPZLxf
         y2NA==
X-Gm-Message-State: AOAM530mIZz4MeyOuRDWEDU/SN/oeQHn4bWGs1LBf/lxxHnoGuwyh4xC
        8EktBTceUlVk10e3anImxoFsfQ==
X-Google-Smtp-Source: ABdhPJwR0OC3eZ1nEExUdGwKf2C7YlNgI311NFccZuynaT4rpm1HxqkOaitb81JnhFrCBOfwdZTc2Q==
X-Received: by 2002:a19:ec08:: with SMTP id b8mr9714113lfa.149.1619366884485;
        Sun, 25 Apr 2021 09:08:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l24sm1141575lfc.23.2021.04.25.09.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 09:08:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: rework display snapshotting
Date:   Sun, 25 Apr 2021 19:07:58 +0300
Message-Id: <20210425160800.1201337-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rework display subsystem snapshotting by making msm_disp_state transient
data struct. This simplifies handling of data.

Dependencies:
https://lore.kernel.org/linux-arm-msm/1618606645-19695-1-git-send-email-abhinavk@codeaurora.org/

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm: pass dump state as a function argument
      drm/msm: make msm_disp_state transient data struct

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  5 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c      | 87 +++++------------------
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 21 +-----
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 22 ++----
 drivers/gpu/drm/msm/dp/dp_display.c               |  4 +-
 drivers/gpu/drm/msm/dsi/dsi.c                     |  4 +-
 drivers/gpu/drm/msm/dsi/dsi.h                     |  4 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                |  6 +-
 drivers/gpu/drm/msm/msm_drv.h                     |  3 +-
 drivers/gpu/drm/msm/msm_kms.h                     |  7 +-
 10 files changed, 41 insertions(+), 122 deletions(-)


