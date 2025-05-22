Return-Path: <linux-arm-msm+bounces-58971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DEBAC013E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 02:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A50DD9E5E47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 00:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FEB80B;
	Thu, 22 May 2025 00:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cFB74GEl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F7A6FBF
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747872880; cv=none; b=axL/5JjFUiTQ2i6c4Tg4YAoQv2wJaD9ZZ7WNa6t5Zx+vxDu9sulvc9akCQvc/aLNSpdR0a8hswIGtD218i258JNgzzrKcCG6RgLwUxtDn9YKvNmV5+VHlXZAsE/s7O5Vmu2P3RJGmzaVatPjrk3fa8JI1m968zVNTHoR21fQgHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747872880; c=relaxed/simple;
	bh=AwKBiH744W+QtnGUmYA0C3Iqf3yFBoIsPDaXBxrdc9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FjtTxlqzc1WZ7/S/Awx7MUCKhdfRgEwU1DuBmh/+57VBGsvqxDXGMEg/5bIRrrLlrJvMINLDyCPwZ6dnCEiN5txBRnANXNxkiYyKzU5EG5mtlGHT8wbxcFURvJjB2ToHmga7PPLPoMaz3VU5lgpnh4x+rRsJQBBsPJt0CVR5vRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cFB74GEl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIeqhf000873
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zgnNDqAmNdM
	2du0hkM8q7KP2HJfKArDOfm5O1ddynI4=; b=cFB74GEllIuLKhGQL87NcKSLyn9
	xgC6YtfFvOossv2u1wYI0x+SqkGwh1xkOgHBeE/NrNvkKmQtpYvbYnuPMTJgkMLQ
	6j+iWO1bt7FXWOK2rstub/sassrw7ZbgxQxeI9f7qs0kGDtVAZ7QOI3wXQDixlgY
	UcA9Pz6NuhaYgDDUlzXaeh9gy936Zwt1FDnW8urJ2iCsZiZF+j/XJzOIlr7zvtMG
	zGahqeC6RrtlvO62TXFoi5iOB8PmtXToc0aKItcq+v0s+ku8pv/qc1pRunEDnty7
	AZDsJssDGbQbUn4AjRHZLncVu8PGeAqcMhDz+w0EusLRDOtOs+vqbXEfgjw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6vg96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:14:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30ebfc28a1eso6388877a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 17:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747872876; x=1748477676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgnNDqAmNdM2du0hkM8q7KP2HJfKArDOfm5O1ddynI4=;
        b=f3aLrzBfijJDYO/vy8yKDwjJFcbd86bDDztL34+CCaUZ2RK0R8g7DRp2Iv7Zx61Ix5
         ewa9Ut7BlSE+85wOS5yNOj5D8qZSJXmoGULc4UQ6pXnJbUPy+5NiqYPhY41wWLy8Nqrj
         LKH3rriA3i1HaeoSn10gLKzCbFqFeHxeH0+3ygBu5Ahtj6DRFJnWdrHgWVzlWe9tcel0
         gfTOkPYvSdwQ8p8EpFjeE9ZIP9LpNgQ5imbjMd9+0BshgwCkJJ2awXFpktWcpbi08HEH
         pfRMNEjdOdZR1NYtCecptHoL8qtmYIl7WFhYbYUioIwPzPcjtvFAqQ6rE9GhwtBlpxgk
         APIQ==
X-Gm-Message-State: AOJu0YzG23uRPOhUD+k+NOebcgPkpbpmm8zBF190qm+XUP1m9abdzfd8
	+yZth6b5fnMzkEWlYUnIUocXdbWKW+D6MngMRSJGYJ5fE/PdK93nXgI1hUjG2u0MEuFH3hs+Q/F
	smFIHnQDyhpRA9cZQMzzCkCpv3ZMxV/kiwcglxi767eAdZVc91mFWj1T1Q/IG2kn0GWsH
X-Gm-Gg: ASbGncu+NemiQilRuTCnidmPfhKszzYDmr1rKiIH5V13uRgI1yXWVYY7Vnkut+t0zTN
	DqjALxcdYcK//tQLYxge4rBQCGASh59xIg9+CWy9qLAUsNNv/hmDVE3An6VXtOoNs5a4CJFlRwq
	viVOeNnn5T+U2wFoM1Z5OvcLB5Z/W29s23pfn/p0vAtnVGIdDxGzTDRwwgGDVPukZOGboEiSMmx
	X939J6lDfrA4Lcjd8gx+xVMWCBs8r5tAQldQialG/b3YepjPY2S3Z90e/CExiY1kSU3Sk+N97tw
	8n2ylvgNSzCr0bFjFnvcl7gK1Z0gZRu5om5dm4D3OKbDvndS+PSEqkHiwAQjqA==
X-Received: by 2002:a17:90a:e70f:b0:30c:5604:f646 with SMTP id 98e67ed59e1d1-30e8322584amr36564150a91.25.1747872876231;
        Wed, 21 May 2025 17:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1YOcbB1Sw97LM5mCNQJ8Q/nDTdCWVA4q929RHWlhvcSus0eGRa291wLIDl0eNmFKj+dcRow==
X-Received: by 2002:a17:90a:e70f:b0:30c:5604:f646 with SMTP id 98e67ed59e1d1-30e8322584amr36564108a91.25.1747872875803;
        Wed, 21 May 2025 17:14:35 -0700 (PDT)
Received: from hu-mrana-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f3651611bsm4617101a91.49.2025.05.21.17.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 17:14:35 -0700 (PDT)
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
To: linux-pci@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
        robh@kernel.org, bhelgaas@google.com, andersson@kernel.org,
        manivannan.sadhasivam@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, quic_ramkri@quicinc.com,
        quic_nkela@quicinc.com, quic_shazhuss@quicinc.com,
        quic_msarkar@quicinc.com, quic_nitegupt@quicinc.com,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: [PATCH v4 1/4] PCI: dwc: Export dwc MSI controller related APIs
Date: Wed, 21 May 2025 17:14:22 -0700
Message-Id: <20250522001425.1506240-2-mayank.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250522001425.1506240-1-mayank.rana@oss.qualcomm.com>
References: <20250522001425.1506240-1-mayank.rana@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fOw1MOH8zz9tT50gXcnUAFFzfPQIC-lz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDI0MCBTYWx0ZWRfXxXdNF5w+SN6V
 FKSuY+qkKmrXxFgKATUVReAT71k+nyVVndWyXd2m6kihZuAhT+7h+Kyzs8Jta7io/IJ7+V9n1mC
 rw9NZLsvlLNyAC6a+SqfCLPJG+ei5rZHe1wzge052L5D9PB4TQ4d3tGg++jU8nxjoRx7+woSLMI
 LncPMNiMDytxx0pUpPQs8XKFaK2TcbhuI9ewxe5/etojirG6l1IndlKAYrhfU0nEs/eLE3RRWi1
 rNefWtqaI/13ehPI5E64BP8pjRMVvdY052eXnDoQCfRIZyI1roHyqydEHqkkn8SYGo1xug7epQ2
 H8nmHKStb7XWsdvElkBivifhzQQ0AuEm0LnZTQ7QMNtKwWMcXua5fvWsjV7/mfczxVijXLrJcWJ
 8kx1V5plSt6N2LXNNVEHexTfStgSXtmpL9HAsKiHK3wZH2aXQUc7YvpCt5nAwo9351JyRR8N
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682e6c6d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=2oFYxEjC1fcXuHwUiPIA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: fOw1MOH8zz9tT50gXcnUAFFzfPQIC-lz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210240

Export dw_pcie_msi_host_init(), dw_pcie_msi_init(), and dw_pcie_free_msi()
APIs to allow dwc PCIe controller based MSI functionality from ECAM pcie
driver. Move MSI IRQ related initialization code into dw_pcie_msi_init()
as this code must be executed before dw_pcie_msi_init() API can be used
with ECAM driver.

Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
---
 .../pci/controller/dwc/pcie-designware-host.c | 38 ++++++++++---------
 drivers/pci/controller/dwc/pcie-designware.h  | 14 +++++++
 2 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index d2291c3ceb8b..4e382cfc7c80 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -250,7 +250,7 @@ int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 	return 0;
 }
 
-static void dw_pcie_free_msi(struct dw_pcie_rp *pp)
+void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 {
 	u32 ctrl;
 
@@ -263,19 +263,34 @@ static void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 	irq_domain_remove(pp->msi_domain);
 	irq_domain_remove(pp->irq_domain);
 }
+EXPORT_SYMBOL_GPL(dw_pcie_free_msi);
 
-static void dw_pcie_msi_init(struct dw_pcie_rp *pp)
+void dw_pcie_msi_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	u64 msi_target = (u64)pp->msi_data;
+	u32 ctrl, num_ctrls;
 
 	if (!pci_msi_enabled() || !pp->has_msi_ctrl)
 		return;
 
+	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
+
+	/* Initialize IRQ Status array */
+	for (ctrl = 0; ctrl < num_ctrls; ctrl++) {
+		dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MASK +
+				    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
+				    pp->irq_mask[ctrl]);
+		dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_ENABLE +
+				    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
+				    ~0);
+	}
+
 	/* Program the msi_data */
 	dw_pcie_writel_dbi(pci, PCIE_MSI_ADDR_LO, lower_32_bits(msi_target));
 	dw_pcie_writel_dbi(pci, PCIE_MSI_ADDR_HI, upper_32_bits(msi_target));
 }
+EXPORT_SYMBOL_GPL(dw_pcie_msi_init);
 
 static int dw_pcie_parse_split_msi_irq(struct dw_pcie_rp *pp)
 {
@@ -317,7 +332,7 @@ static int dw_pcie_parse_split_msi_irq(struct dw_pcie_rp *pp)
 	return 0;
 }
 
-static int dw_pcie_msi_host_init(struct dw_pcie_rp *pp)
+int dw_pcie_msi_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct device *dev = pci->dev;
@@ -391,6 +406,7 @@ static int dw_pcie_msi_host_init(struct dw_pcie_rp *pp)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dw_pcie_msi_host_init);
 
 static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
 {
@@ -802,7 +818,7 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
 int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	u32 val, ctrl, num_ctrls;
+	u32 val;
 	int ret;
 
 	/*
@@ -813,20 +829,6 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 
 	dw_pcie_setup(pci);
 
-	if (pp->has_msi_ctrl) {
-		num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
-
-		/* Initialize IRQ Status array */
-		for (ctrl = 0; ctrl < num_ctrls; ctrl++) {
-			dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MASK +
-					    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
-					    pp->irq_mask[ctrl]);
-			dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_ENABLE +
-					    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
-					    ~0);
-		}
-	}
-
 	dw_pcie_msi_init(pp);
 
 	/* Setup RC BARs */
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index fc0872711672..344258aa6b80 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -679,6 +679,9 @@ static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 
 #ifdef CONFIG_PCIE_DW_HOST
 irqreturn_t dw_handle_msi_irq(struct dw_pcie_rp *pp);
+void dw_pcie_msi_init(struct dw_pcie_rp *pp);
+int dw_pcie_msi_host_init(struct dw_pcie_rp *pp);
+void dw_pcie_free_msi(struct dw_pcie_rp *pp);
 int dw_pcie_setup_rc(struct dw_pcie_rp *pp);
 int dw_pcie_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_host_deinit(struct dw_pcie_rp *pp);
@@ -691,6 +694,17 @@ static inline irqreturn_t dw_handle_msi_irq(struct dw_pcie_rp *pp)
 	return IRQ_NONE;
 }
 
+static inline void dw_pcie_msi_init(struct dw_pcie_rp *pp)
+{ }
+
+static inline int dw_pcie_msi_host_init(struct dw_pcie_rp *pp)
+{
+	return -ENODEV;
+}
+
+static inline void dw_pcie_free_msi(struct dw_pcie_rp *pp)
+{ }
+
 static inline int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 {
 	return 0;
-- 
2.25.1


