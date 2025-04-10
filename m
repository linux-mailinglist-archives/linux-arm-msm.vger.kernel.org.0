Return-Path: <linux-arm-msm+bounces-53832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE8A84590
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 16:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 212831B8716B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 14:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A913B1BEF77;
	Thu, 10 Apr 2025 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ODern9Br"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23CB801;
	Thu, 10 Apr 2025 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293648; cv=none; b=t3ZY3abCRVXFLmgVVwZxYeTgg9/ZlqKgnioQEGlLukV7BTgEPhEO5nuxILu1O4KycraU2yb5QUpGl0WkX75rW1OHUeMwghqiO3vN52lBYCPqD/MLf9yDp99sHE+3VALYTzjSUSwQR1oxEy2HjBgDuJy7iOdYA0Nu4f0iS79RN/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293648; c=relaxed/simple;
	bh=W+WgS68tacQ2OOYGbH65tsn+2Il+TbQmmLt5Q2DatuI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mu9seD9HCEO9AHWdzY64W8t25SYC/zTXUDLQk3V05ZTVkgTooltDAE6dy8ho3tqKKKVIs35Qse5YhonJ8vN4rWkpNTlznSececfHf2igs0f8M2NcBu7URQbVVcvk2UzgpNZ1lsIJGe+5XWpzMTlpYxdmq1Y/MWg462+4E9MZLTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ODern9Br; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75L2M016309;
	Thu, 10 Apr 2025 14:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QAzZilIOo/nkirZiVXV9d/
	/8+WxtagrdnImQXYPToZw=; b=ODern9BrG5lchfIWq9tFfImA4nYxchOsWIyICE
	D/bZMCn/fsqalRrtTnDfyBPH/+R3zq0JHvIbeFNliB8vP4p7+BbuSl0AhTH7HSYt
	7veqUro85oZfgtLST6tgkjAM96Jh1Zwa18u9vNWlfVjtLGiDEM/o/ykwg+9JmUYT
	gWBGBVj9txm6CxfGX0S3gqTadKEPKGX9RRYRrCh2n4u1AHTnbt1J/WcHx7JumIVm
	sWSJ7A1/Zmqs6UCiQ9yL2nRdJRqR5NHqTXK8YGTWycrm8gvGix8Kh0CeOInLkYL8
	Lxdyo7foEjQd+y+8z4Pd7y5w+rarZgC0bYo7GHIoAgXEzatA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1pyhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:00:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53AE0ZTs030087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 14:00:35 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Apr 2025 07:00:31 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
        <rui.zhang@intel.com>, <lukasz.luba@arm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        <quic_gkohli@quicinc.com>
Subject: [PATCH v1 0/2] Enable TSENS and thermal zone for QCS615 SoC
Date: Thu, 10 Apr 2025 19:30:17 +0530
Message-ID: <cover.1744292503.git.quic_gkohli@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TDMIPnDFluIMCwplEJGsEuaIlnMhKyFc
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f7cf04 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=4mZqo6zMBS7fLbI5uYcA:9
X-Proofpoint-GUID: TDMIPnDFluIMCwplEJGsEuaIlnMhKyFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=782 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100101

Adding compatible string in TSENS dt-bindings, device node
for TSENS controller and Thermal zone support.

Gaurav Kohli (2):
  dt-bindings: thermal: tsens: Add QCS615 compatible
  arm64: dts: qcom: Enable tsens and thermal for QCS615 SoC

 .../bindings/thermal/qcom-tsens.yaml          |   1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 281 ++++++++++++++++++
 2 files changed, 282 insertions(+)

-- 
2.34.1


