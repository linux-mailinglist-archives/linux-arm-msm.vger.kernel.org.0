Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67BAB2551B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbfEUQOT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:14:19 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57712 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbfEUQOT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:14:19 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 606C26134E; Tue, 21 May 2019 16:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455258;
        bh=iTP2SCI8f9rdcYNbxAtXbYBJX0GWnxavwP2EzTqTloY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BZoVU8Xh/+fqGB038yIchQeecLoLBi4kUTjaCK7XVYZbCB98zVICKZveLrZFlkom+
         pWLPIJObNUPAZrCbw1DpscGNPHlFaV9cKJwQ7eT8IdTrHO6up3Eg4atI5cNEMZn6Xl
         5CdsFdU+fB9Gq5URAqFm1p5echUUMXACB6KPpA4w=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66B1C60FE9;
        Tue, 21 May 2019 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455253;
        bh=iTP2SCI8f9rdcYNbxAtXbYBJX0GWnxavwP2EzTqTloY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y15t+RN32pOZUwGE2jIg1zCcFBLj4ZDB8aXj/U4se/Tpxzv8Wcmdfh2N8fCF6B2S8
         AYjAskvkiR7dnPHco4zNvgzm10c99gUH6gVraI7DfYIScK8ndvQpaLu88zrfFT9PMe
         W0Cqtj4XWnk9TjFwn+DJdn9jyWdtT5ZitAsRV4mY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66B1C60FE9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/15] iommu: Add DOMAIN_ATTR_SPLIT_TABLES
Date:   Tue, 21 May 2019 10:13:50 -0600
Message-Id: <1558455243-32746-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new domain attribute to enable split pagetable support for devices
devices that support it.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 include/linux/iommu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 4ef8bd5..204acd8 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -128,6 +128,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_FSL_PAMUV1,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
+	DOMAIN_ATTR_SPLIT_TABLES,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
2.7.4

