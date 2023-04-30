Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D106F2BBE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 01:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbjD3X7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 19:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbjD3X5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 19:57:37 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF0BE7A
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 16:57:35 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso2449966e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 16:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682899053; x=1685491053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEO1kY5gj6+OGElS2SgzMK4jEbIa9KGlbcUtbSF+QUQ=;
        b=hOMT8YyFEemF8LN+1djfEKeIY2IakpKS3tCJH4ZyWZo1cy3IVn9lzKSR+qljOO9iRS
         uBCSje9X1VsH2wlPL/cLW3ywe4+wkOYG2yyCoUv4uLKMlzcGx/LtcfC0y7wZPK7knYWo
         S32Kjm0pcsWDUVkk8BGKy8j79/PVziLh88zW5bgL7rpxXyxh7eW4DJHHs/NnISHregN3
         DN4/x4DaWwaZ47K/N4s1qKRG9F2ORAxGZW7rgQD1kl4U0e3dKOTRNpySkTEFxK1OEdD/
         2aa6pPC9TmUvAPkikZ5nbg1q9p0nDPj/mUrewoprAQzCbdC62Z/ErIB3b99IANM9dkWu
         WJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682899053; x=1685491053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEO1kY5gj6+OGElS2SgzMK4jEbIa9KGlbcUtbSF+QUQ=;
        b=I6GjpnLnB/weNkDI3+CC0PJ5ZbW1tW4V4iYidGog7F5+QNZ7PVz2DQQTx0ImEk5KE/
         MkZt8VYBk4emNkRhjqfzB8MgbMhl8GV1e19MT9o5BwZ/OPAm9cQenT7uIayX1lRv8Ayb
         Q0QUrkQHcGCy3FMPfLvmjv9xj+YD6lZtOTAWadAUImBwek3DVSVE6P0olURWWieX2mEU
         wcry7knXluobaUSRxto7NOliLqfCNmQ+tl2q47t10HHEyt4BaTWZBMl0ndGdeyT1k0g3
         QAPweIW40ChDXS1oT0owUvjWskkL90Vv5vw2tx9Jfjqa//EdXQPHyH+UaRVvskjigd2U
         0y4g==
X-Gm-Message-State: AC+VfDz0k6m0aqL6EmaqwgA23v0XgRUsPB9G2esvEkyCV0+1Af109HPH
        JOHvfSu2rr9XnkeR7YnKLlugNQ==
X-Google-Smtp-Source: ACHHUZ5BIVvcrDS/lcz5f2hKdt1/pKujyBtQx3Qhi3bghKnh9g2gMe/CaNg1FxfJVnbRdtH5VSrYTg==
X-Received: by 2002:ac2:5981:0:b0:4ef:eda6:c14 with SMTP id w1-20020ac25981000000b004efeda60c14mr3119706lfn.35.1682899053283;
        Sun, 30 Apr 2023 16:57:33 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p19-20020a2e9a93000000b002a9f022e8bcsm4292099lji.65.2023.04.30.16.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 16:57:32 -0700 (PDT)
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
Subject: [PATCH 0/7] drm/msm/dpu: simplify DPU encoder init
Date:   Mon,  1 May 2023 02:57:25 +0300
Message-Id: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
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

Rework dpu_encoder initialization code, simplifying calling sequences
and separating common init parts.

Dmitry Baryshkov (7):
  drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
  drm/msm/dpu: drop dpu_encoder_early_unregister
  drm/msm/dpu: separate common function to init physical encoder
  drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
  drm/msm/dpu: inline dpu_encoder_get_wb()
  drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
  drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 190 ++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  20 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  55 ++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  35 +---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  38 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 +++-----
 7 files changed, 155 insertions(+), 284 deletions(-)

-- 
2.39.2

