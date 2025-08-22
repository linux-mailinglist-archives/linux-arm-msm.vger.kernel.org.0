Return-Path: <linux-arm-msm+bounces-70305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF93B31342
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 185B4A2588A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC742F1FC0;
	Fri, 22 Aug 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euDquhTu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641C2F0C7A
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854886; cv=none; b=S3PgvykBuI+IobClxIn0SIYZPRRBI3oJ508hxqn112T9VPhQugtdSJxWitgC8VKdBootnbj85CM/nCzZt2sdIZiJuHDyukaDRsupMd0lURG1H0UFQJSg0qbL1gC4n0dJVH6YgjuQaFfczKj58lbGQ8EorFaX+xXG0hXl5yLo05c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854886; c=relaxed/simple;
	bh=KBp6nSRvIcRzTpSQhn0xmjkXEw3wCkCaBQEeNdgizT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFBj9zGAtv7SZLY5lMPQu/v/bPHfWAo069ZTE1erdAEO4RojJfA4Tvvc48WVzn4aS+zw/zZMY3ogzg/bN411rhSQPLXqDslzz7VrmKO3OSashVwivubjbaNvJ29p6C5WWTTBd5cTBlYaQfH5a4wVsGASIgHYVWDY1H1bl0C+FXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euDquhTu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UeT5006729
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WJK4jm7RiyIMS3SdVA3437OyfLU1Kx1wG7QYMtyssFY=; b=euDquhTu/ucAegwr
	sRsjVVucPzpJLIpEPrKj5Cmra5+yQgiV3k2cEdEXD9mhMB68u2UWpsD2OyXCbm0f
	K0cZW7r7HPpybTLSUqq/5r8AFB/XqQnXXsBri3Ml1e63Me95hHnd6R7mI26v3enn
	bddoGtm4FUEJSKA/X9zYaoaUUIfKdXZOIWE8/NwySqdjlZTnWRwJYrd0Tza90ty0
	rqHGeK3SlN+SEC0qM2rIqk7Yi4FCl27WQVVsSGPFoTzeD7oTeyxnXpl2XeRCq8QQ
	Jh/A08EEPw/3cQslEEgsmq0cAqsaJi0cF24IuCge8bDo5sXEy3Fop+HscwxEyBH3
	fv68oA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52drkf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:28:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4716f9dad2so3199243a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854882; x=1756459682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJK4jm7RiyIMS3SdVA3437OyfLU1Kx1wG7QYMtyssFY=;
        b=QXh5aJC9OSxYDVZFhSBkb1L+CLxrnBYYdOjc3LPHd7zffecnA9ycF9hXajjfqFfVIO
         a9wSRQuxeUxvm7sdtK9FmXg/idcBLM/dRzU8Q+2Y2TLpyXMd/vtqEbAXfp76MGkWoGWr
         tfk1aNC8g1w/WyXQDadOZp0X3I59/F4SW88TgC++Vmo/ySNoDi03+64OmmjNcoCtD8+l
         FkhgwRvjP1QHR3Axq/6hfFNt0HFDlWDFVtQM2ZDsGRqjnXDxDfbIAstltvpJIjLsB9cD
         9FhhOWQhy5EHl9CUJkrV9W/y2uMiYepfRZljKnyMRuZrvugsKb6FD1/FgjUOLw6Y7Toj
         RTHA==
X-Gm-Message-State: AOJu0YwAIMSp/tu+vr8aW7dJn1f/tEOhNvCFBhsNSXRaHTGXBpuGiNAr
	UZLAcgIg08BBdbtcU5/hFOpdf06h3RTfOaawA9OnI2W7IDE0zhI+05pnRS1W+g6BmuPRI9A4/u6
	8jZ+5VRJapUUusoTPTlOG+FPmeDV3u4aUceuhRsrm+AjULO42VMrUNcj+aCjpeVzfo+o9
X-Gm-Gg: ASbGnctqwGfNUgXPzmmY1WI6/G9M0f6VP2kNZf55lI6R3ZVLWaS0YY9eIa/0En8+Gsi
	nIGvOo0ky4VdGq1SRw6RHoZzXBGwio/9IkT1ExI7KIrKKW2f4UKtzGthcbEChEpPOoUrrL7/idv
	RuOb4KrpZO+twBmOkVU4/QT7n0chaK0GL4xQ56uERD1w6+XUl82Nai+E3sXUcnK8wTRj18embVV
	b50jVda38gTo+7IsW9G9vS+J0Na/9sJ/YJvPm8rpjQ765nPrO+4AK3wOSRnafT694FsZdbYspwn
	bCRhIrIPrP3AxkBjWJB3xjhLdlSB4jDJjb0+RCw8K0UX4Tj3Hx5WS2jj44rENT35I558eZzmP0k
	=
X-Received: by 2002:a05:6a20:3d87:b0:243:25b0:2324 with SMTP id adf61e73a8af0-24340e6c885mr3572765637.50.1755854882138;
        Fri, 22 Aug 2025 02:28:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErgeNlZZ3m9zZEU4DFuk4AWE8QrCvzoihF9b2xvmNf1xFNoCh3S8xIrxIN7DbWrNSGU4njQQ==
X-Received: by 2002:a05:6a20:3d87:b0:243:25b0:2324 with SMTP id adf61e73a8af0-24340e6c885mr3572721637.50.1755854881669;
        Fri, 22 Aug 2025 02:28:01 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32525205d1csm549417a91.4.2025.08.22.02.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:28:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 14:57:31 +0530
Subject: [PATCH v7 3/5] PCI: dwc: qcom: Switch to dwc ELBI resource mapping
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-ecam_v4-v7-3-098fb4ca77c1@oss.qualcomm.com>
References: <20250822-ecam_v4-v7-0-098fb4ca77c1@oss.qualcomm.com>
In-Reply-To: <20250822-ecam_v4-v7-0-098fb4ca77c1@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755854858; l=1995;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=KBp6nSRvIcRzTpSQhn0xmjkXEw3wCkCaBQEeNdgizT0=;
 b=FxAcYjubv2407Ih8C9wrp9VHcvr+HHvpAVCt3J0qt5lQ+3kXOTeXaZHvFSccVZCwsgGp0S/YA
 VKNYdLGH3MtCpsND0xyAgf0RvbF72ImpVk1pjGGfo4rgRjrugdLCbRS
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+7G7CFLcMK/9
 DT63ZwxlxN1o9mWWF0QLK/yastARrqCX3HAI02aklcwx9RavhLIfg2OuDd3rowaymiwtIj5itEw
 9hhEK907zyvkulw87ern33a9kdAUBnYq7a+sb1OrFiu6mDtOXbgtl647f7y1oNyFQAFFSiNLG5f
 KywIfwkkO70G35F0GtARvMPKY1KEAQsZOYBQxwumAkIV5uQVkjhEIhfHDwZYww0dKkdoejzcfDa
 AHBLe3IAgm2y16GjjI8eMoin///SrJdOJxGeJfZ8O+zIR3GtnHEWZGMa1s0Unmk2jbudwmVNOli
 kox2ZtCvHNMRf9IXw4PuQ3EIIkxCEGOBa4eZiagRTdlNdQ4j2ATkZ8DzYCdq7ePSdgIqSkOMNN0
 LspcinZvNoaYBtmxofQvtAx42+0YDA==
X-Proofpoint-ORIG-GUID: aJnaqW5HIU2UBiE3e0vX57MWOiDcxILv
X-Proofpoint-GUID: aJnaqW5HIU2UBiE3e0vX57MWOiDcxILv
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a83823 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Instead of using qcom ELBI resources mapping let the DWC core map it
ELBI is DWC specific.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..5092752de23866ef95036bb3f8fae9bb06e8ea1e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -276,7 +276,6 @@ struct qcom_pcie_port {
 struct qcom_pcie {
 	struct dw_pcie *pci;
 	void __iomem *parf;			/* DT parf */
-	void __iomem *elbi;			/* DT elbi */
 	void __iomem *mhi;
 	union qcom_pcie_resources res;
 	struct phy *phy;
@@ -414,12 +413,17 @@ static void qcom_pcie_configure_dbi_atu_base(struct qcom_pcie *pcie)
 
 static void qcom_pcie_2_1_0_ltssm_enable(struct qcom_pcie *pcie)
 {
+	struct dw_pcie *pci = pcie->pci;
 	u32 val;
 
+	if (!pci->elbi_base) {
+		dev_err(pci->dev, "ELBI is not present\n");
+		return;
+	}
 	/* enable link training */
-	val = readl(pcie->elbi + ELBI_SYS_CTRL);
+	val = readl(pci->elbi_base + ELBI_SYS_CTRL);
 	val |= ELBI_SYS_CTRL_LT_ENABLE;
-	writel(val, pcie->elbi + ELBI_SYS_CTRL);
+	writel(val, pci->elbi_base + ELBI_SYS_CTRL);
 }
 
 static int qcom_pcie_get_resources_2_1_0(struct qcom_pcie *pcie)
@@ -1861,12 +1865,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
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


