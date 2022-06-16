Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75AA454DC8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358711AbiFPILM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 04:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358831AbiFPILL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 04:11:11 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207E95D670
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:11:10 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s10so645722ljh.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qbg9qXXSR6emdLRiopLdhShbC9ThAqArdO/gs7MONo=;
        b=FbDsXdOqnQj4yXB+zfSFUDL1JHL4n+irvfikBSA02l59GZ2mwhIXKeiNQjZQn+nIYw
         xL0BbA+mbR0GqZ4gAzC0aRtlsINd+7ZyC7BYeCoG4UdpbTB/KPTu8oSYueFg//1/nNlh
         Y4So0huPo9qi64qABkcZsIDTCdaPN7xx4eViZA9p0mV9ukYvmHrrtXdpWcC550531OmS
         666q6yd7z2WMon2YjT662RcJQsKo9QPtR4OLjDhr6VGTc6b9tFfBHzQTvUcl7tQ8nOx4
         8GRJbwObBw0CveTPqBSWVozk4vZbZWKVf7j0oyZTU8yGvxPEoB4bxzzfX0xibnD4LKyH
         AHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qbg9qXXSR6emdLRiopLdhShbC9ThAqArdO/gs7MONo=;
        b=j7z8E6AlH/Xg/6ydwH5HaygTGSg4/xOlpXONFb3c8BXEvaj+O8+8bqAkuAfJ4vvAeb
         1QKejAJ4wrZUDmvjP3UgiQ0LBqzc+0VQQ5MjNAxiUyEiFWSA2Dt9U8X7kHXJ2s9cxrUA
         qU0xDQEm88ncVZFgBcRRx7uRuAyOZU8ObfOpxRr9Dz3RoMfmzkQm+Qd38fhsx8zBPmmR
         GUj9a4YkLWG/l4jiBTO2nrzNsd7S4vSLjPxYNj/AehMPZO/Smwurx2VCUTuDwkiMxPAD
         GrLE3+e+kiGYfUCYAUHx1uK9xUJvXk3qRVFIID85+H2WtGA64Gs9OA46eM2AzWqbIOow
         854w==
X-Gm-Message-State: AJIora+/B87dhTFVEmTGScUYT1+hfUsKfISH/pym+Qu3a5TPQPJ/jGMK
        C9R6CIdajHyLxdRbmLiwVUx42Q==
X-Google-Smtp-Source: AGRyM1vc1pJmylzW5eHRWv3Nd6IuZfh47MF5zJutwFg1Sir9CSqf8ArnpGkS7cxI7nAwIrRYgix7Nw==
X-Received: by 2002:a05:651c:b09:b0:25a:44fd:41f with SMTP id b9-20020a05651c0b0900b0025a44fd041fmr1869162ljr.366.1655367067892;
        Thu, 16 Jun 2022 01:11:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y29-20020a19641d000000b004790823d354sm142144lfb.26.2022.06.16.01.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 01:11:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/5] drm/msm: fixes for KMS iommu handling
Date:   Thu, 16 Jun 2022 11:11:01 +0300
Message-Id: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
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

Changes since v2:
 - Merge two return statements in msm_kms_init_aspace() (requested by
   Stephen)

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

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 24 ++----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 --------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  6 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 31 +++------------
 drivers/gpu/drm/msm/msm_drv.c            | 49 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 6 files changed, 57 insertions(+), 70 deletions(-)

-- 
2.35.1

