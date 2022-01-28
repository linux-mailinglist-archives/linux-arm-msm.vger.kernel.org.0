Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5B649F171
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 03:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345697AbiA1CzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 21:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345659AbiA1Cy5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 21:54:57 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE34C061771
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:55 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id g15-20020a9d6b0f000000b005a062b0dc12so4478855otp.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N98X4yF1OPRtC844t3xgEHOdot9+r2TcGrVSAV2KyjY=;
        b=sfwDdb/YePJO3FjZRa5T1tABRtU/lHlCPq8ICb0lBzhdusEWU8be3yLrwDDj/IzwKQ
         2kOQpO0HtQCvw1zIhPJfcH2ar5+PKIYBe2g+TcXjtXf83+jeVKVtoFyzDKPUFBNOWu6p
         9aMYvhgDdA3EY47VfFDO5SE7ibNeZg/iZOCSEH+v/S2nl0nw5c1lvXd8wkucaWQUfalB
         +D2Rk2STqRIddWfZCqAs00w38MRsK3r2B0RAwfd/ctdLCcMBoYqHfX9wB8X8YcsSdD/9
         l5mrn5rsDN7JN3krlmSmLL99IleT8yJS95ROv6cl63PZUyfj7sxr4EMxqIdUWaK3CUJt
         mV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N98X4yF1OPRtC844t3xgEHOdot9+r2TcGrVSAV2KyjY=;
        b=xP09XmSWBmfyyOkYWp1pqC4z8zruftlquijkAh65bXoB7dH4wBOsN0id4sftjc4rWc
         R8DXedvOt8zMtGTKuUItPrfnmYwH8/cJfduLNqF60OmZqd90+gF9YH6WiA+cWyB4iIzP
         28orbfH7fMojAKVNAVBKBMhb4AFj8gNmFnt4lwHf5Z6/KSeVPzGGMVuLCOZ44q0Wf9tV
         q0zD9WBDnaEjFHECHfKZAT1rn72x7vJUPJOZFwsnpOF7kfNJRZw0dxqQCAqZ4Su63FcQ
         9fhTeNbva+DZEVOpWA3xFAj4NJz4MghqkVGSFGRLSE8F1oQ8qVIfDaEMBrtQ1jCQtxKi
         8wbA==
X-Gm-Message-State: AOAM531HLsFcbIrab/Bj33T6sj1H7cZbmC65lSIsLkAljNNMBBV8b8Rd
        QOEq6sjreJgt3lWWfEyzOf2b3Q==
X-Google-Smtp-Source: ABdhPJw5EVycDW6hSeepuqT1+LSeBsYTa6Havz77lHUZ008U48f/Sr34mTfY4lGrgeebQohPk4O7Mg==
X-Received: by 2002:a05:6830:3143:: with SMTP id c3mr3387607ots.28.1643338495091;
        Thu, 27 Jan 2022 18:54:55 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:54 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] soc: qcom: mdt_loader: Extract PAS operations
Date:   Thu, 27 Jan 2022 18:55:08 -0800
Message-Id: <20220128025513.97188-9-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than passing a boolean to indicate if the PAS operations should
be performed from within __mdt_load(), extract them to their own helper
function.

This will allow clients to invoke this directly, with some
qcom_scm_pas_metadata context that they later needs to release, without
further having to complicate the prototype of qcom_mdt_load().

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c       | 110 +++++++++++++++++++---------
 include/linux/soc/qcom/mdt_loader.h |  11 +++
 2 files changed, 85 insertions(+), 36 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c8d43dc50cff..f0b1d969567c 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -188,6 +188,74 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
 
+/**
+ * qcom_mdt_pas_init() - initialize PAS region for firmware loading
+ * @dev:	device handle to associate resources with
+ * @fw:		firmware object for the mdt file
+ * @firmware:	name of the firmware, for construction of segment file names
+ * @pas_id:	PAS identifier
+ * @mem_phys:	physical address of allocated memory region
+ * @ctx:	PAS metadata context, to be released by caller
+ *
+ * Returns 0 on success, negative errno otherwise.
+ */
+int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
+		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
+		      struct qcom_scm_pas_metadata *ctx)
+{
+	const struct elf32_phdr *phdrs;
+	const struct elf32_phdr *phdr;
+	const struct elf32_hdr *ehdr;
+	phys_addr_t min_addr = PHYS_ADDR_MAX;
+	phys_addr_t max_addr = 0;
+	size_t metadata_len;
+	void *metadata;
+	int ret;
+	int i;
+
+	ehdr = (struct elf32_hdr *)fw->data;
+	phdrs = (struct elf32_phdr *)(ehdr + 1);
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = &phdrs[i];
+
+		if (!mdt_phdr_valid(phdr))
+			continue;
+
+		if (phdr->p_paddr < min_addr)
+			min_addr = phdr->p_paddr;
+
+		if (phdr->p_paddr + phdr->p_memsz > max_addr)
+			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
+	}
+
+	metadata = qcom_mdt_read_metadata(fw, &metadata_len, fw_name, dev);
+	if (IS_ERR(metadata)) {
+		ret = PTR_ERR(metadata);
+		dev_err(dev, "error %d reading firmware %s metadata\n", ret, fw_name);
+		goto out;
+	}
+
+	ret = qcom_scm_pas_init_image(pas_id, metadata, metadata_len, ctx);
+	kfree(metadata);
+	if (ret) {
+		/* Invalid firmware metadata */
+		dev_err(dev, "error %d initializing firmware %s\n", ret, fw_name);
+		goto out;
+	}
+
+	ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
+	if (ret) {
+		/* Unable to set up relocation */
+		dev_err(dev, "error %d setting up firmware %s\n", ret, fw_name);
+		goto out;
+	}
+
+out:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
+
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			   const char *fw_name, int pas_id, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
@@ -198,10 +266,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	const struct elf32_hdr *ehdr;
 	phys_addr_t mem_reloc;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
-	phys_addr_t max_addr = 0;
-	size_t metadata_len;
 	ssize_t offset;
-	void *metadata;
 	bool relocate = false;
 	void *ptr;
 	int ret = 0;
@@ -224,37 +289,6 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 		if (phdr->p_paddr < min_addr)
 			min_addr = phdr->p_paddr;
-
-		if (phdr->p_paddr + phdr->p_memsz > max_addr)
-			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
-	}
-
-	if (pas_init) {
-		metadata = qcom_mdt_read_metadata(fw, &metadata_len, fw_name, dev);
-		if (IS_ERR(metadata)) {
-			ret = PTR_ERR(metadata);
-			dev_err(dev, "error %d reading firmware %s metadata\n",
-				ret, fw_name);
-			goto out;
-		}
-
-		ret = qcom_scm_pas_init_image(pas_id, metadata, metadata_len, NULL);
-
-		kfree(metadata);
-		if (ret) {
-			/* Invalid firmware metadata */
-			dev_err(dev, "error %d initializing firmware %s\n",
-				ret, fw_name);
-			goto out;
-		}
-
-		ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
-		if (ret) {
-			/* Unable to set up relocation */
-			dev_err(dev, "error %d setting up firmware %s\n",
-				ret, fw_name);
-			goto out;
-		}
 	}
 
 	if (relocate) {
@@ -319,8 +353,6 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (reloc_base)
 		*reloc_base = mem_reloc;
 
-out:
-
 	return ret;
 }
 
@@ -342,6 +374,12 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t mem_phys, size_t mem_size,
 		  phys_addr_t *reloc_base)
 {
+	int ret;
+
+	ret = qcom_mdt_pas_init(dev, fw, firmware, pas_id, mem_phys, NULL);
+	if (ret)
+		return ret;
+
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
 			       mem_size, reloc_base, true);
 }
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 46bdb7bace9a..ef8a6278264d 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -10,10 +10,14 @@
 
 struct device;
 struct firmware;
+struct qcom_scm_pas_metadata;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
+int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
+		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
+		      struct qcom_scm_pas_metadata *pas_metadata_ctx);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
 		  phys_addr_t mem_phys, size_t mem_size,
@@ -33,6 +37,13 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
+static int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
+			     const char *fw_name, int pas_id, phys_addr_t mem_phys,
+			     struct qcom_scm_pas_metadata *pas_metadata_ctx)
+{
+	return -ENODEV;
+}
+
 static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 				const char *fw_name, int pas_id,
 				void *mem_region, phys_addr_t mem_phys,
-- 
2.33.1

