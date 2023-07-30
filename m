Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2B007682D0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 02:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjG3AfY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 20:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjG3AfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 20:35:23 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B9119B5
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:22 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9cf2b1309so23972401fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690677320; x=1691282120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAbWbSfrjAJXL01M6Z3Udbs8b9DnT7yJqHEur/XSDic=;
        b=DSr/Om6fzFiz9i6efc8fkAF+21qOKuIW0ddAujS3XSdmW0VxPUI4mYmT6h/1oIst2u
         bzrknbPqmaN2XCYFve+iHcXFBY37x7FZN4GQ1pBTlf4BHFbebmeyc5u9lrb/6UAmEg9q
         4r1aoKB/jYpT6zUXxHtTy6Ft5f4QEXxmFuqQghBqs+8Eq/a95iStQ6d22o8Q1D+IQApp
         NSYgjCi57nvYsqrVeI+wfPOlPznJkz2TWWf3D/mxzpS/RRtduL9eqe13glfjkDdKtKQy
         bjxqpan0dmgNeeSNnIJQ31v4u/OdmjMrCsun2kuEjwvc+luIUU4ALEkGyUwBuoVvtCmu
         KOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690677320; x=1691282120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAbWbSfrjAJXL01M6Z3Udbs8b9DnT7yJqHEur/XSDic=;
        b=fvO456KJfYZGHndmv+far1yQi80uV4rc/IJVRalA2U0jqOd//dHK1XOg+GlG0naRbo
         NBoWb66LFA+GEaI8BNU3ilDPHu6OC5dfn8dqkT062rQfIG3PucoflrDv/AdyPD3pt0+t
         HqQ6d9vIUrDJjEEU/KpLZUngNNrikcMQ3VEfHKmXdM+PLXCr7lFkP4fly7vgBn11Vo0f
         fpq5ZqOgA6NUXRldE7GZB0v/uGKrSNwV/J1z1jmSUDsiXHksXVfOrC5oDHwsZNU+QqYU
         8phtVYpjkuEO+lEYEhWo8LFhkmIjOYK8HQWXw7wkVyDgOF3V05mt49AKL0RGyalR2xQD
         hJ6Q==
X-Gm-Message-State: ABy/qLZXh2SvroVv0Yys2gbhBO3MbfAe5MHvBUaNeugdYC4dWYZwa98I
        +rchX8qk+mJjGEVVfuaSi7w9AQ==
X-Google-Smtp-Source: APBJJlH+z2podrmuC7Iatzg4fJ0yg2/rK9ZTkFuqESYst25YRswpz9UFoGjWeEu2xrp3QWFvdW6t/g==
X-Received: by 2002:a2e:8755:0:b0:2b6:f85a:20af with SMTP id q21-20020a2e8755000000b002b6f85a20afmr2181867ljj.4.1690677319718;
        Sat, 29 Jul 2023 17:35:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 17:35:19 -0700 (PDT)
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
Subject: [PATCH v2 0/8] drm/msm/dpu: drop DPU_INTF_TE and DPU_PINGPONG_TE
Date:   Sun, 30 Jul 2023 03:35:10 +0300
Message-Id: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
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

Drop two feature flags, DPU_INTF_TE and DPU_PINGPONG_TE, in favour of
performing the MDSS revision checks instead.

Changes since v1:
- Added missing patch
- Reworked commit messages (following suggestions by Marijn)
- Changed code to check for major & INTF type rather than checking for
  intr presence in catalog. Added WARN_ON()s instead. (Marijn)
- Added severall comments & TODO item.

Dependencies: [1], [2]

[1] https://patchwork.freedesktop.org/series/118088/
[2] https://patchwork.freedesktop.org/series/118836/

*** BLURB HERE ***

Dmitry Baryshkov (8):
  drm/msm/dpu: inline _setup_pingpong_ops()
  drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
  drm/msm/dpu: drop the DPU_PINGPONG_TE flag
  drm/msm/dpu: inline _setup_intf_ops()
  drm/msm/dpu: enable INTF TE operations only when supported by HW
  drm/msm/dpu: drop DPU_INTF_TE feature flag
  drm/msm/dpu: drop useless check from
    dpu_encoder_phys_cmd_te_rd_ptr_irq()
  drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init

 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 54 ++++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 51 +++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 41 +++++++-------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  2 +-
 7 files changed, 77 insertions(+), 83 deletions(-)

-- 
2.39.2

