Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C00D276828
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 07:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgIXFRh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 01:17:37 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:33252 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726736AbgIXFRh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 01:17:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600924656; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9c5kRk1iRWNGCAyOwHL9JZ77Jetg7PxW6V4Qija+Jw4=; b=lP+MiXNzCLPQmSeivQieOZe5zBZU/cq8P4o0LTkLXsGVes2C626F6Qq0zhjLs1pDRcwu+1sA
 kHu7WQvG3dVd5WwVuzyYu6o2i2hZ9xKZKMvs35GyDUjAsS3IthipO64b4wwvSCAYe0Cq2//9
 sz+5zDPiMgG1g7GyS4g4FoBvzd4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f6c2bde48c378a4cbeb6dc0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Sep 2020 05:17:18
 GMT
Sender: cgoldswo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 652AAC433F1; Thu, 24 Sep 2020 05:17:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from cgoldswo-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cgoldswo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3079CC433C8;
        Thu, 24 Sep 2020 05:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3079CC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=cgoldswo@codeaurora.org
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudaraja@codeaurora.org, iamjoonsoo.kim@lge.com, david@redhat.com
Cc:     Chris Goldsworthy <cgoldswo@codeaurora.org>
Subject: [PATCH v3] mm: cma: indefinitely retry allocations in cma_alloc
Date:   Wed, 23 Sep 2020 22:16:24 -0700
Message-Id: <cover.1600922611.git.cgoldswo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V1: Introduces a retry loop that attempts a CMA allocation a finite
number of times before giving up:
 
https://lkml.org/lkml/2020/8/5/1097
https://lkml.org/lkml/2020/8/11/893

V2: Introduces an indefinite retry for CMA allocations.  David Hildenbrand
raised a page pinning example which precludes doing this infite-retrying
for all CMA users:

https://lkml.org/lkml/2020/9/17/984

V3: Re-introduce a GFP mask argument for cma_alloc(), that can take in
__GFP_NOFAIL as an argument to indicate that a CMA allocation should be
retried indefinitely. This lets callers of cma_alloc() decide if they want
to perform indefinite retires. Also introduces a config option for
controlling the duration of the sleep between retries.

Chris Goldsworthy (1):
  mm: cma: indefinitely retry allocations in cma_alloc

 arch/powerpc/kvm/book3s_hv_builtin.c       |  2 +-
 drivers/dma-buf/heaps/cma_heap.c           |  2 +-
 drivers/s390/char/vmcp.c                   |  2 +-
 drivers/staging/android/ion/ion_cma_heap.c |  2 +-
 include/linux/cma.h                        |  2 +-
 kernel/dma/contiguous.c                    |  4 ++--
 mm/Kconfig                                 | 11 ++++++++++
 mm/cma.c                                   | 35 +++++++++++++++++++++++++-----
 mm/cma_debug.c                             |  2 +-
 mm/hugetlb.c                               |  4 ++--
 10 files changed, 50 insertions(+), 16 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

