Return-Path: <linux-arm-msm+bounces-45308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 991ECA14083
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 18:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB3E1188DBFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 17:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FE922FDF4;
	Thu, 16 Jan 2025 17:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRv+l1bZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65BB22FDEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 17:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737047837; cv=none; b=WE5+m4Xpj6SBnlFPNtXCeel9WxfrbOqMwNL4YGgUPKtiB6PgGlC+kIlNTw4xVMFtm6KlVK14HvUZHOz/kGnTfVxNfGTA2Spty2otrG5oDW6utW1EUgWHBLRpdTKQPUXSNwu+h1vxP3JlgYTOdi4YonyDspNWO5bk1LhiRkmGoK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737047837; c=relaxed/simple;
	bh=8i19ersHUZMb86vMtLcyfLk8xTt4r479HTpD4LRxUv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PLEthkV1nuK2gZLL7cPxEyqrzopyqCYB6nmwMk1PQw+Dxzbu7wCWds5rTpTQgE6MPOBOyv7WcjACe0BX/0mG8pPJo/o7uFohuYhpgf6FrxiaPM3OcQx6W/2JBeNcXIYSG7JCaGjEr1kBcab86HqDpT6n1kjj4AAXzTL1eJ4PQd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BRv+l1bZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2166022c5caso20394525ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 09:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737047834; x=1737652634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fzvr7HwHF1obH42oicFK1h3md6m6746zyVd8I58op4=;
        b=BRv+l1bZkuYvgMZ/bmKXDm4mmL3fT1QC41en2EdFEkL/RI2eZOIv30hsRBOY3zMxUu
         srLndXRLfk97iycagnivtWT9oc0MntBh7edlahTuRhyxq5awarPBGdf/v9EP3w02arR6
         /DGs80xhbc3t1kvTWv7bcgKS5Eyz77uZgpiAqboxWiTmsnMwN/lhlmDoQHDuvknnOA4c
         3KGYSh1JjaanK1r3JrpWqdfM+6PTAYF+zOsBPICf8vrdS1HfBbEn/gSSEmnGE713IjmJ
         FGgqZb74dB0Go5VVlMUo8UstSAmWqnMMWOjY4Pm+j4BnSoBcXjDDGbv3cP1LjKMYONgL
         eCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737047834; x=1737652634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fzvr7HwHF1obH42oicFK1h3md6m6746zyVd8I58op4=;
        b=lURyJzQZE+cHHvn7R/TtD0CCJbxwq8N7vGQQlO7WPBj8YkJvj0rArcNRux0xFqrKAk
         HGepoL9iRaV9WYwuIKTLTzurYp3CjnhcJmjAYRL7Ja1F2kWX1+MEODmX1PNF9YA+T7zC
         Odj/UtCgsK6YNP1l9r30iQ8BD+4JPl/V5C8Y8POt7aBtbls5+E0fr2//tgsPUeSTCd0C
         HVyJhNMD8HMqNQ4LqqhMwfX5enSjX4+TKVTRnv/tsyX4X5C9LEtkTWNE0G5STkHZoG00
         UX1hSuQ1DGWUfU7R3VLmfTEshsYjsNjquYAonb9VhNciC2s5xxBzQbVm2tJTzJGAMBPc
         ao2A==
X-Forwarded-Encrypted: i=1; AJvYcCU2rC8QfDEpFw8ULp5BY/qByddYvFdFbFs+CM/t+tVCrOUDyXgNrEThkpktxb981Ov1rroCgT3Vd6u7yjla@vger.kernel.org
X-Gm-Message-State: AOJu0YwNuvB9TWGSpX8Ddzleu5SAlUq98SJFfJxOHxDTmgic2dtjMwIQ
	+by9ParCTeQFK0r6kh57ZLRtbGccc5ZRYQcwGVLprW72bi4vWlivJi9EZWnyRw==
X-Gm-Gg: ASbGnctp+63QU+kH7dFA1rC7c7tspyI8qLl/w8zBxe45B6zAF7CqSlVpoac4b46NphA
	1hNrqvtUMxfKy+ZgAhVR7iCFndqyU/cDnaSuj77TOYIR5A1KgHkJfNLM+Si+/9ykGcHmucLYWPf
	4pJ7k2Q8/8hD1nTcBch7eIaCYWw8s1vj7+VELdGgfI3ZVQdiuqLf5PeP/T+mKaw/ldPMpDEot0P
	XjNCPo5pxHamEGDeoaKfKmdvjqMQxw+HXH2v88QYVpLzlnIU3akFCN3iAlZlnVZmL5lwhgljjmc
	K14bs54p
X-Google-Smtp-Source: AGHT+IGvcipleEhz8x/unPgqIeso5iLQCAR6ilUBNzWYGQNXS7djEjPFsUveVJYyk/5DWM4LyCGtOA==
X-Received: by 2002:a05:6a21:1087:b0:1e1:b0df:6cd7 with SMTP id adf61e73a8af0-1e88cf7f768mr47493123637.5.1737047833829;
        Thu, 16 Jan 2025 09:17:13 -0800 (PST)
Received: from localhost.localdomain ([120.60.79.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f1846sm275155b3a.15.2025.01.16.09.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:17:13 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kw@linux.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	lpieralisi@kernel.org,
	shuah@kernel.org
Cc: kishon@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	linux-kselftest@vger.kernel.org,
	cassel@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH v6 2/4] misc: pci_endpoint_test: Fix the return value of IOCTL
Date: Thu, 16 Jan 2025 22:46:48 +0530
Message-Id: <20250116171650.33585-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250116171650.33585-1-manivannan.sadhasivam@linaro.org>
References: <20250116171650.33585-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IOCTLs are supposed to return 0 for success and negative error codes for
failure. Currently, this driver is returning 0 for failure and 1 for
success, that's not correct. Hence, fix it!

Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Closes: https://lore.kernel.org/all/YvzNg5ROnxEApDgS@kroah.com
Fixes: 2c156ac71c6b ("misc: Add host side PCI driver for PCI test function device")
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/misc/pci_endpoint_test.c | 255 +++++++++++++++----------------
 tools/pci/pcitest.c              |  51 ++++---
 2 files changed, 153 insertions(+), 153 deletions(-)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index abe6c8f03fca..906658acff0f 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -169,43 +169,47 @@ static void pci_endpoint_test_free_irq_vectors(struct pci_endpoint_test *test)
 	test->irq_type = IRQ_TYPE_UNDEFINED;
 }
 
-static bool pci_endpoint_test_alloc_irq_vectors(struct pci_endpoint_test *test,
+static int pci_endpoint_test_alloc_irq_vectors(struct pci_endpoint_test *test,
 						int type)
 {
-	int irq = -1;
+	int irq;
 	struct pci_dev *pdev = test->pdev;
 	struct device *dev = &pdev->dev;
-	bool res = true;
 
 	switch (type) {
 	case IRQ_TYPE_INTX:
 		irq = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_INTX);
-		if (irq < 0)
+		if (irq < 0) {
 			dev_err(dev, "Failed to get Legacy interrupt\n");
+			return irq;
+		}
+
 		break;
 	case IRQ_TYPE_MSI:
 		irq = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
-		if (irq < 0)
+		if (irq < 0) {
 			dev_err(dev, "Failed to get MSI interrupts\n");
+			return irq;
+		}
+
 		break;
 	case IRQ_TYPE_MSIX:
 		irq = pci_alloc_irq_vectors(pdev, 1, 2048, PCI_IRQ_MSIX);
-		if (irq < 0)
+		if (irq < 0) {
 			dev_err(dev, "Failed to get MSI-X interrupts\n");
+			return irq;
+		}
+
 		break;
 	default:
 		dev_err(dev, "Invalid IRQ type selected\n");
-	}
-
-	if (irq < 0) {
-		irq = 0;
-		res = false;
+		return -EINVAL;
 	}
 
 	test->irq_type = type;
 	test->num_irqs = irq;
 
-	return res;
+	return 0;
 }
 
 static void pci_endpoint_test_release_irq(struct pci_endpoint_test *test)
@@ -220,22 +224,22 @@ static void pci_endpoint_test_release_irq(struct pci_endpoint_test *test)
 	test->num_irqs = 0;
 }
 
-static bool pci_endpoint_test_request_irq(struct pci_endpoint_test *test)
+static int pci_endpoint_test_request_irq(struct pci_endpoint_test *test)
 {
 	int i;
-	int err;
+	int ret;
 	struct pci_dev *pdev = test->pdev;
 	struct device *dev = &pdev->dev;
 
 	for (i = 0; i < test->num_irqs; i++) {
-		err = devm_request_irq(dev, pci_irq_vector(pdev, i),
+		ret = devm_request_irq(dev, pci_irq_vector(pdev, i),
 				       pci_endpoint_test_irqhandler,
 				       IRQF_SHARED, test->name, test);
-		if (err)
+		if (ret)
 			goto fail;
 	}
 
-	return true;
+	return 0;
 
 fail:
 	switch (irq_type) {
@@ -255,7 +259,7 @@ static bool pci_endpoint_test_request_irq(struct pci_endpoint_test *test)
 		break;
 	}
 
-	return false;
+	return ret;
 }
 
 static const u32 bar_test_pattern[] = {
@@ -280,7 +284,7 @@ static int pci_endpoint_test_bar_memcmp(struct pci_endpoint_test *test,
 	return memcmp(write_buf, read_buf, size);
 }
 
-static bool pci_endpoint_test_bar(struct pci_endpoint_test *test,
+static int pci_endpoint_test_bar(struct pci_endpoint_test *test,
 				  enum pci_barno barno)
 {
 	int j, buf_size, iters;
@@ -290,7 +294,7 @@ static bool pci_endpoint_test_bar(struct pci_endpoint_test *test,
 	resource_size_t bar_size;
 
 	if (!test->bar[barno])
-		return false;
+		return -ENOMEM;
 
 	bar_size = pci_resource_len(pdev, barno);
 
@@ -305,19 +309,19 @@ static bool pci_endpoint_test_bar(struct pci_endpoint_test *test,
 
 	write_buf = kmalloc(buf_size, GFP_KERNEL);
 	if (!write_buf)
-		return false;
+		return -ENOMEM;
 
 	read_buf = kmalloc(buf_size, GFP_KERNEL);
 	if (!read_buf)
-		return false;
+		return -ENOMEM;
 
 	iters = div_u64(bar_size, buf_size);
 	for (j = 0; j < iters; j++)
 		if (pci_endpoint_test_bar_memcmp(test, barno, buf_size * j,
 						 write_buf, read_buf, buf_size))
-			return false;
+			return -EIO;
 
-	return true;
+	return 0;
 }
 
 static u32 bar_test_pattern_with_offset(enum pci_barno barno, int offset)
@@ -332,7 +336,7 @@ static u32 bar_test_pattern_with_offset(enum pci_barno barno, int offset)
 	return val;
 }
 
-static bool pci_endpoint_test_bars_write_bar(struct pci_endpoint_test *test,
+static void pci_endpoint_test_bars_write_bar(struct pci_endpoint_test *test,
 					     enum pci_barno barno)
 {
 	struct pci_dev *pdev = test->pdev;
@@ -346,11 +350,9 @@ static bool pci_endpoint_test_bars_write_bar(struct pci_endpoint_test *test,
 	for (j = 0; j < size; j += 4)
 		writel_relaxed(bar_test_pattern_with_offset(barno, j),
 			       test->bar[barno] + j);
-
-	return true;
 }
 
-static bool pci_endpoint_test_bars_read_bar(struct pci_endpoint_test *test,
+static int pci_endpoint_test_bars_read_bar(struct pci_endpoint_test *test,
 					    enum pci_barno barno)
 {
 	struct pci_dev *pdev = test->pdev;
@@ -371,14 +373,14 @@ static bool pci_endpoint_test_bars_read_bar(struct pci_endpoint_test *test,
 			dev_err(dev,
 				"BAR%d incorrect data at offset: %#x, got: %#x expected: %#x\n",
 				barno, j, val, expected);
-			return false;
+			return -EIO;
 		}
 	}
 
-	return true;
+	return 0;
 }
 
-static bool pci_endpoint_test_bars(struct pci_endpoint_test *test)
+static int pci_endpoint_test_bars(struct pci_endpoint_test *test)
 {
 	enum pci_barno bar;
 	bool ret;
@@ -402,10 +404,10 @@ static bool pci_endpoint_test_bars(struct pci_endpoint_test *test)
 		}
 	}
 
-	return true;
+	return 0;
 }
 
-static bool pci_endpoint_test_intx_irq(struct pci_endpoint_test *test)
+static int pci_endpoint_test_intx_irq(struct pci_endpoint_test *test)
 {
 	u32 val;
 
@@ -417,16 +419,17 @@ static bool pci_endpoint_test_intx_irq(struct pci_endpoint_test *test)
 	val = wait_for_completion_timeout(&test->irq_raised,
 					  msecs_to_jiffies(1000));
 	if (!val)
-		return false;
+		return -ETIMEDOUT;
 
-	return true;
+	return 0;
 }
 
-static bool pci_endpoint_test_msi_irq(struct pci_endpoint_test *test,
+static int pci_endpoint_test_msi_irq(struct pci_endpoint_test *test,
 				       u16 msi_num, bool msix)
 {
-	u32 val;
 	struct pci_dev *pdev = test->pdev;
+	u32 val;
+	int ret;
 
 	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE,
 				 msix ? IRQ_TYPE_MSIX : IRQ_TYPE_MSI);
@@ -437,9 +440,16 @@ static bool pci_endpoint_test_msi_irq(struct pci_endpoint_test *test,
 	val = wait_for_completion_timeout(&test->irq_raised,
 					  msecs_to_jiffies(1000));
 	if (!val)
-		return false;
+		return -ETIMEDOUT;
 
-	return pci_irq_vector(pdev, msi_num - 1) == test->last_irq;
+	ret = pci_irq_vector(pdev, msi_num - 1);
+	if (ret < 0)
+		return ret;
+
+	if (ret != test->last_irq)
+		return -EIO;
+
+	return 0;
 }
 
 static int pci_endpoint_test_validate_xfer_params(struct device *dev,
@@ -458,11 +468,10 @@ static int pci_endpoint_test_validate_xfer_params(struct device *dev,
 	return 0;
 }
 
-static bool pci_endpoint_test_copy(struct pci_endpoint_test *test,
+static int pci_endpoint_test_copy(struct pci_endpoint_test *test,
 				   unsigned long arg)
 {
 	struct pci_endpoint_test_xfer_param param;
-	bool ret = false;
 	void *src_addr;
 	void *dst_addr;
 	u32 flags = 0;
@@ -481,17 +490,17 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test,
 	int irq_type = test->irq_type;
 	u32 src_crc32;
 	u32 dst_crc32;
-	int err;
+	int ret;
 
-	err = copy_from_user(&param, (void __user *)arg, sizeof(param));
-	if (err) {
+	ret = copy_from_user(&param, (void __user *)arg, sizeof(param));
+	if (ret) {
 		dev_err(dev, "Failed to get transfer param\n");
-		return false;
+		return -EFAULT;
 	}
 
-	err = pci_endpoint_test_validate_xfer_params(dev, &param, alignment);
-	if (err)
-		return false;
+	ret = pci_endpoint_test_validate_xfer_params(dev, &param, alignment);
+	if (ret)
+		return ret;
 
 	size = param.size;
 
@@ -501,22 +510,21 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test,
 
 	if (irq_type < IRQ_TYPE_INTX || irq_type > IRQ_TYPE_MSIX) {
 		dev_err(dev, "Invalid IRQ type option\n");
-		goto err;
+		return -EINVAL;
 	}
 
 	orig_src_addr = kzalloc(size + alignment, GFP_KERNEL);
 	if (!orig_src_addr) {
 		dev_err(dev, "Failed to allocate source buffer\n");
-		ret = false;
-		goto err;
+		return -ENOMEM;
 	}
 
 	get_random_bytes(orig_src_addr, size + alignment);
 	orig_src_phys_addr = dma_map_single(dev, orig_src_addr,
 					    size + alignment, DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, orig_src_phys_addr)) {
+	ret = dma_mapping_error(dev, orig_src_phys_addr);
+	if (ret) {
 		dev_err(dev, "failed to map source buffer address\n");
-		ret = false;
 		goto err_src_phys_addr;
 	}
 
@@ -540,15 +548,15 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test,
 	orig_dst_addr = kzalloc(size + alignment, GFP_KERNEL);
 	if (!orig_dst_addr) {
 		dev_err(dev, "Failed to allocate destination address\n");
-		ret = false;
+		ret = -ENOMEM;
 		goto err_dst_addr;
 	}
 
 	orig_dst_phys_addr = dma_map_single(dev, orig_dst_addr,
 					    size + alignment, DMA_FROM_DEVICE);
-	if (dma_mapping_error(dev, orig_dst_phys_addr)) {
+	ret = dma_mapping_error(dev, orig_dst_phys_addr);
+	if (ret) {
 		dev_err(dev, "failed to map destination buffer address\n");
-		ret = false;
 		goto err_dst_phys_addr;
 	}
 
@@ -581,8 +589,8 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test,
 			 DMA_FROM_DEVICE);
 
 	dst_crc32 = crc32_le(~0, dst_addr, size);
-	if (dst_crc32 == src_crc32)
-		ret = true;
+	if (dst_crc32 != src_crc32)
+		ret = -EIO;
 
 err_dst_phys_addr:
 	kfree(orig_dst_addr);
@@ -593,16 +601,13 @@ static bool pci_endpoint_test_copy(struct pci_endpoint_test *test,
 
 err_src_phys_addr:
 	kfree(orig_src_addr);
-
-err:
 	return ret;
 }
 
-static bool pci_endpoint_test_write(struct pci_endpoint_test *test,
+static int pci_endpoint_test_write(struct pci_endpoint_test *test,
 				    unsigned long arg)
 {
 	struct pci_endpoint_test_xfer_param param;
-	bool ret = false;
 	u32 flags = 0;
 	bool use_dma;
 	u32 reg;
@@ -617,17 +622,17 @@ static bool pci_endpoint_test_write(struct pci_endpoint_test *test,
 	int irq_type = test->irq_type;
 	size_t size;
 	u32 crc32;
-	int err;
+	int ret;
 
-	err = copy_from_user(&param, (void __user *)arg, sizeof(param));
-	if (err != 0) {
+	ret = copy_from_user(&param, (void __user *)arg, sizeof(param));
+	if (ret) {
 		dev_err(dev, "Failed to get transfer param\n");
-		return false;
+		return -EFAULT;
 	}
 
-	err = pci_endpoint_test_validate_xfer_params(dev, &param, alignment);
-	if (err)
-		return false;
+	ret = pci_endpoint_test_validate_xfer_params(dev, &param, alignment);
+	if (ret)
+		return ret;
 
 	size = param.size;
 
@@ -637,23 +642,22 @@ static bool pci_endpoint_test_write(struct pci_endpoint_test *test,
 
 	if (irq_type < IRQ_TYPE_INTX || irq_type > IRQ_TYPE_MSIX) {
 		dev_err(dev, "Invalid IRQ type option\n");
-		goto err;
+		return -EINVAL;
 	}
 
 	orig_addr = kzalloc(size + alignment, GFP_KERNEL);
 	if (!orig_addr) {
 		dev_err(dev, "Failed to allocate address\n");
-		ret = false;
-		goto err;
+		return -ENOMEM;
 	}
 
 	get_random_bytes(orig_addr, size + alignment);
 
 	orig_phys_addr = dma_map_single(dev, orig_addr, size + alignment,
 					DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, orig_phys_addr)) {
+	ret = dma_mapping_error(dev, orig_phys_addr);
+	if (ret) {
 		dev_err(dev, "failed to map source buffer address\n");
-		ret = false;
 		goto err_phys_addr;
 	}
 
@@ -686,24 +690,21 @@ static bool pci_endpoint_test_write(struct pci_endpoint_test *test,
 	wait_for_completion(&test->irq_raised);
 
 	reg = pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_STATUS);
-	if (reg & STATUS_READ_SUCCESS)
-		ret = true;
+	if (!(reg & STATUS_READ_SUCCESS))
+		ret = -EIO;
 
 	dma_unmap_single(dev, orig_phys_addr, size + alignment,
 			 DMA_TO_DEVICE);
 
 err_phys_addr:
 	kfree(orig_addr);
-
-err:
 	return ret;
 }
 
-static bool pci_endpoint_test_read(struct pci_endpoint_test *test,
+static int pci_endpoint_test_read(struct pci_endpoint_test *test,
 				   unsigned long arg)
 {
 	struct pci_endpoint_test_xfer_param param;
-	bool ret = false;
 	u32 flags = 0;
 	bool use_dma;
 	size_t size;
@@ -717,17 +718,17 @@ static bool pci_endpoint_test_read(struct pci_endpoint_test *test,
 	size_t alignment = test->alignment;
 	int irq_type = test->irq_type;
 	u32 crc32;
-	int err;
+	int ret;
 
-	err = copy_from_user(&param, (void __user *)arg, sizeof(param));
-	if (err) {
+	ret = copy_from_user(&param, (void __user *)arg, sizeof(param));
+	if (ret) {
 		dev_err(dev, "Failed to get transfer param\n");
-		return false;
+		return -EFAULT;
 	}
 
-	err = pci_endpoint_test_validate_xfer_params(dev, &param, alignment);
-	if (err)
-		return false;
+	ret = pci_endpoint_test_validate_xfer_params(dev, &param, alignment);
+	if (ret)
+		return ret;
 
 	size = param.size;
 
@@ -737,21 +738,20 @@ static bool pci_endpoint_test_read(struct pci_endpoint_test *test,
 
 	if (irq_type < IRQ_TYPE_INTX || irq_type > IRQ_TYPE_MSIX) {
 		dev_err(dev, "Invalid IRQ type option\n");
-		goto err;
+		return -EINVAL;
 	}
 
 	orig_addr = kzalloc(size + alignment, GFP_KERNEL);
 	if (!orig_addr) {
 		dev_err(dev, "Failed to allocate destination address\n");
-		ret = false;
-		goto err;
+		return -ENOMEM;
 	}
 
 	orig_phys_addr = dma_map_single(dev, orig_addr, size + alignment,
 					DMA_FROM_DEVICE);
-	if (dma_mapping_error(dev, orig_phys_addr)) {
+	ret = dma_mapping_error(dev, orig_phys_addr);
+	if (ret) {
 		dev_err(dev, "failed to map source buffer address\n");
-		ret = false;
 		goto err_phys_addr;
 	}
 
@@ -783,50 +783,51 @@ static bool pci_endpoint_test_read(struct pci_endpoint_test *test,
 			 DMA_FROM_DEVICE);
 
 	crc32 = crc32_le(~0, addr, size);
-	if (crc32 == pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_CHECKSUM))
-		ret = true;
+	if (crc32 != pci_endpoint_test_readl(test, PCI_ENDPOINT_TEST_CHECKSUM))
+		ret = -EIO;
 
 err_phys_addr:
 	kfree(orig_addr);
-err:
 	return ret;
 }
 
-static bool pci_endpoint_test_clear_irq(struct pci_endpoint_test *test)
+static int pci_endpoint_test_clear_irq(struct pci_endpoint_test *test)
 {
 	pci_endpoint_test_release_irq(test);
 	pci_endpoint_test_free_irq_vectors(test);
-	return true;
+
+	return 0;
 }
 
-static bool pci_endpoint_test_set_irq(struct pci_endpoint_test *test,
+static int pci_endpoint_test_set_irq(struct pci_endpoint_test *test,
 				      int req_irq_type)
 {
 	struct pci_dev *pdev = test->pdev;
 	struct device *dev = &pdev->dev;
+	int ret;
 
 	if (req_irq_type < IRQ_TYPE_INTX || req_irq_type > IRQ_TYPE_MSIX) {
 		dev_err(dev, "Invalid IRQ type option\n");
-		return false;
+		return -EINVAL;
 	}
 
 	if (test->irq_type == req_irq_type)
-		return true;
+		return 0;
 
 	pci_endpoint_test_release_irq(test);
 	pci_endpoint_test_free_irq_vectors(test);
 
-	if (!pci_endpoint_test_alloc_irq_vectors(test, req_irq_type))
-		goto err;
+	ret = pci_endpoint_test_alloc_irq_vectors(test, req_irq_type);
+	if (ret)
+		return ret;
 
-	if (!pci_endpoint_test_request_irq(test))
-		goto err;
-
-	return true;
+	ret = pci_endpoint_test_request_irq(test);
+	if (ret) {
+		pci_endpoint_test_free_irq_vectors(test);
+		return ret;
+	}
 
-err:
-	pci_endpoint_test_free_irq_vectors(test);
-	return false;
+	return 0;
 }
 
 static long pci_endpoint_test_ioctl(struct file *file, unsigned int cmd,
@@ -908,7 +909,7 @@ static void pci_endpoint_test_get_capabilities(struct pci_endpoint_test *test)
 static int pci_endpoint_test_probe(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
-	int err;
+	int ret;
 	int id;
 	char name[24];
 	enum pci_barno bar;
@@ -947,24 +948,23 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 
 	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(48));
 
-	err = pci_enable_device(pdev);
-	if (err) {
+	ret = pci_enable_device(pdev);
+	if (ret) {
 		dev_err(dev, "Cannot enable PCI device\n");
-		return err;
+		return ret;
 	}
 
-	err = pci_request_regions(pdev, DRV_MODULE_NAME);
-	if (err) {
+	ret = pci_request_regions(pdev, DRV_MODULE_NAME);
+	if (ret) {
 		dev_err(dev, "Cannot obtain PCI resources\n");
 		goto err_disable_pdev;
 	}
 
 	pci_set_master(pdev);
 
-	if (!pci_endpoint_test_alloc_irq_vectors(test, irq_type)) {
-		err = -EINVAL;
+	ret = pci_endpoint_test_alloc_irq_vectors(test, irq_type);
+	if (ret)
 		goto err_disable_irq;
-	}
 
 	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
 		if (pci_resource_flags(pdev, bar) & IORESOURCE_MEM) {
@@ -979,7 +979,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 
 	test->base = test->bar[test_reg_bar];
 	if (!test->base) {
-		err = -ENOMEM;
+		ret = -ENOMEM;
 		dev_err(dev, "Cannot perform PCI test without BAR%d\n",
 			test_reg_bar);
 		goto err_iounmap;
@@ -989,7 +989,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 
 	id = ida_alloc(&pci_endpoint_test_ida, GFP_KERNEL);
 	if (id < 0) {
-		err = id;
+		ret = id;
 		dev_err(dev, "Unable to get id\n");
 		goto err_iounmap;
 	}
@@ -997,14 +997,13 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	snprintf(name, sizeof(name), DRV_MODULE_NAME ".%d", id);
 	test->name = kstrdup(name, GFP_KERNEL);
 	if (!test->name) {
-		err = -ENOMEM;
+		ret = -ENOMEM;
 		goto err_ida_remove;
 	}
 
-	if (!pci_endpoint_test_request_irq(test)) {
-		err = -EINVAL;
+	ret = pci_endpoint_test_request_irq(test);
+	if (ret)
 		goto err_kfree_test_name;
-	}
 
 	pci_endpoint_test_get_capabilities(test);
 
@@ -1012,14 +1011,14 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 	misc_device->minor = MISC_DYNAMIC_MINOR;
 	misc_device->name = kstrdup(name, GFP_KERNEL);
 	if (!misc_device->name) {
-		err = -ENOMEM;
+		ret = -ENOMEM;
 		goto err_release_irq;
 	}
 	misc_device->parent = &pdev->dev;
 	misc_device->fops = &pci_endpoint_test_fops;
 
-	err = misc_register(misc_device);
-	if (err) {
+	ret = misc_register(misc_device);
+	if (ret) {
 		dev_err(dev, "Failed to register device\n");
 		goto err_kfree_name;
 	}
@@ -1051,7 +1050,7 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
 err_disable_pdev:
 	pci_disable_device(pdev);
 
-	return err;
+	return ret;
 }
 
 static void pci_endpoint_test_remove(struct pci_dev *pdev)
diff --git a/tools/pci/pcitest.c b/tools/pci/pcitest.c
index 08f355083754..b96cc118839b 100644
--- a/tools/pci/pcitest.c
+++ b/tools/pci/pcitest.c
@@ -16,7 +16,6 @@
 
 #include <linux/pcitest.h>
 
-static char *result[] = { "NOT OKAY", "OKAY" };
 static char *irq[] = { "LEGACY", "MSI", "MSI-X" };
 
 struct pci_test {
@@ -53,72 +52,74 @@ static int run_test(struct pci_test *test)
 		ret = ioctl(fd, PCITEST_BAR, test->barnum);
 		fprintf(stdout, "BAR%d:\t\t", test->barnum);
 		if (ret < 0)
-			fprintf(stdout, "TEST FAILED\n");
+			fprintf(stdout, "NOT OKAY\n");
 		else
-			fprintf(stdout, "%s\n", result[ret]);
+			fprintf(stdout, "OKAY\n");
 	}
 
 	if (test->consecutive_bar_test) {
 		ret = ioctl(fd, PCITEST_BARS);
 		fprintf(stdout, "Consecutive BAR test:\t\t");
 		if (ret < 0)
-			fprintf(stdout, "TEST FAILED\n");
+			fprintf(stdout, "NOT OKAY\n");
 		else
-			fprintf(stdout, "%s\n", result[ret]);
+			fprintf(stdout, "OKAY\n");
 	}
 
 	if (test->set_irqtype) {
 		ret = ioctl(fd, PCITEST_SET_IRQTYPE, test->irqtype);
 		fprintf(stdout, "SET IRQ TYPE TO %s:\t\t", irq[test->irqtype]);
 		if (ret < 0)
-			fprintf(stdout, "FAILED\n");
+			fprintf(stdout, "NOT OKAY\n");
 		else
-			fprintf(stdout, "%s\n", result[ret]);
+			fprintf(stdout, "OKAY\n");
 	}
 
 	if (test->get_irqtype) {
 		ret = ioctl(fd, PCITEST_GET_IRQTYPE);
 		fprintf(stdout, "GET IRQ TYPE:\t\t");
-		if (ret < 0)
-			fprintf(stdout, "FAILED\n");
-		else
+		if (ret < 0) {
+			fprintf(stdout, "NOT OKAY\n");
+		} else {
 			fprintf(stdout, "%s\n", irq[ret]);
+			ret = 0;
+		}
 	}
 
 	if (test->clear_irq) {
 		ret = ioctl(fd, PCITEST_CLEAR_IRQ);
 		fprintf(stdout, "CLEAR IRQ:\t\t");
 		if (ret < 0)
-			fprintf(stdout, "FAILED\n");
+			fprintf(stdout, "NOT OKAY\n");
 		else
-			fprintf(stdout, "%s\n", result[ret]);
+			fprintf(stdout, "OKAY\n");
 	}
 
 	if (test->legacyirq) {
 		ret = ioctl(fd, PCITEST_LEGACY_IRQ, 0);
 		fprintf(stdout, "LEGACY IRQ:\t");
 		if (ret < 0)
-			fprintf(stdout, "TEST FAILED\n");
+			fprintf(stdout, "NOT OKAY\n");
 		else
-			fprintf(stdout, "%s\n", result[ret]);
+			fprintf(stdout, "OKAY\n");
 	}
 
 	if (test->msinum > 0 && test->msinum <= 32) {
 		ret = ioctl(fd, PCITEST_MSI, test->msinum);
 		fprintf(stdout, "MSI%u:\t\t", test->msinum);
 		if (ret < 0)
-			fprintf(stdout, "TEST FAILED\n");
+			fprintf(stdout, "NOT OKAY\n");
 		else
-			fprintf(stdout, "%s\n", result[ret]);
+			fprintf(stdout, "OKAY\n");
 	}
 
 	if (test->msixnum > 0 && test->msixnum <= 2048) {
 		ret = ioctl(fd, PCITEST_MSIX, test->msixnum);
 		fprintf(stdout, "MSI-X%u:\t\t", test->msixnum);
 		if (ret < 0)
-			fprintf(stdout, "TEST FAILED\n");
+			fprintf(stdout, "NOT OKAY\n");
 		else
-			fprintf(stdout, "%s\n", result[ret]);
+			fprintf(stdout, "OKAY\n");
 	}
 
 	if (test->write) {
@@ -128,9 +129,9 @@ static int run_test(struct pci_test *test)
 		ret = ioctl(fd, PCITEST_WRITE, &param);
 		fprintf(stdout, "WRITE (%7lu bytes):\t\t", test->size);
 		if (ret < 0)
-			fprintf(stdout, "TEST FAILED\n");
+			fprintf(stdout, "NOT OKAY\n");
 		else
-			fprintf(stdout, "%s\n", result[ret]);
+			fprintf(stdout, "OKAY\n");
 	}
 
 	if (test->read) {
@@ -140,9 +141,9 @@ static int run_test(struct pci_test *test)
 		ret = ioctl(fd, PCITEST_READ, &param);
 		fprintf(stdout, "READ (%7lu bytes):\t\t", test->size);
 		if (ret < 0)
-			fprintf(stdout, "TEST FAILED\n");
+			fprintf(stdout, "NOT OKAY\n");
 		else
-			fprintf(stdout, "%s\n", result[ret]);
+			fprintf(stdout, "OKAY\n");
 	}
 
 	if (test->copy) {
@@ -152,14 +153,14 @@ static int run_test(struct pci_test *test)
 		ret = ioctl(fd, PCITEST_COPY, &param);
 		fprintf(stdout, "COPY (%7lu bytes):\t\t", test->size);
 		if (ret < 0)
-			fprintf(stdout, "TEST FAILED\n");
+			fprintf(stdout, "NOT OKAY\n");
 		else
-			fprintf(stdout, "%s\n", result[ret]);
+			fprintf(stdout, "OKAY\n");
 	}
 
 	fflush(stdout);
 	close(fd);
-	return (ret < 0) ? ret : 1 - ret; /* return 0 if test succeeded */
+	return ret;
 }
 
 int main(int argc, char **argv)
-- 
2.25.1


