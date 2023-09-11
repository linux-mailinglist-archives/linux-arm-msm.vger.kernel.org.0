Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3E079C33A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 04:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239650AbjILCoi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 22:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238801AbjILCoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 22:44:25 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9521AD852
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 19:09:00 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31f615afa52so5383953f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 19:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694484539; x=1695089339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8J6OJLL6yO9801GDZc9YLhZ4do8H4JQeCks1RXRX5uo=;
        b=nk1vUQau1S72JX/M3dF6XGNBDAkct/Gw/04fcI6nZi/B7U5Jb+DrcaSHWYcDgqePjj
         6wq5aomZntIfZKgZUFMO+qJtUn68zVCfj09G+c04OVumutyOyygNCvDCq1VWgUlCWYL6
         Xrv83kE0MxMvGC1S6jFOZ98HQuKrTJkXN6rYFNPT3WLPDH/NfuigoLICkK2P3bMbWnwe
         nRsUmA1HpfY7Wv35ueGMNYkbuz19S8J0s/8XNcyFbcekZ5Y7VcraRo8O65hNxPJbprJb
         aa7U5mhA2g1pnCTH4bydT/hJ12NiB/QTo7K2QqXu4DI5TVVHty04xDlwHpkymCA1QRK3
         AgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694484539; x=1695089339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8J6OJLL6yO9801GDZc9YLhZ4do8H4JQeCks1RXRX5uo=;
        b=w8HwT4HwCVMB8otwAQaxSFk/61K7NqwUGcK8browjIFN+USQcfFDWBVOOEtzlSM460
         LLOL6FvhnsBorhJJed4Tqq0d2qHu4ZIpOyIpmkQ2VkR+SltAHLepE8FjOJIFPFgYFPlM
         zPR5uNvxYb/VNrSknHoZ9bgclZd11V30f99P2RTRl4qrAUa40CBz+QarFObjMbU0ypMG
         +W5aVkjqlyvlh7hwYiMwVJ7qADRUQRjNbqPU1QbhNbMBVkLDHH2DU6SvB1NAzUUQHdz0
         TvKqxEBlirXQ1mFKTrHfo9EvqyeSh7MhR2FG/ny15SBwPTb2ciA7DyO8qa9CmRSIfirw
         f89A==
X-Gm-Message-State: AOJu0Yx9jc5BoBFqNOnrrAAkkvUO7tMDWMP82b1gBQY0LBrdfJGqW1LI
        4oqE7q6SunSpy1yvSiIiFtMdDvbDaXrYJMj1TE8=
X-Google-Smtp-Source: AGHT+IGJG8+w5mQL4Vxq5yngRkpLjVobswZYDr4KahW5nJJpi2M2Aw64a/Svk/t9loqH66PWcO2JlA==
X-Received: by 2002:a05:6512:281c:b0:4fe:ecd:4950 with SMTP id cf28-20020a056512281c00b004fe0ecd4950mr10973430lfb.1.1694468722444;
        Mon, 11 Sep 2023 14:45:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b5-20020a0565120b8500b004ff9bfda9d6sm1168804lfv.212.2023.09.11.14.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 14:45:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/9] drm/msm/dpu: simplify DPU sub-blocks info
Date:   Tue, 12 Sep 2023 00:45:12 +0300
Message-Id: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The handling code also usually knows, which sub-block it is now looking
at. Drop unused 'id' field and arguments and merge some of sub-block
declarations.

While we are at it, also fix all VIG subblocks to contain correct scaler
block version and drop the becoming unused QSEED-related feature bits.

Changes since v3:
- Proprely describe dpu_scaler_blk::version field as the register value
  (Marijn)
- Picked up Marijn's prior art patches (sorry, missed them while
  preparing v3) (Marijn)

Changes since v2:
- Reworked the VIG SBLK definitions to set the scaler version (Marijn,
  Abhinav)
- Rebased the reset of the patches on top of this (intrusive) change.
- Folded QSEED3LITE and QSEED4 feature bits into QSEED3

Changes since v1:
- Dropped the patch dropping 'name' field (Abhinav).
- Deduplicate equivalent SBLK definitions.
- Dropped the dpu_csc_blk and dpu_dsc_blk merge.

Dmitry Baryshkov (7):
  drm/msm/dpu: populate SSPP scaler block version
  drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the `smart_dma_priority' field from struct
    dpu_sspp_sub_blks
  drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
  drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
  drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
  drm/msm/gpu: drop duplicating VIG feature masks

Marijn Suijten (2):
  drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
  drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  17 +-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  11 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   7 +-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  11 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   7 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  29 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 145 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  55 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  20 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   3 +-
 23 files changed, 200 insertions(+), 296 deletions(-)

-- 
2.39.2

