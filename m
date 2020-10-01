Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF9827F6B9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 02:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732121AbgJAA2t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 20:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730707AbgJAA2t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 20:28:49 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216A7C0613D0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 17:28:48 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id v123so3575108qkd.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 17:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KfbeZ1InQAwZth4mJ7971yKIR8SQx6BQ7+DGpeWilgg=;
        b=X2OaIXnpxWi1p8YsjA3OZDjXABig1sqic6dMuCMEdOXQinJRdlMgH5OIsMXjc7k4GF
         6XzFdIZSUOvzN40OsADAZKOHsev3QLew1RHkhw3EjdGyefyecLaXTtmHgeIIZ15XZ593
         YmNIHkyK2hF683R11QO0PLgqIXWZ7UbPZuoru916rGemu5wboNogkzooFKN5wnInPWzL
         3Wb008S1DiaEFNcTpPKTL+STdrTbka9M49qPFxH334BbmoU7wdSpBvOhqPQ4mz/SkkCC
         1hU3XT8nI+FT8A/3xhCq7yCjLoqRoItLMCKwc/f/tBcmJpaA2bpnKdh+497yWohkJgvN
         HjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KfbeZ1InQAwZth4mJ7971yKIR8SQx6BQ7+DGpeWilgg=;
        b=U8/l1HemF7TaOQuDvVx6PJxOpNzzDMleR5g+qTCbfbfH7jD3DKK0wYdruxrvn4iHob
         euwth38wnooE7Mc3kyVRaeseFl31PzxUTZlf5gywuo+1rWl6TuCkMSgtUQUHtLmmp/O3
         nhvgAXr8mzkivSm2iSYEn2TXrg7J/AE6U/8ORD1CKWTV/qg1zgRZetXUODzvdcaKxgTj
         R1hrzP16M00pC6tkzLFi8G0VeX4rakfCXyMD6JwEmb2EwCaZihihnDCCahRxIPNTu6cY
         J6p4MGDaDyyn7lOd49uqnQBQ1n23Zjzvr5SZssDc3cH7+do2vwdONfskHjYjaeR5S8zd
         J4Tw==
X-Gm-Message-State: AOAM531zC9J7+yZFJpfqNAevA9Vr/VAfdONLELWR7FIqE0+MWhSaQPc3
        L2XwwD5PkoQIkqZ/s0yBntbWCw==
X-Google-Smtp-Source: ABdhPJwINBo5uh42Mio6f1rg+sxf+yJ7Ja4lfnT3Lsq25qym0EpvD2ez7RBLEDNX7+D+OdzeZGP8Cw==
X-Received: by 2002:a05:620a:90c:: with SMTP id v12mr5187417qkv.16.1601512127320;
        Wed, 30 Sep 2020 17:28:47 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 205sm3850908qki.118.2020.09.30.17.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 17:28:46 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/3] drm/msm: support for host-cached BOs
Date:   Wed, 30 Sep 2020 20:27:03 -0400
Message-Id: <20201001002709.21361-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is to support cached and cached-coherent memory types in vulkan.

I made a corresponding WIP merge request [1] which shows usage of this.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6949

Jonathan Marek (3):
  drm/msm: add MSM_BO_CACHED_COHERENT
  drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
  drm/msm: bump up the uapi version

 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
 drivers/gpu/drm/msm/msm_drv.c              | 24 ++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h              |  3 +++
 drivers/gpu/drm/msm/msm_gem.c              | 23 ++++++++++++++++++++
 include/uapi/drm/msm_drm.h                 | 25 +++++++++++++++++++---
 5 files changed, 72 insertions(+), 4 deletions(-)

-- 
2.26.1

