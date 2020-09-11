Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE7C2668A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 21:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgIKTRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 15:17:05 -0400
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:55094
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725816AbgIKTRD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 15:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599851823;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=GAaaPTdJyZWkXSqI/af+MrePYbvKkuKJ7Aq9ymeNk5M=;
        b=iXEcHnws2j9CVxgKqJy/GhSiJ4eK+RgWAZS/Pk7SkW6gm8Uq0neRXN5UEPISL00O
        83oLLyMfI0ClxI6Buib8LxekjaG7NLC9Ce1aH0GIViU2IN3QBAIv9yfRjKJc98x3xDQ
        WfiSgo+8rj4V5p/NwF4Q+iFSlpIKnTbs00+U7CcM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599851823;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=GAaaPTdJyZWkXSqI/af+MrePYbvKkuKJ7Aq9ymeNk5M=;
        b=VbHtFSezCl4F6WT82yoexBRUmRv1J/dcaCkjeVeANBe8TBD3EMRU2hd37Dd0BgSU
        OnJQnGl7h/gPYNI3bRAXdl8lqddhBHQVJ21T9m7GKi6ejTUTJq3e783vlDf5MulQb2O
        /XcaYZdpQKqlCU9IAaQOalY5eToa0NBsXITf9DPE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86BEAC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=cgoldswo@codeaurora.org
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pratikp@codeaurora.org,
        pdaly@codeaurora.org, sudraja@codeaurora.org,
        iamjoonsoo.kim@lge.com, linux-arm-msm-owner@vger.kernel.org,
        Chris Goldsworthy <cgoldswo@codeaurora.org>
Subject: [PATCH v2] cma_alloc(), indefinitely retry allocations for -EBUSY failures
Date:   Fri, 11 Sep 2020 19:17:03 +0000
Message-ID: <010101747e997f12-3d4bb1df-b000-4e50-859b-829e6d7f491e-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <06489716814387e7f147cf53d1b185a8@codeaurora.org>
References: <06489716814387e7f147cf53d1b185a8@codeaurora.org>
X-SES-Outgoing: 2020.09.11-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On mobile devices, failure to allocate from a CMA area constitutes a
functional failure.  Sometimes during CMA allocations, we have observed
that pages in a CMA area allocated through alloc_pages(), that we're trying
to migrate away to make room for a CMA allocation, are temporarily pinned.
This temporary pinning can occur when a process that owns the pinned page
is being forked (the example is explained further in the commit text), or it is
exiting.  This patch addresses this issue by indefinitely retrying allocations
that fail due to a return of -EBUSY.

Change log: 

v1: We were performing retries of the allocation a fixed number of times.
Andrew Morton disliked this, as it didn't guarantee that the allocation would
succeed.

v2: To address this concern, we switched to retrying indefinitely, as opposed to
doing to retrying  the allocation a limited number of times.

Chris Goldsworthy (1):
  mm: cma: indefinitely retry allocations in cma_alloc

 mm/cma.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

