Return-Path: <linux-arm-msm+bounces-38754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337E59D585D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 03:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0A0EB22E84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 02:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC046166F33;
	Fri, 22 Nov 2024 02:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FMQ/GXW8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CD315FD16;
	Fri, 22 Nov 2024 02:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732242817; cv=none; b=pffLMAcZK00uBIB0IVLXAZ+oe36Y99ZDc0XEZA+S9NigH3RZZiPDXDv+jPMGes5nmP+IRuStwi3vzjvNSd9VzAt0BYR5zuvnK1UbFpNvWTV7UfLB8KGcP45ncA0kHtq0bwLtCmxfUnL9QZm5xH7bn/3nxWt5hZRgoJbdqQbaWHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732242817; c=relaxed/simple;
	bh=c64dpRYtpWi8wNoVFNYvhrFojCnU0gJsIU4VHELHvN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SDRfOL+yB1Zm89HjpAcO/AR5Cdede+sUz2FbEP2TMHM/94jr+/PlqPA8ZFME51/c96hTbgGYJBBAhQSFiPmVP/fWWEP1qsqtZ+OWQ4j3vcW43fjD5DC/1AnZAVuNt86kBlxtj16AQSFo6IIbI/zIjvtt550VDSBz192K2QMgSek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FMQ/GXW8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALN0Hpo020271;
	Fri, 22 Nov 2024 02:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BL0DHyPt29o
	WaZf7lawbWikGk1C7C2ujUXvxMykMawg=; b=FMQ/GXW80iVjEbmBZAzHnXhRwFz
	hcF4HZPmI9JGtwNfGltzUNbVZ1c/iRwv2RwhqugNAvwHo4Z7D+JTjsDNeeDsgcVK
	HZXtIRWovB/LljtBte6QjQukWLtCxSUguepfJb6KotuMQEMKgRu06lcEWvgu4j8H
	zKS802BZETCR42tQWdUaoXh/yM0Jgu0Hf4LtV3bUgQZTtUb/IPR/gyQfi5sFaf2q
	x+ZC1fDmLOOd9eyjb4emvxnev6HNsLWAjSHgIIWms3bCV8LG9/cYwYoZlfTzQR9r
	LyFr700z5yoDDrX+eipdwl545uQSnS6YjqitzwjO2nBsdpdZXO4ZvL7YwCA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431sv2ks1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:33:23 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM2XKH6014115;
	Fri, 22 Nov 2024 02:33:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 42xmfkuj8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:33:20 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AM2XKeM014106;
	Fri, 22 Nov 2024 02:33:20 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AM2XKdD014096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 02:33:20 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id 0A6EA17FC; Fri, 22 Nov 2024 10:33:19 +0800 (CST)
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com,
        lpieralisi@kernel.org, quic_qianyu@quicinc.com, conor+dt@kernel.org,
        neil.armstrong@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: [PATCH v2 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the QCS615 QMP PCIe PHY Gen3 x1
Date: Fri, 22 Nov 2024 10:33:09 +0800
Message-Id: <20241122023314.1616353-2-quic_ziyuzhan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122023314.1616353-1-quic_ziyuzhan@quicinc.com>
References: <20241122023314.1616353-1-quic_ziyuzhan@quicinc.com>
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
X-Proofpoint-GUID: iDZhjJlsY5lWgnuorgMAQBkfrfZcG1WN
X-Proofpoint-ORIG-GUID: iDZhjJlsY5lWgnuorgMAQBkfrfZcG1WN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220020

From: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Document the QMP PCIe PHY on the QCS615 platform.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 13fdf5f1beba..34d977af9263 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x4-pcie-phy
       - qcom,sc8180x-qmp-pcie-phy
@@ -167,6 +168,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs615-qmp-gen3x1-pcie-phy
               - qcom,sc8280xp-qmp-gen3x1-pcie-phy
               - qcom,sc8280xp-qmp-gen3x2-pcie-phy
               - qcom,sc8280xp-qmp-gen3x4-pcie-phy
-- 
2.34.1


