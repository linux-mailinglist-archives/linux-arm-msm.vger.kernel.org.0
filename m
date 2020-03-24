Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE5B190389
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 03:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbgCXCZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 22:25:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:60364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727047AbgCXCZI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 22:25:08 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2565D2073E;
        Tue, 24 Mar 2020 02:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585016706;
        bh=yQxEn5xbI9/AGm89weOsP06K9QwBpml5SkoCRsRvwds=;
        h=Date:From:To:Subject:From;
        b=XXTgDZ0SYSHdGNZzUxZJyVSHG6EcVWnLMLqV2EmtJ1EtutMq1TR2i2Xdj9qPnwbnS
         449CxspUiGdrnzM7b58dTddSQJo5z7mMl/EfSYoxeFbz/FrBwRSAy42TMIkvfcJT5/
         rrvsRrnDwW1uLBHIARijN6RI448lo3wb4uwsoHNY=
Date:   Mon, 23 Mar 2020 19:25:05 -0700
From:   akpm@linux-foundation.org
To:     akpm@linux-foundation.org, gregkh@linuxfoundation.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        manivannan.sadhasivam@linaro.org, rdunlap@infradead.org
Subject:  [patch 1/1] bus/mhi: fix printk format for size_t
Message-ID: <20200324022505.UiPPJZVXX%akpm@linux-foundation.org>
User-Agent: s-nail v14.8.16
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>
Subject: bus/mhi: fix printk format for size_t

Fix printk format warning by using %z for size_t modifier:

../drivers/bus/mhi/core/boot.c: In function `mhi_rddm_prepare':
../drivers/bus/mhi/core/boot.c:55:15: warning: format `%lx' expects argument of type `long unsigned int', but argument 5 has type `size_t {aka unsigned int}' [-Wformat=]
  dev_dbg(dev, "Address: %p and len: 0x%lx sequence: %u
",

Link: http://lkml.kernel.org/r/c4852a82-cdb9-6318-70a4-96ccb4ba5af2@infradead.org
Fixes: 6fdfdd27328ce ("bus: mhi: core: Add support for downloading RDDM image during panic")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Hemant Kumar <hemantk@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/bus/mhi/core/boot.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/bus/mhi/core/boot.c~bus-mhi-fix-printk-format-for-size_t
+++ a/drivers/bus/mhi/core/boot.c
@@ -52,7 +52,7 @@ void mhi_rddm_prepare(struct mhi_control
 			    BHIE_RXVECDB_SEQNUM_BMSK, BHIE_RXVECDB_SEQNUM_SHFT,
 			    sequence_id);
 
-	dev_dbg(dev, "Address: %p and len: 0x%lx sequence: %u\n",
+	dev_dbg(dev, "Address: %p and len: 0x%zx sequence: %u\n",
 		&mhi_buf->dma_addr, mhi_buf->len, sequence_id);
 }
 
_
