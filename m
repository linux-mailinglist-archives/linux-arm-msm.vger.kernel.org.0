Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4494936BC88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 02:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbhD0ATQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 20:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbhD0ATP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 20:19:15 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC98C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 17:18:31 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x19so60613243lfa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 17:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pyVIHOwP3C4yhDRD5vW+wL3hfJcT2qqyYEtguOUdLeo=;
        b=HEUzG7cLWHPmyhXWxkjwKsUmD2Y553flJc5Cl+8XnD/j0pFMe1gHrk7w5KiivdXpfY
         4QWMwTfHLofC0tl5PiCAz5j7N3agfqRqmF8bZ4pUZ8VexOL23JEITw/jM0Ie1kaTHV5j
         /cHNt3lqcNDy45mQRbO3oS4aCepXWp6/psJBMTrnYbpaaujwmPz/YK4PjWBMfaAX4nE/
         YaDkBh6IQYGimhq6EQWWflBjvcM0X6xV8j1kedrLGiPwnhMIuhMLctqRtOnKG6AHqmLp
         66EDeJXASJ+Nei71WwhI5Q0OyTXK4QxqwQ2ZrFKWmpxZPtntMu6f7J2zhx/ItsqF1kdT
         I5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pyVIHOwP3C4yhDRD5vW+wL3hfJcT2qqyYEtguOUdLeo=;
        b=cc1+pocyhCBlC4JhF/XLfwHQa4gwPmj59B2MHZdLiGqbUmlifmyoQ3N3gVXqX9s8Xa
         saPNGMgQ7zBQEu6/1+Y9zq9j5jBvQMRJPQj1DX3/n57evEkwSCsmEwt1FBrbyHjKzE7g
         UYzKTlx0JMT6WSTMtatPlwF7QuiuAWIWRzP7Kv/3a0cipMyKJpAEUjVjNTKtmbuCGL47
         WK2jKfJlsfxF61rUHkFRzPAPnNnS+GxQWKgFdUQtZmTIaG5GbvseqOllZF0RmDEM63KO
         QpRPzPNWa3b8RAidYc6E3UOxQ2wxEqhWkgEggNDIUHq8q2A3PmNDFMQ22I27vIJ1GY2H
         iw6Q==
X-Gm-Message-State: AOAM532wuTf693CSFJmQfV+AS2x6ZYZgnXnMVQnx4nitW5cvfngA8sLm
        lZaRa6Xv4wwFDWiTb1Vy/IVYtg==
X-Google-Smtp-Source: ABdhPJwXwV9rUWZAKxG3qI1LphsTXd/PBKChmF56CmO/pfco0kRq8n7VYwUiuoorB8VYTGzOnm3K1Q==
X-Received: by 2002:a19:ed11:: with SMTP id y17mr1944907lfy.117.1619482710265;
        Mon, 26 Apr 2021 17:18:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d15sm1555100lfn.7.2021.04.26.17.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 17:18:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/msm: improve register snapshotting
Date:   Tue, 27 Apr 2021 03:18:24 +0300
Message-Id: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rework MSM coredump support: add DSI PHY registers, simplify
snapshotting code.

Changes since v1:
 - Readd mutex serializing register snapshot calls

 - Add DSI PHY register dumping support

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm: pass dump state as a function argument
      drm/msm: make msm_disp_state transient data struct
      drm/msm: get rid of msm_iomap_size
      drm/msm/dsi: add DSI PHY registers to snapshot data

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  5 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c      | 90 +++++++----------------
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 21 +-----
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 22 ++----
 drivers/gpu/drm/msm/dp/dp_display.c               |  4 +-
 drivers/gpu/drm/msm/dsi/dsi.c                     |  5 +-
 drivers/gpu/drm/msm/dsi/dsi.h                     |  5 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                | 11 +--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c             | 31 +++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h             |  4 +
 drivers/gpu/drm/msm/msm_drv.c                     | 27 +++----
 drivers/gpu/drm/msm/msm_drv.h                     |  6 +-
 drivers/gpu/drm/msm/msm_kms.h                     |  8 +-
 13 files changed, 97 insertions(+), 142 deletions(-)


