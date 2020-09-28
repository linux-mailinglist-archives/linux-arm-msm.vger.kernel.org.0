Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A911327B64F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 22:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgI1UbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 16:31:19 -0400
Received: from z5.mailgun.us ([104.130.96.5]:11698 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726811AbgI1UbR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 16:31:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601325076; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HvqRlccboJRskCbBGoZiwAwl9Is6Q+EApiZuGx+9fRk=; b=IzTonj8GyKgHGaRt4FcH0C3EyfbZnJS4379S1+eqCQo7fzWzWv1lLMXutlixdX7yVEoepvl4
 uJq1bIjXMt5YK0NLsHia53hkluNWig9iLtlnCrJYonBbBNEZsuDftStn5yMCH+zAsmCLfmHu
 2u1Iz/Y4xtMBRZsqmAo9I37mnHU=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f7247fdf38f205ebc529dfa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 20:30:53
 GMT
Sender: cgoldswo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2239C433CB; Mon, 28 Sep 2020 20:30:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from cgoldswo-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cgoldswo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E4C4C433CA;
        Mon, 28 Sep 2020 20:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9E4C4C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=cgoldswo@codeaurora.org
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     akpm@linux-foundation.org, linux-mm@kvack.org, minchan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudaraja@codeaurora.org, iamjoonsoo.kim@lge.com, david@redhat.com,
        vinmenon@codeaurora.org, minchan.kim@gmail.com
Cc:     Chris Goldsworthy <cgoldswo@codeaurora.org>
Subject: [PATCH v4] mm: cma: indefinitely retry allocations in cma_alloc
Date:   Mon, 28 Sep 2020 13:30:26 -0700
Message-Id: <cover.1601324066.git.cgoldswo@codeaurora.org>
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
controlling the duration of the sleep between retries:

https://www.spinics.net/lists/linux-mm/msg228778.html

V4: In response to comments by Minchan Kim, we make the sleep interruptable
and remove a defconfig option controlling how long the sleep lasts for (it
is now a fixed 100 ms).

Chris Goldsworthy (1):
  mm: cma: indefinitely retry allocations in cma_alloc

 arch/powerpc/kvm/book3s_hv_builtin.c       |  2 +-
 drivers/dma-buf/heaps/cma_heap.c           |  2 +-
 drivers/s390/char/vmcp.c                   |  2 +-
 drivers/staging/android/ion/ion_cma_heap.c |  2 +-
 include/linux/cma.h                        |  2 +-
 kernel/dma/contiguous.c                    |  4 ++--
 mm/cma.c                                   | 36 +++++++++++++++++++++++++-----
 mm/cma_debug.c                             |  2 +-
 mm/hugetlb.c                               |  4 ++--
 9 files changed, 40 insertions(+), 16 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

