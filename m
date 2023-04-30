Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2046F2AA6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Apr 2023 22:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjD3UgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 16:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjD3UgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 16:36:01 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9F6C1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:35:59 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4edcc885d8fso2315070e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682886958; x=1685478958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wHm4YQoUofQiTjhT70T+V8A+AOnK8cLSZsYSqcgfAFc=;
        b=b13gGh/IdYRhF8N0/ngxwbhkC/rkyBSdidkZm133Ux2/SKVL/0CmOtyQ0k4lgv6EBn
         xSUllTTqFzapOOxUATHCEmHqyz0wbi88nLAxrIgTzirfOUdOcH3tcq5tl1wV8bEouc8A
         ytKcSslF2v6C41R3GpLlyWnahUK5MvqzYx6ozGzpYnTi1485Fd10Ans9dNApdTrPyf9G
         dapx9LCaqwOnEvbVk4Y4V9AjaDbIZE3HWJx0EHPFr62g1YiB6+XxISQKKh9RL2Qsk0lZ
         n3098JkuBJFlRWR3gxIQvx5IyYhGnQsyKmYwuwqxDAxANRBJgKdQ6jKWFgl6WCk46SYK
         BVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682886958; x=1685478958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHm4YQoUofQiTjhT70T+V8A+AOnK8cLSZsYSqcgfAFc=;
        b=BLWCJxKOSEEtqACxhQRApe51ItFz2BYrg+4Jrq//39veIe0xM3ogHA9+zln1pdHbuq
         pVdOuEGIVCTV14J2qoNMFsJxpC78cI0S+ECkVe0uTt8Q7ApA6nOwZVo5dQqMvvt8aVr1
         PwgalSjKdoNQMLpmi5try1x6kK7UGi0Z9EgpkKj6+bgHNH1E+X/3qYRyr236ett98E9u
         NSax9Bx1pUdn0citfZk8G6BVCCWI1v/kq/dCPuOlM+HkAmiMb/I1idtB90pl83Yo7aoA
         xUCelPUfbco4L0MQwQ37uTuB7Fqns95mmLyQRaUBD+7OgqCO0k9+ydGJiXu+B+UT+YVK
         ph3A==
X-Gm-Message-State: AC+VfDwfm9MlP1DmjQTntoHpRyxpMd+3m4JUe/peNvI2rqLFem4/GDPv
        qWLpcdQApuluI0LI/kedal4+jQ==
X-Google-Smtp-Source: ACHHUZ7ajIaCaDx8E/n0HBrHerHj1ZEqCZlCY4XmdMIYYb0aCufR12WEAo03BgpZAvJCXKZBF3aveA==
X-Received: by 2002:ac2:41cb:0:b0:4ec:4c2f:1c85 with SMTP id d11-20020ac241cb000000b004ec4c2f1c85mr3142739lfi.31.1682886958156;
        Sun, 30 Apr 2023 13:35:58 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b24-20020ac247f8000000b004edd4d1e55dsm4324634lfp.284.2023.04.30.13.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 13:35:57 -0700 (PDT)
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
Subject: [PATCH 0/4] drm/msm/dpu: simplity RM code
Date:   Sun, 30 Apr 2023 23:35:52 +0300
Message-Id: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
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

Implement several small simplifications for the DPU resource manager.
First two patches were suggested by Marijn.

Dmitry Baryshkov (4):
  drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR during DSC init
  drm/msm/dpu: remove futile checks from dpu_rm_init()
  drm/msm/dpu: use PINGPONG_NONE for LMs with no PP attached
  drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  4 +-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  5 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 41 +------------------
 5 files changed, 12 insertions(+), 45 deletions(-)

-- 
2.39.2

