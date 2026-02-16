Return-Path: <linux-arm-msm+bounces-92970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP0+DXcok2kI2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:23:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB391448FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51211302A687
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DC8313E2F;
	Mon, 16 Feb 2026 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pTi/WSEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA68E312820
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251720; cv=none; b=XLhm44ChrCyglx28uMg4IhDBjqd6XdDIY/POOuazGjGh3AKVYqASqlKRE71RZ0wMM+Pjh0JSvFF9u6nLWM2OQLdP3ZgsQcyISnE2+xvdl/e0pvr48CmNbbC/b98GLrUIkjRNCIXRjCGLfai5Qb95oa+gCqZEFWye7obGeo6+uAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251720; c=relaxed/simple;
	bh=e+EkWC2n4pNM3k4t8mwvlHMc2Vj8SO/DiCWja7TtWYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPqq+CqJDMgaAY3yAaWSXLrrF9SP1tVfS/nkKJxX4vDBA4DSGp2lU+hszdxbYzfVNH++1U8TuZ1OBo1a9+4mXqEvEIQD50yp4/Ji8gfPciz1TdgdVJTzgIomPghFHmNbw9ir5b0YVwv9/SFIfpOWJ2LCIGT95yuG+uv8gc48IPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pTi/WSEb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48371119eacso29970835e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 06:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771251715; x=1771856515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/9SQvmpy9H4vWRy3pZsPCqXW6+l8s5UosjKXnI3KRs=;
        b=pTi/WSEbIr6iZRdp9FST+wYVLFL9Ij28eLCNe9r0tdS1j8SP0WxCuMl2BZeEkkkMRm
         CUAeDuPSbGed/2E6DVGn0Bmja3Uu+/SHHZA/Vz0g7rgNZdwZXdYicu3imw8h5IJOAzj/
         xBNKjleiUakqR78ze+8TD74ohODozZ1PQUc7S7/Wo5HUVjehf8H3JABKFwR9KSsdGJ/1
         AoWi7sUrKik6AgrYlIW5N7I/qNz06dfS2r4K6Ui22ASWHBNV/On1RWJM0r9erxj6IHFA
         V2p2xhO+LsF10hc9VL9WtzF/VOEQjjL8HKMoG95X/9v3b7SVGNcshNN3vTDiQ6Wxw+kC
         Cp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251715; x=1771856515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f/9SQvmpy9H4vWRy3pZsPCqXW6+l8s5UosjKXnI3KRs=;
        b=ZMIl1GVJ3i8csdjE0loe3kVhcVKPvRfijWjZ+upmBexkha6s1WEchADIDfdpXbx56l
         LrxSi2LrFEcWzDVktXsMJEdcoTThaO/Si9mHadpUJcK1a3T3iHh8ZZBFjfB6TgydZGMT
         gMEQgMVBxh5KEcgue0/lLqdNFzC2KIPBek2D5nKLLIMYoTvxOz8n72Mn3TV3JoOTLCk9
         mWiTnY9uX4gjJdD0QRcvWeZZnTh4855bEh3AbOykvb+BDCoIgXlNNRdvqCD4u0S5ymUS
         qO1/pfE4o726Zhp1QWLTovXmDRG7OD7tzbXaMMWUcDzkRIokmMK/2KzOWGIOai6IoBNO
         rclg==
X-Forwarded-Encrypted: i=1; AJvYcCVjVuspUm9ettV5XYu7qdKrlX1LWhOdMKA4ksncIiKlNQs2bh/XnGUc5irDzsNMpEoAlA0wT2zKL65NQF0r@vger.kernel.org
X-Gm-Message-State: AOJu0YyFBKqAXG6r2aUc0dNWVJEomK9tqnM9jDTDKea/ST7nDo31qJ2r
	eljvdWkwke8eQcjygrG9ZIF+wrgA3LKgvJrPRhFLR8gcvlO8KOOPUiycgwvPJB+UDbc=
X-Gm-Gg: AZuq6aIlGxvDnQ9ivSg95P+xlcd1RZdT8nSCuy3eiKAa/1saJQBY7ol1FJg43rhfG2c
	9+UziYlepKfl6hTzf0zlMJ2EPAPEMS/VEKDqh2hKTPfc4panSV7f0AeetqF/iC0gsILVUCgu0jo
	PbJizbhWTB/bPIJIYQSIKmOHErijGb3g4JmuDgbunciHwXELbTsH0Oh+1DCZ6jjECztFrWE9iQk
	0Qcy9DTLKRLqLJAqm0+7/S+AvUjVtD/d8bBU0lXSMvpLNPUMQTp3XS/LTEDNQKzXUGowg1ChuPM
	Nk+s/yvP0hGScc4FWQ1fAFZp7fwG4nu6OXVD5Y66zYRY1MC6scZVziYAA9ef+EVTu+HwVRBWV3I
	ProWhe80sH5HqIX2GATKvkRYFJU4u79oU9ZyZqZ8pcCJUANzuQTsscXeQqz4W3lhMxEsrPqWXdB
	sQVi0N0BZG5RAJftuYGoYmOLgjUCM2dBKbETcwXupubcSOIZzsuUF4pEI=
X-Received: by 2002:a05:600c:6206:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-48373a0842fmr151498205e9.2.1771251715087;
        Mon, 16 Feb 2026 06:21:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a63afesm86717475e9.9.2026.02.16.06.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:21:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Feb 2026 15:21:47 +0100
Subject: [PATCH v4 3/9] pci: pwrctrl: rename pci-pwrctrl-slot as generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-3-802c82795431@linaro.org>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8065;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=e+EkWC2n4pNM3k4t8mwvlHMc2Vj8SO/DiCWja7TtWYg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpkyf7fyk4ar/een2ppTz2YyuSmnqLKeArdKG+TMgw
 zqVdnQmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZMn+wAKCRB33NvayMhJ0deeD/
 wJnFTpLZmDCw9qKPW+jgW/zNUnvsE8dTJVgiNjPZQsOlGCuIkw9HhkdRlfM22TNC2BHmXEIktlAash
 bpNCZhVVmLGWVOg8BllIr1JlAZU7ZO96AindbWuzw2xXnMU/s/sfJHm8Bt/CwDSvFh8L1t2ksUyl8n
 VZK69EeFXHS4HQwpIipTSFJ/DeUVliqq/TUrKCrMi9XtvDJHW7RHoaJinoAQ3Z8InHSlzdCVsGjOMC
 sPn36JTwPTd0iX7r02vUuZlqczLxMR+NC3Q/qjEZbMU0nTGYSLueW1Q2UvB7nfXqfFj8ujyHbkeFlm
 1FQyHuBiaod6JCldxBs5XZQghb7VzgqXdP69A20i/vEm/+TM76QlAJ8RdU/uI9P0/h30980ctGZ8I+
 wNvrDveS8LH47jwLZ7jPQ3TMqKovfWVT9Hb4L/IXObvNU0+5D4b+UHXPnugxRJVfRpEyypiYMZ388j
 tLH8AmRCaqRKiJ67mzLndw9JJONWejhHwvY60CXU7E/yn5xCGKWT8hwh/Llq6v6DCU0mj0lfEe0POp
 8xZPkZI3TGX+lQwNMyXb+xxaHxmdd8GrVkycDvIf4akcrhF5LKwDEuBz94h4jXf+7u3F/Q3LMn+iIT
 St0nl7coBNxVw4xyUuQIq2+QC/B3BK6gElom6O1I/rBLBbQZVtMvkSE5YEQw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92970-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8FB391448FB
X-Rspamd-Action: no action

The driver is pretty generic and would fit for either
PCI Slots or endpoints connected to PCI ports, so rename
the driver and module as pci-pwrctrl-generic.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrctrl/Kconfig   | 13 ++++---
 drivers/pci/pwrctrl/Makefile  |  4 +-
 drivers/pci/pwrctrl/generic.c | 91 +++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pwrctrl/slot.c    | 91 -------------------------------------------
 4 files changed, 100 insertions(+), 99 deletions(-)

diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index e0f999f299bb..0ba095729694 100644
--- a/drivers/pci/pwrctrl/Kconfig
+++ b/drivers/pci/pwrctrl/Kconfig
@@ -11,16 +11,17 @@ config PCI_PWRCTRL_PWRSEQ
 	select POWER_SEQUENCING
 	select PCI_PWRCTRL
 
-config PCI_PWRCTRL_SLOT
-	tristate "PCI Power Control driver for PCI slots"
+config PCI_PWRCTRL_GENERIC
+	tristate "Generic PCI Power Control driver for PCI slots and endpoints"
 	select PCI_PWRCTRL
 	help
-	  Say Y here to enable the PCI Power Control driver to control the power
-	  state of PCI slots.
+	  Say Y here to enable the generic PCI Power Control driver to control
+	  the power state of PCI slots and endpoints.
 
 	  This is a generic driver that controls the power state of different
-	  PCI slots. The voltage regulators powering the rails of the PCI slots
-	  are expected to be defined in the devicetree node of the PCI bridge.
+	  PCI slots and endpoints. The voltage regulators powering the rails
+	  of the PCI slots or endpoints are expected to be defined in the
+	  devicetree node of the PCI bridge.
 
 config PCI_PWRCTRL_TC9563
 	tristate "PCI Power Control driver for TC9563 PCIe switch"
diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
index 13b02282106c..f6bb4fb9a410 100644
--- a/drivers/pci/pwrctrl/Makefile
+++ b/drivers/pci/pwrctrl/Makefile
@@ -5,7 +5,7 @@ pci-pwrctrl-core-y			:= core.o
 
 obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
 
-obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
-pci-pwrctrl-slot-y			:= slot.o
+obj-$(CONFIG_PCI_PWRCTRL_GENERIC)	+= pci-pwrctrl-generic.o
+pci-pwrctrl-generic-y			:= generic.o
 
 obj-$(CONFIG_PCI_PWRCTRL_TC9563)	+= pci-pwrctrl-tc9563.o
diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
new file mode 100644
index 000000000000..a5b7b7965f46
--- /dev/null
+++ b/drivers/pci/pwrctrl/generic.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Linaro Ltd.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pci-pwrctrl.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+struct pci_pwrctrl_generic_data {
+	struct pci_pwrctrl ctx;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
+};
+
+static void devm_pci_pwrctrl_generic_power_off(void *data)
+{
+	struct pci_pwrctrl_generic_data *generic = data;
+
+	regulator_bulk_disable(generic->num_supplies, generic->supplies);
+	regulator_bulk_free(generic->num_supplies, generic->supplies);
+}
+
+static int pci_pwrctrl_generic_probe(struct platform_device *pdev)
+{
+	struct pci_pwrctrl_generic_data *generic;
+	struct device *dev = &pdev->dev;
+	struct clk *clk;
+	int ret;
+
+	generic = devm_kzalloc(dev, sizeof(*generic), GFP_KERNEL);
+	if (!generic)
+		return -ENOMEM;
+
+	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
+					&generic->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	generic->num_supplies = ret;
+	ret = regulator_bulk_enable(generic->num_supplies, generic->supplies);
+	if (ret < 0) {
+		regulator_bulk_free(generic->num_supplies, generic->supplies);
+		return dev_err_probe(dev, ret, "Failed to enable regulators\n");
+	}
+
+	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_generic_power_off,
+				       generic);
+	if (ret)
+		return ret;
+
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Failed to enable clock\n");
+
+	pci_pwrctrl_init(&generic->ctx, dev);
+
+	ret = devm_pci_pwrctrl_device_set_ready(dev, &generic->ctx);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register generic pwrctrl driver\n");
+
+	return 0;
+}
+
+static const struct of_device_id pci_pwrctrl_generic_of_match[] = {
+	{
+		.compatible = "pciclass,0604",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pci_pwrctrl_generic_of_match);
+
+static struct platform_driver pci_pwrctrl_generic_driver = {
+	.driver = {
+		.name = "pci-pwrctrl-generic",
+		.of_match_table = pci_pwrctrl_generic_of_match,
+	},
+	.probe = pci_pwrctrl_generic_probe,
+};
+module_platform_driver(pci_pwrctrl_generic_driver);
+
+MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
+MODULE_DESCRIPTION("Generic PCI Power Control driver for PCI Slots");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
deleted file mode 100644
index 08e53243cdbd..000000000000
--- a/drivers/pci/pwrctrl/slot.c
+++ /dev/null
@@ -1,91 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2024 Linaro Ltd.
- * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
- */
-
-#include <linux/clk.h>
-#include <linux/device.h>
-#include <linux/mod_devicetable.h>
-#include <linux/module.h>
-#include <linux/pci-pwrctrl.h>
-#include <linux/platform_device.h>
-#include <linux/regulator/consumer.h>
-#include <linux/slab.h>
-
-struct pci_pwrctrl_slot_data {
-	struct pci_pwrctrl ctx;
-	struct regulator_bulk_data *supplies;
-	int num_supplies;
-};
-
-static void devm_pci_pwrctrl_slot_power_off(void *data)
-{
-	struct pci_pwrctrl_slot_data *slot = data;
-
-	regulator_bulk_disable(slot->num_supplies, slot->supplies);
-	regulator_bulk_free(slot->num_supplies, slot->supplies);
-}
-
-static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
-{
-	struct pci_pwrctrl_slot_data *slot;
-	struct device *dev = &pdev->dev;
-	struct clk *clk;
-	int ret;
-
-	slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
-	if (!slot)
-		return -ENOMEM;
-
-	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
-					&slot->supplies);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to get slot regulators\n");
-
-	slot->num_supplies = ret;
-	ret = regulator_bulk_enable(slot->num_supplies, slot->supplies);
-	if (ret < 0) {
-		regulator_bulk_free(slot->num_supplies, slot->supplies);
-		return dev_err_probe(dev, ret, "Failed to enable slot regulators\n");
-	}
-
-	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
-				       slot);
-	if (ret)
-		return ret;
-
-	clk = devm_clk_get_optional_enabled(dev, NULL);
-	if (IS_ERR(clk))
-		return dev_err_probe(dev, PTR_ERR(clk),
-				     "Failed to enable slot clock\n");
-
-	pci_pwrctrl_init(&slot->ctx, dev);
-
-	ret = devm_pci_pwrctrl_device_set_ready(dev, &slot->ctx);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
-
-	return 0;
-}
-
-static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
-	{
-		.compatible = "pciclass,0604",
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(of, pci_pwrctrl_slot_of_match);
-
-static struct platform_driver pci_pwrctrl_slot_driver = {
-	.driver = {
-		.name = "pci-pwrctrl-slot",
-		.of_match_table = pci_pwrctrl_slot_of_match,
-	},
-	.probe = pci_pwrctrl_slot_probe,
-};
-module_platform_driver(pci_pwrctrl_slot_driver);
-
-MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
-MODULE_DESCRIPTION("Generic PCI Power Control driver for PCI Slots");
-MODULE_LICENSE("GPL");

-- 
2.34.1


