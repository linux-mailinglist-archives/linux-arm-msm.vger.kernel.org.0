Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC594F5602
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240755AbiDFFij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449306AbiDFCuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 22:50:12 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5747FE438E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:51:02 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id p15so1179803lfk.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7YSYDjPb6rkMrUy2ND+BWShKjgnutY8vFHmoniTCXNs=;
        b=oUMaw5vOO5xHZB0ujTF7+xO0htbaaZj1/WNJHYE/P8urqcDn2s8bz79kbFXcBeqLce
         biHoxfW5KopBRgHA3vrpXUrOowoFXtet80WKRIYEIOZAYtJRwOJGoOTrNLrY1/RXGEJB
         K/TKHAS2vmENqVrWHtE5C/BLrUtLrMYZVDKbs9D4BgKh88mkYA5sD1L2i+HpbvIUu4KA
         gUlBmMfxjyStiQxUExiGY8if4v7i0Yr9xOxtaM9qZmE5+2Jfb5jrSHoqy3opx53MDnl+
         fLMi8dkd2QV7voWs6Gslw1sUGRBd5Urcrl04hj8ts+xa+E1Nmm+CV6He5lilj6opmzs3
         3T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7YSYDjPb6rkMrUy2ND+BWShKjgnutY8vFHmoniTCXNs=;
        b=gVrnwoJkViW/Iwp3g9vtld3Wz4CB6zC+f+u3cs6caeH45jByRRWatBsHp8JAtUQ8Kw
         ThHPXr/wmX8HmHlb4ncCJlWSLm8+CnxQ6iVRGx1ZzRagr6hS4g6oOYrOf7G1P4+WrOLM
         x6Vhroz8o28WSrO9uEOc8NS2uJYVe2zaMUJWCL9GL9DXMKQkT0eXW4e4rH088aW/GWUI
         BIR3WRyNVTXcffDMFukup0iMzjljBR9Wm66CwG6tEkz74Jipud+H0M3xjkc/H+8v7xcU
         gRi24mTmyU9uV8/6ToMSNFflch0sc1TubeTrjrYcttoCeJA6txbOIvmH07VehxyN4GLO
         yL2Q==
X-Gm-Message-State: AOAM530LABNkXO0pOSCRTHAmU7uCrrD2tj8p4VTtCG2j2tY4OUnJkL1c
        2gJhp3nKAw6pfhZgBhiRP9i4QA==
X-Google-Smtp-Source: ABdhPJzNHlLedXR6pzP6xqaOfB82l/XCYzRdWX7WDvO/+hf1SMfxV98iC7FNMSzXJUdhbhpipNuK5w==
X-Received: by 2002:a05:6512:22cd:b0:44a:6d2c:8b9f with SMTP id g13-20020a05651222cd00b0044a6d2c8b9fmr4189272lfu.142.1649202660661;
        Tue, 05 Apr 2022 16:51:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f26-20020a19381a000000b0044ad7a29b4csm1645280lfa.37.2022.04.05.16.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:51:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: remove DRM mode setting object arrays
Date:   Wed,  6 Apr 2022 02:50:56 +0300
Message-Id: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
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

MSM DRM driver stores connectors, encoders and planes in the arrays
inside struct msm_drm_private. They are not really necessary, as
drm_devices also references lists of these objects. Drop private arrays
and use drm_mode_foo() macros.

Note, the crtc array is kept intact as it is used in vblank handling
code. Maybe it can be dropped later, but it would be a separate
intrusive change.

Dmitry Baryshkov (3):
  drm/msm/dpu: remove manual destruction of DRM objects
  drm/msm: loop over encoders using drm_for_each_encoder()
  drm/msm: don't store created planes, connectors and encoders

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 50 ++++++------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  7 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++----
 drivers/gpu/drm/msm/dp/dp_display.c      |  2 -
 drivers/gpu/drm/msm/dsi/dsi.c            |  1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  1 -
 drivers/gpu/drm/msm/msm_drv.h            |  9 -----
 7 files changed, 20 insertions(+), 67 deletions(-)

-- 
2.35.1

