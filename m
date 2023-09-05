Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7B77926A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 18:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238581AbjIEQG1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244675AbjIEBZd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 21:25:33 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08367CC5
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 18:25:30 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-501bd7711e8so377196e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Sep 2023 18:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693877128; x=1694481928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PGSesLieEcOqw+a0zaRz86MzyUui+iQO73QMhXr0n6w=;
        b=zG/zwfvzuNAKLpl/yJgp6vCsc9ykyg+WIVRYUe5vv4teRxJyDFuuAvYjsnwr1yzInv
         eGfuR/cbGMspdjILPKWLuYXS7HmUyxD9hIs36yU4bvJigjyBvrnXymRkKACEdYGzZg7u
         P5Cx/OkSh02c8nsZCBslqkyV2+ATuBWKQXYogJkgiRoubNYGPxgyNWD/RfQEk7mEmqBO
         +mutjWAYphtDftm9UBt+HNOaZzp9xtrlHGI6jX0971PyAlRHbP3mPqQ9wnibgZkw7T92
         WUYFH6TZK0g74ZSuaOVZE9Ml52wYjVv6D/0KJxgQpvob95ifBmgSFWvLdQdjqxsBBsUY
         FlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693877128; x=1694481928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGSesLieEcOqw+a0zaRz86MzyUui+iQO73QMhXr0n6w=;
        b=V9PdzWrMr8NSIVVGFLdrewK0gTmr1qJT7pNv+//BsKLMWCbwLaZjAoQBRE1p1ddXgn
         HfEMEvOnKqiGCTx9L71RjlDpZh3NegIJWu/LPA3GVVOMTlzuK4mKbZimsliv2CZgdQve
         XhqueWiyIu4jhWnxpx1g0YBkawzUSkET+eWrUOSo+bdeyxRjL1vJKNq/1fT8v8iE5EPD
         wgfA68e1JQxICHVSzmKhmcL3/p9SfO7DqwJI4kMghbi7lwnWT7QZg+baEanFPknLbBXD
         5NfsBY5BDnQR7rDAtsXSJipoJHH69bXxZbvtzAIX57zfLavXSr1Yn7zG+ghsISw1m2Gu
         eouQ==
X-Gm-Message-State: AOJu0Yx81Enp+SEcOgUmbWwM8EMGB2EJxsg3REYdKPcniVL7wHyv/nlK
        iStY4SZxFiZjJrRoe5ZF1Dif1g==
X-Google-Smtp-Source: AGHT+IHe9bGHOI7psm5y3VviCTDtNbE7xdf/6oJt+4/eT8OCnPsStODTGj/Zjuha2AzL9WjlQUTxAg==
X-Received: by 2002:ac2:482d:0:b0:500:a2d3:3e65 with SMTP id 13-20020ac2482d000000b00500a2d33e65mr7703889lft.23.1693877127724;
        Mon, 04 Sep 2023 18:25:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v25-20020ac25599000000b004ff70c76208sm2062369lfg.84.2023.09.04.18.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 18:25:27 -0700 (PDT)
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
Subject: [PATCH v3 0/8]  drm/msm/dpu: simplify DPU sub-blocks info
Date:   Tue,  5 Sep 2023 04:25:18 +0300
Message-Id: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The handling code also usually knows, which sub-block it is now looking
at. Drop unused 'id' field and arguments and merge some of sub-block
declarations.

While we are at it, also fix all VIG subblocks to contain correct scaler
block version and drop the becoming unused QSEED-related feature bits.

Changes since v2:
- Reworked the VIG SBLK definitions to set the scaler version (Marijn,
  Abhinav)
- Rebased the reset of the patches on top of this (intrusive) change.
- Folded QSEED3LITE and QSEED4 feature bits into QSEED3

Changes since v1:
- Dropped the patch dropping 'name' field (Abhinav).
- Deduplicate equivalent SBLK definitions.
- Dropped the dpu_csc_blk and dpu_dsc_blk merge.

Dmitry Baryshkov (8):
  drm/msm/dpu: populate SSPP scaler block version
  drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the `smart_dma_priority' field from struct
    dpu_sspp_sub_blks
  drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
  drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
  drm/msm/dpu: drop the dpu_caps::qseed_type field
  drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
  drm/msm/gpu: drop duplicating VIG feature masks

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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  52 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   3 +-
 21 files changed, 198 insertions(+), 269 deletions(-)

-- 
2.39.2

