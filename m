Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50DD2616B43
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 18:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbiKBRyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 13:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbiKBRyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 13:54:52 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE57F2EF08
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 10:54:51 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id x21so24662516ljg.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pImxuC4Nf4aWPW221zQN7RnoGphkK7wE5klWAS+4940=;
        b=Wjm2dZp74y+lqu2Ke28grCipI3cG0+8+S49t0MZinbmHZ2Za/YjIrVauNbH8bpTr0M
         3deSromBU4Let5EjFgdAIsmIBbfxh9/rC3tsXKDDBXx5vx64ghErUiTsev7H3io5o+wW
         jwra/c0oVaONRNLGko2DpCYLveOyuVsEbUHKRaBnUapTsOgADhYEuLpV2DxhTtjr6DDk
         kO/tcKOTwbaXFu2MNcJuyAnADrC8G7PAq7dF4DfgiP8vZtyOK11QTEyIcn4jB42zpB38
         Msi+1+Rd0Vue6S2OshIL93Rosodvtj9oMfTGFPpHCQFS862k8ZJjrULF+JOvycCRteMb
         75/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pImxuC4Nf4aWPW221zQN7RnoGphkK7wE5klWAS+4940=;
        b=OnCXWSGgsJEJezUSAHYNGCSwrMUvWzGeNvV58m+vqejRq1drHBR6+tfqYJkzntmjSP
         8DSdnM/BSuX5PnmGiEcH8/4vrFh1LETxRYROorNjThvU1w65OuJZP6SlX7I1I8hZpk6I
         DJmsqZG8+13PYIC2VL6aWVstCQ6rKRu8wfzlpWnt5Qk7qI1h4nRQaJmFrnrUY0dcx+Xu
         K18YBPOl49gq14LUM7gKvE7vj3wSHm0HVYdvPzJAE3wZRbU9yGq7nK5q7Vt3Ngpgou6/
         TLHqvczvLH/Qj8VmEdyxVdQW/1eTl3zDjhP1af8vP8au5cFNxLmUzYJ4CpXokN84Ak1T
         3uyg==
X-Gm-Message-State: ACrzQf3zHHj3Py62+3VeiHecSfzEo2c/Ahd8GuXLk+fWv/vxmbPBJ2Al
        V5wnofFcQE07KtBwnNyg19yaYw==
X-Google-Smtp-Source: AMsMyM5mdbfw0TKMpb+OFf4RZ4EVt0v8uZKepz1A7AgftPyjFSvCji8FBMhn1kwdcNJ5H7vbqJBt4A==
X-Received: by 2002:a05:651c:1688:b0:277:2256:293d with SMTP id bd8-20020a05651c168800b002772256293dmr10133446ljb.514.1667411690248;
        Wed, 02 Nov 2022 10:54:50 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00492c663bba2sm2087625lfs.124.2022.11.02.10.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 10:54:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/2] drm/msm: rework msm_iommu_new() and .create_address_space cb
Date:   Wed,  2 Nov 2022 20:54:47 +0300
Message-Id: <20221102175449.452283-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Simplify the MSM IOMMU code a bit. This moves iommu_domain_alloc() and
iommu_set_pgtable_quirks() calls to msm_iommu_new() to get rid of the
disbalance, when the iommu domain is allocated by the caller of
msm_iommu_new() and then it is freed by the msm_iommu code itself.

Changes since v3:
- Restored the condition to enable the quirk in a6xx code.

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
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 12 ++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 33 +++---------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 29 +++++++++++----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  9 ++++---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 +++++++-------
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++-------
 drivers/gpu/drm/msm/msm_iommu.c          | 20 +++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h            |  3 ++-
 11 files changed, 69 insertions(+), 80 deletions(-)

-- 
2.35.1

