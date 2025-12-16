Return-Path: <linux-arm-msm+bounces-85368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D638BCC3798
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD5A8304F912
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167963624BD;
	Tue, 16 Dec 2025 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fvP6jVzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBwF6von"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550373612E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892981; cv=none; b=T0OQjjwK0TCbl3FK05OwEJGN85qaSfFbsE1KfQ1fedLIDkZHw1nqMEPIWm2LbRcyWZ9eYOpnW1uBUzRveIYzm60lfH77QUQfJgVRi9+Az5f1vQz7jIvZMlsls272kMfkbt2cPNZk66TQFF4QIBeaL2yb1EXQOQ0JZ/Kv4mmahtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892981; c=relaxed/simple;
	bh=Fyphgpm9oWKQhl4y6fHTvk81D6ocscTgp2cQazg94DE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hz/drLpkzM2FlZ+Ezg+3qiV39uDzg33GLPKd+Ow84Xq+H76gZ//HWu3KlXnLSm+gyUEGnxfr92utSeVOsGEPcbcedX1S9SbfedgMzIFvOMrDm+CkI1YGIUy9Z/n0RNUSBmQ05JQETVK/Cb5lHftlGhE3dtByMw9o7AbK4dfDaQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fvP6jVzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBwF6von; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGDRC7P3745892
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 13:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7/Mz5RzhnX1QZHAKW86jmwpiy8TOBH4L00hU7AiSmY=; b=fvP6jVzVKS61kc3x
	zKhw1sdeRl87LvJEyYqTH2j40jDeUX1Fn1e6WmLIqW0yTl2cFyehLsOQUf7wGxcz
	gxQb9KiXrlYYyykG27vnSmHKA5ncLlr3E5SaENFXobZ0UPvR/G7xrQ2z9PCVj4nM
	5FiB52J7eTNCBhEqqC8Ws3O3VHHoE/aKrh5qPAVEOe1vxrC/zn6uL0TaxARbicGs
	gmHFNwLzh352/dsgal0UrM6KiBO4Hy4RZb7ONrCsMTZa9KN3d4AiKx8YaM52xmoN
	IhqEoAjuiiWYtx80MXinUbIQoWSmh8jTy3KPna2rdi0kC7Vkoan8v5FHN7ulYyBz
	dL2NGg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33xj17kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 13:49:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so25475595ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 05:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765892977; x=1766497777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7/Mz5RzhnX1QZHAKW86jmwpiy8TOBH4L00hU7AiSmY=;
        b=RBwF6vontysnVDsTmjEps7whm1SCTZGwOaU7PnlaNkVMtcTv9ElwfPkn/2MW18ixcJ
         9514rs0ftG9beBb50HT7uQnM20bj6BsoYpSPE1OmYnGiFL1jZLZhllAuyIrX76+35cVl
         hjT8YXTamE8Fd59c9KSgQucKF/1xElSMdxmTd+WGDds8mgueC7v71q6ybyEsbSxlWHHa
         IXHDbpmfFMX9zKQ/HwGzYse+nQVMW2tArPEcdky85KOR+/Z5zqVWDLoXkeX8bGu6HPZn
         s3Gt5RE4MZna42+9u4IWnseVHsk6PcC1BUUyngLmGw2ZkKP/6o41YewwCapJeJrlTfwN
         9suQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892977; x=1766497777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x7/Mz5RzhnX1QZHAKW86jmwpiy8TOBH4L00hU7AiSmY=;
        b=I19SM4k0EUHXehIQEsHbxitfwF09wRxqc427ozaQJuSd8NmiMsnXrtEgEavSMqfQVB
         t/jgzJ0i3RHsZuEzla+av1j5c7j2LKdLIIpOlWjBscSeH02ftXLrwvYCvuEjS4F3kvAx
         ncmkSf38Q2nj0cQzUoZM9MATQvm9hRIl4iuUm2fz+zjNIE8dzQO+/iXFAM00akwfnrLv
         OtV+rlIOoKNpnZ2/hMwycQ9sxsgSdDStp8sGJ+Gs1jg9GBHBckP3ZqfNZQlq1YNv5oQx
         5b3Fy/ee4erty+U/t079peuwWb0yOnsXCs/VwS9xdLe5MYAfbcI3KSHW/UjS4g14EQFW
         ZqeA==
X-Gm-Message-State: AOJu0Yxu8Ka66wlGiiPB4w/mYtEYvOOFmCwdKudk0+OFh1JkLs2dMSnH
	8tEChYjA/OYP6WmzuY6ggKednkZoGYjukV0HmyeHWpk6B/qcv7rVfW+J0KBll5RbVF1c1dAti5E
	7Om+NUmfpIW93xKSBSoixAqK7FMnXPB4ULiAxz3MBLoVeESDxf1tk45HS0egVr0rAzNtHhssBi3
	F9
X-Gm-Gg: AY/fxX6YgF+fZbg+QOFemUQ01UbkPSoA+33ECv14Y79Zjgy+shfPXy6y5IWRSqg87u8
	N9c0VnP7vlNiTvXR6+VHzMiGjgv9lBl9tQylrh0seDb8HbPUqARzSftpZHTyw9zUrfL9e30V5MN
	UqkOmf+xFCqsQFeoYrHvFThStGq+5Te3kzUV+PnwANW60KKSBqXOHKGYrSOBuZEWEXPOdEP88jN
	w8K5r1uf6vZaIe7mWQoVhiBtq/d9lfgq9AaKgqSjvdpnJv7FjgjBUo7lvuSNx81UyeSZfGyqMqz
	Z0qv61LfqmGc8GiU/j2fKTp1d9lCHGbFXqR7oevfAG5dq8fcafEF720WUBo33Br3UT+GpxD8s6I
	QzPS7qA4Ge6EswBkGDHRKQ+Dxj9ogQNhY4dyfO7ZGeCU=
X-Received: by 2002:a17:902:c406:b0:29e:e5e6:247c with SMTP id d9443c01a7336-29eeebce775mr189077055ad.14.1765892976675;
        Tue, 16 Dec 2025 05:49:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEW7799xblQ1JSbsBt3Us6FRqj35KPvzFMwqhjAxwrznE4otMhZ8ln8p3JbJLk6NgptxWvLg==
X-Received: by 2002:a17:902:c406:b0:29e:e5e6:247c with SMTP id d9443c01a7336-29eeebce775mr189076685ad.14.1765892976063;
        Tue, 16 Dec 2025 05:49:36 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm99697165ad.46.2025.12.16.05.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:49:35 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 19:19:18 +0530
Subject: [PATCH v2 2/2] PCI: qcom-ep: Add support for firmware-managed PCIe
 Endpoint
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-firmware_managed_ep-v2-2-7a731327307f@oss.qualcomm.com>
References: <20251216-firmware_managed_ep-v2-0-7a731327307f@oss.qualcomm.com>
In-Reply-To: <20251216-firmware_managed_ep-v2-0-7a731327307f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765892958; l=5973;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=Fyphgpm9oWKQhl4y6fHTvk81D6ocscTgp2cQazg94DE=;
 b=fweZq6YJt+ogIBNs7H7qTkSgUeTy8mr6rZyNWQXHIeGEFjT2/olTmy+VzGwVml7k9Q/sKz9QF
 qt0QBLPmRy0BAOtpmZci+X2K/eV/8QSIPsinZpAU5NG/9u6N7Izdbfp
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: B-S2AmR_-WeZzpvQgOUFHM_PngK7Trm4
X-Proofpoint-GUID: B-S2AmR_-WeZzpvQgOUFHM_PngK7Trm4
X-Authority-Analysis: v=2.4 cv=KtNAGGWN c=1 sm=1 tr=0 ts=69416372 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2tdM-IJ1x2Ue4swjlzoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDExOCBTYWx0ZWRfX+Jk0XT76y0+f
 bjyqSK8pBr/T5OH993H/BpR+Rd8+T5dUTSHsDJCyH6RQZSfNfI0H2pQ/ftm5Ahji63DdozrFhrc
 I4zKG+zbzB9Wo3WyyR4yAXX7V8wm419lL9k2KD9N+oJC9o+MHrvu4EzUa497Ud/eeazoPVAaXFd
 zNwzwLN47G5ZXSKhpKPcD6ML/Yb7kB8fWd769Wdw4mwI0XM3eIJ1gSnY3ZMm218yWPJhihaqlMj
 /cqHy+ne4aDHVNSA/3HFkZeHBRRaVDwEkhm1mY8ntGcJ73YDmgCTNEuw/hnk5QKh1jcHhjLMjXV
 w1Mbn0ExaVHVCvTghmUmlhTEFcsLzlDzdSAaBR0SA1kRtxxBVyn4bEjfDdxmnNX/t2Lk2LhJSrT
 mp/EzhLPHc0m1gSdTCelg/U2wYFioA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160118

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
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 82 +++++++++++++++++++++++--------
 1 file changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index f1bc0ac81a928b928ab3f8cc7bf82558fc430474..2de8b48511169a9c836828c22860dba45f6c9db8 100644
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
@@ -377,10 +379,17 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 
 static void qcom_pcie_disable_resources(struct qcom_pcie_ep *pcie_ep)
 {
-	icc_set_bw(pcie_ep->icc_mem, 0, 0);
-	phy_power_off(pcie_ep->phy);
-	phy_exit(pcie_ep->phy);
-	clk_bulk_disable_unprepare(pcie_ep->num_clks, pcie_ep->clks);
+	struct device *dev = pcie_ep->pci.dev;
+	int ret;
+
+	pm_runtime_put(dev);
+
+	if (!(pcie_ep->cfg && pcie_ep->cfg->firmware_managed)) {
+		icc_set_bw(pcie_ep->icc_mem, 0, 0);
+		phy_power_off(pcie_ep->phy);
+		phy_exit(pcie_ep->phy);
+		clk_bulk_disable_unprepare(pcie_ep->num_clks, pcie_ep->clks);
+	}
 }
 
 static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
@@ -390,12 +399,22 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	u32 val, offset;
 	int ret;
 
-	ret = qcom_pcie_enable_resources(pcie_ep);
-	if (ret) {
-		dev_err(dev, "Failed to enable resources: %d\n", ret);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable endpoint device: %d\n", ret);
 		return ret;
 	}
 
+	/* Enable resources if Endpoint controller is not firmware-managed */
+	if (!(pcie_ep->cfg && pcie_ep->cfg->firmware_managed)) {
+		ret = qcom_pcie_enable_resources(pcie_ep);
+		if (ret) {
+			dev_err(dev, "Failed to enable resources: %d\n", ret);
+			pm_runtime_put(dev);
+			return ret;
+		}
+	}
+
 	/* Perform cleanup that requires refclk */
 	pci_epc_deinit_notify(pci->ep.epc);
 	dw_pcie_ep_cleanup(&pci->ep);
@@ -630,16 +649,6 @@ static int qcom_pcie_ep_get_resources(struct platform_device *pdev,
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
@@ -652,9 +661,22 @@ static int qcom_pcie_ep_get_resources(struct platform_device *pdev,
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
@@ -874,6 +896,12 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
 
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
@@ -894,6 +922,12 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
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
 
@@ -930,7 +964,15 @@ static const struct qcom_pcie_ep_cfg cfg_1_34_0 = {
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
+	{ .compatible = "qcom,pcie-ep-sa8255p", .data = &cfg_1_34_0_fw_managed},
 	{ .compatible = "qcom,sa8775p-pcie-ep", .data = &cfg_1_34_0},
 	{ .compatible = "qcom,sdx55-pcie-ep", },
 	{ .compatible = "qcom,sm8450-pcie-ep", },

-- 
2.25.1


