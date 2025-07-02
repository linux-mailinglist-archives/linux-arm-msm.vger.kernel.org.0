Return-Path: <linux-arm-msm+bounces-63335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC1EAF0E9A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 112D07AFEAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 08:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353F923C50C;
	Wed,  2 Jul 2025 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VI/8Es4o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5119D8A7;
	Wed,  2 Jul 2025 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446796; cv=none; b=kmfiBgv4Zdr3+hlTWdh7UYB3rYZwkh756LLoCKs5t3dacSGrwBJaiMO6yx9GvIxe8vuHzNOC0KcbwvSQpl6KmcfK+WGFAwVhnuNovoJifJp5TsCal8hlFOFh5Nbca+pROltkj3pb0rFwV/B+hSwWewgnSnPz13kmy7rTqRR9LUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446796; c=relaxed/simple;
	bh=ZfMPwivvTIsQ6PZDC7WkfPU3P75vjElgVZ/5OTKTNeE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=geBCocjeQlT23rWi+3khQEcAhX5f+78x5ceN9IHZa45Hu9fpjQAHzXcAEC6X3aKOFLujevGKax4EiNcCVg6VZCAjkIdNFn086u1Vu0PCf5O1h2wQplGvRpksYLphFA5c1s3j5Em+/rqTc1BhZyeIDPUXcbIcjP3VQihx/n5iRKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VI/8Es4o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626Yu3P032129;
	Wed, 2 Jul 2025 08:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=Pyqcy5rkgfwxs80fU3R7ymkbtZTlfvTPM2sjkOUpsdg=; b=VI
	/8Es4oRal+UPffAu2whCe5z1/J0LLB5LOiXY/lMxdMxqUE0oO+F+zf9Nxa9ppeM2
	o/M9xJY18l9TxDpPhSklZbECXIbzA2P5yzzF4GjQU3bytk4QxTaSOh4wnTeRQqHu
	yH/ibhtmLDu3DkSwfbc5oFZbUSO7Vj+7pHclj/pVhxZ04pBcwJH9tT1gSm54msZk
	cOsaWN5LsYgtJnPmNNKJH+fQMyebXNfiPJFdGXO6TWk2GZ4U//hAJl470sqnpOy0
	Hgnjq+ps9ayxT4i+O8lcKRqS2y72DoOPS4Cpqn2n+razQE9O7ToVANwLqG+8xRQb
	xdztO6WqQwGCyRXT8iNg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kc0s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:59:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5628xpWW025016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 08:59:51 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 01:59:48 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc-owner@vger.kernel.org>
Subject: [PATCH V3 0/3] Add eMMC support for qcs8300
Date: Wed, 2 Jul 2025 14:29:24 +0530
Message-ID: <20250702085927.10370-1-quic_sayalil@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6864f508 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=D0nzxQA8UOXus3ycgvcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MiBTYWx0ZWRfXz6jbC5g2NZYN
 CDOxEhLJ+zuWjOn3vgEI6pBeG6CZrb30LA96oKxcz7/VbC2hcBOs2ekW9G7D62dt4Xi9UjaK1RN
 5iUSLLwR6WODO+grNN9lY+fM3XK8ACraflWYkWTrT96JGAIWiUiqkdjYmmUYbzhPqFNQpAaAP32
 Oq9wL9DtvdVVBqu6SMpL89HuVI92H8Km6UaJZB6R+Hk8TknxEuYbTPKdni78CNzfcUsVtiueZhE
 d9zvdWen9OTOKn5+jgNXbufo2zeEJof/7LOrVrBKNwUQ9qnnPBoQMg3NwoF3Bx1jX74gTnAix0m
 lPlgLnPaD6Rq817RYEIiUObHrw3ki4LMfrB2b1CDIohH8ICKcF8v5eziF+8Z5O6jNJ0QiCJS0zB
 INfTLQ6L78iSsEPDIG8rLkm/wKwu354YBCRcMan4FYqAKs4lC2C2wEdsjPbJeKcz3WDT14jT
X-Proofpoint-ORIG-GUID: VWl9G-nFes8wLONWZeaE_YPOtX_O15JT
X-Proofpoint-GUID: VWl9G-nFes8wLONWZeaE_YPOtX_O15JT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=796 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020072

Add eMMC support for qcs8300 board.

- Changed from V2
 - splitted board and soc changes in separate commits
 - used lower case hex values as per suggestion
 - moved bias property under drive-strength for consistency as suggested

Sayali Lokhande (3):
  dt-bindings: mmc: Add sdhci compatible for qcs8300
  arm64: dts: qcom: Add eMMC support for qcs8300
  arm64: dts: qcom: qcs8300-ride: Enable SDHC1 node

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |   1 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  21 ++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 113 ++++++++++++++++++
 3 files changed, 135 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


