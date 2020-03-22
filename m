Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 772AE18E660
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2020 05:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgCVER5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Mar 2020 00:17:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42982 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgCVER5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Mar 2020 00:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=eCXmB2ln2EpsN/JeFT/9dVYB0ryeKTlA4ZglGkDY6Sw=; b=Oto3kWlT9moldBC9xAdZbAukTC
        Pfh/3y3q9EbXGxB/syerXjfXwPzMYvevvdmMvZRi8B0+thCu8NA9sgrKgQ7rqCO4YxSDy6pLLHjFC
        3acCxKqNnaoTXbB8y0tjBQSC6PId/I0hkiBrfMqO1unCG++zMthOuR5hT2ZOid9C3KaX24CcRxtWV
        CwpHFks1LdawyDrhZlGzLHkApLTr6KA+XPq6Ck0IdA1JWut+2L91kvrn/eO65Hvp9NjXpQh16kN6T
        l1yJSUlLBjwfucD7Y0Yyn1WzW1uSy9n1rC47pqKsYUr5Ubp44iKv7BxKXxp1zGTOqfe7bR5tiatuC
        nr0535BA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jFs3f-00019t-8f; Sun, 22 Mar 2020 04:17:55 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next/-mmotm] bus/mhi: fix printk format for size_t
Message-ID: <c4852a82-cdb9-6318-70a4-96ccb4ba5af2@infradead.org>
Date:   Sat, 21 Mar 2020 21:17:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix printk format warning by using %z for size_t modifier:

../drivers/bus/mhi/core/boot.c: In function ‘mhi_rddm_prepare’:
../drivers/bus/mhi/core/boot.c:55:15: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 5 has type ‘size_t {aka unsigned int}’ [-Wformat=]
  dev_dbg(dev, "Address: %p and len: 0x%lx sequence: %u\n",


Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Hemant Kumar <hemantk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
---
Found in mmotm, but in its linux-next.patch file.

 drivers/bus/mhi/core/boot.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- mmotm-2020-0321-1517.orig/drivers/bus/mhi/core/boot.c
+++ mmotm-2020-0321-1517/drivers/bus/mhi/core/boot.c
@@ -52,7 +52,7 @@ void mhi_rddm_prepare(struct mhi_control
 			    BHIE_RXVECDB_SEQNUM_BMSK, BHIE_RXVECDB_SEQNUM_SHFT,
 			    sequence_id);
 
-	dev_dbg(dev, "Address: %p and len: 0x%lx sequence: %u\n",
+	dev_dbg(dev, "Address: %p and len: 0x%zx sequence: %u\n",
 		&mhi_buf->dma_addr, mhi_buf->len, sequence_id);
 }
 

