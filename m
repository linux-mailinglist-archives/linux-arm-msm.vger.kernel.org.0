Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4D86F46A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 17:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233614AbjEBPFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 11:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233338AbjEBPFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 11:05:47 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F442D4C
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 08:05:36 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2a8ba5f1d6bso37549951fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683039934; x=1685631934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=er6uZ2Jm9haTMcFY7KD9AAR3BYHrxeDV+fDEIq+qzbU=;
        b=lwvMRaTbj6M2HCTghvl8PCWKQb9xxtECbfnG/oj529Mz2WWUhUo2u1UKfYuh8pQU1+
         mZDLHQwoLJ7e7dqsmCKkuVtTpqrbo48LR3k9rR7VbyeaqOn1v2O7QrddsZipwn8DUAOL
         kDhjseYlcnkrkgwUljCA8t2b4dKmhU/ESppGfjw+BiF9hGWqEXztYwRF9A9xKrS75joW
         jnh7MywkbmMlBg2DesIQeWOudFsISLa8fkRE/2pVp7jHwC9sAgu5NdJVgwL3yH7C26Tc
         uh6KR85RCFWfS3JkPAD3HK1kmjAOtnt7mNxPTST41EQ7KXc+Rg/1JO3SVH5TV+PkXVI2
         TBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039934; x=1685631934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=er6uZ2Jm9haTMcFY7KD9AAR3BYHrxeDV+fDEIq+qzbU=;
        b=gbzWHngj1x0lGuvfHjA9h5qqe43Q/N7aimaHbbX42bWoeuYrzLIilK5W282M9vOWug
         YRjKF4bQSatiC8YGOOhiV0xMH8hRAQxaFCWlXYemGEH6jsajCpGIw3e0Hafmixme4nPw
         pz1Z7o3rWOFLCGz+wb+x6Aye7APWeW1kMTfaZ7jKouMydbTYOF1YU5q+6C8DbRQBPbue
         ZR7UfhkgsflZTuJMs1iyLMTCVK5RQBaTtwhz/9eK8ddIhfURTzirO2QAJ9O1NcLwmMaT
         xumJPecoe2+5ATcmZSwIPjTSkZGie4c+NySSq86U5XlWS1VFRDOkHE34g12dLUkQVCaM
         6qEw==
X-Gm-Message-State: AC+VfDwBH4hSWVSYMKRxM6I361GaZ5WPzqPAHydUbQ1/AjV0qeT57Ws0
        Ul5199FzIje3Og2noBgF3rBtAg==
X-Google-Smtp-Source: ACHHUZ4Y2KzHHTiUxhebn6B6ijI7/6qVJ3xvmzPc5H3/8SF5nY/wKX7Z0R7LOIxWrQclhtp99uBiKw==
X-Received: by 2002:a2e:b00e:0:b0:2a8:b286:826e with SMTP id y14-20020a2eb00e000000b002a8b286826emr4642926ljk.33.1683039934435;
        Tue, 02 May 2023 08:05:34 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 08:05:33 -0700 (PDT)
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
Subject: [PATCH v2 0/9] drm/msm/dpu: simplify QoS/CDP programming
Date:   Tue,  2 May 2023 18:05:24 +0300
Message-Id: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Merge SSPP and WB code programming QoS and CDP. This allows us to drop
intermediate structures and duplicate code.

Changes since v1:
- Fixed kerneldoc for _dpu_plane_set_qos_ctrl()
- Fixed danger_safe_en programming conditions (Jeykumar)
- Simplified the code surrounding setup_cdp() calls (Jeykumar)

Dmitry Baryshkov (9):
  drm/msm/dpu: fix SSPP register definitions
  drm/msm/dpu: simplify CDP programming
  drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
  drm/msm/dpu: rearrange QoS setting code
  drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
  drm/msm/dpu: simplify qos_ctrl handling
  drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
  drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
  drm/msm/dpu: use common helper for WB and SSPP QoS setup

 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  21 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 142 +++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  52 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 165 +++++-------------
 9 files changed, 194 insertions(+), 349 deletions(-)

-- 
2.39.2

