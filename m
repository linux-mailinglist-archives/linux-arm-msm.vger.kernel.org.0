Return-Path: <linux-arm-msm+bounces-50730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E456A580D1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 06:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04B631890712
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 05:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BD1157A67;
	Sun,  9 Mar 2025 05:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPEvttyp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AE918BB8E
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Mar 2025 05:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741499198; cv=none; b=ZqtzerLVz5Roc6pUVwHcfthw34LyQIPbXODi0cgomNMhPj9mXrNfBY4GvhCGXicbUkmrzzeLxQfRHvRjHn7dwaz6OKw+K0xSrKtsXGu9uiJO8F1tJEMHDr9UamrrdUu5tzK5i44SjPSzwSbTbKh38UICvpBMxJvWSJwEfksNcRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741499198; c=relaxed/simple;
	bh=81/vVwFxL0jzMog/n4d85Jse8xDYPZwtnQhVNyZfnLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Onq8Yj4vDQqzUQCWkjuO/dg8fwEC+kyG/phzTCWq2B08YAxtOjUTnmY2V8qdz/CP8w3qxXMEc33LOswZllS8V74VCXrTorrPfkHcpQmYSKwahoyR8XA7ZKSzhKMcxL0er4pk3+uVHaNu/aRzBf0mIZYZThyDbFHWTWJEDZlKIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPEvttyp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5293ptx6002001
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Mar 2025 05:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmJu0qd08g3DmrbnDHL60bg166tlYVZOyOZzOELvrUY=; b=bPEvttypITU2sbnz
	JIcS2RnAb7WUN1GaR1VXM33i2zhll4shSM+YY6W8FdSqViQdckFITAaVyNad4g4s
	3ey5/FGPKqUtTuGSSccqLRjLiZYSPZYLCVMsMl+WZfHwOz0Vl5XIJuj96GvcN20J
	XZb8Gw2OjTl8id9F4cx1f9ZS3QSNkc2yu2WUUyCWnyGiChpvdhhDdWNy+x8uLCd1
	2ltaDSoL0J3Ufo3JIfURsaCtzLaadoqsBMjsQjmOITJGHLNwLMt4hzhQsUS3BbmS
	v9xB20QmUZ2kVbhWTtqRldqHVL06VU5yoMbYeCxRy4kVRuzGUQit0b/QML+Na42L
	NH3KMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewk1pbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Mar 2025 05:46:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a96112fso97278605ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 21:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741499194; x=1742103994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmJu0qd08g3DmrbnDHL60bg166tlYVZOyOZzOELvrUY=;
        b=GnmKBF1UKCKixXKGCcVJiVmw8gkrCofKXTq0hispRBeK3MsF+r9m9A/RQ1xy5NsicO
         pEe17tLVDnzeBLfgMJy9jEUh4fsxaQ6Z1rCL8BM4VKvhO/8d2RD/P/ZXS7vcXJiSK0CP
         MNVFZFeZtdi5Zx6aNttk+x6M0JV6WmpWueeboeiVNOrTlYyknOLqn/NSHiGRwyzdA2L7
         mrJ3wos9iJ66am2z4spiq4s6PHcYFJ/1snzjJ3h6G5IGjUcVlP0dvQclopdTaXi8CRWl
         13jUmiu0ryc3ig2/RfN/BU8pLdCyc2NKNd/WcHzlHspsoM7cOhtv9ZO6KMMvAYvBJD2G
         tqAg==
X-Gm-Message-State: AOJu0YxaZdXI0qoDbiuBh+H8YWmMkVq28KKqsDtymOSU+bEk3JDu0DuQ
	FnuB++TvUkIPpyq6k/5XiRB/816uAC3hw1RR4GbJI+LEB7YiaTYtXmKgFNgTq8enmDjn3/p/9gq
	EXjhjbNR427yBuZGGgeWWtR3EZfrLxN9CdbfDIsD8Lkk5n99+It45gmVrjRK/brdF
X-Gm-Gg: ASbGncuf8DGkwEc2U3gG5tDkpFmzMXRaAQU9ZoHbiQ0h96PxjPUxjmGF2SqAOKg/lcx
	sfNRMWwYRzp6Xq3ZXkLtWBOZ6NQlBvMQ54Se8S15CKc4oWFjYEIjYFAl7dww9HZVe4N1U4f1cZt
	K6ot2YE5ymHISj87Y7dBI6aH1z4uNRTh8IaIbEshO1rTr2tDEAr+zjiwDZZ38ma9Z24dZKWMyik
	6msphHR9LJCw69ZKe/v5Aik4o6JocNDKfu+7/olWDSQqP7/v9ZXZjFc7ZP30kp/f6gqDuCNygVw
	sh/Kt7SNWgRz8R8896q3RjEmli/wd+jSNU3F9bcxVlla8eOqd70=
X-Received: by 2002:a17:902:db10:b0:224:1781:a947 with SMTP id d9443c01a7336-2242888b368mr147417025ad.21.1741499194488;
        Sat, 08 Mar 2025 21:46:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7EqKmUifl9FiLpfhqKC/uUfxlqltaoAzqT42NnpiPzcFpgEY/tC7+mzwKbOuhT/JXR1Txmg==
X-Received: by 2002:a17:902:db10:b0:224:1781:a947 with SMTP id d9443c01a7336-2242888b368mr147416695ad.21.1741499194106;
        Sat, 08 Mar 2025 21:46:34 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddbe7sm54887145ad.32.2025.03.08.21.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 21:46:33 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 09 Mar 2025 11:15:27 +0530
Subject: [PATCH v5 5/7] PCI: dwc: qcom: Switch to dwc ELBI resource mapping
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-ecam_v4-v5-5-8eff4b59790d@oss.qualcomm.com>
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
In-Reply-To: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
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
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741499159; l=1711;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=81/vVwFxL0jzMog/n4d85Jse8xDYPZwtnQhVNyZfnLc=;
 b=5Nj3POrnmw0KGBcZAiS3fq/7pcfbYlbtjwpf+jPF6NHYKQNPqP+dHtc2CB5cHGdYhEE42fYWe
 UyHf/UoRTsdBTT3x1jjF+JoBsUpnFzFcM6+/qekAiSV/7DuiWjZ87VP
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Tr8chCXh c=1 sm=1 tr=0 ts=67cd2b3b cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Ca1ysoXE74beo6poS_YdVMwMkQiz0S2m
X-Proofpoint-ORIG-GUID: Ca1ysoXE74beo6poS_YdVMwMkQiz0S2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503090043

Instead of using qcom ELBI resources mapping use dwc mapping as this
ELBI is dwc specific.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index e4d3366ead1f..258b2d615080 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -265,7 +265,6 @@ struct qcom_pcie_cfg {
 struct qcom_pcie {
 	struct dw_pcie *pci;
 	void __iomem *parf;			/* DT parf */
-	void __iomem *elbi;			/* DT elbi */
 	void __iomem *mhi;
 	union qcom_pcie_resources res;
 	struct phy *phy;
@@ -390,12 +389,13 @@ static void qcom_pcie_configure_dbi_atu_base(struct qcom_pcie *pcie)
 
 static void qcom_pcie_2_1_0_ltssm_enable(struct qcom_pcie *pcie)
 {
+	struct dw_pcie *pci = pcie->pci;
 	u32 val;
 
 	/* enable link training */
-	val = readl(pcie->elbi + ELBI_SYS_CTRL);
+	val = readl(pci->elbi_base + ELBI_SYS_CTRL);
 	val |= ELBI_SYS_CTRL_LT_ENABLE;
-	writel(val, pcie->elbi + ELBI_SYS_CTRL);
+	writel(val, pci->elbi_base + ELBI_SYS_CTRL);
 }
 
 static int qcom_pcie_get_resources_2_1_0(struct qcom_pcie *pcie)
@@ -1631,12 +1631,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		goto err_pm_runtime_put;
 	}
 
-	pcie->elbi = devm_platform_ioremap_resource_byname(pdev, "elbi");
-	if (IS_ERR(pcie->elbi)) {
-		ret = PTR_ERR(pcie->elbi);
-		goto err_pm_runtime_put;
-	}
-
 	/* MHI region is optional */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mhi");
 	if (res) {

-- 
2.34.1


