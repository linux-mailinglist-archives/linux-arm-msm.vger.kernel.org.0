Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D58C487000
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 03:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345229AbiAGCBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 21:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344533AbiAGCBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 21:01:38 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C41EC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 18:01:37 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g26so10211912lfv.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 18:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GcWHJ8P3XkzFQQW3zPOm7KEW52vk02Gnrdh4I43mbBI=;
        b=cd+rt/oo4TcvTGmaRCw/ZBxa6vRgUQ4n90NeePnGws6WyOHImb01Jh9B/00qX/jOx8
         vz54bBnWmzxryxXztek9aqK9Mj7Q5ZF0IGWw1uPigqDk2la2okGhbLuuOgfPpcx4mYXQ
         CyJcU4c0VOPy9q8x+XPXA1PxMfbrwK8/jBs0f5YmTVQAXhBEr7SGQjnoW2q6IPTq9h4R
         k9U7meBuZQz11ngINp8gJRVSJitjGNlwJp/XWrfzfMierhTlTugebl9NYLFxGdJUyj0z
         F6PZAfZpTp/KWyEzan9LsuH6f0wPLLTUuXMiOb/f0Su5LqB5+F1WxnNwHWM/GoaMcODZ
         k1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GcWHJ8P3XkzFQQW3zPOm7KEW52vk02Gnrdh4I43mbBI=;
        b=vmp8dEtzAXmLLZWli2ooVyOWU6O0clpLp5QZ71/XoE7u4DJdbk6zMvr3swK1d2u5gT
         44k+NkLhulvCh3fNla3vfMQI7rL/sajDj7v2DGq38p2Ii28F9Duy58Iv2Tn88NajXnbh
         RyoAy+CJbV9lYp0PbQhPkbmc1iKewBrINVT4kmla3NbVBYrwxz95YbIvIAn6oFi+EfEK
         yhKQLuzLuFUAet8uKrAZRqly4ijDOcTlFi/S4xxkxzN21OMg3e1dkSNouTVoggc1Ds6z
         yC3qMif+hWmn6Nw9TATQ98pyvoyLCcNok8u1AcI3XmN3jj75/yE9olPBjmE5IaYK3zjc
         M3Og==
X-Gm-Message-State: AOAM5330RjPsPEyxAPJ21+BJk+MovpWRvyBAnhFMa0ZIV/cdIHlfgAg0
        PULW+2zOlwRaaUajiKRGUz5Uig==
X-Google-Smtp-Source: ABdhPJx5a45dP9VdBZMDUsAAoGHCn4VxigZKS9Lk/a6nV7ye2CNzgvzQ6RQBwXYDQ+qmS74ZU9qU+g==
X-Received: by 2002:a05:6512:1392:: with SMTP id p18mr34114418lfa.98.1641520895718;
        Thu, 06 Jan 2022 18:01:35 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 18:01:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH 0/7] Simplify and correct msm/dp bridge implementation
Date:   Fri,  7 Jan 2022 05:01:25 +0300
Message-Id: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I noticed that commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
enable and disable") conflicts with the panel-edp (panel bridge)
support. Both bridges will try to attach directly to the drm encoder
itself. I started writing lengthy letter describing what is broken and
how it should be fixed. Then at some point I stopped and quickly coded
this RFC (which is compile-tested only).

Comments and tests (on both DP and eDP setups) are more than welcome.

The following changes since commit 6ed95285382d6f90a3c3a11d5806a5eb7db715c3:

  drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540 (2021-12-17 15:09:46 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-dp-bridges

for you to fetch changes up to 7eff304d50ba520e9193a293a8e42bbd9d7aa0e1:

  drm/msm/dp: stop carying about the connector type (2022-01-07 04:56:06 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dp: fix panel bridge attachment
      drm/msm/dp: support attaching bridges to the DP encoder
      drm/msm/dp: replace dp_connector with drm_bridge_connector
      drm/msm/dp: remove extra wrappers and public functions
      drm/msm/dp: remove unused stubs
      drm/msm/dp: remove dp_display_en/disable prototypes and data argument
      drm/msm/dp: stop carying about the connector type

 drivers/gpu/drm/msm/Makefile        |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 263 ++++++++++++++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_display.h |   5 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 250 ----------------------------------
 drivers/gpu/drm/msm/dp/dp_parser.c  |  28 ++--
 drivers/gpu/drm/msm/dp/dp_parser.h  |   4 +-
 drivers/gpu/drm/msm/msm_drv.h       |  32 +----
 7 files changed, 203 insertions(+), 380 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c

