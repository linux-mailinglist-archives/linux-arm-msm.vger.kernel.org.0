Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE72B221979
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 03:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgGPB3h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 21:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728033AbgGPB3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 21:29:37 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594D6C061755;
        Wed, 15 Jul 2020 18:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Cc:To:Subject:From:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=6EPZ1WKSkMCE5Q21bi/BB6wT5Llo8+Db+tPJuBpS7wA=; b=GfE0Pc4uGw8Ajgi2153O6NsrkZ
        vOORzMTt9FewIM3S2JucR+aJcVwapoADmEwNO6WO5qXO9AG+QKJoRtjJVjX/d6b3WAz+x67GTUPMu
        d8CLnO1BK3jpaMvMpbk7pOl0X8OnL9gdty391HH4EOGUyN8Wi9NcazDK0qRYwZMuOr4BB9G5gdJP2
        XdlBlmCMaFjDmowNgB7SEiHbEWsNjf1wCPZUUbt710LjAXM+qFmUQXqA/7P/1AS+9HG3aWLU9DK6F
        ysM1K+5OkzJTpWwx9qQkgukKU1aPf9ijjlocULVjRLqsgYyB392Oum0Vj1g3v6Tk/101stUHXa605
        9eacfdyw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jvsiN-0000Rm-3l; Thu, 16 Jul 2020 01:29:35 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] mhi: fix doubled words and struct image_info kernel-doc
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Message-ID: <cab64692-31f6-5a2b-a540-aa434d35f9a9@infradead.org>
Date:   Wed, 15 Jul 2020 18:29:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Drop doubled word "table" in kernel-doc.
Fix syntax for the kernel-doc notation for struct image_info.
Note that the bhi_vec field is private and not part of the kernel-doc.

Drop doubled word "device" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Hemant Kumar <hemantk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
---
 include/linux/mhi.h |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- linux-next-20200714.orig/include/linux/mhi.h
+++ linux-next-20200714/include/linux/mhi.h
@@ -85,13 +85,15 @@ enum mhi_ch_type {
 };
 
 /**
- * struct image_info - Firmware and RDDM table table
- * @mhi_buf - Buffer for firmware and RDDM table
- * @entries - # of entries in table
+ * struct image_info - Firmware and RDDM table
+ * @mhi_buf: Buffer for firmware and RDDM table
+ * @entries: # of entries in table
  */
 struct image_info {
 	struct mhi_buf *mhi_buf;
+	/* private: from internal.h */
 	struct bhi_vec_entry *bhi_vec;
+	/* public: */
 	u32 entries;
 };
 
@@ -593,7 +595,7 @@ int mhi_async_power_up(struct mhi_contro
 
 /**
  * mhi_sync_power_up - Start MHI power up sequence and wait till the device
- *                     device enters valid EE state
+ *                     enters valid EE state
  * @mhi_cntrl: MHI controller
  */
 int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);

