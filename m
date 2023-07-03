Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B44A2745323
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 02:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjGCAa5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 20:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGCAa4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 20:30:56 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04211BC
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 17:30:54 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f86e6e4038so4833643e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 17:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688344253; x=1690936253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJANRZZIMK5svQNtmMZaMEVV9+AxVN0XsGlXd86Z6IE=;
        b=xc+e9mOdZ3GtvhvAJ/fseS93Odalh8jT60krEfKtrAVCeNqCSk/ceK8qirWlvI6wv0
         cJ0LcVsOniMldBihBqL2NY/2CQ1To0WksFiL1NjvG9Am86vzYYMNZz4/IDKYzxkQ6DMx
         J24DBuV18t2C7V2dxuUCxKF4uO55oHVNvlhw6YdKYekpNmAzypLfFqjEiu/+S23dUBYB
         V2CxytmdXN27tg47sRo+nOD0cOtXjDeP6g4ePi4HdASwhUOjJSVzyWG8QRYCrTU6K5C9
         OWM86FxLuG0DP5N+YD2bLln1kopWMNPdyh1f3ehzBF8GXk0QZGim8kxk5hx20O9R2gcs
         FoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688344253; x=1690936253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJANRZZIMK5svQNtmMZaMEVV9+AxVN0XsGlXd86Z6IE=;
        b=L9UC6r8sc/WOotnmdPA/cT+DYC/oGqXvmsvG48QOC9/hqukr0BzmR3IbxVWth/Z0c5
         7z6gQKxxsxILLqrdvpwdLagB4D2xLgfvx92XscHgOvby2S5FBUJjA1wyGVGok1HYtoqL
         2Pk8Xbt0H41ZR+DnQcE/hyNQaSY5ADzEazVfwU3imBj86/WyA9qd56nLmyPX6DAPb83P
         5mb7ywRWaZMH1bwJVLlyfAw+hk5jChQueFgpiYgWyPSQnkAHyzFXnNPmhPHuW/YPE5Ny
         CAxhVvfnffNvJFSnPYGKGd7HLTXpcJFvVa/HrE8cINnDWaTOW6aVdYU3IzfieOFKYBXf
         pGYQ==
X-Gm-Message-State: AC+VfDzHPqI91fzTHVIUTwc83ukfyJj004PhtbMuuyuu68peSY1cIDeg
        QGXBOoRV7IpGfkb9SLBLQho+dw==
X-Google-Smtp-Source: ACHHUZ4Ohf808GKFowwML3dOzTbtjZyzqRUDdk6LA3Aku3BokN9EK06I6ub/a5yV3idfclvqCZKOcg==
X-Received: by 2002:a05:6512:31d4:b0:4f8:5e4e:52ad with SMTP id j20-20020a05651231d400b004f85e4e52admr4152153lfe.23.1688344253120;
        Sun, 02 Jul 2023 17:30:53 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id n2-20020ac24902000000b004fbb1bc1ae0sm558842lfi.163.2023.07.02.17.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 17:30:52 -0700 (PDT)
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
Subject: [PATCH v3 0/4] drm/msm: move resource allocation to the _probe function
Date:   Mon,  3 Jul 2023 03:30:47 +0300
Message-Id: <20230703003051.33361-1-dmitry.baryshkov@linaro.org>
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

This patchset was left untouched for almost a year. Let's reiterate it
in attempt to solve the long-standing issue.

As discussed several times on IRC, move display subdriver resource
allocation from kms_init to probe time to let it bail early.

Changes since v2:
- Move even more resource allocation in the DPU init path.

Changes since v1:
- Dropped the applied patch
- Picked in the patch to pass msm_kms pointer via msm_drv_probe()

Dmitry Baryshkov (4):
  drm/msm: allow passing struct msm_kms to msm_drv_probe()
  drm/msm/dpu: move resource allocation to the _probe function
  drm/msm/mdp4: move resource allocation to the _probe function
  drm/msm/mdp5: move resource allocation to the _probe function

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 121 ++++++++++++-----------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 ++++++++++----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 +++++++++----------
 drivers/gpu/drm/msm/msm_drv.c            |   6 +-
 drivers/gpu/drm/msm/msm_drv.h            |   3 +-
 5 files changed, 162 insertions(+), 175 deletions(-)

-- 
2.39.2

