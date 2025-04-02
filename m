Return-Path: <linux-arm-msm+bounces-53021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5EA78C4A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 12:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A9B21887D0D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809C7236458;
	Wed,  2 Apr 2025 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VdWcmqMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12B2356DE;
	Wed,  2 Apr 2025 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589665; cv=none; b=pWUpy58vQ5aP1o9HzLj4I5TtF4v4TsxAN+sNzAoiD6nHqS+nUeTKlMFTnzyVqtYNvHSHuM5lfQPhtwk/F9U9E5d7e+G9M3YFueqY6GEoqG6QsqanIQLgSsIh/9EXViJlOO+Id8lujKInNeJRtyoPX5szAoOKkqqhvuIGvLxgibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589665; c=relaxed/simple;
	bh=MMD31686JfFToJn+vLrphzbOZzXUwfoQ30GKQjoszJs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fqTB+V2ItKrNA5EncUoFDXoLtLFOW6ntK/gv3LmmVjlfAxy6qlVHxk1PAf1r1LdFhpagDAIpFDxw42tRIo5OA8LPKKps3JFNSs9O5wEkkRaU9rFXjt6mUxPJmsxUTx3gx0otNaIsbs3K8QX+U9yl70mNZxnAGo7sYCgByuVJIJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VdWcmqMC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5324KK9D024541;
	Wed, 2 Apr 2025 10:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ekWlM48aZDcyqqTVRgro+i
	ciSyDz9KxTtQC6KUE5Gng=; b=VdWcmqMCqxSb0egrsgjnKy2jR1SPww2aDtQAH5
	avxXr9nxa2nVQflpqsf4LtF2ec5BiXklpAD0Ue4qyK2JgyXISicrXAGxiLn616dm
	bAQ2ZaUff8QxrcS2E6pXVkwcfDqTVqA3K4Vn0uEgmUZ+dDtBtpYorxM3NZwosOYL
	2garJbc0fVGy8FAQXAKMUMQ2M0gDpUBSBgcYdzlKZqmbkN7exy05jQWp6LJTSNcH
	yiGrNqFlioGVkNupbiHjGFFCI0hHojp6Jj9sz+HqHq21wKptSOwAQJYZ5PUXts5a
	rGF+zTLsNh0WVX7X6Ymlj0QShs7w9J6PjQnXg1/EGzB1FgUg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyv3w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 10:27:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 532AReaa015001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 10:27:40 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 2 Apr 2025 03:27:36 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v6 0/2] Add PCIe support for IPQ5424
Date: Wed, 2 Apr 2025 15:57:21 +0530
Message-ID: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xvh_P8t74Am1zoVgrzL7mYBxXCwdemHv
X-Proofpoint-ORIG-GUID: xvh_P8t74Am1zoVgrzL7mYBxXCwdemHv
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ed111c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=R4e822Z64oTJ8j4ndmEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=669
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020066

This series adds support for enabling the PCIe host devices (PCIe0,
PCIe1, PCIe2, PCIe3) found on IPQ5424 platform. The PCIe0 & PCIe1
are 1-lane Gen3 host and PCIe2 & PCIe3 are 2-lane Gen3 host.

Depends on [1]

[1] https://lore.kernel.org/linux-arm-msm/20250317100029.881286-1-quic_varada@quicinc.com/

Changes in V6:
	- dtsi
		- Drop the R-b tag because the unit address of the pcie nodes has been updated
		  to align with the dbi address.
		- Updated pcie node order based on unit address.
		- Updated the formatting of clock-names and reset-names to vertical lists in
		  all pcie phy nodes.

V5 can be found at:
https://lore.kernel.org/linux-arm-msm/20250306111610.3313495-1-quic_mmanikan@quicinc.com/

V4 can be found at:
https://lore.kernel.org/linux-arm-msm/20250213071912.2930066-1-quic_mmanikan@quicinc.com/

V3 can be found at:
https://lore.kernel.org/linux-arm-msm/20250125035920.2651972-1-quic_mmanikan@quicinc.com/

V2 can be found at:
https://lore.kernel.org/linux-arm-msm/20250115064747.3302912-1-quic_mmanikan@quicinc.com/

V1 can be found at:
https://lore.kernel.org/linux-arm-msm/20241213134950.234946-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (2):
  arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller nodes
  arm64: dts: qcom: ipq5424: Enable PCIe PHYs and controllers

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  41 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 525 +++++++++++++++++++-
 2 files changed, 561 insertions(+), 5 deletions(-)


base-commit: 7b7d0894c66154494b8295a2e73cfb5516f65756
prerequisite-patch-id: 210bd857b2a3ce208c6c66389d2845616dafae60
prerequisite-patch-id: 27a1070861e75cf1dcb03f1e440618bd77b32043
prerequisite-patch-id: 4dfad74bedd5e7b3b628ead0b23baed7de8b88f7
prerequisite-patch-id: 79ded164c537cfe947447c920602570626eddb3d
-- 
2.34.1


