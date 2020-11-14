Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889C32B2DE3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 16:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgKNPVH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 10:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKNPVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 10:21:04 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EC6C0613D1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2020 07:21:03 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id u4so12438595qkk.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2020 07:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mvYHfNLs//x0UCoGzcml3CX/lFayNp6bncJ+PAIIQPg=;
        b=boEvE1jJkCl5kJSpNhQF7m+CWiLQrRnX4NgMtu+8CGdOfGnxn8Z0uaApWYc6uNYioP
         zlrG6UqUkEuW6eFK1RNAC3KMpZdDwYuCxnUz+tX10junMhLMWHuEPBZwvbKd3qEOAfDL
         Lp+EwFz9g5852MJSCOYd5xNh3eb0Gj+X/lo8govtalB2Z7KGNqGeSh0NVlwt93str0iM
         X7NrX7VK8O4HdqKdrU/Ie/gEkzzq7ogWYGTGA9Nk2iNgeFaKI0eQuKp2NJHHkB2DMwjM
         /FVfVPjuD3BQI5i+zz2ToqxgdC/tNc/AFBHseUfPVnsDyQIGJUKr/jLuT3OECxPQbXNh
         spJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mvYHfNLs//x0UCoGzcml3CX/lFayNp6bncJ+PAIIQPg=;
        b=Q1hEcqrq2LuvNYhj/okN3c3MMAQlNBS83NNT0mN9NaSMNb+ffITNn91eCoITOzw25h
         hREtKnoGE8+hvJ1biQmF5HnG5zmB8t70haLlvlLlVzNzmea/rCpBFYtwFSQWlQcZy0TS
         +2Ap1FG+vp8bZOPUbFKOBrDdn/Py9+n+3xFysk+28UibiMbBpvrMFK+fPSjnBrAN1ufB
         DDFxI187sywNE4+wVXgrvudYmcPQ/TP4rTS5+OuzOS8kXiByz2pea4ZAH2gMhzv+rJwH
         YglR5g4QJ1f+hsTjnkMXptffbl9blDrsRdcO6peXcyhZY5t5pEVXJVmidqVe/pCBrgFw
         29Kw==
X-Gm-Message-State: AOAM533rathuiLHwn0v17/hZi4gSqbC7pW0LZOKkDBkY3MhrYEbFBC/l
        G/5gfvy9/SItY7hqTR+VM8ZS757am4L6tT2jWUg=
X-Google-Smtp-Source: ABdhPJzYGqTlUKPKSmkhBmM3csDOKzxzLYFelg6G+ya85IQqawa27V6Kv716IjBszDX0515vEabeeg==
X-Received: by 2002:a05:620a:2455:: with SMTP id h21mr6867791qkn.123.1605367262284;
        Sat, 14 Nov 2020 07:21:02 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id h125sm8888368qkc.36.2020.11.14.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 07:21:01 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org, hch@lst.de
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        iommu@lists.linux-foundation.org (open list:DMA MAPPING HELPERS),
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [RESEND PATCH v2 0/5] drm/msm: support for host-cached BOs
Date:   Sat, 14 Nov 2020 10:17:08 -0500
Message-Id: <20201114151717.5369-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v2:
 - added patches 2/3 to enable using dma_ops_bypass
 - changed DRM_MSM_GEM_SYNC_CACHE patch to use dma_sync_sg_for_device()
   and dma_sync_sg_for_cpu(), and renamed sync flags.

Not sure I did the right thing with for the dma_ops_bypass part,
this is what I came up with reading the emails.

Jonathan Marek (5):
  drm/msm: add MSM_BO_CACHED_COHERENT
  dma-direct: add dma_direct_bypass() to force direct ops
  drm/msm: call dma_direct_bypass()
  drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
  drm/msm: bump up the uapi version

 drivers/gpu/drm/msm/Kconfig                |  1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
 drivers/gpu/drm/msm/msm_drv.c              | 32 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.h              |  3 ++
 drivers/gpu/drm/msm/msm_gem.c              | 31 +++++++++++++++++++++
 include/linux/dma-direct.h                 |  9 ++++++
 include/uapi/drm/msm_drm.h                 | 25 +++++++++++++++--
 kernel/dma/direct.c                        | 23 ++++++++++++++++
 8 files changed, 118 insertions(+), 7 deletions(-)

-- 
2.26.1

