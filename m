Return-Path: <linux-arm-msm+bounces-87682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADE6CF855D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 13:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 546DD30274FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 12:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D3E32E6A2;
	Tue,  6 Jan 2026 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEMHp2w/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UpDcsu4n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2173732D435
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702919; cv=none; b=gLbM4fj3BxXgPxi5fTAdEa8pp3CSmTbvNPh9Sl+1NoxRQjkbbEbu9wkWoJo0CoqvCnJGJvP5wGVDkhW2ah5BOAt8hM/korWOoWtsuVXqG1gr/vx/5m9Qg9YgZgp62SycnTV9joTFZ5ihtpJGKt4CfZ5vDpZUuMplakRtdE+YLLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702919; c=relaxed/simple;
	bh=lpREkdKrYB0i9xOdYVwf95ZKijvVrCKLc5MhFmp5Mds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNvPnSiF3vMAQp7LqudbvX66PGWOZCLmVSUXFu1WPY5FCa3tsm8urL7ARnacDnrUPpT39un+YGfb+eodTUQscqC9F9GwHCu61NDQ2PoJHKIIQuLo70TakwxoJD4d/9CD+BorBHnMP8dFe7HdGPrW7+MT6eDYCJ5/rCwosv3L1P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEMHp2w/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UpDcsu4n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AqNFX2684114
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 12:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eXweGIGQP+389eatYl/A0e37pEINDI7V0gdpqnXDHQE=; b=nEMHp2w/W++28fiy
	jAg5IGg4HtnzAmqyQIvnIo5ghdnxF68byLUXy6xhgX5lw6wtNoHTMWbqW0QCfoAw
	5jXvWXCTZjlfU+a3UHu9Stu8YCVAWbtaEq2kutC85Qj5nQezANKkjiOt8V/ruOS5
	4M8aGl5l7//V27tSOsi/4xv63nL5rWyIrPHLZ1X6YhamtAksgVq984crmmPfmIjP
	SOPZ9+WXmvtSclf29R8vKeGfMgqu8IhcUQJSrmyNMlu45pWohuDjDkgQkR7x3BNa
	4ABgPKUROh+0tIqTJ0gcvlNug7kRvSQSsldiBErcnaXf7YMms13AUel0aytzHSOb
	hrcPfA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgty5hceq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 12:35:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7f21951c317so834648b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 04:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767702916; x=1768307716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXweGIGQP+389eatYl/A0e37pEINDI7V0gdpqnXDHQE=;
        b=UpDcsu4n3DvgJrBiNompEop2U7bcBlk+SCr91g88aNrr6PoXaBZdDqehNWknhDVanh
         TOMeFPMueBSN4rXVeMpHadk0G7UVP8mhviOYdISN+zp7n3z4eSa/hGQ0O92v3zOTZ+y0
         tJUYOPakJJZQTKyZwJFfM2klQ14fUp1z6TYjtIZr/jEk/8MVZCX0VP/64zQeVZ9qRljg
         QLhSv/y0PI4iavf6JXXL4N9CHOU4B+/bdC+DS/GlzY6+9ZC36zzKKQFJqnzHGmqORH7f
         jCYj3wXveQk9KG296UpPcNKjKQzkQ2gL57M2xWnUQ0QQGVX5+f8G843dzSw2WiL1dFY4
         doQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767702916; x=1768307716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eXweGIGQP+389eatYl/A0e37pEINDI7V0gdpqnXDHQE=;
        b=gIXi8oEKJHIHvXyMQw9rLBWywr51QNGrASENzTF83el+DoeXaX9koRyFC01QDCB9hB
         XKi6Jc2kfPzLNFdrEaoWusGsLQJM4+as31QmiPS/371APZ802BaQYZzVjqLlx4i/AclB
         AsxH4wu3uDUkXUXNzHBWWCfmYN9Gvmhnw9zoz4/Akiyl8Xx2Cpytm26y26mtyMfgAakl
         Dt01DzcacPV0/Xi3t8tsoCrh1pqsU8zb2eNcQKz8qHjPvQ8JpOzk9xcu+eKpr8vJ5Vij
         EYlUaDg2m21oH/j5HYx0233clmd/wI7THObcAeZgQ9Rb3/l95VTyNuINJF2BaC6glTse
         7CFQ==
X-Gm-Message-State: AOJu0YxsyFesnL3Kcopy4DvzpGaZwSc0tW6e54R0wbmRk2E3vqR0kNIS
	ITKw2P6KbIa3/r0fWtB9sywvJUkTeH0yH8POdQqxRze/6S6jU6k0RojBWpu2LfnQD6TEDq+Qoyn
	8qWXc/buSVIE8y8bKlQRVwEsm7A6fvjbLqnTu2dPA69cun1NoSH7oqxM2q08M1im4wSWd
X-Gm-Gg: AY/fxX4B+MrXsSUGxXJhvXnXmSvmegRpKSD3z/kf2sZOsg+VgiQgeMrmi9RM/xyZ/qV
	NMyYZkn+GM+ZBLeGyGhbhKf42l0q6C7cIBHXrqdvJBr3/219SFRhn6gZ33e8k2LtfqyrxZFNxJq
	r1h9pGwQi8VBXpZBoFQAWd/VrB9W9hwzU33IofH1o0n8If3+B3f5Q+5NxuY2r1LgYJvK4HNprYg
	3Gw9gioM/Ul1DCgeHZOjChtr4c//CPQDbsiJ0/hOk9VarTsg2hvza7Q9cb4OqTVvp0MtfFhKd2z
	LCloXLmgw8SM8m9MWJfkD20kXMp0gbkEfgz4IZHG31ltM6aEgWYighoBkt8UGaMr/c8TxoRq6kP
	Y8iyEhPBxquqV/5YnQsoQCTnaFv2mcLTdG7q555q3wtU=
X-Received: by 2002:a05:6a00:4295:b0:781:1f28:eadd with SMTP id d2e1a72fcca58-81880b6c513mr2696948b3a.20.1767702915945;
        Tue, 06 Jan 2026 04:35:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHge5WmZqCBf8j+3Ngw9xkT9W1WtOx50n7DYYhwZyH4ZZwl7y63KFgminhgHunMQGCuKBeUeg==
X-Received: by 2002:a05:6a00:4295:b0:781:1f28:eadd with SMTP id d2e1a72fcca58-81880b6c513mr2696923b3a.20.1767702915396;
        Tue, 06 Jan 2026 04:35:15 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e83bcsm2161583b3a.56.2026.01.06.04.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 04:35:15 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 18:04:46 +0530
Subject: [PATCH v5 2/2] PCI: qcom-ep: Add support for firmware-managed PCIe
 Endpoint
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-firmware_managed_ep-v5-2-1933432127ec@oss.qualcomm.com>
References: <20260106-firmware_managed_ep-v5-0-1933432127ec@oss.qualcomm.com>
In-Reply-To: <20260106-firmware_managed_ep-v5-0-1933432127ec@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        quic_vbadigan@quicinc.com, quic_shazhuss@quicinc.com,
        konrad.dybcio@oss.qualcomm.com,
        Mrinmay sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Rama Krishna <quic_ramkri@quicinc.com>,
        Ayiluri Naga Rashmi <quic_nayiluri@quicinc.com>,
        Nitesh Gupta <quic_nitegupt@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767702896; l=5344;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=lpREkdKrYB0i9xOdYVwf95ZKijvVrCKLc5MhFmp5Mds=;
 b=/huxLK/6VSsK0Qf6AxudDDmeD+PNnbOej5xqjM/S4amSM+KIbtPLCg8h1kfDJutFmYO4VJAvv
 TnhVRiNI4l6DLI8A2ZIwZuAhx7PZ9q2e5z57FVhjR0URlbxZVUbk5Wr
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEwOCBTYWx0ZWRfX33J0C4PKAx3z
 90z+eeQUBQQNrLQz0sw4FRbw7DxmULfaFoqFw1sWeI0OIl3jtPCwcKlvqiBW5LhgI4EtH0Ez99o
 pN3DTC3IhtOSJymFBH7FMclMRus3OuwAL0dcu+Mi8kcg5AB3Z4Zi0RjsmCcy0oS2/qpB3gV8wwu
 j3WMvjk0EsnHMkDVEmiLvMLY9/eZRc7QirLi+3DZ1rU4gxAmwOYAr10yGZzpgT+wZjzy0v/E4qo
 XIHXwGasoQ98c6lg/uuIk8pxbT8jh7FN95h3WsSW8X1wnt2IdVqOadU1gEuuNEouklOvfh1qyUr
 TewAA3riX4EOEqz9KBVSANfqOmIgRyYfuxdk2lfIzBegCMag2z0qKZLR4z3nCTcnf1SjXSHvSke
 W91FvA4jt77d70C9GLxinbrHWz64babumWVDwbQUjpfzDO2Wuch58IxjobvqBTfaD1HPsfBo1+c
 7rYSu/PE4kBajc4ybDg==
X-Authority-Analysis: v=2.4 cv=Rfidyltv c=1 sm=1 tr=0 ts=695d0185 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2tdM-IJ1x2Ue4swjlzoA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: WGSP-VcojM_IAbjnisWHtme2_WTPeSUY
X-Proofpoint-ORIG-GUID: WGSP-VcojM_IAbjnisWHtme2_WTPeSUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060108

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
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 61 +++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index f1bc0ac81a928b928ab3f8cc7bf82558fc430474..38fcc241032b60e4c93574e4d759596ddf268efa 100644
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
@@ -377,6 +379,14 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 
 static void qcom_pcie_disable_resources(struct qcom_pcie_ep *pcie_ep)
 {
+	struct device *dev = pcie_ep->pci.dev;
+
+	pm_runtime_put(dev);
+
+	/* Skip resource disablement if Endpoint controller is firmware-managed */
+	if (pcie_ep->cfg && pcie_ep->cfg->firmware_managed)
+		return;
+
 	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 	phy_power_off(pcie_ep->phy);
 	phy_exit(pcie_ep->phy);
@@ -390,12 +400,24 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	u32 val, offset;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable endpoint device: %d\n", ret);
+		return ret;
+	}
+
+	/* Skip resource enablement if Endpoint controller is firmware-managed */
+	if (pcie_ep->cfg && pcie_ep->cfg->firmware_managed)
+		goto skip_resources_enable;
+
 	ret = qcom_pcie_enable_resources(pcie_ep);
 	if (ret) {
 		dev_err(dev, "Failed to enable resources: %d\n", ret);
+		pm_runtime_put(dev);
 		return ret;
 	}
 
+skip_resources_enable:
 	/* Perform cleanup that requires refclk */
 	pci_epc_deinit_notify(pci->ep.epc);
 	dw_pcie_ep_cleanup(&pci->ep);
@@ -630,6 +652,17 @@ static int qcom_pcie_ep_get_resources(struct platform_device *pdev,
 		return ret;
 	}
 
+	pcie_ep->reset = devm_gpiod_get(dev, "reset", GPIOD_IN);
+	if (IS_ERR(pcie_ep->reset))
+		return PTR_ERR(pcie_ep->reset);
+
+	pcie_ep->wake = devm_gpiod_get_optional(dev, "wake", GPIOD_OUT_LOW);
+	if (IS_ERR(pcie_ep->wake))
+		return PTR_ERR(pcie_ep->wake);
+
+	if (pcie_ep->cfg && pcie_ep->cfg->firmware_managed)
+		return 0;
+
 	pcie_ep->num_clks = devm_clk_bulk_get_all(dev, &pcie_ep->clks);
 	if (pcie_ep->num_clks < 0) {
 		dev_err(dev, "Failed to get clocks\n");
@@ -640,14 +673,6 @@ static int qcom_pcie_ep_get_resources(struct platform_device *pdev,
 	if (IS_ERR(pcie_ep->core_reset))
 		return PTR_ERR(pcie_ep->core_reset);
 
-	pcie_ep->reset = devm_gpiod_get(dev, "reset", GPIOD_IN);
-	if (IS_ERR(pcie_ep->reset))
-		return PTR_ERR(pcie_ep->reset);
-
-	pcie_ep->wake = devm_gpiod_get_optional(dev, "wake", GPIOD_OUT_LOW);
-	if (IS_ERR(pcie_ep->wake))
-		return PTR_ERR(pcie_ep->wake);
-
 	pcie_ep->phy = devm_phy_optional_get(dev, "pciephy");
 	if (IS_ERR(pcie_ep->phy))
 		ret = PTR_ERR(pcie_ep->phy);
@@ -874,6 +899,12 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie_ep);
 
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	ret = qcom_pcie_ep_get_resources(pdev, pcie_ep);
 	if (ret)
 		return ret;
@@ -894,6 +925,12 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 		goto err_disable_irqs;
 	}
 
+	ret = pm_runtime_put_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to disable endpoint device: %d\n", ret);
+		goto err_disable_irqs;
+	}
+
 	pcie_ep->debugfs = debugfs_create_dir(name, NULL);
 	qcom_pcie_ep_init_debugfs(pcie_ep);
 
@@ -930,7 +967,15 @@ static const struct qcom_pcie_ep_cfg cfg_1_34_0 = {
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


