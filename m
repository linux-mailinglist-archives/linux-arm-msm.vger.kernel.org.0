Return-Path: <linux-arm-msm+bounces-32867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D8598BB7C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 13:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F0191F21FCA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 11:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2931C1755;
	Tue,  1 Oct 2024 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KN9/McUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9191BFE17;
	Tue,  1 Oct 2024 11:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783187; cv=none; b=kdZ8qryWj0Sk4ZrRaqpqDOCDrAoN3k6P/1ToGIpOTI6G84k3Zyw1cRL8lBiJ1cwWnO5JFB3mFBRLA2vuLl7AF56Zd2Avw698PtZXoLlJZYl5DaLWToEPZM4El6/LOB5qRndkbB6lSNLrAtAVqBs2fvExhMbOjOE1KUT6WTh8lqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783187; c=relaxed/simple;
	bh=MKp9MybjaKt+ChDp32agarYcn8lcUUJGtM/3IwLd+kk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KZrgAe+jI3TisHGlbEW+UboltztpQ/zcIkwGhj5wlvT3LCWzlg0yctdfCSCFy5CbhCJEVOX5Y1CwlnuIEUjjNF2trlQgHhP6WOzwNL+lPTuzcpfUy68KLxU72CGWfMXep67sTEExkH21gfuyVY0wWBxXgh5KBI8JCrK975JTeQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KN9/McUC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4919WEZA020957;
	Tue, 1 Oct 2024 11:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6cquo9XUu/hDzEMkMA+ljmjs4/S5xgCN8/t
	xNPl1QiU=; b=KN9/McUCV9xj7A63AcP7zrie/rAuY8lP3ZAy2zzPiZSiJ+nQHsV
	zv18ZsR6m42j8kjX5D2QGFHqfIqMxtnZOOutUR2hyyy19D1C0jF2iJ6ruvDtK9EU
	KIhKlpMvPC7CRSLUi/fZOkWm4x1bCdaWmRfpcfLTsipz8vIfkhNvHjT3QCwZG0LB
	b7dfEZ6JsK9Dov0oBMOeTwSE10ZYby5xH70StGlwmltvAkmwjMLcUcRswDde9SHZ
	4ZpzjWYyGh/HdzLtM3OxBz1CLrlCALicERRxMp3O6jzA3nkzDc+HCIxHMoema7Ue
	oGJfVPloyhs5imQIE0OF3DhYkBGdCon3sig==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9cyg3mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 11:46:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 491BkHIM012257;
	Tue, 1 Oct 2024 11:46:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41xavm1y9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 11:46:17 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 491BkHEa012251;
	Tue, 1 Oct 2024 11:46:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-skananth-hyd.qualcomm.com [10.213.96.172])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 491BkGk2012249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 11:46:17 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 432606)
	id 04791AC4; Tue,  1 Oct 2024 17:16:16 +0530 (+0530)
From: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
To: andersson@kernel.org, krzk+dt@kernel.org
Cc: quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
        Subramanian Ananthanarayanan <quic_skananth@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] arm64: dts: qcom: sa8775p: Update iommu-map entry
Date: Tue,  1 Oct 2024 17:16:01 +0530
Message-Id: <20241001114601.1097618-1-quic_skananth@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: h4FMDv2HdbKBnsYPsJA4tikoIxhBj337
X-Proofpoint-ORIG-GUID: h4FMDv2HdbKBnsYPsJA4tikoIxhBj337
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=973 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010075

SA8775P has only support for SMMU v2, due to this PCIe has limited
SID entries to enable dynamic IOMMU mapping in the driver, hence
we are updating static entries.

iommu-map entries are added to support more PCIe device like switch
attach, SRIOV capable devices.

Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 0c1b21def4b6..05c9f572ae42 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -675,6 +675,37 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
+	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
+		    <0x100 &pcie_smmu 0x0001 0x1>,
+		    <0x101 &pcie_smmu 0x0002 0x1>,
+		    <0x208 &pcie_smmu 0x0003 0x1>,
+		    <0x210 &pcie_smmu 0x0004 0x1>,
+		    <0x218 &pcie_smmu 0x0005 0x1>,
+		    <0x280 &pcie_smmu 0x0006 0x1>,
+		    <0x281 &pcie_smmu 0x0007 0x1>,
+		    <0x282 &pcie_smmu 0x0008 0x1>,
+		    <0x283 &pcie_smmu 0x0009 0x1>,
+		    <0x284 &pcie_smmu 0x000a 0x1>,
+		    <0x285 &pcie_smmu 0x000b 0x1>,
+		    <0x286 &pcie_smmu 0x000c 0x1>,
+		    <0x287 &pcie_smmu 0x000d 0x1>,
+		    <0x288 &pcie_smmu 0x000e 0x1>,
+		    <0x289 &pcie_smmu 0x000f 0x1>,
+		    <0x28a &pcie_smmu 0x0010 0x1>,
+		    <0x28b &pcie_smmu 0x0011 0x1>,
+		    <0x28c &pcie_smmu 0x0012 0x1>,
+		    <0x28d &pcie_smmu 0x0013 0x1>,
+		    <0x28e &pcie_smmu 0x0014 0x1>,
+		    <0x28f &pcie_smmu 0x0015 0x1>,
+		    <0x290 &pcie_smmu 0x0016 0x1>,
+		    <0x291 &pcie_smmu 0x0017 0x1>,
+		    <0x292 &pcie_smmu 0x0018 0x1>,
+		    <0x293 &pcie_smmu 0x0019 0x1>,
+		    <0x300 &pcie_smmu 0x001a 0x1>,
+		    <0x400 &pcie_smmu 0x001b 0x1>,
+		    <0x500 &pcie_smmu 0x001c 0x1>,
+		    <0x501 &pcie_smmu 0x001d 0x1>;
+
 	status = "okay";
 };
 
@@ -685,6 +716,37 @@ &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
+	iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
+		    <0x100 &pcie_smmu 0x0081 0x1>,
+		    <0x101 &pcie_smmu 0x0082 0x1>,
+		    <0x208 &pcie_smmu 0x0083 0x1>,
+		    <0x210 &pcie_smmu 0x0084 0x1>,
+		    <0x218 &pcie_smmu 0x0085 0x1>,
+		    <0x280 &pcie_smmu 0x0086 0x1>,
+		    <0x281 &pcie_smmu 0x0087 0x1>,
+		    <0x282 &pcie_smmu 0x0088 0x1>,
+		    <0x283 &pcie_smmu 0x0089 0x1>,
+		    <0x284 &pcie_smmu 0x008a 0x1>,
+		    <0x285 &pcie_smmu 0x008b 0x1>,
+		    <0x286 &pcie_smmu 0x008c 0x1>,
+		    <0x287 &pcie_smmu 0x008d 0x1>,
+		    <0x288 &pcie_smmu 0x008e 0x1>,
+		    <0x289 &pcie_smmu 0x008f 0x1>,
+		    <0x28a &pcie_smmu 0x0090 0x1>,
+		    <0x28b &pcie_smmu 0x0091 0x1>,
+		    <0x28c &pcie_smmu 0x0092 0x1>,
+		    <0x28d &pcie_smmu 0x0093 0x1>,
+		    <0x28e &pcie_smmu 0x0094 0x1>,
+		    <0x28f &pcie_smmu 0x0095 0x1>,
+		    <0x290 &pcie_smmu 0x0096 0x1>,
+		    <0x291 &pcie_smmu 0x0097 0x1>,
+		    <0x292 &pcie_smmu 0x0098 0x1>,
+		    <0x29d &pcie_smmu 0x0099 0x1>,
+		    <0x300 &pcie_smmu 0x009a 0x1>,
+		    <0x400 &pcie_smmu 0x009b 0x1>,
+		    <0x500 &pcie_smmu 0x009c 0x1>,
+		    <0x501 &pcie_smmu 0x009d 0x1>;
+
 	status = "okay";
 };
 
-- 
2.34.1


