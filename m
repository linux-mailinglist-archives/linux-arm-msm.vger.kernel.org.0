Return-Path: <linux-arm-msm+bounces-10986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B82E8548B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 12:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50C771C2264E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 11:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B611A58B;
	Wed, 14 Feb 2024 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mgi9IlDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25591B964
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707911177; cv=none; b=cfnErgRx3Q/ZCxZQXTJigXd9Wi+rZxJJh3XQs9PKSTMYnxtjZH/r3nowW9YCs8yyWqdxLd0kn2UAYWoxeXdQVOH0knyH8/WXT8gEd1SlT6MXrJbU09EiyEBEny2O5TRpbvqQ30vqQ0342AdiVTFtdcZlaTPlgJcy4a1SPk3BoxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707911177; c=relaxed/simple;
	bh=iaFhux7+ftCQreqL4+9rxGj5oghyh3WmJyVki73C+Bc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z19KWh8/Ra28qFubH/YiaekMzjB581wkOr1g+9lLcaaAdnaFEyi+Qffuu7RZu0qH/sotElYId/NJ9IUB5vLUKYNCtU2OF/JsbatnfC1iHN42DEy3pgWkZ1fKD3+MsUkm6bGAJtY6604CPfUGCuryHuy9VUH8Z2QUem1co0QrqQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mgi9IlDT; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e2d8a21b79so1671397a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 03:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707911175; x=1708515975; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stU+R4KG+NyQbt4ql0bZhshhmz0bDBsi5UUfG+CKyak=;
        b=Mgi9IlDThPJqe5w4Qu/TPIQC9vhvcSB0iPqI1PeOCHDncgzMm+uoXA8YgU8fX5fCTA
         9l1IBhnL2VxVPR97Ea/vW+0C+/zRdKWBk7WOFACsdGmLzVXh5gmVjALxJrJz6zRsmHWP
         GQW3l8j3FOVdixcvlhTZvXMQ96sV7D7qno3CcXMzqSm2asfEMS4OhY3y1/EajTnmOiM1
         G7qvQp9L3ZLPSoYLTmeGJucVk5FN7Nj5yWriW/wOcjeiVVOjBrVkj7xEBvrpeo90lb26
         buIHoJRGknozEYAeySNURmGUInZ6US0IeTYwMBYzMucFvGPH/p41+boRkXY8BkVjaMQP
         hCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707911175; x=1708515975;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stU+R4KG+NyQbt4ql0bZhshhmz0bDBsi5UUfG+CKyak=;
        b=YpFk7fK22nwyCL8DdA/z/jGzPrJLyI+2QsipVrWpJhSUtXaKY9UsX86bJ4XcRabCeL
         6HLpXyZaberSMW+LfZ4YdFtTpg7YfnF598IIH1t26ZS7Xid55p6PCb/QTbkJRuj7e6lA
         h2qstYMSQTrNFbC0z/qpHO+PMDhzrQFO0kXyzyCj0U7Q6RjXL8d7UBrTs8iU3VMx0jdF
         YszGrdusjHzlvR9pMO8okjdGF1Z4cfquoxBsnq2JubaIhqQBPghq3XOHGvWw+R9F0my7
         EPDkZeWH8L4WirczKJNv96htcjnEx8yvG5oUXVjuOfFqIznoNNsIUBVz1rUFK4P2Elc6
         9twg==
X-Forwarded-Encrypted: i=1; AJvYcCWSbbX3qFGj+2Uy/5H7EHN66SJi3AXgsMcbeU37BSneS4Axc43h4f5rZliUN5O9iElQWR/xsQe1M4EzTr2Dk4zAqSft5F4jy0qWONGfaw==
X-Gm-Message-State: AOJu0YyySGQ5T6URPFqWJ1X3uCUUteEoGkmXGOrQ1hQuXglrmTVaTixU
	Foi+eA78bTigqq0DDtKWFWoOsz6vIcWLXwiYJqFqh5tCHHeV8p5q41mX1+HQ3g==
X-Google-Smtp-Source: AGHT+IExOXztcpJuZehy39qkAgIJjMeLNBIE1g7Y0XjwPk1GFEOHTHyOZ8MtrSFaaWBsuecca5y8PQ==
X-Received: by 2002:a05:6358:b00d:b0:176:40d5:2bd5 with SMTP id l13-20020a056358b00d00b0017640d52bd5mr2310044rwn.6.1707911174688;
        Wed, 14 Feb 2024 03:46:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXT9B6A1cp+QOKPZkvk+EwZp++YLu3rcZe5XHi3LJPDwegVbg5YoQNUr/IRQzOR4W/UNqypDIlwKgEsy1WfzcUeEUUDoNmPd6wFJNhdGMVJ7vDtUmaogh1BNAj+ebpQ8Uz6qxK4NBfQLVKH1AC3ef/HMZDk5yj43xW9zn+yJ7d37oM1EZPpmNDamtf33G8ZhlQEJVgFvbKLmMe5MY7ZGD8XSFXYmPV93t8Q8kQJH/8Lgkf89yLGVqEMFpZQvLjvBAubk84IpYZPqNvH5WMoHre1Pn0kDY+PTdYAz/LLFwynQKg9QZ4FdmfB3HBbFWIK1LQrHqv19JjObAfB3JKFnzrc+Mzzsrwf4mTr1FJsrRI+ZjUgLnDxeZNlbfe/GRFNhy49k57ljD0YhGwLvgsNDY51wmEBi8AraTrrT4h7JSMb2LKFLQDO43LIhw==
Received: from [127.0.1.1] ([103.28.246.124])
        by smtp.gmail.com with ESMTPSA id y189-20020a62cec6000000b006e0d1e6036bsm6674283pfg.129.2024.02.14.03.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 03:46:14 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 14 Feb 2024 17:16:09 +0530
Subject: [PATCH v3] PCI: Add D3 support for PCI bridges in DT based
 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-pcie-qcom-bridge-v3-1-3a713bbc1fd7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAACozGUC/3WOQQ6CMBBFr2K6tqbTIi2uvIdh0dICkyjF1hAN4
 e4WdIEJLv+fvPdnJNEFdJGcdiMJbsCIvktB7HekanXXOIo2ZcIZzxgIoH2Fjt4rf6MmoE13kyv
 GdSEl04IkrA+uxueivJQptxgfPryWhQHm9iPjbEM2AGW0dk4W0tTmyOT5ip0O/uBDM8u/JP9DZ
 rmVUhVK5BVbk/MfA19tQ7Zh4BRoYW1ujQGj4Ge7nKbpDWmfCRotAQAA
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, quic_krichai@quicinc.com, 
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3809;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=iaFhux7+ftCQreqL4+9rxGj5oghyh3WmJyVki73C+Bc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlzKgCyomV+XS6Wz5pwRsl7Pq4qvnDSmu3D+FVx
 gggOTH/97qJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZcyoAgAKCRBVnxHm/pHO
 9R9nB/9dmzL8gNylVCHcQQfkMcfyzrnKwuvQ6ASSQ3DXHhdDWw08KgwxD3Cfm2G0GLZo08Mj+me
 hoIqviztRLCA/stpX3XDSqhoOlbECFUuWumoXrdjWd6JskL5rhljSyu7ol51qEkD/9NpmfolqIJ
 S+Al6CQJP6OluE7WZI1vtTCMHLJ+cF/bicicceBSerjNdIh6/ziBvs9yhytrODKmS3bvBvN5bwV
 ogNqJLvo5Qxb2MDslQNdwKQZhF5/JlONMqQbmB+5RTY/ltCESJ7kIYq/u9xwBBm3OucAMZGPYZJ
 VGflmQpHGohZagBRbBwV2grEKa5LnPHdZ831PQWQD0vzUcf/
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Currently, PCI core will enable D3 support for PCI bridges only when the
following conditions are met:

1. Platform is ACPI based
2. Thunderbolt controller is used
3. pcie_port_pm=force passed in cmdline

While options 1 and 2 do not apply to most of the DT based platforms,
option 3 will make the life harder for distro maintainers. Due to this,
runtime PM is also not getting enabled for the bridges.

To fix this, let's make use of the "supports-d3" property [1] in the bridge
DT nodes to enable D3 support for the capable bridges. This will also allow
the capable bridges to support runtime PM, thereby conserving power.

Ideally, D3 support should be enabled by default for the more recent PCI
bridges, but we do not have a sane way to detect them.

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-pci-bridge.yaml#L31

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
This patch is tested on Qcom SM8450 based development board with an out-of-tree
DT patch.

NOTE: I will submit the DT patches adding this property for applicable bridges
in Qcom SoCs separately.

Changes in v3:
- Fixed kdoc, used of_property_present() and dev_of_node() (Lukas)
- Link to v2: https://lore.kernel.org/r/20240214-pcie-qcom-bridge-v2-1-9dd6dbb1b817@linaro.org

Changes in v2:
- Switched to DT based approach as suggested by Lukas.
- Link to v1: https://lore.kernel.org/r/20240202-pcie-qcom-bridge-v1-0-46d7789836c0@linaro.org
---
 drivers/pci/of.c  | 12 ++++++++++++
 drivers/pci/pci.c |  3 +++
 drivers/pci/pci.h |  6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 51e3dd0ea5ab..24b0107802af 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -786,3 +786,15 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
 	return slot_power_limit_mw;
 }
 EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
+
+/**
+ * of_pci_bridge_d3 - Check if the bridge is supporting D3 states or not
+ *
+ * @node: device tree node of the bridge
+ *
+ * Return: %true if the bridge is supporting D3 states, %false otherwise.
+ */
+bool of_pci_bridge_d3(struct device_node *node)
+{
+	return of_property_present(node, "supports-d3");
+}
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index d8f11a078924..8678fba092bb 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1142,6 +1142,9 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
 	if (pci_use_mid_pm())
 		return false;
 
+	if (dev_of_node(&dev->dev))
+		return of_pci_bridge_d3(dev->dev.of_node);
+
 	return acpi_pci_bridge_d3(dev);
 }
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 2336a8d1edab..10387461b1fe 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -635,6 +635,7 @@ int of_pci_get_max_link_speed(struct device_node *node);
 u32 of_pci_get_slot_power_limit(struct device_node *node,
 				u8 *slot_power_limit_value,
 				u8 *slot_power_limit_scale);
+bool of_pci_bridge_d3(struct device_node *node);
 int pci_set_of_node(struct pci_dev *dev);
 void pci_release_of_node(struct pci_dev *dev);
 void pci_set_bus_of_node(struct pci_bus *bus);
@@ -673,6 +674,11 @@ of_pci_get_slot_power_limit(struct device_node *node,
 	return 0;
 }
 
+static inline bool of_pci_bridge_d3(struct device_node *node)
+{
+	return false;
+}
+
 static inline int pci_set_of_node(struct pci_dev *dev) { return 0; }
 static inline void pci_release_of_node(struct pci_dev *dev) { }
 static inline void pci_set_bus_of_node(struct pci_bus *bus) { }

---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240131-pcie-qcom-bridge-b6802a9770a3

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


