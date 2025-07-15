Return-Path: <linux-arm-msm+bounces-64960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EA8B053FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF6284E6797
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30104274648;
	Tue, 15 Jul 2025 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V10h7ulx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A2F25F973
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566438; cv=none; b=GPxhJu8p0UJNIfLfSK3Hn/+lwsOOv6/RaNG/xfN0iWUnQCQrMAMqhpMhwHUpB7ERK+JoYWy1p6nyoeib60i5JNcqzQkhn0zo3jEGbZdo8NmYKGhsPx7egEEwnQBxTUc9ZmRpwjNGj2zpCy8PJnH3wycqRyrrYk+44hyL9p0PRho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566438; c=relaxed/simple;
	bh=4JhhB1mQygUC88Tou4uhVLdc03cPbzCj4an+sUn3wpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtRLCHyjzXwyYQBXAo/FzW4JMy229wztlUbYRuey0yVfM9bBHWN1R+Lga7v64McscYUbukEGMcAiA7fdt0lVOIjQHfDqE6GTFwsN28WFDZGsCAPCVT/JeTOG+FpYAfFLxsfMlQ0nvWFfHx/8FUpzwmZwOW8Zds+GN6pXfxeOZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V10h7ulx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F3k4lR004275
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kEhIYqJbOaIa1Xc2HyDfChdym/dNhQN5pFztVZHEzbA=; b=V10h7ulxeguclmyH
	WE+NqBM6BeQc74JWzqoM7zCwesQYgpVJPJhsD/8Zn9CZjwHyyafjN0A4dp658lbr
	SvQYn9qm9Umt2easVTAtsETGHBKU/LYc4u9U78zQBg4DYVOgwrwK366bWoROGCK7
	2JlpQicAL+tmsdBG/5WcVrWYHwigxqvaZNiu47Zzc4F6zzgxjb3RAeuw2MSC0yIj
	zXoEijMd2Adm2SlK8Eb09O5k441W9fYMRwb2InR/+0+65s5VFjeR7aRBqQmSgdjI
	IY7wcRHrf7ALqBpqyra1nxxdC27cTsnthQH/qBhRLro/F1P6EXRC7msrwzYGIAO/
	J6NMbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca0m7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:00:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d40f335529so1068334185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 01:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566434; x=1753171234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEhIYqJbOaIa1Xc2HyDfChdym/dNhQN5pFztVZHEzbA=;
        b=hEQMZCLzo1+wUz9SjOpt0FHwtIU0Mbxs46dsrNOR9o5UaDQ2DLxZkTcz61I+RS29Cv
         jJFIMEu9OtPQHCxDYwmdC0nxqkm8+xHA4arO7uqelLZWfIIXqhZKSbZWF2DzaZWUncwH
         Zjz/bWtndB4tfbV0mlGsWbyj+hu4Zlf678gAq/fmy50vhDhRUybqDF1FFWU1gRkhR5PS
         3LNsLebkoh3XY+jYZNRzUJUzO399NogTSeivglroWQccCOgUax83tCNqgtazKCfPFnqx
         WBVTQ+1ZrhxGzxYRnvWCJ8lnf3x8QDBxWruZrtqnSo6quBq5Ej0PFZYCopKibQVbTSZb
         cDKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPvy1vu+PbR2Atz/kQ5bU/27t6UHogaPSoKN7z4hs7WtrzV4lU2cUwpp3oE42pkdcrZ+leCUuhyFTmZ75g@vger.kernel.org
X-Gm-Message-State: AOJu0YwwLCURlT/bvUDTc09g5VQhd0eMdfGV2PhmAjdNo7YunI3f2mQV
	rQCEVAhx9ovLXfX+mnkHBPiBrFTHgphvQcEE0jW1cynu80WhVYP6WE9+CrnN141NW2MYrmtGjAm
	DM8JthBCea7QBoHuGNtOTm/7JQd+FEMsZBEqNv+fU34NWyUkg+F6N66i83yjMquiD0kWV
X-Gm-Gg: ASbGnctQGr2eft0DuO81uKaJL6gEaLEK//w5ZwE0FE/StUomrpmt1cmTJ+zKI5lGSmr
	DYbKIpmYRNpdFcFWeazKKcqwBaTDVGRU4aFDAhEe6+qgnL7dD26KXNfHV+tLBjuq3E48CDhZLIF
	QLb+UPsIkq1YDRbcrR6bhlmhhvcFRKSxF6NCovkjUiOcLpVPdrdQpcpvklDBJtS2xoWutxoxnSA
	9UdxzECHm62BzriYkfuA8zIe3DKegRj0cX6oS2DQRTTHhJMvFhZkQyv1lHK1FpDGYMe0eyyHXEt
	4Eh/dRxIb8quVJYX0iZRQA0SoW1FtS2ROKDag5rnrSso/iPhcwRQ10WlE9zBUrPVjMkhmg==
X-Received: by 2002:ac8:6907:0:b0:4ab:622b:fffb with SMTP id d75a77b69052e-4ab7f742dc4mr41248951cf.5.1752566433357;
        Tue, 15 Jul 2025 01:00:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH796r6lrIztsRgeIxSf9ms5hlmcL8dEtWpdycBQuSpvlLV+rRBV+Q2s2WU+1kv+eVUhKz0lw==
X-Received: by 2002:ac8:6907:0:b0:4ab:622b:fffb with SMTP id d75a77b69052e-4ab7f742dc4mr41248021cf.5.1752566432691;
        Tue, 15 Jul 2025 01:00:32 -0700 (PDT)
Received: from [192.168.1.17] ([120.60.140.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab3f1c9a2csm37792461cf.67.2025.07.15.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:00:31 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 13:29:20 +0530
Subject: [PATCH v5 3/4] PCI: qcom: Add support for resetting the Root Port
 due to link down event
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-pci-port-reset-v5-3-26a5d278db40@oss.qualcomm.com>
References: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
In-Reply-To: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Niklas Cassel <cassel@kernel.org>,
        Wilfred Mallawa <wilfred.mallawa@wdc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8942;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=hcHUE0Es+rhE1k65uaN43jzCwIv2KxCfrP4I/tTARuY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBodgqB1QE0utBqY/jYrvA6r/I4HDgTWPrqjaBa7
 NuYHzQIJeWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHYKgQAKCRBVnxHm/pHO
 9RqtB/4jqXKRNf4PwhYqoPJL9auiFCZf55Z05d3Hi72i2jKZ/jwqcR/hE7ZmwkjCJeSpDWy2Z9c
 XE0PdD0dGB2PX0gi03PtmZXx5DgVGOscG2SbLIaWM8B520UYAFXJ4kFtGq7DsFEd8QMLIsSTwOh
 NLpHt9hhJ7+gePNTmy8AXfv3xjOLnt1gcWT0Ac8u7EZP2ylznMv6XBYfMuBhg6ij5IMfed73BG8
 GmSweylGR5sBGMCVChkClYBC88UDi8aFzR3/NiLpAqiilRb43EB6dNgVkputG0R/+h1zlAIOO2g
 zj0SoVNnLN4DiUdxKZ2OcDH0gSugoamD2sY2hJMZfBRqJIhH
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3MiBTYWx0ZWRfX1zIUlrnaNGz7
 0esh4ECGsCUJDZBU79XYSW/RlryQYmp1KjLjCBfuUOM4sOknd4o7D9/vNT5sPj6JOfg+PCkK2mK
 m4wsl6uPznpX2wOQioDL16os8LUQZuIP9fVzIgzapsg7+/u2nfesEFDZ7pdohMHxu3tVGZIPdmU
 Yy/Pvh0lp3Uyg7vxrlaJPKYNCHEw75qhPz5KsOb1e50XO/PagjL/85LXji7N5jiOXbLpFFwK/Sv
 uND6oBfoApUg78LhnZGBKSy6SWJOBjvK4U9tDPd8ScKuhGGJixRqDolhi/Gx9pBCZFzH3sNrmKD
 SdT+02w1O31T7UWVAzgyYFMMbVkp1fXzJ+BPcj+ShZNtEAwj93yE4FHCzXMYtD+ysGBirKNH3aF
 ydIkjKRcOIJlbNsM5aAYCZ4a6rIxMdkQLN2bK8BBmjgAVVVmG15xV8MjtNvoiFi6K/m6fwRa
X-Proofpoint-GUID: 7Kji8B97k7DCMn__2fGwzg_1rs9mX4Ut
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68760aa3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=HOswsyiB/7FCIMMjk980kA==:17
 a=NZ62LyZXjo_B3Dgd:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=y4pR3j7WNrOdjUP15kUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7Kji8B97k7DCMn__2fGwzg_1rs9mX4Ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150072

From: Manivannan Sadhasivam <mani@kernel.org>

The PCIe link can go down under circumstances such as the device firmware
crash, link instability, etc... When that happens, the PCIe Root Port needs
to be reset to make it operational again. Currently, the driver is not
handling the link down event, due to which the users have to restart the
machine to make PCIe link operational again. So fix it by detecting the
link down event and resetting the Root Port.

Since the Qcom PCIe controllers report the link down event through the
'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
bit in PARF_INT_ALL_MASK register.

In the case of the event, iterate through the available Root Ports and call
pci_host_handle_link_down() API with Root Port 'pci_dev' to let the PCI
core handle the link down condition. Note that both link up and link down
events could be set at a time when the handler runs. So always handle link
down first. Since Qcom PCIe controllers only support one Root Port per
controller instance, the API will be called only once. But the looping is
necessary as there is no PCI API available to fetch the Root Port instance
without the child 'pci_dev'.

The API will internally call, 'pci_host_bridge::reset_root_port()' callback
to reset the Root Port in a platform specific way. So implement the
callback to reset the Root Port by first resetting the PCIe core, followed
by reinitializing the resources and then finally starting the link again.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/Kconfig     |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c | 120 ++++++++++++++++++++++++++++++---
 2 files changed, 113 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -296,6 +296,7 @@ config PCIE_QCOM
 	select PCIE_DW_HOST
 	select CRC8
 	select PCIE_QCOM_COMMON
+	select PCI_HOST_COMMON
 	help
 	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
 	  PCIe controller uses the DesignWare core plus Qualcomm-specific
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c789e3f856550bcfa1ce09962ba9c086d117de05..5f7b2b80aace742780e5bc5b479f4f64ab778453 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -34,6 +34,7 @@
 #include <linux/units.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-designware.h"
 #include "pcie-qcom-common.h"
 
@@ -55,6 +56,7 @@
 #define PARF_INT_ALL_STATUS			0x224
 #define PARF_INT_ALL_CLEAR			0x228
 #define PARF_INT_ALL_MASK			0x22c
+#define PARF_STATUS				0x230
 #define PARF_SID_OFFSET				0x234
 #define PARF_BDF_TRANSLATE_CFG			0x24c
 #define PARF_DBI_BASE_ADDR_V2			0x350
@@ -130,9 +132,14 @@
 
 /* PARF_LTSSM register fields */
 #define LTSSM_EN				BIT(8)
+#define SW_CLEAR_FLUSH_MODE			BIT(10)
+#define FLUSH_MODE				BIT(11)
 
 /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
-#define PARF_INT_ALL_LINK_UP			BIT(13)
+#define INT_ALL_LINK_DOWN			1
+#define INT_ALL_LINK_UP				13
+#define PARF_INT_ALL_LINK_DOWN			BIT(INT_ALL_LINK_DOWN)
+#define PARF_INT_ALL_LINK_UP			BIT(INT_ALL_LINK_UP)
 #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
 
 /* PARF_NO_SNOOP_OVERRIDE register fields */
@@ -145,6 +152,9 @@
 /* PARF_BDF_TO_SID_CFG fields */
 #define BDF_TO_SID_BYPASS			BIT(0)
 
+/* PARF_STATUS fields */
+#define FLUSH_COMPLETED				BIT(8)
+
 /* ELBI_SYS_CTRL register fields */
 #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
 
@@ -169,6 +179,7 @@
 						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
 
 #define PERST_DELAY_US				1000
+#define FLUSH_TIMEOUT_US			100
 
 #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
 
@@ -274,11 +285,14 @@ struct qcom_pcie {
 	struct icc_path *icc_cpu;
 	const struct qcom_pcie_cfg *cfg;
 	struct dentry *debugfs;
+	int global_irq;
 	bool suspended;
 	bool use_pm_opp;
 };
 
 #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
+static int qcom_pcie_reset_root_port(struct pci_host_bridge *bridge,
+				  struct pci_dev *pdev);
 
 static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
 {
@@ -1263,6 +1277,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 			goto err_assert_reset;
 	}
 
+	pp->bridge->reset_root_port = qcom_pcie_reset_root_port;
+
 	return 0;
 
 err_assert_reset:
@@ -1517,6 +1533,78 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 	}
 }
 
+/*
+ * Qcom PCIe controllers only support one Root Port per controller instance. So
+ * this function ignores the 'pci_dev' associated with the Root Port and just
+ * resets the host bridge, which in turn resets the Root Port also.
+ */
+static int qcom_pcie_reset_root_port(struct pci_host_bridge *bridge,
+				  struct pci_dev *pdev)
+{
+	struct pci_bus *bus = bridge->bus;
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	struct device *dev = pcie->pci->dev;
+	u32 val;
+	int ret;
+
+	/* Wait for the pending transactions to be completed */
+	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
+					 val & FLUSH_COMPLETED, 10,
+					 FLUSH_TIMEOUT_US);
+	if (ret) {
+		dev_err(dev, "Flush completion failed: %d\n", ret);
+		goto err_host_deinit;
+	}
+
+	/* Clear the FLUSH_MODE to allow the core to be reset */
+	val = readl(pcie->parf + PARF_LTSSM);
+	val |= SW_CLEAR_FLUSH_MODE;
+	writel(val, pcie->parf + PARF_LTSSM);
+
+	/* Wait for the FLUSH_MODE to clear */
+	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
+					 !(val & FLUSH_MODE), 10,
+					 FLUSH_TIMEOUT_US);
+	if (ret) {
+		dev_err(dev, "Flush mode clear failed: %d\n", ret);
+		goto err_host_deinit;
+	}
+
+	qcom_pcie_host_deinit(pp);
+
+	ret = qcom_pcie_host_init(pp);
+	if (ret) {
+		dev_err(dev, "Host init failed\n");
+		return ret;
+	}
+
+	ret = dw_pcie_setup_rc(pp);
+	if (ret)
+		goto err_host_deinit;
+
+	/*
+	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
+	 * non-sticky.
+	 */
+	if (pcie->global_irq)
+		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
+			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
+
+	qcom_pcie_start_link(pci);
+	dw_pcie_wait_for_link(pci);
+
+	dev_dbg(dev, "Root Port reset completed\n");
+
+	return 0;
+
+err_host_deinit:
+	qcom_pcie_host_deinit(pp);
+
+	return ret;
+}
+
 static int qcom_pcie_link_transition_count(struct seq_file *s, void *data)
 {
 	struct qcom_pcie *pcie = (struct qcom_pcie *)dev_get_drvdata(s->private);
@@ -1559,11 +1647,24 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
 	struct qcom_pcie *pcie = data;
 	struct dw_pcie_rp *pp = &pcie->pci->pp;
 	struct device *dev = pcie->pci->dev;
-	u32 status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
+	struct pci_dev *port;
+	unsigned long status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
 
 	writel_relaxed(status, pcie->parf + PARF_INT_ALL_CLEAR);
 
-	if (FIELD_GET(PARF_INT_ALL_LINK_UP, status)) {
+	/*
+	 * It is possible that both Link Up and Link Down events might have
+	 * happended. So always handle Link Down first.
+	 */
+	if (test_and_clear_bit(INT_ALL_LINK_DOWN, &status)) {
+		dev_dbg(dev, "Received Link down event\n");
+		for_each_pci_bridge(port, pp->bridge->bus) {
+			if (pci_pcie_type(port) == PCI_EXP_TYPE_ROOT_PORT)
+				pci_host_handle_link_down(port);
+		}
+	}
+
+	if (test_and_clear_bit(INT_ALL_LINK_UP, &status)) {
 		dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
 		/* Rescan the bus to enumerate endpoint devices */
 		pci_lock_rescan_remove();
@@ -1571,11 +1672,12 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
 		pci_unlock_rescan_remove();
 
 		qcom_pcie_icc_opp_update(pcie);
-	} else {
-		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
-			      status);
 	}
 
+	if (status)
+		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
+			      (u32) status);
+
 	return IRQ_HANDLED;
 }
 
@@ -1732,8 +1834,10 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 			goto err_host_deinit;
 		}
 
-		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_MSI_DEV_0_7,
-			       pcie->parf + PARF_INT_ALL_MASK);
+		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
+			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
+
+		pcie->global_irq = irq;
 	}
 
 	qcom_pcie_icc_opp_update(pcie);

-- 
2.45.2


