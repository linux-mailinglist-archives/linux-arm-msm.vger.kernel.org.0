Return-Path: <linux-arm-msm+bounces-16097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51489528C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 14:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF341C215D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 12:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B3483CD6;
	Tue,  2 Apr 2024 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="roCwfhHK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE983CB1
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712059692; cv=none; b=WfDoRtg5EBhWZ9NTzMlnJ2sAV0CP5eM1VgTFl/z7+W8dVwcAZy5UCMxPNs10alm4DXi5/qyjbX6sHBLWySlXC5KgQmz/mixur91j1QYEBj71RhK95wCwrq6R2gyhRl5UAw04FjZDfCuWZRDyf3SbNeSCGgWrZeSaoV1L55icf6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712059692; c=relaxed/simple;
	bh=5lzv0FCxMJV+6eMWAl2BkglRlaaER3JpeGnoI4xXHTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOefcm7S5K3N9Q4RL0qQ1duR7B2zVF8oOkmztJCcwj/ISRra7oCaHJhCD1geSpM5yp7niE0V0vp1M6TsPLoDbaz2Fp+xRlZpqevIwiSm5akP/pJrFh3Tu29dKk1CrNIFPSLQTrGsPSxNIE1mv0cMiIa6R8Mzyca8zvXudJ4Xbhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=roCwfhHK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a4702457ccbso631313466b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 05:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712059687; x=1712664487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUalNrbfbrxbwM0ycSW1gsKaZR1W99qZXQXgxCOsfPw=;
        b=roCwfhHK5DJcFNzYBRt/ZQnP5uR/pdDqHWgIE1k4WP9KYYEF7aLya1L/iCIzTspGWN
         TO3vg7AzHOMp5mkywh30cdmy4AfBLD5mT3tFVlimuldGl+hF78dgUIqSCZYOKMzVgotm
         kMM0uN8rBecAyUBQOrSZt16ugzo+cUGDCC8fCNr9i3v54lHOKJDuXcKQAjNyGttRW6DK
         qa4hA01qu9rhdJ90K4VtxTQ/+l7kZlkicN7jzEDFRzKQZr9O8z+SaxGoF+NvUra/p4Dr
         pbVjOq70/oB8av94ZH10LO+3+XanFBhfYcFnZ8ooRfGHkk1rwvH+MU2cmdU/NF5XMxCi
         PU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059687; x=1712664487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUalNrbfbrxbwM0ycSW1gsKaZR1W99qZXQXgxCOsfPw=;
        b=iBEdxMFmSnuVLwBpQ47zz2J1sMGGRD2VOK0VycdGp9FFFYSDEaF8BTnpzyFu48dcq1
         8TGOCW38qsX8PM7jCLHF/z/tBPwWfzf4rzjN6T6D6sXbO9sozDK9XjyVNUfg4GNFWIm5
         QK1i0PNpM+ggkZfxjEEpadnJPuHWb56xPalkH05EX2n2Iv2djS/4oa0jDbBLN8G7aXxw
         ZjtDDnAYvx4tjk2QnB4qXd43/BNaM8TG0xAJntokIloDj2UahGWtHFyBOvZq8Hr9oLna
         UwHgpOvJ4JAhTTtO3qZD9fMp5fxG7bAtdQ4Cwur3+/UiRS524T+weX1q2T/YbfUd46xt
         JfHg==
X-Forwarded-Encrypted: i=1; AJvYcCVPo2rPZAQ8mXHmk0zQx6sDZkmisxT3+Rs2dIRW3qdSpJvXoZ8vIlq9dQbzWXzE5ZUAc2rIa9ZpfonbrSKidpiGZHUA8/RM7J585pjmlQ==
X-Gm-Message-State: AOJu0YyMtWBEL9C0hCUrT6zj07vxyV2svXao6ZOFT6+IB+K0kR8/ZRyK
	6JEEf6UiOnih+EdQ0ye0ZISjzS2O48vHFXrkp6/KhPW0zxQTYOeHE7TFycHIM9LOqHL1MmbjxMF
	1
X-Google-Smtp-Source: AGHT+IHluOCa3U55gU1404/cstKM8jThiDf3RlVD44TYCRhUJKgbHehml0oDw5pmcgUz0VOCucjG9g==
X-Received: by 2002:a17:907:86a9:b0:a4e:68a9:a6d2 with SMTP id qa41-20020a17090786a900b00a4e68a9a6d2mr4786542ejc.64.1712059687298;
        Tue, 02 Apr 2024 05:08:07 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id l13-20020a1709065a8d00b00a4df251a601sm6519384ejq.77.2024.04.02.05.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:08:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 02 Apr 2024 15:07:36 +0300
Subject: [PATCH v8 7/7] spmi: pmic-arb: Add multi bus support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-spmi-multi-master-support-v8-7-ce6f2d14a058@linaro.org>
References: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
In-Reply-To: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9929; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=5lzv0FCxMJV+6eMWAl2BkglRlaaER3JpeGnoI4xXHTw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmC/UZuhRIavaNOOBHKBUu7LI+R3rh6XcutvCL3
 qmA0I9xGcyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgv1GQAKCRAbX0TJAJUV
 Vu9nD/0QtF2vIfzSVVyVdiuiXvVwd/waWHHisBGtzXCWAic97M08R9as1WjaBirT5ANE4Vm+Xzl
 S/rKBGU7At8neh4JamV4Liseat8mkRnGGRLW6JfG51q0wIpNFA9wqJ6GGhFSZG/NAn2QEoSSmGV
 pEDSwqq/PusbASTNA0duyB8JBaBB0VP8eXwMZTT9R02drLDkARimyrUKAU97L4mgwLMyYOGW7ft
 xP5+/jN5bAc0lf+ONKlzZBHla4fZhRmfFb6QUuQ0bGd8E3oZvHBho8JBkzXyRkU8R2qu75vWShW
 4jZvs3dTwpRbq4gFLDd9xLz4QHK2VxLVziUsdTDIZrKS26ExqjDhLB0NL11lV8adgVvNy/qH02M
 uTb7iAolr4ufJ1a4b0hipXrM2HJKId6VMsjduYzslgDlEgiILXZ81xB/hZg5l1pg8W+XNxifQRU
 hS9AHXUoMEDP6mg/IJtX2Y6QiaIk6Wno/XYKmjdiODmdpVtqXPJcBZ3UjS/lws8Lb8bCfb973dV
 Vs3JkhVWBw0lStw6SWXa1AaPp/Wu907bfcWcXQNdiyWrB1nLPjQh2KhDb9TYeeua5uNwSHuDBYQ
 PDajMeV7G/M3LURjwOyGwiEoRcQ/sXXfieQJYQVtflptLsaKghR/i5bFevv9kGaFeLHVY0IJ0aH
 2z+xkX923ll3kZA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Starting with HW version 7, there are actually two separate buses
(with two separate sets of wires). So add support for the second bus.
The first platform that needs this support for the second bus is the
Qualcomm X1 Elite, so add the compatible for it as well.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/spmi/spmi-pmic-arb.c | 138 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 120 insertions(+), 18 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 3db622ed80de..52b9e275a7b2 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -95,6 +96,8 @@ enum pmic_arb_channel {
 	PMIC_ARB_CHANNEL_OBS,
 };
 
+#define PMIC_ARB_MAX_BUSES		2
+
 /* Maximum number of support PMIC peripherals */
 #define PMIC_ARB_MAX_PERIPHS		512
 #define PMIC_ARB_MAX_PERIPHS_V7		1024
@@ -148,6 +151,7 @@ struct spmi_pmic_arb;
  * @min_apid:		minimum APID (used for bounding IRQ search)
  * @max_apid:		maximum APID
  * @irq:		PMIC ARB interrupt.
+ * @id:			unique ID of the bus
  */
 struct spmi_pmic_arb_bus {
 	struct spmi_pmic_arb	*pmic_arb;
@@ -165,6 +169,7 @@ struct spmi_pmic_arb_bus {
 	u16			min_apid;
 	u16			max_apid;
 	int			irq;
+	u8			id;
 };
 
 /**
@@ -179,7 +184,8 @@ struct spmi_pmic_arb_bus {
  * @ee:			the current Execution Environment
  * @ver_ops:		version dependent operations.
  * @max_periphs:	Number of elements in apid_data[]
- * @bus:		per arbiter bus instance
+ * @buses:		per arbiter buses instances
+ * @buses_available:	number of buses registered
  */
 struct spmi_pmic_arb {
 	void __iomem		*rd_base;
@@ -191,7 +197,8 @@ struct spmi_pmic_arb {
 	u8			ee;
 	const struct pmic_arb_ver_ops *ver_ops;
 	int			max_periphs;
-	struct spmi_pmic_arb_bus *bus;
+	struct spmi_pmic_arb_bus *buses[PMIC_ARB_MAX_BUSES];
+	int			buses_available;
 };
 
 /**
@@ -220,7 +227,7 @@ struct spmi_pmic_arb {
 struct pmic_arb_ver_ops {
 	const char *ver_str;
 	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
-	int (*init_apid)(struct spmi_pmic_arb_bus *bus);
+	int (*init_apid)(struct spmi_pmic_arb_bus *bus, int index);
 	int (*ppid_to_apid)(struct spmi_pmic_arb_bus *bus, u16 ppid);
 	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
 	int (*offset)(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
@@ -309,8 +316,8 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
 			}
 
 			if (status & PMIC_ARB_STATUS_FAILURE) {
-				dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x)\n",
-					__func__, sid, addr, status);
+				dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x) reg: 0x%x\n",
+					__func__, sid, addr, status, offset);
 				WARN_ON(1);
 				return -EIO;
 			}
@@ -326,8 +333,8 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
 		udelay(1);
 	}
 
-	dev_err(&ctrl->dev, "%s: %#x %#x: timeout, status %#x\n",
-		__func__, sid, addr, status);
+	dev_err(&ctrl->dev, "%s: %#x %#x %#x: timeout, status %#x\n",
+		__func__, bus->id, sid, addr, status);
 	return -ETIMEDOUT;
 }
 
@@ -1006,11 +1013,17 @@ static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
 	return 0;
 }
 
-static int pmic_arb_init_apid_v1(struct spmi_pmic_arb_bus *bus)
+static int pmic_arb_init_apid_v1(struct spmi_pmic_arb_bus *bus, int index)
 {
 	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
 	u32 *mapping_table;
 
+	if (index) {
+		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
+			index);
+		return -EINVAL;
+	}
+
 	mapping_table = devm_kcalloc(&bus->spmic->dev, pmic_arb->max_periphs,
 				     sizeof(*mapping_table), GFP_KERNEL);
 	if (!mapping_table)
@@ -1253,11 +1266,17 @@ static int pmic_arb_offset_v2(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
 	return 0x1000 * pmic_arb->ee + 0x8000 * apid;
 }
 
-static int pmic_arb_init_apid_v5(struct spmi_pmic_arb_bus *bus)
+static int pmic_arb_init_apid_v5(struct spmi_pmic_arb_bus *bus, int index)
 {
 	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
 	int ret;
 
+	if (index) {
+		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
+			index);
+		return -EINVAL;
+	}
+
 	bus->base_apid = 0;
 	bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
 					PMIC_ARB_FEATURES_PERIPH_MASK;
@@ -1329,6 +1348,50 @@ static int pmic_arb_get_core_resources_v7(struct platform_device *pdev,
 	return pmic_arb_get_obsrvr_chnls_v2(pdev);
 }
 
+/*
+ * Only v7 supports 2 buses. Each bus will get a different apid count, read
+ * from different registers.
+ */
+static int pmic_arb_init_apid_v7(struct spmi_pmic_arb_bus *bus, int index)
+{
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+	int ret;
+
+	if (index == 0) {
+		bus->base_apid = 0;
+		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
+						   PMIC_ARB_FEATURES_PERIPH_MASK;
+	} else if (index == 1) {
+		bus->base_apid = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
+						  PMIC_ARB_FEATURES_PERIPH_MASK;
+		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES1) &
+						   PMIC_ARB_FEATURES_PERIPH_MASK;
+	} else {
+		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
+			bus->id);
+		return -EINVAL;
+	}
+
+	if (bus->base_apid + bus->apid_count > pmic_arb->max_periphs) {
+		dev_err(&bus->spmic->dev, "Unsupported APID count %d detected\n",
+			bus->base_apid + bus->apid_count);
+		return -EINVAL;
+	}
+
+	ret = pmic_arb_init_apid_min_max(bus);
+	if (ret)
+		return ret;
+
+	ret = pmic_arb_read_apid_map_v5(bus);
+	if (ret) {
+		dev_err(&bus->spmic->dev, "could not read APID->PPID mapping table, rc= %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * v7 offset per ee and per apid for observer channels and per apid for
  * read/write channels.
@@ -1581,7 +1644,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 static const struct pmic_arb_ver_ops pmic_arb_v7 = {
 	.ver_str		= "v7",
 	.get_core_resources	= pmic_arb_get_core_resources_v7,
-	.init_apid		= pmic_arb_init_apid_v5,
+	.init_apid		= pmic_arb_init_apid_v7,
 	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
 	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
 	.offset			= pmic_arb_offset_v7,
@@ -1605,6 +1668,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 				  struct device_node *node,
 				  struct spmi_pmic_arb *pmic_arb)
 {
+	int bus_index = pmic_arb->buses_available;
 	struct spmi_pmic_arb_bus *bus;
 	struct device *dev = &pdev->dev;
 	struct spmi_controller *ctrl;
@@ -1623,7 +1687,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 
 	bus = spmi_controller_get_drvdata(ctrl);
 
-	pmic_arb->bus = bus;
+	pmic_arb->buses[bus_index] = bus;
 
 	bus->ppid_to_apid = devm_kcalloc(dev, PMIC_ARB_MAX_PPID,
 					 sizeof(*bus->ppid_to_apid),
@@ -1666,12 +1730,13 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 	bus->cnfg = cnfg;
 	bus->irq = irq;
 	bus->spmic = ctrl;
+	bus->id = bus_index;
 
-	ret = pmic_arb->ver_ops->init_apid(bus);
+	ret = pmic_arb->ver_ops->init_apid(bus, bus_index);
 	if (ret)
 		return ret;
 
-	dev_dbg(&pdev->dev, "adding irq domain\n");
+	dev_dbg(&pdev->dev, "adding irq domain for bus %d\n", bus_index);
 
 	bus->domain = irq_domain_add_tree(dev->of_node,
 					  &pmic_arb_irq_domain_ops, bus);
@@ -1684,14 +1749,53 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
 					 pmic_arb_chained_irq, bus);
 
 	ctrl->dev.of_node = node;
+	dev_set_name(&ctrl->dev, "spmi-%d", bus_index);
 
 	ret = devm_spmi_controller_add(dev, ctrl);
 	if (ret)
 		return ret;
 
+	pmic_arb->buses_available++;
+
 	return 0;
 }
 
+static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
+					struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct device_node *child;
+	int ret;
+
+	/* legacy mode doesn't provide child node for the bus */
+	if (of_device_is_compatible(node, "qcom,spmi-pmic-arb"))
+		return spmi_pmic_arb_bus_init(pdev, node, pmic_arb);
+
+	for_each_available_child_of_node(node, child) {
+		if (of_node_name_eq(child, "spmi")) {
+			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+static void spmi_pmic_arb_deregister_buses(struct spmi_pmic_arb *pmic_arb)
+{
+	int i;
+
+	for (i = 0; i < PMIC_ARB_MAX_BUSES; i++) {
+		struct spmi_pmic_arb_bus *bus = pmic_arb->buses[i];
+
+		irq_set_chained_handler_and_data(bus->irq,
+						 NULL, NULL);
+		irq_domain_remove(bus->domain);
+	}
+}
+
 static int spmi_pmic_arb_probe(struct platform_device *pdev)
 {
 	struct spmi_pmic_arb *pmic_arb;
@@ -1762,21 +1866,19 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 
 	pmic_arb->ee = ee;
 
-	return spmi_pmic_arb_bus_init(pdev, dev->of_node, pmic_arb);
+	return spmi_pmic_arb_register_buses(pmic_arb, pdev);
 }
 
 static void spmi_pmic_arb_remove(struct platform_device *pdev)
 {
 	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
-	struct spmi_pmic_arb_bus *bus = pmic_arb->bus;
 
-	irq_set_chained_handler_and_data(bus->irq,
-					 NULL, NULL);
-	irq_domain_remove(bus->domain);
+	spmi_pmic_arb_deregister_buses(pmic_arb);
 }
 
 static const struct of_device_id spmi_pmic_arb_match_table[] = {
 	{ .compatible = "qcom,spmi-pmic-arb", },
+	{ .compatible = "qcom,x1e80100-spmi-pmic-arb", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, spmi_pmic_arb_match_table);

-- 
2.34.1


