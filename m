Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 474A060D51D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 22:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiJYUED (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 16:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbiJYUEC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 16:04:02 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DD911A951
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 13:04:00 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z24so8649887ljn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 13:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YFJl/4cGNkCZP1NH99JYcngmGYwQXPAhMhIz5gxLTBA=;
        b=R6dypa8AWI2UvZSLBjThDl80b/DPa37GxSaQaTA/kSSrqQMFeE0h3QaVyaxDBFxWls
         Vb5jS92SLWmpF65G93NBsWZpbHz4p3tyN5chbRocvrKmJijCCgISVxtkEZgoo885dJJ0
         LmP0z7U5rT7zQ/m+icAyhKrNXDRXZmFxZ2aodd6VVTBw7VibgwrUUnnaUog0LPZ2a+4V
         ja2VON1lGj6OFjIInXSkOOPfnfXkVqCYakBinl7WsHHR3ofPq9DGopPE21kgECSlT6by
         OqdNTxn/OcN7hPb6phQqJQwIREEImm7lAivxDD8kRs27Fdxyi3O6GaPMYuXkH+IUTLUe
         3PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFJl/4cGNkCZP1NH99JYcngmGYwQXPAhMhIz5gxLTBA=;
        b=IZoxDotHxJiMJFkWAC8M903m2p3SD/K4LYql5dr1jk5LRQSF6X5TEH9SdEyIqVffup
         c3Wsp/omZPq//MaZ+mMjbZ0ZzKvx6k8jOUDjOAdP8ZJqjuT7Zm9fU3OxeLGEsMaZO2ib
         rQMJjsaY6TGTvTYVP/gZBWGFl9rqNH9ECFRiZnMth1DRMF8QxUMwmXaU98LjHn848Hqj
         t3xsa4BMvabIBEKFtFNdfLHxm6/eKnJ2xd5E03TCmfFvXT2P4iMDJxZRTPv9fljht8XI
         ctkJRQkX1YGF5MqdlJ5EgZSaK9N0Lm7/hB89YqmW8ufoPLi1Jx9+RuLeo4D03jnTIviL
         cDPw==
X-Gm-Message-State: ACrzQf0EUH4c76glE/RBcAXi0O0qGo3A5d4qto+xfZBSLx8u+Y4zFn+x
        MddCXoM0SxjMBUxy7ERdNiXszA==
X-Google-Smtp-Source: AMsMyM6pV+qirkwGMYAcS1uZ0I3LCkCdOZYsFxZ9cbWrrtukSGRqaIoFxdaotaZT+sBNn2oTAx4prw==
X-Received: by 2002:a2e:9656:0:b0:277:55c:a2f6 with SMTP id z22-20020a2e9656000000b00277055ca2f6mr6506458ljh.475.1666728238920;
        Tue, 25 Oct 2022 13:03:58 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id e6-20020a195006000000b00494a1e875a9sm550644lfb.191.2022.10.25.13.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 13:03:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/msm: rework msm_iommu_new() and .create_address_space cb
Date:   Tue, 25 Oct 2022 23:03:55 +0300
Message-Id: <20221025200357.3637161-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Simplify the MSM IOMMU code a bit. This moves iommu_domain_alloc() and
iommu_set_pgtable_quirks() calls to msm_iommu_new() to get rid of the
disbalance, when the iommu domain is allocated by the caller of
msm_iommu_new() and then it is freed by the msm_iommu code itself.

Changes since v2:
- Reorder the patches.
- Move iommu_set_pgtable_quirks() to the msm_iommu_new() too. It will
  not work if it's called after attaching the device.

Changes since v1:
- Fixed the uninitialized variable usage in a6xx_gmu_memory_probe()
  (reported by lkp)

Dmitry Baryshkov (2):
  drm/msm: move domain allocation into msm_iommu_new()
  drm/msm: remove duplicated code from a6xx_create_address_space

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 12 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 36 +-----------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 29 ++++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  9 ++++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 +++++++------
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++------
 drivers/gpu/drm/msm/msm_iommu.c          | 20 +++++++++++--
 drivers/gpu/drm/msm/msm_mmu.h            |  3 +-
 11 files changed, 67 insertions(+), 85 deletions(-)

-- 
2.35.1

