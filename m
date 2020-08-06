Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1689223D59D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 04:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgHFC4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 22:56:54 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:16350 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726605AbgHFC4u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 22:56:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596682609; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=JFOp/jVg5UwpwKPOBbfJhhBblw4OLtDNa2EdgPT55ms=; b=goszcmRFvSsl7GgaWr1QQroltxlCsJYmkakmBEuAfxPlX3sZYZIZo+ufUR5VlzDASYKFpCMk
 MNttY85uxrEf9+wr/Nv7sjDapx8DTM7lARbYoMAjdnormeMY0mFTqlXa5XbrQRvuq+b+DTh1
 0TQPspK7Zif+dGlaoRsaL8i5mAc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f2b716231ad46de43c88eb3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 Aug 2020 02:56:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6DF9C433A1; Thu,  6 Aug 2020 02:56:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from cgoldswo-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cgoldswo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 98BE5C433C9;
        Thu,  6 Aug 2020 02:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 98BE5C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=cgoldswo@codeaurora.org
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pratikp@codeaurora.org,
        pdaly@codeaurora.org, sudraja@codeaurora.org,
        iamjoonsoo.kim@lge.com
Subject: cma_alloc(), add sleep-and-retry for temporary page pinning
Date:   Wed,  5 Aug 2020 19:56:21 -0700
Message-Id: <1596682582-29139-1-git-send-email-cgoldswo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On mobile devices, failure to allocate from a CMA area constitutes a
functional failure.  Sometimes during CMA allocations, we have observed
that pages in a CMA area allocated through alloc_pages(), that we're trying
to migrate away to make room for a CMA allocation, are temporarily pinned.
This temporary pinning can occur when a process that owns the pinned page
is being forked (the example is explained further in the commit text).
This patch addresses this issue by adding a sleep-and-retry loop in
cma_alloc() . There's another example we know of similar to the above that
occurs during exit_mmap() (in zap_pte_range() specifically), but I need to
determine if this is still relevant today.

