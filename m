Return-Path: <linux-arm-msm+bounces-61510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CC7ADBD17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 00:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96F8C7A17C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 22:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6748282EE;
	Mon, 16 Jun 2025 22:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZb+aD9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286C122068D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 22:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750113793; cv=none; b=N+hKiqWl4CxXcWB4wx5y+gJnCp6UBfl2TyAoIVJPF+UpaKl5eMl16Shp/KCHEL581PeOLCdOM5hcYEQ9R0gYhZ6wN8GmnQyjJxmaewvP+ckyj1E0mxhrnpDNRmsTpBLTnW4OqLjAXkaGnA4lEv4HPPxi62FtG9HWtWRFnWyntd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750113793; c=relaxed/simple;
	bh=IVJlWT67NFwATC1aEaSSOc0rJVa9EvYX/VHrE9HgMiI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mguhrj39TOWA7o8S3T3Pj9716rBnWigNCTKG0z2Wc9XIZBzgSygqyxVfwF5xYCrSsKgqtZYlICkvHvR+2uKs6V3G/lhh4+nL06m4JVr6wWOYmcsQA4wmFug1Gj9nWF/CVvMQMOwUbv6HL15VX6eT/WXYK8+Hx1pOLp+0Wz/lQuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZb+aD9/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHndtj025769
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 22:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qUeqc8OEENG
	/vdcvWcALgf+8+R5rytQKKW7bjizdq0M=; b=UZb+aD9/1+/tpYg5qjrxnum+yfI
	CvsZGJVorPdraqhljtgWd24DLHOluTGa29RnZ1zwMDnblvDrCBrYwtioOga3+4oA
	l1LH/JeJWehwKa2oYj8s4AbndMBiY+tcpSeFUs70oG8BWORooidH1LZdbSM+6rsx
	l8XdtHL14U4MaLeICNsN/SVJ+cUVHjGjxIGhUhvXc9/e2x8XjHA/2zV21Lls2x3c
	hZGRX3cGTM3LoV+Grfe7U88CWxt0WsQUZYrx05X4F1xAJiBu1HNHVBY1UoKx4eUl
	gi9NFKcLkDHU1UvVjPP28hdzyisWRFJ8sMtDWliWlBneHkLhaMf7lVorauw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crp0v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 22:43:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742c03c0272so6074896b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750113790; x=1750718590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUeqc8OEENG/vdcvWcALgf+8+R5rytQKKW7bjizdq0M=;
        b=Cnla5mL/Bs4e+2RwK4//8TwicAcz56AwkrdYUyaXuNyib7Kj8TnOFiw8wBP/zkRP8a
         +0wDvJcwkdxzvx5bNv6+2kQnfKzyzpmKvj5AKGJbzrgn9jqBKkxDqG/V+u641YsxCoMr
         /4hMTHvzgTo18gouvbxKj7Etl5cIiIXA8QwjKXexmQ7GptdV4pdT1VV0nMe7CbEXMSJd
         zQXfZPcNM1TvF7svCErHd0EZR1zByY/eOpOh3wHFQQHvzbyqTPwD5GvkWOYXlg7F8FsJ
         BHRta/ToPFBSFrgcVZPI99agXJjS/36FGePinxt/nJM8rWPww0bRLEiOSMoNlYd5K2ah
         kPQw==
X-Gm-Message-State: AOJu0YzXSvA3NjfSJkWBC24//AgyJ2G/kqnwUi54Z312nFdEac8bmjGA
	8O2IZ9AjMj4tiUHGV7T5c4ktl7sMXaReyVLcx/x+Jnasjidk+eYalAEX16uSPEOT70GOVGAbyHA
	VYDzjNsVLl0dl0CPIUDE2/2FOONwtmfbYQFJGJd15PAww2Iumli/BIcyuiD5FUB0T7Xq0
X-Gm-Gg: ASbGncu4po0NTAJV5WmT1bwQ7b+fdJVDtJw0XkQi/xN3ER+BjovtqNkRpEL0XdpdrN5
	jfqkcBRbp9aXX0HknhSkX9qDN57re6fr+4YCWFDhVPAsO2IJfJGPVw2aleleejGKqpzqEJiXodo
	sv0lWjw0kTYwi4gruSYBnRddAzIFZ9k6I5GgvLIpCqZId9Bmg/oCOAHNuS+NVScMXEh0oemaHDJ
	+HGFyHR+NOnRfoBQhuUbOHy/6KdCXKLG9HMnnt9q0vLUxTYV9eP90uxJz2sPHl8LJdncBXpNGY1
	7QmxdDBqiNlFFr1tUzAolfTWZK+3tGwh+vYR3WP+mqRhNj0EkyQkRNNpmbdsTPMzgGt9DVxv
X-Received: by 2002:a05:6a00:b4b:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7489cffc1d9mr14008184b3a.13.1750113789730;
        Mon, 16 Jun 2025 15:43:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2aXV8oJypsRpDZPxj/05U7LtypB1Xusvh4lhxZelcO73oGUX5Ap4PiwGb7EjTXdxp3P6rGA==
X-Received: by 2002:a05:6a00:b4b:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7489cffc1d9mr14008153b3a.13.1750113789276;
        Mon, 16 Jun 2025 15:43:09 -0700 (PDT)
Received: from hu-mrana-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083029sm7405077b3a.81.2025.06.16.15.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:43:08 -0700 (PDT)
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
To: linux-pci@vger.kernel.org, will@kernel.org, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        andersson@kernel.org, mani@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, quic_ramkri@quicinc.com,
        quic_shazhuss@quicinc.com, quic_msarkar@quicinc.com,
        quic_nitegupt@quicinc.com, Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: [PATCH v5 4/4] PCI: qcom: Add support for Qualcomm SA8255p based PCIe root complex
Date: Mon, 16 Jun 2025 15:42:59 -0700
Message-Id: <20250616224259.3549811-5-mayank.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616224259.3549811-1-mayank.rana@oss.qualcomm.com>
References: <20250616224259.3549811-1-mayank.rana@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xLqpKc-TIdtcx2zdF31YVCFMCNPP2G8A
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=68509dff cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=2qsEFDsomqtw1e5O1FYA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: xLqpKc-TIdtcx2zdF31YVCFMCNPP2G8A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE2MiBTYWx0ZWRfX3h8FxHKb9Xmi
 Osyrb8JGIE7QkYCmbjx5vvJZ3PQ4mXBkkSwG/XRVbZlh5b/Iy6JW1ETzMKkJMW3cLtly9qixSH6
 ZW0MYUtM3fxHRr8y8m/0pn3oDq56uEBdBX53sJ+Xg/6N3OKTUOysu8oprNxkfQf8ETKqMhm1/qW
 iYPrwsNYcoVySdVyMfWV7QmF/9ozO14pHU3Hv5i2svfSXEyP4gODNhPXy5uQVY4VZXns73iA8xo
 e4VaUnXEAWknA6rIR3jnjI8XJovF0ElPaSNhkJyezsyyyT58t5Q9fxpzziAzA5PrlxGUrI30/Ii
 x7ZX3nIn9v7yOSzZT93bkR0Gh/pbAJkNudLsBaL4aeMNm4bnTd6j/db80xLXoRjmKbf0g5zkC+p
 YtJ9sIpGADnGk2ZUGler0UFSomVvdr/yuwJltb8qlxuP8D10CcwS9LqUuvZyZT28XbY87Tnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_11,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160162

Add functionality to enable resource management through firmware and
enumerate ECAM compliant root complex on SA8255p ride platform, where
PCIe root complex is firmware managed and configured into ECAM
compliant mode.

Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/Kconfig     |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c | 116 +++++++++++++++++++++++--
 2 files changed, 108 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index d9f0386396ed..ce04ee6fbd99 100644
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
index c789e3f85655..0c20e9e78e4d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -21,7 +21,9 @@
 #include <linux/limits.h>
 #include <linux/init.h>
 #include <linux/of.h>
+#include <linux/of_pci.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
@@ -34,6 +36,7 @@
 #include <linux/units.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-designware.h"
 #include "pcie-qcom-common.h"
 
@@ -255,10 +258,12 @@ struct qcom_pcie_ops {
   * @ops: qcom PCIe ops structure
   * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache
   * snooping
+  * @firmware_managed: Set if ecam compliant PCIe root complex is firmware managed
   */
 struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
 	bool override_no_snoop;
+	bool firmware_managed;
 	bool no_l0s;
 };
 
@@ -1426,6 +1431,10 @@ static const struct qcom_pcie_cfg cfg_sc8280xp = {
 	.no_l0s = true,
 };
 
+static const struct qcom_pcie_cfg cfg_fw_managed = {
+	.firmware_managed = true,
+};
+
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
@@ -1579,6 +1588,50 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void qcom_pci_free_msi(void *ptr)
+{
+	struct dw_pcie_rp *pp = (struct dw_pcie_rp *)ptr;
+
+	if (pp && pp->has_msi_ctrl)
+		dw_pcie_free_msi(pp);
+}
+
+static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
+{
+	struct device *dev = cfg->parent;
+	struct dw_pcie_rp *pp;
+	struct dw_pcie *pci;
+	int ret;
+
+	pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
+	if (!pci)
+		return -ENOMEM;
+
+	pci->dev = dev;
+	pp = &pci->pp;
+	pci->dbi_base = cfg->win;
+	pp->num_vectors = MSI_DEF_NUM_VECTORS;
+
+	ret = dw_pcie_msi_host_init(pp);
+	if (ret)
+		return ret;
+
+	pp->has_msi_ctrl = true;
+	dw_pcie_msi_init(pp);
+
+	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
+}
+
+/* ECAM ops */
+static const struct pci_ecam_ops pci_qcom_ecam_ops = {
+	.init		= qcom_pcie_ecam_host_init,
+	.pci_ops	= {
+		.map_bus	= pci_ecam_map_bus,
+		.read		= pci_generic_config_read,
+		.write		= pci_generic_config_write,
+	}
+};
+
 static int qcom_pcie_probe(struct platform_device *pdev)
 {
 	const struct qcom_pcie_cfg *pcie_cfg;
@@ -1593,11 +1646,52 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	char *name;
 
 	pcie_cfg = of_device_get_match_data(dev);
-	if (!pcie_cfg || !pcie_cfg->ops) {
-		dev_err(dev, "Invalid platform data\n");
+	if (!pcie_cfg) {
+		dev_err(dev, "No platform data\n");
+		return -EINVAL;
+	}
+
+	if (!pcie_cfg->firmware_managed && !pcie_cfg->ops) {
+		dev_err(dev, "No platform ops\n");
 		return -EINVAL;
 	}
 
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		goto err_pm_runtime_put;
+
+	if (pcie_cfg->firmware_managed) {
+		struct pci_host_bridge *bridge;
+		struct pci_config_window *cfg;
+
+		bridge = devm_pci_alloc_host_bridge(dev, 0);
+		if (!bridge) {
+			ret = -ENOMEM;
+			goto err_pm_runtime_put;
+		}
+
+		/* Parse and map our configuration space windows */
+		cfg = pci_host_common_ecam_create(dev, bridge,
+				&pci_qcom_ecam_ops);
+		if (IS_ERR(cfg)) {
+			ret = PTR_ERR(cfg);
+			goto err_pm_runtime_put;
+		}
+
+		bridge->sysdata = cfg;
+		bridge->ops = (struct pci_ops *)&pci_qcom_ecam_ops.pci_ops;
+		bridge->msi_domain = true;
+
+		ret = pci_host_probe(bridge);
+		if (ret) {
+			dev_err(dev, "pci_host_probe() failed:%d\n", ret);
+			goto err_pm_runtime_put;
+		}
+
+		return ret;
+	}
+
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
 		return -ENOMEM;
@@ -1606,11 +1700,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	if (!pci)
 		return -ENOMEM;
 
-	pm_runtime_enable(dev);
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
-		goto err_pm_runtime_put;
-
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
 	pp = &pci->pp;
@@ -1756,9 +1845,13 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 static int qcom_pcie_suspend_noirq(struct device *dev)
 {
-	struct qcom_pcie *pcie = dev_get_drvdata(dev);
+	struct qcom_pcie *pcie;
 	int ret = 0;
 
+	pcie = dev_get_drvdata(dev);
+	if (!pcie)
+		return 0;
+
 	/*
 	 * Set minimum bandwidth required to keep data path functional during
 	 * suspend.
@@ -1812,9 +1905,13 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 
 static int qcom_pcie_resume_noirq(struct device *dev)
 {
-	struct qcom_pcie *pcie = dev_get_drvdata(dev);
+	struct qcom_pcie *pcie;
 	int ret;
 
+	pcie = dev_get_drvdata(dev);
+	if (!pcie)
+		return 0;
+
 	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
 		ret = icc_enable(pcie->icc_cpu);
 		if (ret) {
@@ -1849,6 +1946,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-ipq9574", .data = &cfg_2_9_0 },
 	{ .compatible = "qcom,pcie-msm8996", .data = &cfg_2_3_2 },
 	{ .compatible = "qcom,pcie-qcs404", .data = &cfg_2_4_0 },
+	{ .compatible = "qcom,pcie-sa8255p", .data = &cfg_fw_managed },
 	{ .compatible = "qcom,pcie-sa8540p", .data = &cfg_sc8280xp },
 	{ .compatible = "qcom,pcie-sa8775p", .data = &cfg_1_34_0},
 	{ .compatible = "qcom,pcie-sc7280", .data = &cfg_1_9_0 },
-- 
2.25.1


