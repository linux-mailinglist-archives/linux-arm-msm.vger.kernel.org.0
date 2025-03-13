Return-Path: <linux-arm-msm+bounces-51279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB615A5F2B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 12:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6E667A84BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 11:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1598A267B1F;
	Thu, 13 Mar 2025 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFCPNfx3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68574267B1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866073; cv=none; b=l2NwWc9N9d19tKp9fAz1c3VYVpjS6XNaTqdvb5V+5dmlExcmAtnqoWgCdAgqB1LcjDQlEZ+A26keujfyD4CJ4T2gcDpKvUpBt1egSyd9PH7VNhfyX7fkLyyvZljPQTaiMC4hW+2vIAK9y/EXIWqvWKJ9QZaj/yzVVAe+YKAQ2HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866073; c=relaxed/simple;
	bh=OgsUrN9q3q+inPJyVIdWwjHz4E1SChNjRFIZ0QnU4Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qa+n9aTdM6nOFASruR0oUezlImJe3qIkMUcc4uDv9zpVktO5J0wOydfgXgPJGLMq0VJxfbfclQcQfY/LYunMCbcZMYtlMKuMc8UA7A+AYIDnR/G+kZqqeN3Ueuc1P5cb5gMLDiSMTUl0slEPKVlVMLPvEZIvpEPpq8z7m3ip/Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFCPNfx3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D2KLJK007315
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Inz7l/vu9v73fPSt9ovFbJUFU8bzhwtdsdKcnEdBMh0=; b=dFCPNfx3k971WYCS
	A+XQv//5LqX72EqMMNugFH/z0NBMaTLcHALb2sJLqjqP6qEBY85EnRKkEdR8rQxy
	YC5BEoRRyuuzSXBnzVBgYvj2hiW5N7GbvXOQ24gnI6V5jhiB2elcuLKTsWMngPv3
	NjVT7pgL7sUubGXGnfUsECtXQQOiS0MnCefA60XYky63Ws6aG9PGTBjhkne00Bu2
	zHY1WDlSLhtBuuNWWqDp13OpWF/BEQaLvQETfmDD9mUCTGEaITc/0704DlN2n0ef
	KfsAH5XsuM/z2yFn0h6Uej1gtzD2kmnbOx8LA1qdbqiY3dpr7WGy2u3zT6uBeJUD
	fq1VNg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg89dqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:41:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso2481296a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 04:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866068; x=1742470868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Inz7l/vu9v73fPSt9ovFbJUFU8bzhwtdsdKcnEdBMh0=;
        b=D2Fz04JCJwSNqXjRlq2Xg9IBqPY3b991nagr4MKWqiJbIyOPTW97rc3K6y55DGO2cH
         nomzVzfMIOiF6QngOv3O/ronsklutYPxZiDgrz2vui9ZTEkmkSi4ij6piBAOXZVPDlRn
         X/r0hM29+/ojI6/rhp8NREj6PoGVENDJrq+5poqH7dNdYzmqxGfD69e1cdzSZiDMrSP7
         ijn8TdNH6iLxqy5oScv4fGQOBdAmVy7/BUc/I8lLO4qi7I4cxqV4D68bHs7intNIBMH8
         3YcUkX2OpcCQXb5wUuaBoOi/pKFu+35pjF9r61Af3RIemz3YhL4TXtv8V1v8hq27zYXl
         LiQg==
X-Forwarded-Encrypted: i=1; AJvYcCXv0AAlCzv4EcBFvyTt+BBsT/ewnejpA1teYTjLFFWJcOCx7Rt+2B3PeRaXlBbabsTmBdEs0u65m52kcmem@vger.kernel.org
X-Gm-Message-State: AOJu0YxaEhNLpG5TMemAEeK614N5LwPiCBTkrOjefcFK5i9/XU3vBz0T
	iUSXrRFRBy8SVzrKu9eYOYm5rlyBtPkJKY/0thhABDH5EqzMIq0kvsjBUlVAB2LQcHf8+XTdQ5w
	ZKfhje9UNZV+0mzVA/LHcPcnxJY0v2pjpdJw3lXYVN04tr+GkTibtUUEKx4RFxru9
X-Gm-Gg: ASbGncta82TmLteoYoYuNvwZbwJRngj161sUqJPiNr+BvCpCkEEvxIQM1fSVMHebIH5
	prQfdarrIm7qSBRMGrI62fhsvJcMbRrULY9EqXJGZG899fAfHmW93BXHf2le5EQy7OZkBeh4LgH
	r1He6jIcAN2TJKs0Ky6Ag3wX79Uo/teqgp0NW42khKDiNHhnuwIPRCgvtAJIMMDvWrOR20qO8iO
	f6lpawYOs3YigDpMhPP/1D8XjqqVenbtHY47OymJdSYq+w7TcmT86YWNrP0Fj7LgnrNrIlKDURW
	/DgYKPAsmW6LDzOI2kZOcJulN0qnh5tpFPfsMfvH22pnixzyPq4=
X-Received: by 2002:a05:6a20:244f:b0:1f3:486c:8509 with SMTP id adf61e73a8af0-1f544b1864dmr37037087637.25.1741866068020;
        Thu, 13 Mar 2025 04:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYMSraKTahqSusHZQjg0Nxxu2lq1B8e00PC9WyPgDLU3mKpXvp/IOMCPvRJSDANheLJbPDkA==
X-Received: by 2002:a05:6a20:244f:b0:1f3:486c:8509 with SMTP id adf61e73a8af0-1f544b1864dmr37037047637.25.1741866067656;
        Thu, 13 Mar 2025 04:41:07 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:41:07 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:11 +0530
Subject: [PATCH v2 04/10] PCI: qcom: Extract core logic from
 qcom_pcie_icc_opp_update()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-4-869ca32170bf@oss.qualcomm.com>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
In-Reply-To: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=3187;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=OgsUrN9q3q+inPJyVIdWwjHz4E1SChNjRFIZ0QnU4Yw=;
 b=3HhOo9gMyOoRqSlN5KPpWGl2RGQzhP2VzW9Q+Y6coOM0y6QJgcxYZUSMSGKiD5fh7+bDTJjSI
 yW6u4HCY2AICcDFCzZ/byJDMF/LJ4Sea74xLy6suNHgVkhk0/OFQgKV
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d2c454 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9 a=QEXdDO2ut3YA:10
 a=h065WJ_eg54NNNGU8Mde:22 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ZD73yvW11mKlgr1MOmvorLiyNUhkmj3A
X-Proofpoint-ORIG-GUID: ZD73yvW11mKlgr1MOmvorLiyNUhkmj3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092

Extract core logic from qcom_pcie_icc_opp_update() into
qcom_pcie_set_icc_opp() to use in other parts of the code to avoid
duplications.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 61 +++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index e4d3366ead1f..b66c413f1e2b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1294,6 +1294,40 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
 		pcie->cfg->ops->host_post_init(pcie);
 }
 
+static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
+{
+	struct dw_pcie *pci = pcie->pci;
+	unsigned long freq_kbps;
+	struct dev_pm_opp *opp;
+	int ret = 0, freq_mbps;
+
+	if (pcie->icc_mem) {
+		ret = icc_set_bw(pcie->icc_mem, 0,
+				 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
+		if (ret) {
+			dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
+				ret);
+		}
+	} else if (pcie->use_pm_opp) {
+		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
+		if (freq_mbps < 0)
+			return -EINVAL;
+
+		freq_kbps = freq_mbps * KILO;
+		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
+						 true);
+		if (!IS_ERR(opp)) {
+			ret = dev_pm_opp_set_opp(pci->dev, opp);
+			if (ret)
+				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
+					freq_kbps * width, ret);
+			dev_pm_opp_put(opp);
+		}
+	}
+
+	return ret;
+}
+
 static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.init		= qcom_pcie_host_init,
 	.deinit		= qcom_pcie_host_deinit,
@@ -1478,9 +1512,6 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 {
 	u32 offset, status, width, speed;
 	struct dw_pcie *pci = pcie->pci;
-	unsigned long freq_kbps;
-	struct dev_pm_opp *opp;
-	int ret, freq_mbps;
 
 	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
@@ -1492,29 +1523,7 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, status);
 	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, status);
 
-	if (pcie->icc_mem) {
-		ret = icc_set_bw(pcie->icc_mem, 0,
-				 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
-		if (ret) {
-			dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
-				ret);
-		}
-	} else if (pcie->use_pm_opp) {
-		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
-		if (freq_mbps < 0)
-			return;
-
-		freq_kbps = freq_mbps * KILO;
-		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
-						 true);
-		if (!IS_ERR(opp)) {
-			ret = dev_pm_opp_set_opp(pci->dev, opp);
-			if (ret)
-				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
-					freq_kbps * width, ret);
-			dev_pm_opp_put(opp);
-		}
-	}
+	qcom_pcie_set_icc_opp(pcie, speed, width);
 }
 
 static int qcom_pcie_link_transition_count(struct seq_file *s, void *data)

-- 
2.34.1


