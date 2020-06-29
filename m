Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4739620E9A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 02:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbgF2XtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 19:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbgF2XtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 19:49:24 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281F7C03E979
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 16:49:24 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id dm12so8492033qvb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 16:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kuWeoCHuc/prOGvBHvvx+Eyg6Z2nKOC6TsX81jgFqt4=;
        b=aak1v9uve4kyxwvd+x7Df+Wf6cXWmrmolKMAuKVWTghvCHOXv6e4A10ENI3HjVU0bP
         fdE32jJE9unnlHaqKcU1ukM5EDT5GxPEeE2Nu3XiiSlZfSZ7z+BPihLMAPzz4dvsC8Xs
         vYFOTsLonPjpRIBTdDDoAomMyt6GdC88yGQ+NnVK9UmVc3lr1WLljWoBoa/HFFeD9EFR
         PCZkK4UGPuPfstmsQnXvzjo9mF3J+cgKol/v0YghliTA8MZmdmeQZEss0NqM8FuPYf9Y
         vZBk10824u4vmj/sT7jLgKWasVPSVO3s7a4OdN7GUipsNh8XGS6nEEVRxzSsEfZ7CnAW
         qcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kuWeoCHuc/prOGvBHvvx+Eyg6Z2nKOC6TsX81jgFqt4=;
        b=N2a0hMroyDDZ6nsXG5IKpTtA3QdRazM9D+1GJZj0ARnSjXNvJ1+kBuzkqjHEN21xcR
         Vf9SIiJCiW5SXHC6UshEK5uTNQkic6hFylaPb6bhZCYYYtYzEIDmngiEowR8C3JebJG8
         GaE6RvpOwPXuoc90cGKwyMyptcKDJidYBiF+717FAdDAX1/ESVsSLkVIV8SoP4pwU2d7
         WCIZutg1g3Z6ILEFi7AH9vqwgG/nneBQ67ztBf60YIQjcpbcgxBqEYLLLk+GBGpUJ1xS
         8FTQYY0Cxi+OZ/tW79BmNvQ+X7bAPM+EOrEjbEgMZHmSv3TmtruBsvb3Y7y8izbKaGFX
         nBnw==
X-Gm-Message-State: AOAM5309IGeFmj7NdEhc9LO6Krxa+LbPkh1oM1Q8MaGkKZNKgzfGgJWV
        8GJ9WhM+kNVTsO7yiad7xYnNzA==
X-Google-Smtp-Source: ABdhPJyJ2d0tCp5izifxJz64EqQHHdsaCCZq5JobW3wQx1DkNT/z73gSlzRnTXVU5Cqq6pptF4ym9w==
X-Received: by 2002:a0c:f788:: with SMTP id s8mr17077923qvn.169.1593474563286;
        Mon, 29 Jun 2020 16:49:23 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id n64sm1541076qke.77.2020.06.29.16.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 16:49:22 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Eric Anholt <eric@anholt.net>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Wambui Karuga <wambui.karugax@gmail.com>
Subject: [PATCH 0/2] drm/msm/a6xx: add A640/A650 hwcg
Date:   Mon, 29 Jun 2020 19:49:12 -0400
Message-Id: <20200629234921.3511-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initialize hardware clock-gating registers on A640 and A650 GPUs.

I put the hwcg tables in adreno_device.c, but maybe it makes more
sense to keep them in a6xx_gpu.c? (this would allow switching a5xx
to use the gpulist too.. it isn't possible to include both a6xx.xml.h
and a5xx.xml.h in adreno_device.c)

Jonathan Marek (2):
  drm/msm/a6xx: hwcg tables in gpulist
  drm/msm/a6xx: add A640/A650 hwcg

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 140 ++-----------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 219 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   7 +
 4 files changed, 251 insertions(+), 123 deletions(-)

-- 
2.26.1

