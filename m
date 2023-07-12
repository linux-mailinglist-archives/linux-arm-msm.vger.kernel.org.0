Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0F475133F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbjGLWLp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbjGLWLn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:11:43 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA681FCC
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fb9fd28025so75364e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199900; x=1689804700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RiBxelklL66UAOz090rtZPINsn9CcVuq61oI6xDxFI=;
        b=WQf8BcV6FGMCMjo247gbz4AswWQHxO3/liFJtppvv0PloXb6Wm1lojUVQvkAp0TlCM
         89h+biD8WQFYm7aOP05ySqSn4UH1cGrpk7Z1K87ZL+H/Y9dfy3+RRfs1bpobz4yWlspP
         ka8YJeKSzdJh+xtyy/y3f+D3bwOnIEXYk7cFabpgGpOuMS7aHm0QM8fMVOxobyCeCHC0
         gHqgC3J6kmcRKgD80CCizAN/8mL853U/+eEmwWOLKMSD9NK3oPfJvjZylpjO87VsRb4c
         EeVNv+6W+YpGjcBenwP/iuH+KOqIzMlh+tQYyo9fH31PuQKXTYoT8/yYXxgv7kxDOvKV
         TStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199900; x=1689804700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RiBxelklL66UAOz090rtZPINsn9CcVuq61oI6xDxFI=;
        b=JCteelgOO4ThdjG+6cfJF/jRHwnDgcYmNbO9hKhI4V5ukzBJ9hJXXof8i0V6IOc9m/
         ksVlM5OJEVarAiTk1zXFDuj3KSQHlhDxFSMU/Jx+iLQKLItrXX4enXNERYQQUuNDJbMt
         afaz1AJ3Cm8qzRi+SZyJ82mgekQs2+h692/lin70qm62nrhnVsA5/jD89PrdFeZWz0Ex
         CsyxL+nduNW1MQL3Hhk+mmXpW1fwnT9H7+jhc6oI0PrrPBn4bB44EFHwseIxxtVBcgNZ
         C7R60mnyDq2hfl0rVixFuQwWLgIcrnKV9/6vPvgYDEc6TdHYy87hfMZAHS7CZER5HXem
         siZQ==
X-Gm-Message-State: ABy/qLYyyugBcWE+S2rwHzBqaALePIxyZAs/Jpq9lVa/bgvCyGb15+lm
        d2h1qypjtmc1gR/WFQlIWA/buw==
X-Google-Smtp-Source: APBJJlFMDe0JLw2pB86fwpjn6gTtyQ7nxVTmEY6hl0L4dX+byLo+fFMtJhgj7lYJwP7aDAzsjXRO8A==
X-Received: by 2002:a05:6512:3090:b0:4f8:4512:c844 with SMTP id z16-20020a056512309000b004f84512c844mr20337601lfd.48.1689199900381;
        Wed, 12 Jul 2023 15:11:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:11:40 -0700 (PDT)
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
Subject: [PATCH v4 00/11] drm/msm/dpu: cleanup dpu_core_perf module
Date:   Thu, 13 Jul 2023 01:11:28 +0300
Message-Id: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Apply several cleanups to the DPU's core_perf module.

Changes since v3:
- Dropped avg_bw type change (Abhinav)
- Removed core_perf from the commit cubject (Abhinav)

Changes since v2:
- Dropped perf tuning patches for now (Abhinav)
- Restored kms variable assignment in dpu_core_perf_crtc_release_bw
  (LKP)
- Fixed description for the last patch (Abhinav)

Changes since v1:
- Reworked overrides for the perf parameters instead of completely
  dropping them. Abhinav described why these overrides are useful.
- Moved max clock rate determination to dpu_kms.c

Dmitry Baryshkov (11):
  drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
  drm/msm/dpu: core_perf: extract bandwidth aggregation function
  drm/msm/dpu: core_perf: bail earlier if there are no ICC paths
  drm/msm/dpu: drop separate dpu_core_perf_tune overrides
  drm/msm/dpu: rework indentation in dpu_core_perf
  drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
  drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
  drm/msm/dpu: remove unused fields from struct dpu_core_perf
  drm/msm/dpu: remove extra clk_round_rate() call
  drm/msm/dpu: move max clock decision to dpu_kms.
  drm/msm/dpu: drop dpu_core_perf_destroy()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 187 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  14 +-
 4 files changed, 96 insertions(+), 159 deletions(-)

-- 
2.39.2

