Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BABA7477F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 19:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjGDRp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 13:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjGDRp5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 13:45:57 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71AA110D5
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 10:45:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso9114304e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 10:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688492754; x=1691084754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6NVP63A5kA3bVBWFMHxu9Ll3AzCjFkGOvC1AhTKo6S0=;
        b=mPxqXiHYbM2soowGCvklymGX0xgtEFNKZco2Giol7Iaqez4s7EY9LdTdQasEQ51xhz
         A9347mX4EcyDsMmo67CLfz+TzAUyQoTx7bUTendr1daGUQSG2z92MJ4GUYbLkOW7dDC+
         dZ+Azk8ZtDc8LHP74/HjQAC4cs30MRMlwrWyfE2V0gNQM41RF5+64dXXfkBPd700edXW
         VdIngYfViBcMU+k8LjmZQ5WPLl5de0tl9VWveYDtO2afKbWdfu8xJqZWyB729nuTB6sg
         Ky3f4KMfdyUrVvVGaa5pY8V7DyMrZ0TQn+8GihfZnIoaa+JPkA5AodvJHVaKLJ/QAaB5
         hgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688492754; x=1691084754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NVP63A5kA3bVBWFMHxu9Ll3AzCjFkGOvC1AhTKo6S0=;
        b=b6PGKEvsoy4cJYhTspJMN27uhdkdokSOQFa8zhKJb7/SOPzN0Qqbz6hTU10ygjtuLQ
         y6Kae/ek+xpXhtn/AHrlCB61Kj24J69E+e2odGmjeDJUk8/r46LtJ2AUKBXjAWxFvbdo
         q0cewcj16hqHAh+5tgeW6ZrJPpxiGyLLN3Mk7+n2TD2kkocMH6aXyKJiBPUBIgZRCBNJ
         ECx80/bOsE8b6iSHulqwbIVDqLEMBgGHm4PQEwLGohkj9nKdRJtGSw4LQb5KM+dnIWaM
         KiYW8VBs7Rr2qgewLaUtytVBmDsYElQTeYkc7Gdg+jzIBzHAI1er0EvZ70MVf2FD21dk
         mPJw==
X-Gm-Message-State: ABy/qLaZdSM4pkcP6kZHP1j7f18oouYQLK503X6mBzCho/9zRoxw9UBF
        8vFbJIUOlN7bZvP0xegQOsib5Q==
X-Google-Smtp-Source: APBJJlHW1odJg4Bh1+LqhExnDN5SfHorKlztMinWGKGapxRceXAGkdkn7U6Fg8SVrbGPdrhXrjirog==
X-Received: by 2002:a19:e046:0:b0:4fb:82ac:9d23 with SMTP id g6-20020a19e046000000b004fb82ac9d23mr9313764lfj.36.1688492754562;
        Tue, 04 Jul 2023 10:45:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n25-20020a195519000000b004fb6c61e79bsm4709779lfe.117.2023.07.04.10.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 10:45:54 -0700 (PDT)
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
Subject: [PATCH v4 0/4] drm/msm: move resource allocation to the _probe function
Date:   Tue,  4 Jul 2023 20:45:49 +0300
Message-Id: <20230704174553.216248-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset was left untouched for almost a year. Let's reiterate it
in attempt to solve the long-standing issue.

As discussed several times on IRC, move display subdriver resource
allocation from kms_init to probe time to let it bail early.

Changes since v3:
- Fixed MMIO unmaping in the DPU case.

Changes since v2:
- Move even more resource allocation in the DPU init path.

Changes since v1:
- Dropped the applied patch
- Picked in the patch to pass msm_kms pointer via msm_drv_probe()

Dmitry Baryshkov (4):
  drm/msm: allow passing struct msm_kms to msm_drv_probe()
  drm/msm/dpu: move resource allocation to the _probe function
  drm/msm/mdp4: move resource allocation to the _probe function
  drm/msm/mdp5: move resource allocation to the _probe function

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 133 +++++++++++------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++---------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++---------
 drivers/gpu/drm/msm/msm_drv.c            |   6 +-
 drivers/gpu/drm/msm/msm_drv.h            |   3 +-
 5 files changed, 162 insertions(+), 187 deletions(-)

-- 
2.39.2

