Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A814708DC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 04:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjESCaR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 22:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjESCaQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 22:30:16 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0F3186
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:30:15 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ac735fee70so4284211fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684463413; x=1687055413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pj9i7TSBfCmQXvwdyG14BdtYQitwst+9y3+gcByW2D4=;
        b=NuwG2uPjamA6Yx0vJDLArcowBr4ZoSpGnYB9+jv/JCan6gx5QKwaE00loNgAjwRn2F
         H4yW+W96CcshJkTqxQavCiJ3qm8F0d1tlBoODob+MTYdazhASYurCy5uWpksGA4CXkbu
         CKjFtHRIdedDmJxfVK22AAydMOmDO6ouswHNJ03TZSWXJ8+xUHy6bSG4fsqVLYNx/S5y
         LsYQtUCH/H1cZXkQ0NptXtqJKbp1ZLW5dMTt1rvfhv93VD935e6snE7mf1W4rhzqwqjI
         Aok5kdiSP2FZt/HsnYL+1ZdqyNgUKTo2wTCnmIQC7CZjdQFV39uiJmhHEfPU8Ah0RLVS
         RwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684463413; x=1687055413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pj9i7TSBfCmQXvwdyG14BdtYQitwst+9y3+gcByW2D4=;
        b=ZnBJdo2Hm7GEuGLg2H//FFDNYJSA1pmQoUMFowOrw45hOk2kTAj4838l1hBl9PF+Ui
         FI19CAugU9XZs5bMkAGCpo6lcSYZeHZ8IKmESJUTweYQ4ObdnZQoRi5NI1JXnbelP5g+
         BYYsKV7kpy6S4EaE+21Civ7mBxaV2EeImgkWcpSVVajbJWKtJ/XjpyznS/5io64CZ+KI
         e2V8N4CMoaeS/SiZbGjjkFV/PvJevUD66m5l9C9eXwOCU5LXo1U17Nr8pIdxVAV0jtdt
         c1nNs2jKzBrFSa+YF8+j8/6sO7rk/j3MBcO7y6xnNzJfV8qh0kAYfzzDPpgC5K06ak7E
         dEMQ==
X-Gm-Message-State: AC+VfDwFEUxWdF5HmeQtcCokp4hxFTACVuKmIsfDLqv4ssXzx0kOCGzy
        NyMLcDAQtJFZ4G3UFN7TCtLzlA==
X-Google-Smtp-Source: ACHHUZ4oeJ5J16LVLCVISH6GDvEJK/vLNpUO437sEPnP1IpDfHiUbChHlbnBXJhiN3q9XOGwc7ugzQ==
X-Received: by 2002:a05:651c:33a:b0:2a8:ea26:5c72 with SMTP id b26-20020a05651c033a00b002a8ea265c72mr94875ljp.8.1684463413315;
        Thu, 18 May 2023 19:30:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t16-20020a2e9d10000000b002aa3ad9014asm573709lji.54.2023.05.18.19.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 19:30:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm/dpu: remove dpu_encoder_phys_ops::atomic_check()
Date:   Fri, 19 May 2023 05:30:09 +0300
Message-Id: <20230519023011.3837868-1-dmitry.baryshkov@linaro.org>
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

The writeback backend of the dpu_encoder is the only user of the
dpu_encoder_phys_ops::atomic_check() callback. Move corresponding code
to the DPU's drm_writeback_connector implementation (dpu_writeback.c)
and drop corresponding callback code.

Dependency chanin:
- https://patchwork.freedesktop.org/series/116851/
- https://patchwork.freedesktop.org/series/116615/
- https://patchwork.freedesktop.org/series/117148/
- https://patchwork.freedesktop.org/series/116530/
- https://patchwork.freedesktop.org/series/117150/

Dmitry Baryshkov (2):
  drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
  drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 15 -----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 --
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 54 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 57 ++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  3 +-
 6 files changed, 60 insertions(+), 77 deletions(-)

-- 
2.39.2

