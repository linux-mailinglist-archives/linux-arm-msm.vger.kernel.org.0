Return-Path: <linux-arm-msm+bounces-64655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4510EB027D6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF33FA60422
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 23:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9FF231C9F;
	Fri, 11 Jul 2025 23:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsUsAa8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0EE22FE0A
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752277421; cv=none; b=DE9sN89MFS+sYRRWl9YsXP+yfm50ytcfulTwPNUGXvrO6A1bXF/eIx3yF8ro/f1kik2rjG6jQm50wt/3ZGc1+QI1OWQhPrqAvX+kkmo+rLSrCOOFWbSFaN/h+NzWiT5h3ig1vw+hNycUTJuebSSTBUj7tbYI6H939aayQKYFYIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752277421; c=relaxed/simple;
	bh=Nc/x8vsOay2uh/yxKTntc5DbFARCXd4RqT08XNDbCw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6w/X63/X7SupDSSeK3nxY5JsUIsZfBMn6IRZYatOvJip5GVsq3WlG/8lJGA6qQf2dmC1hQpPgKl5q/f2cdkuBg16WssQSBeNpb1fxapxUqQMhz1gtIorxQBjqlRdlZN6S29lkUNgdaLyDF5qvBeuo++xFhvp+er0yNtHcTaXFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsUsAa8U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BMomQg010642
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRm+Uxqi+CYbqSPZcotLjzI/Pg7VMnWrnkkwOHE45m8=; b=hsUsAa8U10a7nbns
	6jV5WzFoaAAYJq23Fpera/5stuIWWcTxFs9tEqbQd9c6F5iRNpZOsxG5DTDJXM2I
	DOcmLzGGep/fnw6XQLc8oESNmtmaxbLCxQY7jMjQXiklzSOdvAvkfSZwuk4cwtsM
	FFb1APgKb/GV/iCf13Lk6o+vJONR2f6L7oHicuoDf8kLHol5I9zlJ8H3X88dT8TI
	kvIqtz2Vim49hC9I1DB1K4g6TfgBM/ykqk1DbG1d58HpqNgiJOjf8TWQWQfeizc8
	UHImD3bChR7TwA6iswggU2M8pGcx8Z47ORps3LgwVIAq/aPdDfiHbgXX2V0quslv
	cK8CFA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1a2htdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:43:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7494999de28so3563583b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 16:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752277416; x=1752882216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRm+Uxqi+CYbqSPZcotLjzI/Pg7VMnWrnkkwOHE45m8=;
        b=XYR0tYYtr1OrbjkPD85tI8o0/SCBqzaiwM2xZz8l9lXANlp0Y+P9ocUeHmJYlvwfCk
         shygot+en55dF8rZEhWhkitFqB+K4jkn8rs6fiPsII8IaTHwVQ0sQkVGlJqHTKzAXXwc
         zGv7RlIImNGsikXyOG6OrXeaKfWuDy3KZafG11YpRWHZtNjOqSL2xZVshZIsGayz1H47
         hzdLeiCzhfCV8EJNjIj32rL/C9ryUPWu+1Lpvtg2RvI7Te706x7BCsylbgBbB84srkv0
         dy9JNKNnbs9cBerA+/cHc/poMqgCI94v2XKr9+Y5bl4jE/xkh7ommnDvAawcNbwa29LM
         hzkw==
X-Gm-Message-State: AOJu0YwkNoVkaRKo7shDwwgtGPjUdHluylDjAtFXmqb5sdjuVneISDmi
	R2YbeaBtldrdBN7Tuq4vHu0+4qal0xoQrR6vyNzYFPnd1Ye51uUvx21OXaIAy4ShMmj6dGzLCtO
	9/vno3t7O4e3T25aNndbHQUdLp2Tl6dJ9HaN5/rMAOu8p/KjqN7/z/p0NdJySyHU3QJog
X-Gm-Gg: ASbGncsG9VXjR+8GR/RWYlTRhkGx/+Tl6mvZzTE+MFZYLpl+Aah55yxLqvB9LkRoFIu
	e2MKTXWSizZS+cEhXccXtNo7XD3anQK7WlckSf0VJWAqKMBMBXCY9i/oGHL2MPcFly9FTjapXOl
	Iq6lEado1fSACC7NFLG2P82j3bGdURmk+7ZMFb0iceKWPA8Myp52w+5qaUri2Wjf3vKp1993G08
	fGehIhIyZGLkmLOmj6DQMzGGGNLtUkU1cFeIwsVy+BKoWPlgrPp4mVifvrGfcWOKtsMXH4NxqQG
	//nMjDH7eU1wMvqZNsQrzd/ioU95gvf2Q6YKb520K2Q33ez3HG5uGvmj7kKv9IeaC/hXP8knzy0
	=
X-Received: by 2002:a05:6a00:88e:b0:74e:ac5b:17ff with SMTP id d2e1a72fcca58-74ee2965a73mr6429520b3a.13.1752277416095;
        Fri, 11 Jul 2025 16:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmEDFKUBtEKeSFjG5lDLei7jG8s3XAnLHG17awVowNVlmWiom6TXvQ+gldb5oLwu87ZMZUwA==
X-Received: by 2002:a05:6a00:88e:b0:74e:ac5b:17ff with SMTP id d2e1a72fcca58-74ee2965a73mr6429487b3a.13.1752277415624;
        Fri, 11 Jul 2025 16:43:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1a851sm5869781b3a.82.2025.07.11.16.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 16:43:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 12 Jul 2025 05:12:41 +0530
Subject: [PATCH v6 5/5] PCI: qcom: Add support for ECAM feature
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250712-ecam_v4-v6-5-d820f912e354@qti.qualcomm.com>
References: <20250712-ecam_v4-v6-0-d820f912e354@qti.qualcomm.com>
In-Reply-To: <20250712-ecam_v4-v6-0-d820f912e354@qti.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752277383; l=5617;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Nc/x8vsOay2uh/yxKTntc5DbFARCXd4RqT08XNDbCw4=;
 b=3sa5IGCMxppssN1o5AgAYJYPozCyuk9JFxLNUi0h1IfBf/V9Pf4u//ZpQRDOjwEmiMjvWTBf8
 t3EJBknqbEUAU5ppVu19bJxRzD5EbIoyc/qUtR/vsyhljYTEVkMNaGz
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=MKJgmNZl c=1 sm=1 tr=0 ts=6871a1a9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=oQbQ34n3Jerzy_GFPTkA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDE4MCBTYWx0ZWRfXxV4q091ckOlW
 qOEqg+jeD+fJS337nS5CRSQg4aybOaN9bedHKUskjz140Eccs/nWQN3axrbAgIpTj/zAzRE+Thi
 lUaOTBG1293TZgD9JavAw/Y+8g2lsyxd90xxCWNYugoTHNwXkPWCyHE3LCFkpx/qPGdOyUHJj19
 hynbyim+wB/vYdaNeLavX67Dq1SV/G9VZGj4DVxIxGI+YlcpHKUJBxMfziIhjph2mURjZZ7VbXh
 fns82YiOyFNDfWCZ5YWOqTAvaaPxDHLzOm8EeqYNdVfyZv5Rvr65lYCEWeOBWVUVvGvJrEoCp8L
 wuzdQgojAx7E7+Og4lmPfjPEm/bBxpBUNO2TRRjEu59uxFaZGtuAQt0RzvGOokOXYaQlbCxsvpC
 okm75+/I73DV5VKElH7jf6CuFV/kwi/mEBmKz5WXlrpyAwUsswGpX+qRb/jfTXAO2m7Xg39M
X-Proofpoint-ORIG-GUID: 65Q8DHcGzC0vK5chwOGWweyyuwlZkGke
X-Proofpoint-GUID: 65Q8DHcGzC0vK5chwOGWweyyuwlZkGke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110180

The ELBI registers falls after the DBI space, PARF_SLV_DBI_ELBI register
gives us the offset from which ELBI starts. So override ELBI with the
offset from PARF_SLV_DBI_ELBI and cfg win to map these regions.

On root bus, we have only the root port. Any access other than that
should not go out of the link and should return all F's. Since the iATU
is configured for the buses which starts after root bus, block the
transactions starting from function 1 of the root bus to the end of
the root bus (i.e from dbi_base + 4kb to dbi_base + 1MB) from going
outside the link through ECAM blocker through PARF registers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 67 ++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 6acbf17caf90b0582b31bc4ee3a99601d078a45a..fb8cc2c788edf034a45ff718bf560747e48b5e00 100644
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
@@ -61,6 +62,16 @@
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
 #define PARF_NO_SNOOP_OVERRIDE			0x3d4
 #define PARF_ATU_BASE_ADDR			0x634
 #define PARF_ATU_BASE_ADDR_HI			0x638
@@ -84,6 +95,7 @@
 
 /* PARF_SYS_CTRL register fields */
 #define MAC_PHY_POWERDOWN_IN_P2_D_MUX_EN	BIT(29)
+#define PCIE_ECAM_BLOCKER_EN			BIT(26)
 #define MST_WAKEUP_EN				BIT(13)
 #define SLV_WAKEUP_EN				BIT(12)
 #define MSTR_ACLK_CGC_DIS			BIT(10)
@@ -293,6 +305,48 @@ static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
 	usleep_range(PERST_DELAY_US, PERST_DELAY_US + 500);
 }
 
+static void qcom_pci_config_ecam(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u64 addr, addr_end;
+	u32 val;
+
+	/* Set the ECAM base */
+	writel_relaxed(lower_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE);
+	writel_relaxed(upper_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE_HI);
+
+	/*
+	 * The only device on root bus is the Root Port. Any access to the PCIe
+	 * region will go outside the PCIe link. As part of enumeration the PCI
+	 * sw can try to read to vendor ID & device ID with different device
+	 * number and function number under root bus. As any access other than
+	 * root bus, device 0, function 0, should not go out of the link and
+	 * should return all F's. Since the iATU is configured for the buses
+	 * which starts after root bus, block the transactions starting from
+	 * function 1 of the root bus to the end of the root bus (i.e from
+	 * dbi_base + 4kb to dbi_base + 1MB) from going outside the link.
+	 */
+	addr = pci->dbi_phys_addr + SZ_4K;
+	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE);
+	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE_HI);
+
+	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE);
+	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE_HI);
+
+	addr_end = pci->dbi_phys_addr + SZ_1M - 1;
+
+	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT);
+	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT_HI);
+
+	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT);
+	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT_HI);
+
+	val = readl_relaxed(pcie->parf + PARF_SYS_CTRL);
+	val |= PCIE_ECAM_BLOCKER_EN;
+	writel_relaxed(val, pcie->parf + PARF_SYS_CTRL);
+}
+
 static int qcom_pcie_start_link(struct dw_pcie *pci)
 {
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
@@ -302,6 +356,9 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
 		qcom_pcie_common_set_16gt_lane_margining(pci);
 	}
 
+	if (pci->pp.ecam_mode)
+		qcom_pci_config_ecam(&pci->pp);
+
 	/* Enable Link Training state machine */
 	if (pcie->cfg->ops->ltssm_enable)
 		pcie->cfg->ops->ltssm_enable(pcie);
@@ -1237,6 +1294,7 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u16 offset;
 	int ret;
 
 	qcom_ep_reset_assert(pcie);
@@ -1245,6 +1303,15 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	if (pp->ecam_mode) {
+		/*
+		 * Override ELBI in ecam mode, as in ecam mode
+		 * ELBI moves along with the dbi config space.
+		 */
+		offset = readl(pcie->parf + PARF_SLV_DBI_ELBI);
+		pci->elbi_base = pci->dbi_base + offset;
+	}
+
 	ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
 	if (ret)
 		goto err_deinit;

-- 
2.34.1


