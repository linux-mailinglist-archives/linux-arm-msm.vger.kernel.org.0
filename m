Return-Path: <linux-arm-msm+bounces-13102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C602C86E6A5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 18:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E36BD1C25A14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 17:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EC4443E;
	Fri,  1 Mar 2024 17:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NU43KbUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B86F513
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312575; cv=none; b=rCLFKdMq9rmU6CUP0FsMMhGQ5ZummOuTDW1/hEwbqxFgxDVQS7KEmwjWYtj9IkFoLbkm0QRiZ0GdBchEakb5lpqga0ixA7B1kG1gbpgra+Y+Kge9YCZgCD2CcYXAfJOslTgC5FPjrx1NDSfR6xmoL4c+ybz69bm7bTCyB4OocVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312575; c=relaxed/simple;
	bh=C4WEfnReplN0gQTzXkMZmEt442ImK4xT7st2F/By4dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BkH4gU86vtjNvSknHq6zAUs/Id/VCHKufJp10H0tBgiMZ4OSVTSVjoTehLWyq/XvuVD0lDHONS6smTsgMz08wbRTccxHCqF90ClhSdABsc2KP19QMNCvOagV+Lc81z0LF29sE4PgxkmObXEQhS6T7rYxPpQ2vSia9pIf3CQYus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NU43KbUI; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7c81e087882so31180139f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 09:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709312571; x=1709917371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1od9Mf5e1UrqV2FcK9CW+GpeCIGbA7ZM3UP+zHhMOk=;
        b=NU43KbUI3qj5J1dqdZ+CXUQJpf5ZEmFXgF9iI2pkqDNFLzJKgQXfCNje/IqqjUKvHa
         HXDeMo0/7B9dSNEM1dZO//om7aqdw0DqEDHAc+fJcIUKhuC2Nn8w2n+rZvZk9l82IJa/
         we90sqP0QsaqqdL50LftNLWe8hRwspNsNOXiu0s/T84WXxsS4ZKpkxLwaxw0gUxhwfwZ
         m9zZGjI4dAKvXlwNeWgs7xn2e4UxR1eUfyWThPFO4u4XAw7J0q/q06AKqi9WSVv1PXje
         /1YpLZLCZ7omRltFggNhW/986ed2f5uRkTvRj/CrhyElQEgLjh9MlRq2BtX2Iz+jH4M9
         UZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709312571; x=1709917371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1od9Mf5e1UrqV2FcK9CW+GpeCIGbA7ZM3UP+zHhMOk=;
        b=E7kFRmwQY/Srhx1aI54/1fgKNM6qXIgdKAeonBkIS8+Xs7SGMoD/RH4sLZrwhvkwnU
         wLWB90XJR5ipO1khCkMFa/SVC7Z7bLM6tBGX3Y2pJatlq9mbDrkS5cFgIQO1lqVeWcnh
         8jcr5nzlFxEGOx/OP17IpdCg5PcjdAXZvBZxy18nYbYQ0WfUhqLySV0EsO0Laypv0ehu
         Ck8FsWQu1y6Xr3RW4WoYKpqO4CrsYNNcPcP8ZkInm7JSeqvTvP+yBWxE6/LvXbRQW1RA
         X4YbxYXuKyuYVB3WRvTE28oDMSVMbUvDrOA5MhK+oYd8frSr/92eNC77bsfZYTrux0Um
         JiFg==
X-Forwarded-Encrypted: i=1; AJvYcCWIVb8jNeuzlkdKPRjm5UDUKbsnTTgaqXRlIwv2R23aMvpksZsAdu0QBYfKLI3RkMKIR+ALvpXBsoYrwLPjgvGpsj5aM/FJU2hdpG8ZNA==
X-Gm-Message-State: AOJu0YxM41RbcQGIOYJQereNWloaw5GQbbV9Qibaeaq4fhercBF2bdw8
	z5vSxicYk/eoeV7PmtU/7lZZWgDi8oqWRfCNxuFAXG5gECog+4EM7b5/tXpW6F4=
X-Google-Smtp-Source: AGHT+IFKq3ninjSPbxfeCsVJ+HOfQBqUgzK6ZYXi5n/KtwuSbZFpzhfNQAP2pp2m3ZB3TD1gzESWIQ==
X-Received: by 2002:a05:6e02:1d13:b0:365:2445:ffd6 with SMTP id i19-20020a056e021d1300b003652445ffd6mr1369615ila.13.1709312571464;
        Fri, 01 Mar 2024 09:02:51 -0800 (PST)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id o2-20020a92dac2000000b0036581060910sm991430ilq.6.2024.03.01.09.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 09:02:51 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 4/7] net: ipa: pass a platform device to ipa_mem_init()
Date: Fri,  1 Mar 2024 11:02:39 -0600
Message-Id: <20240301170242.243703-5-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240301170242.243703-1-elder@linaro.org>
References: <20240301170242.243703-1-elder@linaro.org>
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


