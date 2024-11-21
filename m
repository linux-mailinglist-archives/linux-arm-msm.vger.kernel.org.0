Return-Path: <linux-arm-msm+bounces-38614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 593AB9D4792
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFA8FB23630
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA921C9EAB;
	Thu, 21 Nov 2024 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n9F+NuID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AED1C9DDC;
	Thu, 21 Nov 2024 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732170625; cv=none; b=BgWojxiaNtaVS0AwtkTqiCo3XH/u3YSglXDrxnDRqn9szNw2hAg8qJ0FpU2ligiokHyRTg2WO76UeYGQeRtSe1Me6iHzmNbm/iFnTTEeKgHqwxuoEyW6AG8Lj2Y+c8OCCxV6ZLrlWJ5KH5N6usSjeMwoBpWNVi8AKITMzg/CivY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732170625; c=relaxed/simple;
	bh=z6fFWzhDpNqAPzKCS4TiQRM9pBYl3xfMHLL6kHPXYWU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L9hVuVAVeHorhjXG4Lcn9Ox6Y4hcRpC57t/NNi+tOQ6Z0nadS72kmsRXY0+CCF4NjUgLDrhuGNp2vm7jSIvDpr04prx7OPj2xToruDJ1QjZXDWM53g7Jd0uN+Es+Gm9/TcoGrLvFcugx9hWMXolIB7KPNkeA4vpU0fqsxvoyMCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n9F+NuID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKNS1hQ026218;
	Thu, 21 Nov 2024 06:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SmltEeGIRNg20s3Pj2fsMs
	yUmQnaAi93rdEn8zKKg04=; b=n9F+NuIDS8ukd6j7KF7Wuf5AScNLjOEKH8S+f+
	xJb0F7TpI8/87YtSMpJ6iVpBCM/uX8BU1+OsF8H18unGibgI3i/l/+vAh+tmuVGu
	G8ALFH/MCZqr6fzjI/lVL8SItoe7Xvp2PTYuP+YW/ZzhQAXeLBPYhf9HaOrEuRt1
	zbgDu6/jOFSVYSdu/YS/qcaaXwoTAdek2GJQF+DixEMajkUbAGuesYSgcDLSwkbs
	bmaOVFZJG0njf4jvmyVIEE1zB4a2mBnECkXXnzpUob8IFI9jgBpaxh53MwFFfNnU
	VNs4zh5O6jOZkkiR0haKEq1nu0C8C6hRdL5HtHSqiyoqWLrQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ebyakxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:30:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL6UKsC016740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:30:20 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 22:30:16 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v2 0/2] Add DT Support for primary USB on QCS615
Date: Thu, 21 Nov 2024 12:00:05 +0530
Message-ID: <20241121063007.2737908-1-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1wNnNHXZ7JxAl4Je6NMrDysb9-2qPDtl
X-Proofpoint-ORIG-GUID: 1wNnNHXZ7JxAl4Je6NMrDysb9-2qPDtl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=707
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210048

QCS615 has two USB controllers. Adding primary USB controller support
in this series. Both the HS Phys are QUSB2 ones. Although the HS PHY
is a QUSB2, it still uses DP/DM interrupts for wakeup instead of QUSB2.

The primary port has been enabled in peripheral mode as it is intended
for debugging purposes.

Second port changes will be sent as a separate series.

Dependencies:

Link to bindings and driver changes (Reviewed):
https://lore.kernel.org/all/20241017130701.3301785-1-quic_kriskura@quicinc.com/

The phy bindings are merged in Linux Next. The DWC3 bindings are reviewed
but not merged yet. So without it checkpatch gives an error of un-documented
bindings.

Base DT:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/

APPS SMMU:
https://lore.kernel.org/all/20241105032107.9552-1-quic_qqzhou@quicinc.com/

Link to v1:
https://lore.kernel.org/all/20241119052854.995691-1-quic_kriskura@quicinc.com/

Changes in v2:
Modified "0" dec to "0x0" hex in reg property.
Modified L2A reg to L12A reg for HS PHY on ride platform.

Krishna Kurapati (2):
  arm64: dts: qcom: Add support for usb node on QCS615
  arm64: dts: qcom: Enable Primary USB controller on QCS615 Ride

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  23 +++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 110 +++++++++++++++++++++++
 2 files changed, 133 insertions(+)

-- 
2.34.1


