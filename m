Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D5636812E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 15:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236455AbhDVNIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Apr 2021 09:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236310AbhDVNIo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Apr 2021 09:08:44 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B27E7C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Apr 2021 06:08:08 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t14so14912104lfe.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Apr 2021 06:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEnNcZ4YZn2akcChwcsrQFitFibcc6kwO8ISCLJGqG0=;
        b=GKtLLcujei8TL1I3EJdhDRWnqyC1FBYBWcEeYtuWY/CqdDctF6P5guWCKpGI7NLQQk
         Oi6pMXUTrllt/6XzrP6Ae0D5Azi3Aa06ZWjwIVx4qcpuCp7Q1cHVtLntk+vkafrFKKPe
         GFvBrtt7Ph1NrBaqU2LNMhFdrCf6cGcbdhonSoc62Q+6uhl3V4ymjQ8YslEGnd1LKpqk
         b2mV8JwSCkfqL7z/SRi/nRfkKZ5VuN4AQtg99qd/vFQqXRwLxv9ks0qVAgeTKBQtvYW+
         ES0Qj5pFOJCNYna8VT0Bw32TF+aRBX0a/LPVH4eOBmof4ir0RqluZrvDjbn8b/w81DSx
         pEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEnNcZ4YZn2akcChwcsrQFitFibcc6kwO8ISCLJGqG0=;
        b=h0P+ZMEixS4sa+UlH/wcLxa1m1Beq1vy4cJ0VLGvMfcVz09bZANkcZ8OvNDjp5xKrA
         SNWci1H0mMLFwqDMXtG6AcPJwBntsgVB+yDR8gZQlo0gPIq4I3ghMCT6bTIOu3T0irDD
         VOsC+7PzooRuY5n8YfKa6p7xba+tUFVIWW7DS1XHNhBNFOLbuvV9Svxb9+uD7CGpH+vo
         csMVM1RixN2eJkXvb3ca2RAaI8F3/+HTQi5kc8ZW8C5A0WE72LB8Oo7xjOhEvQNUoavO
         JbXv8o4cokVc3HYL1kgzTIig9RkggIjuM1sV/95PkJmcs3VbhLba3yJ427hroAFiKgKY
         zTQA==
X-Gm-Message-State: AOAM531sOAPiBLFzqnB56TKUSxPTDZ32aA/CFr+8AzZNzhOCK1nsHs3g
        THiVhYeeCYuCmyjyVEEEcwyd5skIcJHQ7w==
X-Google-Smtp-Source: ABdhPJzGgQFoznmNTBQ9/rQlpMhfABUJv6A8npxZRm6v0OqaCxsaGafnvy+KlHXAz7IUWqpQf1fRzA==
X-Received: by 2002:a05:6512:3a8c:: with SMTP id q12mr2534714lfu.129.1619096887234;
        Thu, 22 Apr 2021 06:08:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v17sm259833lfr.35.2021.04.22.06.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 06:08:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/msm/dpu: simplify dpu_hw_blk handling
Date:   Thu, 22 Apr 2021 16:08:01 +0300
Message-Id: <20210422130804.825030-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop most of "extra" features of dpu_hw_blk.

Changes since v1:
 - Make dpu_hw_blk an empty structure
 - Split this into separate patchset

----------------------------------------------------------------
Dmitry Baryshkov (3):
      drm/msm/dpu: remove unused dpu_hw_blk features
      drm/msm/dpu: drop dpu_hw_blk_destroy function
      drm/msm/dpu: hw_blk: make dpu_hw_blk empty opaque structure

 drivers/gpu/drm/msm/Makefile                    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c      | 139 ------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h      |  22 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c     |   7 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c     |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c       |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c  |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c     |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c      |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c          |   2 +-
 12 files changed, 2 insertions(+), 211 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c


