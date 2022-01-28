Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2171849F179
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 03:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345638AbiA1CzE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 21:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345635AbiA1Cy4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 21:54:56 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C19C06175A
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:54 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id p4-20020a4a8e84000000b002e598a51d60so1147218ook.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RTwg5KvKYjsTu6x08Cr32D16DOEKvzcD7sbsXNJ+uXY=;
        b=K8V/09ysiH0Fouxf5Tc2rZDy8N8WIUIQDQ8VPe4/cUpLFW9HQpJZ7Uj3Wbjyw5gPE2
         QIz6xbpoCcfcX5fKtHAkx6bcEapm3uxtJveoRK5Z8y0IruuB+u1j1MolkvZBVLXqrM2R
         dBYhHr9gPLSBM5qeG1W+NV5c/ZgJs+7DnCRFcn2V8ItQRlwUzkt1gke2xJLrd6DziEOl
         Emri/hIyeKIcunM9XtWYzUWazakwo5reUPYMPjEIQyKKywOt+HmHIXrihIQcyySpn5HL
         QKIk1B4WtMmJR7abmuQYk0IfKlRdr64gW4oDwMglZHwWzBQv/RmIfkiU2hRP+RM78wod
         A/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RTwg5KvKYjsTu6x08Cr32D16DOEKvzcD7sbsXNJ+uXY=;
        b=py5sm+MyHa8UhtiqN+N4av+3UFId3SQyUtTEQz9IPt7/GGPbDnyCA1ElE1HhkkB88+
         kgh/OFFaZVV58lhBVp6Ri0s3ya1hL4iKHGzX4iBE8y9VnCSWr9NQHrifNUK5vzHLGH6m
         kGNpBz3KF+2WzW/3Vy3fPakhpsVLB0MjG27gO8OcRo/iWYtTsJfbtJXU8LM9J5J3QnHf
         8mHyrD4cB9+zS5EwEth00bEHGFb3pjITdBp3cyQIIf+iH2HhM+fgytfo7VLjuGVuyKmP
         QppzYei2Rxht5LOBasYdQYG4/Yt0yQwY3KKrV0vdImCAUKi0dYFTEyVKTmTpiJ5gcC3O
         91UQ==
X-Gm-Message-State: AOAM532SlTTA4ou3Tka0OGiFKYMJK8TsfN/Q1NWCHMoTWzHTqcxrV8Bq
        QLXhp2+V/O8gDUa1dpfhqkQM8Q==
X-Google-Smtp-Source: ABdhPJxuOarBgKU/g5GByZEi1kS52yQcDBSu+8HKDr3z0ak7bPikqPYdBhTJzL7n/TKmQdGTusvNXQ==
X-Received: by 2002:a4a:aa0e:: with SMTP id x14mr3373194oom.98.1643338493375;
        Thu, 27 Jan 2022 18:54:53 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:52 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] soc: qcom: mdt_loader: Reorder parts of __qcom_mdt_load()
Date:   Thu, 27 Jan 2022 18:55:06 -0800
Message-Id: <20220128025513.97188-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the traversal of the program headers to the start of the function,
to make sure that min_ and max_addr are in scope as the call to
qcom_scm_pas_mem_setup() is moved in the next commit.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 37e2e734bc5d..ee991784a738 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -213,6 +213,22 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = &phdrs[i];
+
+		if (!mdt_phdr_valid(phdr))
+			continue;
+
+		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
+			relocate = true;
+
+		if (phdr->p_paddr < min_addr)
+			min_addr = phdr->p_paddr;
+
+		if (phdr->p_paddr + phdr->p_memsz > max_addr)
+			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
+	}
+
 	if (pas_init) {
 		metadata = qcom_mdt_read_metadata(fw, &metadata_len, fw_name, dev);
 		if (IS_ERR(metadata)) {
@@ -233,22 +249,6 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		}
 	}
 
-	for (i = 0; i < ehdr->e_phnum; i++) {
-		phdr = &phdrs[i];
-
-		if (!mdt_phdr_valid(phdr))
-			continue;
-
-		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
-			relocate = true;
-
-		if (phdr->p_paddr < min_addr)
-			min_addr = phdr->p_paddr;
-
-		if (phdr->p_paddr + phdr->p_memsz > max_addr)
-			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
-	}
-
 	if (relocate) {
 		if (pas_init) {
 			ret = qcom_scm_pas_mem_setup(pas_id, mem_phys,
-- 
2.33.1

