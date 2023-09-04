Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8B6790FB9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 03:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238002AbjIDBxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 21:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237008AbjIDBxp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 21:53:45 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3421BE7
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 18:53:41 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bceca8a41aso13083071fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 18:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693792419; x=1694397219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dy2kbeuiRBdiBUHn2uNtKw0zEJJVCb8NdeL9BezpnxE=;
        b=QXwAVku7OtIQ8lBKmIM5JR+cTZrppIkipVwUaHV6H4uZ8R4hLMS3JyjREPqfPaXb+a
         KCRwNVNc9Fg74VwXkG1kZluf3cklNuM/Y522WrHdyj0l2lrepku4rGTyuuuexeQpEKZk
         MYNu8C2htSKPlwELSuDbhfqBZ7PThtPCbVKZsa+DjlWBUqCyTyvD0t2J6BYcAdOhkbGK
         WH4eW5XLixIkPqyl4t7/HOZuAXDJftxIjl8gTjeh+hX7F6Kto2lvFxx9/OUbtnfh5Jvz
         Howd4xhGDAwu2ndHMqU9/mmP3QZ/OkarnKOJ9lln2zk3q6qSA2lQLOQCGsvkTvRFc3bZ
         G8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693792419; x=1694397219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dy2kbeuiRBdiBUHn2uNtKw0zEJJVCb8NdeL9BezpnxE=;
        b=CZoiyJ0xjS8JZcUJRDkUSMNrDEUqMDRas7br8ArFSgMfmj/85YRrlXWPuD/iIyrbcL
         9hZqOOs9YYMyzNXlwPuyhgjPNWWZ9XjF4hSL3jEtxTA/+CKTPU84GYh3GFiEcLZi5BC4
         8dQdku9/RV53KIUXN2qHvRVbZ6L03MNUJZoXYhZXAmy5+n6JfcWvaKO5M3dwZjxbFsTM
         P4ruvXKOjJ9LbuH1ZyfI+IOc6sfjc3akOwv2JrWhDh54NvY7zEK4mI6/mdvh5kKlNaHm
         jBGngkalfnl26dwdmqmnHyo7Z9SmcejWFvNBgsf0hNm+IBoCkeTbjq6L1jQ5vuIelgr4
         B8Zg==
X-Gm-Message-State: AOJu0YwLYC5pApSAI7ISEgoChSttX/nzgfB2g3n1xPVzFclKCEq05q1C
        oHPxAENW15c7aEhCOTNdU0BMIg==
X-Google-Smtp-Source: AGHT+IEr0RCH4tYSkpwLMyNrd6sFeVftt2qeSJkJg6rBPTOdgqkf2WJkV6CnkFDa+VVNamWPRzGQhQ==
X-Received: by 2002:a2e:7812:0:b0:2bc:fb79:d165 with SMTP id t18-20020a2e7812000000b002bcfb79d165mr6335992ljc.39.1693792419380;
        Sun, 03 Sep 2023 18:53:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o14-20020a2e9b4e000000b002b6d68b520esm1736657ljj.65.2023.09.03.18.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 18:53:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm: introduce per-encoder debugfs directory
Date:   Mon,  4 Sep 2023 04:53:35 +0300
Message-Id: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
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

Each of connectors and CRTCs used by the DRM device provides debugfs
directory, which is used by several standard debugfs files and can
further be extended by the driver. Add such generic debugfs directories
for encoder. As a showcase for this dir, migrate `bridge_chains' debugfs
file (which contains per-encoder data) and MSM custom encoder status to
this new debugfs directory.

Dmitry Baryshkov (3):
  drm/encoder: register per-encoder debugfs dir
  drm/bridge: migrate bridge_chains to per-encoder file
  drm/msm/dpu: move encoder status to standard encoder debugfs dir

 drivers/gpu/drm/drm_bridge.c                | 44 --------------
 drivers/gpu/drm/drm_debugfs.c               | 64 ++++++++++++++++++++-
 drivers/gpu/drm/drm_encoder.c               |  4 ++
 drivers/gpu/drm/drm_internal.h              |  9 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 ++-------------
 include/drm/drm_bridge.h                    |  2 -
 include/drm/drm_encoder.h                   | 16 +++++-
 7 files changed, 95 insertions(+), 89 deletions(-)

-- 
2.39.2

