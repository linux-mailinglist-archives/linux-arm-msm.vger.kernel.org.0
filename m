Return-Path: <linux-arm-msm+bounces-84228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C6255C9F203
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 14:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2F3D83459A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 13:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D212F7ABA;
	Wed,  3 Dec 2025 13:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRpQckj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clSOKl0V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477B02F7441
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764768432; cv=none; b=TYRIH/nDiXEq5W2LGAh7dem32r51AYiaIVqiIG1KhgOuqyfyLl+Vk/nJF1MVOLzqBgfeffPCCafLj/iwyYvKRLP9y6x5M6PE3F2yVaNYi2C+rV0ka05pxxjBWnaV+cG74CrtOKEsenl0CO9ufui4bM8BH9HPglzeMoI2mMEeuM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764768432; c=relaxed/simple;
	bh=PEgmMcA6tcXQs4WHfh3euJKGWxFYZPxKrfbQQAB7wII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=af0Yjf/Qdf8r/iJLXm+IKRy0Mson3PxaJAarDmrn30aaneDWH9DkRw4bhkiZkNqt3DwnX0j/IIdVhhKS0oi3mO5zzuvNywjHmjxzuSWHw6qhvSNxPKHBERwAzCn9VKzIssJ93YC62JF+Kg6sOhFfXmcQxfFb2SiyXF669ySSRaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRpQckj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clSOKl0V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3B4iwl2626940
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 13:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6RouoxK2Ma/UsqtjtMGIiFVgDGOOn8UTixVHNqHuD4=; b=NRpQckj3MxHvbYnm
	Ht8GyktATgQHXfjBbZ9dp91PYXegTgmeHOgTJQCfcPTTxbqNd3G+wvXeuR9ygeki
	LrWc0ibsOsj9OVqCUgCzBK/+L/lat8G9WCvI6c93985vciP5qi5BNJQKzOQwiFiC
	VlLXKbjB6pS6B+1kX5v2T6Y2DZqov5v9PnDVyKjNXq+Dzp7qaz+hAxTpIvgAcncP
	e6D146daEze9+Hn6VFqSKzSPZwwmTJm9QC4tBXEtJMV3acIUvTbmxHOkQiTvmrWO
	EvBCDEAj4z+zmN8YGIfp/UD4SSj+7RhZLxuz1UtbN4kTXIhB6+UZfEYZYNH/VxG9
	ooMCIw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm128b12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 13:27:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b96038aa68so892809b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 05:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764768429; x=1765373229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6RouoxK2Ma/UsqtjtMGIiFVgDGOOn8UTixVHNqHuD4=;
        b=clSOKl0ViuOLb9/cootwMSjKbN78iQS9/x4FIo0roAkOZcEwUEabvv3JMwslGgzPsn
         S5d89X5AUIebmCmrqJeL8eWs1ZcKOH3NRBP/E3EYJBVCX76sPiv9rallAVAR5hIMDL6G
         hZ40C6+QcH9ZrL6KFA04tTwKsEBO1IQsNyzzhvuK272IE+LIP2L6U9E2FNeaB1WMQ2G/
         D5kQzLKHjNbGxgAsznSun8kRDaWohtbqY9KMpMNPcuWcA/Pm4jsYJzzy4mjd4TSUdZaU
         uulDrFr2JfOdWZtH+elBKCgJvGB6UE4m28p1/ql0TXMO6fT6s+4IiFA++dOjnnzwi0T2
         zTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764768429; x=1765373229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G6RouoxK2Ma/UsqtjtMGIiFVgDGOOn8UTixVHNqHuD4=;
        b=utDdVQVzCNjndISv6GhtYd2ZmteBVQtaUOyHhhwNNCzrvlGA7AZWFxILsXDZcw1Cim
         +KT4P++LmNbCZKUoNi3TIhaxxGORCgpmbjig3cY797diH4MhFuhkUCwviAmUExg0LVT5
         WMEu7KNwBWEjohWmZRwroa8GLUTKwVEPNObgn6jzTCYCQwdhE6agvjRB6tE9UtRmKxzF
         1QZpCvLvSlpb6zY/7OMeYrZY6L3E/4prreK9BI5JeQsSMxfgVALvbxuGryWvc2+K0R2+
         CgolVu21bXkHvCcGqsdwHfVbD0SV1cVPsApKl6DgqAHPZepUqU0F7vTE+BYWxWZnL0nv
         D17g==
X-Gm-Message-State: AOJu0YzSk2j3Bvo2YuC7bHo3lQUwBqAWmHloJnIaZX44M8HIufeupfNZ
	ADuWQYCnfoRg2NwXyVjgDJzGv7+fPe+SS5kztrPdGJ2Sed9qX0deuvXF2jIDpJ6vXv5pGS+hZhw
	NnFZRSCOyqTp/Gbn/TXUNl+tcpZJZxwEu/X1cPAegxsgrH56XZ/0GjIwF2/t80AbLzvLS
X-Gm-Gg: ASbGncuVAgIgsIJBYTYIdFtdXr9akuoTmSA2ypd+rNjnTkU0MHx45Iuz/MK0SvzvItR
	zIpB/ElOYuRKkp+rhqMqTqp+rrL8ORekmgh+LfR8404eMVeEi9NCJ9KjhfXFHOsr2r9jQKRl5KU
	m9TLI1jtektG+Zu5b0cacWrMpgKjswHrJ6xfKEkxv4/gCAdEJ2Juuc72Ris0g6epW66X+LQZVBh
	qiQj/W5KeSeRZavzmGq+w/bPg3XyopxeLuN6qS/PPa/LMIDWm2u5QMyMG5hj6YQXQhsqxQZc/GY
	S/Nv74I+PLw7J6EkZS86XKNVdx4yeQ8E7D5qN0SLUOF5UOf3if6i+ifARy+TR9ZpPO7WzNBOk7r
	CIMxBp6suUQf5edupC6oZp4pZWMQg8RJ36sXHO5Eb74Y=
X-Received: by 2002:a05:6a00:3d10:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-7dd789c5f1emr6693671b3a.13.1764768429218;
        Wed, 03 Dec 2025 05:27:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGinZ8Y7e3RuxTljGQgsvfg/7CZa7++tyONDr9TSdQ1s6dL2fTMnrdfeiS7Jpe8xuUSDY0Kbg==
X-Received: by 2002:a05:6a00:3d10:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-7dd789c5f1emr6693630b3a.13.1764768428730;
        Wed, 03 Dec 2025 05:27:08 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e6e6e06sm20287524b3a.43.2025.12.03.05.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 05:27:08 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 18:56:48 +0530
Subject: [PATCH 2/2] PCI: qcom-ep: Add support for firmware-managed PCIe
 Endpoint
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-firmware_managed_ep-v1-2-295977600fa5@oss.qualcomm.com>
References: <20251203-firmware_managed_ep-v1-0-295977600fa5@oss.qualcomm.com>
In-Reply-To: <20251203-firmware_managed_ep-v1-0-295977600fa5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        quic_vbadigan@quicinc.com, quic_shazhuss@quicinc.com,
        konrad.dybcio@oss.qualcomm.com,
        Mrinmay sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Rama Krishna <quic_ramkri@quicinc.com>,
        Ayiluri Naga Rashmi <quic_nayiluri@quicinc.com>,
        Nitesh Gupta <quic_nitegupt@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764768410; l=5827;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=PEgmMcA6tcXQs4WHfh3euJKGWxFYZPxKrfbQQAB7wII=;
 b=XOmKmDruCRXctzFOs1E3WzShUQFjDjIaHZoI+VFtkS+heCMQ7pqmg6IGIKcyh3Ef/Gf5sdOnO
 1jukGaZ8zGXDIuaEICVd0yJwDSS6cBjofSiNLaVXCLBMMl5fdlL1QL8
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEwNyBTYWx0ZWRfX5pMcBZwzackS
 Qmk56fvLbqn53ICxKEmDv36VardLWbblMqHqbTE4lA52gno00uDMBDU6tGrKAIl7v0GtnsqCpAW
 E1KSKu+sJXlcfNdLVmUJ+V5oSl5OZwlWdL0LBC/PIFTvtM4l0MnOvD3s1fIpDX6VdvtkgjZJcl4
 5NHD+AtPVbRB6w2ypuZ33hV1gw4wmGADNoHkQx8ho8wjwWaIcmjMHRZJxdXUCtvQVjK07HKOjtL
 yjfcfFd/dm4PM4h8qzn6lTpH4ANAz6QJsUBFTyrknigJjINMo9SLd67qAn+AvwJ23zcDTpajyjI
 no0QMvMFb/aH6wLGj9w9PfrFyVIc4ZlPNl5L27E63VuAZ1CoBc5lwz+rL4YinChCPR4QqFOH/5l
 bGXOKSVyWyTCRV1+Q3D1n8CajSJxxA==
X-Authority-Analysis: v=2.4 cv=JY6xbEKV c=1 sm=1 tr=0 ts=69303aae cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2tdM-IJ1x2Ue4swjlzoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 6BkWOFoGgZRztGSfd6ramW41lg9hIl5I
X-Proofpoint-ORIG-GUID: 6BkWOFoGgZRztGSfd6ramW41lg9hIl5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030107

Some Qualcomm platforms use firmware to manage PCIe resources such as
clocks, resets, and PHY through the SCMI interface. In these cases,
the Linux driver should not perform resource enable or disable
operations directly. Additionally, runtime PM support has been enabled
to ensure proper power state transitions.

This commit introduces a `firmware_managed` flag in the Endpoint
configuration structure. When set, the driver skips resource handling
and uses generic runtime PM calls to let firmware do resource management.

A new compatible string is added for SA8255P platforms where firmware
manages resources.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 80 ++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index f1bc0ac81a928b928ab3f8cc7bf82558fc430474..38358c9fa7ab32fd36efcea0a42c52f1f86a523a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -168,11 +168,13 @@ enum qcom_pcie_ep_link_status {
  * @hdma_support: HDMA support on this SoC
  * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache snooping
  * @disable_mhi_ram_parity_check: Disable MHI RAM data parity error check
+ * @firmware_managed: Set if the Endpoint controller is firmware managed
  */
 struct qcom_pcie_ep_cfg {
 	bool hdma_support;
 	bool override_no_snoop;
 	bool disable_mhi_ram_parity_check;
+	bool firmware_managed;
 };
 
 /**
@@ -377,6 +379,15 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 
 static void qcom_pcie_disable_resources(struct qcom_pcie_ep *pcie_ep)
 {
+	struct device *dev = pcie_ep->pci.dev;
+	int ret;
+
+	ret = pm_runtime_put_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to disable endpoint device: %d\n", ret);
+		return;
+	}
+
 	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 	phy_power_off(pcie_ep->phy);
 	phy_exit(pcie_ep->phy);
@@ -390,12 +401,22 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	u32 val, offset;
 	int ret;
 
-	ret = qcom_pcie_enable_resources(pcie_ep);
-	if (ret) {
-		dev_err(dev, "Failed to enable resources: %d\n", ret);
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable endpoint device: %d\n", ret);
 		return ret;
 	}
 
+	/* Enable resources if Endpoint controller is not firmware-managed */
+	if (!(pcie_ep->cfg && pcie_ep->cfg->firmware_managed)) {
+		ret = qcom_pcie_enable_resources(pcie_ep);
+		if (ret) {
+			dev_err(dev, "Failed to enable resources: %d\n", ret);
+			pm_runtime_put_sync(dev);
+			return ret;
+		}
+	}
+
 	/* Perform cleanup that requires refclk */
 	pci_epc_deinit_notify(pci->ep.epc);
 	dw_pcie_ep_cleanup(&pci->ep);
@@ -630,16 +651,6 @@ static int qcom_pcie_ep_get_resources(struct platform_device *pdev,
 		return ret;
 	}
 
-	pcie_ep->num_clks = devm_clk_bulk_get_all(dev, &pcie_ep->clks);
-	if (pcie_ep->num_clks < 0) {
-		dev_err(dev, "Failed to get clocks\n");
-		return pcie_ep->num_clks;
-	}
-
-	pcie_ep->core_reset = devm_reset_control_get_exclusive(dev, "core");
-	if (IS_ERR(pcie_ep->core_reset))
-		return PTR_ERR(pcie_ep->core_reset);
-
 	pcie_ep->reset = devm_gpiod_get(dev, "reset", GPIOD_IN);
 	if (IS_ERR(pcie_ep->reset))
 		return PTR_ERR(pcie_ep->reset);
@@ -652,9 +663,22 @@ static int qcom_pcie_ep_get_resources(struct platform_device *pdev,
 	if (IS_ERR(pcie_ep->phy))
 		ret = PTR_ERR(pcie_ep->phy);
 
-	pcie_ep->icc_mem = devm_of_icc_get(dev, "pcie-mem");
-	if (IS_ERR(pcie_ep->icc_mem))
-		ret = PTR_ERR(pcie_ep->icc_mem);
+	/* Populate resources if Endpoint controller is not firmware-managed */
+	if (!(pcie_ep->cfg && pcie_ep->cfg->firmware_managed)) {
+		pcie_ep->num_clks = devm_clk_bulk_get_all(dev, &pcie_ep->clks);
+		if (pcie_ep->num_clks < 0) {
+			dev_err(dev, "Failed to get clocks\n");
+			return pcie_ep->num_clks;
+		}
+
+		pcie_ep->core_reset = devm_reset_control_get_exclusive(dev, "core");
+		if (IS_ERR(pcie_ep->core_reset))
+			return PTR_ERR(pcie_ep->core_reset);
+
+		pcie_ep->icc_mem = devm_of_icc_get(dev, "pcie-mem");
+		if (IS_ERR(pcie_ep->icc_mem))
+			ret = PTR_ERR(pcie_ep->icc_mem);
+	}
 
 	return ret;
 }
@@ -874,6 +898,16 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie_ep);
 
+	pm_runtime_set_active(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable endpoint device: %d\n", ret);
+		return ret;
+	}
+
 	ret = qcom_pcie_ep_get_resources(pdev, pcie_ep);
 	if (ret)
 		return ret;
@@ -897,6 +931,12 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 	pcie_ep->debugfs = debugfs_create_dir(name, NULL);
 	qcom_pcie_ep_init_debugfs(pcie_ep);
 
+	ret = pm_runtime_put_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to disable endpoint device: %d\n", ret);
+		goto err_disable_irqs;
+	}
+
 	return 0;
 
 err_disable_irqs:
@@ -930,7 +970,15 @@ static const struct qcom_pcie_ep_cfg cfg_1_34_0 = {
 	.disable_mhi_ram_parity_check = true,
 };
 
+static const struct qcom_pcie_ep_cfg cfg_1_34_0_fw_managed = {
+	.hdma_support = true,
+	.override_no_snoop = true,
+	.disable_mhi_ram_parity_check = true,
+	.firmware_managed = true,
+};
+
 static const struct of_device_id qcom_pcie_ep_match[] = {
+	{ .compatible = "qcom,sa8255p-pcie-ep", .data = &cfg_1_34_0_fw_managed},
 	{ .compatible = "qcom,sa8775p-pcie-ep", .data = &cfg_1_34_0},
 	{ .compatible = "qcom,sdx55-pcie-ep", },
 	{ .compatible = "qcom,sm8450-pcie-ep", },

-- 
2.25.1


