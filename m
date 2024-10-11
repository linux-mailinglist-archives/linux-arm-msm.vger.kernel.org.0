Return-Path: <linux-arm-msm+bounces-34019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A879999CAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCC72B21E59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3121F9409;
	Fri, 11 Oct 2024 06:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CkWgeJKM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2CE11187;
	Fri, 11 Oct 2024 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628315; cv=none; b=ELx791Bx96jbTrsBbYBHoI8SQUWkUaNhgdAThg+cN9Gxw/OK00coO6ko5PZw3pop+oLJYp/XJ/1w+kkoQoZ1tOwBDLq6nSowjTfo54yT61ro8B0ho4OK91NVfT1xIOf3itS2/IdTUZwYC6BHlH1b1a6VBRwL9OSdR5euC1oyk1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628315; c=relaxed/simple;
	bh=WKdY1fZa9M8YAr7CBlHljq1eVspyy/d7XVPb/p2wMXk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sc5qCcHNlZigijJQZgX7BaEgc0foCJ9K/I8K1DFkBO+irC1WhbQX+T0y7BVessL3IWACleYe/g58G7GdbciuQp1sqFnqI+YVLZwVv6eXNL/L6/JpCzRJRzBpMpYnPurPP/jcuscglqCqssrdo1b8W3QjPGS0C0BhJUlNvp8fCiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CkWgeJKM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B38eCs022466;
	Fri, 11 Oct 2024 06:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=Y2XeuSS6LR78Et6nxPIhnXfH+15zPGknS5PniwnVoXI=; b=Ck
	WgeJKMIMK3ZQQvh+7x0W9MJlyrsoTU2SJmx9kvm4IYLGO5phxSi/RVitTwMC6vzs
	ITz5ArvjvTrbXIP2I3rsLxZ+7uF/ZohVwbrqxIM7ohuvu+0Ier0i0CE4mTWmkMU4
	2qXuHaKZ30/oLY/sObl5g66LvFZFvNKWbsIbdhBq0nOg0Tz15VHml08w5ScnbmfB
	YgFAVhs/84TKM5EPqnSgmybjn2YeoD8QgGPs9w0oltrxX0NoWM1kmrLOQ8vNhiHU
	H+FunOh/D4Rz71zAYFs8n6+ATpC8T3CqjjQpvzwNAt9VXvO0gyMhbCGHvlV3MP2J
	DcHc+kTKwuHnwNdhANDA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xptvs2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:31:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B6Vfac012869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:31:42 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 23:31:38 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <quic_gurus@quicinc.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH 0/4] Add support for APPS SMMU on QCS615
Date: Fri, 11 Oct 2024 12:01:08 +0530
Message-ID: <20241011063112.19087-1-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oBINPaFIGvfZU8i13ZqkdQm8NoNFxtrr
X-Proofpoint-GUID: oBINPaFIGvfZU8i13ZqkdQm8NoNFxtrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410110041

Enable APPS SMMU function on QCS615 platform. SMMU is required for
multiple functions including USB/UFS/Ethernet.

The reason of adding scm node:
SMMU driver probe will check qcom_scm ready or not, without scm
node, SMMU driver probe will defer, so add the scm node for SMMU
probe normally.
The dmesg log without scm node:
platform 15000000.iommu: deferred probe pending: arm-smmu: qcom_scm not ready

With the scm node, SMMU can probe normally, but scm driver still fails
to probe because of one scm bug.
The dmesg log of the scm bug:
qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4
The scm bug mentioned above is fixed:
https://lore.kernel.org/all/20241005140150.4109700-2-quic_kuldsing@quicinc.com/
But above patch to fix scm bug doesn't impact building of current patch series, this
patch series can build successfully without above patch.

Dependency:
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/

Qingqing Zhou (4):
  dt-bindings: firmware: qcom,scm: document SCM on QCS615
  dt-bindings: arm-smmu: Document Qualcomm QCS615 apps smmu
  arm64: dts: qcom: qcs615: add scm node
  arm64: dts: qcom: qcs615: add the APPS SMMU node

 .../bindings/firmware/qcom,scm.yaml           |  1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml   |  1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 81 +++++++++++++++++++
 3 files changed, 83 insertions(+)

-- 
2.17.1


