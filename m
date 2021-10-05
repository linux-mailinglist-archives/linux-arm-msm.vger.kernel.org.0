Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CABD2422BF9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 17:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhJEPNq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 11:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbhJEPNo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 11:13:44 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38769C061749;
        Tue,  5 Oct 2021 08:11:54 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id r2so20057825pgl.10;
        Tue, 05 Oct 2021 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QSrcQ531lYvMDyqtMmSNSg1D9eOHYmXdh6Sn4g0VZLQ=;
        b=LE+nGxihu74oC3P/yXCbRUT8joVuLjedGgQjvKmK8f3RDbhsFz2Vi3/sS9u9wXnGcX
         K2GgrTHQM2kjOTjbHfEDKSOGaIQ95GlbZ/QF327Ospm5XEbm5TPf6490GoZyuWQ1E/y+
         IeJKKHDWKXVrwoDC9bWA7CsdXkqo8n4aTYFKKesOpEGc2WcdjcTgXydrApYSun1UVsgw
         iY76WfnFfYcz9KR5eDOdItpIDV0s68u3xP+x9H5iDGJotHLBIZgkU1UDs/KH+Jtv0Uja
         Hd84BWPjshr5CEK7HmMKnP/2imJsZdYLGNfIk8+cWZQTHfe+FZ/z7BP+9G5U4gsshMEp
         MPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QSrcQ531lYvMDyqtMmSNSg1D9eOHYmXdh6Sn4g0VZLQ=;
        b=TPx0nSg7Oo3WUEieReIc7H3ZnnkTeonmVnRGx+fefPPxff3r1k0bVqRQ8XChVzIwba
         NAT+gw3IwSedCDOmmwlb6Ec+n42FQbm1REpgpG/fQlzPF+l1QFUfvIjxsjcmLTZUg1lx
         dQtdKbLrMsEkBDr6cogjK5Hv5xUP60VETCnR0RsvBVBCJwdDLkL/5YnRIbUNjT2WJrKC
         ugyaOEm04fyYrizVBHR8Z/VCFR46hwal5U2sv3H1lhodje6CPTiZJfwmmLwGo0Y1z9pX
         pMiQ0FA7addAlicNXo1FrRkxwNqZTAq4eVvBdIPxX7+6bYNDb8MqJCcuz4ZfywJcLVku
         ahNg==
X-Gm-Message-State: AOAM532D6A5l/D6MTQ6tpCkaqcQoNGyAiHSJ1TEezIVf68hYIg7VVw8f
        QMV/ErlwlBHMs2GqtvgbW3I=
X-Google-Smtp-Source: ABdhPJxO3G+HWzM6JzFUJostwno3QxJkFsVc0ojvp/XHIKEdzTvHkYlD/6vx1y3wEb8mXk5HXIWGFA==
X-Received: by 2002:aa7:828c:0:b0:44c:28d1:46b9 with SMTP id s12-20020aa7828c000000b0044c28d146b9mr19508978pfm.43.1633446713563;
        Tue, 05 Oct 2021 08:11:53 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id k22sm18388032pfi.149.2021.10.05.08.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 08:11:51 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Douglas Anderson <dianders@chromium.org>,
        Georgi Djakov <quic_c_gdjako@quicinc.com>,
        iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Sven Peter <sven@svenpeter.dev>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v2 0/3] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date:   Tue,  5 Oct 2021 08:16:24 -0700
Message-Id: <20211005151633.1738878-1-robdclark@gmail.com>
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

v2: Fix an armv7/32b build error in the last patch

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

