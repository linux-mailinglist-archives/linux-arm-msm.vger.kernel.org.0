Return-Path: <linux-arm-msm+bounces-85942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AF5CD11EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07847303F5FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C96033C195;
	Fri, 19 Dec 2025 17:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DnNiYVsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD4B1D6BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164981; cv=none; b=hHveOvFiJ8dbnpaIPkLYjH7K/Jeex18Wg0q83P/2p0kEze0pMAAqhWRUS1qq8ho1MgreBp8sbWmsjkzMZost/k4n1oASOI3RktcMnJLEWGAPrWEfWXFY6MEIZxoPz+j50CsBkkiZ3IZNi8kxNrngz/RVbrDg1nUXMNrMLP1lRho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164981; c=relaxed/simple;
	bh=TYzNQ0isiTWkokeom4SbhziOp8ml3d5CiaE+CSoVQFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JMKj2O/d8Bj/mRUKyoKvWkSxis5JU9BsjDDoJJd0I2jxkAuxeAJFtl6xmrgVmynSPJOFN13aq+Vjusct35oMs6d6SPqQu9B6u7pKmTJhFqL1NwTm024K2TLoPufWdrntvoNIxGJzpWY6IgzzALeBYQitby/FBVAcQ1/RObccNYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DnNiYVsG; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766164971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0lJL/SNLjbeVra6hhUj+h/q0KnBWqBFK5+UFeVFEuI=;
	b=DnNiYVsGky7iooT3a3nbKu5co/4qCd4S7rqhODuK5kCpnBQh5UpnE1ScWokGbVRhrIIpis
	/FzlGEtu/lAmJr7Bz95Nys0lrCiaI1RBhR+ZZ2HahYqCE1ay3xkO0Cbd7TIfxWGdUuF2xn
	N5kxIKAWf4layWeXsM+9hoy0/G1ZJ4M=
From: Sean Anderson <sean.anderson@linux.dev>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Brian Norris <briannorris@chromium.org>,
	Niklas Cassel <cassel@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Alex Elder <elder@riscstar.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/3] PCI/pwrctrl: Add appropriate delays for slot power/clocks
Date: Fri, 19 Dec 2025 12:22:21 -0500
Message-Id: <20251219172222.2808195-2-sean.anderson@linux.dev>
In-Reply-To: <20251219172222.2808195-1-sean.anderson@linux.dev>
References: <39e025bd-50f4-407d-8fd4-e254dbed46b2@linux.dev>
 <20251219172222.2808195-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Each of the PCIe electromechanical specifications requires a delay
between when power and clocks are stable and when PERST is released.
Delay for the specified time before continuing with initialization. If
there are no power supplies/clock, skip the associated delay as we
assume that they have been initialized by the bootloader (and that
booting up to this point has taken longer than the delay).

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/pci/pwrctrl/slot.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
index 3320494b62d8..1c56fcd49f2b 100644
--- a/drivers/pci/pwrctrl/slot.c
+++ b/drivers/pci/pwrctrl/slot.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -31,6 +32,7 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 {
 	struct pci_pwrctrl_slot_data *slot;
 	struct device *dev = &pdev->dev;
+	unsigned long delay = 0;
 	struct clk *clk;
 	int ret;
 
@@ -64,6 +66,17 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 				     "Failed to enable slot clock\n");
 	}
 
+	if (slot->num_supplies)
+		/*
+		 * Delay for T_PVPERL. This could be reduced to 1 ms/50 ms
+		 * (T_PVPGL) for Mini/M.2 slots.
+		 */
+		delay = 100000;
+	else if (clk)
+		/* Delay for T_PERST-CLK (100 us for all slot types) */
+		delay = 100;
+
+	fsleep(delay)
 	pci_pwrctrl_init(&slot->ctx, dev);
 
 	ret = devm_pci_pwrctrl_device_set_ready(dev, &slot->ctx);
-- 
2.35.1.1320.gc452695387.dirty


