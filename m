Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992DB51B480
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 02:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbiEEATu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 20:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbiEEATt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 20:19:49 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BB74C40F
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 17:16:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j4so4963643lfh.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 17:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1oDjcUyt+XUVjgyrGdMzbLDFCsXlZDQVUok8w5uQW0=;
        b=CQHMq/8CJlJKPUyQiDirAGtcF7+a+yuxuXiVjjHRQt2RNB20u+FGulytwVJDIvTC59
         GQXorniYjsNwFo44ZQmuYrBwWQzVUEQR9gMLr2bbkFwajZzXLt1tShVpzvMnnZC0tDfB
         zmMJdTlL8z/gcp4YUHsqOnVp+2igTvkpZk6dnQMWKNdAdrFsAD7D679GHXtk9XhKa4uI
         U2nvRnX1Di2ZcwPwAFTacp8ojuASJQLXAoNXcebEWPSKy5AlQYnY5zTo/VVnu/1aOmOU
         Py0pLZsUqHkoc06iMLw0oR9bbPfVkOxhINndThGZkgcQ5ZBGvv8tqPFAoMsiAgGlh7yd
         L0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1oDjcUyt+XUVjgyrGdMzbLDFCsXlZDQVUok8w5uQW0=;
        b=ShmUY8HiwO89QrZwqmMbimG0IdzW2W+NtOcPKEludPtx53ZXFrzbST9OToDdly5u7N
         OniCRZM8naUcN2+EBDH5icazaUm5Lo+jRJ1muYMaLkeLQzDsBRl0GbMyiEfT1N1ZnikJ
         KzImHEhYoXFcmm2cPiilj7NQ2MOwur5BAHPz+O71U5Ox9aawoGY1NW+qz6YbPNFMQX0k
         vzgFvvJqYYAqCFIPfdTCM6lHG0CpjCK8lTtlYWMQvEtemQ9JUq0yD03xEgJN18D+OLDp
         2bR6ZaRXj8+mdom/y88rVCByCZ85co98IMTesZ1vOo/DLGC0WzdcMiBqTtTkNZ/mn9+G
         a8tg==
X-Gm-Message-State: AOAM531d0UIUxgFaVjlPE2JzvLcolo8uLDrLc7t3s1wUFdjgg6WDV585
        B4dodU45kuSnjkXn5m3v4Wsymw==
X-Google-Smtp-Source: ABdhPJyOFcMiCTxFiESBlHbtybCGQflPnHtvNynjnT2Q8APsdSngeAVyRhsSyiUanGlZdzyOpSVD8w==
X-Received: by 2002:a05:6512:b0b:b0:44a:f4a5:b519 with SMTP id w11-20020a0565120b0b00b0044af4a5b519mr16033374lfu.287.1651709766535;
        Wed, 04 May 2022 17:16:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u24-20020ac25198000000b0047255d211b0sm6714lfi.223.2022.05.04.17.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 17:16:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 0/5] drm/msm: fixes for KMS iommu handling
Date:   Thu,  5 May 2022 03:16:00 +0300
Message-Id: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series started from the applied and then reverted [2] patch by
Robin Murphy [1]. After the MDSS rework [3] has landed it is now
possible to reapply the extended version of the original patch. While we
are at it, also rework the IOMMU init code for DPU and MDP5 drivers.

For MDP5 this moves iommu_domain_alloc() call and removes struct
mdp5_cfg_platform remains.

For DPU this allows specifying the iommus = <...> either in the DPU
device (like all DPU devices do) or in the MDSS device (like MDP5
devices do).

Changes since v1:
 - Move aspace init to common helper
 - Use device_iommu_mapped() rather than semi-internal
   dev_iommu_fwspec_get() (suggested by Robin Murphy)

[1] https://patchwork.freedesktop.org/patch/480707/
[2] https://patchwork.freedesktop.org/patch/482453/
[3] https://patchwork.freedesktop.org/series/98525/

Dmitry Baryshkov (5):
  drm/msm/dpu: check both DPU and MDSS devices for the IOMMU
  drm/msm/mdp5: move iommu_domain_alloc() call close to its usage
  drm/msm: Stop using iommu_present()
  drm/msm: move KMS aspace init to the separate helper
  drm/msm: switch msm_kms_init_aspace() to use device_iommu_mapped()

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 24 ++---------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 --------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  6 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 31 +++-----------
 drivers/gpu/drm/msm/msm_drv.c            | 51 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 6 files changed, 59 insertions(+), 70 deletions(-)

-- 
2.35.1

