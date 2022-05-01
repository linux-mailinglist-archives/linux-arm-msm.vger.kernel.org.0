Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF38516391
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 12:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243325AbiEAKNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 06:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242720AbiEAKNw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 06:13:52 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B8C5FA8
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 03:10:25 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id n14so20912903lfu.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 03:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G27wgdd/ZwvOWQ526mQM89rV7+V8FgRW2sR7NATsocw=;
        b=kU7AbjSRYqZGWt/IVMwirjrR6WpiCwboMH7bfBW5Rbpiby5hLkOivzIvjZ48wggzwm
         6AIffeWAwUsAeYXghedDZ9aAo0r6mXKoIv5vT6MpGL1TR45V9yNW12ayqvq24ZeZ2vEq
         sJHCqB06x+AJ4oaxHOJ1YNP8CIYuPTSUioee+YWuvYHyC2flphjSGKyzBu2cvxs6DpoT
         Vt0veVNY19khJQrPMl2Bo+eZFMBgq4btzYntwMjbIf9SJdXo6Bf6SiL+RynUYXjIaONu
         Dcp85ceB/yXnWmwQ7NjTbd7QlzulLQNZ0bOgB64mY8a7wQvRrqPidA5yZxSmNUgYSE2d
         BOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G27wgdd/ZwvOWQ526mQM89rV7+V8FgRW2sR7NATsocw=;
        b=SRwj7MeN+IC9WzYKSMr5pTrSL2W0DlAJp0cOOqn/bqEsjLsSzPkHSyat25mJCluTDO
         RtM9b7LuJFqfHW/NI9ElDP9W3vsByOWK7o90ry+vkPilzc5eDFA7n0iTRYMPItQipjJL
         C3GQEHarp3O8X+QWY++hcX9N0s1CYaVWlJEmU27qnzvRhqrI3DZ7nYk3uHyqLAP7A3Ot
         itrwLCxk23wS6cpBdz5ngtQen+Joh89QB7fAaaXZuRIdMFGFJwu1FyT6D8YuOzqLUHrw
         /t1UF1virkyaqRG/ouBjeKjxcmJBjGAxlaw7EOovNoXRlOg25o6O0L8EjZbVH96UVOn3
         U3lQ==
X-Gm-Message-State: AOAM530uAj/56cA51pErdHQI8BUfppCtP9wcwI1ZedBQwfVs8NfIt241
        olD633WZBILM2OS5/L9nuCnUbA==
X-Google-Smtp-Source: ABdhPJxrVlSOlP2q+CFvx6DhukQA7dZ/3Eu8p4Ke5TIuXemYFkOZUSArjyxTEullMVARludl7N4Igw==
X-Received: by 2002:a05:6512:3e13:b0:471:f6a9:85d3 with SMTP id i19-20020a0565123e1300b00471f6a985d3mr5796824lfv.120.1651399823711;
        Sun, 01 May 2022 03:10:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h7-20020a2ea487000000b0024f3d1dae7csm766412lji.4.2022.05.01.03.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 03:10:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 0/3] drm/msm: fixes for KMS iommu handling
Date:   Sun,  1 May 2022 13:10:19 +0300
Message-Id: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
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

This series started from the applied and then reverted [2] patch by
Robin Murphy [1]. After the MDSS rework [3] has landed it is now
possible to reapply the extended version of the original patch. While we
are at it, also rework the IOMMU init code for DPU and MDP5 drivers.

For MDP5 this moves iommu_domain_alloc() call and removes struct
mdp5_cfg_platform remains.

For DPU this allows specifying the iommus = <...> either in the DPU
device (like all DPU devices do) or in the MDSS device (like MDP5
devices do).

[1] https://patchwork.freedesktop.org/patch/480707/
[2] https://patchwork.freedesktop.org/patch/482453/
[3] https://patchwork.freedesktop.org/series/98525/

Dmitry Baryshkov (3):
  drm/msm/dpu: check both DPU and MDSS devices for the IOMMU
  drm/msm/mdp5: move iommu_domain_alloc() call close to its usage
  drm/msm: Stop using iommu_present()

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 14 +++++++++++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 ----------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  6 ------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  6 ++++--
 drivers/gpu/drm/msm/msm_drv.c            | 10 ++++++++--
 5 files changed, 23 insertions(+), 29 deletions(-)

-- 
2.35.1
