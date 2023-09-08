Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 231E47980D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 05:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbjIHDFw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 23:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235743AbjIHDFn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 23:05:43 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452FD1BDA
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 20:05:24 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b974031aeaso28585281fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 20:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694142322; x=1694747122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5o+SPaUCffB9wFtrSLZVybbJbjD0ZXPNdB88Cfri9WY=;
        b=VMwruw+S9vVjiOos5CVmwTUcWhrJ5OjUa73kkf402lJOu+uGtcsFjcB45AHcwZPvBg
         k+Sd1sIecGpkviy7aBTbxhMo5wP+v1Rzpz1HlyzyPQ8I6Pb+NPmOT7leWiISCiU5Z96V
         tfhr7Ep8v1y7p7qFVq0Baw9IYpWSyN13Mmb0aOjiek6qUKliMokeBZjoMQbN2HafSzcW
         28i0rvml6aMZ/I6ofaV1FKK3maqX+IqSUTworXIZVD/dxb7A3wdPY0Ma/fWh5EwYAVpi
         jp2hvPsMzXnYQNbynmRBGwp3iLHva8/y1RN+1z7nnBeYt1M0HOcZxIjwHQleUZj7Fi4o
         8TJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694142322; x=1694747122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5o+SPaUCffB9wFtrSLZVybbJbjD0ZXPNdB88Cfri9WY=;
        b=n2KeO1mhgiWC4SCdIKj8eVU4bpwjEIRfGX49pDZRfQCWDcaGn2Yty4/Q8hEtASwxmi
         g+JqHN8aVFfCyjXURobokGOTOZKSzmDtpzlsnovvoNJppuhzvc8rIfV26YI8Ox0sWHJP
         coeP31BCpKhabFEGTgS/AIFASPg0FylBndDVNsYSnRQM1GV3i/ZWT0oB4UOccMuovH+R
         B4//U2bd7GXjBPhza1oVCa2IUEdq4lCjrajHv4pNnYhnVd1eMeVBLs1TRVbSGXDv/5Ms
         BBeiu9opchceYjIhQbpqB/kUAI8CMRtt8GU1dqJ7KxQE81CjER+MgjD0CVptFDvMZXO2
         kkNw==
X-Gm-Message-State: AOJu0YzrI9URlR+LgvjdtePcjcoqZ7v4BSAHR2IhO201VddeqYfKgPk5
        ISHcgbYRbWtO32ZfbJigf6mMGw==
X-Google-Smtp-Source: AGHT+IHGkh/WaT5fi2tv+g9ZoxjNNOQzvf8MVWos7gGhrta4aPejRWa4/qo9xN2YnHu/3XzvVEVFDg==
X-Received: by 2002:a2e:9012:0:b0:2bc:db5a:9540 with SMTP id h18-20020a2e9012000000b002bcdb5a9540mr646083ljg.42.1694142322434;
        Thu, 07 Sep 2023 20:05:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 20:05:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/5] drm/msm: cleanup private obj handling
Date:   Fri,  8 Sep 2023 06:05:16 +0300
Message-Id: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While debugging one of the features in DRM/MSM I noticed that MSM
subdrivers still wrap private object access with manual modeset locking.
Since commit b962a12050a3 ("drm/atomic: integrate modeset lock with
private objects") this is no longer required, as the DRM framework
handles private objects internally. Drop these custom locks, while also
cleaning up the surrounding code.

Dmitry Baryshkov (5):
  drm/atomic: add private obj state to state dump
  drm/msm/dpu: finalise global state object
  drm/msm/dpu: drop global_state_lock
  drm/msm/mdp5: migrate SMP dumping to using atomic_print_state
  drm/msm/mdp5: drop global_state_lock

 drivers/gpu/drm/drm_atomic.c             |  9 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 14 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  2 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 54 +++++-------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 12 +-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h |  4 +-
 8 files changed, 31 insertions(+), 66 deletions(-)

-- 
2.39.2

