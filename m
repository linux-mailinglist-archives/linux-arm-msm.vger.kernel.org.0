Return-Path: <linux-arm-msm+bounces-13031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499FC86D5A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 22:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ADD61C2337C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 21:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CA514F9D7;
	Thu, 29 Feb 2024 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EcAC3g3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478F14E2E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240167; cv=none; b=pomKEMpdi3GXWVDoJZPuSZozK2OCbQCK3gVP4uCkT0vjNUPKZWTkZJXG9q2SKJK+wFp4sxQ/ngDcV4OuWzukSstAJ23+kdS2mw0EErmaf5hHCVp9d838g+UXV6aA6fGnpYUq0Nr+sodffhnNnr+BQ4BrRFIHy2rJXJMpd6vDuhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240167; c=relaxed/simple;
	bh=C4WEfnReplN0gQTzXkMZmEt442ImK4xT7st2F/By4dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A9h41shf5x1KstoNzXCVTODCxTfhVNVn8+wN19brIqne1yJioqyB4WOGcVuWgmWDWl54l65J0l87VVMRnj3H1oJmxLx2vs9ARbcogMX3HRk4NDDG62jPf93yEU6XWA2l7KA8YbE+aKbBEJMg1meeaRM3o27L7EBPmpFxwDLru+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EcAC3g3K; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3651c1e1022so6692275ab.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 12:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709240164; x=1709844964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1od9Mf5e1UrqV2FcK9CW+GpeCIGbA7ZM3UP+zHhMOk=;
        b=EcAC3g3K7UEfy8rRSHSminWF2HHkpjr+QZ8gdSZkyo4dOiAEgCTR71Z9iCyeNMrgHh
         SJd1Ug6h3092vIIb4qUy5UnmQqQ/3VLYAWfZmK/hYpS1fW2/lY7Y01T1E4S8LKzymQlZ
         +m7RBbdSbtEJ0JVHqm3O9/URC2MRKMhZbQGN2jzb0I2GxEA41RHKpMS+oVyplNQQMdUz
         mH4KkqRbPZMdayG1u98nyg4pnflNLUuGzB1xymzMU3OhMY03QMpjGBfIJiPltFlXj21D
         o6TCtJ7uCMxjU0h6pD2xJbRLJXTYX/fmx8d3wkzvfsaYkEpqMOkuvXH0PA2U/bTGLjoy
         MvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240164; x=1709844964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1od9Mf5e1UrqV2FcK9CW+GpeCIGbA7ZM3UP+zHhMOk=;
        b=FgrEARA3dcz3kYaDGZAEe/R3dloXCdT58HGXwNJ7RQR/J7W1z34vVGpx8G1+gBGBV4
         kalKnPWqVobWEuPvoxteBWjaNhbP+n1ldwWcarPeV/jsVsX6EWgsey2+kymHqmrPtTA3
         /+c2aOd98TkWlv/RX8uq/MzX5ChHnToQp4mOROlNmK+SVgSkgY8A8gZBRJsfMHj5QoeH
         JDdwq/spLishK/IA32kaWNut/k7Zs0dmmKKsPOTHwibGxGKjhxWkHZQUJ8wGQQd9V4LO
         ONmdOcVQSrVgLxVNSy9iqay7PanSMBHzLLfNlCvD0k1Vnkuu5VVH9svm2Nvqk0x0qOBG
         CkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1HnPPBT4wIatvpMHErhwQx3y316GVwbpTBD7M4hrvCiGF5OL2cn3aMwBIzUGUs4hOclLbLesmk5fYXqmBOK6LSQ4JJ72g6DsSq9+xOw==
X-Gm-Message-State: AOJu0YzAb2sGnyfxsmBeQCQkimas50ZHiIMVpQfdrBXZczd2q5yKCe2e
	82AwXNBbu5JQK/UJOtgjrny5Dy/FOscW9kd/mnQt1239IluUz0CcZqdUK59L+6Q=
X-Google-Smtp-Source: AGHT+IGE8nNFn9cjihJfZQrMAXfbTxMQwRrViN8h+ZxBefjhLisKo+axRUJv//pEuVTxKMmHSs3yTg==
X-Received: by 2002:a05:6e02:1c09:b0:365:c6ae:c40e with SMTP id l9-20020a056e021c0900b00365c6aec40emr318786ilh.0.1709240164615;
        Thu, 29 Feb 2024 12:56:04 -0800 (PST)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id h14-20020a056e020d4e00b003658fbcf55dsm521551ilj.72.2024.02.29.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 12:56:04 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/7] net: ipa: pass a platform device to ipa_mem_init()
Date: Thu, 29 Feb 2024 14:55:51 -0600
Message-Id: <20240229205554.86762-5-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240229205554.86762-1-elder@linaro.org>
References: <20240229205554.86762-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than using the platform device pointer field in the IPA
pointer, pass a platform device pointer to ipa_mem_init().  Use
that pointer throughout that function.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_main.c |  2 +-
 drivers/net/ipa/ipa_mem.c  | 13 +++++++------
 drivers/net/ipa/ipa_mem.h  |  5 ++++-
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 5c9c1b0ef8de5..17ee075370ce6 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -870,7 +870,7 @@ static int ipa_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_kfree_ipa;
 
-	ret = ipa_mem_init(ipa, data->mem_data);
+	ret = ipa_mem_init(ipa, pdev, data->mem_data);
 	if (ret)
 		goto err_reg_exit;
 
diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
index 694960537ecda..d7df7d340221d 100644
--- a/drivers/net/ipa/ipa_mem.c
+++ b/drivers/net/ipa/ipa_mem.c
@@ -9,6 +9,7 @@
 #include <linux/bug.h>
 #include <linux/dma-mapping.h>
 #include <linux/iommu.h>
+#include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/soc/qcom/smem.h>
 
@@ -75,9 +76,9 @@ ipa_mem_zero_region_add(struct gsi_trans *trans, enum ipa_mem_id mem_id)
 int ipa_mem_setup(struct ipa *ipa)
 {
 	dma_addr_t addr = ipa->zero_addr;
-	const struct reg *reg;
 	const struct ipa_mem *mem;
 	struct gsi_trans *trans;
+	const struct reg *reg;
 	u32 offset;
 	u16 size;
 	u32 val;
@@ -615,9 +616,10 @@ static void ipa_smem_exit(struct ipa *ipa)
 }
 
 /* Perform memory region-related initialization */
-int ipa_mem_init(struct ipa *ipa, const struct ipa_mem_data *mem_data)
+int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
+		 const struct ipa_mem_data *mem_data)
 {
-	struct device *dev = &ipa->pdev->dev;
+	struct device *dev = &pdev->dev;
 	struct resource *res;
 	int ret;
 
@@ -634,14 +636,13 @@ int ipa_mem_init(struct ipa *ipa, const struct ipa_mem_data *mem_data)
 	if (!ipa_table_mem_valid(ipa, true))
 		return -EINVAL;
 
-	ret = dma_set_mask_and_coherent(&ipa->pdev->dev, DMA_BIT_MASK(64));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
 	if (ret) {
 		dev_err(dev, "error %d setting DMA mask\n", ret);
 		return ret;
 	}
 
-	res = platform_get_resource_byname(ipa->pdev, IORESOURCE_MEM,
-					   "ipa-shared");
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ipa-shared");
 	if (!res) {
 		dev_err(dev,
 			"DT error getting \"ipa-shared\" memory property\n");
diff --git a/drivers/net/ipa/ipa_mem.h b/drivers/net/ipa/ipa_mem.h
index 868e9c20e8c41..28aad00a151da 100644
--- a/drivers/net/ipa/ipa_mem.h
+++ b/drivers/net/ipa/ipa_mem.h
@@ -6,6 +6,8 @@
 #ifndef _IPA_MEM_H_
 #define _IPA_MEM_H_
 
+struct platform_device;
+
 struct ipa;
 struct ipa_mem_data;
 
@@ -100,7 +102,8 @@ int ipa_mem_setup(struct ipa *ipa);	/* No ipa_mem_teardown() needed */
 
 int ipa_mem_zero_modem(struct ipa *ipa);
 
-int ipa_mem_init(struct ipa *ipa, const struct ipa_mem_data *mem_data);
+int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
+		 const struct ipa_mem_data *mem_data);
 void ipa_mem_exit(struct ipa *ipa);
 
 #endif /* _IPA_MEM_H_ */
-- 
2.40.1


