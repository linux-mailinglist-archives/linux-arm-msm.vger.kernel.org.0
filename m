Return-Path: <linux-arm-msm+bounces-38758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 578219D597D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CEE8282DA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 06:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F2815C15B;
	Fri, 22 Nov 2024 06:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P2YjtVah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAA213A268;
	Fri, 22 Nov 2024 06:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732257954; cv=none; b=Xepj4/5Cgau8vkTknzgWMLYIygR1PSwAc6LvTd7kkVdhR8c2//kEiByM3UsUthP4ijdfIAzSRdWYYCziBjlPU0L9uRj7B6M2Z5mZJNb1MWZ/LL4ZMVLRnhzzsqZEBpCj+gaabyq1nyswiZvL5dAxQTgSsgCscSALHrWshVGXM5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732257954; c=relaxed/simple;
	bh=EpTIbCLsPREPsHjLuo7lVegkp0K9eEEeP7A61OACRdY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fQnJr/SAkp1fqjmiiEFxElhiDQSzeyBJfW5HhBYo2bkahOb5xmo/ALrjb/sJmOGeYWmU2DD71W47U8nQEDy+Q1asgxdy0KfDp2OaAVrkB1sVzh2GVq7bhkrWyqCN1TkO080bSzuLMjkKfFE+VzH9dHSLmB811MiCWzdFGTB3+DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P2YjtVah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALLq70U025794;
	Fri, 22 Nov 2024 06:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tbKLAjjCAf8TU9t077o0XL
	3kurqhHGsoTh1gttK03u4=; b=P2YjtVahfk5OAjxm2Nf20bPqNAGz9nE0W/Q0F7
	dS8Bb5VRQv6pik46RenAiScj/DmG8MhH0TOaTAwCSTJ0BTuuTE1jK1u+Rt7JxbHK
	ctshmnJEv/AcOPQv4hIP9m0cz7Po/O2jQN53LxHisQsrh2c2wdBG5k5k2YBDs6QG
	YjSoMUMddzIjmRYYdrGFJ6oaO+Ene1pRWc3s45mg/C8tfAjykXfJWWLQ/6bAxqTa
	N27EDhSh3xusX/letnrRc2WOoAHLq/zXI/GYBteZhjzY6EOQSMJpIiVxzhSLETo7
	4Bk7h9OxjeejN/qBkof3v+85cyGQuI+F9PvmlGymvIGnfTCg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432d5b11tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 06:45:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM6jPBY019640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 06:45:25 GMT
Received: from liuxin-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 21 Nov 2024 22:45:19 -0800
From: Xin Liu <quic_liuxin@quicinc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <quic_jiegan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_sayalil@quicinc.com>
Subject: [PATCH v3 0/3] Enable UFS on QCS615
Date: Fri, 22 Nov 2024 14:44:25 +0800
Message-ID: <20241122064428.278752-1-quic_liuxin@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Tfkh1FnCMxjpK9blMGMDSbu6vnxeG_Sr
X-Proofpoint-ORIG-GUID: Tfkh1FnCMxjpK9blMGMDSbu6vnxeG_Sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220054

From: Sayali Lokhande <quic_sayalil@quicinc.com>

Add UFS support to the QCS615 Ride platform. The UFS host controller and
QMP UFS PHY hardware of QCS615 are derived from SM6115. Include the
relevant binding documents accordingly. Additionally, configure UFS-related
clock, power, and interconnect settings in the device tree.

This patch series depends on below patch series:
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
https://lore.kernel.org/all/20241011063112.19087-1-quic_qqzhou@quicinc.com/

Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
---
Changes in v3:
- PATCH 1/3: Adjust the order of SOB.
- PATCH 2/3：Modify some formatting issues: Wrong indentation, 
  split into one entry per line.
- Link to v2: https://lore.kernel.org/all/20241119022050.2995511-1-quic_liuxin@quicinc.com/
Changes in v2:
- PATCH 1/3: Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
- PATCH 2/3：Use an OPP table instead of freq-table-hz.And modify
  some formatting issues.
- PATCH 3/3：Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/all/20241017042300.872963-1-quic_liuxin@quicinc.com/

--- 

Xin Liu (3):
  dt-bindings: ufs: qcom: Add UFS Host Controller for QCS615
  arm64: dts: qcom: qcs615: add UFS node
  arm64: dts: qcom: qcs615-ride: Enable UFS node

 .../devicetree/bindings/ufs/qcom,ufs.yaml     |   2 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts      |  16 +++
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 114 ++++++++++++++++++
 3 files changed, 132 insertions(+)
---
base-commit: c83f0b825741bcb9d8a7be67c63f6b9045d30f5a

-- 
2.34.1


