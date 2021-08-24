Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A174A3F5B2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 11:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235583AbhHXJmD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 05:42:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:44834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235566AbhHXJmD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 05:42:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6DF06108F;
        Tue, 24 Aug 2021 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629798079;
        bh=gFIclmSjmiJh/ormPzj/mq5h+yqt+1OnN3tuT5TqpHw=;
        h=From:To:Cc:Subject:Date:From;
        b=jH485jhxhmWnB9jCuN7EaTzM7RzLserft47okor9m+iCNSJWRd/mj4zRH/kbG6ofR
         zXvs/YW8tHWaviQAr41bTIkBS9uSILaE1+On235GRBizH/75MyCRjZz0uSH68nGqrD
         Hty42tlTjz08KsWYuMdXkkkOkLskkU6S2vQ8zPXOTXtLIvGgRhK4FQgtRA2Pklynsj
         3+kOe9RTg3o69vwhU2Sz0eZDfDZyq0JbQwUEIX+pJcaUjV+RjLS7ZrxGcdjMYx8Ge7
         5T+Nruy089lM0kwha2U+1mBRlLo0/gfGZf6a3Yenlt9GBIsRv+ch4h8RSraI9kktew
         sfW7BZfRUcOMg==
From:   Shawn Guo <shawnguo@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
Date:   Tue, 24 Aug 2021 17:41:09 +0800
Message-Id: <20210824094109.7272-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Shawn Guo <shawn.guo@linaro.org>

It's been observed on Sony Xperia M4 Aqua phone, that wcnss firmware has
the type of the second segment holding hashes just be PT_LOAD.  So drop
the check on phdrs[1].p_type to get it go on that phone.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index eba7f76f9d61..6034cd8992b0 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -98,7 +98,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
 	if (ehdr->e_phnum < 2)
 		return ERR_PTR(-EINVAL);
 
-	if (phdrs[0].p_type == PT_LOAD || phdrs[1].p_type == PT_LOAD)
+	if (phdrs[0].p_type == PT_LOAD)
 		return ERR_PTR(-EINVAL);
 
 	if ((phdrs[1].p_flags & QCOM_MDT_TYPE_MASK) != QCOM_MDT_TYPE_HASH)
-- 
2.17.1

