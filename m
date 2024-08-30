Return-Path: <linux-arm-msm+bounces-30184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD97965A2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40DF11C20398
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBFC166F3F;
	Fri, 30 Aug 2024 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y58JmQi7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0A413635E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 08:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006213; cv=none; b=LcsbwAVJHEh/bpY7OS+fJa2HljD5ndy4z6L2G+AWSbI37pcBjgCWCBNGjyyh5XxIM6fJewP1Jsz4ttfblztqAAhaE58pilpU2bqYlyYNDgL2jdVGbdieC9CRNSoUrE3BvEmuARFeTYrU2VolTEMJFiF9R+sscHxshEfWsZW37kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006213; c=relaxed/simple;
	bh=dOvy8lq/EHJgmko75sUxm42JQCa3y8fE26e1sl4RadQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fD4YYWca0E/nikLAwbqWvv1M4WLzkiCBcXrNcpAKXo/qTWAgOrpwaCjJOO5q9AJ0+IQYtBkRAJRGQWUxPkKQR5HrynxOnRXDfCfiqlzefAcIfKehL6+KO9lrk+Dk8j6YbqUmkkh7Xzq05rM9jXjq28POwNN0wL/GB1HH/vfhsWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y58JmQi7; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-70f6118f1b5so958632a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725006211; x=1725611011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iwkXS2XE5Tkc0QlVhME91uwM7bEp3jrm2KHPu4Lpqm8=;
        b=Y58JmQi7kq4itQiJnSlbl/zhiuY9+4OG/BLYnz9tAQWDDgeuj5zZUrFK+kmoKGkRGu
         guj//lpr+deERV0Ef1JvqzHq5Bripolb7PhI1+VpudYVzgNm9/1MRYRYU4rruocy+Hxb
         LcyxX33OPZdgI9l7205GR3Ts198JhTaJ0alFc1/neiyusfLQnXq3sBA1Vca2grzNaKC7
         dh8WOK5jWzhHqkpuxDOVAOk41KKcG3GnTDyG17H5cEuGPMskkktGuTwTah25FEX8fVeh
         lv1Q4YKhZqQBUknD9ykn9RZE6xnvJ2brChMwlboGUJ1L5qMo9FMhwUrwWkEWzNOPReOk
         r3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725006211; x=1725611011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwkXS2XE5Tkc0QlVhME91uwM7bEp3jrm2KHPu4Lpqm8=;
        b=XwdrNLyGudtzrFyVe6n+dxwMGIXg5RfLUKGqfXwh1lUgf+fMonPPRPi8Ft+EbOs9d7
         Eps4c8d1/vmyP7hjVWtVQ0uCKOp6+JniBHiZt9Cgb7YsHraErBXNv1dsDvIcNsNqmsRp
         Dn4mq9I9vS9mqmrqppH2bQAMDZjIhD330NrUQDZLZHgBHr06X5X1GiWv2nb4uFbkZFIR
         roAHFoBaf+MkahoBfniExSlVA9X+WolbMGEc81w/oFN4aH41iJL4pFT/PM3JPWDIOJtT
         L1HJFjGQkkc4iGVmzVXUf93lm0qx5s3iFgFnANmHvJyGWVY+tdtfzP2paqER7F4AF0Lw
         Xw0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyEShN2Lm/a6H5R7AO/XpEyQSsKwVn+TcxJJGIp/Oe6NqsWXoAXHNajmlh9ptIMWxae8gpKWjLYcY0MQ+s@vger.kernel.org
X-Gm-Message-State: AOJu0YwtrC3SjxXrklSu3A7y84MMn2DU14qFmPiaeDRfLGYQpIy5wtT0
	GfKfTysCasBw7pbdmKGWxVCrcBU5P6X8uoCYFLjYovwuIhrKhcfStITCr5nz6Q==
X-Google-Smtp-Source: AGHT+IGQ9ZFGuWGC0MxA2Z/ohzzOno+rbi7BFhIeUOBZkKWCdB3C8rji4O6xHmPZhJ8tf79hvt7rKg==
X-Received: by 2002:a05:6358:5289:b0:1b1:a91f:9f7e with SMTP id e5c5f4694b2df-1b603cb7acdmr711886455d.24.1725006210984;
        Fri, 30 Aug 2024 01:23:30 -0700 (PDT)
Received: from localhost.localdomain ([117.193.213.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576c90sm2265623b3a.2.2024.08.30.01.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:23:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com
Cc: robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3] PCI: qcom-ep: Enable controller resources like PHY only after refclk is available
Date: Fri, 30 Aug 2024 13:53:19 +0530
Message-Id: <20240830082319.51387-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_pcie_enable_resources() is called by qcom_pcie_ep_probe() and it
enables the controller resources like clocks, regulator, PHY. On one of the
new unreleased Qcom SoC, PHY enablement depends on the active refclk. And
on all of the supported Qcom endpoint SoCs, refclk comes from the host
(RC). So calling qcom_pcie_enable_resources() without refclk causes the
NoC (Network On Chip) error in the endpoint SoC and in turn results in a
whole SoC crash and rebooting into EDL (Emergency Download) mode which is
an unrecoverable state.

But qcom_pcie_enable_resources() is already called by
qcom_pcie_perst_deassert() when PERST# is deasserted, and refclk is
available at that time.

Hence, remove the unnecessary call to qcom_pcie_enable_resources() from
qcom_pcie_ep_probe() to prevent the above mentioned crash.

It should be noted that this commit prevents the crash only under normal
working condition (booting endpoint before host), but the crash may also
occur if PERST# assert happens at the wrong time. For avoiding the crash
completely, it is recommended to use SRIS mode which allows the endpoint
SoC to generate its own refclk. The driver is not supporting SRIS mode
currently, but will be added in the future.

Fixes: 869bc5253406 ("PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host")
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v3:

* Improved the patch description to mention that the crash in an unrecoverable
  state and also that it may occur if PERST# is asserted at the wrong time.

Changes in v2:

- Changed the patch description to mention the crash clearly as suggested by
  Bjorn
- Added the Fixes tag

Bjorn: This is not going to be a 6.11 material as it is not fixing a regression
introduced in 6.11 (offending commit got merged in 6.10). So please merge this
patch for 6.12.

 drivers/pci/controller/dwc/pcie-qcom-ep.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 236229f66c80..2319ff2ae9f6 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -846,21 +846,15 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qcom_pcie_enable_resources(pcie_ep);
-	if (ret) {
-		dev_err(dev, "Failed to enable resources: %d\n", ret);
-		return ret;
-	}
-
 	ret = dw_pcie_ep_init(&pcie_ep->pci.ep);
 	if (ret) {
 		dev_err(dev, "Failed to initialize endpoint: %d\n", ret);
-		goto err_disable_resources;
+		return ret;
 	}
 
 	ret = qcom_pcie_ep_enable_irq_resources(pdev, pcie_ep);
 	if (ret)
-		goto err_disable_resources;
+		goto err_ep_deinit;
 
 	name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);
 	if (!name) {
@@ -877,8 +871,8 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 	disable_irq(pcie_ep->global_irq);
 	disable_irq(pcie_ep->perst_irq);
 
-err_disable_resources:
-	qcom_pcie_disable_resources(pcie_ep);
+err_ep_deinit:
+	dw_pcie_ep_deinit(&pcie_ep->pci.ep);
 
 	return ret;
 }
-- 
2.25.1


