Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1BE4F5FE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 15:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbiDFNXZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 09:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233428AbiDFNWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 09:22:40 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2D163E00C
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 03:13:29 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id e16so3165053lfc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 03:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WNQASTvlLKNLD8hR/6/xkEqB3XhYihaOxq6BEyH/MZ0=;
        b=atuQiS5mxF0A6lAnssEBE+S1ASxnrBGHcRwSnMFpHRoBjSDhVfRkxwwRzVahRjk6Kd
         CYfKax7GiZwt/dT34ce2PxX97U9vax8orJomtkNh08SW0wwrRG9LNBHSPcKvp90QE/Nu
         OA7CNTWDuS/A1FhFLqkjMNGp0zo1iNOvsIjISChvcphencilmMlHA27gioK6FaMYevRk
         yxaHouk9KZE9tq3cIqnCJAKdIPmxzOlefnfXq7Poxyu06lnvbaTb78z3qv/JUR7v439w
         O+LEn93cnx88bt4nUAkM73TEzkOmEBf38fFE3WGvi/XRZzhw3QHaJ1WY/qy94YChmR2O
         9sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WNQASTvlLKNLD8hR/6/xkEqB3XhYihaOxq6BEyH/MZ0=;
        b=pkbRSS9JFR2Ax74CRe4sB8MWnidMQW9ICcncSA7izdZXjun2Etb2GKsJOzfuZQyGk+
         ULmhbQDBqIfORRSchaylAy7AGFUSo86PyyuVo1ZXkRMtaDmS3zQ2CRy4aKekn/vxxrTG
         fML9QNcXkkEVsC0KzCTjgOPD5N84La8qldOo70Gi2EyROAyWtaJFEK+KSJQyR3oOq88M
         C7ehXnZuMGF8DdHmfMXZNsUbuUGd6AFl79pvGHrj+Ajvb0W1AJuPGvoXs5XWytLL72Sd
         yG0znm5vSM7ObrNzwOVwQ7T8fmRTur7iXM1mtAdsY1qwZwVpZyEoSwM6/g7px9d+U64O
         kulw==
X-Gm-Message-State: AOAM533l91cHCos6eLtdLj+EMSvfGOxzXVWLOH6YjLTOsx0S3cG4fOfP
        xLWvWkImp0qOTJ83gPqGavn/oQ==
X-Google-Smtp-Source: ABdhPJzX2vCNyl1ZY1jdgUYMJAG16UJYPGAkYgC0AA1daRXryqUe34e942NN/QJZfTZ+Xv4ynJbxhg==
X-Received: by 2002:a05:6512:10c3:b0:45c:d26a:d5e with SMTP id k3-20020a05651210c300b0045cd26a0d5emr5470082lfg.296.1649239969045;
        Wed, 06 Apr 2022 03:12:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i4-20020a056512340400b0044a310f72f6sm1782154lfr.250.2022.04.06.03.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 03:12:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/msm: remove DRM mode setting object arrays
Date:   Wed,  6 Apr 2022 13:12:44 +0300
Message-Id: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:
- Also drop MAX_PLANES/MAX_ENCODERS/MAX_CONNECTORS defines (as suggested
  by Stephen)

Dmitry Baryshkov (3):
  drm/msm/dpu: remove manual destruction of DRM objects
  drm/msm: loop over encoders using drm_for_each_encoder()
  drm/msm: don't store created planes, connectors and encoders

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 51 ++++++------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  7 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++----
 drivers/gpu/drm/msm/dp/dp_display.c      |  2 -
 drivers/gpu/drm/msm/dsi/dsi.c            |  1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  1 -
 drivers/gpu/drm/msm/msm_drv.h            | 12 ------
 7 files changed, 21 insertions(+), 70 deletions(-)

-- 
2.35.1

