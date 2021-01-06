Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B98C2EC5AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 22:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbhAFVYn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 16:24:43 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:61815 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbhAFVYn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 16:24:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609968260; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=4TYWfsSk+aG1z3XPwo/hidVUb383BnbZ9LPVZgIeQqE=; b=YAgCVT5c5jINWZjr8OryZPCkP6sK+AHuHuQvUHlYeN94+284jPeALtasDPAXxjzXGW63oTvI
 CQs53Tm+Ppb3XOzcvNPjcMBIVC6g84JDeH3zkIOBc2BlOtEXbv8DnYF1pEDmtg/b+sjVbYf8
 zljdspHvuPjwOEBG7dSJlIJ6xBE=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ff62a62b95fc5932662053d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Jan 2021 21:23:46
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 877EDC43463; Wed,  6 Jan 2021 21:23:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7AFF9C43464;
        Wed,  6 Jan 2021 21:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7AFF9C43464
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>, psodagud@codeaurora.org,
        rishabhb@codeaurora.org
Subject: [PATCH 2/3] soc: qcom: mdt_loader: Handle split bins correctly
Date:   Wed,  6 Jan 2021 13:23:30 -0800
Message-Id: <1609968211-7579-3-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
References: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It may be that the offset of the first program header lies inside the mdt's
filesize, in this case the loader would incorrectly assume that the bins
were not split. The loading would then continue on to fail for split bins.
This change updates the logic used by the mdt loader to understand whether
the firmware images are split or not. It figures this out by checking if
each program header's segment lies within the file or not.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/soc/qcom/mdt_loader.c | 60 +++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 813216d..c9bbd8c 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -31,6 +31,26 @@ static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
 	return true;
 }
 
+static bool qcom_mdt_bins_are_split(const struct firmware *fw)
+{
+	const struct elf32_phdr *phdrs;
+	const struct elf32_hdr *ehdr;
+	uint64_t seg_start, seg_end;
+	int i;
+
+	ehdr = (struct elf32_hdr *)fw->data;
+	phdrs = (struct elf32_phdr *)(ehdr + 1);
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		seg_start = phdrs[i].p_offset;
+		seg_end = phdrs[i].p_offset + phdrs[i].p_filesz;
+		if (seg_start > fw->size || seg_end > fw->size)
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * qcom_mdt_get_size() - acquire size of the memory region needed to load mdt
  * @fw:		firmware object for the mdt file
@@ -118,7 +138,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
 		return ERR_PTR(-ENOMEM);
 
 	/* Is the header and hash already packed */
-	if (ehdr_size + hash_size == fw->size)
+	if (qcom_mdt_bins_are_split(fw))
 		hash_offset = phdrs[0].p_filesz;
 	else
 		hash_offset = phdrs[hash_index].p_offset;
@@ -150,6 +170,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	void *metadata;
 	char *fw_name;
 	bool relocate = false;
+	bool is_split;
 	void *ptr;
 	int ret = 0;
 	int i;
@@ -157,6 +178,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!fw || !mem_region || !mem_phys || !mem_size)
 		return -EINVAL;
 
+	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -238,28 +260,22 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 		ptr = mem_region + offset;
 
-		if (phdr->p_filesz && phdr->p_offset < fw->size) {
-			/* Firmware is large enough to be non-split */
-			if (phdr->p_offset + phdr->p_filesz > fw->size) {
-				dev_err(dev,
-					"failed to load segment %d from truncated file %s\n",
-					i, firmware);
-				ret = -EINVAL;
-				break;
+		if (phdr->p_filesz) {
+			if (!is_split) {
+				/* Firmware is large enough to be non-split */
+				memcpy(ptr, fw->data + phdr->p_offset, phdr->p_filesz);
+			} else {
+				/* Firmware not large enough, load split-out segments */
+				snprintf(fw_name + fw_name_len - 3, 4, "b%02d", i);
+				ret = request_firmware_into_buf(&seg_fw, fw_name, dev,
+								ptr, phdr->p_filesz);
+				if (ret) {
+					dev_err(dev, "failed to load %s\n", fw_name);
+					break;
+				}
+
+				release_firmware(seg_fw);
 			}
-
-			memcpy(ptr, fw->data + phdr->p_offset, phdr->p_filesz);
-		} else if (phdr->p_filesz) {
-			/* Firmware not large enough, load split-out segments */
-			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
-			ret = request_firmware_into_buf(&seg_fw, fw_name, dev,
-							ptr, phdr->p_filesz);
-			if (ret) {
-				dev_err(dev, "failed to load %s\n", fw_name);
-				break;
-			}
-
-			release_firmware(seg_fw);
 		}
 
 		if (phdr->p_memsz > phdr->p_filesz)
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

