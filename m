Return-Path: <linux-arm-msm+bounces-90689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDl7GSaMeGmqqwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:57:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D959235E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 049E030066B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CB133A9F0;
	Tue, 27 Jan 2026 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pso0cLMM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607A338F56
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507869; cv=none; b=WGoum1ELkANypARhytVRjIG7+dB+e3mYs/1FeFcX8JbUlwM33DkTFECjH/o9WeZRMT2TdfgZHflLko0Jjvmb44MCuemp7DSFcUU+FKSUtRCWhEv/5vuWQL8+6VOShbGG1pej5PXVMO7GF0v+CPBle4CU+XC42Rj2S6DpN4fPZX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507869; c=relaxed/simple;
	bh=HsXR1ZRReSjuIteRzdqoskAI8e3z5XUN7HnkD9ouWkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6Fq1dRtr6uJtziy6gVScztxPTm21RPudK1aDBMdI/qWXHlUnwAZwx2seC9DKMLk/TARCEmXslFcrd9+6MkHqywX/zZbePppCc5RpiSDwmHvFbOPaG/f5ob0VZzFxnR2alAAwJqa45w/ugxXKYfViguAvHkI3/A/pUqg8vaJxj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pso0cLMM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so45370855e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769507864; x=1770112664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3fgVVbcQTtRJV48S+nyNEv2JNUdtpWQtsHANx8ZpfI=;
        b=Pso0cLMMORmJGglJOAG9swwPn7j9lqAiwsR/6nLd8x4x1ePC2anzlIu6nbI8mtWo84
         Ipuu12WV60vcf+rEoUUVxyOrzQWaTvfKcGZxdN3wgy/oPruAWjom6oDrSYlPgZgL4k6t
         OCNa5pAs6I/xriahKJqLdWmrM8fY05TcqDtXzynOZByonwYcyGLPB2eRRbBIL/rk1jjG
         H5Cb7yY7IoXUomdvL0EQgJQAZBxlaUxGrRkfJpY1CGy3gP7E3UtrjvlZBtIgPgH7H9ii
         P2n/ihRHJEFKn4778/KGcrOldivZ5vcay5CeqRiIpz57s11F8Djlk2e50PJVvy/C3xYj
         AS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507864; x=1770112664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s3fgVVbcQTtRJV48S+nyNEv2JNUdtpWQtsHANx8ZpfI=;
        b=UnnSjbdnVYVA1a6W07SafTK6dDeE4ZnLBCvaBDfSghOfxYpDTMWQjSQN9kmuIdlzJl
         csVDt3vWWsLLq/u8Gi1yJbT08Zp24q+HY4iiZXCFpCIC8/6r7f8Y9mYLwGNbQyDc8kpa
         aghDVGjFt8QwQKlDu1HqKAYzPQMFvEJknX3Y5pdaBZiMikvvDEm7YL9cDP67WqdRegiy
         FyQnyYOP2WjFO6T85xWUNIALEMeAXN52ut9GNL0CVJVamcEra+hbF4Nn2TQtTcCaPTWV
         9H9/2SrZ85iZMPPSzTIcSi30DT1Lpr5MBbssajs5Bh0jMbuO5gvysSqvf+KDI1I7hBvz
         bJ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnZbDPGYBRRm0SoGEJi6aD9wgDG19EQMwIjloSDT6HjiC3+evQGT4M1TLnl6SXHb2ggsogqrhiZ6KBO2iO@vger.kernel.org
X-Gm-Message-State: AOJu0YwjNdv7gbpiSH1IOTCX3ktIYU6weHXIPWPn17qhzqTfdYAO3Qig
	YnqLsEsm410c3qwV2r68Dqa5HcltL8sCaNVQKQ/FjHQZrFqB0Tn27GShEV5+RoQoekk=
X-Gm-Gg: AZuq6aIhN6JYaB60tf5mr7zfMCdJCVLDmYcelEo+HQSxqvTr8BTLSk57VGsO+YXqCZa
	rYNox76XBOs1fCshnK7VaZJZoxWF/WgU7m492aWWQ/M4mJfVYLOqezVW/GXfttFxXXVUoMZOK3Z
	sMVLqpCKpHf2dx+SRVER3N3+GeLXsZwrFT93XwXuY6DpFdUy+4B+ZXCqTIN79Rr5sIE6hhzJFdF
	MVx09BVLkalqmJbxWqJx0tq0zjc/cYKHxYC08ScDth8adHWaIwi5fS2SOAkuy50rzTaGgR5cf51
	ohONRu+S+v4V8yzHdhVFlh/2x5xv9OLL8+CosP7yC3qYt+fnAEaasZpu7mL0pkOUDcXndkjFToY
	O5w7mtnVkG2u0OEZBnVUOcuVa0yARTxGLnvZMwryMdUtYs5Ohxcb2g6pmIdG9/5CjQvIy24BKhL
	+roV+QwIFllp1QscUWPUck5t4Ap0X9Z7A=
X-Received: by 2002:a05:600c:4e90:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-48069c2a907mr13201485e9.4.1769507864355;
        Tue, 27 Jan 2026 01:57:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:57:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:29 +0100
Subject: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4559;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HsXR1ZRReSjuIteRzdqoskAI8e3z5XUN7HnkD9ouWkI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwSkkdAKRmon7OGOT9uwsmrBncm8jOyh0zpmdxa
 TQoDShyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEgAKCRB33NvayMhJ0V4oD/
 9CadGb5W2hLBSTWJcLX1TKMCmKU/DooSZsZyM2Dl6diO3GC2Oi8oNYdFJb+fnacWdtNol23goMlDcb
 st32xe8hVi+AGrdQPZZYF1q4IymW9DgplcUvn7/hZNbEj/BD1MMTqM76d3BbM5zatqPYudBPq4V8qk
 /aR+uQcMDexhYyKIBX0eIYH+cm/aAHbmcfaxxYyGy5HFRYtK0zMYZhwC0xKwYoyy5rdixE2HQRJ6NW
 dt6P0SALIxUZnql3S1G3tjWtYnTPIog0c1G6ROjXl+gY+BRJRa68gYA+o/j3N6VTtbWvyj1aFMwpOW
 06cyZ8Dm0n68LQ6ROLVvnYtVZA3mKEKPkgaAdnnZhL71G9El6/CYu0mA/Xth/0SRMZcdmaQ7NCNjuf
 h+5SePhDJZQ7Bo1VzCrb6fRtdkswbktqkuhQLRMcm0IaZ6cJiwGUaDXSBU3yVEVRsfTctLx2B7AXOj
 7T5JLrPtPitBn1hDOEV9cEkZwvp1jDfRwzDcylnAG9+XwkI0NRTt9QYSOHscyafCFYLTt8hdZzFUFZ
 pql0g1eA2RoILdRDM/+Jvv+HWancC/TTNIEYt1MPQnFSa2UzNGkLXaZ/N3NJJ67VB4a410tGdp61cx
 3dj3kn/tG9eM5rdZyQ3VymgcCnmUKryhJifhlCkcdAl7BPXnjP/cI3L/5Kfg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90689-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 46D959235E
X-Rspamd-Action: no action

Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
power control which connects over PCIe and requires specific power supplies
to start up.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrctrl/Kconfig                 | 10 ++++
 drivers/pci/pwrctrl/Makefile                |  2 +
 drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c | 88 +++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index e0f999f299bb..5a94e60d0d3e 100644
--- a/drivers/pci/pwrctrl/Kconfig
+++ b/drivers/pci/pwrctrl/Kconfig
@@ -11,6 +11,16 @@ config PCI_PWRCTRL_PWRSEQ
 	select POWER_SEQUENCING
 	select PCI_PWRCTRL
 
+config PCI_PWRCTRL_UPD720201
+	tristate "PCI Power Control driver for the UPD720201 USB3 Host Controller"
+	select PCI_PWRCTRL
+	help
+	  Say Y here to enable the PCI Power Control driver of the UPD720201
+	  USB3 Host Controller.
+
+	  The voltage regulators powering the rails of the PCI slots
+	  are expected to be defined in the devicetree node of the PCI device.
+
 config PCI_PWRCTRL_SLOT
 	tristate "PCI Power Control driver for PCI slots"
 	select PCI_PWRCTRL
diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
index 13b02282106c..a99f85de8a3d 100644
--- a/drivers/pci/pwrctrl/Makefile
+++ b/drivers/pci/pwrctrl/Makefile
@@ -5,6 +5,8 @@ pci-pwrctrl-core-y			:= core.o
 
 obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
 
+obj-$(CONFIG_PCI_PWRCTRL_UPD720201)	+= pci-pwrctrl-upd720201.o
+
 obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
 pci-pwrctrl-slot-y			:= slot.o
 
diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
new file mode 100644
index 000000000000..db96bbb69c21
--- /dev/null
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Based on upd720201.c:
+ * Copyright (C) 2024 Linaro Ltd.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pci-pwrctrl.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+struct pci_pwrctrl_upd720201_data {
+	struct pci_pwrctrl ctx;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
+};
+
+static void devm_pci_pwrctrl_upd720201_power_off(void *data)
+{
+	struct pci_pwrctrl_upd720201_data *upd720201 = data;
+
+	regulator_bulk_disable(upd720201->num_supplies, upd720201->supplies);
+	regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
+}
+
+static int pci_pwrctrl_upd720201_probe(struct platform_device *pdev)
+{
+	struct pci_pwrctrl_upd720201_data *upd720201;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	upd720201 = devm_kzalloc(dev, sizeof(*upd720201), GFP_KERNEL);
+	if (!upd720201)
+		return -ENOMEM;
+
+	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
+					&upd720201->supplies);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to get upd720201 regulators\n");
+		return ret;
+	}
+
+	upd720201->num_supplies = ret;
+	ret = regulator_bulk_enable(upd720201->num_supplies, upd720201->supplies);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to enable upd720201 regulators\n");
+		regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_upd720201_power_off,
+				       upd720201);
+	if (ret)
+		return ret;
+
+	pci_pwrctrl_init(&upd720201->ctx, dev);
+
+	ret = devm_pci_pwrctrl_device_set_ready(dev, &upd720201->ctx);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
+
+	return 0;
+}
+
+static const struct of_device_id pci_pwrctrl_upd720201_of_match[] = {
+	{
+		.compatible = "pci1912,0014",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pci_pwrctrl_upd720201_of_match);
+
+static struct platform_driver pci_pwrctrl_upd720201_driver = {
+	.driver = {
+		.name = "pci-pwrctrl-upd720201",
+		.of_match_table = pci_pwrctrl_upd720201_of_match,
+	},
+	.probe = pci_pwrctrl_upd720201_probe,
+};
+module_platform_driver(pci_pwrctrl_upd720201_driver);
+
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_DESCRIPTION("PCI Power Control driver for UPD720201 USB3 Host Controller");
+MODULE_LICENSE("GPL");

-- 
2.34.1


