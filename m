Return-Path: <linux-arm-msm+bounces-51280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B4A5F2B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 12:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D366A3AE319
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 11:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0FE267B90;
	Thu, 13 Mar 2025 11:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqNqALPE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD6F267B86
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866076; cv=none; b=Yrjg+oVod/f9jxuXEudWeo4ViEbz3qNZLDmI9G1DUY1bo02DTpVQNTRs0wrNHysKW0GFBsdVryOV65jV4LN2ehYu3KE/Ws11USZQOr3fW8q93CtW7BUwlYr5sO3hDDnAP+2PJDbe1egnZMqIa/ybFgycvcWWr8W2Qpjg5okW0y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866076; c=relaxed/simple;
	bh=lgnh2IagKe1mBKfHYr9hIoBnucVnZ4hYxrdTnG/zcSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4zf8rEkD8wSerUkv8HU2HoQxYTrdysfo9fEZVLb/zIC24c/RbfWiBafqOtJYLqTDv/VWY08l5DtV9/IqTIioY00cunxyJsnxiJA273QvDDsEpmC+anMw0cDT/PfInceRsbv/5tDjLvRICh5B+Aq/xieYZ8mr3CvyOQJqjc4cQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqNqALPE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D2KLer007291
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vPeHQU+y3gcdeGEi3VSw+1hZhizP3rJ+49onrRQHm7M=; b=jqNqALPE/yifI8uF
	7TCG/VA4Ivjnq7k0uFQQY5KiYZu6TWmfc0laRnAjEUYE7BMQHwRE2CUr4t0tCP2C
	OeeYi+foz6T1/X9xmLSwFgO6ZoCp1wE4k2SUBASh0BGolwrM9PoZzg645cZW0tQn
	531/m9fw71BqI5O+FRkV9T0BPwkId3QsOhHd2w2ZsVlSmbxio+daIBHMMmMJrUZc
	NtsanVcJQgWvO+FYL3iDF9wGjMUtAAWDyyhT4pvSo3CuJBp8qmm7i9V2RIhVv0fu
	pheIVJFa7IQa6htnw6PRZJfngWtsDAVnbsZ27TaTOqbupY9ZZM/uIuTv60LcKlSt
	JiwGQA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg89dr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 11:41:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3011c150130so1569519a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 04:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866074; x=1742470874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPeHQU+y3gcdeGEi3VSw+1hZhizP3rJ+49onrRQHm7M=;
        b=HJ8o8rVOSvt8gbKrRRqjNGxVTKRGNnwGGAO3mUeyXaUfMXRE+mlWAhzPfULJcAKLg5
         x7cISG7Qq8gufFmtWszph029evVCWyT5RaU5BWyNqJP55r2qU08zxMcGzMvcLhUuD+uJ
         JNRzMmzh470hMGBVA7Y2QyGrADr9Wsx0qm0psFuqlPJtidORmejHsyzfYq0jmYdx9cFb
         aNSEx0B48sorvsEgDZwjEAFsvu0P1+6onNJNrlb9Wb8v+/9k4cDAvZxb/3uTr9GgQMBp
         bmzi4S0YTVXBJeKAG0rOW5SmuSOPZrGYKMcHNBT3ouAyLht9f6en1Efk2nfMIyfBXp6o
         eOMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZoys5ZFjJnkfYu+6lKBO5z29QvEHbp3mkBYok9NkCnij39SuwjllwF6YSvbJbMcklrKDkBfGI9otYGd1n@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0nhucrCwfPTIJqNEHflwxIW/vCFqvWFwQEs+smdB367C6SdB
	eUBdRVgGEazPy/OSMwM18Iq+7ZTrWw+aYL8IUbK9SaJbSuMu1WKf6tbdh9oqwAyLCmOQgh4UJBn
	XPAnxajzbq4bvnVbDh8Y2U9ruNH7tXGpsZRgA2ON61g3Dblh0mczhnN1vCZ9DiBpg
X-Gm-Gg: ASbGncvrkT0iMwMbGcpUY1sdXPfqGw6hPWPQC2fUCVPno70JPGVDILS7RJCL0XxQ8zN
	eYsN4iTayJC8+4m9FIzT2yIbhzQ1vdCS9QDv3Qt8btsgTKa8aDHdwu3ok7i9lpMtN9fcw/fJhNz
	yS03GFqwZk0TKax3fsCSpQqJJYK6dc3pTUBOXDZEc5oFSfEL1+7NdYNi5zj1bJoaGYjq58WCSMT
	23ANZND2a1l8IN9jOuLGwTyWDm+e+zOZtueSue26MLga1Gwo50UfIICknQbU62rbCQ21hgVCFJS
	I1dT6t6sTzdzeTb6DOuYC6Atw9jiReCFmfHCkSZwj3mpgzAAFZg=
X-Received: by 2002:a05:6a21:2d08:b0:1f3:41d5:65f6 with SMTP id adf61e73a8af0-1f544c35f78mr46788550637.32.1741866073744;
        Thu, 13 Mar 2025 04:41:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR5pEWOAMrWLBgCGm+Y7Lh3lWzuvfVLeGeW96YfCH6EZ4bcTcGbK5BM/qWPoV32jTCmQphNw==
X-Received: by 2002:a05:6a21:2d08:b0:1f3:41d5:65f6 with SMTP id adf61e73a8af0-1f544c35f78mr46788511637.32.1741866073376;
        Thu, 13 Mar 2025 04:41:13 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm1063219a12.76.2025.03.13.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:41:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 17:10:12 +0530
Subject: [PATCH v2 05/10] PCI: qcom: Add support for PCIe bus bw scaling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mhi_bw_up-v2-5-869ca32170bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741866038; l=2585;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=lgnh2IagKe1mBKfHYr9hIoBnucVnZ4hYxrdTnG/zcSI=;
 b=DOpCvzJguNOxEnEcPj9bp2zqW7NE5+r9kIIrCmHya4hHTe+ncFBrhbxMhaKsjwDOd+qCnU8jD
 SuAA5bLA2c+BuOZzHb9HXIrgzQ3DMO5zTqGXl08FjFuwI+NCuRXooMw
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d2c45a cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: vAeKE-o3FdH1Ck6_L8HUc_-sxRcUL4F6
X-Proofpoint-ORIG-GUID: vAeKE-o3FdH1Ck6_L8HUc_-sxRcUL4F6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130092

QCOM PCIe controllers need to disable ASPM before initiating link
re-train. So as part of pre_bw_scale() disable ASPM and as part of
post_scale_bus_bw() enable ASPM back.

Update ICC & OPP votes based on the requested speed so that RPMh votes
get updated based on the speed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 49 ++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b66c413f1e2b..a68e62422ff7 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1328,10 +1328,59 @@ static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
 	return ret;
 }
 
+static int qcom_pcie_scale_bw(struct dw_pcie_rp *pp, int speed)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u32 offset, status, width;
+
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
+
+	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, status);
+
+	return qcom_pcie_set_icc_opp(pcie, speed, width);
+}
+
+static int qcom_pcie_enable_disable_aspm(struct pci_dev *pdev, void *userdata)
+{
+	bool *enable = userdata;
+
+	/*
+	 * QCOM controllers doesn't support link re-train with ASPM enabled.
+	 * Disable ASPM as part of pre_bus_bw() and enable them back as
+	 * part of post_bus_bw().
+	 */
+	if (*enable)
+		pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
+	else
+		pci_disable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
+
+	return 0;
+}
+
+static void qcom_pcie_host_post_scale_bus_bw(struct dw_pcie_rp *pp, int current_speed)
+{
+	bool enable = true;
+
+	pci_walk_bus(pp->bridge->bus, qcom_pcie_enable_disable_aspm, &enable);
+	qcom_pcie_scale_bw(pp, current_speed);
+}
+
+static int qcom_pcie_host_pre_scale_bus_bw(struct dw_pcie_rp *pp, int target_speed)
+{
+	bool enable = false;
+
+	pci_walk_bus(pp->bridge->bus, qcom_pcie_enable_disable_aspm, &enable);
+	return qcom_pcie_scale_bw(pp, target_speed);
+}
+
 static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.init		= qcom_pcie_host_init,
 	.deinit		= qcom_pcie_host_deinit,
 	.post_init	= qcom_pcie_host_post_init,
+	.pre_scale_bus_bw	= qcom_pcie_host_pre_scale_bus_bw,
+	.post_scale_bus_bw	= qcom_pcie_host_post_scale_bus_bw,
 };
 
 /* Qcom IP rev.: 2.1.0	Synopsys IP rev.: 4.01a */

-- 
2.34.1


