Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6959A73606C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 02:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjFTAIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 20:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFTAIw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 20:08:52 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B711B6
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:50 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so5282409e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687219728; x=1689811728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w7OWjaL+FXNpudHxCHDOI7HyMiIA5hklDMjolIe+wQw=;
        b=mqUlJF2tBzSFoNWT2HbgqoGJbMVw02B/z4yPBFiNXYA8ErP/nOxxyh+b2bphoGRGOp
         jdIu5BMnE/d14wd/+6pm/cAzA3yLsaOGVCi0NZ7cLJMn/m4zgricgBxKl3IraNDV3kp5
         iXuZH+Ash0v/VtNgtWj82N0Jub3k8qNORbah/zSdv8HEwCHUnDMbFxqRjfjGzowemxpk
         1OvKQH6N5bViC/EjLzNBBt9Y4GG8+aetxJrbW0aALfL26FC1xhWEdTi4q5To7ueLFkNO
         QyywttgTsj9kmH9+8mGzHJ8t+sVUx6KuIrgDP0qxBbscVqaEIlXG3An4ZD/wFM1Nq5Ti
         XyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687219728; x=1689811728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7OWjaL+FXNpudHxCHDOI7HyMiIA5hklDMjolIe+wQw=;
        b=F+wb8JIMjH+BFt0w3Hdd659igcJukzJCdu5/m9pDvoZruqSnLqOzIaPTkUPountxxS
         uycCArzn7sUmyZrzhhzxOkZYVqTIPQM45tCTHzl0A5seHs6Qa9lhia11uTErnAf2kxCD
         BaFXy/3AWImw/Igt6iFFyR+aKQVZVsnWNgHIPb1YkjtQ9vM7+nbi6XUMTEUU69sV7ttT
         5X7zQD1JCbMNCbuek3ObBjVfHuoiUeePdgDLTcBqSxpbpTPsuxqclihnwlduqN7/NPnS
         eooOZUmr6/X25ddqiMdlRKZfOUAVltIW7CNUOWAhcH0JoTgFuyJBuU41GsJ0yt1RsL2Z
         vaLg==
X-Gm-Message-State: AC+VfDwpCDTKwbXy4AX/l+KFAPzBq4yf0+MHLhSW0FaLIpBFQWuwRKGh
        6gtVNLTKULObCSlym0EThzu7wA==
X-Google-Smtp-Source: ACHHUZ5wHy2qK1kc1Il2EOPChzHpk185SQoGSGIIJ3/WYrIKx1fiOxoJ1wm7lMjlPQjK00i1LkiMGA==
X-Received: by 2002:a19:791d:0:b0:4f8:6f40:4773 with SMTP id u29-20020a19791d000000b004f86f404773mr2154256lfc.7.1687219728459;
        Mon, 19 Jun 2023 17:08:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:08:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/8] drm/msm/dpu: cleanup dpu_core_perf module
Date:   Tue, 20 Jun 2023 03:08:38 +0300
Message-Id: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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

Apply several cleanups to the DPU's core_perf module.

Dmitry Baryshkov (8):
  drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
  drm/msm/dpu: drop performance tuning modes
  drm/msm/dpu: drop dpu_core_perf_params::max_per_pipe_ib
  drm/msm/dpu: rework indentation in dpu_core_perf
  drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
  drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
  drm/msm/dpu: drop dpu_core_perf_destroy()
  drm/msm/dpu: remove unused fields from struct dpu_core_perf

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 199 ++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  55 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
 4 files changed, 47 insertions(+), 218 deletions(-)

-- 
2.39.2

