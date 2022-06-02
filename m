Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96EA853BFD5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 22:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238993AbiFBU1H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 16:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239140AbiFBUY6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 16:24:58 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAACB7C4
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 13:24:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so3427124lfg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QnpqY7uSZkIjcnvWBh5WX4NtB+14lkn/cDIY5XypWiU=;
        b=V8x9UugTi+NUAHS7VIDD+H8ooMJX0nFbVGf5CFVBC/YX7hJJITDrtgOR4CZG3y9y/7
         YKvZmhezTevnQjudZ3Jl0cc6mRqya7HtCnnA9H5eLMu7VDuapKcSpNfEqwNCG/9ZPFL+
         4NNk0VrDpClVhig4K/qLV+xWfJjfErBZEzQ6r4oiwd6SmuvNC32GQpS4MQjZKQEKmI2x
         9wzqq1ZUlFu7KJhmf9wM17Ees03xTBUHUrWdbwayeN3W8i54nBp1ZWU9V9OTCXhrNl92
         qitVMI6lBcZROcRfUuS2TWQE+UH3OZYDs1mnwj7JmY0DfJDtT1GYLpz+3d5JivWeu/Da
         K2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QnpqY7uSZkIjcnvWBh5WX4NtB+14lkn/cDIY5XypWiU=;
        b=LBG57PhlPUO+uxWfLV5hVfRc2eJkKrNem2POktxnI76aEDdHaBeRI+PG4F8CCqvVpN
         ZlyR/wBc+tK8miB38Ivv+AUbIDlx49VV7N7sk7D2aZaK86KSexwvq/7EXswtEO34wPtc
         i83bg7VG90gptAvGkLxZwMG+WG1ThvxytLr8S47ld9AK65GNnwIqqZachW87uRs3mVE+
         SRq5Ph/isCA7HutZnywb4BZo9bOTVeyIdmULb0V4+nFV0mSpEGABDqkPpoGVyQ7z3le+
         X/BNl7HkciLAVOsPwZ5Hj+v6e5AT5mHKbmbAJj0ZkFVIcMDFmQpVfVS0o9WQ2AmJXKc9
         hoTg==
X-Gm-Message-State: AOAM531kLUPZMchQGLv1DusTmBLHW9UhHqRRModE5R5SpLeH7omlmynV
        q6V9nc/JWOYWn4z4CzTOY/QzVw==
X-Google-Smtp-Source: ABdhPJzwnbItBXkAB/92vlcFEICxkkfN0YzB9bqgMnE4WzQKRCLbxMnmck7dZ67mcbKAhXHrIY596g==
X-Received: by 2002:a05:6512:3c93:b0:44b:4ba:c334 with SMTP id h19-20020a0565123c9300b0044b04bac334mr4723285lfv.27.1654201489800;
        Thu, 02 Jun 2022 13:24:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.241])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm1205718lfs.67.2022.06.02.13.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 13:24:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/7] drm/msm: clean up the hw catalog init
Date:   Thu,  2 Jun 2022 23:24:40 +0300
Message-Id: <20220602202447.1755115-1-dmitry.baryshkov@linaro.org>
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

Replace superfluous cfg_init functions, which just assign a static
config to the struct dpu_mdss_cfg, with static instances of struct
dpu_mdss_cfg.

Changes since v3:
 - Add missed Reviewed-by tags by Abhinav.

Changes since v2:
 - Add DPU_MIXER_COMBINED_ALPHA to sc7180's mixer features mask (noted
   by Abhinav).

Changes since v1:
 - Turn catalog->perf and catalog->dma_cfg to be pointers, otherwise
   clang complains that they are not constant.

Dmitry Baryshkov (7):
  drm/msm/dpu: use feature bit for LM combined alpha check
  drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
  drm/msm/dpu: remove hwversion field from data structures
  drm/msm/dpu: change catalog->perf to be a const pointer
  drm/msm/dpu: change catalog->dma_cfg to be a const pointer
  drm/msm/dpu: constify struct dpu_mdss_cfg
  drm/msm/dpu: make dpu hardware catalog static const

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  12 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 502 ++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +-
 27 files changed, 283 insertions(+), 359 deletions(-)

-- 
2.35.1

