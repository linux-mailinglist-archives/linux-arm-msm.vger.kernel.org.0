Return-Path: <linux-arm-msm+bounces-45661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453CA179CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 10:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85A057A3876
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 09:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2691BF7E0;
	Tue, 21 Jan 2025 09:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3mJAkWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A001E32D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737450189; cv=none; b=MTKIogxFJLaoDKecLMVdoSN7vu60np0lsqf5bnZaJGqYsCXluKw4UQholHVPj0lUn8OrXWw6i0kB5Sv0zGr6KOKOb8VnmhFEQvbyqGikeq/obmAM6ua9MgDiZM8hp1U7V4d9JSOgZd0Sp/Mz1iOKWZFdT8UQc+TogvVHS6N9Gyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737450189; c=relaxed/simple;
	bh=SYsZuISEFecO0dItPGcTh+FGUKWuxe8fmZZ5miNptNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0sx4rv2VpFYvFOE2sm+513xZoRJtI8Bp6I6u81HgQiuvrpsHYTuxlYqYsHxiMWKSWgdBw2Z6RhLZkbU11WM8VarpbwqCKw19lyoM4D2N5OMW6bghX/s4ho8m49XeBWMm5m1QXLO+Uv77xTPCL11X8D+WLNTPjkWfVh8OcM8jn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3mJAkWt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8Z9aQ009633
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 09:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOZ3Plf/84AprWUsku4OuoK1THEyxuBI7O10NByDcg8=; b=B3mJAkWtzM/x8hWW
	TBNthaXJfnHpjPsJAQ52EhX2vOljdLRT/5ng6O0Ved3v5zU4Fy7Wf3RRcemTM13K
	IB2LFHHLklMgq+BMwEritJ4f6UrUL+iVCz+SzeWtf62SuR1GPSHKSe9E/YnV5AOQ
	CZ/Pg5IBEa1AarBDHyc0fayTpuYW+zdxQsY+BNeSb/SwCJDIHVUXZc55MShPFT6X
	fCWYlt58EvBUwH8p/V7Vm4rTwGU/pTVSPUEpHfBFxaJ3xUgynwyT0gkqCyjjCdX5
	WdQ0JBHzwoHgzztayW5oScwYhacXAvHp6FZxuPWFFUbOIyscRFRW0hMsY5oorisR
	azvtNg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a71nr88b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 09:03:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216728b170cso98713955ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 01:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737450185; x=1738054985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOZ3Plf/84AprWUsku4OuoK1THEyxuBI7O10NByDcg8=;
        b=s6jcUBKYRMGssPeEnjh7qdNvmtUDy6EuIn8cvYt8b62e5Ksn6tl0cPmrylKpcukHpw
         k4OmiHAqpuDURL4aOJtP6Jrnoou7CNiDdGXdJUIfGxdWYsZpUNh6hz1C1BpoUUuC6B3j
         bYZmTi0f6IvWeqCNeliQRJiynqKpvYHC2ywTWnX3yn6JzaXc/JbRghaF9HR4MeuicOjs
         FZPvTs1ikJhEToi58LOi8cfAzrBWfjKiwoC19d3SMhaWdpRFAiLLYmEtjxBWf2mhYIB+
         4O8kIJTfyqgdW0OV4dPuJMNq9fTqpCRcK6oRVkOG2w+L/lZU003m1r/hh3cIGvBUnfnt
         VTsA==
X-Gm-Message-State: AOJu0YzHZZ7fJJ8NEATEMAe1lL7ghRMJ0rjBChFFhsu0IElWiXKgDFhZ
	hN49fC294mg9TbudiJx3FEMWsxoCflBmL+bzvxl8lFiqqKIyGMrzvDsvEQ5rJ5J4rPn7Y/Jv7VF
	cWkSERvaAhPSQ159/bdGvDYPX6py7Iur+8WiVjFg+EMi6+V5OLvwdmrObD6ba+bUA
X-Gm-Gg: ASbGncuUWTS9ZhY5ydkqnO3DGX5EP4i1zlyCSnXydHuS9TU6HH+5AH78uNTVbl6j773
	5Uiy/CY/RAw0C72o8avLuv4GgFptsF+DK863+7Io4Yo/fPXnwi4anlUfTd5bGSixLCM+0iF068J
	4Su6AIK5FepPnM0vlbqD3SHcssVH2PSxX/EIkWSBUY2BA0jVAZnx2tG3bTSP4M+Iy7JOuHTHP2f
	CIU9kg0rdGI1+LBAyTt314vKnF7wFv07vjp5jsDzh12iARdBpahJaKCRx0afCdsyUW9N6dEwEd3
	kKo9qd35Z6Brm0r7s2dxb2+lzuuYkg==
X-Received: by 2002:a05:6a20:8411:b0:1e7:6f82:3217 with SMTP id adf61e73a8af0-1eb21465271mr27970404637.3.1737450185283;
        Tue, 21 Jan 2025 01:03:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5nSAM5QzodXybMi2iaVHKZxs+l70Dc/9p0XVegeXDrRJqIZpS5gvWGKnoipjrpUg4LEYJyw==
X-Received: by 2002:a05:6a20:8411:b0:1e7:6f82:3217 with SMTP id adf61e73a8af0-1eb21465271mr27970361637.3.1737450184797;
        Tue, 21 Jan 2025 01:03:04 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabaa6407sm8528378b3a.163.2025.01.21.01.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 01:03:04 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 21 Jan 2025 14:32:22 +0530
Subject: [PATCH v3 4/4] PCI: qcom: Enable ECAM feature
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-enable_ecam-v3-4-cd84d3b2a7ba@oss.qualcomm.com>
References: <20250121-enable_ecam-v3-0-cd84d3b2a7ba@oss.qualcomm.com>
In-Reply-To: <20250121-enable_ecam-v3-0-cd84d3b2a7ba@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, mmareddy@quicinc.com,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737450158; l=6085;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=SYsZuISEFecO0dItPGcTh+FGUKWuxe8fmZZ5miNptNM=;
 b=p9XGrDGYA4obTxWFaM73hglJIADgYJyxj/Nbw8xvcyDFQ+Hx+KvqJiKtK1EaTov8mEMduaNQQ
 WqIMKO9lEopDP05rP5U++OYA5rbS8Dnt1mteEhUq/+wrFV7/S9BfY0S
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: be2Cg9ueI0zXDX22-ZeqxCS-gntV8w-X
X-Proofpoint-ORIG-GUID: be2Cg9ueI0zXDX22-ZeqxCS-gntV8w-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 phishscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210074

The ELBI registers falls after the DBI space, PARF_SLV_DBI_ELBI register
gives us the offset from which ELBI starts. so use this offset and cfg
win to map these regions instead of doing the ioremap again.

On root bus, we have only the root port. Any access other than that
should not go out of the link and should return all F's. Since the iATU
is configured for the buses which starts after root bus, block the
transactions starting from function 1 of the root bus to the end of
the root bus (i.e from dbi_base + 4kb to dbi_base + 1MB) from going
outside the link through ECAM blocker through PARF registers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 81 ++++++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index dc102d8bd58c..cf94718d3059 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -52,6 +52,7 @@
 #define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
 #define PARF_Q2A_FLUSH				0x1ac
 #define PARF_LTSSM				0x1b0
+#define PARF_SLV_DBI_ELBI			0x1b4
 #define PARF_INT_ALL_STATUS			0x224
 #define PARF_INT_ALL_CLEAR			0x228
 #define PARF_INT_ALL_MASK			0x22c
@@ -61,6 +62,17 @@
 #define PARF_DBI_BASE_ADDR_V2_HI		0x354
 #define PARF_SLV_ADDR_SPACE_SIZE_V2		0x358
 #define PARF_SLV_ADDR_SPACE_SIZE_V2_HI		0x35c
+#define PARF_BLOCK_SLV_AXI_WR_BASE		0x360
+#define PARF_BLOCK_SLV_AXI_WR_BASE_HI		0x364
+#define PARF_BLOCK_SLV_AXI_WR_LIMIT		0x368
+#define PARF_BLOCK_SLV_AXI_WR_LIMIT_HI		0x36c
+#define PARF_BLOCK_SLV_AXI_RD_BASE		0x370
+#define PARF_BLOCK_SLV_AXI_RD_BASE_HI		0x374
+#define PARF_BLOCK_SLV_AXI_RD_LIMIT		0x378
+#define PARF_BLOCK_SLV_AXI_RD_LIMIT_HI		0x37c
+#define PARF_ECAM_BASE				0x380
+#define PARF_ECAM_BASE_HI			0x384
+
 #define PARF_NO_SNOOP_OVERIDE			0x3d4
 #define PARF_ATU_BASE_ADDR			0x634
 #define PARF_ATU_BASE_ADDR_HI			0x638
@@ -84,6 +96,7 @@
 
 /* PARF_SYS_CTRL register fields */
 #define MAC_PHY_POWERDOWN_IN_P2_D_MUX_EN	BIT(29)
+#define PCIE_ECAM_BLOCKER_EN			BIT(26)
 #define MST_WAKEUP_EN				BIT(13)
 #define SLV_WAKEUP_EN				BIT(12)
 #define MSTR_ACLK_CGC_DIS			BIT(10)
@@ -294,15 +307,60 @@ static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
 	usleep_range(PERST_DELAY_US, PERST_DELAY_US + 500);
 }
 
+static int qcom_pci_config_ecam(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u64 addr, addr_end;
+	u32 val;
+
+	/* Set the ECAM base */
+	writel(lower_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE);
+	writel(upper_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE_HI);
+
+	/*
+	 * The only device on root bus is the Root Port. Any access other than that
+	 * should not go out of the link and should return all F's. Since the iATU
+	 * is configured for the buses which starts after root bus, block the transactions
+	 * starting from function 1 of the root bus to the end of the root bus (i.e from
+	 * dbi_base + 4kb to dbi_base + 1MB) from going outside the link.
+	 */
+	addr = pci->dbi_phys_addr + SZ_4K;
+	writel(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE);
+	writel(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE_HI);
+
+	writel(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE);
+	writel(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE_HI);
+
+	addr_end = pci->dbi_phys_addr + SZ_1M - 1;
+
+	writel(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT);
+	writel(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT_HI);
+
+	writel(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT);
+	writel(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT_HI);
+
+	val = readl(pcie->parf + PARF_SYS_CTRL);
+	val |= PCIE_ECAM_BLOCKER_EN;
+	writel(val, pcie->parf + PARF_SYS_CTRL);
+	return 0;
+}
+
 static int qcom_pcie_start_link(struct dw_pcie *pci)
 {
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	int ret;
 
 	if (pcie_link_speed[pci->max_link_speed] == PCIE_SPEED_16_0GT) {
 		qcom_pcie_common_set_16gt_equalization(pci);
 		qcom_pcie_common_set_16gt_lane_margining(pci);
 	}
 
+	if (pci->pp.ecam_mode) {
+		ret = qcom_pci_config_ecam(&pci->pp);
+		if (ret)
+			return ret;
+	}
 	/* Enable Link Training state machine */
 	if (pcie->cfg->ops->ltssm_enable)
 		pcie->cfg->ops->ltssm_enable(pcie);
@@ -1233,6 +1291,7 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u16 offset;
 	int ret;
 
 	qcom_ep_reset_assert(pcie);
@@ -1241,6 +1300,11 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	if (pp->ecam_mode) {
+		offset = readl(pcie->parf + PARF_SLV_DBI_ELBI);
+		pcie->elbi = pci->dbi_base + offset;
+	}
+
 	ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
 	if (ret)
 		goto err_deinit;
@@ -1613,6 +1677,13 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	pci->ops = &dw_pcie_ops;
 	pp = &pci->pp;
 
+	pp->bridge = devm_pci_alloc_host_bridge(dev, 0);
+	if (!pp->bridge) {
+		ret = -ENOMEM;
+		goto err_pm_runtime_put;
+	}
+
+	pci->pp.ecam_mode = dw_pcie_ecam_supported(pp);
 	pcie->pci = pci;
 
 	pcie->cfg = pcie_cfg;
@@ -1629,10 +1700,12 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		goto err_pm_runtime_put;
 	}
 
-	pcie->elbi = devm_platform_ioremap_resource_byname(pdev, "elbi");
-	if (IS_ERR(pcie->elbi)) {
-		ret = PTR_ERR(pcie->elbi);
-		goto err_pm_runtime_put;
+	if (!pp->ecam_mode) {
+		pcie->elbi = devm_platform_ioremap_resource_byname(pdev, "elbi");
+		if (IS_ERR(pcie->elbi)) {
+			ret = PTR_ERR(pcie->elbi);
+			goto err_pm_runtime_put;
+		}
 	}
 
 	/* MHI region is optional */

-- 
2.34.1


