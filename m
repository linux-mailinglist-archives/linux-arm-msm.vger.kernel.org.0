Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC702708DE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 04:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjESCjA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 22:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjESCi7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 22:38:59 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F9EE4D
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:38:58 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ac735fee70so4339391fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684463936; x=1687055936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hB8ttbepI7FxJGTYR5m6g7q7o+wcPnq3jGd8N1SpVCI=;
        b=VjfmbfbVfpbbbE3GuO+Zf+g5r78woNV9IpiPnccmMFoSwn4LBwoHwaDREb9ushjW4a
         mEIJRsGlSxhmgyFfrDeanBXRxkQrmwqVfnRuHGl7DaMLyzmN92Eoc6UztdV+KIeIYNCD
         FX3cfLLjm1n/wyIyxX5WfTT4dRZIS+qWspiF1P+b7uOoI7kT3tHoCfPl5LkkMYBYifQ3
         azGjaX14vVY8lLJyTwaZI05B5wWdVB4H6aPYv8e/bXTvCwi2o8FzPPaahi+vH+VBsycV
         ZHSk2pSuBtrrqMJhQn/xRyvErGri/M45E/RJQJeYmwKnNk4/foWyOXMOR4PQbUsnwNHb
         PEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684463936; x=1687055936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hB8ttbepI7FxJGTYR5m6g7q7o+wcPnq3jGd8N1SpVCI=;
        b=jC0YBsdcGEcJUdGMsQS3cgGj4hzUIhdNXTwWnHhL6xYZNy8yubItWLRVAA9NgNBlog
         FxmSGmh1Hs5JW5RKenqssKU3W05kCz9nK8UZBhvoe0n6tZK2FWUbvdHk7HIE1jXjBFbW
         r+apjixkMNvm2Z2yVegzh8UJjCdPPHnuW2/FsTY4UklMz3ZBUn29pqKk0v7uvn5HLjdV
         FJ7Mxn8gwdcwmvBGACi+SZp8X0BEfZ+Gm/2f5Y29LEznX8QTbUAcq1mq7IIDg/R5nw3s
         HUYOKsVCEaMWHKMSKWzoL8nlB9Wq3SNbDlg1j3rbQnZJINMyEYiL5Js6Ww9q7d3joNuA
         1BOg==
X-Gm-Message-State: AC+VfDz8KKUcLeCHu57dUQaqytusIB4Q121qxnONxmwIvhs8yP0HZFeF
        hoKmP/+hqPsv3A/FcWX9f9Ecmw==
X-Google-Smtp-Source: ACHHUZ5BnGhVzZ2iYRIc5cTse2COPb6iSeJskh97TwpEPM05paE6PQ4l4p042CJNRhdiesdH2TGB/A==
X-Received: by 2002:a05:651c:1693:b0:2af:2094:acdd with SMTP id bd19-20020a05651c169300b002af2094acddmr127190ljb.14.1684463936505;
        Thu, 18 May 2023 19:38:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 19:38:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/msm/dpu: simplify DPU encoder init
Date:   Fri, 19 May 2023 05:38:48 +0300
Message-Id: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
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

Rework dpu_encoder initialization code, simplifying calling sequences
and separating common init parts.

Changes since v1:
- Withdrawn two pathes for a later consideration
- Changed dpu_encoder_phys_init() to return void (Abhinav)
- Added small simplifications of dpu_encoder_phys_cmd_init() and
  dpu_encoder_phys_wb_init()

Dmitry Baryshkov (7):
  drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
  drm/msm/dpu: separate common function to init physical encoder
  drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
  drm/msm/dpu: inline dpu_encoder_get_wb()
  drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
  drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
  drm/msm/dpu: simplify dpu_encoder_phys_wb_init()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178 ++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
 7 files changed, 140 insertions(+), 243 deletions(-)

-- 
2.39.2

