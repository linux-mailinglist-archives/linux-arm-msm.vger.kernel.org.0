Return-Path: <linux-arm-msm+bounces-34397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE699E0A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 10:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C8931C21EA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 08:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E681C9B81;
	Tue, 15 Oct 2024 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U0N60SUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581011C7617;
	Tue, 15 Oct 2024 08:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728980197; cv=none; b=Ydr8BbM6vlD2o3ybegjpEJDsvvaJHSsZRweEE3CBcNweV56yLuEkdgOLyfwfehhS7xpLFgao60nbaky+9yqYx+41PyFol2fkpGAViz2j4cq5BwtfBfzX5a2uxihug0rjxD11jXcHBWrxTAbO1nKyTkgXRvXGe/kLbHNOTvbXHaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728980197; c=relaxed/simple;
	bh=dTBx89CrN28r6BhWLTutFCsiCaXmzQGGx8LoLYKVUBU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B6m985dDhIHmQAV+NzpoilOUH5nHuB6NTg/YBKPgB2Cq1C6jSGcJ9ifkBb/83jh2+wdwS05/RPmLSxI2IMOY3l2rWVJZOb2H4daH/YtIlMml1gC5WBlngN2j2r9IkVPazTJ+hjbyKYAYdQCIK+i32hWVUhJTjE6awLMhB+bG1mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U0N60SUt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F1UIMc019156;
	Tue, 15 Oct 2024 08:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=ljwquIIH+aARtWboUpPEeCCRYNHZTbnu0I5DzBvD83k=; b=U0
	N60SUt5u8Ge5v0hTfKbXqsNW1ZFsuAJ052cU1dLgdy7WqvAS4iEKw+uzMsBfjhbU
	dda7T1fap9c6z/F7Wo7W2aTdGDQtIAWME8iDTZSw2iXAn0xdc2Sm1LujlF83LLnP
	jqijhc4f892xcD0RSLCrb840jSkFH0rB0VFKqzI1YhpiigtFmfXKa9BNaKt+DG6B
	skQm4Zn0M5e629kz1zzYXyt4j9dVCQ/wEBKobCDm8HBu5jO1JzNlt7U5TzUVsKRP
	ej/fVFnXmbmgtACwxKEig2co5SVWD9YuTxsfPD0vSDVj1OAm0a1C5RwoqjIsTnCS
	n0cx7pSbVDYvfkUZHXHQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g2rpwcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 08:16:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49F8GNqF005566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 08:16:23 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 01:16:20 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH v2 0/4] Add support for APPS SMMU on QCS615
Date: Tue, 15 Oct 2024 13:45:59 +0530
Message-ID: <20241015081603.30643-1-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RggG4Y5ymahbTU_F1-mYrMIHrOJJO8lL
X-Proofpoint-GUID: RggG4Y5ymahbTU_F1-mYrMIHrOJJO8lL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150055

Enable APPS SMMU function on QCS615 platform. APPS SMMU is required
for address translation in devices including Ethernet/UFS/USB and
so on.

Add the SCM node for SMMU probing normally. SMMU driver probe will
check qcom_scm ready or not, without SCM node, SMMU driver probe will
defer.
The dmesg log without SCM node:
platform 15000000.iommu: deferred probe pending: arm-smmu: qcom_scm not ready

With the SCM node, SMMU can probe normally, but SCM driver still fails
to probe because of one SCM bug:
qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4
The above SCM bug is fixed by:
https://lore.kernel.org/all/20241005140150.4109700-2-quic_kuldsing@quicinc.com/
But above patch doesn't impact building of current patch series, this patch
series can build successfully without above patch.

Dependency:
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/

Changes in v2:
- Address the comments on bindings from Krzysztof.
- Improve the commit messages and cover letter.
- Link to v1: https://lore.kernel.org/all/20241011063112.19087-1-quic_qqzhou@quicinc.com/

Qingqing Zhou (4):
  dt-bindings: firmware: qcom,scm: document QCS615 SCM
  dt-bindings: arm-smmu: document QCS615 APPS SMMU
  arm64: dts: qcom: qcs615: add the SCM node
  arm64: dts: qcom: qcs615: add the APPS SMMU node

 .../bindings/firmware/qcom,scm.yaml           |  1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml   |  2 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 81 +++++++++++++++++++
 3 files changed, 84 insertions(+)


base-commit: 0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
prerequisite-patch-id: 3a76212d3a3e930d771312ff9349f87aee5c55d5
prerequisite-patch-id: 8a2454d5e07e56a6dd03f762f498051065635d85
prerequisite-patch-id: 46cdc5640598b60d2f5449af444d6d4e479c00b8
prerequisite-patch-id: 050d1dd8cc9397618e570e6de2d81d0c32c10d7a
prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
prerequisite-patch-id: f9680e3c90d8f05babbcadd7b7f5174f484a8275
prerequisite-patch-id: 760a2b8f2acff7a9683bfe8f2d353f7caa6e5580
prerequisite-patch-id: 54b4dd987711302b083f714c6f230726c7781042
prerequisite-patch-id: 624720e543d7857e46d3ee49b8cea413772deb4c
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: ab88a42ec69ad90e8509c9c5b7c6bdd595a7f783
prerequisite-patch-id: 918724fafe43acaa4c4b980bfabe36e9c3212cd1
prerequisite-patch-id: 3bae513ca3da06d6f175502924a1fec6f9424def
prerequisite-patch-id: 57afeee80c9aa069ee243f5a5b634702867d20f1
-- 
2.17.1


