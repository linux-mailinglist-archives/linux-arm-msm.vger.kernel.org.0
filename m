Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5A32553B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbfEUQO0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:14:26 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58378 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728533AbfEUQOZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:14:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id ECB73619F9; Tue, 21 May 2019 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455265;
        bh=3x0zc3WxCeO54aoJuwmbDxEraXdWNxdZfplRLlNxmIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c+EfpgXVd+YSMyrkiEpopZjEYloFK2Ed8D/6qm8k1JR7bRs1d7T9qy05V9WcqRECg
         ZvXqzdslVowNzaBGKMYW8L/VYUIlBxFFO7zLv+hYTNjGUB8wUBwfu1l9OGu4bHBPLk
         7Gtv8fz9BXKoeszW9eWSnt5E0Zj9Av7M6wXmHBZc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E0AB06118D;
        Tue, 21 May 2019 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455255;
        bh=3x0zc3WxCeO54aoJuwmbDxEraXdWNxdZfplRLlNxmIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YBu+P3VVUo2YGJ1LgV4StfL0acSXyC2goopPHgncZ66a00FIYX5t1f/vAmW0x3tTV
         ereZtP5GPm3Zb1sC5ZW5Pck5HR++4oRqOJtxyb6b7MY0Bl47b/OMo25iRriFktc7Nu
         5BYP7Lct1hpcDS4JJcl3+3bDMBXJ9ycfkKTqQusk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E0AB06118D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/15] iommu: Add DOMAIN_ATTR_PTBASE
Date:   Tue, 21 May 2019 10:13:52 -0600
Message-Id: <1558455243-32746-5-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an attribute to return the base address of the pagetable. This is used
by auxiliary domains from arm-smmu to return the address of the pagetable
to the leaf driver so that it can set the appropriate pagetable through
it's own means.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 include/linux/iommu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 204acd8..2252edc 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -129,6 +129,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
 	DOMAIN_ATTR_SPLIT_TABLES,
+	DOMAIN_ATTR_PTBASE,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
2.7.4

