Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC5A49F165
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 03:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345634AbiA1Cy4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 21:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345587AbiA1Cyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 21:54:52 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AA7C06173B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:52 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id q145-20020a4a3397000000b002e85c7234b1so1146698ooq.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=txGDW+vVDj2W2Xqet7NzzdhFqerLTb4wuJyYtxok9TY=;
        b=WDTfn9Zdplh3vUbCWq7QDaOYswhbPZgLrDU7Idca2brCkDbrecG6l4IeehgwIaFpt7
         0CWq4H876ocpEEu36uMfPuGrycu09gbKHZc2m/xMWaRHGBH1yRPl58Ncp7rb6GURuodJ
         UHj4emBzLOcSh12f2cYMyYGJG9aW1ftJP9OMM5/CEtTR5yV+SeWVmlX7wz8lzv5RFT+N
         4MqCCtAJZ1V1gTSwWVuEV7Kgs95lfwAPSC7vbcPRiiFk5kAp6r5NAPLXvZP4Al6I1xz6
         PkpIypAUsV3IF8wmxCLbQ/inezaedO5w/fvrvSzIFjGVGeTiV6V3QVbT0CFlMNTqKqL0
         Dhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=txGDW+vVDj2W2Xqet7NzzdhFqerLTb4wuJyYtxok9TY=;
        b=Po3YzGqXPmkvtxZS0b1eGPDoBXwnIvVVkuMXkzEibZji6FdAtRmjRyRltFcAWwtzK7
         0Dq5+Xzk3t/R+g89oiTTdfM6fPrN4HVQNTNwd7sU2k1us2AnZeeNEI1IS7ROdgqi2msu
         2xchtliQtWWrDgH1WYFZvpokm58uoYgywpRzKMYvzA7ldxECPE0XsOjdVakXNAjcr0i6
         RfKmr4hVTiHaSymH10lnKnBVHQkQhmR1HhoQKpJdvYs8fZzjGzcszWP3yHO9aLNC+LGK
         FfGl1vFg3of9X2OM3B+INGoP/gOc4ahTg2F72HUxbheA7eXynNgEHpwcU3Of4F10Qtyo
         RNAw==
X-Gm-Message-State: AOAM531LKM59IVh5RBEe8askS08Xhff/J0eXkT9qgF11k9dbEP8BOITu
        WH9zz+/NTSTLHaIt70OT5Uz9FQ==
X-Google-Smtp-Source: ABdhPJxSqTgv+YNq5SqLs4mVaSzwlS8QjMEf+bBoB/28CcmiVtXKTVpIEyxianfityAoGqI7U5hZdA==
X-Received: by 2002:a4a:3f46:: with SMTP id x6mr3387000ooe.78.1643338491586;
        Thu, 27 Jan 2022 18:54:51 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:51 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] soc: qcom: mdt_loader: Allow hash to reside in any segment
Date:   Thu, 27 Jan 2022 18:55:04 -0800
Message-Id: <20220128025513.97188-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's been observed that some firmware found on Qualcomm SM8450 devices
carries the hash segment as the last segment in the ELF. Extend the
support to allow picking the hash from any segment in the MDT/MBN.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 4372d8e38b29..c5bd13b05c1a 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -126,9 +126,11 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
+	unsigned int hash_segment = 0;
 	size_t hash_offset;
 	size_t hash_size;
 	size_t ehdr_size;
+	unsigned int i;
 	ssize_t ret;
 	void *data;
 
@@ -141,11 +143,20 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 	if (phdrs[0].p_type == PT_LOAD)
 		return ERR_PTR(-EINVAL);
 
-	if ((phdrs[1].p_flags & QCOM_MDT_TYPE_MASK) != QCOM_MDT_TYPE_HASH)
+	for (i = 1; i < ehdr->e_phnum; i++) {
+		if ((phdrs[i].p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH) {
+			hash_segment = i;
+			break;
+		}
+	}
+
+	if (!hash_segment) {
+		dev_err(dev, "no hash segment found in %s\n", fw_name);
 		return ERR_PTR(-EINVAL);
+	}
 
 	ehdr_size = phdrs[0].p_filesz;
-	hash_size = phdrs[1].p_filesz;
+	hash_size = phdrs[hash_segment].p_filesz;
 
 	data = kmalloc(ehdr_size + hash_size, GFP_KERNEL);
 	if (!data)
@@ -158,13 +169,13 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 		/* Firmware is split and hash is packed following the ELF header */
 		hash_offset = phdrs[0].p_filesz;
 		memcpy(data + ehdr_size, fw->data + hash_offset, hash_size);
-	} else if (phdrs[1].p_offset + hash_size <= fw->size) {
+	} else if (phdrs[hash_segment].p_offset + hash_size <= fw->size) {
 		/* Hash is in its own segment, but within the loaded file */
-		hash_offset = phdrs[1].p_offset;
+		hash_offset = phdrs[hash_segment].p_offset;
 		memcpy(data + ehdr_size, fw->data + hash_offset, hash_size);
 	} else {
 		/* Hash is in its own segment, beyond the loaded file */
-		ret = mdt_load_split_segment(data + ehdr_size, phdrs, 1, fw_name, dev);
+		ret = mdt_load_split_segment(data + ehdr_size, phdrs, hash_segment, fw_name, dev);
 		if (ret) {
 			kfree(data);
 			return ERR_PTR(ret);
-- 
2.33.1

