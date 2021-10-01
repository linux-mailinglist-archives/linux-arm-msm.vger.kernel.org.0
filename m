Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D22241F34D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhJARoA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 13:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbhJARn7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 13:43:59 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260CEC061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 10:42:15 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso12451265ota.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 10:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4Pk/SKGcDml8g9kQfIFxWSgB1QkZnzEqcqoMDRtiFU=;
        b=VRR2kMxgmb9zJjO0qYX8lZqyUNeV+qdczrK/Y59b/4E3QvXYlZ0QNQ5xWsfIh6rK4H
         nD4pIRu9YpKAIAdKd4oIkEF5ff3HecWkEyDSfCgCzmipUezsGOpwt1SxEu3gQbyT0ESX
         nKFje9Tgi0BiW6/BVW4wLn1l4GLuvW2UMx7naANaAnWjU+st9NQKlnGP+yeh/ZWdSEG2
         kfk6c3KYIkOzZN4LkqhYvnfEu+uBHf/g74EKVcCHmv5Ghd/hqILcluFBIBM/RO8lFyFx
         ZMNd1UynGsc3QBwsehEFGtmj3RGwdff8DeSzbHhGQAV1ziSq/XR+ACZlKODvoO079f5N
         yg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4Pk/SKGcDml8g9kQfIFxWSgB1QkZnzEqcqoMDRtiFU=;
        b=6Bp6nfgemIb9oB3wH9eTLZgNxdO64EICqU1n+0p4a1V+tFnqFGKfmX7/yIhxh9NtyV
         QmqiQ3uZ/8evwMCHfKsxyfFf3qZD8syM1mOZoCHsVahlDncaschVANUj6q1oixRpEp2t
         egIIbPl2ImkGxPg8gP9pzekfB/Zw8OiFi5UlqSwBiANF0CvRd0qWvTyOmMszJjCDt4nf
         WCRHDLI3HXUZKii4LvGdWnOE06JBzRLNS9+869yPFFztX+4T/8JSzQN8Itr9r6J8otGV
         VBUsnQ41gKapMJOEXPMfKW5xk5cUkGKRbeDCODZPlX1PYw/ccap/JUJTAAZ1IlCnWKZv
         mrCg==
X-Gm-Message-State: AOAM530Trc5X46K84M3V+mfNlQ4VxqNC7vg/uYZeDEC4+0FmxrOohqTu
        FAv7Z4FqGh46dy19nSygu1iJWw==
X-Google-Smtp-Source: ABdhPJwsyNL/kZct1ui5XlNR0vlk5yVHdKEYNUXX7kt5RL34oCziPyKWeZrHRi9vLGJtc5+BkxMkzg==
X-Received: by 2002:a9d:6399:: with SMTP id w25mr11409273otk.53.1633110134535;
        Fri, 01 Oct 2021 10:42:14 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id u15sm1369264oon.35.2021.10.01.10.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:42:14 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] drm/msm/dp: Allow variation in register regions
Date:   Fri,  1 Oct 2021 10:43:55 -0700
Message-Id: <20211001174400.981707-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It turns out that sc8180x (among others) doesn't have the same internal
layout of the 4 subblocks. This series therefor modifies the binding to
require all four regions to be described individually and then extends
the driver to read these four regions. The driver will fall back to read
the old single-reg format and apply the original offsets and sizes.

Bjorn Andersson (5):
  dt-bindings: msm/dp: Change reg definition
  drm/msm/dp: Use devres for ioremap()
  drm/msm/dp: Refactor ioremap wrapper
  drm/msm/dp: Store each subblock in the io region
  drm/msm/dp: Allow sub-regions to be specified in DT

 .../bindings/display/msm/dp-controller.yaml   |  13 ++-
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  64 ++++-------
 drivers/gpu/drm/msm/dp/dp_parser.c            | 102 ++++++++++--------
 drivers/gpu/drm/msm/dp/dp_parser.h            |  11 +-
 4 files changed, 100 insertions(+), 90 deletions(-)

-- 
2.29.2

