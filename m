Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FC4290FAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Oct 2020 07:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436678AbgJQFyr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Oct 2020 01:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436779AbgJQFyo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Oct 2020 01:54:44 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7FDC05BD23
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 21:38:27 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id o184so1139413ooo.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 21:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jVnRyUolr4BwE4IUvjoP1hOl3uNRFzt0UHkql5BKxNw=;
        b=HVEf5OkLA30lu7upPvgEAndNVgt9ByZLqZTN/3I7N0TGKpMYQPhEsQYecMcOoebQyM
         bKuU+MbxXCtvME9FcPcSHZV4Yt7sBLvFW3+q5Jq2f96uBFzyvZuIspFmN4HKnzxjwZlp
         e848Pu0nxdhikSe2csuI84B7/P23eaagd0nvZcVINR5cG1eNf4aD/05JzmpkjI1hR5cT
         LxQbczsWlIIm5rviRJQiPAx1r5Ay/DrGNjtfo1dq2NyBymD6oxyeKP2fEszZJTvZU/0k
         YnxCii5fSMpJN8VG+vsEW4NereiOoihx+FNYJgAEi+bRBaWZjELqL9Ie9l51k9C3Casa
         KdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jVnRyUolr4BwE4IUvjoP1hOl3uNRFzt0UHkql5BKxNw=;
        b=k2xqDl+prqgXY9g1iB9JXoG47zfmMRUHH86DLtAkJhMdSCeX3ymJx/GDmpuMcXvasd
         G4IWspqcYh5YBJhXDT5vmroKcpP5hPkVLSr7G3lmEQKL6qy+lQeacZV8NMZsfQIBWeWB
         b4zFLhqWgI5oSYF84eqBc4LY8lOYMHZkj375Tn2tRnT8bYW042iMY2TDFRjTLp2BL4AU
         q2sH7JUkaKYe/eRW35DpwVOuzNsHPsHYUS8AsbasyOhoJJeNBA+ONY3K+vSUY9YLdwU1
         e+ge3Pe7BP5dBaJ1QD6/tbjjTrEce+kJkOtY2AGoxZNhIi8mF59vH4tvIifOiMvdgUlQ
         CRXA==
X-Gm-Message-State: AOAM531VeUcGk5wTpI7L8JXnUplIn0J2FCEyeYyAwgF5IcTARrtW+xAW
        0Jm6rZk0b1XysYKCoDtq9IL5+w==
X-Google-Smtp-Source: ABdhPJwK8Wa0Cux+ocIv9R1uy4sNW7NQ7SRmBhK1inNU0eLZjbU5Tvm0NB7XDk+asw3bkJ7gicxBHg==
X-Received: by 2002:a4a:d654:: with SMTP id y20mr5047456oos.90.1602909506462;
        Fri, 16 Oct 2020 21:38:26 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t65sm1640038oib.50.2020.10.16.21.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 21:38:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Rob Clark <robdclark@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/3] iommu/arm-smmu-qcom: Support maintaining bootloader mappings
Date:   Fri, 16 Oct 2020 21:39:04 -0700
Message-Id: <20201017043907.2656013-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is the fourth attempt of inheriting the stream mapping for the framebuffer
on many Qualcomm platforms, in order to not hit catastrophic faults during
arm-smmu initialization.

The new approach does, based on Robin's suggestion, take a much more direct
approach with the allocation of a context bank for bypass emulation and use of
this context bank pretty much isolated to the Qualcomm specific implementation.

As before the patchset has been tested to boot DB845c (with splash screen) and
Lenovo Yoga C630 (with EFI framebuffer).

Bjorn Andersson (3):
  iommu/arm-smmu: Allow implementation specific write_s2cr
  iommu/arm-smmu-qcom: Read back stream mappings
  iommu/arm-smmu-qcom: Implement S2CR quirk

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 92 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 22 ++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 +
 3 files changed, 107 insertions(+), 8 deletions(-)

-- 
2.28.0

