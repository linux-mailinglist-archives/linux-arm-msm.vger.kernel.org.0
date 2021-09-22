Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9604D415354
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 00:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbhIVW1f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 18:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbhIVW1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 18:27:34 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C7FC061574;
        Wed, 22 Sep 2021 15:26:04 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so4603286pjb.1;
        Wed, 22 Sep 2021 15:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d1Se0bIv+AZshTnNE9EXhZho8yO0a4lB3cun5QpGO0Q=;
        b=AMOdyqDsI3sfVqMy3qg8nuHbTL6w3lfG8gnPtR1OtuZBPCgWgVij+0H6Cv1w4e3fPr
         Ni/kOR6QjMBnux+XtxdvKzMxBWetD3eI+SRnpqUTd6YKwW2kJU9qIzJ4k84+akfKdu89
         UcUIoX0aZSlmUQxt6F83PCTKXnj8c+M3ykpcRD3SKbLSUBAQo+gLz1b3TdgMGPel3Gic
         qymi1EeqRnYzoFhU4iHTbipF9p2QT6scT4VQLY463NFpI/2HJa6Vs9ZZlRzUkAZ+wwzl
         l3+/+1XBXvsVb5+0tMm2xp7/MhjJB43pJUW+D+AaTNkFKn78WzlpJnzFzQ9wax+EIdUi
         y0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d1Se0bIv+AZshTnNE9EXhZho8yO0a4lB3cun5QpGO0Q=;
        b=U49dD0viNS+wve0DanKjc8hjZa1YidSAvzQ1AYRpto/gA9hmDI/e1DOoeHiUObfG4U
         LiIcUzEguZhY4yJtJxvtPGOdidU/bjLo/5TAlJ1idgnrteic75ezoEOHPxNMRg7P1uYo
         WkPH085kvZNHpmyoQeHHW90WyM2EbCwe+Aqbl+5+HrUvbqOgMoskjimaPkWi/33s+gs+
         QLxkAxzBXWwArMcM7NIj91lfls6NU/lcoG+YE32YrPGLzXbK7zllsDw058E61Z+AELGc
         NmMhqq2TkJxdMpd2lSeRPhMczbV9Ql70eeUYY2ChM/eBWAmVj5od0rH9Vnm7+Pgvvqlp
         6/uw==
X-Gm-Message-State: AOAM531P1tmhcdTwxblms07Euv4ZRP30fmXQMyjYl+dkXY1TPQIWQ9ZE
        71LHhMOgxYA+kDjjnTxaXgA=
X-Google-Smtp-Source: ABdhPJwX2anKJfJb319odBXPr+/Q/RO097FlrwVWHxAunhfrjJfsuUIcGPPvyO4DfF50oI+6k0xD6g==
X-Received: by 2002:a17:903:1d0:b0:13d:aaea:a35d with SMTP id e16-20020a17090301d000b0013daaeaa35dmr1282793plh.78.1632349563520;
        Wed, 22 Sep 2021 15:26:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id fy11sm319278pjb.32.2021.09.22.15.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 15:26:02 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Dave Airlie <airlied@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
        Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list),
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH 0/3] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date:   Wed, 22 Sep 2021 15:30:20 -0700
Message-Id: <20210922223029.495772-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This series extends io-pgtable-arm with a method to retrieve the page
table entries traversed in the process of address translation, and then
beefs up drm/msm gpu devcore dump to include this (and additional info)
in the devcore dump.

The motivation is tracking down an obscure iova fault triggered crash on
the address of the IB1 cmdstream.  This is one of the few places where
the GPU address written into the cmdstream is soley under control of the
kernel mode driver, so I don't think it can be a userspace bug.  The
logged cmdstream from the devcore's I've looked at look correct, and the
TTBR0 read back from arm-smmu agrees with the kernel emitted cmdstream.
Unfortunately it happens infrequently enough (something like once per
1000hrs of usage, from what I can tell from our telemetry) that actually
reproducing it with an instrumented debug kernel is not an option.  So
further spiffying out the devcore dumps and hoping we can spot a clue is
the plan I'm shooting for.

See https://gitlab.freedesktop.org/drm/msm/-/issues/8 for more info on
the issue I'm trying to debug.

Rob Clark (3):
  iommu/io-pgtable-arm: Add way to debug pgtable walk
  drm/msm: Show all smmu info for iova fault devcore dumps
  drm/msm: Extend gpu devcore dumps with pgtbl info

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 35 +++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gpu.c           | 10 +++++++
 drivers/gpu/drm/msm/msm_gpu.h           | 10 ++++++-
 drivers/gpu/drm/msm/msm_iommu.c         | 17 +++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  2 ++
 drivers/iommu/io-pgtable-arm.c          | 40 ++++++++++++++++++++-----
 include/linux/io-pgtable.h              |  9 ++++++
 8 files changed, 107 insertions(+), 18 deletions(-)

-- 
2.31.1

