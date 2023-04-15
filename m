Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9164F6E32D7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Apr 2023 19:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjDORTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Apr 2023 13:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjDORTa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Apr 2023 13:19:30 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECE32102
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Apr 2023 10:19:29 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2a8aea2a654so4548131fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Apr 2023 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681579167; x=1684171167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4nST20IPKOcYwIOfUgXQCsK+huSDja+HNRFSncxwf0=;
        b=LgKEaTXc6OQ5SGY4uM0igrni/yv0F72lQYofAl2Jcwh6IQk4EoQIBACu1lv6nrg0oY
         0Vj6Q1gZ21Us7Yc7Mo2cU6MGBMIqILgC+3MVPYw0ztSlfrQirLp5A+Qb6OXqBDRopNEv
         gaeRI3au41K4XeucsIpCmnmPCkPX0X0K9eyNwL0mKyWc3E4gYQnfLshInMAI9zqadQA8
         YBKMK37nlD+9uFH/WFHETV4tMKtZ7AKMu950fXiVt8bXo4P54Yp0xCQuSqwqpxXtmdN3
         UylZFec81EPEBAiZ9LN/f7yLcuPtVK5FF81VW1W1JpbZ3nOuQFyGLapHBhETHbQ4oFUK
         fJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681579167; x=1684171167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4nST20IPKOcYwIOfUgXQCsK+huSDja+HNRFSncxwf0=;
        b=DkxQd/4qN9KCW34EHI+fFXu4mlermIJAIjc3H81+sUiO/HLLEI0uYOsR6QvAY089Dt
         JOoTBHfUg81mjbhxDiJch59TbyoiRlkkIY//Dd5TP/tOz2cpchlUDf1Mz32MW7fGKt/2
         w9HlNehwrTO3t6uKE3AGngOv7YMfTJXirxc2fwVZQc758ekvySK+2avaSYGJeYs4AcoF
         idG/nB+FmoM0cXOkWYMsRpLb0YPKhyakPrsU5yEPc1RPEcZZmJKVWQzmRXPu9A6t+IAW
         5qw+aHPdBxyh1TPmH+uNKxumowl7mXWXKde57xS29SHg8AbOlk9ZbDWIQtjBoZb5EgK8
         GJMA==
X-Gm-Message-State: AAQBX9d3jFVhiINyI8zSYsjFo6r2toG6pPwLYdsDK3fpNt8c2BXP6nFh
        uvsSLVTs+N9WC4X1Lxpst+m1wRoAWieqAiYWIzo=
X-Google-Smtp-Source: AKy350YXm6X841XzMI02HB2vU2HU4LiEUQIdFGYoiHVC1a+x3tyGIIwXZM3o79RTKkgXnv6Rafv5OQ==
X-Received: by 2002:ac2:5390:0:b0:4e8:3d24:de6f with SMTP id g16-20020ac25390000000b004e83d24de6fmr677665lfh.14.1681579167425;
        Sat, 15 Apr 2023 10:19:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512096400b004ebae99cc1dsm1355834lft.159.2023.04.15.10.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 10:19:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm/dpu: enable INTF_HDMI support
Date:   Sat, 15 Apr 2023 20:19:24 +0300
Message-Id: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since msm8998 and older platforms (wip) support INTF_HDMI, extend DPU
driver to support HDMI output. First patch was submitted about a year
ago, but received some pushback ([1], [2]). However it becomes
absolutely required to properly support INTF_HDMI as both HDMI and DP
should use DRM_MODE_ENCODER_TMDS for encoder_type. Thus dpu_encoder can
not make a difference between HDMI and DP outputs (however they require
different handling).

[1] https://patchwork.freedesktop.org/patch/473871/
[2] https://patchwork.freedesktop.org/patch/474271/

Dmitry Baryshkov (2):
  drm/msm/dpu: simplify intf allocation code
  drm/msm/dpu: add HDMI output support

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 39 ++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 51 +++++++++++++++++++--
 3 files changed, 63 insertions(+), 31 deletions(-)

-- 
2.30.2

