Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C591F701D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 00:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgFKW3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 18:29:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59681 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbgFKW3i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 18:29:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591914578; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=PQnTZkYVOn9g39XJGJ/Fc5lnyvhq0qe68meDTmbVWdk=; b=DxyP5kgbrc+kuN8C9foP+hYLfYzgHm+225omboWfsr9l6wM3hpJHQlTNHexKcPM0PE9dLXRD
 iKpyFXfjjo9aACQhwwUzOP2ic+QN5vmHMYnaC2HsFlXLlEckU5tZDePhPfLa3VB9xo34os7Y
 ZPdOHOPhyTyvTS6SOEvv1PBv94s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ee2b04a8fe116ddd99a5723 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 22:29:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3DA3C433C8; Thu, 11 Jun 2020 22:29:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B7CA5C433CB;
        Thu, 11 Jun 2020 22:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B7CA5C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] iommu/io-pgtable: Allow a pgtable implementation to skip TLB operations
Date:   Thu, 11 Jun 2020 16:29:17 -0600
Message-Id: <20200611222921.464-3-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611222921.464-1-jcrouse@codeaurora.org>
References: <20200611222921.464-1-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow a io-pgtable implementation to skip TLB operations by checking for
NULL pointers in the helper functions. It will be up to to the owner
of the io-pgtable instance to make sure that they independently handle
the TLB correctly.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 include/linux/io-pgtable.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 53d53c6c2be9..bbed1d3925ba 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -210,21 +210,24 @@ struct io_pgtable {
 
 static inline void io_pgtable_tlb_flush_all(struct io_pgtable *iop)
 {
-	iop->cfg.tlb->tlb_flush_all(iop->cookie);
+	if (iop->cfg.tlb)
+		iop->cfg.tlb->tlb_flush_all(iop->cookie);
 }
 
 static inline void
 io_pgtable_tlb_flush_walk(struct io_pgtable *iop, unsigned long iova,
 			  size_t size, size_t granule)
 {
-	iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
+	if (iop->cfg.tlb)
+		iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
 }
 
 static inline void
 io_pgtable_tlb_flush_leaf(struct io_pgtable *iop, unsigned long iova,
 			  size_t size, size_t granule)
 {
-	iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
+	if (iop->cfg.tlb)
+		iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
 }
 
 static inline void
@@ -232,7 +235,7 @@ io_pgtable_tlb_add_page(struct io_pgtable *iop,
 			struct iommu_iotlb_gather * gather, unsigned long iova,
 			size_t granule)
 {
-	if (iop->cfg.tlb->tlb_add_page)
+	if (iop->cfg.tlb && iop->cfg.tlb->tlb_add_page)
 		iop->cfg.tlb->tlb_add_page(gather, iova, granule, iop->cookie);
 }
 
-- 
2.17.1

