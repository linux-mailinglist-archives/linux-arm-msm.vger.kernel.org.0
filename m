Return-Path: <linux-arm-msm+bounces-71966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BB1B43257
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2BFF7C5455
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 06:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEF4274FDE;
	Thu,  4 Sep 2025 06:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvCwlHKr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02695264A92
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 06:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756967005; cv=none; b=nyGjI7xpnsehSfn8ST/22kpiyX2eqNL9RabTp1okIjiI+HpQ7WZLhEKD4Szo+PW12zUNeo/R9Rv4IM/uP96xSI1zMkwl/D9K4s5SECh4+kSZ+fPuacXJ1m2SHD3i6L5yOXYdv+tQLP5cWLBFaLqDzoO0tQc2mp92YdtmCelP1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756967005; c=relaxed/simple;
	bh=gf0nDTfu/A6wTAQjMH+keGPa2RXck8NCBn62CulO27A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=li23BhJFO8LTmVCVVJxUNKuN6p8pjWeP6zM5a+7Q6y9VU9aXEwX7G3YHLWyAfuqTA8NKuSdBypaSv/ouaj+WXHj3Dd42bZEkot1sJUXaTsUOQ+N17uNKln9xm7ErOB8F984dmuhUakgzOhJeuW5rdT5diMhCUBjO9EecbmcCATk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvCwlHKr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5841ONxS029551
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 06:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FH2W+hNthlwsjcU6LhQutSm9G0ruDj/xBkaCmXCbKhQ=; b=UvCwlHKrrv74UuvK
	sc7yG6NP9KiKG4SjoeMT+PPHbKwK0bs7K8T/gyogI1836D12a40VHNkNJl/yOK9o
	MMUUVlyvfmvgET0J5FLPc9nHOhrvjYPPy/UeKHgcdpjPgzRmQwqCulW5Di+Isf4H
	GTXgUWgwGLrIxAMgoniYxUoxijVhK2w5xo1+bhvZamlYO90EXA1vRRY+rx7f60qG
	XjF1qHxFsBiOvGiBPwSnQ4EzuIt4ffniyo5UhReJcTClwbhpf/GaK1DwHdomobOo
	2KBFpZCp/We9ktiw6ASZFhzagSRyLX8BzpZaxio04JxH0XGoB/ModrenhA0JRO2J
	CwE8Rw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpejs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 06:23:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24ae30bd2d0so7725825ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 23:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756967001; x=1757571801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH2W+hNthlwsjcU6LhQutSm9G0ruDj/xBkaCmXCbKhQ=;
        b=SjBUGeUK0w5nIlhm2fAZiEU6o3J3+JX7nS4ZN3tIM2oORKyNXaoozO44y+ywcLhJsg
         URTW7/GbcJ2NI9q3ZznompWfY/dGY83B9HWyS4oJHW0O1fJs2FfIVRn5OcvHplgkQhoQ
         Q96bieLGTiLHStSLs4r34OFKbN4Ebhaua9ZasOarroJJ74WjSXXxn+cemQhW/XPe10oA
         B6inQGaMjMnvvacrxb7vdZNiUdyTuu/W8KFl5vYDa63TXxcs+vygmS67qDef9Q986ye9
         9OCH8fAzvIHo19t/aivH786N2p28tws8AO8p5wXec+b3wVEsFNnEz7xX22U8+8eJTVO7
         QL4w==
X-Gm-Message-State: AOJu0YzBzFWNIeKcjltJdKQeCFdeps2KZq3YrEjtMNYP1tbcpZ9qhf1i
	XCsVNUltkUD1DcxASYEgUcC0bdA8dvtzX/kAx1/IxHGaw7t8iDGivWkKYe6L2viQSRy19zRJUpU
	ItZyz9qZUYozno+AnFrQeA/Li8eXmnjRTQgf5etJdu2bICR8ZrY/tWGfY0s5wQjj2WlTqjBEKR/
	WQxV9Qpw==
X-Gm-Gg: ASbGncvzyU5G6vkf+Vul1GxTuVwNIEj21zsU6/LQXU9tL1+FEPwEENDHx6SH7oEAj3j
	dsJWCFqM9r0c0CPSkyZN86qyCAiv8jCjzEwotwVeuIRZcUvbKewK507ZZsM8BbMv6/I3ge1s7o9
	/43S+5/u7d1SxcrT9+stF5+d6FulQFdOAxaRvLwoCGn6IQsgtJY+zaKmnx/nNuQFVF5U/PAcEz5
	E6u6zG5lJawsUaD4jcjhIgeqrXcQcHZs8uYew0z4V6vjnc0m1m9Ic+G0iOjQdlQMbhVK3Pl85MD
	iEvLu1ySSNH4wLU0Z/Do91zSzHOSujprZ7rdB2/ApfmCNF7G2qwAuEaexhV/x9xGsTQcQXM6xrT
	KOi3joPG8vvly7nw=
X-Received: by 2002:a17:90b:5190:b0:31e:d4e3:4002 with SMTP id 98e67ed59e1d1-32815411d3emr21146323a91.2.1756967001303;
        Wed, 03 Sep 2025 23:23:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwUeM+ClagutolDofBUjVohRmTJoK3OIjZuYPW7td4JSGTMamC9aTtqyQQ14+pL8kEkZeDvg==
X-Received: by 2002:a17:90b:5190:b0:31e:d4e3:4002 with SMTP id 98e67ed59e1d1-32815411d3emr21146296a91.2.1756967000826;
        Wed, 03 Sep 2025 23:23:20 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723427c127sm17120911b3a.62.2025.09.03.23.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 23:23:20 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 23:22:05 -0700
Subject: [PATCH v4 4/4] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen5x4 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-glymur_pcie5-v4-4-c187c2d9d3bd@oss.qualcomm.com>
References: <20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com>
In-Reply-To: <20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756966993; l=2876;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=Ruwm7lGDShLRO8c1+C0WfHCrP5dAWvWnDGg5quqL960=;
 b=2lXngGqEWRqYeQyiji0BInBdRc6hNVgLNCDjYXB1c6Be4DQSZfE/62DPSDg+OUwWE15axu8Ac
 p5ibZeXiY5ZBhJz4vFvXf8AymX4ADH/zZZ2wdDz3AJKl9bPmMenfHF+
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-GUID: 64SP46IRQ34W5DfXU--saYRQqTTExz-R
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b9305a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=KvwrgBbZ-pJFRlqJlL4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 64SP46IRQ34W5DfXU--saYRQqTTExz-R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX4/wgyKrBC0J+
 ZRlF5jTbTX1xrsQ/1Gfg4LswBzBqJSWNynhIiUcIRDAi3BnodRFpiO4BUER+W4eIvBRz3QzOgv1
 fvbX9KLpvOT9Qo1fhB8zn6RNkneRk5gska1F19z6i3uGLRzX6oVpi1hSNxuYtMQ0CJibkhTXYOF
 m4zpI/lwwf9ZKR9LQLdNdjVJzDQy0MD2lKt6sRr45xvZ53Q+ksX6naca2LShMoOmXVYKNEPypwq
 Fj083OYppgCTWYVma/oYm1i4uuM3bXKlu9+V2ndwMZHzwKoMdyTGoV8EnL5twC4s6Q4dFBlpXU2
 zmRveqXhUG8kgl8JR56CR/0JgREqizpUl8vPuuv8uFqCQaAghAkOSf0oXIj2hGNnI51BWP7dlJQ
 eNhB6a3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

Add support for Gen5 x4 PCIe QMP PHY found on Glymur platform.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 8fdc146ef73221392371c00afb21d673dbf46d49..dc741fa8900a3a89c88fa51aea13fb912347915b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -100,6 +100,12 @@ static const unsigned int pciephy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V7_PCS_POWER_DOWN_CONTROL,
 };
 
+static const unsigned int pciephy_v8_50_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= QPHY_V8_50_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V8_50_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V8_50_PCS_POWER_DOWN_CONTROL,
+};
+
 static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -3072,6 +3078,7 @@ struct qmp_pcie_offsets {
 	u16 rx2;
 	u16 txz;
 	u16 rxz;
+	u16 txrxz;
 	u16 ln_shrd;
 };
 
@@ -3348,6 +3355,12 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
 	.ln_shrd	= 0x8000,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
+	.serdes     = 0x8000,
+	.pcs        = 0x9000,
+	.txrxz      = 0xd000,
+};
+
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -4404,6 +4417,22 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
 	.phy_status             = PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
+	.lanes = 4,
+
+	.offsets		= &qmp_pcie_offsets_v8_50,
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+
+	.regs			= pciephy_v8_50_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5150,6 +5179,9 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 
 static const struct of_device_id qmp_pcie_of_match_table[] = {
 	{
+		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
+		.data = &glymur_qmp_gen5x4_pciephy_cfg,
+	}, {
 		.compatible = "qcom,ipq6018-qmp-pcie-phy",
 		.data = &ipq6018_pciephy_cfg,
 	}, {

-- 
2.34.1


