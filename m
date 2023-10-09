Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A285A7BE897
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346516AbjJIRsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345624AbjJIRso (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:48:44 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB87A91
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:48:42 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50573e85ee0so5675356e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696873721; x=1697478521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=whR2x5YTc5W5ULa/RDQrnsqcM0SLXmEDPcz8d+26mOg=;
        b=lISEbKp4FokNVpOiFRBI/29FMvQDHfIPuOUMpDJcIotGp4bM/ZkOxxsXO6/3pPNTh1
         a0ut2/TDj5nYfx6lyScLqt+EabZTEtsFuVmQdvHLzSYNhVvQNwf/P5MoOGKk5Qf/Igcf
         9rqmEr8bECtOQg5bsHD+Tsp+Nh1USY01KTy2nUqC/C9ytaommZOBE59eGEX7Wt/q/O8d
         8ANCEGyteluCNAdC0ISZMzjDUc4BaslqOrmeB8rYGKwARJkCLBcjD73dN3d7bB+hYQbY
         Gc4IWJEM80ECg2Akg9G2d+lfJ69v0NqWb0PbRGo9WwGbG6E9rGbXK/M/pH58L5rIfNUK
         z97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696873721; x=1697478521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whR2x5YTc5W5ULa/RDQrnsqcM0SLXmEDPcz8d+26mOg=;
        b=ZVZt9MDbI+JGNjiJKa9+b+mYhOFCbn7nqhgDIETDgFZPacNXIKkz0s6n7GVZYtd0eP
         HWuD9hhuIjFL2uhT8QM60pfX7jn9ZIJHaeOAwbjQ75Nay4lNU9VFRt7ivhbHSYM5BG7z
         0Wx79vBizBEyZ8kOpTT8jil+M7RAz0JA4xROITtOndnn1mI2J+OYVOmXOqWi/clMgDBH
         tkHyYx99zwlzjsmdDoAqldHoaW+x9U42h518U27btpnXVDZ0LUP3LRHtN+VfgcpN6ppV
         UmWturmpSug6DwdIdJxHlPpT98Jnv0NGJusT9i9DN2gw626X/KU7SWV7gjMdQkBHAMoJ
         PUGg==
X-Gm-Message-State: AOJu0YwS3GYhkhsvcyR14Raw+nADYpmiYA6A1M/RTwDFa3n+CJ3gcR9J
        mjUE4AvrzJDfA1Nv2ufd4aB7TA==
X-Google-Smtp-Source: AGHT+IGJRYzL4TFWAFMcnCUoJCkAVzT4yFW+6pQnDo33c0W418pDuB3BkkVOKKQC1S5ZvPD3jV8Xqg==
X-Received: by 2002:a19:380b:0:b0:503:2681:77e3 with SMTP id f11-20020a19380b000000b00503268177e3mr12203622lfa.24.1696873721162;
        Mon, 09 Oct 2023 10:48:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24257000000b0050420eff124sm1495927lfl.152.2023.10.09.10.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:48:40 -0700 (PDT)
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
Subject: [PATCH v5 0/4] drm/msm: move resource allocation to the _probe function
Date:   Mon,  9 Oct 2023 20:48:36 +0300
Message-Id: <20231009174840.2726861-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset was left untouched for almost a year. Let's reiterate it
in attempt to solve the long-standing issue.

As discussed several times on IRC, move display subdriver resource
allocation from kms_init to probe time to let it bail early.

Changes since v4:
- Rebased on top of linux-next

Changes since v3:
- Fixed MMIO unmaping in the DPU case.

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

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 133 +++++++++++------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 106 +++++++++---------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++---------
 drivers/gpu/drm/msm/msm_drv.c            |   6 +-
 drivers/gpu/drm/msm/msm_drv.h            |   3 +-
 5 files changed, 162 insertions(+), 186 deletions(-)

-- 
2.39.2

