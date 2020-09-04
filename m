Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518DA25DEA9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 17:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgIDPza (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 11:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbgIDPzR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 11:55:17 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4611C061247
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 08:55:16 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id g72so6691252qke.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4q/8n4d9Oz9Vv/K5aJK8Mp8Y2lRkWj0qSrttp/CroxE=;
        b=oZadVWzKzjT6kVlQDdSaTMxHoRTYYXuhfeHAqu6JmmOp3XCU0blzfKn1tJhWzX2HeS
         sK1QUgw4eOALlLrqiIa5mJ5RjG5DDMC/GfAoKvUlju9deCt1Z1cQt3mFi6Jp8dh8eAcL
         b47lB644qnhBgKdHPTa65f3vcbqa8pR/OGmGhW1uCRNIq0IP9XUGZp7dua1GTQzH7pbj
         3kOSW84l/lOtcT1dCSPEMna3Qn0g0ssFDfacD5B1snlLor1iC7Zmm6UoHviENlQKr4s3
         lC89jtyARRDB8fr0n/NnuYQLdQ/YywQuWqkj40BnJg+qClOjhyEKiVWTZ/r3SCq8UT/u
         +arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4q/8n4d9Oz9Vv/K5aJK8Mp8Y2lRkWj0qSrttp/CroxE=;
        b=WGjDZe6xaNnGhMKt39/KJl/0jnYcT5MZUudaQHucdE29Ngw+nmgW2Y9OGHx3TJy8VG
         bQS9EjEE3TCVnWT8U0FK7knbzDAyV7w19hAxA/O3dnqSYBOHk5HoGhttdWjpzrpAh2KJ
         Dvx1tv9ONpJ2MrVzqEfg1m0SlLOkEUC6FGtG9dmF2eLE91/SXVdzNfovNh90JOEHVPEH
         CDadcBlTVi45WyKSP5wyh3XnCOfS5CrgNGbGWDh4NAWR37WHq/3i1iXW4/F2JZ2izs1i
         NewZjFb9P/2WPvxSvScW/XO64awqw6/FjjDc3eGWEaNlN+bUlATOO6HVuk3fS2Fanr5j
         mNQA==
X-Gm-Message-State: AOAM532Fc/kenFiophRmUbTdCuFOHfpQnQk7Gk72hTCg3KRdeU6WNfan
        jID2DDtaw0EAW0nTvQ5FVYZYj9980YTtrQ==
X-Google-Smtp-Source: ABdhPJxHXnDF5Yz7KMj3dP1Wot9aBwDE24PK5PObq0P6DKGWMzJC3jbF9SemUpoG0/uTgsf96ikT4Q==
X-Received: by 2002:a37:314:: with SMTP id 20mr8208333qkd.274.1599234915063;
        Fri, 04 Sep 2020 08:55:15 -0700 (PDT)
Received: from localhost.localdomain (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id v18sm4724473qtq.15.2020.09.04.08.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:55:14 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/8] iommu/arm-smmu: Support maintaining bootloader mappings
Date:   Fri,  4 Sep 2020 15:55:05 +0000
Message-Id: <20200904155513.282067-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Based on previous attempts and discussions this is the latest attempt at
inheriting stream mappings set up by the bootloader, for e.g. boot splash or
efifb.

Per Will's request this builds on the work by Jordan and Rob for the Adreno
SMMU support. It applies cleanly ontop of v16 of their series, which can be
found at
https://lore.kernel.org/linux-arm-msm/20200901164707.2645413-1-robdclark@gmail.com/

Bjorn Andersson (8):
  iommu/arm-smmu: Refactor context bank allocation
  iommu/arm-smmu: Delay modifying domain during init
  iommu/arm-smmu: Consult context bank allocator for identify domains
  iommu/arm-smmu-qcom: Emulate bypass by using context banks
  iommu/arm-smmu-qcom: Consistently initialize stream mappings
  iommu/arm-smmu: Add impl hook for inherit boot mappings
  iommu/arm-smmu: Provide helper for allocating identity domain
  iommu/arm-smmu-qcom: Setup identity domain for boot mappings

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 111 ++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 122 ++++++++++++++-------
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  14 ++-
 3 files changed, 205 insertions(+), 42 deletions(-)

-- 
2.28.0

