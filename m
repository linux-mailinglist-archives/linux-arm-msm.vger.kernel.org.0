Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4CB570A370
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 01:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjESXka (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 19:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjESXk3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 19:40:29 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0ED1B3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 16:40:28 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4efe8b3f3f7so4342285e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 16:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684539627; x=1687131627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6tgw64QArDRy7OvpPNE5Lmjz7wtWaHwDObMSRxTN810=;
        b=Ik73RGkBIkUJzAHOt+zcQM4hIdiEKd+SA86jn8b6gFksbp6y4qIIb4BojUyZqli6AN
         9AUK7Wwr9yqTthjtVdPxKjgLuonZjbKPe7yglCUtzncz8h6BjzNdlHF8WYp38/GWfpBU
         C0IoBHMd/wMI3EPBR25Dwfvk5Sd12++lHma3cYgPCwxmghFu0ywHu+tmmUMLRHHm40pz
         9HgZKd0+64khRqdlVXP/u+6ygHCY9c6ejBKy5rgadt8Ophmu+nKdWe5bhKUA3eimE0DH
         A/MOYXA5uZzyJIOtPSWaL1NcVt5RAkX5Z1HqpSuEPczHcHyVa1tmQ3kcdC0/EOHXo/h4
         4Htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684539627; x=1687131627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tgw64QArDRy7OvpPNE5Lmjz7wtWaHwDObMSRxTN810=;
        b=lxl82hFIYGHmw2Day3M9MIBagkypZ82JeX8QdYxP0iMZPV1JXzCBxqaIjDClaBuSb/
         uAAy0H1OKSo8lGVGhRIFQSULMiIM7LrVS376+5TKcAG9cLGXcy4qE9qpIrmat2xSE1Cw
         KdRKNooDzaYmcQT0sz3uoaqBTVVwec3qhzh4OPBwhFgVVd6xXvFN26ZWZV6geLgiDOpe
         loSvvi/93EahuTx/oBKp152+17Dqu2Fk1lg4nMoc7YWjEVHA8fzY9mnmn4PE/su3FkgO
         I0uDxMuAYl7NrUEst9X09hs+FSHAPn3/5LtJQC0xvmh0x8K+l6jaBRYuh6v4+eF0B7nA
         73lA==
X-Gm-Message-State: AC+VfDzC4tlx6b9rLi67H8OUtYPII1YM1mlFRX8/MFzF2kifFkhayMrH
        7Zp+jN6PTKHN35p3MicywPCoaQ==
X-Google-Smtp-Source: ACHHUZ659kbwQ+zdbPhbcbhPNXF2toD/GnKXZZ2iSe3oNSV16KRXsqgmyhbNW6lUTZB6cVqjO81y+w==
X-Received: by 2002:ac2:4556:0:b0:4e9:c627:195d with SMTP id j22-20020ac24556000000b004e9c627195dmr1079154lfm.57.1684539627094;
        Fri, 19 May 2023 16:40:27 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l7-20020a2e3e07000000b002af25598f07sm43454lja.78.2023.05.19.16.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 16:40:26 -0700 (PDT)
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
Subject: [PATCH v2 0/4] drm/msm/dpu: simplity RM code
Date:   Sat, 20 May 2023 02:40:21 +0300
Message-Id: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
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

Implement several small simplifications for the DPU resource manager.
The ideas behind these patches were suggested by Marijn.

Changes since v1:
- Reworded commit message for the patch 1 (Marijn)
- Fixed documentation for dpu_lm_cfg::pingpong (Marijn)
- Added Suggested-by to the last patch (Marijn)

Dmitry Baryshkov (4):
  drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR during DSC init
  drm/msm/dpu: remove futile checks from dpu_rm_init()
  drm/msm/dpu: use PINGPONG_NONE for LMs with no PP attached
  drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  4 +-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  5 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 41 +------------------
 6 files changed, 13 insertions(+), 46 deletions(-)

-- 
2.39.2

