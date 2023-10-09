Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F02147BEA0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378115AbjJISuy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377520AbjJISuw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:50:52 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65CD49C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:50:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50573e85ee0so5746888e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696877449; x=1697482249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=slmO4xUHNmPhnYDTbWl3Wo5De7S89LXSHwl13Zbo/KM=;
        b=y3vdtL8GqzxrPBu4wafWZysGVevAcQSJZleXQf+wfy3lBQq41SIUztsj/LHL5Z2l+T
         T9zvutTrhit9xnyZWDtkQr6vHSwoch2XHdN/CkyaCRlLy97YUh4hRN8uleQzkeC6Wu4P
         20PElGEoQNhOrQpOv5VE2njdo0J84BJKUPnP4X3VRFW1FYGhRWfz173LBGiFsC1up1/T
         xDPb+74G0ieXS0VDyFKd/AjWqC4rDuELBopwtK8rpLayS4U2pFCZLGSb2LOj0o7i+Y4u
         BQ5ApbX/WFLl0peB3drH5MzVEA897jQjwhEmZ2l3B91nnU8LfIqB735O5rglMvZFaCgt
         pBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696877449; x=1697482249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slmO4xUHNmPhnYDTbWl3Wo5De7S89LXSHwl13Zbo/KM=;
        b=pXuj3HMOKjhrJ9FSyEPEdFMJvCwu9h/zZCADqIGfMzJU7SuxR6EsLCe60IBAJ1uVz/
         4YM8SafhWonDtTrrShj+H9NdOVNGa1A5ufMnGzooix/LOJFPDkvBnEtrhdewZmBjUejq
         UcrBc3JH1nIqgWCbdO3ZVpTsjIKgSv7xpYnvYCtz7Nb48MXEp70PA9NUywyiwTIDFOXc
         pJkTDfn94UJUglSSUYYPAl+o4WrrRtbQy7EsvrVN10SoCbJUZylv7b0WMAo8fRwgmodi
         UQX/92aBgRAGAPdE9NqrBiFiO/OA5nt5wOsdpIwZHq+oVGujCgQHPlWXysPB8LZJpVvI
         hnBA==
X-Gm-Message-State: AOJu0YwpQVuDsX2YqJd2mwLfis6NPjf9o3eUiQkSgKes9n1L9FMP6d0q
        aPGc+sLuxZxyb3u2//+psfNhVw==
X-Google-Smtp-Source: AGHT+IHDJCsYlgFmsZsx0zm/DUdvCByNHIvnK0GLgP9SCszDGfUpRsPkhhEG6OZiSxjvTkmGv18DRA==
X-Received: by 2002:a05:6512:3b9a:b0:503:18c5:6833 with SMTP id g26-20020a0565123b9a00b0050318c56833mr17763900lfv.61.1696877449613;
        Mon, 09 Oct 2023 11:50:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u7-20020a056512040700b00501ce0cacb6sm1529262lfk.188.2023.10.09.11.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:50:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm: introduce per-encoder debugfs directory
Date:   Mon,  9 Oct 2023 21:50:45 +0300
Message-Id: <20231009185048.2758954-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:
- Brought back drm_printer usage to bridges_show (Tomi Valkeinen)
- Updated the drm/bridge commit message to reflect format changes (Tomi
  Valkeinen)

Dmitry Baryshkov (3):
  drm/encoder: register per-encoder debugfs dir
  drm/bridge: migrate bridge_chains to per-encoder file
  drm/msm/dpu: move encoder status to standard encoder debugfs dir

 drivers/gpu/drm/drm_bridge.c                | 44 --------------
 drivers/gpu/drm/drm_debugfs.c               | 65 ++++++++++++++++++++-
 drivers/gpu/drm/drm_encoder.c               |  4 ++
 drivers/gpu/drm/drm_internal.h              |  9 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 ++------------
 include/drm/drm_bridge.h                    |  2 -
 include/drm/drm_encoder.h                   | 16 ++++-
 7 files changed, 96 insertions(+), 89 deletions(-)

-- 
2.39.2

