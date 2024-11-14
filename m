Return-Path: <linux-arm-msm+bounces-37889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAD29C868E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 10:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F58FB26342
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 09:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB001F7566;
	Thu, 14 Nov 2024 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kk50ULq4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354E814EC47;
	Thu, 14 Nov 2024 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731578068; cv=none; b=C1fJkwq8t2la1aC1+9nIW05Ve6ZFRXMWQEt2EPRJKC+RGVxDFTDcNlu2PNr+0kbP9fZ1OhLmSWsZwZF++DqBNcseK8VhnMpTwXxiKyaOe8IIsPHavwooChOSYuqFe4+f6prlgan/sgj+o0NVwYZD8Xh3fJkRLT8Go/PMGL3Oi1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731578068; c=relaxed/simple;
	bh=JQy1CnVIFG+OnptiIk+nUdujg/HpcdwiN0fyYGhw2QM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XICxLw0vMwCCdSH15AzvGwW3fqZ47Wb6FcdF95wzK2/qVhP/SEDfp1QyEozfohRoVImvBU5fcS2fAoGUDJLxh89eX61lHSobZo2GhiVcfPm2hx8rfltk7dvo60/Y2ZN/Uu64qHd4oBj++drFzS/wJluzplJ9yyEDrcJSUpGa5BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kk50ULq4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE9orXd021648;
	Thu, 14 Nov 2024 09:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pYnMBnch3IP
	J5YEpDGDL8n5hSyyeREk8LUQe2bC583k=; b=kk50ULq45O4dNTQlg+bKLGhRuYu
	pFodgSuhjPN0US451JQdyaauQhz0Ob/WmkdfA30JfKtXK4G2ESIwGWF4CoVDKLRz
	I6z2qnS3eLApF1jWXpibGo1er5vI4udChqQmHdZ0BWJNufROSpai/cN0Q+CL9umZ
	BnGnNtWX7bJ79B0tdDiPhQky3CtbrQafOFvxU5kfOQIu8CuXpLym1pCUgqLJLoG7
	R+ru7tLUkb6ZfTS5fT+lZop1dfj3BUTvrrbgT2C8tElua9X9ICeMVQgjVcUFc0dj
	ky8gyOQ8mRC7a4DJz5abfwAoKSeyYWGBwzFHeekUaGBmJ59AxvW/BMFLW6w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wex8r0fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 09:54:17 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE9sFAH001460;
	Thu, 14 Nov 2024 09:54:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 42t0tkr030-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 09:54:15 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AE9sE38001453;
	Thu, 14 Nov 2024 09:54:14 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4AE9sEce001451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 09:54:14 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id 1F1C316D5; Thu, 14 Nov 2024 17:54:13 +0800 (CST)
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com,
        lpieralisi@kernel.org, quic_qianyu@quicinc.com, conor+dt@kernel.org,
        neil.armstrong@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: quic_shashim@quicinc.com, quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: [PATCH 3/5] dt-bindings: PCI: qcom,pcie-sa8775p: document qcs8300
Date: Thu, 14 Nov 2024 17:54:07 +0800
Message-Id: <20241114095409.2682558-4-quic_ziyuzhan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114095409.2682558-1-quic_ziyuzhan@quicinc.com>
References: <20241114095409.2682558-1-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: If8mjvIxJ_lvNsb_gsMGdQ-rtkbXf4-a
X-Proofpoint-ORIG-GUID: If8mjvIxJ_lvNsb_gsMGdQ-rtkbXf4-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140076

Add compatible for qcs8300 platform.

Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
 .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
index efde49d1bef8..19e3ee1b380d 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
@@ -16,7 +16,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,pcie-sa8775p
+    oneOf:
+      - const: qcom,pcie-sa8775p
+      - items:
+          - enum:
+              - qcom,pcie-qcs8300
+          - const: qcom,pcie-sa8775p
 
   reg:
     minItems: 6
-- 
2.34.1


