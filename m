Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98E5A6EB629
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Apr 2023 02:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbjDVAIp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 20:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233316AbjDVAIn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 20:08:43 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B53270C
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 17:08:42 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2a8aea2a654so21328781fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 17:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682122120; x=1684714120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uuLJIWPT7McWRmjFf9J2eAbiIfK6D/3jAR4EmOgvOQg=;
        b=UehVe7wUqjBURQQtzKfocd/Ltqbu+WDQHz/g4Ek465MkMPQv6IHBwF+XZ/NDbdbKMZ
         2zdTIGnS0WjBjOOBzkNnUGHOakbytrTc4RpbSQz/hohDQhXxgXO220tXjM+i0gxffs/P
         li3NlSNfAj7rKPSvnT0Q0D5Zi3A6P0MAXPGxx3x0gfQyG++X6XlFi824Pj9Srg/eAw20
         8w8iDu3KY5qVifG6aSyKFLlkIbcNjk5BNgTbNrG5HHCwNI4ooPn5/XyUKh5IYSnC8Nhr
         BzMZtb1efoYuXvTPjfQc2Or9Sgszgrrz9WbGWwydduwYUS0au2g1iXWmojmYxidOxGfs
         THoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682122120; x=1684714120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uuLJIWPT7McWRmjFf9J2eAbiIfK6D/3jAR4EmOgvOQg=;
        b=Nt6hVq5LecPBevIdsRZIF9El+2iymGCjwsOlPSKbDGpmcz7GpnmLYDCQskAt7Bji/L
         LHt1ApiVqiDsKjRuy2359yun68i8dFvp5GPPaFqiUbkvP2dsYDrpC3LMlfp4HO1TDiib
         m0sfvj52NfEbh5w7LybE4CqNEBjy50FKlwzx+jSH2rPLXk/Ww3rFIK/cPnVN6Kin6xgn
         YZELTeYlplOSjQxl040jE5zUk3vTl3WALGsvwC0Wfrxc+hbz6xqYiBr7BuJpjZGQL58F
         GHHzsesHYsPoxL3MBLstfJqUAp3SWKsufUiUyDgtp83rNKDWMW6R69l0pQEFP0282B5/
         OPzQ==
X-Gm-Message-State: AAQBX9fAZfKvpHQ8WeRLTrrYTFiiJ403inQ3+P2nC10RYGjM92uHLd1i
        9jNTeL24V8fHCmcu0X4Pj6j7HQ==
X-Google-Smtp-Source: AKy350b/GMzd5fPsHipMD+26tdLwzmryErhQNZVDm0qigfioyEtdKDTSA9nMt9HvgBoy8e99qkp/hw==
X-Received: by 2002:a2e:3002:0:b0:2a7:653d:166c with SMTP id w2-20020a2e3002000000b002a7653d166cmr967978ljw.3.1682122120214;
        Fri, 21 Apr 2023 17:08:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g24-20020a2e9cd8000000b002a8bce7ce0dsm744681ljj.107.2023.04.21.17.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 17:08:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm/dpu: drop _sspp_subblk_offset()
Date:   Sat, 22 Apr 2023 03:08:36 +0300
Message-Id: <20230422000839.1921358-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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

Rework dpu_hw_sspp.c to access sblk base address directly rather than
getting the sblk address through indirect function call.

Dmitry Baryshkov (3):
  drm/msm/dpu: drop SSPP's SRC subblock
  drm/msm/dpu: access QSEED registers directly
  drm/msm/dpu: access CSC/CSC10 registers directly

 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   8 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  10 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 184 +++++++-----------
 3 files changed, 66 insertions(+), 136 deletions(-)

-- 
2.30.2

