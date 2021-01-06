Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CB72EC5A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 22:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbhAFVYi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 16:24:38 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:51112 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbhAFVYi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 16:24:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609968255; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=jqzm0CxwVjPPoXHkI362trmov4+GkgN4j5eOnnkRcHM=; b=T2meY386Hd1t8XrHK77+/dVkgM0z+snFFXIuFTZxAqRZr+Tke/DQE58nYj0B5flOKtMZyvVo
 +vdHC09ZlxfhZxZrnDeA+6VrcSzEe5bQMrn9Ke5yatU/ag05+Xe+blGeUGIf1lAxz+1CnvaN
 s5zCiJ3f6tHvPcSiJKcBA+rOdzw=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5ff62a62a1d2634b3fc08d33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Jan 2021 21:23:46
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD33EC43466; Wed,  6 Jan 2021 21:23:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C8E3EC43461;
        Wed,  6 Jan 2021 21:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8E3EC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>, psodagud@codeaurora.org,
        rishabhb@codeaurora.org
Subject: [PATCH 1/3] soc: qcom: mdt_loader: Allow hash at any phdr
Date:   Wed,  6 Jan 2021 13:23:29 -0800
Message-Id: <1609968211-7579-2-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
References: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The assumption that the elf program header will always have the hash
segment program header at index 1 may not hold true in all cases. This
change updates the read metadata function to find the hash program header
dynamically.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/soc/qcom/mdt_loader.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 24cd193..813216d 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2016 Linaro Ltd
  * Copyright (C) 2015 Sony Mobile Communications Inc
- * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2012-2013, 2020 The Linux Foundation. All rights reserved.
  */
 
 #include <linux/device.h>
@@ -88,6 +88,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
 	size_t hash_offset;
+	size_t hash_index;
 	size_t hash_size;
 	size_t ehdr_size;
 	void *data;
@@ -98,14 +99,19 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
 	if (ehdr->e_phnum < 2)
 		return ERR_PTR(-EINVAL);
 
-	if (phdrs[0].p_type == PT_LOAD || phdrs[1].p_type == PT_LOAD)
+	if (phdrs[0].p_type == PT_LOAD)
 		return ERR_PTR(-EINVAL);
 
-	if ((phdrs[1].p_flags & QCOM_MDT_TYPE_MASK) != QCOM_MDT_TYPE_HASH)
+	for (hash_index = 1; hash_index < ehdr->e_phnum; hash_index++) {
+		if (phdrs[hash_index].p_type != PT_LOAD &&
+		   (phdrs[hash_index].p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
+			break;
+	}
+	if (hash_index >= ehdr->e_phnum)
 		return ERR_PTR(-EINVAL);
 
 	ehdr_size = phdrs[0].p_filesz;
-	hash_size = phdrs[1].p_filesz;
+	hash_size = phdrs[hash_index].p_filesz;
 
 	data = kmalloc(ehdr_size + hash_size, GFP_KERNEL);
 	if (!data)
@@ -115,7 +121,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
 	if (ehdr_size + hash_size == fw->size)
 		hash_offset = phdrs[0].p_filesz;
 	else
-		hash_offset = phdrs[1].p_offset;
+		hash_offset = phdrs[hash_index].p_offset;
 
 	memcpy(data, fw->data, ehdr_size);
 	memcpy(data + ehdr_size, fw->data + hash_offset, hash_size);
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

