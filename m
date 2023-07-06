Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCE674A5AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 23:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbjGFVLe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 17:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbjGFVLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 17:11:02 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB9B19A7
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 14:11:01 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3460e9f2376so4735905ab.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 14:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688677860; x=1691269860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cYUcWwYzIGi22IoU+6D6M18c1PHnvf+NVM3aZcMVciw=;
        b=NJ6h4EgtHpmcS3r+/sTWzTOxngpVnD/XQi3SaCWXOCzgjWyUW59DXiIRpy4bATw7zP
         2RJCjujnfjD2ROdBhWhi+q2sWmin+TB5vjmFnuLU++YadiHBdABoiAZlslrnHqhdkjbm
         RprAl0f56jPdNiPzVFjDE66U86Qm9k9/sLx+X8R2skh0NKtP9YBxCi2AMKqopwyXlooy
         DT+ngyTY6246/sSN/oVKg3df/5fOzW/fc5fScxjXc4BCJlvKUA1INRdjQ4wUG3trcIJO
         9v3ycLE40PqI/JsCQlBcmfIRTXcjqgqOQjRuJyZYqp9RZVf/rxb9oVuVOvcU0xGuUfTq
         X1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677860; x=1691269860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYUcWwYzIGi22IoU+6D6M18c1PHnvf+NVM3aZcMVciw=;
        b=Nx1i1aZFAuB+TvYsTzkcumpFbd5rqUXN/3km71GcQKnUMrxpVRgxoSUZFQDgx+S+h+
         Jr9/kY5Tfb2k4uXq8KpmsdTA/HNmsO+gIodLPrdcINmqx/7ixbzGbEZ7STzlxXNXm+fs
         yqUuE3uofXbeA9QNzB24NPrnvymjzYdIjFtp1hZFSNFwb8V1JNIGgRimesf2ehtKdG1Y
         tq/owVqciOFfey0YDyc3KIvt3BixVHlYxPzrk9hQvWQLHNHDRYZz0ThEvMuoTSx0O5DZ
         OzqvzYZCHQd3oVRhNky25hjeeVKakB5BD3MBG1/tRiEsUGtL74ZNYTvMVz+vDxBl8uw3
         TLqg==
X-Gm-Message-State: ABy/qLb5SgQsGj7+5XwIzJYF2wE9g8djtPngwuicRT38J3AjJ72tqGU5
        HOE+eAWdS6Z9zKo34mPohgI=
X-Google-Smtp-Source: APBJJlGyhiRxbH/Xusdq63YAbGhrDNP3Dn+K2mFYcg1s76Il3dpekOhx72jdwI/0nEC3hGWW5LUqWA==
X-Received: by 2002:a92:c521:0:b0:340:8f2b:ad53 with SMTP id m1-20020a92c521000000b003408f2bad53mr4160815ili.18.1688677860487;
        Thu, 06 Jul 2023 14:11:00 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id a11-20020a63704b000000b00528513c6bbcsm1701472pgn.28.2023.07.06.14.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:10:59 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 00/12] drm/msm/adreno: Move away from legacy revision matching
Date:   Thu,  6 Jul 2023 14:10:33 -0700
Message-ID: <20230706211045.204925-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Downstream seems to be moving to using the chip_id as simply an opaque
identifier, and if we want to avoid headaches with userspace mesa
supporting both kgsl and upstream, we should move away from the
assumption that certain bits in the chip_id have a specific meaning.

Patches 6 and 7 were something that I came up with before Konrad
suggesting moving fuse/speedbin mapping to a separate per-SoC table.
Which I guess would also work.  But I guess if we did that, we'd want
to move things like whether cached-coherent is supported to that table
as well.  I'm not a huge fan of pretending that whether or not you have
cached-coherent is anything to do with GMU itself, rather than just a
happy coincidence.

Rob Clark (12):
  drm/msm/adreno: Remove GPU name
  drm/msm/adreno: Remove redundant gmem size param
  drm/msm/adreno: Remove redundant revn param
  drm/msm/adreno: Use quirk identify hw_apriv
  drm/msm/adreno: Use quirk to identify cached-coherent support
  drm/msm/adreno: Allow SoC specific gpu device table entries
  drm/msm/adreno: Move speedbin mapping to device table
  drm/msm/adreno: Bring the a630 family together
  drm/msm/adreno: Add adreno family
  drm/msm/adreno: Add helper for formating chip-id
  dt-bindings: drm/msm/gpu: Extend bindings for chip-id
  drm/msm/adreno: Switch to chip-id for identifying GPU

 .../devicetree/bindings/display/msm/gpu.yaml  |   6 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  13 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  15 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 187 ++----------
 drivers/gpu/drm/msm/adreno/adreno_device.c    | 282 ++++++++++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  52 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       | 150 +++++++---
 10 files changed, 362 insertions(+), 349 deletions(-)

-- 
2.41.0

