Return-Path: <linux-arm-msm+bounces-27253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F793F526
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86488282900
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA0E1474BF;
	Mon, 29 Jul 2024 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qVsQp45R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920F147C79
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 12:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722255778; cv=none; b=AKIHkrqgKverkILUC/67FrS8p1WrpOA2nAaelBlF1pE9LDvVth5ZpvgbYFs54T8g6hn66YM5E9fncqo63OBz5G1rmv61QOHe6DbUUIqqkGxE/rVFi0wEbBR4zuKMDWo6rOOvnOHlWiKdcm4PI8KtY/SB365Mwtq5YGTxdKyxFSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722255778; c=relaxed/simple;
	bh=CuoZXVvhawjpFYeAEX+vhB6uZnRgzgJ0nBzrov+Qzus=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OyT4c4tM+62VwilbFj1i2+TGWR/fbf4n/gdN6Fy08bI+zl6FOi2XTH3/wE+VsEyeYvDsrAuis1+QGcQhe4HRQwcr9qzLwbbkAakzHDr0ZKl5vh91BLsDyhkyhUxh0LbtP1pDrPpY2XSUxrkKNfz88cQjogjRarZ6cPzZoDXdk60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qVsQp45R; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70d2b27c115so2521292b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 05:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722255776; x=1722860576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RefUqVXIqL7UbhtSDUB+mIEmSl06VsBGzIYgApDIdcM=;
        b=qVsQp45R4+GkPbAojO+iOVOBzFv/KQBg2tUT0Gcnnb8gJ3Yu2ZTf0/SyaxIMoJqEAl
         Heuxb4pcyaTIeQL3wSSL0L1iKwaSf9nyjNgllcrJZOrgKucHMtzZr1BjWViqBtBzuc+0
         UfgPi0MJd4FtuozsmILwjXrGXzaUFf1uscux79AX4SX6f/ET2roKoeEhSC+Eowjqg9tF
         1E+yeyHnF3pk0CV0QLDzT9p/D8Ke0eqpsFRlqjfHAcKHUCXlbffXkm+B+TK1X+BZhSWF
         /QpgxZ7eY0SeiTqr+tqZ+WY2dokUdfglo0z4pCWmuAdHKwlSTZNSQ7g5W1dBBt4SA8G8
         CqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722255776; x=1722860576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RefUqVXIqL7UbhtSDUB+mIEmSl06VsBGzIYgApDIdcM=;
        b=Ae28rBt+4+RrnzsEzQH7JqGUT9X0HCA35101Xip3VKw/Yrqvp1czwuSR46uNQAZmHT
         1nz7DHVZzQGgsDVIhnrTbAsCGUg7jMjfFJWdPHACXyXoUIHNUTdKtw2mzXnzAa58T80J
         EQfu+159EJDz23V9ZDz6rJvZyUKozOHl1OQ5n/Y3Kg2VDDl82MC7UzWFJa6nbUxXwViC
         B+tDsrTF2fxDHPh0xYwO9PZ1IKoAYGWCjGYYY5b8LbztnIU77o0qU68nh6DmFNepwjKX
         oKIiDjI4yfZcvwXxd4zD6nXtw/fCFmpbk+AFKy9Vj9EEJhyqikBlSgDtBi0JiYXp5TRN
         3U/g==
X-Forwarded-Encrypted: i=1; AJvYcCW2I69c84KUXGQP6Cth3mPY7z1PfwQglsUb+qlMlEbZxbdbh7m/Ey4XskI1xzpHh+Buhw56O4Kvhqy/C7jzosUS951FhPrO1gE5T7BuJg==
X-Gm-Message-State: AOJu0YxLcusu+Z3xweumHULSPtA0gCaQ9bYfHbB3ax1GsAn6tkOBBuOv
	WwMxiq5u0a+kuogcXtmY3lZlNVLPDedvgx8Gn0ZZ7j/Oo26jyU+LhaopWfAMdg==
X-Google-Smtp-Source: AGHT+IH4//RG9SDtri9GmU/OGX3IDCr9Tw4XNrZ0xpm5DA/9eo8lkp96LAvCeU7jG/nJbmsyGqn4kQ==
X-Received: by 2002:a05:6a00:9160:b0:70a:f38c:74ba with SMTP id d2e1a72fcca58-70eced9966dmr8325559b3a.22.1722255776449;
        Mon, 29 Jul 2024 05:22:56 -0700 (PDT)
Received: from localhost.localdomain ([117.213.101.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8122ddsm6701272b3a.133.2024.07.29.05.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 05:22:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com
Cc: robh@kernel.org,
	bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] PCI: qcom-ep: Move controller cleanups to qcom_pcie_perst_deassert()
Date: Mon, 29 Jul 2024 17:52:45 +0530
Message-Id: <20240729122245.33410-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the endpoint cleanup function dw_pcie_ep_cleanup() and EPF
deinit notify function pci_epc_deinit_notify() are called during the
execution of qcom_pcie_perst_assert() i.e., when the host has asserted
PERST#. But quickly after this step, refclk will also be disabled by the
host.

All of the Qcom endpoint SoCs supported as of now depend on the refclk from
the host for keeping the controller operational. Due to this limitation,
any access to the hardware registers in the absence of refclk will result
in a whole endpoint crash. Unfortunately, most of the controller cleanups
require accessing the hardware registers (like eDMA cleanup performed in
dw_pcie_ep_cleanup(), powering down MHI EPF etc...). So these cleanup
functions are currently causing the crash in the endpoint SoC once host
asserts PERST#.

One way to address this issue is by generating the refclk in the endpoint
itself and not depending on the host. But that is not always possible as
some of the endpoint designs do require the endpoint to consume refclk from
the host (as I was told by the Qcom engineers).

So let's fix this crash by moving the controller cleanups to the start of
the qcom_pcie_perst_deassert() function. qcom_pcie_perst_deassert() is
called whenever the host has deasserted PERST# and it is guaranteed that
the refclk would be active at this point. So at the start of this function,
the controller cleanup can be performed. Once finished, rest of the code
execution for PERST# deassert can continue as usual.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2319ff2ae9f6..e024b4dcd76d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -186,6 +186,8 @@ struct qcom_pcie_ep_cfg {
  * @link_status: PCIe Link status
  * @global_irq: Qualcomm PCIe specific Global IRQ
  * @perst_irq: PERST# IRQ
+ * @cleanup_pending: Cleanup is pending for the controller (because refclk is
+ *                   needed for cleanup)
  */
 struct qcom_pcie_ep {
 	struct dw_pcie pci;
@@ -214,6 +216,7 @@ struct qcom_pcie_ep {
 	enum qcom_pcie_ep_link_status link_status;
 	int global_irq;
 	int perst_irq;
+	bool cleanup_pending;
 };
 
 static int qcom_pcie_ep_core_reset(struct qcom_pcie_ep *pcie_ep)
@@ -389,6 +392,12 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 		return ret;
 	}
 
+	if (pcie_ep->cleanup_pending) {
+		pci_epc_deinit_notify(pci->ep.epc);
+		dw_pcie_ep_cleanup(&pci->ep);
+		pcie_ep->cleanup_pending = false;
+	}
+
 	/* Assert WAKE# to RC to indicate device is ready */
 	gpiod_set_value_cansleep(pcie_ep->wake, 1);
 	usleep_range(WAKE_DELAY_US, WAKE_DELAY_US + 500);
@@ -522,10 +531,9 @@ static void qcom_pcie_perst_assert(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
 
-	pci_epc_deinit_notify(pci->ep.epc);
-	dw_pcie_ep_cleanup(&pci->ep);
 	qcom_pcie_disable_resources(pcie_ep);
 	pcie_ep->link_status = QCOM_PCIE_EP_LINK_DISABLED;
+	pcie_ep->cleanup_pending = true;
 }
 
 /* Common DWC controller ops */
-- 
2.25.1


