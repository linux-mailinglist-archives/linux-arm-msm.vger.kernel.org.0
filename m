Return-Path: <linux-arm-msm+bounces-29782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4E962990
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 16:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 705BD286432
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 14:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EB113BAC3;
	Wed, 28 Aug 2024 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aFHlWmaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8FF4594A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853678; cv=none; b=mvHr3Igmm30G11NxZwrQhyiOdIG1/oa9xJGWm6L/BuIAUTVhhYeaPt6jR0fVk0Nrccc28aasvOnIwF9ndUB+BUazwHdb9iOU58UEU9jSZkYgbOFbU97ufeT7ie92hqpA2ehxT/0k5n99Js6ty3RCPDW0/KDxdWpXqOXbmweFvAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853678; c=relaxed/simple;
	bh=BTtzqPzO0t+7wWTHddLrdegYKAIzymAX02fOEEtPbMI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UnskQtPWiICIKZiuhPGV62oRbMg7WpTogEwfVQz5GmK81lpX3o00mMtnpYhAfkvnc8ZkX7upTPIZwL9xyOqfomyb7vTDBOAdA0nj0a6QSmBT6Gc6Ks35RFB7FmMLBj1V8/G/mMOaaFh2pYfDjmPl9UGjDIAzhaZUuFERrflL1AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aFHlWmaf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-201f7fb09f6so58619125ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 07:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724853676; x=1725458476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYFYQpwLL3S6B0ystutneqrbwAqmW6XeGYic6IuwKpg=;
        b=aFHlWmafZy6DYLDOcSyaQZ8GBP23v09uK5A5t+sbNgMpGSr8ULf1oDI27aAGmwWbQy
         k7qt706+u0qStqNfsoY3OGPczImYyLLumyiHWrTGBSTbzwxj1u3IP2BYO5CvFGoy8gVE
         +Egnwh2YhaT1tzS6rvpJ2gQ+0/Mj/x4ZjwAE9duutT21Cv9I2QkIexQG45kiFTLsWtNA
         V0cFTXZjPKLGDMuGLG9DcrNRspyOnHeoRknXCHhmzDjQZoKesofGWYU9LvdwZuI4n2QS
         Q4r8np+BvQgDtTkpNr47k3bYp0c1DbT8XUzX9oMrbRp0v0CCLv/xeY6jr/GzVJ4Gm0TG
         42LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853676; x=1725458476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYFYQpwLL3S6B0ystutneqrbwAqmW6XeGYic6IuwKpg=;
        b=mxYNWezLUhQgxBXhCfkgiGWUTFPM9IF9BZLNNPvzn1pPT3I2WztS/Tqz3ZfBH21YVZ
         VuhxpzQW/hlzYOvK9YL2wWEE1CNJvopm59LRVBf9/MZU7zMXEVwXHoi8UcYqnfMWytuP
         xe3iwtXPIsrD4Eor56lqURUk7MQ/dd9ZmH8/rqCQPg7qKW0b1DgnwoNjXUnijRc9Gt76
         LZzMRFO71Wjy6cPondm5yROzzyE36l2BJfhEtv8XAcomonvvnElWs5FTJuBMUO+i5VyE
         ZmX+N52ILIPaRvqoWinS8bwVKKDtTaoxfB+LUyD6ZccYP/TLOtmDcf/+FJABJE5b4bPi
         MwrA==
X-Forwarded-Encrypted: i=1; AJvYcCWdHcxQ3bbXbqZXvf3+ykqSF1jwsZAePdW+A99fCNqU7kX3XWEvscs3SsainyIxvdOlxQkLNvmHMUFsgo7K@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm28f1Zt1BibO16tRYvocFifu9Z7wTFFCPP6DhTYlT5sSEnnoU
	38oquhT9ig1EFx1tMhC56kUfsrqupX/yfw5xJhuUtiqIQpSk5sVrs2lQenwwYQ==
X-Google-Smtp-Source: AGHT+IHwv3ejBWHIDQYjJKWg81MlCmfrB3seGvlnlt4iahbPWBTGa03FBqUkyGHHWiYWCnBZ8GuGNA==
X-Received: by 2002:a17:902:ecd1:b0:1f7:1655:825c with SMTP id d9443c01a7336-2039e4ca7c3mr172368485ad.36.1724853675466;
        Wed, 28 Aug 2024 07:01:15 -0700 (PDT)
Received: from localhost.localdomain ([120.56.198.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038557e7cfsm99564255ad.83.2024.08.28.07.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 07:01:15 -0700 (PDT)
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
Subject: [PATCH v2] PCI: qcom-ep: Enable controller resources like PHY only after refclk is available
Date: Wed, 28 Aug 2024 19:31:08 +0530
Message-Id: <20240828140108.5562-1-manivannan.sadhasivam@linaro.org>
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
whole SoC crash on the new SoC.

qcom_pcie_enable_resources() is already called by
qcom_pcie_perst_deassert() when PERST# is deasserted, and refclk is
available at that time.

Hence, remove the unnecessary call to qcom_pcie_enable_resources() from
qcom_pcie_ep_probe() to prevent the crash.

Fixes: 869bc5253406 ("PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host")
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

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


