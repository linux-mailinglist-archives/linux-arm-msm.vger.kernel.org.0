Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B06D1C998A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 20:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgEGSpw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 14:45:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:46646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728309AbgEGSpv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 14:45:51 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3666920870;
        Thu,  7 May 2020 18:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588877150;
        bh=dRXO8NWeYM9voX1lUqLjnyFnyymDA1FiAU3W8d8sdW4=;
        h=Date:From:To:Cc:Subject:From;
        b=lHeymKeiC/FcQsbXvpMS9igvZ7qvccUuVdEOaIBdd44VEwKRzFm5vVAv7ehaU5dWQ
         3EP21nPSolm2gTd4IyfvCKKx8NJvlQkrCJxoQ7aLXA97yIc8tUwfV/j+q1z9hGM+gs
         g7bWGfCOS+scn4NNMoTpIV24Zn0KpPlSyy0fstzg=
Date:   Thu, 7 May 2020 13:50:16 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: qcom: bam_dma: Replace zero-length array with
 flexible-array
Message-ID: <20200507185016.GA13883@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/dma/qcom/bam_dma.c         |    2 +-
 drivers/firmware/qcom_scm-legacy.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index ef73f65224b1..5a08dd0d3388 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -74,7 +74,7 @@ struct bam_async_desc {
 	struct list_head desc_node;
 	enum dma_transfer_direction dir;
 	size_t length;
-	struct bam_desc_hw desc[0];
+	struct bam_desc_hw desc[];
 };
 
 enum bam_reg {
diff --git a/drivers/firmware/qcom_scm-legacy.c b/drivers/firmware/qcom_scm-legacy.c
index 8532e7c78ef7..eba6b60bfb61 100644
--- a/drivers/firmware/qcom_scm-legacy.c
+++ b/drivers/firmware/qcom_scm-legacy.c
@@ -56,7 +56,7 @@ struct scm_legacy_command {
 	__le32 buf_offset;
 	__le32 resp_hdr_offset;
 	__le32 id;
-	__le32 buf[0];
+	__le32 buf[];
 };
 
 /**

